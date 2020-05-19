Content-Type: multipart/mixed; boundary="===============4877620735365943263=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/tty/vt/vt.c:1210:22: warning: comparison is always false due to limited range of data type
Date: Tue, 19 May 2020 10:33:49 +0800
Message-ID: <202005191047.9S9G4sqQ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4877620735365943263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   642b151f45dd54809ea00ecd3976a56c1ec9b53d
commit: 2717769e204e83e65b8819c5e2ef3e5b6639b270 vt: don't hardcode the mem=
 allocation upper bound
date:   4 weeks ago
config: ia64-defconfig (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 2717769e204e83e65b8819c5e2ef3e5b6639b270
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dia64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/tty/vt/vt.c: In function 'vc_do_resize':
>> drivers/tty/vt/vt.c:1210:22: warning: comparison is always false due to =
limited range of data type [-Wtype-limits]
1210 |  if (new_screen_size > KMALLOC_MAX_SIZE)
|                      ^

vim +1210 drivers/tty/vt/vt.c

  1163	=

  1164	/**
  1165	 *	vc_do_resize	-	resizing method for the tty
  1166	 *	@tty: tty being resized
  1167	 *	@real_tty: real tty (different to tty if a pty/tty pair)
  1168	 *	@vc: virtual console private data
  1169	 *	@cols: columns
  1170	 *	@lines: lines
  1171	 *
  1172	 *	Resize a virtual console, clipping according to the actual constr=
aints.
  1173	 *	If the caller passes a tty structure then update the termios wins=
ize
  1174	 *	information and perform any necessary signal handling.
  1175	 *
  1176	 *	Caller must hold the console semaphore. Takes the termios rwsem a=
nd
  1177	 *	ctrl_lock of the tty IFF a tty is passed.
  1178	 */
  1179	=

  1180	static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
  1181					unsigned int cols, unsigned int lines)
  1182	{
  1183		unsigned long old_origin, new_origin, new_scr_end, rlth, rrem, err =
=3D 0;
  1184		unsigned long end;
  1185		unsigned int old_rows, old_row_size, first_copied_row;
  1186		unsigned int new_cols, new_rows, new_row_size, new_screen_size;
  1187		unsigned int user;
  1188		unsigned short *newscreen;
  1189		struct uni_screen *new_uniscr =3D NULL;
  1190	=

  1191		WARN_CONSOLE_UNLOCKED();
  1192	=

  1193		if (!vc)
  1194			return -ENXIO;
  1195	=

  1196		user =3D vc->vc_resize_user;
  1197		vc->vc_resize_user =3D 0;
  1198	=

  1199		if (cols > VC_RESIZE_MAXCOL || lines > VC_RESIZE_MAXROW)
  1200			return -EINVAL;
  1201	=

  1202		new_cols =3D (cols ? cols : vc->vc_cols);
  1203		new_rows =3D (lines ? lines : vc->vc_rows);
  1204		new_row_size =3D new_cols << 1;
  1205		new_screen_size =3D new_row_size * new_rows;
  1206	=

  1207		if (new_cols =3D=3D vc->vc_cols && new_rows =3D=3D vc->vc_rows)
  1208			return 0;
  1209	=

> 1210		if (new_screen_size > KMALLOC_MAX_SIZE)
  1211			return -EINVAL;
  1212		newscreen =3D kzalloc(new_screen_size, GFP_USER);
  1213		if (!newscreen)
  1214			return -ENOMEM;
  1215	=

  1216		if (get_vc_uniscr(vc)) {
  1217			new_uniscr =3D vc_uniscr_alloc(new_cols, new_rows);
  1218			if (!new_uniscr) {
  1219				kfree(newscreen);
  1220				return -ENOMEM;
  1221			}
  1222		}
  1223	=

  1224		if (vc_is_sel(vc))
  1225			clear_selection();
  1226	=

  1227		old_rows =3D vc->vc_rows;
  1228		old_row_size =3D vc->vc_size_row;
  1229	=

  1230		err =3D resize_screen(vc, new_cols, new_rows, user);
  1231		if (err) {
  1232			kfree(newscreen);
  1233			kfree(new_uniscr);
  1234			return err;
  1235		}
  1236	=

  1237		vc->vc_rows =3D new_rows;
  1238		vc->vc_cols =3D new_cols;
  1239		vc->vc_size_row =3D new_row_size;
  1240		vc->vc_screenbuf_size =3D new_screen_size;
  1241	=

  1242		rlth =3D min(old_row_size, new_row_size);
  1243		rrem =3D new_row_size - rlth;
  1244		old_origin =3D vc->vc_origin;
  1245		new_origin =3D (long) newscreen;
  1246		new_scr_end =3D new_origin + new_screen_size;
  1247	=

  1248		if (vc->vc_y > new_rows) {
  1249			if (old_rows - vc->vc_y < new_rows) {
  1250				/*
  1251				 * Cursor near the bottom, copy contents from the
  1252				 * bottom of buffer
  1253				 */
  1254				first_copied_row =3D (old_rows - new_rows);
  1255			} else {
  1256				/*
  1257				 * Cursor is in no man's land, copy 1/2 screenful
  1258				 * from the top and bottom of cursor position
  1259				 */
  1260				first_copied_row =3D (vc->vc_y - new_rows/2);
  1261			}
  1262			old_origin +=3D first_copied_row * old_row_size;
  1263		} else
  1264			first_copied_row =3D 0;
  1265		end =3D old_origin + old_row_size * min(old_rows, new_rows);
  1266	=

  1267		vc_uniscr_copy_area(new_uniscr, new_cols, new_rows,
  1268				    get_vc_uniscr(vc), rlth/2, first_copied_row,
  1269				    min(old_rows, new_rows));
  1270		vc_uniscr_set(vc, new_uniscr);
  1271	=

  1272		update_attr(vc);
  1273	=

  1274		while (old_origin < end) {
  1275			scr_memcpyw((unsigned short *) new_origin,
  1276				    (unsigned short *) old_origin, rlth);
  1277			if (rrem)
  1278				scr_memsetw((void *)(new_origin + rlth),
  1279					    vc->vc_video_erase_char, rrem);
  1280			old_origin +=3D old_row_size;
  1281			new_origin +=3D new_row_size;
  1282		}
  1283		if (new_scr_end > new_origin)
  1284			scr_memsetw((void *)new_origin, vc->vc_video_erase_char,
  1285				    new_scr_end - new_origin);
  1286		kfree(vc->vc_screenbuf);
  1287		vc->vc_screenbuf =3D newscreen;
  1288		vc->vc_screenbuf_size =3D new_screen_size;
  1289		set_origin(vc);
  1290	=

  1291		/* do part of a reset_terminal() */
  1292		vc->vc_top =3D 0;
  1293		vc->vc_bottom =3D vc->vc_rows;
  1294		gotoxy(vc, vc->vc_x, vc->vc_y);
  1295		save_cur(vc);
  1296	=

  1297		if (tty) {
  1298			/* Rewrite the requested winsize data with the actual
  1299			   resulting sizes */
  1300			struct winsize ws;
  1301			memset(&ws, 0, sizeof(ws));
  1302			ws.ws_row =3D vc->vc_rows;
  1303			ws.ws_col =3D vc->vc_cols;
  1304			ws.ws_ypixel =3D vc->vc_scan_lines;
  1305			tty_do_resize(tty, &ws);
  1306		}
  1307	=

  1308		if (con_is_visible(vc))
  1309			update_screen(vc);
  1310		vt_event_post(VT_EVENT_RESIZE, vc->vc_num, vc->vc_num);
  1311		notify_update(vc);
  1312		return err;
  1313	}
  1314	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4877620735365943263==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICOFDw14AAy5jb25maWcAlFxbc+M2sn7Pr2AlVaeSqp1Elj0e+5yaBxAEJax4GwCU5XlheWzN
