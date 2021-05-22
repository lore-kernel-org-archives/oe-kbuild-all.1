Content-Type: multipart/mixed; boundary="===============6211751668997696656=="
MIME-Version: 1.0
From: Dmitry Osipenko <digetx@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 08/13] memory: tegra: Enable compile testing for all drivers
Date: Sat, 22 May 2021 20:14:53 +0300
Message-ID: <09fea79d-44eb-62ea-4788-9aee4359e8e9@gmail.com>
In-Reply-To: <b556b166-036a-b059-5dac-d8dc47ce0d07@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6211751668997696656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

22.05.2021 20:12, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> 22.05.2021 19:39, kernel test robot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi Dmitry,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on regulator/for-next]
>> [also build test ERROR on robh/for-next v5.13-rc2 next-20210521]
>> [cannot apply to tegra/for-next]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/NVIDIA-=
Tegra-memory-and-power-management-changes-for-5-14/20210522-190541
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulato=
r.git for-next
>> config: arm-randconfig-r014-20210522 (attached as .config)
>> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
>> reproduce (this is a W=3D1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://github.com/0day-ci/linux/commit/19cc71cefb806ede6b171f=
67bc4143b3f34a44b7
>>         git remote add linux-review https://github.com/0day-ci/linux
>>         git fetch --no-tags linux-review Dmitry-Osipenko/NVIDIA-Tegra-me=
mory-and-power-management-changes-for-5-14/20210522-190541
>>         git checkout 19cc71cefb806ede6b171f67bc4143b3f34a44b7
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss ARCH=3Darm =

>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    kernel/softirq.o: in function `spawn_ksoftirqd':
>>    softirq.c:(.init.text+0x14): relocation truncated to fit: R_ARM_PC24 =
against symbol `__gnu_mcount_nc' defined in .text section in arch/arm/kerne=
l/entry-ftrace.o
>>    softirq.c:(.init.text+0x34): relocation truncated to fit: R_ARM_PC24 =
against symbol `__cpuhp_setup_state' defined in .text section in kernel/cpu=
.o
>>    softirq.c:(.init.text+0x3c): relocation truncated to fit: R_ARM_PC24 =
against symbol `smpboot_register_percpu_thread' defined in .text section in=
 kernel/smpboot.o
>>    softirq.c:(.init.text+0x58): relocation truncated to fit: R_ARM_PC24 =
against symbol `ftrace_likely_update' defined in .text section in kernel/tr=
ace/trace_branch.o
>>    kernel/softirq.o: in function `softirq_init':
>>    softirq.c:(.init.text+0xb0): relocation truncated to fit: R_ARM_PC24 =
against symbol `__gnu_mcount_nc' defined in .text section in arch/arm/kerne=
l/entry-ftrace.o
>>    kernel/softirq.o: in function `early_irq_init':
>>    softirq.c:(.init.text+0x100): relocation truncated to fit: R_ARM_PC24=
 against symbol `__gnu_mcount_nc' defined in .text section in arch/arm/kern=
el/entry-ftrace.o
>>    kernel/softirq.o: in function `arch_probe_nr_irqs':
>>    softirq.c:(.init.text+0x11c): relocation truncated to fit: R_ARM_PC24=
 against symbol `__gnu_mcount_nc' defined in .text section in arch/arm/kern=
el/entry-ftrace.o
>>    kernel/softirq.o: in function `arch_early_irq_init':
>>    softirq.c:(.init.text+0x138): relocation truncated to fit: R_ARM_PC24=
 against symbol `__gnu_mcount_nc' defined in .text section in arch/arm/kern=
el/entry-ftrace.o
>>    init/main.o: in function `set_reset_devices':
>>    main.c:(.init.text+0x10): relocation truncated to fit: R_ARM_PC24 aga=
inst symbol `__gnu_mcount_nc' defined in .text section in arch/arm/kernel/e=
ntry-ftrace.o
>>    init/main.o: in function `debug_kernel':
>>    main.c:(.init.text+0x38): relocation truncated to fit: R_ARM_PC24 aga=
inst symbol `__gnu_mcount_nc' defined in .text section in arch/arm/kernel/e=
ntry-ftrace.o
>>    init/main.o: in function `quiet_kernel':
>>    main.c:(.init.text+0x64): additional relocation overflows omitted fro=
m the output
>>    arm-linux-gnueabi-ld: drivers/memory/tegra/tegra20-emc.o: in function=
 `tegra_emc_probe':
>>    tegra20-emc.c:(.text+0x14f8): undefined reference to `clk_set_rate_ra=
nge'
>>    arm-linux-gnueabi-ld: drivers/memory/tegra/tegra30-emc.o: in function=
 `tegra_emc_resume':
>>>> tegra30-emc.c:(.text+0xf8): undefined reference to `clk_rate_exclusive=
_put'
>>    arm-linux-gnueabi-ld: drivers/memory/tegra/tegra30-emc.o: in function=
 `tegra_emc_suspend':
>>>> tegra30-emc.c:(.text+0x240): undefined reference to `clk_rate_exclusiv=
e_get'
>>    arm-linux-gnueabi-ld: drivers/memory/tegra/tegra30-emc.o: in function=
 `tegra_emc_probe':
>>    tegra30-emc.c:(.text+0x2374): undefined reference to `clk_set_rate_ra=
nge'
>>    arm-linux-gnueabi-ld: drivers/memory/tegra/tegra124-emc.o: in functio=
n `tegra_emc_probe':
>>>> tegra124-emc.c:(.text+0x12b0): undefined reference to `clk_set_rate_ra=
nge'
> =

> This missing clock symbols issue come over and over again for those
> ancient platforms that select CONFIG_HAVE_CLK, but not implement it
> fully. I think the best option will be to disable compile-testing for
> !HAVE_LEGACY_CLK, any objections?
> =


diff --git a/init/Kconfig b/init/Kconfig
index 173a474012d7..42701b04be00 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT

 config COMPILE_TEST
 	bool "Compile also drivers which will not load"
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && !HAVE_LEGACY_CLK
 	help
 	  Some drivers can be compiled on a different platform than they are
 	  intended to be run on. Despite they cannot be loaded there (or even

--===============6211751668997696656==--

