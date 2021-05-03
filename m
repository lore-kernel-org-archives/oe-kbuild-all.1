Content-Type: multipart/mixed; boundary="===============5487347446312556335=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: arch/mips/kvm/emulate.c:946:23: warning: no previous prototype for function 'kvm_mips_emul_eret'
Date: Tue, 04 May 2021 05:05:23 +0800
Message-ID: <202105040513.FKoNq7QG-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5487347446312556335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d835ff6c96ae6fa1ea474b0290a46e514ab6742b
commit: 0f78355c450835053fed85828c9d6526594c0921 KVM: MIPS: Enable KVM supp=
ort for Loongson-3
date:   11 months ago
config: mips-randconfig-r026-20210504 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f5a2a=
5836cc8e4c1def2bdeb022e7b496623439)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0f78355c450835053fed85828c9d6526594c0921
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0f78355c450835053fed85828c9d6526594c0921
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:38:
   In file included from arch/mips/include/asm/thread_info.h:16:
   In file included from arch/mips/include/asm/processor.h:14:
   In file included from include/linux/atomic.h:7:
   arch/mips/include/asm/atomic.h:262:1: warning: converting the result of =
'<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
   ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
   ^
   arch/mips/include/asm/atomic.h:252:7: note: expanded from macro 'ATOMIC_=
SIP_OP'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/emulate.c:14:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:6:
   In file included from include/linux/seqlock.h:36:
   In file included from include/linux/spinlock.h:83:
   In file included from include/linux/spinlock_types.h:18:
   In file included from include/linux/lockdep.h:44:
   include/linux/debug_locks.h:17:9: warning: converting the result of '<<'=
 to a boolean always evaluates to true [-Wtautological-constant-compare]
           return xchg(&debug_locks, 0);
                  ^
   arch/mips/include/asm/cmpxchg.h:102:7: note: expanded from macro 'xchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/emulate.c:14:
   In file included from include/linux/ktime.h:24:
   In file included from include/linux/time.h:74:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:65:
   In file included from arch/mips/include/asm/timex.h:19:
   In file included from arch/mips/include/asm/cpu-type.h:12:
   In file included from include/linux/smp.h:15:
   include/linux/llist.h:222:9: warning: converting the result of '<<' to a=
 boolean always evaluates to true [-Wtautological-constant-compare]
           return xchg(&head->first, NULL);
                  ^
   arch/mips/include/asm/cmpxchg.h:102:7: note: expanded from macro 'xchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/emulate.c:15:
   In file included from include/linux/kvm_host.h:14:
   In file included from include/linux/mm.h:95:
   arch/mips/include/asm/pgtable.h:210:3: warning: converting the result of=
 '<<' to a boolean always evaluates to true [-Wtautological-constant-compar=
e]
                   cmpxchg64(&buddy->pte, 0, _PAGE_GLOBAL);
                   ^
   arch/mips/include/asm/cmpxchg.h:220:2: note: expanded from macro 'cmpxch=
g64'
           cmpxchg((ptr), (o), (n));                                       \
           ^
   arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/emulate.c:15:
   In file included from include/linux/kvm_host.h:14:
   In file included from include/linux/mm.h:95:
   arch/mips/include/asm/pgtable.h:210:3: warning: converting the result of=
 '<<' to a boolean always evaluates to true [-Wtautological-constant-compar=
e]
   arch/mips/include/asm/cmpxchg.h:220:2: note: expanded from macro 'cmpxch=
g64'
           cmpxchg((ptr), (o), (n));                                       \
           ^
   arch/mips/include/asm/cmpxchg.h:204:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/emulate.c:15:
   include/linux/kvm_host.h:331:9: warning: converting the result of '<<' t=
o a boolean always evaluates to true [-Wtautological-constant-compare]
           return cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE);
                  ^
   arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/emulate.c:15:
   include/linux/kvm_host.h:331:9: warning: converting the result of '<<' t=
