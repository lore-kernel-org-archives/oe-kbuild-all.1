Content-Type: multipart/mixed; boundary="===============0740593727886624001=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel/trace/trace_recursion_record.o' being placed in section `.eh_frame'
Date: Sun, 31 Jan 2021 12:29:25 +0800
Message-ID: <20210131042925.GC28302@intel.com>
In-Reply-To: <202101311020.6pJlxWtd-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0740593727886624001==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2021 at 10:09:22AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   8c947645151cc2c279c75c7f640dd8f0fc0b9aa2
> commit: 773c16705058e9be7b0f4ce124e89cd231c120a2 ftrace: Add recording of=
 functions that caused recursion
> date:   3 months ago
> config: arm64-randconfig-r013-20210130 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 275c=
6af7d7f1ed63a03d05b4484413e447133269)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D773c16705058e9be7b0f4ce124e89cd231c120a2
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 773c16705058e9be7b0f4ce124e89cd231c120a2
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
Sorry, kindly ignore this false positive

> =

> All warnings (new ones prefixed by >>):
> =

>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/irq_sim.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/proc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/cpuhotplug.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/msi.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/ipi.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/affinity.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/debugfs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/update.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/sync.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/srcutree.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/rcuscale.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/refscale.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/tree.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/rcu_segcblist.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/mapping.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/direct.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/ops_helpers.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/dummy.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/coherent.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/swiotlb.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/pool.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/remap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/freezer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/profile.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/stacktrace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/time.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/hrtimer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timekeeping.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/ntp.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/clocksource.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/jiffies.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timer_list.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timeconv.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timecounter.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/alarmtimer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/posix-timers.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/posix-cpu-timers.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/posix-clock.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/itimer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/clockevents.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-common.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-broadcast.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-broadcast-hrtimer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/sched_clock.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-oneshot.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-sched.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/vsyscall.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timekeeping_debug.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/namespace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/futex.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/smp.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/kallsyms.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/cgroup.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/rstat.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/namespace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/cgroup-v1.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/freezer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/legacy_freezer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/rdma.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/cpuset.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/utsname.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/configs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/kheaders.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/stop_machine.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/gcov/base.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/gcov/fs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/gcov/clang.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/debug/debug_core.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/debug/gdbstub.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/watchdog.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/utsname_sysctl.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/tracepoint.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/latencytop.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_selftest_dynamic.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_clock.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/ftrace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/ring_buffer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/ring_buffer_benchmark.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_output.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_seq.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_stat.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_printk.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/synth_event_gen_test.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_sched_switch.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_functions.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_preemptirq.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_irqsoff.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_nop.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/blktrace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_events.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_export.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_event_perf.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_events_filter.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_events_trigger.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_events_synth.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/power-traces.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/rpm-traces.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_dynevent.o' being placed in section `.eh_frame'
> >> aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_recursion_record.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_benchmark.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq_work.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/scs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/events/core.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/events/ring_buffer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/events/callchain.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/events/hw_breakpoint.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/jump_label.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/context_tracking.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/torture.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/iomem.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rseq.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/scftorture.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `certs/=
system_keyring.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `certs/=
blacklist.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `certs/=
blacklist_nohashes.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/fil=
emap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
pool.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/oom=
_kill.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/fad=
vise.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mac=
cess.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e-writeback.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/rea=
dahead.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/swa=
p.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/tru=
ncate.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/vms=
can.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/shm=
em.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/uti=
l.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mmz=
one.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/vms=
tat.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/bac=
king-dev.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mm_=
init.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/per=
cpu.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/sla=
b_common.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/com=
paction.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/vma=
cache.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/int=
erval_tree.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/lis=
t_lru.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/wor=
kingset.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/deb=
ug.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/gup=
.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/hig=
hmem.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
ory.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/min=
core.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mlo=
ck.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mma=
p.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mmu=
_gather.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mpr=
otect.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mre=
map.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/msy=
nc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e_vma_mapped.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
ewalk.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pgt=
able-generic.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/rma=
p.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/vma=
lloc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ior=
emap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pro=
cess_vm_access.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e_alloc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ini=
t-mm.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
block.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mad=
vise.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e_io.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/swa=
p_state.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/swa=
pfile.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/swa=
p_slots.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/dma=
pool.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
policy.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/spa=
rse.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/spa=
rse-vmemmap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ksm=
.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/sla=
b.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/fai=
lslab.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
test.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mig=
rate.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/rod=
ata_test.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/zpo=
ol.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/zbu=
d.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/zsm=
alloc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/z3f=
old.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ear=
ly_ioremap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/fra=
me_vector.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
fd.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ptd=
ump.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e_reporting.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/ope=
n.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/rea=
d_write.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/fil=
e_table.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/sup=
er.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/cha=
r_dev.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/sta=
t.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/exe=
c.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/pip=
e.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/nam=
ei.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/fcn=
tl.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/ioc=
tl.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/rea=
ddir.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/sel=
ect.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/dca=
che.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/ino=
de.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/att=
r.o' being placed in section `.eh_frame'
> --
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/irq_sim.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/proc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/cpuhotplug.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/msi.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/ipi.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/affinity.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq/debugfs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/update.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/sync.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/srcutree.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/rcuscale.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/refscale.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/tree.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rcu/rcu_segcblist.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/mapping.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/direct.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/ops_helpers.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/dummy.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/coherent.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/swiotlb.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/pool.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/dma/remap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/freezer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/profile.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/stacktrace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/time.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/hrtimer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timekeeping.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/ntp.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/clocksource.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/jiffies.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timer_list.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timeconv.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timecounter.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/alarmtimer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/posix-timers.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/posix-cpu-timers.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/posix-clock.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/itimer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/clockevents.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-common.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-broadcast.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-broadcast-hrtimer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/sched_clock.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-oneshot.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/tick-sched.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/vsyscall.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/timekeeping_debug.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/time/namespace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/futex.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/smp.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/kallsyms.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/cgroup.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/rstat.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/namespace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/cgroup-v1.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/freezer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/legacy_freezer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/rdma.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/cgroup/cpuset.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/utsname.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/configs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/kheaders.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/stop_machine.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/gcov/base.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/gcov/fs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/gcov/clang.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/debug/debug_core.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/debug/gdbstub.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/watchdog.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/utsname_sysctl.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/tracepoint.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/latencytop.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_selftest_dynamic.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_clock.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/ftrace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/ring_buffer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/ring_buffer_benchmark.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_output.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_seq.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_stat.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_printk.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/synth_event_gen_test.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_sched_switch.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_functions.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_preemptirq.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_irqsoff.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_nop.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/blktrace.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_events.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_export.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_event_perf.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_events_filter.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_events_trigger.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_events_synth.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/power-traces.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/rpm-traces.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_dynevent.o' being placed in section `.eh_frame'
> >> aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_recursion_record.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/trace/trace_benchmark.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/irq_work.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/scs.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/events/core.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/events/ring_buffer.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/events/callchain.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/events/hw_breakpoint.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/jump_label.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/context_tracking.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/torture.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/iomem.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/rseq.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `kernel=
/scftorture.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `certs/=
system_keyring.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `certs/=
blacklist.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `certs/=
blacklist_nohashes.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/fil=
emap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
pool.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/oom=
_kill.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/fad=
vise.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mac=
cess.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e-writeback.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/rea=
dahead.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/swa=
p.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/tru=
ncate.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/vms=
can.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/shm=
em.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/uti=
l.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mmz=
one.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/vms=
tat.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/bac=
king-dev.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mm_=
init.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/per=
cpu.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/sla=
b_common.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/com=
paction.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/vma=
cache.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/int=
erval_tree.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/lis=
t_lru.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/wor=
kingset.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/deb=
ug.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/gup=
.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/hig=
hmem.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
ory.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/min=
core.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mlo=
ck.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mma=
p.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mmu=
_gather.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mpr=
otect.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mre=
map.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/msy=
nc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e_vma_mapped.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
ewalk.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pgt=
able-generic.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/rma=
p.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/vma=
lloc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ior=
emap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pro=
cess_vm_access.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e_alloc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ini=
t-mm.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
block.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mad=
vise.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e_io.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/swa=
p_state.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/swa=
pfile.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/swa=
p_slots.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/dma=
pool.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
policy.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/spa=
rse.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/spa=
rse-vmemmap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ksm=
.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/sla=
b.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/fai=
lslab.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
test.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mig=
rate.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/rod=
ata_test.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/zpo=
ol.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/zbu=
d.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/zsm=
alloc.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/z3f=
old.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ear=
ly_ioremap.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/fra=
me_vector.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/mem=
fd.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/ptd=
ump.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `mm/pag=
e_reporting.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/ope=
n.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/rea=
d_write.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/fil=
e_table.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/sup=
er.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/cha=
r_dev.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/sta=
t.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/exe=
c.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/pip=
e.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/nam=
ei.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/fcn=
tl.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/ioc=
tl.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/rea=
ddir.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/sel=
ect.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/dca=
che.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/ino=
de.o' being placed in section `.eh_frame'
>    aarch64-linux-gnu-ld: warning: orphan section `.eh_frame' from `fs/att=
r.o' being placed in section `.eh_frame'
> ..
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============0740593727886624001==--

