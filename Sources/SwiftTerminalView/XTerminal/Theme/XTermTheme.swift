//
//  XTermTheme.swift
//  XTermTheme
//
//  Created by GitSwiftDev @ GitSwift LLC on 2024/12/6.
//

import Foundation

public struct XTermTheme {
    public var foreground: String
    public var background: String
    public var cursor: String
    public var black: String
    public var brightBlack: String
    public var red: String
    public var brightRed: String
    public var green: String
    public var brightGreen: String
    public var yellow: String
    public var brightYellow: String
    public var blue: String
    public var brightBlue: String
    public var magenta: String
    public var brightMagenta: String
    public var cyan: String
    public var brightCyan: String
    public var white: String
    public var brightWhite: String
    public var selectionBackground: String

    public init(foreground: String, 
                background: String, 
                cursor: String, 
                black: String, 
                brightBlack: String, 
                red: String, 
                brightRed: String, 
                green: String, 
                brightGreen: String, 
                yellow: String, 
                brightYellow: String, 
                blue: String, 
                brightBlue: String, 
                magenta: String, 
                brightMagenta: String, 
                cyan: String, 
                brightCyan: String, 
                white: String, 
                brightWhite: String, 
                selectionBackground: String) {
        self.background = background
        self.foreground = foreground
        self.cursor = cursor
        self.black = black
        self.brightBlack = brightBlack
        self.red = red
        self.brightRed = brightRed
        self.green = green
        self.brightGreen = brightGreen
        self.yellow = yellow
        self.brightYellow = brightYellow
        self.blue = blue
        self.brightBlue = brightBlue
        self.magenta = magenta
        self.brightMagenta = brightMagenta
        self.cyan = cyan
        self.brightCyan = brightCyan
        self.white = white
        self.brightWhite = brightWhite
        self.selectionBackground = selectionBackground
    }
}

extension XTermTheme {
    public enum themes {
        public static var SwiftServer_Light: XTermTheme {
            return XTermTheme(
                foreground: "#232322",
                background: "#FFFFFF",
                cursor: "#5756D6",
                black: "#212121",
                brightBlack: "#424242",
                red: "#b7141f",
                brightRed: "#e83b3f",
                green: "#457b24",
                brightGreen: "#7aba3a",
                yellow: "#f6981e",
                brightYellow: "#ffea2e",
                blue: "#134eb2",
                brightBlue: "#54a4f3",
                magenta: "#560088",
                brightMagenta: "#aa4dbc",
                cyan: "#0e717c",
                brightCyan: "#26bbd1",
                white: "#efefef",
                brightWhite: "#d9d9d9",
                selectionBackground: "#CCCCF2"
            )
        }
        public static var SwiftServer_Dark: XTermTheme {
            return XTermTheme(
                foreground: "#e5e5e5",
                background: "#1E1E1E",
                cursor: "#7877DE",
                black: "#212121",
                brightBlack: "#424242",
                red: "#b7141f",
                brightRed: "#e83b3f",
                green: "#457b24",
                brightGreen: "#7aba3a",
                yellow: "#f6981e",
                brightYellow: "#ffea2e",
                blue: "#134eb2",
                brightBlue: "#54a4f3",
                magenta: "#560088",
                brightMagenta: "#aa4dbc",
                cyan: "#0e717c",
                brightCyan: "#26bbd1",
                white: "#efefef",
                brightWhite: "#d9d9d9",
                selectionBackground: "#3C3B6F"
            )
        }
    }
}

