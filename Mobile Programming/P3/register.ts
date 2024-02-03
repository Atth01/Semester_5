import { Component, OnInit } from '@angular/core';
import {
  AlertController,
  LoadingController,
  NavController,
  ToastController,
} from '@ionic/angular';
import { Http } from '@capacitor-community/http';

@Component({
  selector: 'app-register',
  templateUrl: './register.page.html',
  styleUrls: ['./register.page.scss'],
})
export class RegisterPage implements OnInit {
  public username: string = '';
  public password: string = '';
  public nama: string = '';
  public npm: string = '';
  public prodi: string = '';
  public email: string = '';
  public telp: string = '';

  constructor(
    private navCtrl: NavController,
    private toastCtrl: ToastController,
    private loadCtrl: LoadingController,
    private alertCtrl: AlertController
  ) {}

  async presentToast(a: any) {
    const toast = await this.toastCtrl.create({
      message: a,
      duration: 1500,
      color: 'danger',
      position: 'top',
    });
    toast.present();
  }

  async register() {
    if (this.npm === "" || this.prodi === "" || this.nama === "" || this.telp === "" || this.email === "" || this.username === "" || this.password === ""){
      this.presentToast('Fill all the register form');
    } else if (this.password.length < 8){
      this.presentToast('Password must contains at least 8 characters');
    } else {
      const loader = await this.loadCtrl.create({
        message: "Please wait...",
      })
      loader.present();

      try {
        let url = 'http://localhost/api/register.php';
        Http.request({
          method: "POST",
          url: url,
          headers: { 'Content-Type': 'application/json' },
          data: {
            npm: this.npm,
            prodi: this.prodi,
            nama: this.nama,
            email: this.email,
            telp: this.telp,
            username: this.username,
            pass: this.password,
          },
        })
          .then((res) => {
            if (res != null) {
              loader.dismiss();
              this.presentToast('Data berhasil disimpan');
              this.navCtrl.navigateRoot(['/login']);
            } else {
              loader.dismiss();
              this.presentToast(res);
            }
          });
      } catch (err) {
        loader.dismiss();
        this.presentToast('Something went wrong!');
      }
    }
  }

  ngOnInit() {}
}

register.html
<ion-header [translucent]="true">
  <ion-toolbar>
    <ion-buttons slot="start">
      <ion-back-button></ion-back-button>
      <ion-title>Register</ion-title>
    </ion-buttons>
  </ion-toolbar>
</ion-header>

<ion-content [fullscreen]="true">
  <div class="container d-block justify-content-center">
    <ion-item>
      <ion-label position="floating">NPM</ion-label>
      <ion-input [(ngModel)]="npm" placeholder="Insert NPM"></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Nama</ion-label>
      <ion-input
        [(ngModel)]="nama"
        placeholder="Insert Nama"
      ></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Program Studi</ion-label>
      <ion-input
        [(ngModel)]="prodi"
        placeholder="Insert Prodi"
      ></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Email</ion-label>
      <ion-input
        [(ngModel)]="email"
        placeholder="Insert Email"
      ></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Telepon</ion-label>
      <ion-input
        [(ngModel)]="telp"
        placeholder="Insert Telepon"
      ></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Username</ion-label>
      <ion-input
        [(ngModel)]="username"
        placeholder="Insert Username"
      ></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="floating">Password</ion-label>
      <ion-input
        [(ngModel)]="password"
        placeholder="Insert Password"
      ></ion-input>
    </ion-item>
    <ion-item>
      <ion-label position="stacked">Foto Profil</ion-label>
      <ion-input type="file">
      </ion-input>
    </ion-item>
    <div class="form-group mt-3">
      <button (click)="register()" class="form-control btn btn-primary">Register</button>
    </div>
  </div>
</ion-content>