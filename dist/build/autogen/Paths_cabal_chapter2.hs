{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_cabal_chapter2 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Natha\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\Natha\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\cabal-chapter2-0.1.0.0-AIsGbEEKLPt5pMMsADQOdZ"
dynlibdir  = "C:\\Users\\Natha\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5"
datadir    = "C:\\Users\\Natha\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.6.5\\cabal-chapter2-0.1.0.0"
libexecdir = "C:\\Users\\Natha\\AppData\\Roaming\\cabal\\cabal-chapter2-0.1.0.0-AIsGbEEKLPt5pMMsADQOdZ\\x86_64-windows-ghc-8.6.5\\cabal-chapter2-0.1.0.0"
sysconfdir = "C:\\Users\\Natha\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "cabal_chapter2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "cabal_chapter2_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "cabal_chapter2_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "cabal_chapter2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "cabal_chapter2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "cabal_chapter2_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
