Content-Type: multipart/mixed; boundary="===============0612481140786548957=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 1487/10701] drivers/firmware/arm_scmi/smc.c:109:2: error: write to reserved register 'R7'
Date: Wed, 20 May 2020 09:27:41 -0700
Message-ID: <CAKwvOd=XenURx-2ze3A47aCEjtvR10M_9BX=80-g9jdErEWfbw@mail.gmail.com>
In-Reply-To: <202005200317.WyMjX6mI%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0612481140786548957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 12:00 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   fb57b1fabcb28f358901b2df90abd2b48abc1ca8
> commit: 1dc6558062dadfabd2fb3bd885fa6e92ec7196f2 [1487/10701] firmware: a=
rm_scmi: Add smc/hvc transport
> config: arm-randconfig-r005-20200519 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 135b=
877874fae96b4372c8a3fbfaa8ff44ff86e3)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         git checkout 1dc6558062dadfabd2fb3bd885fa6e92ec7196f2
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/firmware/arm_scmi/smc.c:109:2: error: write to reserved regist=
er 'R7'
> arm_smccc_1_1_invoke(scmi_info->func_id, 0, 0, 0, 0, 0, 0, 0, &res);
> ^

Nevermind this warning. I'm actually on a call right now with ARM
discussing this.  Issue is specific to thumb.

> include/linux/arm-smccc.h:357:4: note: expanded from macro 'arm_smccc_1_1=
_invoke'
> arm_smccc_1_1_smc(__VA_ARGS__);                                          =
  ^
> include/linux/arm-smccc.h:299:48: note: expanded from macro 'arm_smccc_1_=
1_smc'
> #define arm_smccc_1_1_smc(...)  __arm_smccc_1_1(SMCCC_SMC_INST, __VA_ARGS=
__)
> ^
> include/linux/arm-smccc.h:176:24: note: expanded from macro 'SMCCC_SMC_IN=
ST'
> #define SMCCC_SMC_INST  __SMC(0)
> ^
> note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=3D=
0 to see all)
> arch/arm/include/asm/opcodes.h:210:2: note: expanded from macro '__inst_a=
rm_thumb32'
> __inst_thumb32(thumb_opcode)
> ^
> arch/arm/include/asm/opcodes.h:200:27: note: expanded from macro '__inst_=
thumb32'
> #define __inst_thumb32(x) ___inst_thumb32(                               =
                            ^
> arch/arm/include/asm/opcodes.h:225:2: note: expanded from macro '___inst_=
thumb32'
> ".short " __stringify(first) ", " __stringify(second) "nt"
> ^
> >> drivers/firmware/arm_scmi/smc.c:109:2: error: write to reserved regist=
er 'R7'
> include/linux/arm-smccc.h:354:4: note: expanded from macro 'arm_smccc_1_1=
_invoke'
> arm_smccc_1_1_hvc(__VA_ARGS__);                                          =
  ^
> include/linux/arm-smccc.h:315:48: note: expanded from macro 'arm_smccc_1_=
1_hvc'
> #define arm_smccc_1_1_hvc(...)  __arm_smccc_1_1(SMCCC_HVC_INST, __VA_ARGS=
__)
> ^
> include/linux/arm-smccc.h:177:24: note: expanded from macro 'SMCCC_HVC_IN=
ST'
> #define SMCCC_HVC_INST  __HVC(0)
> ^
> note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=3D=
0 to see all)
> arch/arm/include/asm/opcodes.h:210:2: note: expanded from macro '__inst_a=
rm_thumb32'
> __inst_thumb32(thumb_opcode)
> ^
> arch/arm/include/asm/opcodes.h:200:27: note: expanded from macro '__inst_=
thumb32'
> #define __inst_thumb32(x) ___inst_thumb32(                               =
                            ^
> arch/arm/include/asm/opcodes.h:225:2: note: expanded from macro '___inst_=
thumb32'
> ".short " __stringify(first) ", " __stringify(second) "nt"
> ^
> >> drivers/firmware/arm_scmi/smc.c:109:2: error: write to reserved regist=
er 'R7'
> include/linux/arm-smccc.h:360:4: note: expanded from macro 'arm_smccc_1_1=
_invoke'
> __fail_smccc_1_1(__VA_ARGS__);                                           =
  ^
> include/linux/arm-smccc.h:330:8: note: expanded from macro '__fail_smccc_=
1_1'
> asm ("" __constraints(__count_args(__VA_ARGS__)));                       =
       ^
> 3 errors generated.
>
> vim +/R7 +109 drivers/firmware/arm_scmi/smc.c
>
>     98
>     99  static int smc_send_message(struct scmi_chan_info *cinfo,
>    100                              struct scmi_xfer *xfer)
>    101  {
>    102          struct scmi_smc *scmi_info =3D cinfo->transport_info;
>    103          struct arm_smccc_res res;
>    104
>    105          mutex_lock(&smc_mutex);
>    106
>    107          shmem_tx_prepare(scmi_info->shmem, xfer);
>    108
>  > 109          arm_smccc_1_1_invoke(scmi_info->func_id, 0, 0, 0, 0, 0, 0=
, 0, &res);
>    110          scmi_rx_callback(scmi_info->cinfo, shmem_read_header(scmi=
_info->shmem));
>    111
>    112          mutex_unlock(&smc_mutex);
>    113
>    114          return res.a0;
>    115  }
>    116
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202005200317.WyMjX6mI%25lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============0612481140786548957==--

