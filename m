Content-Type: multipart/mixed; boundary="===============9152990578223064138=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [chrome-os:chromeos-5.4 59/70] drivers/gpu/drm/drm_dp_aux_backlight.c:177 drm_dp_aux_backlight_register() warn: passing zero to 'PTR_ERR'
Date: Mon, 17 May 2021 12:09:39 +0300
Message-ID: <202105160641.f309l9Zb-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9152990578223064138==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.4
head:   15d194a5987968744e349126609033f418625127
commit: 09cbe8d3853433d8c98826761d0a2c68013e7250 [59/70] CHROMIUM: drm/dp: =
Add DisplayPort aux backlight control support
config: x86_64-randconfig-m001-20210516 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/drm_dp_aux_backlight.c:177 drm_dp_aux_backlight_register() =
warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +177 drivers/gpu/drm/drm_dp_aux_backlight.c

09cbe8d3853433 Rajeev Nandan 2021-04-07  158  int drm_dp_aux_backlight_regi=
ster(const char *name,
09cbe8d3853433 Rajeev Nandan 2021-04-07  159  				struct drm_dp_aux_backlig=
ht *aux_bl)
09cbe8d3853433 Rajeev Nandan 2021-04-07  160  {
09cbe8d3853433 Rajeev Nandan 2021-04-07  161  	struct backlight_properties =
bl_props =3D { 0 };
09cbe8d3853433 Rajeev Nandan 2021-04-07  162  	int max_brightness;
09cbe8d3853433 Rajeev Nandan 2021-04-07  163  =

09cbe8d3853433 Rajeev Nandan 2021-04-07  164  	if (!name || !aux_bl || !aux=
_bl->aux)
09cbe8d3853433 Rajeev Nandan 2021-04-07  165  		return -EINVAL;
09cbe8d3853433 Rajeev Nandan 2021-04-07  166  =

09cbe8d3853433 Rajeev Nandan 2021-04-07  167  	max_brightness =3D 0xffff;
09cbe8d3853433 Rajeev Nandan 2021-04-07  168  =

09cbe8d3853433 Rajeev Nandan 2021-04-07  169  	bl_props.type =3D BACKLIGHT_=
RAW;
09cbe8d3853433 Rajeev Nandan 2021-04-07  170  	bl_props.brightness =3D max_=
brightness;
09cbe8d3853433 Rajeev Nandan 2021-04-07  171  	bl_props.max_brightness =3D =
max_brightness;
09cbe8d3853433 Rajeev Nandan 2021-04-07  172  	aux_bl->bd =3D devm_backligh=
t_device_register(aux_bl->dev, name,
09cbe8d3853433 Rajeev Nandan 2021-04-07  173  						  aux_bl->dev, aux_bl,
09cbe8d3853433 Rajeev Nandan 2021-04-07  174  						  &aux_bl_ops, &bl_prop=
s);
09cbe8d3853433 Rajeev Nandan 2021-04-07  175  	if (IS_ERR(aux_bl->bd)) {
09cbe8d3853433 Rajeev Nandan 2021-04-07  176  		aux_bl->bd =3D NULL;
                                                        ^^^^^^^^^^^^^^^^^^
Preserve the error code before setting this to NULL

09cbe8d3853433 Rajeev Nandan 2021-04-07 @177  		return PTR_ERR(aux_bl->bd);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^
PTR_ERR(NULL) is success.


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9152990578223064138==--

