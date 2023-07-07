Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECAD1847
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688707616; x=1720243616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDfBDKzY56zUuzKjmVW6AKWJdc6c6btyiXHTQzCr/Cg=;
  b=KHe0dlUbRyhKOSQzOgdy4AlOaIyaAWANIDyokGt3zDF3+4fCCI4WaCdq
   6DPLsAlXitOeg20LDIellwxeK51KSog55qcq8bOdIuVM0VMe6Wiqpl9Nm
   SjuF58/yYIydIpZbbuMUsK5nO9dCcbEKkKFY6eG9VCrDvvNXmTS1bUZAm
   XP9QUCqmnLdiOE+NRP3E7UkLFh8HECSxTfuhGnBbcSwK9GCs0Soa1T9eE
   tuziYBDWZukq9JTkkgwx1TK6heESuoPjfR0M40J8BGg4gLLxXHQJgJZi3
   vK5PfCFXntD6Gf3yBS8QS9ZaUMSAVyUTVUfFpKYvEx8kMEGkY5YxdW7ik
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="361280313"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="361280313"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 22:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="749415009"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="749415009"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Jul 2023 22:26:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHdzX-0001nK-1Y;
	Fri, 07 Jul 2023 05:26:51 +0000
Date: Fri, 7 Jul 2023 13:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 39/224]
 arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of
 function '__cmpxchg_local_generic'
Message-ID: <202307071349.dWxh8i2S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   f0a133b849634b4a3052fb456a980bf89a08f154
commit: 3c53d596d52d13e84377d7da875f87d43580b4e8 [39/224] locking/atomic: cmpxchg: make `generic` a prefix
config: h8300-randconfig-r033-20230707 (https://download.01.org/0day-ci/archive/20230707/202307071349.dWxh8i2S-lkp@intel.com/config)
compiler: h8300-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071349.dWxh8i2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071349.dWxh8i2S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:20,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/dma-buf/dma-fence-array.c:13:
   drivers/dma-buf/dma-fence-array.c: In function 'dma_fence_array_set_pending_error':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   drivers/dma-buf/dma-fence-array.c:36:17: note: in expansion of macro 'cmpxchg'
      36 |                 cmpxchg(&array->base.error, PENDING_ERROR, error);
         |                 ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/dma-fence.h:17,
                    from include/linux/dma-fence-chain.h:13,
                    from drivers/dma-buf/dma-fence-chain.c:10:
   drivers/dma-buf/dma-fence-chain.c: In function 'dma_fence_chain_walk':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   drivers/dma-buf/dma-fence-chain.c:65:23: note: in expansion of macro 'cmpxchg'
      65 |                 tmp = cmpxchg((struct dma_fence __force **)&chain->prev,
         |                       ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/of.h:15,
                    from include/linux/irqdomain.h:35,
                    from drivers/pci/of.c:9:
   drivers/pci/pci.h: In function 'pci_dev_set_io_state':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   drivers/pci/pci.h:383:23: note: in expansion of macro 'cmpxchg'
     383 |                 old = cmpxchg(&dev->error_state, pci_channel_io_normal,
         |                       ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from drivers/w1/w1_int.c:6:
   include/linux/netdevice.h: In function 'napi_if_scheduled_mark_missed':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   include/linux/netdevice.h:562:18: note: in expansion of macro 'cmpxchg'
     562 |         } while (cmpxchg(&n->state, val, new) != val);
         |                  ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/delay.h:22,
                    from drivers/w1/w1.c:6:
   include/linux/netdevice.h: In function 'napi_if_scheduled_mark_missed':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   include/linux/netdevice.h:562:18: note: in expansion of macro 'cmpxchg'
     562 |         } while (cmpxchg(&n->state, val, new) != val);
         |                  ^~~~~~~
   drivers/w1/w1.c: In function 'w1_uevent':
   drivers/w1/w1.c:612:1: error: unrecognizable insn:
     612 | }
         | ^
   (insn 106 40 87 6 (parallel [
               (set (reg:SI 2 r2)
                   (zero_extract:SI (reg:SI 0 r0 [orig:39 MEM[(struct w1_slave *)dev_10(D) + 4294967220B]+44 ] [39])
                       (const_int 16 [0x10])
                       (const_int 8 [0x8])))
               (clobber (reg:CC 12 cc))
           ]) "drivers/w1/w1.c":609:40 -1
        (nil))
   during RTL pass: split2
   drivers/w1/w1.c:612:1: internal compiler error: in extract_insn, at recog.cc:2791
   0x5814bd _fatal_insn(char const*, rtx_def const*, char const*, int, char const*)
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/rtl-error.cc:108
   0x5814d9 _fatal_insn_not_found(rtx_def const*, char const*, int, char const*)
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/rtl-error.cc:116
   0x5807c0 extract_insn(rtx_insn*)
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/recog.cc:2791
   0xa6ecf4 extract_insn_cached(rtx_insn*)
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/recog.cc:2680
   0x7e07d6 cleanup_subreg_operands(rtx_insn*)
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/final.cc:3099
   0xa6ce8c split_insn
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/recog.cc:3420
   0xa71d42 split_all_insns()
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/recog.cc:3488
   0xa71e38 execute
   	/cephfs/tmp/build-crosstools-gcc-12.3.0-binutils-2.40/gcc/gcc-12.3.0/gcc/recog.cc:4406
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:20,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/h8300/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/blkdev.h:5,
                    from drivers/usb/gadget/function/f_fs.c:17:
   drivers/usb/gadget/function/f_fs.c: In function 'ffs_setup_state_clear_cancelled':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   drivers/usb/gadget/function/f_fs.c:91:17: note: in expansion of macro 'cmpxchg'
      91 |                 cmpxchg(&ffs->setup_state, FFS_SETUP_CANCELLED, FFS_NO_SETUP);
         |                 ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:20,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from kernel/acct.c:47:
   kernel/acct.c: In function 'acct_pin_kill':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   kernel/acct.c:177:9: note: in expansion of macro 'cmpxchg'
     177 |         cmpxchg(&acct->ns->bacct, pin, NULL);
         |         ^~~~~~~
   arch/h8300/include/asm/cmpxchg.h:54:10: warning: value computed is not used [-Wunused-value]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      55 |                                                      (unsigned long)(o), \
         |                                                      ~~~~~~~~~~~~~~~~~~~~~
      56 |                                                      (unsigned long)(n), \
         |                                                      ~~~~~~~~~~~~~~~~~~~~~
      57 |                                                      sizeof(*(ptr))))
         |                                                      ~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   kernel/acct.c:177:9: note: in expansion of macro 'cmpxchg'
     177 |         cmpxchg(&acct->ns->bacct, pin, NULL);
         |         ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:20,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from kernel/exit.c:8:
   kernel/exit.c: In function 'wait_task_zombie':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   kernel/exit.c:1080:13: note: in expansion of macro 'cmpxchg'
    1080 |         if (cmpxchg(&p->exit_state, EXIT_ZOMBIE, state) != EXIT_ZOMBIE)
         |             ^~~~~~~
   kernel/exit.c: At top level:
   kernel/exit.c:1821:13: warning: no previous prototype for 'abort' [-Wmissing-prototypes]
    1821 | __weak void abort(void)
         |             ^~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from kernel/task_work.c:2:
   kernel/task_work.c: In function 'task_work_add':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   kernel/task_work.c:42:18: note: in expansion of macro 'cmpxchg'
      42 |         } while (cmpxchg(&task->task_works, head, work) != head);
         |                  ^~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/asm-generic/bug.h:5,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/h8300/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/sched/numa_balancing.h:10,
                    from include/trace/events/sched.h:8,
                    from kernel/sched/core.c:10:
   kernel/sched/core.c: In function '__wake_q_add':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   include/linux/atomic-fallback.h:35:33: note: in expansion of macro 'cmpxchg'
      35 | #define cmpxchg_relaxed         cmpxchg
         |                                 ^~~~~~~
   kernel/sched/core.c:527:22: note: in expansion of macro 'cmpxchg_relaxed'
     527 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
         |                      ^~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2433:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    2433 |         struct rq *rq;
         |                    ^~
   cc1: some warnings being treated as errors