public enum TerminalTheme: String, CaseIterable {
    case SwiftServer_Light
    case SwiftServer_Dark
    case Night_3024
    case AdventureTime
    case Afterglow
    case AlienBlood
    case Argonaut
    case Arthur
    case AtelierSulphurpool
    case Atom
    case Batman
    case Belafonte_Night
    case BirdsOfParadise
    case Blazer
    case Borland
    case Bright_Lights
    case Broadcast
    case Brogrammer
    case C64
    case Chalk
    case Chalkboard
    case Ciapre
    case Cobalt2
    case Cobalt_Neon
    case CrayonPonyFish
    case Dark_Pastel
    case Darkside
    case Desert
    case DimmedMonokai
    case DotGov
    case Dracula
    case Duotone_Dark
    case ENCOM
    case Earthsong
    case Elemental
    case Elementary
    case Espresso
    case Espresso_Libre
    case Fideloper
    case FirefoxDev
    case Firewatch
    case FishTank
    case Flat
    case Flatland
    case Floraverse
    case ForestBlue
    case FrontEndDelight
    case FunForrest
    case Galaxy
    case Github
    case Glacier
    case Grape
    case Grass
    case Gruvbox_Dark
    case Hardcore
    case Harper
    case Highway
    case Hipster_Green
    case Homebrew
    case Hurtado
    case Hybrid
    case IC_Green_PPL
    case IC_Orange_PPL
    case IR_Black
    case Jackie_Brown
    case Japanesque
    case Jellybeans
    case JetBrains_Darcula
    case Kibble
    case Later_This_Evening
    case Lavandula
    case LiquidCarbon
    case LiquidCarbonTransparent
    case LiquidCarbonTransparentInverse
    case Man_Page
    case Material
    case MaterialDark
    case Mathias
    case Medallion
    case Misterioso
    case Molokai
    case MonaLisa
    case Monokai_Soda
    case Monokai_Vivid
    case N0tch2k
    case Neopolitan
    case Neutron
    case NightLion_v1
    case NightLion_v2
    case Novel
    case Obsidian
    case Ocean
    case OceanicMaterial
    case Ollie
    case OneHalfDark
    case OneHalfLight
    case Pandora
    case Paraiso_Dark
    case Parasio_Dark
    case PaulMillr
    case PencilDark
    case PencilLight
    case Piatto_Light
    case Pnevma
    case Pro
    case Red_Alert
    case Red_Sands
    case Rippedcasts
    case Royal
    case Ryuuko
    case SeaShells
    case Seafoam_Pastel
    case Seti
    case Shaman
    case Slate
    case Smyck
    case SoftServer
    case Solarized_Darcula
    case Solarized_Dark
    case Solarized_Dark_Patched
    case Solarized_Dark_Higher_Contrast
    case Solarized_Light
    case SpaceGray
    case SpaceGray_Eighties
    case SpaceGray_Eighties_Dull
    case Spacedust
    case Spiderman
    case Spring
    case Square
    case Sundried
    case Symfonic
    case Teerb
    case Terminal_Basic
    case Thayer_Bright
    case The_Hulk
    case Tomorrow
    case Tomorrow_Night
    case Tomorrow_Night_Blue
    case Tomorrow_Night_Bright
    case Tomorrow_Night_Eighties
    case ToyChest
    case Treehouse
    case Ubuntu
    case UnderTheSea
    case Urple
    case Vaughn
    case VibrantInk
    case Violet_Dark
    case Violet_Light
    case WarmNeon
    case Wez
    case WildCherry
    case Wombat
    case Wryan
    case Zenburn
    case ayu
    case deep
    case idleToes

