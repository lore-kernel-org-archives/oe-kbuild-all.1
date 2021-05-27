Content-Type: multipart/mixed; boundary="===============4276239570573406131=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v8 4/4] arm64: dts: mt8192: add spmi node
Date: Thu, 27 May 2021 16:22:03 +0800
Message-ID: <d9a87eca-ae28-8da4-d78e-ae2602201648@intel.com>
In-Reply-To: <1622081330.22138.0.camel@mtksdaap41>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4276239570573406131==
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

On 5/27/21 10:08 AM, Hsin-hsiung Wang wrote:
> Hi, Sirs
> Thanks for the review.
> This series is based on Chun-Jie's patches[1].
>
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D488239
>
> On Thu, 2021-05-27 at 00:46 +0800, kernel test robot wrote:
>> Hi Hsin-Hsiung,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on robh/for-next]
>> [also build test ERROR on mediatek/for-next linus/master v5.13-rc3 next-=
20210526]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Hsin-Hsiung-Wang/Add-SP=
MI-support-for-Mediatek-MT6873-8192-SoC-IC/20210526-183803
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git f=
or-next
>> config: arm64-randconfig-r016-20210526 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 991=
55e913e9bad5f7f8a247f8bb3a3ff3da74af1)
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install arm64 cross compiling tool for clang build
>>          # apt-get install binutils-aarch64-linux-gnu
>>          # https://github.com/0day-ci/linux/commit/423b4a1660f5157dbac56=
6f9c498c61927f09022
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Hsin-Hsiung-Wang/Add-SPMI-supp=
ort-for-Mediatek-MT6873-8192-SoC-IC/20210526-183803
>>          git checkout 423b4a1660f5157dbac566f9c498c61927f09022
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Darm64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/mediatek/mt8192.dtsi:299.24-25 syntax error
>>     FATAL ERROR: Unable to parse input tree
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============4276239570573406131==--