--
   In file included from arch/h8300/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/h8300/include/asm/bitops.h:170,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/timer.h:5,
                    from include/linux/workqueue.h:9,
                    from kernel/sched/../workqueue_internal.h:11,
                    from kernel/sched/psi.c:130:
   kernel/sched/psi.c: In function 'update_triggers':
>> arch/h8300/include/asm/cmpxchg.h:54:30: error: implicit declaration of function '__cmpxchg_local_generic' [-Werror=implicit-function-declaration]
      54 |         ((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),              \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/cmpxchg.h:106:33: note: in expansion of macro 'cmpxchg_local'
     106 | #define cmpxchg(ptr, o, n)      cmpxchg_local((ptr), (o), (n))
         |                                 ^~~~~~~~~~~~~
   kernel/sched/psi.c:541:21: note: in expansion of macro 'cmpxchg'
     541 |                 if (cmpxchg(&t->event, 0, 1) == 0)
         |                     ^~~~~~~
   kernel/sched/psi.c: At top level:
   kernel/sched/psi.c:1077:21: warning: no previous prototype for 'psi_trigger_create' [-Wmissing-prototypes]
    1077 | struct psi_trigger *psi_trigger_create(struct psi_group *group,
         |                     ^~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1147:6: warning: no previous prototype for 'psi_trigger_destroy' [-Wmissing-prototypes]
    1147 | void psi_trigger_destroy(struct psi_trigger *t)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1215:10: warning: no previous prototype for 'psi_trigger_poll' [-Wmissing-prototypes]
    1215 | __poll_t psi_trigger_poll(void **trigger_ptr,
         |          ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1330:30: warning: 'psi_cpu_proc_ops' defined but not used [-Wunused-const-variable=]
    1330 | static const struct proc_ops psi_cpu_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1321:30: warning: 'psi_memory_proc_ops' defined but not used [-Wunused-const-variable=]
    1321 | static const struct proc_ops psi_memory_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1312:30: warning: 'psi_io_proc_ops' defined but not used [-Wunused-const-variable=]
    1312 | static const struct proc_ops psi_io_proc_ops = {
         |                              ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +/__cmpxchg_local_generic +54 arch/h8300/include/asm/cmpxchg.h

d2a5f4999f6c21 Yoshinori Sato 2015-05-11  48  
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  49  /*
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  50   * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  51   * them available.
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  52   */
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  53  #define cmpxchg_local(ptr, o, n)					 \
d2a5f4999f6c21 Yoshinori Sato 2015-05-11 @54  	((__typeof__(*(ptr)))__cmpxchg_local_generic((ptr),		 \
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  55  						     (unsigned long)(o), \
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  56  						     (unsigned long)(n), \
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  57  						     sizeof(*(ptr))))
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  58  #define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
d2a5f4999f6c21 Yoshinori Sato 2015-05-11  59  

:::::: The code at line 54 was first introduced by commit
:::::: d2a5f4999f6c211adf30d9788349e13988d6f2a7 h8300: Assembly headers

:::::: TO: Yoshinori Sato <ysato@users.sourceforge.jp>
:::::: CC: Yoshinori Sato <ysato@users.sourceforge.jp>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
