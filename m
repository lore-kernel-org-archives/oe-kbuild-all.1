Content-Type: multipart/mixed; boundary="===============1133657487464145181=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [net-next 19/19] can: flexcan: add CAN wakeup function for i.MX8QM
Date: Thu, 07 Jan 2021 22:22:16 +0100
Message-ID: <13f12660-cb33-d610-a933-1e3459791159@pengutronix.de>
In-Reply-To: <202101080428.hEujUZlS-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1133657487464145181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/7/21 9:07 PM, kernel test robot wrote:
> Hi Marc,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on net-next/master]
> =

> url:    https://github.com/0day-ci/linux/commits/Marc-Kleine-Budde/can-tc=
an4x5x-replace-DEVICE_NAME-by-KBUILD_MODNAME/20210107-184956
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t 3db1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/90434a61388963ddee49d0c=
805226dd4b56df274
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Marc-Kleine-Budde/can-tcan4x5x-r=
eplace-DEVICE_NAME-by-KBUILD_MODNAME/20210107-184956
>         git checkout 90434a61388963ddee49d0c805226dd4b56df274
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dm68k =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

>>> ERROR: modpost: "imx_scu_get_handle" [drivers/net/can/flexcan.ko] undef=
ined!

Another false positive, due to the old net-next/master base.

Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============1133657487464145181==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQWwvM2U0Z0FDZ2tRcWNsYWl2cnQKNzZsZUt3ZitNOGNVYXJzemdy
YU5LMmJrbFBYTWtEWGNsTTMzSEViTnRUeDJjS2ZzOERlY2dYWHFhbDgyNzRqagpiODRVRWw1UnFD
NVdKK3hWQi8ydS91eTJtaDhDV0dZS210TjJpcVJvQ28rK3BCdXBqYTBUb0dyNHFLR1AzSE96Cm9v
T0psazZRdWtYZDhyTXA3UFpzUE8wNkkyQ1lWYXM5UEQrY2dudUpCNzlYMThKeVJxMEQvYlBaN2Ey
WGZIaGYKRjFNR3dtSXdUL1pZZjg1dk9UOXIrWitlckhvQmxKL1ExTC9xK1llaUJ6dEhDRTRpNEJY
aWIxL0MxbkxDcFEyTgpHa0pDUXVSaHlrZ1dibHV2N3FvVVhyTExjYUNYb2hzSElCT0lLQkY2bmhk
VVVqdVNJSFkrVzlTNGM5SnNCcXhlCmRSZTIyOEdHZkJiQlpqcDFPQkU0Vnd1clBaQm1Ydz09Cj1a
Q1RaCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1133657487464145181==--