o a boolean always evaluates to true [-Wtautological-constant-compare]
   arch/mips/include/asm/cmpxchg.h:204:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/emulate.c:24:
   In file included from arch/mips/include/asm/mmu_context.h:23:
   arch/mips/include/asm/ginvt.h:41:20: warning: shifting a negative signed=
 value is undefined [-Wshift-negative-value]
           addr &=3D PAGE_MASK << 1;
                   ~~~~~~~~~ ^
   arch/mips/include/asm/ginvt.h:52:20: warning: shifting a negative signed=
 value is undefined [-Wshift-negative-value]
           addr &=3D PAGE_MASK << 1;
                   ~~~~~~~~~ ^
>> arch/mips/kvm/emulate.c:946:23: warning: no previous prototype for funct=
ion 'kvm_mips_emul_eret' [-Wmissing-prototypes]
   enum emulation_result kvm_mips_emul_eret(struct kvm_vcpu *vcpu)
                         ^
   arch/mips/kvm/emulate.c:946:1: note: declare 'static' if the function is=
 not intended to be used outside of this translation unit
   enum emulation_result kvm_mips_emul_eret(struct kvm_vcpu *vcpu)
   ^
   static =

>> arch/mips/kvm/emulate.c:1029:23: warning: no previous prototype for func=
tion 'kvm_mips_emul_tlbr' [-Wmissing-prototypes]
   enum emulation_result kvm_mips_emul_tlbr(struct kvm_vcpu *vcpu)
                         ^
   arch/mips/kvm/emulate.c:1029:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   enum emulation_result kvm_mips_emul_tlbr(struct kvm_vcpu *vcpu)
   ^
   static =

>> arch/mips/kvm/emulate.c:1102:23: warning: no previous prototype for func=
tion 'kvm_mips_emul_tlbwi' [-Wmissing-prototypes]
   enum emulation_result kvm_mips_emul_tlbwi(struct kvm_vcpu *vcpu)
                         ^
   arch/mips/kvm/emulate.c:1102:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   enum emulation_result kvm_mips_emul_tlbwi(struct kvm_vcpu *vcpu)
   ^
   static =

>> arch/mips/kvm/emulate.c:1138:23: warning: no previous prototype for func=
tion 'kvm_mips_emul_tlbwr' [-Wmissing-prototypes]
   enum emulation_result kvm_mips_emul_tlbwr(struct kvm_vcpu *vcpu)
                         ^
   arch/mips/kvm/emulate.c:1138:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   enum emulation_result kvm_mips_emul_tlbwr(struct kvm_vcpu *vcpu)
   ^
   static =

>> arch/mips/kvm/emulate.c:1163:23: warning: no previous prototype for func=
tion 'kvm_mips_emul_tlbp' [-Wmissing-prototypes]
   enum emulation_result kvm_mips_emul_tlbp(struct kvm_vcpu *vcpu)
                         ^
   arch/mips/kvm/emulate.c:1163:1: note: declare 'static' if the function i=
