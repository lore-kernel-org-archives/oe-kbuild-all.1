Content-Type: multipart/mixed; boundary="===============9046636870088487106=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 286/421] Inconsistent kallsyms data
Date: Fri, 09 Oct 2020 14:59:40 +0800
Message-ID: <20201009065940.xswyw5u3o7yutdca@shbuild888>
In-Reply-To: <202010011203.AKw3Hkqw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9046636870088487106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 12:55:08PM +0800, lkp wrote:
> tree:   https://github.com/hnaz/linux-mm master
> head:   2932a9e66c580f3c8d95ec27716d437198fb4c94
> commit: 17e9cbdd5b55c376f45b8a19f6057ba0b91f1178 [286/421] ./Makefile: ad=
d debug option to enable function aligned on 32 bytes
> config: powerpc-allmodconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/hnaz/linux-mm/commit/17e9cbdd5b55c376f45b8a1=
9f6057ba0b91f1178
>         git remote add hnaz-linux-mm https://github.com/hnaz/linux-mm
>         git fetch --no-tags hnaz-linux-mm master
>         git checkout 17e9cbdd5b55c376f45b8a19f6057ba0b91f1178
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dpowerpc =


Thanks for the report.

Today I tried to reproduce it with the .config and the same commit from
hnaz-linux-mm tree, and the "make bzImage" succeeds, some log below:

	"
	feng(a)feng-skl:~/ws2/projects/powerpc_build$ COMPILER_INSTALL_PATH=3D$HOM=
E/0day COMPILER=3Dgcc-9.3.0 make.cross ARCH=3Dpowerpc
	Compiler will be installed in /home/feng/0day
	make W=3D1 CONFIG_OF_ALL_DTBS=3Dy CONFIG_DTC=3Dy CROSS_COMPILE=3D/home/fen=
g/0day/gcc-9.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux- --jobs=3D8 ARC=
H=3Dpowerpc
	  DTC     arch/powerpc/boot/dts/ps3.dtb
	arch/powerpc/boot/dts/ps3.dts:25.9-28.4: Warning (unit_address_vs_reg): /m=
emory: node has a reg or ranges property, but no unit name
	  CALL    scripts/atomic/check-atomics.sh
	  CALL    scripts/checksyscalls.sh
	  CHK     include/generated/compile.h
	  CHK     kernel/kheaders_data.tar.xz
	  LDS     arch/powerpc/boot/zImage.lds
	  DTC     arch/powerpc/boot/dts/ps3.dtb
	arch/powerpc/boot/dts/ps3.dts:25.9-28.4: Warning (unit_address_vs_reg): /m=
emory: node has a reg or ranges property, but no unit name
	  WRAP    arch/powerpc/boot/zImage.pseries
	  WRAP    arch/powerpc/boot/dtbImage.ps3
	  WRAP    arch/powerpc/boot/zImage.maple
	  WRAP    arch/powerpc/boot/zImage.pmac
	  WRAP    arch/powerpc/boot/zImage.epapr
	  "

The only difference could be the distribution OS (Ubuntu 19.10) on
which I did the build. I will check more.

Thanks,
Feng

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> >> Inconsistent kallsyms data
>    Try make KALLSYMS_EXTRA_PASS=3D1 as a workaround
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============9046636870088487106==--

