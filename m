Content-Type: multipart/mixed; boundary="===============2572866469214110657=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:xlnx_rebase_v5.4 253/1296] drivers/gpu/drm/xlnx/xlnx_scaler.c:868:4: warning: Uninitialized variable: nr_rds [uninitvar]
Date: Fri, 08 May 2020 23:46:37 +0800
Message-ID: <202005082353.EBWsReQQ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2572866469214110657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   0b197959bbbdb68e1da974bd013339f08704b178
commit: d8f499927fa09de02d76a3af3c49afb3eb92797d [253/1296] drm: xlnx: scal=
er: Adding vpss-scaler driver

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/xlnx/xlnx_scaler.c:868:4: warning: Uninitialized variabl=
e: nr_rds [uninitvar]
      nr_rds -=3D nppc;
      ^

vim +868 drivers/gpu/drm/xlnx/xlnx_scaler.c

   800	=

   801	/**
   802	 * xv_hscaler_calculate_phases - Calculates h-scaler phases
   803	 * @scaler: Pointer to scaler registers base
   804	 * @width_in: input width
   805	 * @width_out: output width
   806	 * @pixel_rate: pixel rate
   807	 *
   808	 */
   809	static void
   810	xv_hscaler_calculate_phases(struct xilinx_scaler *scaler,
   811				    u32 width_in, u32 width_out, u32 pixel_rate)
   812	{
   813		unsigned int loop_width;
   814		unsigned int x, s;
   815		int offset =3D 0;
   816		int xwrite_pos =3D 0;
   817		bool output_write_en;
   818		bool get_new_pix;
   819		u64 phaseH;
   820		u32 array_idx =3D 0;
   821		int nr_rds;
   822		int nr_rds_clck;
   823		unsigned int nphases =3D scaler->max_num_phases;
   824		unsigned int nppc =3D scaler->pix_per_clk;
   825		unsigned int shift =3D XHSC_STEP_PRECISION_SHIFT - ilog2(nphases);
   826	=

   827		loop_width =3D max_t(u32, width_in, width_out);
   828		loop_width =3D ALIGN(loop_width + nppc - 1, nppc);
   829	=

   830		for (x =3D 0; x < loop_width; x++) {
   831			nr_rds_clck =3D 0;
   832			for (s =3D 0; s < nppc; s++) {
   833				phaseH =3D (offset >> shift) & (nphases - 1);
   834				get_new_pix =3D false;
   835				output_write_en =3D false;
   836				if ((offset >> XHSC_STEP_PRECISION_SHIFT) !=3D 0) {
   837					get_new_pix =3D true;
   838					offset -=3D (1 << XHSC_STEP_PRECISION_SHIFT);
   839					array_idx++;
   840				}
   841	=

   842				if (((offset >> XHSC_STEP_PRECISION_SHIFT) =3D=3D 0) &&
   843				    xwrite_pos < width_out) {
   844					offset +=3D pixel_rate;
   845					output_write_en =3D true;
   846					xwrite_pos++;
   847				}
   848	=

   849				scaler->H_phases[x] |=3D (phaseH <<
   850							(s * XHSC_HPHASE_MULTIPLIER));
   851				scaler->H_phases[x] |=3D (array_idx <<
   852							(XHSC_HPHASE_SHIFT_BY_6 +
   853							(s * XHSC_HPHASE_MULTIPLIER)));
   854				if (output_write_en) {
   855					scaler->H_phases[x] |=3D
   856					(XV_HSCALER_PHASESH_V_OUTPUT_WR_EN <<
   857					(s * XHSC_HPHASE_MULTIPLIER));
   858				}
   859	=

   860				if (get_new_pix)
   861					nr_rds_clck++;
   862			}
   863			if (array_idx >=3D nppc)
   864				array_idx &=3D (nppc - 1);
   865	=

   866			nr_rds +=3D nr_rds_clck;
   867			if (nr_rds >=3D nppc)
 > 868				nr_rds -=3D nppc;
   869		}
   870	}
   871	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2572866469214110657==--

