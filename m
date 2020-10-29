Content-Type: multipart/mixed; boundary="===============8626081036465960761=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH 1/3] fbcon: Disable accelerated scrolling
Date: Thu, 29 Oct 2020 20:42:34 +0800
Message-ID: <202010292041.qMkMzT2E-lkp@intel.com>
In-Reply-To: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8626081036465960761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next tegr=
a-drm/drm/tegra/for-next linus/master drm/drm-next v5.10-rc1 next-20201028]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/fbcon-Disabl=
e-accelerated-scrolling/20201029-181618
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: sparc64-randconfig-r005-20201029 (attached as .config)
compiler: sparc64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b457f0ea024ca7202fa63f5a9=
4f9d5abf65529f8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Vetter/fbcon-Disable-accele=
rated-scrolling/20201029-181618
        git checkout b457f0ea024ca7202fa63f5a94f9d5abf65529f8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dsparc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_init':
>> drivers/video/fbdev/core/fbcon.c:1089:6: warning: variable 'cap' set but=
 not used [-Wunused-but-set-variable]
    1089 |  int cap, ret;
         |      ^~~
   drivers/video/fbdev/core/fbcon.c: In function 'fbcon_exit':
   drivers/video/fbdev/core/fbcon.c:3646:7: warning: variable 'pending' set=
 but not used [-Wunused-but-set-variable]
    3646 |   int pending =3D 0;
         |       ^~~~~~~

vim +/cap +1089 drivers/video/fbdev/core/fbcon.c

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1080  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1081  static void fbcon_init(struct vc_data *vc, int init)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1082  {
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1083  	struct fb_info *info;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1084  	struct fbcon_ops *ops;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1085  	struct vc_data **default_mode =3D vc->vc_display_fg;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1086  	struct vc_data *svc =3D *default_mode;
50233393f0cf9b drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1087  	struct fbcon_display *t, *p =3D &fb_display[vc->vc_num];
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1088  	int logo =3D 1, new_rows, new_cols, rows, cols, charcnt =
=3D 256;
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22 @1089  	int cap, ret;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1090  =

1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1091  	if (WARN_ON(info_idx =3D=3D -1))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1092  	    return;
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2=
005-05-01  1093  =

1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1094  	if (con2fb_map[vc->vc_num] =3D=3D -1)
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1095  		con2fb_map[vc->vc_num] =3D info_idx;
1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1096  =

1f4ed2fb01f80f drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
019-05-28  1097  	info =3D registered_fb[con2fb_map[vc->vc_num]];
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2=
005-05-01  1098  	cap =3D info->flags;
306958e8e8d150 drivers/video/console/fbcon.c    Adrian Bunk               2=
005-05-01  1099  =

3c5a1b111373e6 drivers/video/fbdev/core/fbcon.c Andreas Schwab            2=
019-05-06  1100  	if (logo_shown < 0 && console_loglevel <=3D CONSOLE_LOGLE=
VEL_QUIET)
10993504d64735 drivers/video/fbdev/core/fbcon.c Prarit Bhargava           2=
019-02-08  1101  		logo_shown =3D FBCON_LOGO_DONTSHOW;
10993504d64735 drivers/video/fbdev/core/fbcon.c Prarit Bhargava           2=
019-02-08  1102  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1103  	if (vc !=3D svc || logo_shown =3D=3D FBCON_LOGO_DONTSHOW =
||
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1104  	    (info->fix.type =3D=3D FB_TYPE_TEXT))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1105  		logo =3D 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1106  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1107  	if (var_to_display(p, &info->var, info))
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1108  		return;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1109  =

d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-07-17  1110  	if (!info->fbcon_par)
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-07-17  1111  		con2fb_acquire_newinfo(vc, info, vc->vc_num, -1);
d1baa4ffa677bf drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-07-17  1112  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1113  	/* If we are not the first console on this
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1114  	   fb, copy the font from that console */
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1115  	t =3D &fb_display[fg_console];
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1116  	if (!p->fontdata) {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1117  		if (t->fontdata) {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1118  			struct vc_data *fvc =3D vc_cons[fg_console].d;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1119  =

e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1120  			vc->vc_font.data =3D (void *)(p->fontdata =3D
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1121  						    fvc->vc_font.data);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1122  			vc->vc_font.width =3D fvc->vc_font.width;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1123  			vc->vc_font.height =3D fvc->vc_font.height;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1124  			p->userfont =3D t->userfont;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1125  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1126  			if (p->userfont)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1127  				REFCOUNT(p->fontdata)++;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1128  		} else {
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1129  			const struct font_desc *font =3D NULL;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1130  =

e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1131  			if (!fontname[0] || !(font =3D find_font(fontname)))
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1132  				font =3D get_default_font(info->var.xres,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-05-08  1133  							info->var.yres,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-05-08  1134  							info->pixmap.blit_x,
2d2699d9849248 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
007-05-08  1135  							info->pixmap.blit_y);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1136  			vc->vc_font.width =3D font->width;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1137  			vc->vc_font.height =3D font->height;
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1138  			vc->vc_font.data =3D (void *)(p->fontdata =3D font->dat=
a);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1139  			vc->vc_font.charcount =3D 256; /* FIXME  Need to
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1140  							support more fonts */
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1141  		}
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1142  	}
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1143  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1144  	if (p->userfont)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1145  		charcnt =3D FNTCHARCNT(p->fontdata);
e614b18dcedb24 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-06-26  1146  =

b8c909454f046b drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-09-09  1147  	vc->vc_can_do_color =3D (fb_get_color_depth(&info->var, &=
info->fix)!=3D1);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1148  	vc->vc_complement_mask =3D vc->vc_can_do_color ? 0x7700 :=
 0x0800;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1149  	if (charcnt =3D=3D 256) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1150  		vc->vc_hi_font_mask =3D 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1151  	} else {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1152  		vc->vc_hi_font_mask =3D 0x100;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1153  		if (vc->vc_can_do_color)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1154  			vc->vc_complement_mask <<=3D 1;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1155  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1156  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1157  	if (!*svc->vc_uni_pagedir_loc)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1158  		con_set_default_unimap(svc);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1159  	if (!*vc->vc_uni_pagedir_loc)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1160  		con_copy_unimap(vc, svc);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1161  =

e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1162  	ops =3D info->fbcon_par;
f235f664a8afab drivers/video/console/fbcon.c    Scot Doyle                2=
015-10-09  1163  	ops->cur_blink_jiffies =3D msecs_to_jiffies(vc->vc_cur_bl=
ink_ms);
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1164  =

2428e59b530928 drivers/video/console/fbcon.c    Marcin Slusarz            2=
008-02-06  1165  	p->con_rotate =3D initial_rotation;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1166  	if (p->con_rotate =3D=3D -1)
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1167  		p->con_rotate =3D info->fbcon_rotate_hint;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1168  	if (p->con_rotate =3D=3D -1)
f2f4946b0adfd6 drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1169  		p->con_rotate =3D FB_ROTATE_UR;
c9e6a36492504e drivers/video/fbdev/core/fbcon.c Hans de Goede             2=
017-11-25  1170  =

b73deed32d0874 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-01-09  1171  	set_blitting_type(vc, info);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1172  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1173  	cols =3D vc->vc_cols;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1174  	rows =3D vc->vc_rows;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1175  	new_cols =3D FBCON_SWAP(ops->rotate, info->var.xres, info=
->var.yres);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1176  	new_rows =3D FBCON_SWAP(ops->rotate, info->var.yres, info=
->var.xres);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1177  	new_cols /=3D vc->vc_font.width;
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1178  	new_rows /=3D vc->vc_font.height;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1179  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1180  	/*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1181  	 * We must always set the mode. The mode of the previous =
console
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1182  	 * driver could be in the same resolution but we are usin=
g different
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1183  	 * hardware so we have to initialize the hardware.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1184  	 *
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1185  	 * We need to do it in fbcon_init() to prevent screen cor=
ruption.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1186  	 */
6ca8dfd78187d8 drivers/video/console/fbcon.c    Jiri Slaby                2=
016-06-23  1187  	if (con_is_visible(vc) && vc->vc_mode =3D=3D KD_TEXT) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1188  		if (info->fbops->fb_set_par &&
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1189  		    !(ops->flags & FBCON_FLAGS_INIT)) {
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1190  			ret =3D info->fbops->fb_set_par(info);
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1191  =

0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1192  			if (ret)
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1193  				printk(KERN_ERR "fbcon_init: detected "
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1194  					"unhandled fb_set_par error, "
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1195  					"error code %d\n", ret);
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1196  		}
0fcf6ada2b8eb4 drivers/video/console/fbcon.c    Florian Tobias Schandinat 2=
009-09-22  1197  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1198  		ops->flags |=3D FBCON_FLAGS_INIT;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1199  	}
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1200  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1201  	ops->graphics =3D 0;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1202  =

