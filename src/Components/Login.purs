module Components.Login where


import Prelude

import Debug.Trace as T
import Effect.Console (log)
import React (Children, ReactElement, getProps, getState)
import React as React
import React.DOM as D
import React.DOM.Props as P
import React.SyntheticEvent (data_, isTrusted)

-- import Web.Event.Event (target)

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
              render {loginId, password} =  D.div [P.className "scarlet-login-view-form-container"] $ [makeForm loginId password]
              makeForm l p = D.form [P.onSubmit yomaan] [loginIdContainer l , passwordInputContainer p, submitInputContainer]
                where
                  loginIdContainer loginId' = 
                    React.createElement inputContainer 
                                          {value: loginId', _type: "text", label: "Username", _id : "login_id_label"} 
                                          [imageIcon "user-icon"]
                  passwordInputContainer password' = 
                    React.createElement inputContainer 
                                          {value: password', _type: "password", label: "Password", _id: "password_label"} 
                                          [imageIcon "password-icon"]
                  submitInputContainer = React.createElement inputContainer {value: "Click Me", _type: "submit", label: "a", _id: "submit_button"} []

yomaan target = T.traceM $ target

inputContainer :: React.ReactClass {children :: Children, value :: String, _type :: String, label :: String, _id :: String}
inputContainer = React.component "InputContainer" component
  where
    component this = 
      pure { state: {}
           , render: render <$> getProps this
           }
           where
             render {children, value, _type, label, _id} = 
              D.div [ P.className "scarlet-login-view-textbox-container" ] 
                      [ D.label [ P.className "scarlet-login-view-textbox-label", P.htmlFor _id ] $ React.childrenToArray children
                      , D.input [ P.className "scarlet-login-view-textbox"
                                , P._type _type
                                , P._id _id]
                      ]

imageSource :: String -> String
imageSource "user-icon" = "https://www.svgrepo.com/show/794/male-user.svg"
imageSource "password-icon" = "https://www.svgrepo.com/show/955/padlock.svg"
imageSource _ = "https://www.svgrepo.com/show/221473/lost-items-missing.svg"

imageIcon :: String -> ReactElement
imageIcon src = D.img [P.className "scarlet-icon-20", P.src (imageSource src)]