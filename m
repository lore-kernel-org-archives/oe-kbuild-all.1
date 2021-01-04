Content-Type: multipart/mixed; boundary="===============8941050707060927975=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] crypto: x86/aes-ni-xts - rewrite and drop indirections via glue helper
Date: Mon, 04 Jan 2021 13:44:23 +0800
Message-ID: <166bbc6f-cb22-0593-68a6-e763c9fe1c8f@intel.com>
In-Reply-To: <CAMj1kXFZ77ptJXqp-JWembc-U6ouhZs3G8079Y+qkPQ47VQogA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8941050707060927975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/4/2021 4:31 AM, Ard Biesheuvel wrote:
> On Thu, 31 Dec 2020 at 23:37, kernel test robot <lkp@intel.com> wrote:
>>
>> Hi Ard,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on cryptodev/master]
>> [also build test ERROR on crypto/master linus/master v5.11-rc1 next-2020=
1223]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
> =

> This is a false positive, and the cover letter mentions that these
> patches depend on the cts(cbc(aes)) patch which is now in the
> cryptodev tree

Hi Ard,

Thanks for the clarification=EF=BC=8Cthe bot doesn't support analyzing the =
base
patch from cover letter yet.

> =

> I will try to remember to use --base next time.

Thanks a lot!

Best Regards,
Rong Chen

> =

> =

>> url:    https://github.com/0day-ci/linux/commits/Ard-Biesheuvel/crypto-x=
86-aes-ni-xts-recover-and-improve-performance/20210101-004902
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptode=
v-2.6.git master
>> config: x86_64-allyesconfig (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>> reproduce (this is a W=3D1 build):
>>          # https://github.com/0day-ci/linux/commit/120e62f276c7436572e8a=
67ecfb9bbb1125bfd8d
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Ard-Biesheuvel/crypto-x86-aes-=
ni-xts-recover-and-improve-performance/20210101-004902
>>          git checkout 120e62f276c7436572e8a67ecfb9bbb1125bfd8d
>>          # save the attached .config to linux build tree
>>          make W=3D1 ARCH=3Dx86_64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     ld: arch/x86/crypto/aesni-intel_asm.o: in function `aesni_xts_encryp=
t':
>>>> (.text+0x8909): undefined reference to `.Lcts_permute_table'
>>     ld: arch/x86/crypto/aesni-intel_asm.o: in function `aesni_xts_decryp=
t':
>>     (.text+0x8af6): undefined reference to `.Lcts_permute_table'
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
>=20
--===============8941050707060927975==--

