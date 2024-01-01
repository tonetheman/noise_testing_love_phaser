
// stolen from processing.js really
import { _map, noise } from "./proc.js";

let t = 0.0;

    
class Tony extends Phaser.Scene {

    constructor() {
        super("tony");
        this.color = new Phaser.Display.Color();
    }
    
    update() {
        //const color = new Phaser.Display.Color();
        for(let i=0;i<32;i++) {
            for (let j=0;j<32;j++) {

                let noi = noise(t+i,t+j)
                let noi2 = noise(t+i,t+j)
                let modNoi = 5 * Math.sin(t*noi*100) + 5* Math.sin(t*noi2*25)
                let col = _map(modNoi,0,10,0,255)
                this.color.red = col;
                this.add.rectangle(i,j,1,1,this.color.color);
            }
        }

        t+=0.001;
    }
}



const config = {
    type: Phaser.AUTO,
    width: 640,
    height: 640,
    scene: Tony,
    pixelArt: true,
    scale : {
        width: 32,
        height: 32,
        mode: Phaser.Scale.FIT
    }
};

function main() {
    const game = new Phaser.Game(config);
}

window.onload = main;