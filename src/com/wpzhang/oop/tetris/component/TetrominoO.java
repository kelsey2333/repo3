/**
 * @Author wpzhang
 * @Date 2019/3/19
 * @Description
 */
package com.wpzhang.oop.tetris.component;

import com.wpzhang.oop.tetris.component.Cell;
import com.wpzhang.oop.tetris.component.Tetromino;

import java.awt.*;

/**
 * @program: Wpzhang
 * @description: O型积木
 * @author: wpzhang
 * @create: 2019-03-19 14:10
 **/
public class TetrominoO extends Tetromino {
    /**
     * @return
     * @Param row={}, col={}
     * @description 构造器初始化, 确定中心点位置, 初始化cells数组中四个元素
     * @date 2019/3/19 0019 10:14
     */
    public TetrominoO(int row, int col, Image backImg) {
        // 显式调用父类构造器
        super(row, col, backImg);

        // 初始化数组中的四个元素
        cells[0] = new Cell(row, col, backImg);
        cells[1] = new Cell(row, col + 1, backImg);
        cells[2] = new Cell(row + 1, col, backImg);
        cells[3] = new Cell(row + 1, col + 1, backImg);
    }
    public void rotate(boolean dir) {

    }
}