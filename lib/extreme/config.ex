defmodule Commanded.EventStore.Adapters.Extreme.Config do
  def event_store_settings do
    Application.get_env(:extreme, :event_store) || raise ArgumentError, "expects :extreme to be configured in environment"
  end

  def stream_prefix do
    prefix = Application.get_env(:commanded_extreme_adapter, :stream_prefix) || raise ArgumentError, "expects :stream_prefix to be configured in environment"

    case String.contains?(prefix, "-") do
      true -> raise ArgumentError, ":stream_prefix cannot contain a dash (\"-\")"
      false -> prefix
    end
  end
end
