#= Задача 3
Дано: Робот - в произвольной клетке ограниченного прямоугольного поля
Результат: Робот - в исходном положении, и все клетки поля промакированы =#

include("roblib.jl")
    #=
        invers(side::HorizonSide)
        movements!(r::Robot,side::HorizonSide,num_steps::Int)
        get_num_steps_movements!(r::Robot, side::HorizonSide)
        movements!(r::Robot,side::HorizonSide)
        moves!(r::Robot,side::HorizonSide)
        find_border!(r::Robot,direction_to_border::HorizonSide, direction_of_movement::HorizonSide)
    =#

function full_field_in_marks!(r::Robot) 
    num_vert = get_num_steps_movements!(r, Sud)
    num_hor = get_num_steps_movements!(r, West)

    side = Ost
    mark_row!(r,side) 
    putmarker!(r) 

    movements!(r,Sud)
    movements!(r, West) 

    
    movements!(r,Ost,num_hor)
    movements!(r,Nord,num_vert)
end







invers(side::HorizonSide) = HorizonSide(mod(Int(side) + 2,4)) 

function mark_row!(r::Robot,side::HorizonSide) 
    while isborder(r,side) == false 
        putmarker!(r)
        move!(r,side)
    end





    if (isborder(r,Nord) == false) 
        putmarker!(r)
        move!(r,Nord)
        side = invers(side::HorizonSide)
        mark_row!(r,side)
    end








end








function get_num_steps_movements!(r::Robot, side::HorizonSide) 
    num_steps = 0
    while isborder(r, side) == false 
        move!(r,side)
        num_steps += 1
    end




    return num_steps
end






function movements!(r::Robot,side::HorizonSide) 
    while isborder(r,side) == false
        move!(r,side)
    end



end



function movements!(r::Robot,side::HorizonSide,num_steps::Int) 
    for _ in 1:num_steps
        move!(r,side)
    end


end

