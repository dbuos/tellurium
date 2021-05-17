defmodule DomainEvent do

  @invalid_msg "Invalid nil values in DomainEvent constructor!"

  defstruct [
    :name,
    :eventId,
    :data
  ]


  def new(name, data) do
    new_p(name, data, NameGenerator.message_id())
  end

  def new(name, data, message_id) do
    new_p(name, data, message_id)
  end

  defp new_p(nil, _, _), do: raise @invalid_msg
  defp new_p(_, nil, _), do: raise @invalid_msg
  defp new_p(_, _, nil), do: raise @invalid_msg
  defp new_p(name, data, message_id) do
    %__MODULE__{
      name: name,
      data: data,
      eventId: message_id
    }
  end



end
