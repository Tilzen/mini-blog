defmodule MiniBlogWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias MiniBlogWeb.Schema.Types

  import_types Types.UserType
  import_types Types.SessionType
end
