local neogen = require('neogen')

neogen.setup({
  enabled = true,
  input_after_comment = true,
  languages = {
    python = {
      template = {
        annotation_convention = "numpydoc"
      }
    },
  },
})

