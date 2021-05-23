Content-Type: multipart/mixed; boundary="===============4843217917021143032=="
MIME-Version: 1.0
From: YueHaibing <yuehaibing@huawei.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next] ehea: Use DEVICE_ATTR_*() macro
Date: Sun, 23 May 2021 14:01:10 +0800
Message-ID: <4ba60312-b6ee-23db-bd1b-585dc5e83ae4@huawei.com>
In-Reply-To: <202105231357.TeRSEcVH-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4843217917021143032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021/5/23 13:14, kernel test robot wrote:
> Hi YueHaibing,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on net-next/master]
> =

> url:    https://github.com/0day-ci/linux/commits/YueHaibing/ehea-Use-DEVI=
CE_ATTR_-macro/20210523-111702
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t f5120f5998803a973b1d432ed2aa7e592527aa46
> config: powerpc-allmodconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/7402089765bd60dcd72cad4=
33fd318058e06d514
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review YueHaibing/ehea-Use-DEVICE_ATTR_=
-macro/20210523-111702
>         git checkout 7402089765bd60dcd72cad433fd318058e06d514
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dpowerpc =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    In file included from include/linux/kobject.h:20,
>                     from include/linux/energy_model.h:7,
>                     from include/linux/device.h:16,
>                     from drivers/net/ethernet/ibm/ehea/ehea_main.c:17:
>>> drivers/net/ethernet/ibm/ehea/ehea_main.c:3206:23: error: 'probe_port_s=
tore' undeclared here (not in a function); did you mean 'probe_port_show'?

Sorry, this is the wrong version.

>     3206 | static DEVICE_ATTR_WO(probe_port);
>          |                       ^~~~~~~~~~
>    include/linux/sysfs.h:135:11: note: in definition of macro '__ATTR_WO'
>      135 |  .store =3D _name##_store,     \
>          |           ^~~~~
>    drivers/net/ethernet/ibm/ehea/ehea_main.c:3206:8: note: in expansion o=
f macro 'DEVICE_ATTR_WO'
>     3206 | static DEVICE_ATTR_WO(probe_port);
>          |        ^~~~~~~~~~~~~~
>    drivers/net/ethernet/ibm/ehea/ehea_main.c:3116:16: warning: 'probe_por=
t_show' defined but not used [-Wunused-function]
>     3116 | static ssize_t probe_port_show(struct device *dev,
>          |                ^~~~~~~~~~~~~~~
> =

> =

> vim +3206 drivers/net/ethernet/ibm/ehea/ehea_main.c
> =

>   3205	=

>> 3206	static DEVICE_ATTR_WO(probe_port);
>   3207	static DEVICE_ATTR_WO(remove_port);
>   3208	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============4843217917021143032==--

