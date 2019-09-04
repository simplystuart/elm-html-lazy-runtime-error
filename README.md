# Elm Html.Lazy runtime error

![Screen Recording](https://github.com/simplystuart/elm-html-lazy-runtime-error/blob/master/screen-recording.gif "Screen Recording")

## Setup

```
git clone https://github.com/simplystuart/elm-html-lazy-runtime-error.git
cd elm-html-lazy-runtime-error
yarn install
yarn start
```

## Fix

Remove Html.Lazy from [Main.elm line #51](https://github.com/simplystuart/elm-html-lazy-runtime-error/blob/master/src/Main.elm#L51)

#### Before

```
Html.map ChildMsg <| Html.Lazy.lazy Page.Child.view model_
```

#### After

```
Html.map ChildMsg <| Page.Child.view model_
```
