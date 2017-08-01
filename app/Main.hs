{-# LANGUAGE ScopedTypeVariables #-}

module Main where

import System.Environment (getArgs)
import Vision.Image
import Vision.Image.Storage.DevIL (Autodetect (..), load, save)

import Lib

main :: IO ()
main = do
    [input, output] <- getArgs
    image <- load Autodetect input
    case image of
        Right (rgb :: RGB) -> do
            writeOut <- save Autodetect output rgb
            case writeOut of
                Nothing -> putStrLn "Image was successfully stored"
                Just err -> do
                    print err 
        Left err -> do
            print err
