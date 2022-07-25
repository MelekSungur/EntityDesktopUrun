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
    public partial class Frmistatistik : Form
    {
        public Frmistatistik()
        {
            InitializeComponent();
        }
        DbEntityUrunEntities1 db=new DbEntityUrunEntities1();
        private void Frmistatistik_Load(object sender, EventArgs e)
        {
            label2.Text = db.TBLKATAGORI.Count().ToString();
            label3.Text = db.TBLURUN.Count().ToString();
            label5.Text = db.TBLMUSTERI.Count(X => X.DURUM == true).ToString();
            label23.Text= db.TBLMUSTERI.Count(X => X.DURUM == false).ToString();
            label9.Text = db.TBLURUN.Sum(y => y.STOK).ToString();
            label15.Text = db.TBLSATIS.Sum(z => z.FIYAT).ToString() + "TL";
            label7.Text = (from x in db.TBLURUN orderby x.FIYAT descending select x.URUNAD).FirstOrDefault(); 
            label21.Text = (from x in db.TBLURUN orderby x.FIYAT ascending select x.URUNAD).FirstOrDefault();
            label11.Text = db.TBLURUN.Count(b => b.KATEGORI==1).ToString();
            
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }
    }
}
