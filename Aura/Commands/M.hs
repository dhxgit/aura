-- Handles all `-M` operations for building from the ABS.

{-

Copyright 2012, 2013 
Colin Woodbury <colingw@gmail.com>
Nicholas Clarke <nicholas.clarke@sanger.ac.uk>

This file is part of Aura.

Aura is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Aura is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Aura.  If not, see <http://www.gnu.org/licenses/>.

-}

module Aura.Commands.M ( install ) where

import qualified Aura.Install as I

import Aura.Packages.ABS
import Aura.Monad.Aura
import Aura.Core

{-}
  -- | Get info about the specified package (-i)
  absInfo :: [String] -> Aura ()
  absInfo search = do
    q <- mapM absInfoLookup search
    mapM_ displayAbsPkgInfo q

  -- | Search ABS for any packages matching the given patterns (-s)
  absSearch :: [String] -> Aura ()
  absSearch search = do
    q <- mapM absSearchLookup search
    mapM_ displayAbsPkgInfo $ concat q

  -- | Display ABS package info
  displayAbsPkgInfo :: PkgInfo -> Aura ()
  displayAbsPkgInfo info = ask >>= \ss ->
    liftIO $ putStrLn $ renderPkgInfo ss info ++ "\n"
-}

install :: [String] -> [String] -> Aura ()
install pacOpts pkgs = I.install b filterABSPkgs pacOpts pkgs
    where b = package :: String -> Aura ABSPkg  -- Force the type.