[CmdletBinding()]
param (
    [Parameter()]
    [Single]
    $ParentWidth,

    [Parameter()]
    [Single]
    $ParentHeight,

    [Parameter()]
    [Single]
    $ShapeWidth,

    [Parameter()]
    [Single]
    $ShapeHeight,

    [Parameter()]
    [Single]
    $DistanceFromX,

    [Parameter()]
    [Single]
    $DistanceFromY,

    [Parameter()]
    [ValidateSet('left', 'right')]
    [String]
    $EdgeX,

    [Parameter()]
    [ValidateSet('top', 'bottom')]
    [String]
    $EdgeY,

    [Parameter()]
    [Switch]
    $Inches
)

$MILLIMETERS_PER_INCH = 25.4
$strokeWidth = 0.076
if ($Inches) {
    $ParentWidth = $ParentWidth * $MILLIMETERS_PER_INCH
    $ParentHeight = $ParentHeight * $MILLIMETERS_PER_INCH
    $ShapeWidth = $ShapeWidth * $MILLIMETERS_PER_INCH
    $ShapeHeight = $ShapeHeight * $MILLIMETERS_PER_INCH
    $DistanceFromX = $DistanceFromX * $MILLIMETERS_PER_INCH
    $DistanceFromY = $DistanceFromY * $MILLIMETERS_PER_INCH
}

$x = 0
$y = 0
if ($EdgeX -eq 'left') {
    $x = $DistanceFromX - ($strokeWidth / 2)
}
else {
    $x = $ParentWidth - $ShapeWidth - $DistanceFromX - ($strokeWidth / 2)
}

if ($EdgeY -eq 'top') {
    $y = $DistanceFromY - ($strokeWidth / 2)
}
else {
    $y = $ParentHeight - $ShapeHeight - $DistanceFromY - ($strokeWidth / 2)
}

"$([math]::Round($x, 3)), $([math]::Round($y, 3))"