s not intended to be used outside of this translation unit
   enum emulation_result kvm_mips_emul_tlbp(struct kvm_vcpu *vcpu)
   ^
   static =

   21 warnings generated.
   Assembler messages:
   Fatal error: invalid -march=3D option: `mips64r2'
   clang-13: error: assembler command failed with exit code 1 (use -v to se=
e invocation)
--
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/loongson_ipi.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:6:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/mips/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:38:
   In file included from arch/mips/include/asm/thread_info.h:16:
   In file included from arch/mips/include/asm/processor.h:14:
   In file included from include/linux/atomic.h:7:
   arch/mips/include/asm/atomic.h:262:1: warning: converting the result of =
'<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
   ATOMIC_SIP_OP(atomic64, s64, dsubu, lld, scd)
   ^
   arch/mips/include/asm/atomic.h:252:7: note: expanded from macro 'ATOMIC_=
SIP_OP'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/loongson_ipi.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:5:
   In file included from include/linux/context_tracking_state.h:5:
   In file included from include/linux/percpu.h:7:
   In file included from include/linux/smp.h:15:
   include/linux/llist.h:222:9: warning: converting the result of '<<' to a=
 boolean always evaluates to true [-Wtautological-constant-compare]
           return xchg(&head->first, NULL);
                  ^
   arch/mips/include/asm/cmpxchg.h:102:7: note: expanded from macro 'xchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/loongson_ipi.c:11:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:7:
   In file included from include/linux/lockdep.h:44:
   include/linux/debug_locks.h:17:9: warning: converting the result of '<<'=
 to a boolean always evaluates to true [-Wtautological-constant-compare]
           return xchg(&debug_locks, 0);
                  ^
   arch/mips/include/asm/cmpxchg.h:102:7: note: expanded from macro 'xchg'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/loongson_ipi.c:11:
   In file included from include/linux/kvm_host.h:14:
   In file included from include/linux/mm.h:95:
   arch/mips/include/asm/pgtable.h:210:3: warning: converting the result of=
 '<<' to a boolean always evaluates to true [-Wtautological-constant-compar=
e]
                   cmpxchg64(&buddy->pte, 0, _PAGE_GLOBAL);
                   ^
   arch/mips/include/asm/cmpxchg.h:220:2: note: expanded from macro 'cmpxch=
g64'
           cmpxchg((ptr), (o), (n));                                       \
           ^
   arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/loongson_ipi.c:11:
   In file included from include/linux/kvm_host.h:14:
   In file included from include/linux/mm.h:95:
   arch/mips/include/asm/pgtable.h:210:3: warning: converting the result of=
 '<<' to a boolean always evaluates to true [-Wtautological-constant-compar=
e]
   arch/mips/include/asm/cmpxchg.h:220:2: note: expanded from macro 'cmpxch=
g64'
           cmpxchg((ptr), (o), (n));                                       \
           ^
   arch/mips/include/asm/cmpxchg.h:204:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/loongson_ipi.c:11:
   include/linux/kvm_host.h:331:9: warning: converting the result of '<<' t=
o a boolean always evaluates to true [-Wtautological-constant-compare]
           return cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE);
                  ^
   arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
   In file included from arch/mips/kvm/loongson_ipi.c:11:
   include/linux/kvm_host.h:331:9: warning: converting the result of '<<' t=
o a boolean always evaluates to true [-Wtautological-constant-compare]
   arch/mips/include/asm/cmpxchg.h:204:7: note: expanded from macro 'cmpxch=
g'
           if (!__SYNC_loongson3_war)                                      \
                ^
   arch/mips/include/asm/sync.h:147:34: note: expanded from macro '__SYNC_l=
oongson3_war'
   # define __SYNC_loongson3_war   (1 << 31)
                                      ^
>> arch/mips/kvm/loongson_ipi.c:190:6: warning: no previous prototype for f=
unction 'kvm_init_loongson_ipi' [-Wmissing-prototypes]
   void kvm_init_loongson_ipi(struct kvm *kvm)
        ^
   arch/mips/kvm/loongson_ipi.c:190:1: note: declare 'static' if the functi=
on is not intended to be used outside of this translation unit
   void kvm_init_loongson_ipi(struct kvm *kvm)
   ^
   static =

   15 warnings generated.
   Assembler messages:
   Fatal error: invalid -march=3D option: `mips64r2'
   clang-13: error: assembler command failed with exit code 1 (use -v to se=
e invocation)


