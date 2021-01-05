Content-Type: multipart/mixed; boundary="===============8647122937336605170=="
MIME-Version: 1.0
From: Sebastian Reichel <sre@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v8 2/2] power: supply: bq256xx: Introduce the BQ256XX charger driver
Date: Tue, 05 Jan 2021 15:18:05 +0100
Message-ID: <20210105141805.vhf7wrgcwujr7uwn@earth.universe>
In-Reply-To: <202101051158.UxB5IFs7-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8647122937336605170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

On Tue, Jan 05, 2021 at 11:24:18AM +0800, kernel test robot wrote:
> Hi Ricardo,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on power-supply/for-next]
> [also build test WARNING on robh/for-next v5.11-rc2 next-20210104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Ricardo-Rivera-Matos/Int=
roduce-the-BQ256XX-family-of-chargers/20210105-043028
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-s=
upply.git for-next
> config: powerpc64-randconfig-r034-20210105 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c95=
1623bc8965fa1e89660f2f5f4a2944e4981a)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/82436c2c6d99c4effb187bb=
d09b47c4dc59a1f3d
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Ricardo-Rivera-Matos/Introduce-t=
he-BQ256XX-family-of-chargers/20210105-043028
>         git checkout 82436c2c6d99c4effb187bbd09b47c4dc59a1f3d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dpowerpc64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    drivers/power/supply/bq256xx_charger.c:1644:29: warning: variable 'psy=
_cfg' is uninitialized when used here [-Wuninitialized]
>            ret =3D bq256xx_parse_dt(bq, psy_cfg, dev);
>                                       ^~~~~~~
>    drivers/power/supply/bq256xx_charger.c:1618:37: note: initialize the v=
ariable 'psy_cfg' to silence this warning
>            struct power_supply_config *psy_cfg;
>                                               ^
>                                                =3D NULL

bah, I missed this serious issue during review :(

FWIW the compiler provided wrong solution. It would result in
dereferencing a NULL pointer afterwards since you never allocate
any memory for psy_cfg. You could of course allocate memory for
it, but power_supply_config is only needed during device
registration.

Proper solution is to initialize it as variable instead of pointer,
so that it ends up on the stack. Also you should initialize it with
{} to make sure any fields not explicitly configured are 0.

> >> drivers/power/supply/bq256xx_charger.c:1720:36: warning: unused variab=
le 'bq256xx_acpi_match' [-Wunused-const-variable]
>    static const struct acpi_device_id bq256xx_acpi_match[] =3D {

For this one just change

.acpi_match_table =3D ACPI_PTR(bq256xx_acpi_match),

into

.acpi_match_table =3D bq256xx_acpi_match,

>    2 warnings generated.
> =

> =

> vim +/bq256xx_acpi_match +1720 drivers/power/supply/bq256xx_charger.c
> =

>   1719	=

> > 1720	static const struct acpi_device_id bq256xx_acpi_match[] =3D {
>   1721		{ "bq25600", BQ25600 },
>   1722		{ "bq25600d", BQ25600D },
>   1723		{ "bq25601", BQ25601 },
>   1724		{ "bq25601d", BQ25601D },
>   1725		{ "bq25611d", BQ25611D },
>   1726		{ "bq25618", BQ25618 },
>   1727		{ "bq25619", BQ25619 },
>   1728		{},
>   1729	};
>   1730	MODULE_DEVICE_TABLE(acpi, bq256xx_acpi_match);
>   1731	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

Thanks,

-- Sebastian

--===============8647122937336605170==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUFCQ2dBZEZpRUU3MllOQjBZL2kz
SnFlVlFUMk83WDg4ZzcrcG9GQWwvMGRSVUFDZ2tRMk83WDg4ZzcKK3BxaUVnLzlHSG1xRUFKTDVJ
SHpUZ3UvQy9WSHdsVTVxU0FhV2J4ZWkzWUlPSjBvZUlxV2p1aDk2QUFEalNNUQpuWm11bDRRK04y
eUhCY01pcFVram10dFc2NnRVZkExcFhxUmtpYVNmWkxTS3NIRG42YTVtZE55UGZZYkdNOFpxCnZ0
dEhPS0UwRkVWd0VxTGlmWG1NNXl1UUVtQ1cwdWxDYXpod09NRVQxNVVuK0xya1RuZmYyNVV3R0d4
WUo0OW0KQ3NmVEZ4TXZqajEydVpaS2h1OXBVM0hDZ2ZlZ0RSKytIMEVRcmp5d3Z3d25QbjM1V01v
NUlqaVk1dkFSaHd3ego2cVNXYzdIbnV2ZXZUQ01vTVlZbnM0WGZTNExRWW8rcjlVVEg4UmZHVm9O
VHZtbmV2M2RTKytrY2c2SGJGRktICkpVWnVkYjVLRHdwTHAxRFNuMlM4UTNpK1Nza1UvTlB2dzFr
NmNaeUZpbFJOR0tpeXJEcGh1SGJ0Q2daZ0dwZm8KT1hJZHNGSEFiUGFvY3ErdWJOa1lFK3dOTk1a
WjN2WXZONkIyaFJ4RWF2d1NxVlYzak9sa0JOeG5nR3RlZnlVdwpCVzRINW5sYzFoY1dZdUhNcE9i
RlNiSDJiY3Z4aC9uNHJEN1dWWlZnaVBCTVNqUzRUdnZrc0NBQ1pISXAwQnlICk1jR0lKblRFeU9v
TUdwZWNWWlR6dHBiSUgyTXRLRzZnRVI2eDJqSGhQdFh6VjA4S3piK1ZlOERCUGhnVDVGYmkKQjA1
SmJhUUg2RUl2Q3F2K2JWQzVuTUREc0p2UGtHTC9zY0FKcThBZ01OeGJiditTNHBFS043d1FaT1hm
YU5pNgp5VFp0VTAyK242UUFnaGdVMFAySEtCWUxNSVh4NDR0N1EzR0tEcTdweS9HM2tSVlZ2N3c9
Cj1URExiCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8647122937336605170==--

