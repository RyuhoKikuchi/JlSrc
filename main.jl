function calcPosition(angle)
    x1 = round(x + r * cos(angle * (pi / 180)))
    y1 = round(x + r * sin(angle * (pi / 180)))
    return x1*1.4 + 720, y1 + 450
end


function moveIcon(file, index)
    x2, y2 = calcPosition(degree + a*index)
    fileType, fileName = file[1], file[2]
    run(`osascript moveIcon.scpt $fileType $fileName $x2 $y2`, wait = false)
end


degree = 0
x, y, r = 0, 0, 415
#files = [["f", "file1"]] <- sleep(0.025)
files = [["f", "file1"], ["a", "file2"], ["f", "file3"]]

a = 360 / size(files)[1]
while true
    global degree
    for (i, eachFile) in enumerate(files)
        moveIcon(eachFile, i)
    end
    degree += 1
    if degree%360 == 0
        degree = 0
    end
    sleep(0.3)
end
