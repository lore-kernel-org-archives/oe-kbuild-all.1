Content-Type: multipart/mixed; boundary="===============8870712904775146822=="
MIME-Version: 1.0
From: Guenter Roeck <linux@roeck-us.net>
To: kbuild-all@lists.01.org
Subject: Re: [hwmon:hwmon-playground 3/12] drivers/hwmon/pmbus/pmbus_core.c:174:18: warning: address of array 'data->info->phases' will always evaluate to 'true'
Date: Mon, 03 Feb 2020 07:09:05 -0800
Message-ID: <b1994377-e1ea-2c4f-5de6-a882f7875875@roeck-us.net>
In-Reply-To: <CAKwvOdmXXSQ9UmO0oNkPRv-ZPcnFG9RAH5fUkh_eMyoV=UjVHQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8870712904775146822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/3/20 7:00 AM, Nick Desaulniers wrote:
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/=
commit/?h=3Dhwmon-playground&id=3Dec31c1832ca6505f46d068e87a0524cd21e468b4
> =

> + Guenter, looks legit, can you please take a look?  phases is an
> array member of a struct, so it can never be NULL.
> =


Hi Nick,

Thanks for the note; already reported twice or so ;-), and fixed.

Guenter

> On Mon, Feb 3, 2020 at 2:55 AM kbuild test robot <lkp@intel.com> wrote:
>>
>> CC: kbuild-all(a)lists.01.org
>> CC: linux-hwmon(a)vger.kernel.org
>> TO: Guenter Roeck <linux@roeck-us.net>
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-sta=
ging.git hwmon-playground
>> head:   4e5fc259a7d202d7e13818052a6cdaff0f602b35
>> commit: 4e87220ea3c48bcb3aeadc4000acf9bcc7aa7522 [3/12] hwmon: (pmbus) I=
mplement multi-phase support
>> config: x86_64-allyesconfig (attached as .config)
>> compiler: clang version 11.0.0 (git://gitmirror/llvm_project ba8110161df=
b096bbc63039afd87ff6417328f91)
>> reproduce:
>>          git checkout 4e87220ea3c48bcb3aeadc4000acf9bcc7aa7522
>>          # save the attached .config to linux build tree
>>          make ARCH=3Dx86_64
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/hwmon/pmbus/pmbus_core.c:174:18: warning: address of array 'da=
ta->info->phases' will always evaluate to 'true' [-Wpointer-bool-conversion]
>>             if (data->info->phases && data->currphase !=3D phase &&
>>                 ~~~~~~~~~~~~^~~~~~ ~~
>>     1 warning generated.
>>
>> vim +174 drivers/hwmon/pmbus/pmbus_core.c
>>
>>     150
>>     151  int pmbus_set_page(struct i2c_client *client, int page, int pha=
se)
>>     152  {
>>     153          struct pmbus_data *data =3D i2c_get_clientdata(client);
>>     154          int rv;
>>     155
>>     156          if (page < 0)
>>     157                  return 0;
>>     158
>>     159          if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
>>     160              data->info->pages > 1 && page !=3D data->currpage) {
>>     161                  rv =3D i2c_smbus_write_byte_data(client, PMBUS_=
PAGE, page);
>>     162                  if (rv < 0)
>>     163                          return rv;
>>     164
>>     165                  rv =3D i2c_smbus_read_byte_data(client, PMBUS_P=
AGE);
>>     166                  if (rv < 0)
>>     167                          return rv;
>>     168
>>     169                  if (rv !=3D page)
>>     170                          return -EIO;
>>     171          }
>>     172          data->currpage =3D page;
>>     173
>>   > 174          if (data->info->phases && data->currphase !=3D phase &&
>>     175              !(data->info->pfunc[phase] & PMBUS_PHASE_VIRTUAL)) {
>>     176                  rv =3D i2c_smbus_write_byte_data(client, PMBUS_=
PHASE,
>>     177                                                 phase);
>>     178                  if (rv)
>>     179                          return rv;
>>     180          }
>>     181          data->currphase =3D phase;
>>     182
>>     183          return 0;
>>     184  }
>>     185  EXPORT_SYMBOL_GPL(pmbus_set_page);
>>     186
>>
>> ---
>> 0-DAY kernel test infrastructure                 Open Source Technology =
Center
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Cor=
poration
>>
>> --
>> You received this message because you are subscribed to the Google Group=
s "Clang Built Linux" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n email to clang-built-linux+unsubscribe(a)googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msg=
id/clang-built-linux/202002031044.RnwQP6Bt%25lkp%40intel.com.
> =

> =

>=20

--===============8870712904775146822==--

