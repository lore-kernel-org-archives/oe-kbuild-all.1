Content-Type: multipart/mixed; boundary="===============1971133059345760442=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCHv2 1/4] perf/core: Export is_kernel_event()
Date: Sat, 31 Oct 2020 15:35:32 +0800
Message-ID: <202010311505.AVo65OBZ-lkp@intel.com>
In-Reply-To: <fbe7bf4fb07ecd8c77cf0321555eabc84421ed41.1603363729.git.saiprakash.ranjan@codeaurora.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1971133059345760442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sai,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on f4cb5e9daedf56671badc93ac7f364043aa33886]

url:    https://github.com/0day-ci/linux/commits/Sai-Prakash-Ranjan/coresig=
ht-etf-etb10-etr-Fix-NULL-pointer-dereference-crashes/20201022-185929
base:    f4cb5e9daedf56671badc93ac7f364043aa33886
config: powerpc-mpc8540_ads_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f5ab45a4aa0d4c3be07201c8d=
5599e6dcc37226c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sai-Prakash-Ranjan/coresight-etf-e=
tb10-etr-Fix-NULL-pointer-dereference-crashes/20201022-185929
        git checkout f5ab45a4aa0d4c3be07201c8d5599e6dcc37226c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dpowerpc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:84,
                    from arch/powerpc/kernel/syscalls.c:19:
>> include/linux/perf_event.h:1511:13: error: 'is_kernel_event' defined but=
 not used [-Werror=3Dunused-function]
    1511 | static bool is_kernel_event(struct perf_event *event) { return f=
alse; }
         |             ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   arch/powerpc/kernel/traps.c:1663:6: error: no previous prototype for 'st=
ack_overflow_exception' [-Werror=3Dmissing-prototypes]
    1663 | void stack_overflow_exception(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/traps.c:1993:6: error: no previous prototype for 'De=
bugException' [-Werror=3Dmissing-prototypes]
    1993 | void DebugException(struct pt_regs *regs, unsigned long debug_st=
atus)
         |      ^~~~~~~~~~~~~~
   arch/powerpc/kernel/traps.c:2098:6: error: no previous prototype for 'Ca=
cheLockingException' [-Werror=3Dmissing-prototypes]
    2098 | void CacheLockingException(struct pt_regs *regs, unsigned long a=
ddress,
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/traps.c:2112:6: error: no previous prototype for 'SP=
EFloatingPointException' [-Werror=3Dmissing-prototypes]
    2112 | void SPEFloatingPointException(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/traps.c:2164:6: error: no previous prototype for 'SP=
EFloatingPointRoundException' [-Werror=3Dmissing-prototypes]
    2164 | void SPEFloatingPointRoundException(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/emulated_ops.h:10,
                    from arch/powerpc/kernel/traps.c:41:
>> include/linux/perf_event.h:1511:13: error: 'is_kernel_event' defined but=
 not used [-Werror=3Dunused-function]
    1511 | static bool is_kernel_event(struct perf_event *event) { return f=
alse; }
         |             ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors

vim +/is_kernel_event +1511 include/linux/perf_event.h

  1478	=

  1479	typedef int (perf_ksymbol_get_name_f)(char *name, int name_len, void=
 *data);
  1480	static inline void perf_event_ksymbol(u16 ksym_type, u64 addr, u32 l=
en,
  1481					      bool unregister, const char *sym)	{ }
  1482	static inline void perf_event_bpf_event(struct bpf_prog *prog,
  1483						enum perf_bpf_event_type type,
  1484						u16 flags)			{ }
  1485	static inline void perf_event_exec(void)				{ }
  1486	static inline void perf_event_comm(struct task_struct *tsk, bool exe=
c)	{ }
  1487	static inline void perf_event_namespaces(struct task_struct *tsk)	{ }
  1488	static inline void perf_event_fork(struct task_struct *tsk)		{ }
  1489	static inline void perf_event_text_poke(const void *addr,
  1490						const void *old_bytes,
  1491						size_t old_len,
  1492						const void *new_bytes,
  1493						size_t new_len)			{ }
  1494	static inline void perf_event_init(void)				{ }
  1495	static inline int  perf_swevent_get_recursion_context(void)		{ retur=
n -1; }
  1496	static inline void perf_swevent_put_recursion_context(int rctx)		{ }
  1497	static inline u64 perf_swevent_set_period(struct perf_event *event)	=
{ return 0; }
  1498	static inline void perf_event_enable(struct perf_event *event)		{ }
  1499	static inline void perf_event_disable(struct perf_event *event)		{ }
  1500	static inline int __perf_event_disable(void *info)			{ return -1; }
  1501	static inline void perf_event_task_tick(void)				{ }
  1502	static inline int perf_event_release_kernel(struct perf_event *event=
)	{ return 0; }
  1503	static inline int perf_event_period(struct perf_event *event, u64 va=
lue)
  1504	{
  1505		return -EINVAL;
  1506	}
  1507	static inline u64 perf_event_pause(struct perf_event *event, bool re=
set)
  1508	{
  1509		return 0;
  1510	}
> 1511	static bool is_kernel_event(struct perf_event *event) { return false=
; }
  1512	#endif
  1513	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1971133059345760442==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1971133059345760442==--