vim +/kvm_mips_emul_eret +946 arch/mips/kvm/emulate.c

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   945=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  @946=
  enum emulation_result kvm_mips_emul_eret(struct kvm_vcpu *vcpu)
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   947=
  {
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   948=
  	struct mips_coproc *cop0 =3D vcpu->arch.cop0;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   949=
  	enum emulation_result er =3D EMULATE_DONE;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   950=
  =

ede5f3e7b54a43 arch/mips/kvm/emulate.c       James Hogan   2016-10-25   951=
  	if (kvm_read_c0_guest_status(cop0) & ST0_ERL) {
ede5f3e7b54a43 arch/mips/kvm/emulate.c       James Hogan   2016-10-25   952=
  		kvm_clear_c0_guest_status(cop0, ST0_ERL);
ede5f3e7b54a43 arch/mips/kvm/emulate.c       James Hogan   2016-10-25   953=
  		vcpu->arch.pc =3D kvm_read_c0_guest_errorepc(cop0);
ede5f3e7b54a43 arch/mips/kvm/emulate.c       James Hogan   2016-10-25   954=
  	} else if (kvm_read_c0_guest_status(cop0) & ST0_EXL) {
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   955=
  		kvm_debug("[%#lx] ERET to %#lx\n", vcpu->arch.pc,
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   956=
  			  kvm_read_c0_guest_epc(cop0));
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   957=
  		kvm_clear_c0_guest_status(cop0, ST0_EXL);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   958=
  		vcpu->arch.pc =3D kvm_read_c0_guest_epc(cop0);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   959=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   960=
  	} else {
6ad78a5c75c5bc arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26   961=
  		kvm_err("[%#lx] ERET when MIPS_SR_EXL|MIPS_SR_ERL =3D=3D 0\n",
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   962=
  			vcpu->arch.pc);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   963=
  		er =3D EMULATE_FAIL;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   964=
  	}
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   965=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   966=
  	return er;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   967=
  }
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   968=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   969=
  enum emulation_result kvm_mips_emul_wait(struct kvm_vcpu *vcpu)
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   970=
  {
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   971=
  	kvm_debug("[%#lx] !!!WAIT!!! (%#lx)\n", vcpu->arch.pc,
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   972=
  		  vcpu->arch.pending_exceptions);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   973=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   974=
  	++vcpu->stat.wait_exits;
1e09e86ac13747 arch/mips/kvm/emulate.c       James Hogan   2016-06-14   975=
  	trace_kvm_exit(vcpu, KVM_TRACE_EXIT_WAIT);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   976=
  	if (!vcpu->arch.pending_exceptions) {
f4474d50c7d483 arch/mips/kvm/emulate.c       James Hogan   2017-03-14   977=
  		kvm_vz_lose_htimer(vcpu);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   978=
  		vcpu->arch.wait =3D 1;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   979=
  		kvm_vcpu_block(vcpu);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   980=
  =

d116e812f9026e arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26   981=
  		/*
d116e812f9026e arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26   982=
  		 * We we are runnable, then definitely go off to user space to
d116e812f9026e arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26   983=
  		 * check if any I/O interrupts are pending.
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   984=
  		 */
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   985=
  		if (kvm_check_request(KVM_REQ_UNHALT, vcpu)) {
72875d8a4d92f6 arch/mips/kvm/emulate.c       Radim Kr=C4=8Dm=C3=A1=C5=99  2=
017-04-26   986  			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   987=
  			vcpu->run->exit_reason =3D KVM_EXIT_IRQ_WINDOW_OPEN;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   988=
  		}
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   989=
  	}
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   990=
  =

d98403a525fe16 arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26   991=
  	return EMULATE_DONE;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   992=
  }
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21   993=
  =

dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14   994=
  static void kvm_mips_change_entryhi(struct kvm_vcpu *vcpu,
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14   995=
  				    unsigned long entryhi)
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14   996=
  {
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14   997=
  	struct mips_coproc *cop0 =3D vcpu->arch.cop0;
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14   998=
  	struct mm_struct *kern_mm =3D &vcpu->arch.guest_kernel_mm;
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14   999=
  	int cpu, i;
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1000=
  	u32 nasid =3D entryhi & KVM_ENTRYHI_ASID;
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1001=
  =

dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1002=
  	if (((kvm_read_c0_guest_entryhi(cop0) & KVM_ENTRYHI_ASID) !=3D nasid)) {
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1003=
  		trace_kvm_asid_change(vcpu, kvm_read_c0_guest_entryhi(cop0) &
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1004=
  				      KVM_ENTRYHI_ASID, nasid);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1005=
  =

d116e812f9026e arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26  1006=
  		/*
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1007=
  		 * Flush entries from the GVA page tables.
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1008=
  		 * Guest user page table will get flushed lazily on re-entry to
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1009=
  		 * guest user if the guest ASID actually changes.
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1010=
  		 */
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1011=
  		kvm_mips_flush_gva_pt(kern_mm->pgd, KMF_KERN);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1012=
  =

dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1013=
  		/*
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1014=
  		 * Regenerate/invalidate kernel MMU context.
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1015=
  		 * The user MMU context will be regenerated lazily on re-entry
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1016=
  		 * to guest user if the guest ASID actually changes.
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1017=
  		 */
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1018=
  		preempt_disable();
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1019=
  		cpu =3D smp_processor_id();
4739f7dd99d757 arch/mips/kvm/emulate.c       Paul Burton   2019-02-02  1020=
  		get_new_mmu_context(kern_mm);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1021=
  		for_each_possible_cpu(i)
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1022=
  			if (i !=3D cpu)
0b317c389c6771 arch/mips/kvm/emulate.c       Paul Burton   2019-02-02  1023=
  				set_cpu_context(i, kern_mm, 0);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1024=
  		preempt_enable();
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1025=
  	}
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1026=
  	kvm_write_c0_guest_entryhi(cop0, entryhi);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1027=
  }
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1028=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21 @1029=
  enum emulation_result kvm_mips_emul_tlbr(struct kvm_vcpu *vcpu)
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1030=
  {
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1031=
  	struct mips_coproc *cop0 =3D vcpu->arch.cop0;
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1032=
  	struct kvm_mips_tlb *tlb;
8cffd197485122 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1033=
  	unsigned long pc =3D vcpu->arch.pc;
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1034=
  	int index;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1035=
  =

dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1036=
  	index =3D kvm_read_c0_guest_index(cop0);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1037=
  	if (index < 0 || index >=3D KVM_MIPS_GUEST_TLB_SIZE) {
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1038=
  		/* UNDEFINED */
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1039=
  		kvm_debug("[%#lx] TLBR Index %#x out of range\n", pc, index);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1040=
  		index &=3D KVM_MIPS_GUEST_TLB_SIZE - 1;
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1041=
  	}
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1042=
  =

dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1043=
  	tlb =3D &vcpu->arch.guest_tlb[index];
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1044=
  	kvm_write_c0_guest_pagemask(cop0, tlb->tlb_mask);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1045=
  	kvm_write_c0_guest_entrylo0(cop0, tlb->tlb_lo[0]);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1046=
  	kvm_write_c0_guest_entrylo1(cop0, tlb->tlb_lo[1]);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1047=
  	kvm_mips_change_entryhi(vcpu, tlb->tlb_hi);
dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1048=
  =

dc44abd6aad224 arch/mips/kvm/emulate.c       James Hogan   2017-03-14  1049=
  	return EMULATE_DONE;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1050=
  }
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1051=
  =

