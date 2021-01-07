Content-Type: multipart/mixed; boundary="===============8440153158262871623=="
MIME-Version: 1.0
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: kbuild-all@lists.01.org
Subject: Re: [net-next 19/19] can: flexcan: add CAN wakeup function for i.MX8QM
Date: Thu, 07 Jan 2021 15:26:57 +0100
Message-ID: <17682d27-a0bb-4a29-7c72-261ab7eeb8ee@pengutronix.de>
In-Reply-To: <202101072123.StEAR5IC-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8440153158262871623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/7/21 2:56 PM, kernel test robot wrote:
> [auto build test ERROR on net-next/master]

This looks like a false positive to me.

> url:    https://github.com/0day-ci/linux/commits/Marc-Kleine-Budde/can-tc=
an4x5x-replace-DEVICE_NAME-by-KBUILD_MODNAME/20210107-184956
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t 3db1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9
> config: riscv-randconfig-r013-20210107 (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/90434a61388963ddee49d0c=
805226dd4b56df274
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Marc-Kleine-Budde/can-tcan4x5x-r=
eplace-DEVICE_NAME-by-KBUILD_MODNAME/20210107-184956

This doesn't work for me:

> =E2=9E=9C git remote add linux-review https://github.com/0day-ci/linux
> =E2=9E=9C git fetch --no-tags linux-review Marc-Kleine-Budde/can-tcan4x5x=
-replace-DEVICE_NAME-by-KBUILD_MODNAME/20210107-184956
> fatal: couldn't find remote ref Marc-Kleine-Budde/can-tcan4x5x-replace-DE=
VICE_NAME-by-KBUILD_MODNAME/20210107-184956

>         git checkout 90434a61388963ddee49d0c805226dd4b56df274
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Driscv =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    riscv64-linux-ld: drivers/net/can/flexcan.o: in function `.L359':
>>> flexcan.c:(.text+0x1844): undefined reference to `imx_scu_get_handle'

Please have a look at the end of patch 1:

> http://lore.kernel.org/r/20210107094900.173046-2-mkl(a)pengutronix.de

Where it says:

> base-commit: ede71cae72855f8d6f6268510895210adc317666

This tree contains:

> 95de5094f5ac firmware: imx: add dummy functions

which provides no-op static inline for the function the linker complains ab=
out.

regards,
Marc

-- =

Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--===============8440153158262871623==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ2dBZEZpRUVLM2tJV0p0OXlU
WU1QM2VocWNsYWl2cnQ3NmtGQWwvM0dqRUFDZ2tRcWNsYWl2cnQKNzZrSUlnZi9jS2h1UWQwMVlL
VHlqTnpwRDBDekRPNk9XWkFDOWxPUUZweEJTQytyQk5wZDNWNVRTSjJqRnh1eQpwVTZiN0UrVzJ4
Qnh0N3I4aStHMGovYW1KN3ZoS0xTV3FEYUNrK0Y1dXlkZ2lHdDJhajdpRlV3Q294Z2hzVzNvCmpF
RXpPSVNjczVLSjk4T1JRcGVGV09ndlpMYlVCeHVMMkFHNHplSzhCdG82aG0raTdMYnNhUVFpMGJQ
aGhMWnQKbmk4ckNibnk1elpsU1dONSt1TWRIZnNNVTZRWUZkRWxIK0ZrRFFlajZHT2hNVTI1WHh5
T3ZRbzBJRzN1aFJHeAoxYkNYOVV3N2NpckIwMEtKSWtLZjlaZGk2SDdCeEZzVnpJMmZBTDhCMmNl
SzhRVnZtVFhkVERmZ0orOWFsRWg3CnhQODZZN1lYNkpKQ0wzUnlicXpBK0I0cnNIcFNVQT09Cj1E
V21ECi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8440153158262871623==--

