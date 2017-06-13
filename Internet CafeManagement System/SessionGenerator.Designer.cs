namespace Internet_CafeManagement_System
{
    partial class SessionGenerator
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btn_generateCode = new MetroFramework.Controls.MetroButton();
            this.btn_exit = new MetroFramework.Controls.MetroButton();
            this.SuspendLayout();
            // 
            // btn_generateCode
            // 
            this.btn_generateCode.FontSize = MetroFramework.MetroButtonSize.Medium;
            this.btn_generateCode.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_generateCode.Location = new System.Drawing.Point(23, 64);
            this.btn_generateCode.Name = "btn_generateCode";
            this.btn_generateCode.Size = new System.Drawing.Size(200, 97);
            this.btn_generateCode.TabIndex = 0;
            this.btn_generateCode.Text = "&Generate";
            this.btn_generateCode.UseSelectable = true;
            this.btn_generateCode.Click += new System.EventHandler(this.btn_generateCode_Click);
            // 
            // btn_exit
            // 
            this.btn_exit.FontSize = MetroFramework.MetroButtonSize.Medium;
            this.btn_exit.ForeColor = System.Drawing.SystemColors.ControlText;
            this.btn_exit.Location = new System.Drawing.Point(229, 64);
            this.btn_exit.Name = "btn_exit";
            this.btn_exit.Size = new System.Drawing.Size(200, 97);
            this.btn_exit.TabIndex = 1;
            this.btn_exit.Text = "&Exit";
            this.btn_exit.UseSelectable = true;
            this.btn_exit.Click += new System.EventHandler(this.btn_exit_Click);
            // 
            // SessionGenerator
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BorderStyle = MetroFramework.Forms.MetroFormBorderStyle.FixedSingle;
            this.ClientSize = new System.Drawing.Size(452, 214);
            this.Controls.Add(this.btn_exit);
            this.Controls.Add(this.btn_generateCode);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "SessionGenerator";
            this.Text = "Generate Session";
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroButton btn_generateCode;
        private MetroFramework.Controls.MetroButton btn_exit;
    }
}