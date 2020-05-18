Content-Type: multipart/mixed; boundary="===============2169449738619719459=="
MIME-Version: 1.0
From: Sumit Garg <sumit.garg@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [RFC] arm64: Enable perf events based hard lockup detector
Date: Mon, 18 May 2020 11:25:37 +0530
Message-ID: <CAFA6WYMnv5xgFSa+2UbqVW7MPfSGvsQ5MdeUwh1aX-WXKc0T_A@mail.gmail.com>
In-Reply-To: <202005160303.4pIJwjQx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2169449738619719459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, 16 May 2020 at 01:21, kbuild test robot <lkp@intel.com> wrote:
>
> Hi Sumit,
>
> [FYI, it's a private test report for your RFC patch.]
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on arm-soc/for-next arm/for-next kvmarm/next linus=
/master v5.7-rc5 next-20200515]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>

This isn't a correct report as it doesn't take in account the
dependency of this patch on other patch-set [1] mentioned after "---".

[1] https://patchwork.kernel.org/cover/11047407/

-Sumit

> url:    https://github.com/0day-ci/linux/commits/Sumit-Garg/arm64-Enable-=
perf-events-based-hard-lockup-detector/20200515-165226
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git f=
or-next/core
> config: arm64-randconfig-r025-20200515 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 9d4c=
f5bd421fb6467ff5f00e26a37527246dd4d6)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu_i=
rq_ops'; did you mean 'cpu_map_ops'?
> irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> ^~~~~~~~~~~
> cpu_map_ops
> include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> ^
> include/linux/percpu-defs.h:235:20: note: expanded from macro 'per_cpu_pt=
r'
> __verify_pcpu_ptr(ptr);                                                  =
                    ^
> include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_p=
cpu_ptr'
> const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL;           =
                                                 ^
> include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> ^
> drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu_i=
rq_ops'; did you mean 'cpu_map_ops'?
> irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> ^~~~~~~~~~~
> cpu_map_ops
> include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> ^
> include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_pt=
r'
> SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                          =
                    ^
> include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
> RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
> ^
> include/linux/compiler.h:165:31: note: expanded from macro 'RELOC_HIDE'
> __ptr =3D (unsigned long) (ptr);                                         =
                     ^
> include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> ^
> drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu_i=
rq_ops'; did you mean 'cpu_map_ops'?
> irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> ^~~~~~~~~~~
> cpu_map_ops
> include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> ^
> include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_pt=
r'
> SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                          =
                    ^
> include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
> RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
> ^
> include/linux/compiler.h:165:31: note: expanded from macro 'RELOC_HIDE'
> __ptr =3D (unsigned long) (ptr);                                         =
                     ^
> include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> ^
> drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu_i=
rq_ops'; did you mean 'cpu_map_ops'?
> irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> ^~~~~~~~~~~
> cpu_map_ops
> include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> ^
> include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_pt=
r'
> SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                          =
                    ^
> include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
> RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
> ^
> include/linux/compiler.h:166:13: note: expanded from macro 'RELOC_HIDE'
> (typeof(ptr)) (__ptr + (off)); })
> ^
> include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> ^
> drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu_i=
rq_ops'; did you mean 'cpu_map_ops'?
> irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> ^~~~~~~~~~~
> cpu_map_ops
> include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> ^
> include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_pt=
r'
> SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                          =
                    ^
> include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
> RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
> ^
> include/linux/compiler.h:166:13: note: expanded from macro 'RELOC_HIDE'
> (typeof(ptr)) (__ptr + (off)); })
> ^
> include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> ^
> >> drivers/perf/arm_pmu.c:613:10: error: assigning to 'const struct pmu_i=
rq_ops *' from incompatible type 'typeof (*((&(cpu_map_ops))))' (aka 'const=
 struct bpf_map_ops')
> irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/perf/arm_pmu.c:614:18: error: use of undeclared identifier 'pmunm=
i_ops'
> if (irq_ops =3D=3D &pmunmi_ops || irq_ops =3D=3D &percpu_pmunmi_ops)
> ^
> drivers/perf/arm_pmu.c:614:44: error: use of undeclared identifier 'percp=
u_pmunmi_ops'
> if (irq_ops =3D=3D &pmunmi_ops || irq_ops =3D=3D &percpu_pmunmi_ops)
> ^
> 8 errors generated.
>
> vim +613 drivers/perf/arm_pmu.c
>
>    608
>    609  bool arm_pmu_irq_is_nmi(void)
>    610  {
>    611          const struct pmu_irq_ops *irq_ops;
>    612
>  > 613          irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
>    614          if (irq_ops =3D=3D &pmunmi_ops || irq_ops =3D=3D &percpu_=
pmunmi_ops)
>    615                  return true;
>    616          else
>    617                  return false;
>    618  }
>    619
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2169449738619719459==--

