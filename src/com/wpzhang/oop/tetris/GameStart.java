/**
 * @Author wpzhang
 * @Date 2019/3/19
 * @Description
 */
package com.wpzhang.oop.tetris;

import com.wpzhang.oop.tetris.component.Tetris;
import org.junit.Test;

import javax.swing.*;
import java.io.*;

/**
 * @program: Wpzhang
 * @description: 程序执行入口
 * @author: wpzhang
 * @create: 2019-03-19 13:36
 **/
public class GameStart extends JFrame {
    public static final int WIDTH = 530;
    public static final int HEIGHT = 575;
    // 游戏执行入口
    public static void main(String[] args) throws Exception {
        // 创建游戏主窗体
        GameStart game = new GameStart();
        // 修改窗体的配置
        game.setSize(WIDTH, HEIGHT); // 设置窗体的宽高
        // 设置关闭按钮
        game.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        game.setResizable(false);   // 窗体不能改变大小

        // 将游戏面板添加到窗体上(将黑板嵌入墙上)
        game.add(new Tetris());

        game.setVisible(true);  // 显示窗体


        //建立联系   File对象  目的地
        File dest = new File("C:\\Users\\Administrator\\IdeaProjects\\Wpzhang\\src\\com\\wpzhang\\oop\\tetris\\component\\tetris.txt");
        //选择流  inputStream FileInputStream
        OutputStream is = new FileOutputStream(dest,true);
        //操作

    }
}