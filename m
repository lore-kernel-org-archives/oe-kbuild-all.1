Content-Type: multipart/mixed; boundary="===============5671059351224634490=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V2] arm64: dts: sc7280: Add qspi, qupv3_0 and qupv3_1 nodes
Date: Tue, 25 May 2021 17:19:14 +0800
Message-ID: <de30ea1c-5572-ca4e-e473-7b77724a90d8@intel.com>
In-Reply-To: <6950c9c7b54892b2a8e81915743431ea@codeaurora.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5671059351224634490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/23/21 5:46 PM, rojay(a)codeaurora.org wrote:
> On 2021-04-23 02:52, kernel test robot wrote:
>> Hi Roja,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on next-20210422]
>> [cannot apply to robh/for-next v5.12-rc8 v5.12-rc7 v5.12-rc6 v5.12-rc8]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:
>> https://github.com/0day-ci/linux/commits/Roja-Rani-Yarubandi/arm64-dts-s=
c7280-Add-qspi-qupv3_0-and-qupv3_1-nodes/20210422-230756 =

>>
>> base:=C2=A0=C2=A0=C2=A0 c457d9676496f5a895509f9c510278beaaffc829
>> config: arm64-randconfig-r012-20210421 (attached as .config)
>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project
>> f5446b769a7929806f72256fccd4826d66502e59)
>> reproduce (this is a W=3D1 build):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>> -O ~/bin/make.cross
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/make.cross
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # install arm64 cross compili=
ng tool for clang build
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # apt-get install binutils-aa=
rch64-linux-gnu
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #
>> https://github.com/0day-ci/linux/commit/78ed1b1d4c9f34dd06ae4494b78d7033=
4fa8d7c1 =

>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add linux-review h=
ttps://github.com/0day-ci/linux
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-tags linux-rev=
iew
>> Roja-Rani-Yarubandi/arm64-dts-sc7280-Add-qspi-qupv3_0-and-qupv3_1-nodes/=
20210422-230756 =

>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 78ed1b1d4c9f34dd=
06ae4494b78d70334fa8d7c1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .config t=
o linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_PATH=3D$HOME=
/0day COMPILER=3Dclang make.cross W=3D1
>> ARCH=3Darm64
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> Error: arch/arm64/boot/dts/qcom/sc7280.dtsi:325.31-32 syntax error
>> =C2=A0=C2=A0 FATAL ERROR: Unable to parse input tree
>>
>
> This error is due to "clk_virt" node parse issue which will be defined =

> in ICC patches
> https://lore.kernel.org/patchwork/project/lkml/list/?series=3D488429
> I also mentioned the dependency in the patch.

Hi Roja,

Thanks for the clarification, we can parse the base commit from patch to =

avoid false positive:

 =C2=A0=C2=A0=C2=A0 $ man git format-patch

 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 With git format-patch --base=
=3DP -3 C (or variants thereof, e.g. =

with --cover-letter or using Z..C instead of -3 C to specify the range), =

the base tree information block is shown at the end of the first message =

the command outputs (either the first patch, or the cover
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 letter), like this:

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 base-commit: P
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prerequisite-=
patch-id: X
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prerequisite-=
patch-id: Y
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prerequisite-=
patch-id: Z

Best Regards,
Rong Chen
--===============5671059351224634490==--

