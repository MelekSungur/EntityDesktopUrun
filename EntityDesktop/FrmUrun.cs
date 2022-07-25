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
    public partial class FrmUrun : Form
    {
        public FrmUrun()
        {
            InitializeComponent();
        }
        DbEntityUrunEntities1 db=new DbEntityUrunEntities1();
        
        private void BtnListele_Click(object sender, EventArgs e)
        {
            dataGridView1.DataSource = (from x in db.TBLURUN
                                        select new
                                        {
                                            x.URUNID,
                                            x.URUNAD,
                                            x.MARKA,
                                            x.STOK,
                                            x.FIYAT,
                                            x.TBLKATAGORI.AD,
                                            x.DURUM
                                        }).ToList();

        }

        private void BtnEkle_Click(object sender, EventArgs e)
        {
            TBLURUN t=new TBLURUN ();
            t.URUNAD=TxtUrunAdi.Text;
            t.MARKA = TxtMarka.Text;
            t.STOK = short.Parse(TxtStok.Text);
            t.KATEGORI = int.Parse(CmbKategori.SelectedValue.ToString());
            t.FIYAT = decimal.Parse(TxtFiyat.Text);
            t.DURUM = true;
            db.TBLURUN.Add (t);
            db.SaveChanges();
            MessageBox.Show("ÜRÜN SİSTEME KAYDEDİLDİ");
        }

        private void BtnSil_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(TxtID.Text);
            var urun = db.TBLURUN.Find(x);
            db.TBLURUN.Remove(urun);
            db.SaveChanges();
            MessageBox.Show("ürün silindi");
        }

        private void BtnGuncelle_Click(object sender, EventArgs e)
        {
            int x = Convert.ToInt32(TxtID.Text);
            var urun = db.TBLURUN.Find(x);
            urun.URUNAD = TxtUrunAdi.Text;
            urun.STOK=short.Parse(TxtStok.Text);
            urun.MARKA=TxtMarka.Text;
            urun.FIYAT =decimal.Parse( TxtFiyat.Text);
            db.SaveChanges();
            MessageBox.Show("Ürün Günellendi");

        }

        private void FrmUrun_Load(object sender, EventArgs e)
        {
            var kategoriler = (from x in db.TBLKATAGORI
                               select new
                               {
                                   x.ID,
                                   x.AD

                               }
                               ).ToList();
            CmbKategori.ValueMember = "ID";
            CmbKategori.DisplayMember = "AD";
            CmbKategori.DataSource = kategoriler;
        }

        private void BtnTemizle_Click(object sender, EventArgs e)
        {
            TxtUrunAdi.Text = CmbKategori.SelectedValue.ToString();
        }
    }
}
