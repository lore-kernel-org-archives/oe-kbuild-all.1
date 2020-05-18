Content-Type: multipart/mixed; boundary="===============5029805432234367148=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC] arm64: Enable perf events based hard lockup detector
Date: Tue, 19 May 2020 07:51:01 +0800
Message-ID: <20200518235100.GA30480@intel.com>
In-Reply-To: <CAFA6WYMnv5xgFSa+2UbqVW7MPfSGvsQ5MdeUwh1aX-WXKc0T_A@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5029805432234367148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 11:25:37AM +0530, Sumit Garg wrote:
> Hi,
> =

> On Sat, 16 May 2020 at 01:21, kbuild test robot <lkp@intel.com> wrote:
> >
> > Hi Sumit,
> >
> > [FYI, it's a private test report for your RFC patch.]
> > [auto build test ERROR on arm64/for-next/core]
> > [also build test ERROR on arm-soc/for-next arm/for-next kvmarm/next lin=
us/master v5.7-rc5 next-20200515]
> > [if your patch is applied to the wrong git tree, please drop us a note =
to help
> > improve the system. BTW, we also suggest to use '--base' option to spec=
ify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/3=
7406982]
> >
> =

> This isn't a correct report as it doesn't take in account the
> dependency of this patch on other patch-set [1] mentioned after "---".
thanks for the input, kindly ignore this false report. So far,
the bot is not able to parse base info like this, thus leads
to false positive.

> =

> [1] https://patchwork.kernel.org/cover/11047407/
> =

> -Sumit
> =

> > url:    https://github.com/0day-ci/linux/commits/Sumit-Garg/arm64-Enabl=
e-perf-events-based-hard-lockup-detector/20200515-165226
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git=
 for-next/core
> > config: arm64-randconfig-r025-20200515 (attached as .config)
> > compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 9d=
4cf5bd421fb6467ff5f00e26a37527246dd4d6)
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm64 cross compiling tool for clang build
> >         # apt-get install binutils-aarch64-linux-gnu
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Darm64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu=
_irq_ops'; did you mean 'cpu_map_ops'?
> > irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> > ^~~~~~~~~~~
> > cpu_map_ops
> > include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> > #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> > ^
> > include/linux/percpu-defs.h:235:20: note: expanded from macro 'per_cpu_=
ptr'
> > __verify_pcpu_ptr(ptr);                                                =
                      ^
> > include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify=
_pcpu_ptr'
> > const void __percpu *__vpp_verify =3D (typeof((ptr) + 0))NULL;         =
                                                   ^
> > include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> > BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> > ^
> > drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu=
_irq_ops'; did you mean 'cpu_map_ops'?
> > irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> > ^~~~~~~~~~~
> > cpu_map_ops
> > include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> > #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> > ^
> > include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_=
ptr'
> > SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                        =
                      ^
> > include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PE=
RCPU_PTR'
> > RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
> > ^
> > include/linux/compiler.h:165:31: note: expanded from macro 'RELOC_HIDE'
> > __ptr =3D (unsigned long) (ptr);                                       =
                       ^
> > include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> > BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> > ^
> > drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu=
_irq_ops'; did you mean 'cpu_map_ops'?
> > irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> > ^~~~~~~~~~~
> > cpu_map_ops
> > include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> > #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> > ^
> > include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_=
ptr'
> > SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                        =
                      ^
> > include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PE=
RCPU_PTR'
> > RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
> > ^
> > include/linux/compiler.h:165:31: note: expanded from macro 'RELOC_HIDE'
> > __ptr =3D (unsigned long) (ptr);                                       =
                       ^
> > include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> > BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> > ^
> > drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu=
_irq_ops'; did you mean 'cpu_map_ops'?
> > irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> > ^~~~~~~~~~~
> > cpu_map_ops
> > include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> > #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> > ^
> > include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_=
ptr'
> > SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                        =
                      ^
> > include/linux/percpu-defs.h:231:23: note: expanded from macro 'SHIFT_PE=
RCPU_PTR'
> > RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
> > ^
> > include/linux/compiler.h:166:13: note: expanded from macro 'RELOC_HIDE'
> > (typeof(ptr)) (__ptr + (off)); })
> > ^
> > include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> > BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> > ^
> > drivers/perf/arm_pmu.c:613:20: error: use of undeclared identifier 'cpu=
_irq_ops'; did you mean 'cpu_map_ops'?
> > irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> > ^~~~~~~~~~~
> > cpu_map_ops
> > include/linux/percpu-defs.h:269:43: note: expanded from macro 'per_cpu'
> > #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
> > ^
> > include/linux/percpu-defs.h:236:20: note: expanded from macro 'per_cpu_=
ptr'
> > SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                        =
                      ^
> > include/linux/percpu-defs.h:231:49: note: expanded from macro 'SHIFT_PE=
RCPU_PTR'
> > RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
> > ^
> > include/linux/compiler.h:166:13: note: expanded from macro 'RELOC_HIDE'
> > (typeof(ptr)) (__ptr + (off)); })
> > ^
> > include/linux/bpf_types.h:108:35: note: 'cpu_map_ops' declared here
> > BPF_MAP_TYPE(BPF_MAP_TYPE_CPUMAP, cpu_map_ops)
> > ^
> > >> drivers/perf/arm_pmu.c:613:10: error: assigning to 'const struct pmu=
_irq_ops *' from incompatible type 'typeof (*((&(cpu_map_ops))))' (aka 'con=
st struct bpf_map_ops')
> > irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> > ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/perf/arm_pmu.c:614:18: error: use of undeclared identifier 'pmu=
nmi_ops'
> > if (irq_ops =3D=3D &pmunmi_ops || irq_ops =3D=3D &percpu_pmunmi_ops)
> > ^
> > drivers/perf/arm_pmu.c:614:44: error: use of undeclared identifier 'per=
cpu_pmunmi_ops'
> > if (irq_ops =3D=3D &pmunmi_ops || irq_ops =3D=3D &percpu_pmunmi_ops)
> > ^
> > 8 errors generated.
> >
> > vim +613 drivers/perf/arm_pmu.c
> >
> >    608
> >    609  bool arm_pmu_irq_is_nmi(void)
> >    610  {
> >    611          const struct pmu_irq_ops *irq_ops;
> >    612
> >  > 613          irq_ops =3D per_cpu(cpu_irq_ops, smp_processor_id());
> >    614          if (irq_ops =3D=3D &pmunmi_ops || irq_ops =3D=3D &percp=
u_pmunmi_ops)
> >    615                  return true;
> >    616          else
> >    617                  return false;
> >    618  }
> >    619
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============5029805432234367148==--