b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
020-10-29  1203  	/*
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
020-10-29  1204  	 * No more hw acceleration for fbcon.
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
020-10-29  1205  	 *
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
020-10-29  1206  	 * FIXME: Garbage collect all the now dead code after suf=
ficient time
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
020-10-29  1207  	 * has passed.
b457f0ea024ca7 drivers/video/fbdev/core/fbcon.c Daniel Vetter             2=
020-10-29  1208  	 */
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1209  	p->scrollmode =3D SCROLL_REDRAW;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1210  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1211  	/*
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1212  	 *  ++guenther: console.c:vc_allocate() relies on initial=
izing
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1213  	 *  vc_{cols,rows}, but we must not set those if we are o=
nly
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1214  	 *  resizing the console.
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1215  	 */
0035fe00f77d2b drivers/video/console/fbcon.c    Johannes Weiner           2=
009-08-06  1216  	if (init) {
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1217  		vc->vc_cols =3D new_cols;
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1218  		vc->vc_rows =3D new_rows;
0035fe00f77d2b drivers/video/console/fbcon.c    Johannes Weiner           2=
009-08-06  1219  	} else
0035fe00f77d2b drivers/video/console/fbcon.c    Johannes Weiner           2=
009-08-06  1220  		vc_resize(vc, new_cols, new_rows);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1221  =

^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1222  	if (logo)
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1223  		fbcon_prepare_logo(vc, info, cols, rows, new_cols, new_r=
ows);
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1224  =

4d9c5b6eb42d9e drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-07  1225  	if (vc =3D=3D svc && softback_buf)
4d9c5b6eb42d9e drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-07  1226  		fbcon_update_softback(vc);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1227  =

b73deed32d0874 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-01-09  1228  	if (ops->rotate_font && ops->rotate_font(info, vc)) {
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1229  		ops->rotate =3D FB_ROTATE_UR;
b73deed32d0874 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-01-09  1230  		set_blitting_type(vc, info);
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1231  	}
e4fc27618b7523 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
005-11-08  1232  =

1a37d5f51020b9 drivers/video/console/fbcon.c    Antonino A. Daplas        2=
006-03-31  1233  	ops->p =3D &fb_display[fg_console];
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1234  }
^1da177e4c3f41 drivers/video/console/fbcon.c    Linus Torvalds            2=
005-04-16  1235  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8626081036465960761==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8626081036465960761==--

