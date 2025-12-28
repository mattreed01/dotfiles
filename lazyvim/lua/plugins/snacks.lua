local dashboard_header = [[
           __                                
.-.__      \\ .-.  ___  __                    
|_|  '--.-.-(   \\/\\;;\\_\\.-._______.-.        
(-)___     \\ \\ .-\\ \\;;\\(   \\       \\ \\       
 Y    '---._\\_((Q)) \\;;\\\\ .-\\     __(_)      
 I           __'-' / .--.((Q))---'    \\,     
 I     ___.-:    \\|  |   \\'-'_          \\    
 A  .-'      \\ .-.\\   \\   \\ \\ '--.__     '\\  
 |  |____.----((Q))\\   \\__|--\\_      \\     ' 
    ( )        '-'  \\_  :  \\-' '--.___\\      
     Y                \\  \\  \\       \\(_)     
     I                 \\  \\  \\         \\,    
     I                  \\  \\  \\          \\   
     A                   \\  \\  \\          '\\ 
     |              snd   \\  \\__|           '
                           \\_:.  \\           
                             \\ \\  \\          
                              \\ \\  \\         
                               \\_\\_|         

                                        STAY ON TARGET
]]

return {
  "folke/snacks.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = dashboard_header,
      },
    },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          allow_patterns = { ".*" },
          git_ignored = true,
          hidden = true,
          layout = {
            layout = {
              position = "right",
            },
          },
          respect_gitignore = false,
        },
        files = {
          allow_patterns = { ".*" },
          git_ignored = true,
          hidden = true,
          respect_gitignore = false,
        },
      },
    },
  },
}
