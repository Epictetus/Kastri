unit DW.EXIF;

{*******************************************************}
{                                                       }
{                      Kastri                           }
{                                                       }
{         Delphi Worlds Cross-Platform Library          }
{                                                       }
{    Copyright 2020 Dave Nottage under MIT license      }
{  which is located in the root folder of this library  }
{                                                       }
{*******************************************************}

{$I DW.GlobalDefines.inc}

interface

type
  TEXIFProperties = record
    DateTaken: string;
    CameraMake: string;
    CameraModel: string;
    Longitude: Double;
    Latitude: Double;
  end;

  TEXIF = record
  public
    class function GetEXIF(const AFileName: string; out AProperties: TEXIFProperties): Boolean; static;
  end;

implementation

// DW
{$IF Defined(IOS)}
uses
  DW.EXIF.iOS;
{$ENDIF}
{$IF Defined(ANDROID)}
uses
  DW.EXIF.Android;
{$ENDIF}

{ TEXIF }

class function TEXIF.GetEXIF(const AFileName: string; out AProperties: TEXIFProperties): Boolean;
begin
  AProperties.Latitude := 0;
  AProperties.Longitude := 0;
  Result := TPlatformEXIF.GetEXIF(AFileName, AProperties);
end;

end.
