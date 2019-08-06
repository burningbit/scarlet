module Components.Login where


import Prelude

import React (ReactElement, component, getProps, getState)
import React as React
import React.DOM as D
import React.DOM.Props as P
import React.DOM.SVG as DS

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
             render {loginId, password} = D.div [P.className "scarlet-login-view"] $ [React.createLeafElement loginForm {}]


loginForm :: React.ReactClass {}
loginForm = React.component "LoginForm" component
  where
    component this = 
      pure { state: { loginId: ""
                    , password: ""
                    }
           , render: render <$> getState this
           }
            where 
              render {loginId, password} =  D.div [P.className "scarlet-login-view-form"] [loginIdContainer loginId , passwordInputContainer password]
                where
                  loginIdContainer loginId' = React.createLeafElement inputContainer {value: loginId', _type: "text", label: "Username", _id : "login_id_label"}
                  passwordInputContainer password' = React.createLeafElement inputContainer {value: password', _type: "password", label: "Password", _id: "password_label"}


inputContainer :: React.ReactClass {value :: String, _type :: String, label :: String, _id :: String}
inputContainer = React.component "InputContainer" component
  where
    component this = 
      pure { state: {}
           , render: render <$> getProps this
           }
           where
             render {value, _type, label, _id} = 
              D.div [ P.className "scarlet-login-view-textbox-container" ] 
                      [ D.label [ P.className "scarlet-login-view-textbox-label", P.htmlFor _id ] [ imageIcon _id ]
                      , D.input [ P.className "scarlet-login-view-textbox"
                                , P._type _type
                                , P._id _id]
                      ]

imageSource :: String -> String
imageSource "login_id_label" = "https://www.svgrepo.com/show/794/male-user.svg"
imageSource "password_label" = "https://www.svgrepo.com/show/955/padlock.svg"
imageSource _ = "https://www.svgrepo.com/show/221473/lost-items-missing.svg"

imageIcon :: String -> ReactElement
imageIcon src = D.img [P.className "scarlet-icon-20", P.src (imageSource src)]