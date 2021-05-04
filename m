Content-Type: multipart/mixed; boundary="===============8007455683561621813=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] can: mcp251x: Fix resume from sleep before interface was brought up
Date: Tue, 04 May 2021 21:54:59 +0200
Message-ID: <20210504195459.hqa65mwiuyzwks4t@pengutronix.de>
In-Reply-To: <202105050327.Ryh9Vqhg-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8007455683561621813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05.05.2021 03:25:57, kernel test robot wrote:
> Hi Schrempf,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on mkl-can-next/testing]
> [also build test WARNING on v5.12 next-20210504]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Schrempf-Frieder/can-mcp=
251x-Fix-resume-from-sleep-before-interface-was-brought-up/20210505-000504
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-nex=
t.git testing
> config: x86_64-randconfig-r012-20210503 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a=
2a5836cc8e4c1def2bdeb022e7b496623439)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/a6e3fbb55cde65e2254ce03=
51b92997d14724726
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Schrempf-Frieder/can-mcp251x-Fix=
-resume-from-sleep-before-interface-was-brought-up/20210505-000504
>         git checkout a6e3fbb55cde65e2254ce0351b92997d14724726
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=
=3D1 ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> drivers/net/can/spi/mcp251x.c:1244:1: warning: unused label 'out_clean=
' [-Wunused-label]
>    out_clean:
>    ^~~~~~~~~~

Thanks, I'll squash that into the original patch.

>    drivers/net/can/spi/mcp251x.c:1335:17: warning: cast to smaller intege=
r type 'enum mcp251x_model' from 'const void *' [-Wvoid-pointer-to-enum-cas=
t]
>                    priv->model =3D (enum mcp251x_model)match;
>                                  ^~~~~~~~~~~~~~~~~~~~~~~~~

This is technically correct, but we only put the enum into the struct
of_device_id:

| static const struct of_device_id mcp251x_of_match[] =3D {
| 	{
| 		.compatible	=3D "microchip,mcp2510",
| 		.data		=3D (void *)CAN_MCP251X_MCP2510,
| 	},
| 	{
| 		.compatible	=3D "microchip,mcp2515",
| 		.data		=3D (void *)CAN_MCP251X_MCP2515,
| 	},
| 	{
| 		.compatible	=3D "microchip,mcp25625",
| 		.data		=3D (void *)CAN_MCP251X_MCP25625,
| 	},
| 	{ }
| };

An intermediate cast to kernel_ulong_t silences the warning:

| -               priv->model =3D (enum mcp251x_model)match;
| +               priv->model =3D (enum mcp251x_model)(kernel_ulong_t)match;

I'll send a patch.

regards,
Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--===============8007455683561621813==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUFCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQW1DUnBvOEFDZ2tRcWNsYWl2cnQKNzZsb3NnZ0FtYnNINnFzQ0VP
cklhakYwNVlGQ0xLbGVoNjROK2Y1WktkV1lkQUxoaGwzSXNpeXhvSVN0RXZzagp2dUt6YXNVdlg2
WURHV2pvbXZiVGtzN0NqSzhMcVVsRWlQT0FQNlh0K0tZa1ZSK2xYNzNONHFKL3pQVzV2ZkprCnl1
R2gvQUoxNFpFT0Z3N1Rvam9KTVU3T2hzUm1JK21CVENmMkpYRlBZYlUxRGFhVU9FelNVUEt2b056
aXN2MnIKRko2V3RGVVJVOTV6am43akFjelEwTHZOM2RNR3pQZHJnWWo2cUo1NTBGMGRocmxUZThh
cEpzWmc5VW5pUkRTOQpUSlpUSlo0QzNlTWllQnVKUnhpYkFrWXZ6RjBzK0xjQURHNi9VY0pUR0tK
TVVMQUk1d0tlc29sYTIrYUFUSTgxCll4TGpROWNEUVFyQldna2IrRTIvV3R6ZFlBZmVpdz09Cj1q
VDJuCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8007455683561621813==--

