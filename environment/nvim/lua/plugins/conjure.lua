return {
  "Olical/conjure",
  init = function()
    -- Set configuration options here

    -- Disable the documentation mapping
    vim.g["conjure#mapping#doc_word"] = false
    vim.g["conjure#client#fennel#aniseed#deprecation_warning"] = false
  end,
}