RBWP5ZLkTfLvTzfAC0CCVHYrm4joBgg0Gt1fN5r+6YefAvJ22n9/OO0eH56f/w6+bV+2h4fT9in4
unve/l8Q5UGWq4BFXP0KzMnu5e2v33YP11fB+18//Dp7d3i8CFbbw8v2OaD7l6+7b2/Qe7d/+eGn
H+Cfn6Dx+ysMdPjfADu9e8b+7749PgY/Lyj9Jbj99fLXGTDSPIv5oqK04rICyse/myZ4qNZMSJ5n
H29nl7NZQ0iitn1+eTXT/2vHSUi2aMkza/glkRWRabXIVd69xCLwLOEZG5DuiMiqlNyHrCoznnHF
ScI/s6hj5OJTdZeLFbTolS+0JJ+D4/b09totEftWLFtXRMAaeMrVx8s5Cqp+XZ4WPGGVYlIFu2Pw
sj/hCO2ic0qSZl0//uhrrkhpLy0sOUhKkkRZ/BGLSZmoaplLlZGUffzx55f9y/aXlkHekaIbQ97L
NS/ooAH/S1XStRe55Jsq/VSykvlbB12oyKWsUpbm4r4iShG6BGIrj1KyhIe2JFoSKUEpPTJakjUD
6dKl4cAXkiRptgW2KTi+fTn+fTxtv3fbsmAZE5zqXUzYgtB7SwUtWiHykPlJcpnfDSkFyyKeafVw
dSXKU8IzX1u15EzgAjxzSCV3h+oRumF/CrYvT8H+a2/FTT8tIAqKs5J5KSirIqLIcFjFU1atOxk2
WyoYSwtVZbk+K+2eNO3rPCkzRcS9d+dqLptmjEVR/qYejn8Ep933bfAA0z+eHk7H4OHxcf/2ctq9
fOs2THG6qqBDRSjN4V0gY3siay5Uj1xlRPE1885I0iWLKrVkIiUJzk/KUvhZQxmhFlBgwcGVl0kR
uZKKKOlfv+Rue71T/2D97bGBpXGZJ7CkPGt0W9AykEPdViDuCmi2fOCxYpuCCd8JkobZ7u42YW9Y
XpKgvUrzzKVkDGQp2YKGCZfKVkV3gq3mr8wP6yysWk3JqT1tvloyEoGh89pGtHYxnEMeq4/zmd2O
4krJxqJfzDtd5plagYmMWW+Mi0vHppQZrDkE42y0RR+eRvTy8fft0xs4uuDr9uH0dtgedXO9bg+1
519gChfzG8ssLkReFtJeO9hIuvCrZLKqO3jJhmRmPcVQ8MivrzVdRCmZosegKJ+ZmGJZlgumktCz
e7BDkilpm5ic4pRqii2JerCIrTn1H9KaA7qOHtF2kLBceOaDblEWBI55N6VSySqzntEFZrLnrgQ0
ecbDldh9M6Z6fWF76KrIQRMqsD8qH7E/RvnQyY/vONjrWMLSwJBRokZ2XbCE3HtmitoEotVIRdgA
B59JCgMbj2HhCRFVi8/cQgzQEELD3GlJPqfEadh87tHz3vOVLZ8wz8Gk698+/aFVXoC3AlBWxbkA
vyvgPynJqOOg+mwSfvgsYA+lmGfjNMsMoN8iA9+nUaEFtYrYftWoeU0BenHUFGd8lGvfzcZLkkXJ
AEqhUxbOUUELZmM+y5ayJAapCWuQkEhYfOm8qFRs03sElbVGKXKbX4IASBJb2qHnZDewNcuU3SCX
YMG6R8Kt3eZ5VQrjwhtytOaSNSKxFguDhEQIbotvhSz3qRy2VEaenRIVcTOm91DgtmhsHPsPDbyc
RZF7orSlr4OgYnv4uj98f3h53AbsP9sX8N4EfABF/709OE7hH/ZoVrROjUgrjWec/ZdJGRpDZjkQ
CCSIqkIdkHSGISE+44sD2MOREMQsFqwJFPpDaFOPzr0SoKB56jdCDuOSiAgwpV+qclnGMTjWgsA7
YWsgnAH7NzJR7cwLIjAEc7FnHnMI3hZebOWGY+3JWRiPnoBoQckuzV4Wh/3j9njcH4LT368GiFle
vVFZcn3Vyez6KuSqe/wMuLgCd3lpWcA0tRAUIAm6AnMKwFuWRZELq3PtJI000EBVayI4znOIz0GR
eSjAxsNWgTm3BkHEAn4T/Tr4JA2FBbPsb5Taxzu2HoyHySE0he0DN1hpp2SfN1w72EFKjC9qNsw6
vdpQSiZBwi2jRcbATDM54E6RjJepz2LSFcTl7N7hxjl0Irpa+aPEHtvNP2O7uF75zkmP6xpeak9p
+bm6mM18Iennav5+1mO9dFl7o/iH+QjDOJNJLiot3BqxfuitSC54Va7HVrIEUBgSML6OamoSvQd4
a+dBwFmCriKGRt3O4TCLjxcfWpVJLeefaXWTH69mt9ft1HNVJKWGeT0tYZk+gXUGoOY7xyPg19px
7EZpZeoHe3AEUJ1DCShWd/WIRL9JsoRR1bwpzeFU9eYScQmPii+Ap55YjyOGqGyUCJhSSDZKdkbv
rG8j2dJGUBnMTjahSqsWGPmWEMTiAKmdxVnmCcNAQ29gz1Dod+N4mAUA5KJYJrkd18FZRiGiGcFJ
aN6KR71hjNgSDI315HqL05B+hWCkAnyheiqXUgKbQ2FzxH2PVICVy+J8cPxTWjEhYE3/ZiMoX7Ox
frzdOwQkTaosvvPoxIptmJX3ooJI2KNSa7t2FfHu8P3Ph8M2iA67/xgH35nUqqBR4VhcLbH2/dBg
kJ/nzZpGCSYd6ZKDN8nyTI8Zg7kNCXXcOigNpn/C2C+ERZ4v4PjEXKSAWNkAu8Cwwc/sr9P25bj7
8rztFsURgnx9eNz+AmH76+v+cHLXB37JCWGwDWF6kmOQjmBdidwPtJCVkkKW6H01+yhbPxfqEOHA
aNtQUF4N4tPa9/8369MCUdtvh4fga8P2pPfWxm4jDA15qBUNZQpaGOyx/3N7CAAOPnzbfgc0qFkI
LXiwf8XEuoGQjVnzOUtjZgyowBSVDeN7T8iZ8sVS1VYAqFURUZcfVVSBMSnyO9hTzGqh1WlBS5eP
RV6NQhcjm2lGK6ioNOoa52HUDOQ9GZqD9CcZEqUcw2FaS6XAjH3vja94dl+vx3CMvSYm2NlZoEn6
2E1oFAHnfqoKKXukOlEIgSbVghslcyfMc4m9GfhdqV6WyV8OljvIcbhkPDoyyX2hqlkfHGMCJkgM
druXULJJtavq8adkxD+nHANzwRbc3Qy3v/kdS+8pP39yWjgpC7Dq3917mofD4++70/YRz+K7p+0r
jIqDdKfO8QFuRK3dRK9Nn6jcBCUOUlnpOwSfZusuNbk30Eow5SXoM6wDiWWeW5rZBAiAzLRygXIA
/I96hx/z1HCkRQmYB/yLjkomWMaQvhnbdPcxmZnKFAFVfU3VxwaaJUOnh3lYmhYburTDWZMm1W8A
OSjw93BqsiGS8ST+z3OgtPpQJo8awMYoj7llb4BUIpRCTITZFUyk9XqzDaDNVuLO7R4E5ZfzEMk8
HbriBeCfd18ejtun4A+TH3g97L/uns3dRxfNTrH1Q94zmt1m3AD2Yt7HVjGdKpIpJlFmveU7qWnd
VMcI6M19MZzhKTOkj3Y2ZK8FsHRnjI7jSEHbm9CRJE/Dyf1GsSbjZuFF0BQP6voduFApzQVTnTOu
eKq9rz/FlIHiwGG5T8M88bMowdOGb4VpLG+a1vFEmLXVKBAcUcmkcimYzw3lwtuYcCeI7dK/ii0E
V/4rvIYLYwn/dulLiTTC2/RKxzx+TIBsd6HfK+g1YSoC8P/gpBQPh9MONThQgKQsA61TQ0rvf7TG
/G/k+qFcZB2P39fwzRmOXMbnxgBcRc7xKCL4GR6A/36O1pdFuew4nJ2UEcLjVUJCNnIQeAZLlWU4
PQe8ZxRcVpub6zOzLWE8DDHOvDeJ0slFYdrCuySIhsXZzZHluQ1eEcBJkzPQ0ZtvBlj6cH1zZnxL
731cDWDpabB9NtNPCMvc8wpteAXXhJ487+4VLfUHLp6bbEgE7setZrGIq/vQRXQNIYw/eafrvq+N
z3W9DHhJnmnjDQDALXUwdI0PDH2K5u17B1aIjXW2iXVvE9P+tX18Oz1guIeVTIHOsZ8sOYU8i1OF
Dty5K3FBnM5VYLzflsygw6/voK3dMWNJKnihBs3gHmiH4XHIOoPQBagjk9UrSbff94e/g7QDtgNM
6s9atTvbJKRSkpWuJW2SDXbWyXA5Ot/mrP7RCFbSEF5sUkWDbJQuEtA3YUXC+tmi7oVr+Bf0GyTL
mnST9oL1K5ySpSIBiFUoTTbZSOdmhPbPtc7qCoZuu3eF0NrKhWiqLZo+y3sIsKMI4tn+BYAGmSqH
8NIBSivpi9gb3dIrBZusxzTp086kJIyYPLrX4sQCpI9VWyP2yH9x/7nIR9Izn8PS79Y/azSYU39C
LWoucTAiWQ3uYhq5mUTieIHMoiyqkGUU4kWx8hqj8UPRKZhqbEG2Pf25P/wB4Hh4dEAVVm51gWkB
jSY+NUAPZ6VFtf+kqeOjsK3fu4N2I5BvE4tU3z56qVgtsGJ+KCZT6pknN+tvngpz1iiRzlqhvQFJ
lcgB/ftfD2xF5lctnBkv+BRxgTaUpeVmbOxUv9p7DZ/Bcc1X3A03zLBr5c/qIjXOS//LkEiW4zTA
7+NEXqDtGBG23nLbPUGTokXT7I5URsW4imgOQe7OcCAV5Aqhee5XDHw7/Fy0W+yZectDy9COcRuT
1NA//vj49mX3+KM7ehq9HwuiYH+u/ZizgJ5jG4cFtODNaP/cW1tbqALreyHiiu97SqF7g1HWoTVY
l7QYs0DAHPNkTN3DYoII+hrRkRVwrLJSfpoYKa4CB+g3puCz/eB5PvKGUPBo4TtGJreCKiNJ/xxB
k3ewdUKy6mY2v/jkJUeMQm///BI6Hwt3kpWXspm/9w9FCv91bbHMx17PGWM47/dXo9ZhvBIuor5r
3yiTWJKVY4m1nVwNYYuIDjP9QWLBsrW844r6Dc5a5uhp/GoB8wR8uxq3AWkx4klMZZn/lUs57l/M
TCGoH+VILgFkSTgY1RRXRt3rtkb/CwvgiVgXz9qXqxu32rEuz9MnXkDo4YU1HY+xCD4Lp40pVn5K
TPnbRUzhp8TGo+A1MJljavJd5BCctsdTk4KzbdFKLZg/uBv07BFsMGLtD0kFicaWS/zR5kj2hMSw
bjFmXOJqRX1Y9I4Lhhe4zl7ECzxRF4McTEt42W6fjsFpH3zZwjoxkHnCICZICdUMVnhatyD6w5Tu
UtcUYDnFx1n3xjsOrX4zGq/4SFoPd+R2BAATHvsJrFhWY18YZLFfeIUE1zJyf6VxQuynJXeqzLKR
nEhMeIJ3375khFoqAOqNTWiUM9r+Z/fouXnW5t7JHpjcqtPUf6g/HJBuY1eR2C2ech0lwYHyTBWp
RBapM4xu8dWStTR9FyfJSHW+y4Z3j/+IuasAHWUENOE7BLj0VPYENPjCwqJ9KrlYyd7SJu7dtGxV
OeLcgMhzv4FFGtjDcRrxW0Gk6XycXQ9i7hEdTbAam8vizjj1aBUP/QjFZqTwr7NMcumaKZPghY6P
+5fTYf+MlfNPrZrXyn/cfXu5w0t2ZKR7+NHVKLibHN1VBWYi8HOnUckBYhzJ0029ymRo9l9gbrtn
JG+HU2lC1nEuM+OHpy0WgWpyt/BjcByOdZ63TTL6pdhKmL08ve53L32hVSyLdNmfP3Npd2yHOv65
Oz3+7t8zV/PvarChGB0df3w0ezBKxEh1Oyl4z5F21727x9pqBvmwqKI0ZbZLlhQjIQCgH5UW3uIE
8GpZRNzSuUKYEZv6G/NN3qCC6HkPm3rozHh8VxfGWPnJjRKkHQcL8Dv30XCbbxAmZt9x+m+4+jUs
9bza21p95YV3P04msxUNmLwqEnw9KjvNwNaC+eGrYcCan3oYT8VeFzwhG5H3GW2Y9SW5D8OnBMwM
SC3CD3xiN/WNxJiBozA36V55jCiO3sPw7Rg8aW/saFK6xAoUv3jtLl1mEtABdW7OdcmcVh/Huyyy
sXtJ5T8OeeyRSb/+p9BXTf26nrrJ51QyZ+/hsd49sKWSLNwNbiqrT/vH/bOdgMsKtyqpvlr03Ulm
ZZLgg2cuNBJ56uuDHkDKCCTDi8v5xo8qG+YyZT480JCTPC+6TL7dqtO2upzg402fTsV9ofK67+CV
kQh9Drtdchj5esnV+K2rpm9uJgYVJB3IGxvrFVxc+2gao/eS0ih0jIJotPbPB8tJEdUihp2ccE8K
Q7p0t86EZ+uU+bx+K7x1OoLSgTD+PZum9rF/E77ZrzTef3d89J1+Er2fv99U4Eb9oANMZ3qPiHIk
w0EyNfJlheJxqq2vPwFC5e3lXF7NLrxkMHNJjl+3VuAn1pyOmOFlUUE84t/TIpK3EMSRkQQEl8n8
dja7nCDO/aXvkmUyF7JSwPT+/TRPuLz48GGaRU/0duY/8suUXl++92eqInlxfeMnSTgKoxiyAU3j
Jasb/EIF4t0o7kOfZph1QTLup9F53xCbq04GXiJ1YGKz15oCh3DuT4bVdPPB+xQHROPXNx/8Sbqa
5faSbvwZ35qBR6q6uV0WTPo3pGZj7GI2u/Kevd5CLcGEHy5mgxNRl/L+9XAM+MvxdHj7rr+uOv4O
qOYpOB0eXo44TvC8e9kGT3CKd6/4063z/a97D9Uw4fKy4vORRAwmmgnixmJY44L1yc9BCurwP8Fh
+6z/Lodnm9fgf8ZwxtQQFp5g2d0nvzlhdOk3A3itDdOn+LHlSIynWYSSm3/AUUp/NLwkIclIRfz9
8fteP15zzLKTGuGRBc7NgwEnz9uH4xZG2QbR/lHvt/5bJr/tnrb4/18Px5POav2+fX79bffydR/s
XwIYwEQm9rdhEas2gDH1VbzzLrya4NlCuo3gJd1Quy3CAqIEqseXI2kRueMsosr8FYfO3LathS8p
a72HRkNIoJvx76iEOdY6CpG79f4WH7xg5O8ldDy6GNfrFFAwWGfKc6p85QXIoKFwLNvyF5D74++7
V+BqFPq3L2/fvu7+ct2wloAphp2cH2YIMF90bhG9i9Ahg4404rjVKtB8a652OO8Z3M7FmGc8OnC4
K/PJlUf4eRyHeS8M7rHU6/f2LhS/nl+cX5KZ2qA/YfT6HKomCb94v/HjgZYnjT5cueP0YXQaXV9t
fHNQgscJm57DslCX137/1LD8G6yk8FaDtTrCuXcCXN1cfPDjBYtlfjEtAs0yvYpM3ny4uvD74XaS
EZ3PYEuqPJmG1C1jxu4mGeX6buWHei0H5ylZTBsAmdDbGTuzB0qkAA8nWdac3Mzp5ozOKXpzTWez
84rdnFMsnq39xfCI6spaMOb25gvC0bAq7x8jwQ5WNRJ2j+xv93RLl8+3W3t2Ts+rnpD5aOhnQBt/
/Cs4Pbxu/xXQ6B1gol+G1kRa9pwuhWlTw+hVWt+XtHwLO+ZsW0fuMfWs4TfmvkZuMzVLki8WYxfy
mkF/76azOQMkpKWgGtB17O2MxC+CcCd6ooxp2+y+yXwwN7V54HblSGekJDyE/0wsRRTD4bu/B9Nb
zQ+umO705+iOG9eUscIJQ9V/H2PwOWFvlzaL8NLwTzNdnWMKs818gidk8wlirXqXdxUc440+SeNv
WhYjJQqaCmPcjtmChmFyp8hoCtmQCZ2eHuH0w+QEkOH2DMPt1RRDup5cQbou04mdigoF0Ycfw5v3
Y3kQKM4Eh6DpSOWApjOY39xPTyG21JYSnMzgrrzPMxGItjzTogAvf45hPn1wUyJU8WlCnmUsl//P
2LV1yWkr678yj9kPOWnoG/2QBzXQ3XIjYIC+zQtrYs+OZ+2JnWVPztn+90clQSNBleSHSdyqD0kI
XapKdYmd87XhBRGXR3XhVuGSTk/Feyd3HOI6WvebUhp0Z891HmwCR693Xew5SlBToH1CaPH0plo6
xlXFTHRMQklnARERQb9gk2LcoabdxHIeR3IrCUcnwEABHhbsalPtq6Mks4DC9tZvTEpqgzZ0hALD
BYVYLSiE4MX07CnRyCZAepRHJI/bIIxmk8ceMzbRSY7pnj07K10VJPF8s/yvYxOAt9qscU2SQlyS
dbBx7GP0fbhmfIRnqy1FNCO0mvpM2rmHKD6kWc0LiSmo2FrQy9EUN8/sEX94v0gxQyeCyjvX3FDC
zABaIMirO2jjegeKJioBKLSEbpukrDnsIvsGRTVUDkEKYuOC+P9e3z/Ll/vyqxRRH748v7/+78vD
a+8Gb8rNqhJ2oLaDnuqWmxVMLu04kEKioyI4gz2N1TyztZjG6xviNrzWx/H7fvzn+/vXvx6Uvh97
VykJyb2BuA1QrT/Wo4BEo85dqa5thSljgCoH7aGCDVyt+oAjYVM1JHCzEEXLHTRQnPKamPXd8LqI
xM6uiGdcelTEU+b4pFKSw3ZCTWrkRj2o5rwDN3xLNaGIZjVR4HuMJlYNcXhrciO/ipNeRqs1PtUV
QGsxHPQb7XSqAPJowieiojrUHHe6q3tAv4Y4mzYAcD2Gojv0HAPd0QFECWMDJH8mhSN8siqAlKpj
N4DnH9gcV9dogEPLogBFlsDqdAAkD0jtJwqgdS+uLwF7EqXBUQAwFKW4dg1IiCsmtWoJYV4TUznG
FZjTO6qXO8Yqwhm20rVp6DOvqA986xggl06vRDYPm3jh+bbIp1H6Sl78+vXL24/xXjLZQNQynZHc
sJ6J7jmgZ5FjgGCSOL7e0zgKmGW/9O/nt7c/nj/+5+G3h7eXP58//kCNrXreAG0GiC7NuHp6KpL1
AhlyXyCSQZckpDjH85RVVhEweLNJSWCqm/oyfOQ66mK5QvvUuRSy5jCqUjH0hC/7xK1u9FqJUCZb
jWn1OdDMhhJBBpRVleykPIDAtTM/eFeyfVpBOHfSdy4RKg5xxUvUn0eSlbnJMMSypM5ZWR+KZtR0
cwB5ryrOHKIlOBqk3Q4lUTngOhFpha9UqBks5fDXEFxxvnaXIT4z2LepKAtUpWMhYqA8pVVhjQw6
W8xyKVZRzQwY4q5ffd1RjF2LeKIf1EaIFHWXMcobUFLl1k2FbYDJQDukdAOsvihhnCc8cSEaVu3B
HWN0Fd9Rdyc7qpz+DerbSdnOcJnuYayewJTzwF5K8mE0dKKjja4Sx2REHa0vFtM0fQjmm8XDL7vX
by8X+fcv7NZ9x6sUvCXwNjqilATr0Uj1F/OuZgyvFB3l2gyAy/kwNHk32NatVKFSDmBLAEyOzKkO
XdyfKAVo+nhSWS5onyFC2la+jylhKCNYDM5lKI2XJOl8pShwhhH2oVtWpacE59f3hBud7F+dYi61
wFhKub4w/dBlme1UpNyCChUZXwW/y+xL2+aEv4Msb8/qY6p8GIRzyZmyosszQcUYqcaOetp8/vX7
+7fXP/4Bc5BaW1ozI0yQxUz0ZvA/+YjhtZJWlhcyvJ/c1pKiauexba15LqqG4PaaW3ko0GtZoz6W
sLJJrRvurghMa6odR/cjswJ58FqrKG2CeYBpHM2HMhar48+KY1tnPC5q7GLJerRJ7QgE8kSjdLid
kVBT+15CsCe70jRn9w/he9aOkyOSKAgC0m6zhGllC1FInXIDyRvO0CkgZyZeDt0trGs31mSUS2mG
6wOBQAQYlBRqlH2f+yQ5EjuqnSpp820UoRF7jYe3VcGS0azfLnBt6jYWsKkRUZHyKz4Y8Wj69OuH
74t8Pgy1/t0eLmIULkjWS+joVADIse2h+aBnbsl3j1liH1I5pvsxnoEH8jhFp0jMzvxkjWRzOOXg
0pBDyh3c1c+EnP2Q7Z7YjgxMRWB0/8BVHSVn/PE0dk6ZEEd9RAZBa7MtR81Owd3gi+JOxvUzdzI+
KQeyt2cQDMbehdCZaT6i4q5YayvxbllJOtpBmlPGR+4oYTBbYMtaQw1WSBW04oLLyh1VEB9Nk3NG
SNpJurji6qROUdFGC1zcTcQmmOHLXTa5DFeeLSvpDEyGCrMQ98Gv5bQe+0pO60ul1JPaNlBp6P1Q
6VN84CW6lHVsYsu3BY3ObTxyOLFLytHaeBQur1ecJOUWg08DK+OBjYZf1pWbKsD6wfdGpgT5Y7qP
ykJie+HXPRF9XhIIY36gUNUtZsRDkkA9Q4jNOxHM8HnB9/hp+UF4PlOnqDWHRpwFte3VR8J8rD7e
PFyGkK2wvLBmpciui5YyN8iuS9p9QlLri5OMRgo3+8PjyjbfOdZRtAzks7hAeqyfomgxMZLGay66
pTQcGCxfL+aefUA9WacCXzbiVlnGnfA7mBEfZJeyLPc0l7Oma2wQUXQRLr7U0TwKPQyU/GdajaPx
hcR0Ol/RSCh2dVWRF8Lae/IdZtxrPmW/E29lO53eToCP55hrm9YQzTfWTpOn4dH/5fOz5Ams41Hd
Aicj9nz6YHG0eizxheco7uJfpfme53bcpQNTwejRAb+l4Be64x45rUzzGlLGWBtm4WUPtGGE+dBj
xuaU2dVjNmaFTc3ENc1bivyIKlXNjpzA40FYvOdjDG4rcmjQKivhnRJVYr1atZotPGuhSkEktA72
KJhvCPtAIDUFvlCqKFhtfI3lqaV7M2kQwqZCSTUTkqewYl/VcJqNRUrkyTR9xKuEQKQ7+Wen/qBs
PnYxZEuIfbqDmsst1La32YSzOWY6bD1lW4byekOZL/E62Hg+aC1qaw6kJY9JcyiJ3QTEJaoiLnx7
aV3EctVZOThMaqOOC+v1GgGRaP2f7pTbO0ZZ3kTKCNsCOT1SXEkYQzifnDgt+MnTiVtelFJotfje
S9xes/1olU6fbdLDqbG2TF3iecp+AsJeSCYCQpHVRLiXZqTNnNZ5tvd7+bOtIBMIft5xMBnK5Gdt
sMs6o9oLf8rtgIe6pL0sqQl3B8x9Sg7t3mhW3jk8siunt8gOk2VyrCnMLkmIOCK8JKQuFdRqS+RS
Aka0yyBpqNahcBSyU5fFcO3Gqc5pDG+2jLhEUwC5MmPQ3hNqcQU5U25witzpHmjAtYzRqDyHm47y
rR2WOX+QJb0xG3JvzBK4GTzgVzxMJDStU/jRgGsUrTerLQmQIw3m1C56tHbROzWbs4JFFAUkIOYx
S+g36DQVJD1hck452k9K4HVDJ72Jo4DuoKphEbnpq7WHviHpO35N6U/M4zI71TQZxOz2emE3EpKB
xXgTzIIgpjHXhqR1gqWXLiUYGqNkNCdZCVo/gWjoL3WXukhErkIKM7on+VW28IHJ456e84/OJjpe
0UFX7B1NlyyecyiA5aCJTRrMCIs5uNSQmzSP6cY7O0CS3h0de7mnhRX8F0WVJWGPn9mBa9UeePj6
/f3X76+fXh5gL+49rwD18vKpi2sHlD7CH/v0/Pf7y7ep05gE6RCbKjJNbSobgRSzBj9NgHhkF+rm
Bchlumf12OPboFdNFgVEAIWBTugVJR10ChEhXQFd/lHXE0Dm5QHnFC+a0zZ+DRd4Qgs0GK2x7tfA
5MKR0qg5LCmB2q5UmPpAk2Rc1SDUXruNkEY6xjGpkpKGxR0X4PaPz9iK12KJGRWblQ4qNoyYJpyR
Y1ox2/XQot2lS4xoOjaaBNOu3SxvCPzTLTGFSpOkuIg0z++G06mKKflweYWwkL9MQ2j+C2JPguP+
++cehbA1F8KAYHf6wJv61BJGL8rQAYnOOJx5dYLy8mdLTSB/tuUoeFEX5eHvf95J11Oelyczkjf8
bHc7CH4/jtOpaWB9QMVn1QgdXv8oiLmnQYJBqo0xSHX49P3l2xtk17ob09se9/r5AtLXOPvxobi5
AenZRx/tAsZ4UtEx9ZPH9Kac5i0tbVcm96JyuYwitOERCFOdDJDmuMVbeJTsD7E9WxgiwI2BCYOV
B5N0cYSrVYTfQd2R2fFIRGG6Q5qYrRYBbmBugqJF4Bm/TETzOX4RecfIdbyeLzceUIwv2wFQVkGI
34jeMXl6aahkMT0G4jnDvYCnubopLuxCmP0NqFPuHexrc0RjgxkLzJBdC5WjtQ6RopZlZvTloXx7
S7Bi0LbK/5clRqxvOSuBaXMSJVeoBekJpPNwwEgqa4SKoGRJ4Hd6msG5QFgvGp1I4RzmhKw+tFac
4sORY8rZAbQrYjgMlYXPtCExVhYoUp1WnFB5aQAryyxVzTtAUlBdUu52GhHfWImb1mo6DBcZeEhD
zrUUtpmrkuGLumsacJQK477p1xJGXDYqiMoOSkR31wAYulpKcMQNX7dAJKOGSzSCL/BoUYfnb590
ZtjfiodxpAG4fTLc7qbBE0cI9bPl0WwRWqpUVSz/SxrUaIRkYeUcQyanJmd8qxf76LGKEe5YitpZ
ko0qHrdch2Dc7Kqmisk6TgqC9HvPhIocbQpCfVmb1/I0Reu7QzJ8LdzpqTgFsyO+0d9BOxGNXUg7
+0bs2w9RtBAWTfM8n5+/PX8E+W8IAdiLt42RjvZs8HCxtiKF7S6vM6UBqE1kDxjKDpdpmcQNxZBr
KrFyXUIamk3Uls3NqFt7c5CFXfzHcHl3ec4SFeXrBPEr2T1mbf3y7fX5zWCxjcnBsjZlVXaLTUPv
jhCFyxlaKOU5eShIiVhl+xsNiIkbhRw1ScFquZwxyEnN6TgkBn4HIhkWStQETUbd6owZrckkpFdW
4ZS8ak+saurfVxi1gnSkIu0gC7xqKRglaYJXryLcdmnQ0JdOUkidSkadtDpDhd0wq6P3mns1TRhF
SOjOr19+BbosUXNJKVkQK/uuKhiRjONJgjTCTtxmFBrfcFzrh5pwW9bkOo5zQnV1RwQrXq+p4B0a
1O25HxoGpvb0tjpAvbCKuPHU5Kqkd3dJ3tVZm5W+NhSK5+CEN4X2PvH2PjAafNsJ3tIngtU80Xx8
izOWEEy2KK5Ma1kywvBDIVQQD8rQ6JbHIBEJ4sN25HZPMCBEgIW8PSQZYXPQ7ol5lhdPBWUSA6GO
G8rLBqJUt7XspusLqvyuhJKQl4JLviVPMkKnIY+WCgw18I4DAwu3HMhylK3qHIDDfUN6PuJxlVWS
K6UdNVwC2VWXp+faPInk7y4ydd/DMh39Ugn0kCIs9YR89318SOOjShaFj0ETy78SH4Erz7IbFXRz
yhQY01+NqvyEp7pRMZt0MPapFkNy21NlUDjOey9L7onTDS2RLFUypFzAhV2sc1BbaiMolQcHqWuR
9FH2NoOiI80rFsFuiGX7Yjuk0oH3ubNYEP18eLkuTuKDFKdk+eev3989SQR09TxYznGNxp2+IoIQ
93TCk13RRbJe4oqOjgz+ES56K4h9GOh8woaaRMo7G4jgdYxzwkDNlV0Y3a42JGv3JZEgT0JqLnnx
DT2ykr6a40qnjrxZ4QcikCm/7Y5WVtOcDcqDmZgGdWxvoMPa+fH9/eWvhz8gzr5+9OGXv+TUevvx
8PLXHy+f4Crntw71q2RGID7nv8a1y3OI73OVtIFyBVcLkFYLqS8WM3eYFD1sYpIOwyDri67Jm6b/
lbvMF3kGS8xvev08d/dRxIAlvAC1wIkQ5gFSFdui2Z2entqiJvImAaxhRd3K3Z4G8Pw21gao7hTv
n2UHhy4bH8n0OCO3jNHIUYl0FDGjEgXp7wve13Qo9TsENjMPhIzAbGzkxnNzgoUjjFnqkmAUDmi2
tdLOpiZ/Oq7M8qYExOQzQdnHt1cd9xrJrSMrlbwSmL0e6UPUQClh0gfal0jWFujJnxD54Pn967fp
0dGUsp9fP/5nemBCtshgGUXgaR7fM2d110naLOYBbjLI7JHGvdLzp08qXbdcbaq17/9jjYbVEkQ7
j8KSUHBPsbFA5870zYxKeB43Fa5mhEGksppd8HNH59ZiZyJoh6LKTQ61Zb3n5SozKyenWU4GRrBA
E2+KEkxxAIFzaJD/hSYDVwMBFeCuZrbC33vLGilzye7V4ZoIZ2JBfqIWIhJwB6m3+BD3naXo/fPb
x5AMONljJBMdrGeET9EIRDgTdr2RoGhD5HLoMVkZrcO1EyI7vZDslvvFxXa+wKvpu7xnp33aZk0c
bhaYfe5k+qiCfps/INYeuQ6BhhyW9ywSyXoREFHvTAiuvRwgIpgRt1A2Bme8bAzOl9oY/NrMwsz9
/QnW+BcxMJuQmGgDpiEj4dgYX38kZkXpNgyMLy+IwnjGuZ77aqnj9cr3Ra+83bG8Dwbgqa9MibS0
d0hzLd0NKmkanHXdqHrlycACGVA878aXRynlEKFMO8xuHUSzJc5Cmpgo3BGBIe+g5Xy9pJS6GrPP
lkFEavTumHDmw6xXM0r1eUe4Z+GBH1YBISPdx6+J3EvrQ0zszT1AHnxVEHq+pArCRPnW9Ri1oboX
hMasyVtAC0eEcDcw8jRwTy/AhEQQNgsTugdJYfzvtggJOwob4+4znKir2crdmAIF7t1ZYVbuEwUw
G/cMkpB5sPbMQ8jt41vrCjP39nm18sxYhfEkdlKYn3oxzywTcTn3HblNvCIShd+/uyCUSANg7QV4
pp/wHLIS4J4LmSBYVwPg6yRhHWQAfJ30rXrJKfgAvk5uluHc970kZuHZWxTG/b5lHK3nnj0BMAuC
8+0xeRO3ENFEcDqEbA+NG7no3UMAmLVnPkmMFGXcYw2YzTjP1hhTKmcMzxDsouWGECkFdf3QP10f
Gs8ClYg5EZR6QMSeOhwKzTvDI1K5U7o/ZSriYEHIQgYmDPyY1SWkIln3nRZ1vFiLnwN5FpaGbeee
XbVumnrtOZZrIVaeA44lcRBGSeSViGopKnswcqQiHx+as3DmPpoA4pnHEjIPvYcFFf28BxxE7Dnd
GlFSAT0siHsGKYh76CSESgFpQnyvLMolEc63h5w5W0UrN8N8boLQI9ydmyj0yKOXaL5ez92CAmAi
KtGBgSGTIZiY8Ccw7sFREPdykZBsHS1JixUTtaLS5wyoVbg+uAUuDUptlPOi5b4c4cZxom7rQOqQ
Y5aDQ1cEIdgaDlZ/mHNiD0pFWu3THCyRoIVit9PhM1tR/z4bgyeKnp4AwSvBfBACCJeu5vocD/sC
8iKlZXvhdYrVaAJ3jFfayAYdYewRlY6bjlfaP0LXjgCd/QUAOKK2pDeqifzJ7kHcH2WohqIurIkP
SYFpd2vwVirqmm9HFjj2tVBXuo0h0xwCB8Jkuop/3t5f//3Pl4+glXe4s4pdovQ5xA5UCh5rc35C
lIbnlTXujDhEFCDZLNeBuOB36KoL1zKcXWkz2h0YvCdUtFzVy4RtZnO6D0Behs4WFATfkHoyodu4
k/EdryNTXmeKnOV01ZK3goAeZOcll9eWrOYx3nxWxi0nbs2BRt2oQ9P8sabSUwD5A8uf2lgUVOgi
wBxTURLB2oEcRSp3iYdOfxZFXxGZjPXEuQaLJSFGdoD1ekWcVndAtHACos3M2UK0IbTXdzrBgQ50
nKlR9GZFMbCKnOa7MNgKeuqfeQlJVahotwCp0ga3iwCiFHWWcvbTI1Ql8ZxKbqDozXLmejxeNktC
/AN6ncaOuFQA4Iv16urBiCXBFSrq8RbJeUSvUpAkUCLbXpezaQ5m++FbHRMnCJAbyDE0ny+vbVPH
jEheAMCsnG8cExWuowjvra6ZTDi+MssEkSCsKetVMCNusYC4nBEZHVS7ChDhVzcDgFCi9D2X7+Y4
AFQVEWF9cwdsAvcZIUFysyKY8eaSSRnY8aUlAAIYuafCJQvC9dyNycR86VguzaO4OkbzfI0c5xyr
+FORM+cwXES0cOzZkjwP3Mc5QJYzH2SzwdOdO9mboRaI4C15M0K3VLn2DPAQVjfvWFr5/bfnvz+/
fkQSFrN9Odhryh8tX6xmdsmhbJ+uwVB23kNqHSN0YlegzD335clMs5ZUdk6FSrRJ2bLT1WmlqGDq
nrdOsx0YBiD8JYCOou6MFo1UAF35btuTfpik3RZsae88MEYE52CWZUX8ezCb2b0CA89WDnUCUeHF
hRIeuveMbSOwuz3by5ePXz+9fHvo8o/Lf6mM0iafCzVoY871bIavjB5S8yxY4cqMHqIiT0iObhPh
28kEN+b8DPsnqvNa6qyE4Txzf84stlutJJdMnCNAZiKhzBuBnBenc8po+pmKSaWIcpaQxFNCJIuA
TlG5HiRN7Nk+JHYaoMe8qk51+5gSxxZgHq9029siPmCiMNBKlquQBX1U+L/fnn88lM9fXt7Gwd9N
ilnDtuLJPrXXhKp1oFiV895p/GH77fXTny+TKcxyBg6oV/mP6zQKxahD09rsytImZ2dObxl7EYSn
OSH4qdVLJcAZ3rOo/p+xK2lyG1fS9/kVij5MzKE9XVJtqpnoA8RFgkUSNEBq8UUhV8m2oqtKjlri
vZpfP0iAC0BmUj50l4UvsRJIIIFcQHPNsIbdl5LLJfj6ML2KX/ZPh9G39+/f9ZQPuwZimtsEKZhn
O6On0zJR8HjrJrnssOYhhqMgzYJC9X8xTxIZBU4gmAoIRL7V2VkPMBG8Zwn3s+gzG14WAGhZALhl
tS2fgdPKiM+zXZTpnQfzmVDXKHLlFRpGcSRlpGU1zy2dRiCQZ8W08ZWpaQqemNYUWLwP7xv9rNVN
kWsEGCezEqlq8hQ/OEPG7SySkwtikWsCzZMIeysNDluew5iNwzHpDhOmlNH6plDJVyTGbwnlHhh6
VkhB1jnApTXKiu2YuPy3KNlV/EQICFtRig6AEuHIYHQioecrJxzPzXbLrcQlf41dhjE5AishQiHw
YzTAxfRmQvam0MyTCgEEIyRx2x8zDclCA72pUi4EYYy0dFfS/aH2N5gmM81KN8XVNT3DV1wWJWEW
D5Op9sdLEsz0cNFTXKW3487yq7YKlAmbhT3b3//zePzx8230n6MkCPs+WNorpCDcBQlTqvIZiLCu
GQuWibEHdwlbLtbiVdA1lze2oPEmu04ITbCWjoX5dEq8T3eoCEW2lkpLWpR2h0O0up5c3Ca4ZllL
Ngu1jExpcTbNksEmyDL0c535KI2qZ2j8S9cBbl9Pj5ppV4cCy7z7ggsIHUHfGlQnBxBfSsTFTgUQ
tAdaim35ED+pbxPsJeu/SZlm6u/pBY5LsQbDtmZzkyzVYkus97d+yQhYm/DmUm+y0lO3xqilKJB7
+9pObXjcnOkvuuYPVQk9IbG59xdl5kQDVJ0f1urOT8qD1E9YrMMo95NU9KW3sCBdsnWqtzh3SUGy
UAqkNuRTVhVW7fjws4XbjMF1u+aVQmInZ9MUKzdDkM4d88IvQ9FSBLtY+Yl1TGcAaYxnxbLXIEJ3
3uRMtWzhSqzVOJUQPkUiw1cFAeskw/DtTNQ5HKNy6OHtQ5rX9/OkeXl1MTbGzT4g8uQS/FngqVCg
j7Dg7lZPcAj/4aXXjva8kejFPDMlJMKP8uuOJ9r2Imerbj+tZbrxO4D1tFcpNLuydmBokAs7KXn3
67NwPJ0SGg4A0zGJW9ickwm9VyAqp1NKQ7uCKT3TCqa0DAFeEwoPGpsVU+LOFNCAXYyJmwwDp5wy
yzMzaLOdR5iUYfKqq8l07H83nXaz2WBp4CBqF6q8+2mCYhPTDQiZTNjAuM2N7goJJ2w7mN0WT6ik
1MXTsC2exlOREVodABLiBGBRsBCUmoaGwVMJYU3XwpT1fkMQfj5bAj2v6iJoiihTY9ICoMExGxRA
jZeZ7vpf6PlDlgcgvTz1fje+HfhUxiXCdEM3tyagq1gKOR9Pukdod7qIhP7kyebm6uaKEFDtfNmQ
Dic0nKUTwtja8sTNglCdhL2fQ7RtQsMd8DQion1X6B1ds0GJ9zC7CRCPLXYnYVNS76zFz7BmIzcJ
Ra+H1YbUgdfoNo07PNJ6ugo/sfeH48lT8zHzsHKwgR73mlz/0cmSg8/QRMDF8tfo75srFy/VrMs2
wUksK8lYQBVFycaUBltFETDOCE82FcVNN/Rjj2LBY0r7xWxQQUje29RF5IJQFGvxxTBFIbKI9gdW
ERnXRvR0UmhkF3PqADd11ZXkgod9wUgnelZzPGzNFQsZZXPCF7EmpPyNlQv0ehKKruXf2pvUr8M9
uJGBDD2XUkDPrrohNk1qEJS0Dz1LIVG3FQYDF3y9IiGREw5RAC9lJ5aFO2BRsuRZbxijQuS7GIuY
B3CwiKR07nptGte/tt2SAlHOGd22lAV6BeLXZoBroSPky2iLs2hTgXkPpGHd90IfsHdqdnGNBqgx
VI13Ry+zniZzkUmu8IUGJBG8v+GaiwZOooDwRmNhzOWcQb7qXnfbM4/SGScUQQweE64aDJgIyQVx
DwwEC5F0XIt5sG7P8MRdbulhKgMTC4nE1ywpBH7OAHjFo7UiAi6Zvm2lfeN88vNBUARMZDFY0VtJ
n9mM0GMDtFjzbIHe/9vhyRTXLEf0FlMS0LbeBo8yscL3FLtE9MAZb5UDJAlcQw7g2zhhCvNtDrCM
7ET3F7QNAyDiopMswCd4f26awPLDEyQrqGAogEmOH74BhTjL2NWWYREsA31PPbtD9/M7yUMLNI+y
FNwHUoVHBUu22aY7sXLN7OCajywWfL5KmLH0ejN3YfjGaL+KLoA4IBpcBAHDt16AFeP0mNVRrjq9
Mra8CeWgy1CQAdIrNErghiHCrp8MRZlBII5uxZJyEwJrGxymMjXA443jtM9iCyXTq5cPrDHNexRl
xmzwBTi+sldWNI+DU8UuJ556LJcb2gw2XE9FEv0aSTHYQfBMHwxxAasPv1sQfmfMUSHJ6QrSIJ/0
jE1qn3rIach6XVcz/PBmD7Fhf2HhX6Ei7+nRVPV3q2mdd3l1N8UZH2DdqlwHPm62Ro5wK3DaJRYB
38FDbRJVb8SOQ1ONV3eufiLE4/M3LCM8JDnv+uRxYOO+d8HUbhGEXnHt7Y85ufu3cSZnlmk2F0T2
SsjcRfdd56TH1/vD4+P++XB6fzVjWkUq8D9bbSgAj9dcFd2q6Htoj0wU8916wcHnNar1ZKWtQqhS
syVzm5yw7d8TF7YD2M4z8MEWtD7Ywv5ruBn5m9vNxQUMIdm2DXzRDoEDRxXc/XomXQpRwCLbFVSv
DFlRwKdQ+ijtf0mLwhfECo8V/hTptmrYa5cZ+k05GV8s8sEx4Cofj282gzSx/oi6pIGhEu1QIalY
P8VQN9ylQnwElUAYqqFWyym7ubnWAuYQEbTAOOpJO5twM92qWA3B4/71FdO8MBO46yLJXaXShFch
8XVI5y3Svr5dJorof0ZmCAohQang4fBLs67X0el5pALFR9/e30azZGl8bKpw9LT/qJ1R7R9fT6Nv
hypa0P+OwHuUW9Li8PjLxBB6Or0cRsfn7yefJVR0vW9hkwe8eLlUVQSXs3QhK1jM8F3MpYv1yYHa
cF06rkJKkc0l0/8mzlsulQpDSRh2dskITV+X7HOZ5mohzlfLElaG+BHJJRPZgAd/l3DJZHq+uEpu
3ukPEpz/HlGmB3F2MxkI8VSy/q4Ea40/7X9A5BxX49LdCMKAMlQxMIgyAzOL57S6sdkxwow41ZnS
DbsICe/GZkdcE/Y/FUiHtALvTzyM6C8BXPrWV6hoBs14pyYYUz/aQ5PNPwUQ+aOUExZXFUp4ezJM
MSyLEhd8bNNWKqK5RRLNRUEK1IZigK3XMzbY3gaETZglMzaE9LCHtERuNsYCXpkTInSTGQS4tQv1
50uIoCuGYJfG4ItJFdbdGD1mXB+TZqs5PVEIOy+zmUimT4YrPpOkQr7ps1gzKfkARVd/vXM8UVFh
t9SYb4pyYL1xBfo2MXFFqwm2Ojc9gaKv5hNs6PkJxzP9d3I93tBsa6H0IVb/4/KasGt3ia5uCLcU
ZuzBNbf+zpHsDVGz6vKfH6/Hey1CJfsP3A9qJnJ7OA0iQjW4ZgiXRLCIgXr8QuYsnBOxTIptTjh8
NUcr0N5Ra15QhouUpVuU0vFVQGTRawUXJVigJRnFZzzBgwhz/f+Mz1jmHRTbVGtLnDJ8eXTpbG2D
1Wj2FkobJcMNgNbAabEIHN3jLmLPSl54nmRz5ZCda6cIZEhs3QDs5AZfeAZUfD3cOZ4LPiNG0mC7
ADuw96h6vcQpzFnvXI+VpELCtUUq1PpfFsHOxhh2EowipJ+0CLQcusUTa82uP17e7i/+cAk0WGhp
xs9VJXZytV+hCEi9KcCyyk+9YQwSYnG60ewcQi1bxFBZ3Gm1SQddLiRZt8mLeeCk70oe7bpaaX6r
5QrnbnCfAi1FWFqdj81m118j4ozVEkXiK36ybkk2U8LeuCYJlWaPuKanS0L4THFIbm7x/aUmAY9g
d8ShtKaR6jq4PFMOV8l4QrhN8WmI9/SaaKNJcImjpjBukQjlbo+GMqf3iC5/h+h3aAjr4magr8YF
4UisJpl9uZzge0tNoS6vL+8IB4o1TZxeUu4Rmw+q5x+hkeaQXBP+eN1SCJv0miRKLy8IH15NKStN
Mjxv5Go6JQ43zcCEerlMe4saPH77i9plGhBKABhz3ig7Az24rP4NZhCqywmh+uJMi8n4d7p/58tW
1vH24/7t++nl6Xw7xhPCVNchuSb8c7gk18NDDMxkeq2P+SknnsIdylvCWWFLMrnyj6LdmRPzLpM3
37lYjm8LNjxf0qtpcWZIgIQIcOGSEPExGxKV3kzO9HT25YryF9fMgfw6IJRxahKYJX3x+fT8KcjL
czMkLvS/Ouu9UVdRh+fX0wtVRAhOU/BbeA3Nyrh/9Q5BfsCqzXu2LitqrIsW2qViFVXmeUNktQEy
YSlqiRYR674Q1aaNfqudA3q5GRJzS0KdahVTAJdNdHJkmgPMBTjWKD1rCZtMKd5W8CokQlPWpaZU
o3RGUyfWIoiY3W+QSaXikVuUbo6B4X1eVS9OiMVn9aRz/3J6PX1/Gy0+fh1ePq1GP94Pr2/em1ht
uX+GtK1+LqN+FKF6lhZszgkXTnORhDFXhIbAWu8RGYQWwCVExpOZwBSjuEjTUv9/xRx5SzDFQ/c3
0HgGDzapfZuz7gMgXMPxfmTAUb7/cXgzQRdUf7jOkTpyiKmpeTXT0kWxkKKcY/oYehlJG0rUFR6L
KLGloIlN0b7uiUuhApYYB2PG8LSl780XeXg6vR1+vZzuUcYXpaKIQHpAeQCS2Rb66+n1B1penqp6
ceElejmdWQaGOmuOBEMFfcL/UjaMjngeBRAgZ/QKz9Pf9cdqnwStEf/T4+mHTlanAAvlgsE2ny7w
8EBm66PWcO/ltH+4Pz1R+VDcPu1s8r/il8Ph9X6vZ9iX0wv/QhVyjtTQHv873VAF9DADfnnfP+qm
kW1Hcfd7QWCd3sfaHB+Pz//ulVllstGDdqugROcGlrnRR/itWdBWlYMbjlUsI1wvN9oUAeUDSC8J
iW9tnNgssgK/dNSiPRn6Ll+nvdGDeJjgkQJj5j3MaVbOgiVZkYmWUrv+T5AQb/liq3ncNxuDyv1c
lYIsRKNBS54F6W4J7mvg5pWkglg2+YbtJtMsNber56mgPJLKcsGod/FYx6rxeuNkhReGgOEXSynx
2CWR1yv2/PByOj64A6VFIykI5ZOavKVO+CxbhTwl3HswbEusb4ncn81lkD2hrkdvL/t7eFPD4pcW
RHwsM5hdtepaPaZfZJszzom3CUVavCSc9MRsHs71v7MoIOJxgk5f94moPqnad/vQZW/xUTNLOwk8
FrRiCQ9ZEe1ipTduid8iakzvsm4QR80vJp4hZZWw27CikP3kXCjwHBIkfUhFQSm5G5RZI5fdwi/p
Ui7JUq66pVzRpVx1SnFZ4xV5Y/l5FnrBvuE3SawrSGcBCxbO0UdGcHOrkdhTzm6STTBMgo9VJMao
FSJKYjJxW3z307gQMiQujA3LZwMhVW56nYGUL6Ug7rk3bv0kBWGDAZDIwFcLmIgTin9AtGYS394A
pLU35rGadLrZsvtC9sag3QJ5MpA1ntA5oT0oz6OmLhzv/QGv03YzE8hMoB53QdDeAe7FJ08hMnCh
N/wu7rYvygK5zUm/s5pCy674a1Wsun50wm4CtwnmPcqrmA3I+L351QjnhYiVYQRPfppNakvX1VGf
BLyIgcvjuL/7Bfv7n766RqzMEkc5c0VtycNPUqR/havQMOeWN9fDoMTdzc2F1/LPIuGRp4/4VZOh
y7AM47qHdeV4hfZKRqi/Ylb8FW3g/1mBN0ljnaWdKp0T5wOrhtrJXQtmYCaegz7V1eUthnMB+gD6
oPb3H8fX03R6ffdp/Ic7FVrSsojxOz3TF7xtWdH7/iZpKBgjMKE1vt8ODZ49Ur4e3h9Oo+/YoPZ8
EpiEpR843aSt0iqxPcS1ydV7GxjWYyb0hhI8fRZJp1T4DKBoyvWq75UdLHgSStRaexnJzHOX4D/F
FWnuTxWTcIbTWxqzUSE1Lsp5VCQzt5YqyXTCYWIR+HA0llHecNk/1MYVxXzFZGfRIF+uqYUre10J
L55R6nVWSJbNI5rJs3AAi2ksMoyXQhd0Rg2Bcj25lw20dTbQHBoKJEsJSH0pmVoQ4GpDl5nyTE8e
ikmnA73PaexLtrkaRG9oVA5VmoNaIGHBulUrKls5MNxSUJO3jpTqz8carLmd83s16fy+9LihSemu
Uxe86pKrNSFMWvId/koBIOy89nZXHwbQzlVEwHK0eBZmnb6FXJm7vzLM+7YImiD0uhpCXz+8JoSD
nQ2ht90M5milDwWixE+mhgiUks/RxIneN/RX69PVZ1DJNF/P9YlKOB2B6rs/bTudgalsMFoeXWYy
d92zmN+7ufK2wiqV9G5j4U0uC6NT42YNonyBT9CA+/st/DYRKNSEoN6B6fpaHweN+FFPEY+fA9U6
YstdvgarEfze3VCVOdjh0ji15xiwp8vTphJhWhvc7Mc70sDXEv5G+1Q609Nc0tcBIaP3E4pnJO46
SlR9pPLOXA5cH9p2+tDmZ2yQW4084cjtNYFMXT89HWRCInRpVAumN2Q9N2MSIVtwc0kiVyRCtvrm
hkTuCOTukspzR47o3SXVn7srqp7pbac/WuSA2bGbEhnGE7J+DXkOWABkKuBYsHS3qrE/3+rkCd6w
SzyZ6MY1nnyDJ9/iyXd48phoyphoy7jTmKXg051E0sruKKYsgOMIoZBdUwRRUhA3zi1JVkQl4Vqz
IZKCFfxcZVvJk+RMdXMWnSWREWHaUFNowSehNEcbmqzkxDbsDt+5ThWlXHLU0hwoQBj1bIQyHgjU
Qp+L3fqL2VNqf5juDa196Tvcv78c3z76mhKwn7j7EfzeSXAuB6/m/euH+kRq7Rn1B4Yckmdz4sRf
FYkfQu3lTxTSJBrYhQvwj2u9FlAxtOytIgT5U+ZdppCc2N9q2kEQ3eQWbBXtjIP6LLI6zuAe2Zwt
AtYReXtkeHXgujEwNPDYbJ0cIzXXFxRtP5mjk5qo9O8/Hk/3/zyc/vX858f+af/n42n/8Ov4/Ofr
/vtBl3N8+BN0X3/AFPjz26/vf9hZsTy8PB8ejUvkwzO8RbSzwypEHJ5OLx+j4/Px7bh/PP7fHlDn
WkkL+tCFYLnLROaJxwYSmR0b4g29Rww2aCRtrXiBN6mG6R41r53dldAcz2Aqisbh6MvHr7fT6B5M
+Bqf9m3XLbHu3tzTk/CSJ/30iDnnbCexT6qWAc8XrnfHDtDPAqdWNLFPKo0/g14aStgc5XoNJ1uy
zHOk81qCQJI1n9S7eb+fVbr3JFJBJf605GdsJDmjp9Wrdh6PJ1PPs2UFZGWCJ2Ityc1f4tLCUJg/
mMFvPSplsdBs0BNnLILqh+fv3x6P95/+OXyM7s0M/QHuWT/cS+P6yxHOxis4JAQci0bBOVyGw+Vr
PrWKJtfXfhhs+8r7/vbz8Px2vN+/HR5G0bPpCARA+dfx7eeIvb6e7o8GCvdv+96SC1wfsvXHDFJk
AIOF3r3Y5CIXyXZ8SahzN4twzlXHXXln3UVf+AqpJdJ1aAa26nVzBhx59HR6cK0N6qbNsC8exFjE
vBosJJalQAXkumkzJEvSvXr2YTHUiBxv+IZQhKzZQbRdS+JGpx5/0MsrSswcpu6MUmb87Yv8/vUn
NbT6ZNWbIAub2Gu37s5Qq1Y6W++7hscfh9e3fr0yuJwECI8wwFAtmw1932ApZglbRhP8RdIjGZgM
uhnF+CLkcZ8Vmo2jPzrYuumw2vCqz7fDa2QQUq6XSZTA36FeyDSkYgY4FIRP9JaC8jTZUlDxQOrF
vmCY488W1TX0d+YFux5PkIHUAK7UXuOEO/8aLvS5aCbwx6R6s5hLKkR0RbHOr8d9/f7g+OunZ5LQ
8EOFdESn7gi/VDVFVs6IMAw1hQxwc6FmIos1qfdaz2WWRloaHN6AmCoGWT4QDE6TkHB2WsHx2b1/
uWBfCVvJ+tOyRFH+fzu72GAxlD+mBpc5FWmimYODX6UgzOpreC2636xy2//06+Xw+mrFhv4Axwkr
cPmy3qy+4pcHFTwlzB6a3IOd0vBikB19Vf7RzSro7p8fTk+j7P3p2+HFajbXclF/NSi+C3KZYXff
9SDI2dwqvHf5iUHMztXnpxY7s20YogC/i24pevV+5uAXNAKlxnyLcAFr3Jvzs/U3hLXM8lvEklCI
79KB3NSfcFZsezx+e9lrMfHl9P52fEZOCeB13vI4JF1zKOzcpCFkl/3/yo6uqXEc9leYfbqbudtZ
uC7LCw+Jm5Is+ShOQgsvGY7NcB2OLkPLDT9/JTlJbUcK3BtYquMPWZJlfXBo5sy+i8WqyGO8uTDO
Xj6Dqo8peY/Zj3xE+T0MmVeWx9iCBIxXHKlG101QZehYqiZP2wERu/8ym76/AHKeYHWiRuX5169C
EmYLuwwW0Vr5aY+ZIWSUfrO5EOqtBeVNhqVsAAWNUxjjPybD9mWP3tNwjdlRKqDd5mF7t399aY/u
/2nvHzfbB8eFlF5ZkbqwfEo5mNRYC8hH+qbO0/EhOJjvAnLGYnY5hEWNMF7IcoLovZXzCH1kktQx
GKpCzxMu2ejg46wS3+ezB3nNlLINX2dVtlyr2DxF6mjhUpWCO2DCJgwD2PGprd+qZqzzwlerunHM
GaCge5/462SqyGSHkCYqCm/OmJ8aiCR8CCXQK1n2IUYomJgBKtR1VLJqpb4x04CTzN1alBDXGOTz
IptemFtkDklOYt2yT97iyULzT5c4eGifse3rW2z2/2/WZ6ejNnI9X45xk+B0NmoMdMa1VXGdhSNA
uQRqHLWG6rvjjmpapVqkw9yai9vEonMLEALghIWkt1nAAta3An4htM/GB8+2WQ98rSxUYhJAB1oH
ds7qgLy2bTd500TlcZwjjO1ze+A56KZNScFamL33ooo9GAKgC7KFRx4vQJhJEdKczuBAeGD8GEV6
It6i0KBrWVFf5SopqtTaWcTKi1wVMak3TWZGPuwmfQ00C9Fb4SI1C2exk2UN10l7AeZXllfcRVo4
mfHx/6nzk6euY3Wir1CCWz3Ok8xJwlFQ9tsLEBraKvlTq/IE742OP+6igDn3Pi22uyq0s169iH/2
dub1cPZm89gSwz8Ka4AlbJO3rmYg7LwHqTYSVu4DRS8yqfX5ZbPdP1KI/I+ndmc/WxwEHFVZouJP
/PuVgaOnBG9M7qprgS6QgjhMByv4NxHjqkaH2qEwQgaHD9+pRz3MDqMIMf9lNxTK2cmOtU8SKtLl
TRYWIHKaSGvAjOynQHGthvvZ5t/2z/3mqdMedoR6b9pfuJU1vihCkECUm8jJGh8PMd7AIh6sXUbO
8+eg3J255LEE9oNRN0LtXQ26PnUMWCxCDAigs6CHT+U5vzjDLiNFRVyzpMyCSlm8yIfQSDEgwHET
Mr0Aq1FR5y0UEdfhNbWPrq4TTtvR/Lz9+/WB8vgl293+5fWp3e6tewxlOkfFUV/ZHvdD4/COZnbk
/MvbMYdlUtvxPXTlr/pCY+efPo3WQXA7DEv/5duLA56co7tjxlHPlmzYig6z/VNd9yQ4dObquZhL
cV1hwnmpoDR1iIjE23luQfkgV7lwhSXwskgw7b5wezVfKcLvkRKM5WVa94mchJESBvm58WDMj9u9
x2ISYDnex3zlmrO2d8tLgZr0MDum/o7kUWhzYuMygN03w6A7qftwe9glv9syxjjMkbUd8Y+Kn8+7
P47Sn/ePr8/mDMV32wfvRpMD5cIBLvgYFQeOsWo1HAoXiMKiqKtzq7o75vTHS0i97KoyChn9upKN
cQ1yrgpKftlXV8BUgLXMBVsu5fszX2NPz/RaGD8PYDM/Ximhs3UcHAIZeSBSM0NW/YM506W/d7hy
l1G05Kov40itk/7b7nmzxacxmMTT6759a+GPdn//+fPn38diBtXLuorWgim2oxwmF4JLzqaLMSnr
VRlJ5d4JAVRklLxlCpObQOtim4yxazI3CEVRARVhTkc5B+RqZcb8js70P1bWFrdwMistVUQisQec
sKlzNCtH8+7iNzH7S8PWhLP7aHj9j7v93REy+Xs0VTAahZ/a3Oc678DLKb5L0V6JVD/csFxKn4fW
DF0z8WjOERSm5H9V6QgLPIMQHQd7aVXzEgsAyGEXMnEghkRBFgqyaFKGBr52cmzDiQScQFFojK7Y
yKU+w4QzaH+6wN6MYqQZlcjBNLGEIJbR4CZYOWD0cVEt09p4SUV9mD1/qgAhVzcVW/KT3LYWdW70
O5q2ti+sAO017EW/KM5PqbHJKE4aVFE0eFnBSQRUOCOHqQbZMmUSFm3uTmccb0aDBbrn5zVoucen
mXNtJCBdExp8UtJCes/e4+U6Ft6lqJ+ONo2F7T00TyQfEl+407Ava1W72yM7Qsmkfv7Xvtw9tDaB
X9a55DzZnVK8x8BlPsm/G52cRe6C+zicnoSUMRAEcOO/7vbJNhVp2E44GXSGkHn7WYeMOEZzbCnV
bTNJ75Occj3JGOLvw54VE6OfOPIhvgFPwMnIUqRFhhQuYVEmANB8munOgPvg6RPhRiYCifDCyZ54
HK39IEJvZYxpwDg+8lTd45VKcKIkhEvAqITsCIRAx4fP/UVwY7aYhANtCpmhCaOuhXosBF2TTU2G
Y2DwIi143xzC0PjeRumOJhZcepIjaCJkvTeUfsnLeAJeZ/LlyEy+pJLkU1sULqeWH98+YlP9nE/Y
vEiwVmMCqMDq4yzQvJLdJc3WGSgyEwtl4lcn5iObYzqCJM9d0W/ZEGUmlI00fCPKVACEOfkR1CsF
dtl3IiIATNQdJ5n1yJvWmN9+Acfgg3RNTAEA
--===============4877620735365943263==--

