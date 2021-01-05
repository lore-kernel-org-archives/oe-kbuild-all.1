Content-Type: multipart/mixed; boundary="===============6565477070409181199=="
MIME-Version: 1.0
From: Ricardo Rivera-Matos <r-rivera-matos@ti.com>
To: kbuild-all@lists.01.org
Subject: Re: [EXTERNAL] Re: [PATCH v8 2/2] power: supply: bq256xx: Introduce the BQ256XX charger driver
Date: Tue, 05 Jan 2021 14:13:55 -0600
Message-ID: <26235205-f28a-e836-7863-bed2e9cb6f25@ti.com>
In-Reply-To: <20210105141805.vhf7wrgcwujr7uwn@earth.universe>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6565477070409181199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sebastian,

On 1/5/21 8:18 AM, Sebastian Reichel wrote:
> Hi Ricardo,
>
> On Tue, Jan 05, 2021 at 11:24:18AM +0800, kernel test robot wrote:
>> Hi Ricardo,
>>
>> Thank you for the patch! Perhaps something to improve:
>>
>> [auto build test WARNING on power-supply/for-next]
>> [also build test WARNING on robh/for-next v5.11-rc2 next-20210104]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Ricardo-Rivera-Matos/In=
troduce-the-BQ256XX-family-of-chargers/20210105-043028
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-=
supply.git for-next
>> config: powerpc64-randconfig-r034-20210105 (attached as .config)
>> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c9=
51623bc8965fa1e89660f2f5f4a2944e4981a)
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install powerpc64 cross compiling tool for clang build
>>          # apt-get install binutils-powerpc64-linux-gnu
>>          # https://github.com/0day-ci/linux/commit/82436c2c6d99c4effb187=
bbd09b47c4dc59a1f3d
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Ricardo-Rivera-Matos/Introduce=
-the-BQ256XX-family-of-chargers/20210105-043028
>>          git checkout 82436c2c6d99c4effb187bbd09b47c4dc59a1f3d
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dpowerpc64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/power/supply/bq256xx_charger.c:1644:29: warning: variable 'p=
sy_cfg' is uninitialized when used here [-Wuninitialized]
>>             ret =3D bq256xx_parse_dt(bq, psy_cfg, dev);
>>                                        ^~~~~~~
>>     drivers/power/supply/bq256xx_charger.c:1618:37: note: initialize the=
 variable 'psy_cfg' to silence this warning
>>             struct power_supply_config *psy_cfg;
>>                                                ^
>>                                                 =3D NULL
> bah, I missed this serious issue during review :(
>
> FWIW the compiler provided wrong solution. It would result in
> dereferencing a NULL pointer afterwards since you never allocate
> any memory for psy_cfg. You could of course allocate memory for
> it, but power_supply_config is only needed during device
> registration.
>
> Proper solution is to initialize it as variable instead of pointer,
> so that it ends up on the stack. Also you should initialize it with
> {} to make sure any fields not explicitly configured are 0.
ACK
>
>>>> drivers/power/supply/bq256xx_charger.c:1720:36: warning: unused variab=
le 'bq256xx_acpi_match' [-Wunused-const-variable]
>>     static const struct acpi_device_id bq256xx_acpi_match[] =3D {
> For this one just change
>
> .acpi_match_table =3D ACPI_PTR(bq256xx_acpi_match),
>
> into
>
> .acpi_match_table =3D bq256xx_acpi_match,
ACK
>
>>     2 warnings generated.
>>
>>
>> vim +/bq256xx_acpi_match +1720 drivers/power/supply/bq256xx_charger.c
>>
>>    1719	=

>>> 1720	static const struct acpi_device_id bq256xx_acpi_match[] =3D {
>>    1721		{ "bq25600", BQ25600 },
>>    1722		{ "bq25600d", BQ25600D },
>>    1723		{ "bq25601", BQ25601 },
>>    1724		{ "bq25601d", BQ25601D },
>>    1725		{ "bq25611d", BQ25611D },
>>    1726		{ "bq25618", BQ25618 },
>>    1727		{ "bq25619", BQ25619 },
>>    1728		{},
>>    1729	};
>>    1730	MODULE_DEVICE_TABLE(acpi, bq256xx_acpi_match);
>>    1731	=

>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> Thanks,
>
> -- Sebastian
Thanks for the feedback on this!

Ricardo
--===============6565477070409181199==--

