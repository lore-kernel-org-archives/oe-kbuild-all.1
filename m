Content-Type: multipart/mixed; boundary="===============4343245572299199156=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [hwmon:hwmon-playground 3/12] drivers/hwmon/pmbus/pmbus_core.c:174:18: warning: address of array 'data->info->phases' will always evaluate to 'true'
Date: Mon, 03 Feb 2020 15:00:16 +0000
Message-ID: <CAKwvOdmXXSQ9UmO0oNkPRv-ZPcnFG9RAH5fUkh_eMyoV=UjVHQ@mail.gmail.com>
In-Reply-To: <202002031044.RnwQP6Bt%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4343245572299199156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/co=
mmit/?h=3Dhwmon-playground&id=3Dec31c1832ca6505f46d068e87a0524cd21e468b4

+ Guenter, looks legit, can you please take a look?  phases is an
array member of a struct, so it can never be NULL.

On Mon, Feb 3, 2020 at 2:55 AM kbuild test robot <lkp@intel.com> wrote:
>
> CC: kbuild-all(a)lists.01.org
> CC: linux-hwmon(a)vger.kernel.org
> TO: Guenter Roeck <linux@roeck-us.net>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stag=
ing.git hwmon-playground
> head:   4e5fc259a7d202d7e13818052a6cdaff0f602b35
> commit: 4e87220ea3c48bcb3aeadc4000acf9bcc7aa7522 [3/12] hwmon: (pmbus) Im=
plement multi-phase support
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (git://gitmirror/llvm_project ba8110161dfb=
096bbc63039afd87ff6417328f91)
> reproduce:
>         git checkout 4e87220ea3c48bcb3aeadc4000acf9bcc7aa7522
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/hwmon/pmbus/pmbus_core.c:174:18: warning: address of array 'da=
ta->info->phases' will always evaluate to 'true' [-Wpointer-bool-conversion]
>            if (data->info->phases && data->currphase !=3D phase &&
>                ~~~~~~~~~~~~^~~~~~ ~~
>    1 warning generated.
>
> vim +174 drivers/hwmon/pmbus/pmbus_core.c
>
>    150
>    151  int pmbus_set_page(struct i2c_client *client, int page, int phase)
>    152  {
>    153          struct pmbus_data *data =3D i2c_get_clientdata(client);
>    154          int rv;
>    155
>    156          if (page < 0)
>    157                  return 0;
>    158
>    159          if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
>    160              data->info->pages > 1 && page !=3D data->currpage) {
>    161                  rv =3D i2c_smbus_write_byte_data(client, PMBUS_PA=
GE, page);
>    162                  if (rv < 0)
>    163                          return rv;
>    164
>    165                  rv =3D i2c_smbus_read_byte_data(client, PMBUS_PAG=
E);
>    166                  if (rv < 0)
>    167                          return rv;
>    168
>    169                  if (rv !=3D page)
>    170                          return -EIO;
>    171          }
>    172          data->currpage =3D page;
>    173
>  > 174          if (data->info->phases && data->currphase !=3D phase &&
>    175              !(data->info->pfunc[phase] & PMBUS_PHASE_VIRTUAL)) {
>    176                  rv =3D i2c_smbus_write_byte_data(client, PMBUS_PH=
ASE,
>    177                                                 phase);
>    178                  if (rv)
>    179                          return rv;
>    180          }
>    181          data->currphase =3D phase;
>    182
>    183          return 0;
>    184  }
>    185  EXPORT_SYMBOL_GPL(pmbus_set_page);
>    186
>
> ---
> 0-DAY kernel test infrastructure                 Open Source Technology C=
enter
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corp=
oration
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202002031044.RnwQP6Bt%25lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============4343245572299199156==--

