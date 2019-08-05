module Components.Login where


import Prelude

import React (ReactElement, getState)
import React as React
import React.DOM as D
import React.DOM.Props as P

loginView :: React.ReactClass {}
loginView = React.component "LoginView" component
  where
    component this = 
      pure {  state: { loginId: ""
                     , password: ""
                     }
           , render: render <$> getState this
           }
           where
             render {loginId, password} = D.div' [passwordInput loginId , passwordInput password]
                where
                  loginIdContainer loginId' = React.createElement inputContainer {} []
                  loginIdInput loginId'' = D.input [P.className "scarlet-login-view-loginid-input"]
                  passwordInput password' = D.input [P.className "scarlet-login-view-password-input"]


-- inputContainer :: Array ReactElement React.ReactClass {}
inputContainer = React.component "InputContainer" component
  where
    component this = 
      pure { state: {}
           }