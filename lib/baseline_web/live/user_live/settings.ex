defmodule BaselineWeb.UserLive.Settings do
  use BaselineWeb, :live_view

  alias Baseline.Accounts
  alias Baseline.Accounts.User

  alias Baseline.Uploaders.Avatar



  @extension_whitelist ~w(.jpg .jpeg .png)


  @impl true
  def  mount(_params, session, socket) do
    socket =  assign_defaults(session, socket)
    changeset = Accounts.change_user(socket.assigns.current_user)

    settings_path = Routes.live_path(socket, __MODULE__)
    pass_settings_path = Routes.live_path(socket, BaselineWeb.UserLive.PassSettings)

    {:ok,
      socket
      |> assign(changeset: changeset)
      |> assign(page_title: "Edit Profile")
      |> assign(settings_path: settings_path, pass_settings_path: pass_settings_path)
      |> allow_upload(:avatar_url,
                        accept: @extension_whitelist,
                        max_file_size: 9_000_000,
                        progress: &handle_progress/3,#Function that will handle automatic uploads
                        auto_upload: true)}

    end



  def handle_event("upload avatar", _params, socket) do

    {:noreply, socket}
  end



  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      socket.assigns.current_user
      |> Accounts.change_user(user_params)
      |> Map.put(:action, :validate)

    {:noreply, socket |> assign(changeset: changeset)}
  end

  @impl true
  def handle_event("save", %{"user" => user_params}, socket) do
    case Accounts.update_user(socket.assigns.current_user, user_params) do
      {:ok, _user} ->
        {:noreply,
          socket
          |> put_flash(:info, "User updated successfully")
          |> push_redirect(to: Routes.live_path(socket, BaselineWeb.UserLive.Settings))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  # to handle the image upload
  defp handle_progress(:avatar_url, entry, socket) do
    # If file is already uploaded to tmp folder
      if entry.done? do
        avatar_url = Avatar.get_avatar_url(socket, entry)
        user_params = %{"avatar_url" => avatar_url}
        case Accounts.update_user(socket.assigns.current_user, user_params) do
          {:ok, _user} ->
            Avatar.update(socket, socket.assigns.current_user.avatar_url, entry)
              # Update the current user and assign it back to the socket to update the header nav thumbnail
            current_user = Accounts.get_user!(socket.assigns.current_user.id)
            {:noreply,
              socket
              |> put_flash(:info, "Avatar updated successfully")
              |> assign(current_user: current_user)}
          {:error, %Ecto.Changeset{} = changeset} ->
            {:noreply, assign(socket, :changeset, changeset)}
        end
      else
        {:noreply, socket}
      end
    end

end