    public var theme: XTermTheme {
        switch self {
        case .SwiftServer_Light: return XTermTheme.themes.SwiftServer_Light
        case .SwiftServer_Dark: return XTermTheme.themes.SwiftServer_Dark
        case .Night_3024: return XTermTheme.themes.Night_3024
        case .AdventureTime: return XTermTheme.themes.AdventureTime
        case .Afterglow: return XTermTheme.themes.Afterglow
        case .AlienBlood: return XTermTheme.themes.AlienBlood
        case .Argonaut: return XTermTheme.themes.Argonaut
        case .Arthur: return XTermTheme.themes.Arthur
        case .AtelierSulphurpool: return XTermTheme.themes.AtelierSulphurpool
        case .Atom: return XTermTheme.themes.Atom
        case .Batman: return XTermTheme.themes.Batman
        case .Belafonte_Night: return XTermTheme.themes.Belafonte_Night
        case .BirdsOfParadise: return XTermTheme.themes.BirdsOfParadise
        case .Blazer: return XTermTheme.themes.Blazer
        case .Borland: return XTermTheme.themes.Borland
        case .Bright_Lights: return XTermTheme.themes.Bright_Lights
        case .Broadcast: return XTermTheme.themes.Broadcast
        case .Brogrammer: return XTermTheme.themes.Brogrammer
        case .C64: return XTermTheme.themes.C64
        case .Chalk: return XTermTheme.themes.Chalk
        case .Chalkboard: return XTermTheme.themes.Chalkboard
        case .Ciapre: return XTermTheme.themes.Ciapre
        case .Cobalt2: return XTermTheme.themes.Cobalt2
        case .Cobalt_Neon: return XTermTheme.themes.Cobalt_Neon
        case .CrayonPonyFish: return XTermTheme.themes.CrayonPonyFish
        case .Dark_Pastel: return XTermTheme.themes.Dark_Pastel
        case .Darkside: return XTermTheme.themes.Darkside
        case .Desert: return XTermTheme.themes.Desert
        case .DimmedMonokai: return XTermTheme.themes.DimmedMonokai
        case .DotGov: return XTermTheme.themes.DotGov
        case .Dracula: return XTermTheme.themes.Dracula
        case .Duotone_Dark: return XTermTheme.themes.Duotone_Dark
        case .ENCOM: return XTermTheme.themes.ENCOM
        case .Earthsong: return XTermTheme.themes.Earthsong
        case .Elemental: return XTermTheme.themes.Elemental
        case .Elementary: return XTermTheme.themes.Elementary
        case .Espresso: return XTermTheme.themes.Espresso
        case .Espresso_Libre: return XTermTheme.themes.Espresso_Libre
        case .Fideloper: return XTermTheme.themes.Fideloper
        case .FirefoxDev: return XTermTheme.themes.FirefoxDev
        case .Firewatch: return XTermTheme.themes.Firewatch
        case .FishTank: return XTermTheme.themes.FishTank
        case .Flat: return XTermTheme.themes.Flat
        case .Flatland: return XTermTheme.themes.Flatland
        case .Floraverse: return XTermTheme.themes.Floraverse
        case .ForestBlue: return XTermTheme.themes.ForestBlue
        case .FrontEndDelight: return XTermTheme.themes.FrontEndDelight
        case .FunForrest: return XTermTheme.themes.FunForrest
        case .Galaxy: return XTermTheme.themes.Galaxy
        case .Github: return XTermTheme.themes.Github
        case .Glacier: return XTermTheme.themes.Glacier
        case .Grape: return XTermTheme.themes.Grape
        case .Grass: return XTermTheme.themes.Grass
        case .Gruvbox_Dark: return XTermTheme.themes.Gruvbox_Dark
        case .Hardcore: return XTermTheme.themes.Hardcore
        case .Harper: return XTermTheme.themes.Harper
        case .Highway: return XTermTheme.themes.Highway
        case .Hipster_Green: return XTermTheme.themes.Hipster_Green
        case .Homebrew: return XTermTheme.themes.Homebrew
        case .Hurtado: return XTermTheme.themes.Hurtado
        case .Hybrid: return XTermTheme.themes.Hybrid
        case .IC_Green_PPL: return XTermTheme.themes.IC_Green_PPL
        case .IC_Orange_PPL: return XTermTheme.themes.IC_Orange_PPL
        case .IR_Black: return XTermTheme.themes.IR_Black
        case .Jackie_Brown: return XTermTheme.themes.Jackie_Brown
        case .Japanesque: return XTermTheme.themes.Japanesque
        case .Jellybeans: return XTermTheme.themes.Jellybeans
        case .JetBrains_Darcula: return XTermTheme.themes.JetBrains_Darcula
        case .Kibble: return XTermTheme.themes.Kibble
        case .Later_This_Evening: return XTermTheme.themes.Later_This_Evening
        case .Lavandula: return XTermTheme.themes.Lavandula
        case .LiquidCarbon: return XTermTheme.themes.LiquidCarbon
        case .LiquidCarbonTransparent: return XTermTheme.themes.LiquidCarbonTransparent
        case .LiquidCarbonTransparentInverse: return XTermTheme.themes.LiquidCarbonTransparentInverse
        case .Man_Page: return XTermTheme.themes.Man_Page
        case .Material: return XTermTheme.themes.Material
        case .MaterialDark: return XTermTheme.themes.MaterialDark
        case .Mathias: return XTermTheme.themes.Mathias
        case .Medallion: return XTermTheme.themes.Medallion
        case .Misterioso: return XTermTheme.themes.Misterioso
        case .Molokai: return XTermTheme.themes.Molokai
        case .MonaLisa: return XTermTheme.themes.MonaLisa
        case .Monokai_Soda: return XTermTheme.themes.Monokai_Soda
        case .Monokai_Vivid: return XTermTheme.themes.Monokai_Vivid
        case .N0tch2k: return XTermTheme.themes.N0tch2k
        case .Neopolitan: return XTermTheme.themes.Neopolitan
        case .Neutron: return XTermTheme.themes.Neutron
        case .NightLion_v1: return XTermTheme.themes.NightLion_v1
        case .NightLion_v2: return XTermTheme.themes.NightLion_v2
        case .Novel: return XTermTheme.themes.Novel
        case .Obsidian: return XTermTheme.themes.Obsidian
        case .Ocean: return XTermTheme.themes.Ocean
        case .OceanicMaterial: return XTermTheme.themes.OceanicMaterial
        case .Ollie: return XTermTheme.themes.Ollie
        case .OneHalfDark: return XTermTheme.themes.OneHalfDark
        case .OneHalfLight: return XTermTheme.themes.OneHalfLight
        case .Pandora: return XTermTheme.themes.Pandora
        case .Paraiso_Dark: return XTermTheme.themes.Paraiso_Dark
        case .Parasio_Dark: return XTermTheme.themes.Parasio_Dark
        case .PaulMillr: return XTermTheme.themes.PaulMillr
        case .PencilDark: return XTermTheme.themes.PencilDark
        case .PencilLight: return XTermTheme.themes.PencilLight
        case .Piatto_Light: return XTermTheme.themes.Piatto_Light
        case .Pnevma: return XTermTheme.themes.Pnevma
        case .Pro: return XTermTheme.themes.Pro
        case .Red_Alert: return XTermTheme.themes.Red_Alert
        case .Red_Sands: return XTermTheme.themes.Red_Sands
        case .Rippedcasts: return XTermTheme.themes.Rippedcasts
        case .Royal: return XTermTheme.themes.Royal
        case .Ryuuko: return XTermTheme.themes.Ryuuko
        case .SeaShells: return XTermTheme.themes.SeaShells
        case .Seafoam_Pastel: return XTermTheme.themes.Seafoam_Pastel
        case .Seti: return XTermTheme.themes.Seti
        case .Shaman: return XTermTheme.themes.Shaman
        case .Slate: return XTermTheme.themes.Slate
        case .Smyck: return XTermTheme.themes.Smyck
        case .SoftServer: return XTermTheme.themes.SoftServer
        case .Solarized_Darcula: return XTermTheme.themes.Solarized_Darcula
        case .Solarized_Dark: return XTermTheme.themes.Solarized_Dark
        case .Solarized_Dark_Patched: return XTermTheme.themes.Solarized_Dark_Patched
        case .Solarized_Dark_Higher_Contrast: return XTermTheme.themes.Solarized_Dark_Higher_Contrast
        case .Solarized_Light: return XTermTheme.themes.Solarized_Light
        case .SpaceGray: return XTermTheme.themes.SpaceGray
        case .SpaceGray_Eighties: return XTermTheme.themes.SpaceGray_Eighties
        case .SpaceGray_Eighties_Dull: return XTermTheme.themes.SpaceGray_Eighties_Dull
        case .Spacedust: return XTermTheme.themes.Spacedust
        case .Spiderman: return XTermTheme.themes.Spiderman
        case .Spring: return XTermTheme.themes.Spring
        case .Square: return XTermTheme.themes.Square
        case .Sundried: return XTermTheme.themes.Sundried
        case .Symfonic: return XTermTheme.themes.Symfonic
        case .Teerb: return XTermTheme.themes.Teerb
        case .Terminal_Basic: return XTermTheme.themes.Terminal_Basic
        case .Thayer_Bright: return XTermTheme.themes.Thayer_Bright
        case .The_Hulk: return XTermTheme.themes.The_Hulk
        case .Tomorrow: return XTermTheme.themes.Tomorrow
        case .Tomorrow_Night: return XTermTheme.themes.Tomorrow_Night
        case .Tomorrow_Night_Blue: return XTermTheme.themes.Tomorrow_Night_Blue
        case .Tomorrow_Night_Bright: return XTermTheme.themes.Tomorrow_Night_Bright
        case .Tomorrow_Night_Eighties: return XTermTheme.themes.Tomorrow_Night_Eighties
        case .ToyChest: return XTermTheme.themes.ToyChest
        case .Treehouse: return XTermTheme.themes.Treehouse
        case .Ubuntu: return XTermTheme.themes.Ubuntu
        case .UnderTheSea: return XTermTheme.themes.UnderTheSea
        case .Urple: return XTermTheme.themes.Urple
        case .Vaughn: return XTermTheme.themes.Vaughn
        case .VibrantInk: return XTermTheme.themes.VibrantInk
        case .Violet_Dark: return XTermTheme.themes.Violet_Dark
        case .Violet_Light: return XTermTheme.themes.Violet_Light
        case .WarmNeon: return XTermTheme.themes.WarmNeon
        case .Wez: return XTermTheme.themes.Wez
        case .WildCherry: return XTermTheme.themes.WildCherry
        case .Wombat: return XTermTheme.themes.Wombat
        case .Wryan: return XTermTheme.themes.Wryan
        case .Zenburn: return XTermTheme.themes.Zenburn
        case .ayu: return XTermTheme.themes.ayu
        case .deep: return XTermTheme.themes.deep
        case .idleToes: return XTermTheme.themes.idleToes
        }
    }
}