91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1052=
  /**
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1053=
   * kvm_mips_invalidate_guest_tlb() - Indicates a change in guest MMU map.
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1054=
   * @vcpu:	VCPU with changed mappings.
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1055=
   * @tlb:	TLB entry being removed.
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1056=
   *
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1057=
   * This is called to indicate a single change in guest MMU mappings, so t=
hat we
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1058=
   * can arrange TLB flushes on this and other CPUs.
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1059=
   */
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1060=
  static void kvm_mips_invalidate_guest_tlb(struct kvm_vcpu *vcpu,
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1061=
  					  struct kvm_mips_tlb *tlb)
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1062=
  {
c550d53934d821 arch/mips/kvm/emulate.c       James Hogan   2016-10-11  1063=
  	struct mm_struct *kern_mm =3D &vcpu->arch.guest_kernel_mm;
c550d53934d821 arch/mips/kvm/emulate.c       James Hogan   2016-10-11  1064=
  	struct mm_struct *user_mm =3D &vcpu->arch.guest_user_mm;
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1065=
  	int cpu, i;
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1066=
  	bool user;
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1067=
  =

91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1068=
  	/* No need to flush for entries which are already invalid */
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1069=
  	if (!((tlb->tlb_lo[0] | tlb->tlb_lo[1]) & ENTRYLO_V))
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1070=
  		return;
aba8592950f1c6 arch/mips/kvm/emulate.c       James Hogan   2016-12-16  1071=
  	/* Don't touch host kernel page tables or TLB mappings */
aba8592950f1c6 arch/mips/kvm/emulate.c       James Hogan   2016-12-16  1072=
  	if ((unsigned long)tlb->tlb_hi > 0x7fffffff)
aba8592950f1c6 arch/mips/kvm/emulate.c       James Hogan   2016-12-16  1073=
  		return;
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1074=
  	/* User address space doesn't need flushing for KSeg2/3 changes */
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1075=
  	user =3D tlb->tlb_hi < KVM_GUEST_KSEG0;
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1076=
  =

91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1077=
  	preempt_disable();
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1078=
  =

aba8592950f1c6 arch/mips/kvm/emulate.c       James Hogan   2016-12-16  1079=
  	/* Invalidate page table entries */
aba8592950f1c6 arch/mips/kvm/emulate.c       James Hogan   2016-12-16  1080=
  	kvm_trap_emul_invalidate_gva(vcpu, tlb->tlb_hi & VPN2_MASK, user);
aba8592950f1c6 arch/mips/kvm/emulate.c       James Hogan   2016-12-16  1081=
  =

91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1082=
  	/*
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1083=
  	 * Probe the shadow host TLB for the entry being overwritten, if one
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1084=
  	 * matches, invalidate it
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1085=
  	 */
57e3869cfaaec7 arch/mips/kvm/emulate.c       James Hogan   2016-10-08  1086=
  	kvm_mips_host_tlb_inv(vcpu, tlb->tlb_hi, user, true);
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1087=
  =

91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1088=
  	/* Invalidate the whole ASID on other CPUs */
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1089=
  	cpu =3D smp_processor_id();
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1090=
  	for_each_possible_cpu(i) {
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1091=
  		if (i =3D=3D cpu)
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1092=
  			continue;
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1093=
  		if (user)
0b317c389c6771 arch/mips/kvm/emulate.c       Paul Burton   2019-02-02  1094=
  			set_cpu_context(i, user_mm, 0);
0b317c389c6771 arch/mips/kvm/emulate.c       Paul Burton   2019-02-02  1095=
  		set_cpu_context(i, kern_mm, 0);
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1096=
  	}
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1097=
  =

91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1098=
  	preempt_enable();
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1099=
  }
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1100=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1101=
  /* Write Guest TLB Entry @ Index */
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21 @1102=
  enum emulation_result kvm_mips_emul_tlbwi(struct kvm_vcpu *vcpu)
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1103=
  {
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1104=
  	struct mips_coproc *cop0 =3D vcpu->arch.cop0;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1105=
  	int index =3D kvm_read_c0_guest_index(cop0);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1106=
  	struct kvm_mips_tlb *tlb =3D NULL;
8cffd197485122 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1107=
  	unsigned long pc =3D vcpu->arch.pc;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1108=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1109=
  	if (index < 0 || index >=3D KVM_MIPS_GUEST_TLB_SIZE) {
6ad78a5c75c5bc arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26  1110=
  		kvm_debug("%s: illegal index: %d\n", __func__, index);
8cffd197485122 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1111=
  		kvm_debug("[%#lx] COP0_TLBWI [%d] (entryhi: %#lx, entrylo0: %#lx entryl=
o1: %#lx, mask: %#lx)\n",
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1112=
  			  pc, index, kvm_read_c0_guest_entryhi(cop0),
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1113=
  			  kvm_read_c0_guest_entrylo0(cop0),
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1114=
  			  kvm_read_c0_guest_entrylo1(cop0),
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1115=
  			  kvm_read_c0_guest_pagemask(cop0));
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1116=
  		index =3D (index & ~0x80000000) % KVM_MIPS_GUEST_TLB_SIZE;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1117=
  	}
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1118=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1119=
  	tlb =3D &vcpu->arch.guest_tlb[index];
91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1120=
  =

91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1121=
  	kvm_mips_invalidate_guest_tlb(vcpu, tlb);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1122=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1123=
  	tlb->tlb_mask =3D kvm_read_c0_guest_pagemask(cop0);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1124=
  	tlb->tlb_hi =3D kvm_read_c0_guest_entryhi(cop0);
9fbfb06a406577 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1125=
  	tlb->tlb_lo[0] =3D kvm_read_c0_guest_entrylo0(cop0);
9fbfb06a406577 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1126=
  	tlb->tlb_lo[1] =3D kvm_read_c0_guest_entrylo1(cop0);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1127=
  =

8cffd197485122 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1128=
  	kvm_debug("[%#lx] COP0_TLBWI [%d] (entryhi: %#lx, entrylo0: %#lx entrylo=
1: %#lx, mask: %#lx)\n",
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1129=
  		  pc, index, kvm_read_c0_guest_entryhi(cop0),
d116e812f9026e arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26  1130=
  		  kvm_read_c0_guest_entrylo0(cop0),
d116e812f9026e arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26  1131=
  		  kvm_read_c0_guest_entrylo1(cop0),
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1132=
  		  kvm_read_c0_guest_pagemask(cop0));
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1133=
  =

d98403a525fe16 arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26  1134=
  	return EMULATE_DONE;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1135=
  }
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1136=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1137=
  /* Write Guest TLB Entry @ Random Index */
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21 @1138=
  enum emulation_result kvm_mips_emul_tlbwr(struct kvm_vcpu *vcpu)
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1139=
  {
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1140=
  	struct mips_coproc *cop0 =3D vcpu->arch.cop0;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1141=
  	struct kvm_mips_tlb *tlb =3D NULL;
8cffd197485122 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1142=
  	unsigned long pc =3D vcpu->arch.pc;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1143=
  	int index;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1144=
  =

e6331a321aafcc arch/mips/kvm/emulate.c       Paul Burton   2019-03-22  1145=
  	index =3D prandom_u32_max(KVM_MIPS_GUEST_TLB_SIZE);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1146=
  	tlb =3D &vcpu->arch.guest_tlb[index];
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1147=
  =

91e4f1b6073dd6 arch/mips/kvm/emulate.c       James Hogan   2016-09-15  1148=
  	kvm_mips_invalidate_guest_tlb(vcpu, tlb);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1149=
  =

e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1150=
  	tlb->tlb_mask =3D kvm_read_c0_guest_pagemask(cop0);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1151=
  	tlb->tlb_hi =3D kvm_read_c0_guest_entryhi(cop0);
9fbfb06a406577 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1152=
  	tlb->tlb_lo[0] =3D kvm_read_c0_guest_entrylo0(cop0);
9fbfb06a406577 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1153=
  	tlb->tlb_lo[1] =3D kvm_read_c0_guest_entrylo1(cop0);
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1154=
  =

8cffd197485122 arch/mips/kvm/emulate.c       James Hogan   2016-06-09  1155=
  	kvm_debug("[%#lx] COP0_TLBWR[%d] (entryhi: %#lx, entrylo0: %#lx entrylo1=
: %#lx)\n",
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1156=
  		  pc, index, kvm_read_c0_guest_entryhi(cop0),
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1157=
  		  kvm_read_c0_guest_entrylo0(cop0),
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1158=
  		  kvm_read_c0_guest_entrylo1(cop0));
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1159=
  =

d98403a525fe16 arch/mips/kvm/kvm_mips_emul.c Dengcheng Zhu 2014-06-26  1160=
  	return EMULATE_DONE;
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1161=
  }
e685c689f3a84e arch/mips/kvm/kvm_mips_emul.c Sanjay Lal    2012-11-21  1162=
  =


:::::: The code at line 946 was first introduced by commit
:::::: e685c689f3a84e5e24a5867afc5e7b5857efa3e4 KVM/MIPS32: Privileged inst=
ruction/target branch emulation.

:::::: TO: Sanjay Lal <sanjayl@kymasys.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5487347446312556335==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
+w8GLRXfaPsBAA==
--===============5487347446312556335==--

