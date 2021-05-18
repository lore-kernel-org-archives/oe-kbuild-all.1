Content-Type: multipart/mixed; boundary="===============1650252253341563374=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: arch/csky/mm/tcm.c:14:2: error: #error "You should define DTCM_RAM_BASE"
Date: Tue, 18 May 2021 19:48:18 +0800
Message-ID: <66d3ff0d-ae3a-dbd7-1ac0-ddffd9c023d8@intel.com>
In-Reply-To: <a386406d-40fd-d382-b272-e524f046ca71@infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1650252253341563374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On 5/15/2021 7:22 AM, Randy Dunlap wrote:
> On 5/14/21 4:08 PM, kernel test robot wrote:
>> Hi Guo,
>>
>> First bad commit (maybe !=3D root cause):
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> head:   25a1298726e97b9d25379986f5d54d9e62ad6e93
>> commit: 18c07d23da5a48525b2955aa269b8bb108c19300 csky: Fixup calltrace p=
anic
>> date:   1 year ago
>> config: csky-randconfig-r036-20210515 (attached as .config)
>> compiler: csky-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3D18c07d23da5a48525b2955aa269b8bb108c19300
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kerne=
l/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout 18c07d23da5a48525b2955aa269b8bb108c19300
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss W=3D1 ARCH=3Dcsky
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/csky/mm/tcm.c:14:2: error: #error "You should define DTCM_RAM_BAS=
E"
>>        14 | #error "You should define DTCM_RAM_BASE"
>>           |  ^~~~~
>>     arch/csky/mm/tcm.c:109:7: warning: no previous prototype for 'tcm_al=
loc' [-Wmissing-prototypes]
>>       109 | void *tcm_alloc(size_t len)
>>           |       ^~~~~~~~~
>>     arch/csky/mm/tcm.c:124:6: warning: no previous prototype for 'tcm_fr=
ee' [-Wmissing-prototypes]
>>       124 | void tcm_free(void *addr, size_t len)
>>           |      ^~~~~~~~
>>
>>
>> vim +14 arch/csky/mm/tcm.c
>>
>> f525bb2c9e7cf1 Guo Ren 2019-11-27  11
>> f525bb2c9e7cf1 Guo Ren 2019-11-27  12  #ifdef CONFIG_HAVE_DTCM
>> f525bb2c9e7cf1 Guo Ren 2019-11-27  13  #if (CONFIG_DTCM_RAM_BASE =3D=3D =
0xffffffff)
>> f525bb2c9e7cf1 Guo Ren 2019-11-27 @14  #error "You should define DTCM_RA=
M_BASE"
>> f525bb2c9e7cf1 Guo Ren 2019-11-27  15  #endif
>> f525bb2c9e7cf1 Guo Ren 2019-11-27  16
> =

> =

> I.e., the person or bot that is running the kernel configurator should
> set/define the Kconfig symbol CONFIG_DTCM_RAM_BASE.
> =

> Please do so in your scripts.

Thanks for the advice, we have added it in the script.

Best Regards,
Rong Chen


> Thanks.
> =

>> :::::: The code at line 14 was first introduced by commit
>> :::::: f525bb2c9e7cf1e3c43ab57704c9e1c836d30b34 csky: Tightly-Coupled Me=
mory or Sram support
>>
>> :::::: TO: Guo Ren <guoren@linux.alibaba.com>
>> :::::: CC: Guo Ren <guoren@linux.alibaba.com>
> =

> =

>=20
--===============1650252253341563374==--

