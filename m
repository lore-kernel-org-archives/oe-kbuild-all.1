Content-Type: multipart/mixed; boundary="===============2697776251989568518=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v8 8/8] arm64: dts: mt6359: add PMIC MT6359 related nodes
Date: Thu, 27 May 2021 16:18:47 +0800
Message-ID: <b5dc12ac-dc1b-88b0-324f-5d19c906fc91@intel.com>
In-Reply-To: <1622078780.17674.2.camel@mtksdaap41>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2697776251989568518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Hsin-Hsiung,

Thanks for the clarification, the bot can't parse the previous patchset =

from a link,
but can get the base from '--base' option in =

https://git-scm.com/docs/git-format-patch.

Best Regards,
Rong Chen

On 5/27/21 9:26 AM, Hsin-hsiung Wang wrote:
> Hi, Sirs
> This patchset is based on the pmic wrapper patchset[1].
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D447127
>
> Thanks.
>
> On Thu, 2021-05-27 at 06:56 +0800, kernel test robot wrote:
>> Hi Hsin-Hsiung,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on lee-mfd/for-mfd-next]
>> [also build test ERROR on regulator/for-next robh/for-next v5.13-rc3 nex=
t-20210526]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Hsin-Hsiung-Wang/Add-Su=
pport-for-MediaTek-PMIC-MT6359/20210526-145337
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-=
mfd-next
>> config: arm64-allyesconfig (attached as .config)
>> compiler: aarch64-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://github.com/0day-ci/linux/commit/a3eab89e7558334e5fcdf=
60325819282c6ac223c
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Hsin-Hsiung-Wang/Add-Support-f=
or-MediaTek-PMIC-MT6359/20210526-145337
>>          git checkout a3eab89e7558334e5fcdf60325819282c6ac223c
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cr=
oss ARCH=3Darm64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/mediatek/mt6359.dtsi:6.1-7 Label or path pw=
rap not found
>>     FATAL ERROR: Syntax error parsing input tree
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============2697776251989568518==--

