module Lib
    ( detectEdges
    ) where

import Vision.Image
import Vision.Detector.Edge
import Foreign.Storable

detectEdges :: RGB -> Manifest GreyPixel
detectEdges img = canny 2 256 1024 (convert img :: Grey)
