using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EntityDesktop
{
    public partial class FrmGiris : Form
    {
        public FrmGiris()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DbEntityUrunEntities1 db=new DbEntityUrunEntities1();
            var sorgu=from K in db.TBLADMIN where K.KULLANICIADI==textBox1.Text && K.SIFRE==textBox2.Text select K;
            if ( sorgu.Any())
            {
                FrmAnaForm FR = new FrmAnaForm();
                FR.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("HATALI KULLANICI BİLGİLERİ GİRDİNİZ");
            }

                      }
    }
}
