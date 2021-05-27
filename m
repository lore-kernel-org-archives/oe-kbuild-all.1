Content-Type: multipart/mixed; boundary="===============4783049026383435691=="
MIME-Version: 1.0
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [input:next 2732/2735] drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: uninitialized symbol 'z2'.
Date: Thu, 27 May 2021 12:19:51 +0200
Message-ID: <20210527101951.5q5ixq2tnd7esq2w@pengutronix.de>
In-Reply-To: <202105270957.mdv83Usm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4783049026383435691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 27, 2021 at 12:30:00PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ne=
xt
> head:   6cf3b3abbf0b3b778138c0f8936aa7820af62cfc
> commit: fb082cd59afa7fbd3a610e9835050675040b1b99 [2732/2735] Input: resis=
tive-adc-touch - add support for z1 and z2 channels
> config: x86_64-randconfig-m001-20210526 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> New smatch warnings:
> drivers/input/touchscreen/resistive-adc-touch.c:84 grts_cb() error: unini=
tialized symbol 'z2'.
> drivers/input/touchscreen/resistive-adc-touch.c:88 grts_cb() error: unini=
tialized symbol 'x'.
> drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: unin=
itialized symbol 'y'.
> =

> Old smatch warnings:
> drivers/input/touchscreen/resistive-adc-touch.c:101 grts_cb() error: unin=
itialized symbol 'x'.
> drivers/input/touchscreen/resistive-adc-touch.c:109 grts_cb() error: unin=
itialized symbol 'y'.
> =

> vim +/z2 +84 drivers/input/touchscreen/resistive-adc-touch.c
> =

> aa132ffb6b0a18 Eugen Hristev  2018-05-22   56  static int grts_cb(const v=
oid *data, void *private)
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   57  {
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   58  	const u16 *touch_info =3D=
 data;
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   59  	struct grts_state *st =3D=
 private;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   60  	unsigned int x, y, press =
=3D 0, z1 =3D 0, z2;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   61  	unsigned int Rt, i;
> aa132ffb6b0a18 Eugen Hristev  2018-05-22   62  =

> fb082cd59afa7f Oleksij Rempel 2021-05-25   63  	for (i =3D 0; i < ARRAY_S=
IZE(st->ch) && st->ch[i] !=3D GRTS_CH_NONE; i++) {
> fb082cd59afa7f Oleksij Rempel 2021-05-25   64  		switch (st->ch[i]) {
> fb082cd59afa7f Oleksij Rempel 2021-05-25   65  		case GRTS_CH_X:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   66  			x =3D touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   67  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   68  		case GRTS_CH_Y:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   69  			y =3D touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   70  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   71  		case GRTS_CH_PRESSURE:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   72  			press =3D touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   73  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   74  		case GRTS_CH_Z1:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   75  			z1 =3D touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   76  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   77  		case GRTS_CH_Z2:
> fb082cd59afa7f Oleksij Rempel 2021-05-25   78  			z2 =3D touch_info[i];
> fb082cd59afa7f Oleksij Rempel 2021-05-25   79  			break;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   80  		}
> fb082cd59afa7f Oleksij Rempel 2021-05-25   81  	}
> fb082cd59afa7f Oleksij Rempel 2021-05-25   82  =

> fb082cd59afa7f Oleksij Rempel 2021-05-25   83  	if (z1) {
> fb082cd59afa7f Oleksij Rempel 2021-05-25  @84  		Rt =3D z2;
> =

> It's likely this is a false positive, but we can see why the static
> checker would complain.

The presence of this values was validated on probe. Do we really need
extra set them to 0?

> fb082cd59afa7f Oleksij Rempel 2021-05-25   85  		Rt -=3D z1;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   86  		Rt *=3D st->x_plate_ohms;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   87  		Rt =3D DIV_ROUND_CLOSEST=
(Rt, 16);
> fb082cd59afa7f Oleksij Rempel 2021-05-25  @88  		Rt *=3D x;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   89  		Rt /=3D z1;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   90  		Rt =3D DIV_ROUND_CLOSEST=
(Rt, 256);
> fb082cd59afa7f Oleksij Rempel 2021-05-25   91  		/*
> fb082cd59afa7f Oleksij Rempel 2021-05-25   92  		 * On increased pressure=
 the resistance (Rt) is decreasing
> fb082cd59afa7f Oleksij Rempel 2021-05-25   93  		 * so, convert values to=
 make it looks as real pressure.
> fb082cd59afa7f Oleksij Rempel 2021-05-25   94  		 */
> fb082cd59afa7f Oleksij Rempel 2021-05-25   95  		if (Rt < GRTS_DEFAULT_PR=
ESSURE_MAX)
> fb082cd59afa7f Oleksij Rempel 2021-05-25   96  			press =3D GRTS_DEFAULT_=
PRESSURE_MAX - Rt;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   97  		else
> fb082cd59afa7f Oleksij Rempel 2021-05-25   98  			press =3D 0;
> fb082cd59afa7f Oleksij Rempel 2021-05-25   99  	}
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  100  =

> aa132ffb6b0a18 Eugen Hristev  2018-05-22 @101  	if ((!x && !y) || (st->pr=
essure && (press < st->pressure_min))) {
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  102  		/* report end of touch */
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  103  		input_report_key(st->inp=
ut, BTN_TOUCH, 0);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  104  		input_sync(st->input);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  105  		return 0;
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  106  	}
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  107  =

> aa132ffb6b0a18 Eugen Hristev  2018-05-22  108  	/* report proper touch to=
 subsystem*/
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  109  	touchscreen_report_pos(st=
->input, &st->prop, x, y, false);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  110  	if (st->pressure)
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  111  		input_report_abs(st->inp=
ut, ABS_PRESSURE, press);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  112  	input_report_key(st->inpu=
t, BTN_TOUCH, 1);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  113  	input_sync(st->input);
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  114  =

> aa132ffb6b0a18 Eugen Hristev  2018-05-22  115  	return 0;
> aa132ffb6b0a18 Eugen Hristev  2018-05-22  116  }
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> =

> =


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--===============4783049026383435691==--

