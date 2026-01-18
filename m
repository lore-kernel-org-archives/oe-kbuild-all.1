Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE85E1E4BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751247; cv=none; b=CzRGMTV/k0F6/xc4XEgzq7IeHf3TCQg9bqFkuqA72rZu8WNFQRF0QH6sc6U+ymjLDD8iJmhtUZnpwQItlgSdbW7f0CmVci8TbQArhJreb98qA5rtzktBm4msMSCrRipNtK2OprG0cJAJ45OAMHEeV4h019FPNUzzWWOzp/iN/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751247; c=relaxed/simple;
	bh=Ph6VEDLQsuoG2afwIghxlybcncJsaa/jZnL1Jy02/Rw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RAJF8tqMxgmS5HDcaCUU26p8yr6atn28TVsm+DRddzA+Tou4X8bF3n7KafjhIgcWr2X107hrYwXR34xTpeI82pGbyyUUmhfGP5Z7umZKL+Zp4qtisrEsJfiIf/3XfWN1xj15ZaGTPgSkPk+a+AKdjHpY/O41CflkWrj1jqUpC4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQTVxHWr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQTVxHWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768751224; x=1800287224;
  h=date:from:to:cc:subject:message-id;
  bh=Ph6VEDLQsuoG2afwIghxlybcncJsaa/jZnL1Jy02/Rw=;
  b=IQTVxHWrxewF7tDWA1Urvcpn0LUSdBk+K0rNLKdNU1KJJFeAAjEEVG3h
   E+GJN87cctTDkxy8OTFmytBS2pEs4ujgjxwc3tjAAQCKMPJw1Huh7M4rI
   E096qdRPQx36IOBVIyhTgmQ+kgbBLvC7E67waBnCjKiTwLp5coXh1sPT1
   cOJ3t4CKtxd+OX3tRJcUg0I54ouSvoNlHQv4BpMqa3Z3gTmWj6sAM/D/y
   gxkPlmiEcDoCiIRMBIQPzSVqDhdyAqn327lpr7PMej7mLmefbJK4dqkJX
   fbm/vuRa+jwe4J2GB7UHy3pJj2MatnvUTyvesborYvae4vFQSzBS2Ngi7
   g==;
X-CSE-ConnectionGUID: V8CjibOwR+qQFi7v/c43ww==
X-CSE-MsgGUID: aRnwX9y3SZmK0HSrPLSoDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87559981"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="87559981"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 07:47:02 -0800
X-CSE-ConnectionGUID: F+3euud8ShaBnIlFgaNZgg==
X-CSE-MsgGUID: R3xQHIprRkGNpa9licD/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="210157462"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jan 2026 07:46:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhUzQ-00000000N3c-0dwo;
	Sun, 18 Jan 2026 15:46:56 +0000
Date: Sun, 18 Jan 2026 23:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/vdso 16/16] arch/x86/lib/delay.c:209:29: sparse:
 sparse: cast removes address space '__percpu' of expression
Message-ID: <202601182313.54PTqfCd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   fd69b2f7d5f4e1d89cea4cdfa6f15e7fa53d8358
commit: adc00a0daf1bb08915bceee9ae73cca682e7d5bb [16/16] compiler: Use __typeof_unqual__() for __unqual_scalar_typeof()
config: x86_64-randconfig-122-20260118 (https://download.01.org/0day-ci/archive/20260118/202601182313.54PTqfCd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601182313.54PTqfCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182313.54PTqfCd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/lib/delay.c:209:29: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/lib/delay.c:209:29: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/lib/delay.c:209:29: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/lib/delay.c:209:29: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/lib/insn-eval.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/lib/usercopy.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/bdev.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/elevator.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/fops.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/bio.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
>> block/bio.c:795:17: sparse: sparse: cast removes address space '__percpu' of expression
>> block/bio.c:795:17: sparse: sparse: cast removes address space '__percpu' of expression
>> block/bio.c:795:17: sparse: sparse: cast removes address space '__percpu' of expression
>> block/bio.c:795:17: sparse: sparse: cast removes address space '__percpu' of expression
>> block/bio.c:795:17: sparse: sparse: cast removes address space '__percpu' of expression
>> block/bio.c:795:17: sparse: sparse: cast removes address space '__percpu' of expression
>> block/bio.c:795:17: sparse: sparse: cast removes address space '__percpu' of expression
>> block/bio.c:795:17: sparse: sparse: cast removes address space '__percpu' of expression
   block/bio.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-sysfs.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-flush.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   block/blk-flush.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-core.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-ioc.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-settings.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-map.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-merge.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-lib.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-mq-tag.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-mq.c:4393:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4393:16: sparse:     expected void const *objp
   block/blk-mq.c:4393:16: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
   block/blk-mq.c:4538:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4538:41: sparse:     expected struct blk_mq_hw_ctx **hctxs
   block/blk-mq.c:4538:41: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
   block/blk-mq.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   block/blk-mq.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   block/blk-mq.c:734:36: sparse: sparse: dereference of noderef expression
   block/blk-mq.c:5215:48: sparse: sparse: dereference of noderef expression
--
   block/blk-mq-sched.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/ioctl.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/ioprio.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/genhd.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-rq-qos.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/blk-wbt.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   block/blk-wbt.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/file_table.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/file_table.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/open.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/read_write.c:159:1: sparse: sparse: context imbalance in 'generic_file_llseek_size' - different lock contexts for basic block
   fs/read_write.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/stat.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/fcntl.c:1070:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1070:9: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1070:9: sparse:    struct fasync_struct *
   fs/fcntl.c:1148:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1148:22: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1148:22: sparse:    struct fasync_struct *
   fs/fcntl.c:1159:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1159:33: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1159:33: sparse:    struct fasync_struct *
   fs/fcntl.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/fcntl.c:299:9: sparse: sparse: context imbalance in 'f_getown_ex' - different lock contexts for basic block
--
   fs/pipe.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/exec.c:311:39: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __user * @@     got void * @@
   fs/exec.c:311:39: sparse:     expected char const [noderef] __user *
   fs/exec.c:311:39: sparse:     got void *
   fs/exec.c:318:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __user * @@     got void * @@
   fs/exec.c:318:31: sparse:     expected char const [noderef] __user *
   fs/exec.c:318:31: sparse:     got void *
   fs/exec.c:911:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *oldsighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:911:48: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:911:48: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   fs/exec.c:1017:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1017:56: sparse:     expected struct task_struct *parent
   fs/exec.c:1017:56: sparse:     got struct task_struct [noderef] __rcu *parent
   fs/exec.c:1052:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *oldsighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   fs/exec.c:1052:47: sparse:     expected struct sighand_struct *oldsighand
   fs/exec.c:1052:47: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   fs/exec.c:1167:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/exec.c:1167:26: sparse:     expected struct spinlock [usertype] *lock
   fs/exec.c:1167:26: sparse:     got struct spinlock [noderef] __rcu *
   fs/exec.c:1169:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/exec.c:1169:28: sparse:     expected struct spinlock [usertype] *lock
   fs/exec.c:1169:28: sparse:     got struct spinlock [noderef] __rcu *
   fs/exec.c:1692:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   fs/exec.c:1692:70: sparse:     expected struct task_struct *tsk
   fs/exec.c:1692:70: sparse:     got struct task_struct [noderef] __rcu *parent
   fs/exec.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/ioctl.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/readdir.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/namei.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/namei.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'leave_rcu' - unexpected unlock
   fs/namei.c:2618:19: sparse: sparse: context imbalance in 'path_init' - different lock contexts for basic block
--
   fs/select.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/dcache.c:670:17: sparse: sparse: context imbalance in '__dentry_kill' - unexpected unlock
   fs/dcache.c:708:13: sparse: sparse: context imbalance in 'lock_for_kill' - different lock contexts for basic block
   fs/dcache.c:873:13: sparse: sparse: context imbalance in 'finish_dput' - different lock contexts for basic block
   fs/dcache.c:1147:27: sparse: sparse: context imbalance in 'shrink_dentry_list' - different lock contexts for basic block
   fs/dcache.c:1250:24: sparse: sparse: context imbalance in 'dentry_lru_isolate_shrink' - different lock contexts for basic block
   fs/dcache.c:1312:13: sparse: sparse: context imbalance in 'd_walk' - different lock contexts for basic block
   fs/dcache.c:1440:5: sparse: sparse: context imbalance in 'path_has_submounts' - wrong count at exit
   fs/dcache.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/dcache.c:1547:24: sparse: sparse: context imbalance in 'select_collect2' - different lock contexts for basic block
   fs/dcache.c:1142:28: sparse: sparse: context imbalance in 'shrink_dcache_tree' - unexpected unlock
   fs/dcache.c: note: in included file (through include/linux/dcache.h, include/linux/unicode.h, include/linux/fs/super.h, ...):
   include/linux/rculist_bl.h:24:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node [noderef] __rcu *
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:24:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node [noderef] __rcu *
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:24:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node [noderef] __rcu *
   include/linux/rculist_bl.h:24:33: sparse:    struct hlist_bl_node *
   include/linux/rculist_bl.h:17:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node [noderef] __rcu *
   include/linux/rculist_bl.h:17:9: sparse:    struct hlist_bl_node *
--
   fs/inode.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/inode.c:989:17: sparse: sparse: context imbalance in 'inode_lru_isolate' - unexpected unlock
   fs/inode.c:1050:9: sparse: sparse: context imbalance in 'find_inode' - different lock contexts for basic block
   fs/inode.c:1092:9: sparse: sparse: context imbalance in 'find_inode_fast' - different lock contexts for basic block
   fs/inode.c:1823:5: sparse: sparse: context imbalance in 'insert_inode_locked' - wrong count at exit
   fs/inode.c:1951:9: sparse: sparse: context imbalance in 'iput_final' - unexpected unlock
   fs/inode.c:1966:6: sparse: sparse: context imbalance in 'iput' - different lock contexts for basic block
   fs/inode.c:2516:17: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock
--
   fs/attr.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/file.c:438:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:438:17: sparse:     expected struct file **old_fds
   fs/file.c:438:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:439:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:439:17: sparse:     expected struct file **new_fds
   fs/file.c:439:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:462:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:462:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:462:17: sparse:    struct file *
   fs/file.c:492:60: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:532:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:906:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:927:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:931:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file_ref_t [usertype] *ref @@     got struct file_ref_t [noderef] __rcu * @@
   fs/file.c:934:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:957:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:959:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:980:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:982:32: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1004:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file **f @@
   fs/file.c:1004:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1008:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *[assigned] file @@
   fs/file.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/seq_file.c:931:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/seq_file.c:931:9: sparse:    struct list_head [noderef] __rcu *
   fs/seq_file.c:931:9: sparse:    struct list_head *
   fs/seq_file.c:931:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/seq_file.c:931:9: sparse:    struct list_head [noderef] __rcu *
   fs/seq_file.c:931:9: sparse:    struct list_head *
   fs/seq_file.c:953:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct list_head *lh @@     got struct list_head [noderef] __rcu * @@
   fs/seq_file.c:953:12: sparse:     expected struct list_head *lh
   fs/seq_file.c:953:12: sparse:     got struct list_head [noderef] __rcu *
   fs/seq_file.c:1080:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/seq_file.c:1080:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/seq_file.c:1080:24: sparse:    struct hlist_node *
   fs/seq_file.c:1082:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/seq_file.c:1082:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/seq_file.c:1082:24: sparse:    struct hlist_node *
   fs/seq_file.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/namespace.c:700:5: sparse: sparse: context imbalance in 'sb_prepare_remount_readonly' - different lock contexts for basic block
   fs/namespace.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/namespace.c:684:9: sparse: sparse: context imbalance in 'setup_mnt' - wrong count at exit
   fs/namespace.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'mntput_no_expire_slowpath' - unexpected unlock
   fs/namespace.c:1395:13: sparse: sparse: context imbalance in 'mntput_no_expire' - different lock contexts for basic block
   fs/namespace.c:1972:6: sparse: sparse: context imbalance in '__detach_mounts' - wrong count at exit
   fs/namespace.c:2333:6: sparse: sparse: context imbalance in 'has_locked_children' - wrong count at exit
   fs/namespace.c:3777:6: sparse: sparse: context imbalance in 'mnt_set_expiry' - wrong count at exit
   fs/namespace.c:3789:6: sparse: sparse: context imbalance in 'mark_mounts_for_expiry' - different lock contexts for basic block
   fs/namespace.c:4093:22: sparse: sparse: context imbalance in 'copy_mnt_ns' - different lock contexts for basic block
   fs/namespace.c:4494:6: sparse: sparse: context imbalance in 'path_is_under' - wrong count at exit
   fs/namespace.c:6031:6: sparse: sparse: context imbalance in 'put_mnt_ns' - different lock contexts for basic block
   fs/namespace.c:6098:42: sparse: sparse: context imbalance in 'current_chrooted' - wrong count at exit
--
   fs/libfs.c:2162:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/libfs.c:2162:18: sparse:    struct dentry [noderef] __rcu *
   fs/libfs.c:2162:18: sparse:    struct dentry *
   fs/libfs.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/fs-writeback.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/fs-writeback.c: note: in included file:
   include/linux/fs.h:901:9: sparse: sparse: context imbalance in 'writeback_sb_inodes' - unexpected unlock
   fs/fs-writeback.c:2691:20: sparse: sparse: context imbalance in '__mark_inode_dirty' - unexpected unlock
--
   fs/splice.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/d_path.c:195:9: sparse: sparse: context imbalance in 'prepend_path' - wrong count at exit
   fs/d_path.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/d_path.c:359:9: sparse: sparse: context imbalance in '__dentry_path' - wrong count at exit
--
   fs/fs_struct.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/fs_pin.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/fs_pin.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'pin_kill' - unexpected unlock
   include/linux/rcupdate.h:865:9: sparse: sparse: context imbalance in 'mnt_pin_kill' - different lock contexts for basic block
   include/linux/rcupdate.h:865:9: sparse: sparse: context imbalance in 'group_pin_kill' - different lock contexts for basic block
--
   fs/nsfs.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rbtree.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/fs_context.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/init.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/remap_range.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> fs/buffer.c:1373:42: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/buffer.c:1373:42: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/buffer.c:1373:42: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/buffer.c:1373:42: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1379:41: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1383:33: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1383:33: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1383:33: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:1383:33: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:3017:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:3017:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:3017:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:3017:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/buffer.c:251:18: sparse: sparse: context imbalance in '__find_get_block_slow' - different lock contexts for basic block
   fs/buffer.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/direct-io.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/eventpoll.c:648:9: sparse: sparse: restricted __poll_t degrades to integer
   fs/eventpoll.c:648:9: sparse: sparse: cast to restricted __poll_t
>> fs/eventpoll.c:743:9: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/eventpoll.c:743:9: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/eventpoll.c:743:9: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/eventpoll.c:743:9: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/eventpoll.c:743:9: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/eventpoll.c:743:9: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/eventpoll.c:743:9: sparse: sparse: cast removes address space '__percpu' of expression
>> fs/eventpoll.c:743:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:839:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:839:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:839:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:839:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:839:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:839:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:839:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:839:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1330:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int pollflags @@     got restricted __poll_t @@
   fs/eventpoll.c:1330:53: sparse:     expected unsigned int pollflags
   fs/eventpoll.c:1330:53: sparse:     got restricted __poll_t
   fs/eventpoll.c:1576:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1576:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1576:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1576:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1576:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1576:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1576:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1576:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1697:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1697:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1697:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1697:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1697:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1697:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1697:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1697:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1944:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1944:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1944:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1944:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1944:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1944:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1944:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c:1944:9: sparse: sparse: cast removes address space '__percpu' of expression
   fs/eventpoll.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/timerfd.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/signalfd.c:56:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct wait_queue_head [usertype] *wait_address @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:56:33: sparse:     expected struct wait_queue_head [usertype] *wait_address
   fs/signalfd.c:56:33: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:58:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:58:31: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:58:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:63:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:63:33: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:63:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:97:32: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:115:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:118:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:122:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:138:32: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:142:38: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:161:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:161:31: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:161:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:170:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:170:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:170:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:174:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:174:32: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:174:32: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:184:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:184:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:184:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:186:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:186:39: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:186:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:188:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:188:33: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:188:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:190:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:190:35: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:190:35: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:289:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:289:39: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:289:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:291:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:291:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:291:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:293:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:293:17: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:293:17: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/eventfd.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/aio.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/aio.c:1687:13: sparse: sparse: context imbalance in 'poll_iocb_lock_wq' - different lock contexts for basic block
   fs/aio.c:1718:13: sparse: sparse: context imbalance in 'poll_iocb_unlock_wq' - unexpected unlock
--
   fs/locks.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/fdtable.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/binfmt_elf.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/compat_binfmt_elf.c: note: in included file (through include/linux/thread_info.h, arch/x86/include/asm/elf.h, include/linux/elf.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/posix_acl.c:53:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/posix_acl.c:53:23: sparse:    struct posix_acl [noderef] __rcu *
   fs/posix_acl.c:53:23: sparse:    struct posix_acl *
   fs/posix_acl.c:67:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/posix_acl.c:67:33: sparse:    struct posix_acl [noderef] __rcu *
   fs/posix_acl.c:67:33: sparse:    struct posix_acl *
   fs/posix_acl.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/drop_caches.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/fhandle.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/coredump.c:508:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:508:27: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:508:27: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:517:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:517:29: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:517:29: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:556:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:556:31: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:556:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c:561:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/coredump.c:561:33: sparse:     expected struct spinlock [usertype] *lock
   fs/coredump.c:561:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/coredump.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   init/do_mounts.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   init/main.c:292:16: sparse: sparse: cast to restricted __le32
   init/main.c:293:16: sparse: sparse: cast to restricted __le32
   init/main.c: note: in included file (through include/linux/stackprotector.h):
>> arch/x86/include/asm/stackprotector.h:41:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/stackprotector.h:41:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/stackprotector.h:41:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/stackprotector.h:41:9: sparse: sparse: cast removes address space '__percpu' of expression
   init/main.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   init/main.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/fork.c:229:35: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:1648:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1648:38: sparse:     expected struct refcount_struct [usertype] *r
   kernel/fork.c:1648:38: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c:1657:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1657:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1657:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1658:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1658:9: sparse:     expected void const *
   kernel/fork.c:1658:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1658:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1658:9: sparse:     expected void const *
   kernel/fork.c:1658:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1658:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const * @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/fork.c:1658:9: sparse:     expected void const *
   kernel/fork.c:1658:9: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/fork.c:1659:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1659:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:1659:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2042:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2042:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2042:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2046:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2046:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2046:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2082:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:2082:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:2082:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:2082:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:2082:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:2082:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:2082:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:2082:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:2378:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *real_parent @@     got struct task_struct * @@
   kernel/fork.c:2378:32: sparse:     expected struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:2378:32: sparse:     got struct task_struct *
   kernel/fork.c:2387:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2387:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2387:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2436:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct list_head *head @@     got struct list_head [noderef] __rcu * @@
   kernel/fork.c:2436:54: sparse:     expected struct list_head *head
   kernel/fork.c:2436:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2456:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2456:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2456:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2478:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2478:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2478:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2507:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2507:28: sparse:     expected struct sighand_struct *sighand
   kernel/fork.c:2507:28: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/fork.c:2539:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2539:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2539:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2541:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2541:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/fork.c:2541:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2980:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *[assigned] parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:2980:24: sparse:     expected struct task_struct *[assigned] parent
   kernel/fork.c:2980:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/fork.c:3063:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct const [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3063:43: sparse:     expected struct refcount_struct const [usertype] *r
   kernel/fork.c:3063:43: sparse:     got struct refcount_struct [noderef] __rcu *
   kernel/fork.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/fork.c:1757:9: sparse: sparse: dereference of noderef expression
   kernel/fork.c:1896:36: sparse: sparse: context imbalance in 'pidfd_prepare' - different lock contexts for basic block
   kernel/fork.c:2092:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:210:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:210:45: sparse:     expected struct task_struct *new_parent
   include/linux/ptrace.h:210:45: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:210:62: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct cred const *ptracer_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:210:62: sparse:     expected struct cred const *ptracer_cred
   include/linux/ptrace.h:210:62: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/fork.c:2434:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2435:59: sparse: sparse: dereference of noderef expression
--
   kernel/exec_domain.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/panic.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/cpu.c:3195:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cpu.c:3195:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cpu.c:3195:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cpu.c:3195:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cpu.c:3196:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cpu.c:3196:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cpu.c:3196:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cpu.c:3196:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/softirq.c:78:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/softirq.c:78:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/softirq.c:78:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/softirq.c:78:35: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:405:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:405:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:405:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:405:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:405:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:405:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:405:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:405:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:430:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:430:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:430:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:430:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:430:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:430:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:430:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:430:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:445:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:445:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:445:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:445:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:520:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:520:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:520:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:520:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:523:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:596:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:596:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:596:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:596:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:604:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:604:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:604:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:604:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:639:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:639:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:639:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:639:19: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:701:35: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:701:35: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:701:35: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:701:35: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:788:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:788:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:788:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:788:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:788:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:788:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:788:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:788:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1052:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1052:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1052:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1052:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1058:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1058:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1058:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1058:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1135:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1135:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1135:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:1135:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/preempt.h:104:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/kernel_stat.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:557:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:557:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:557:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:557:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:722:32: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:722:32: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:722:32: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:722:32: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:489:37: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:489:37: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:489:37: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c:489:37: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/softirq.c: note: in included file (through include/linux/kernel_stat.h):
>> include/linux/interrupt.h:651:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/interrupt.h:651:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/interrupt.h:651:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/interrupt.h:651:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/exit.c:359:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:359:37: sparse:     expected struct task_struct *tsk
   kernel/exit.c:359:37: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:362:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:362:32: sparse:     expected struct task_struct *task
   kernel/exit.c:362:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:363:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:363:35: sparse:     expected struct task_struct *task
   kernel/exit.c:363:35: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:408:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:408:24: sparse:     expected struct task_struct *parent
   kernel/exit.c:408:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:654:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:654:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:654:29: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:656:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:656:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:656:29: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:869:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:869:45: sparse:     expected struct sighand_struct *sighand
   kernel/exit.c:869:45: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/exit.c:1096:63: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *const sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:1096:63: sparse:     expected struct sighand_struct *const sighand
   kernel/exit.c:1096:63: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/exit.c:1341:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1341:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1341:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1356:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1356:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1356:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1407:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1407:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1407:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1410:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1410:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1410:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1416:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1416:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1416:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1592:68: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/exit.c:1592:68: sparse:    void *
   kernel/exit.c:1592:68: sparse:    struct task_struct [noderef] __rcu *
   kernel/exit.c:1621:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu * @@
   kernel/exit.c:1621:25: sparse:     expected struct task_struct *parent
   kernel/exit.c:1621:25: sparse:     got struct task_struct [noderef] __rcu *
   kernel/exit.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/mm.h):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_zombie' - unexpected unlock
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_stopped' - unexpected unlock
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'wait_task_continued' - unexpected unlock
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c:1657:6: sparse: sparse: context imbalance in '__do_wait' - wrong count at exit
--
   kernel/resource.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/sysctl.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/sysctl.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/capability.c: note: in included file (through include/linux/sched.h, include/linux/audit.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/ptrace.c:55:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:55:22: sparse:    struct task_struct *
   kernel/ptrace.c:55:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:74:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct [noderef] __rcu *parent @@     got struct task_struct *new_parent @@
   kernel/ptrace.c:74:23: sparse:     expected struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:74:23: sparse:     got struct task_struct *new_parent
   kernel/ptrace.c:75:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *ptracer_cred @@     got struct cred const * @@
   kernel/ptrace.c:75:29: sparse:     expected struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:75:29: sparse:     got struct cred const *
   kernel/ptrace.c:129:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old_cred @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   kernel/ptrace.c:129:18: sparse:     expected struct cred const *old_cred
   kernel/ptrace.c:129:18: sparse:     got struct cred const [noderef] __rcu *ptracer_cred
   kernel/ptrace.c:133:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:133:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:133:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:160:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:160:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:160:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:192:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:192:28: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:192:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:198:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:198:30: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:198:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:251:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/ptrace.c:251:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/ptrace.c:251:44: sparse:    struct task_struct *
   kernel/ptrace.c:494:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/ptrace.c:494:54: sparse:     expected struct task_struct *parent
   kernel/ptrace.c:494:54: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/ptrace.c:502:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *new_parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:502:53: sparse:     expected struct task_struct *new_parent
   kernel/ptrace.c:502:53: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:550:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/ptrace.c:550:41: sparse:     expected struct task_struct *p1
   kernel/ptrace.c:550:41: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/ptrace.c:552:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sighand_struct *sigh @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/ptrace.c:552:50: sparse:     expected struct sighand_struct *sigh
   kernel/ptrace.c:552:50: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/ptrace.c:743:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:743:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:743:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:751:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:751:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:751:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:862:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:862:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:862:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:866:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:866:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:866:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1221:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1221:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1221:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1223:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:1223:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/ptrace.c:1223:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/ptrace.c: note: in included file (through include/linux/rcuwait.h, include/linux/mm.h):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:380:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/ptrace.c:380:30: sparse:     expected struct spinlock [usertype] *l
   kernel/ptrace.c:380:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:409:12: sparse: sparse: context imbalance in 'ptrace_attach' - different lock contexts for basic block
   kernel/ptrace.c:500:38: sparse: sparse: dereference of noderef expression
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:690:9: sparse: sparse: context imbalance in 'ptrace_getsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:706:9: sparse: sparse: context imbalance in 'ptrace_setsiginfo' - different lock contexts for basic block
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/ptrace.c:1384:9: sparse: sparse: context imbalance in 'ptrace_request' - different lock contexts for basic block
--
   kernel/umh.c:69:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/umh.c:69:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/umh.c:69:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/umh.c:71:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/umh.c:71:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/umh.c:71:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/umh.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/signal.c:2230:14: sparse:     got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand
   kernel/signal.c:2259:53: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *t @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2259:53: sparse:     expected struct task_struct *t
   kernel/signal.c:2259:53: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2260:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2260:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:2260:34: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2289:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2289:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2289:24: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2292:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/signal.c:2292:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2292:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/signal.c:2325:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2325:17: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2325:17: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:2365:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2365:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2365:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2367:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2367:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2367:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2424:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2424:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2424:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2482:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2482:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2482:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2522:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2522:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2522:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2524:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2524:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2524:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2622:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2622:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2622:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2706:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2706:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2706:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2718:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2718:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:2718:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2761:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2761:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2761:52: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2763:49: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/signal.c:2801:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2801:49: sparse:     expected struct sighand_struct *sighand
   kernel/signal.c:2801:49: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/signal.c:3133:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3133:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3133:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3153:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3153:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3153:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3220:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3220:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3220:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3222:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3222:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3222:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3373:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3373:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3373:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3376:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3376:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3376:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3765:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3765:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3765:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3777:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3777:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3777:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3782:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3782:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3782:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:3787:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3787:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:3787:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4279:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4279:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4279:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4291:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4291:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4291:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4309:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct k_sigaction *k @@     got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:4309:11: sparse:     expected struct k_sigaction *k
   kernel/signal.c:4309:11: sparse:     got struct k_sigaction [noderef] __rcu *
   kernel/signal.c:4311:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4311:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4311:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4313:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4313:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4313:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4365:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4365:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4365:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:74:34: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/signal.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/signal.c:510:35: sparse: sparse: dereference of noderef expression
   kernel/signal.c:538:52: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1003:13: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file:
   include/linux/signalfd.h:21:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:21:13: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:21:13: sparse:     got struct wait_queue_head [noderef] __rcu *
   include/linux/signalfd.h:22:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:22:17: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:22:17: sparse:     got struct wait_queue_head [noderef] __rcu *
   kernel/signal.c: note: in included file (through include/linux/sched/cputime.h):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1273:9: sparse: sparse: context imbalance in 'do_send_sig_info' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:895:9: sparse: sparse: context imbalance in '__lock_task_sighand' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/sched/cputime.h):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1923:6: sparse: sparse: context imbalance in 'flush_itimer_signals' - wrong count at exit
   kernel/signal.c: note: in included file:
   include/linux/signalfd.h:21:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:21:13: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:21:13: sparse:     got struct wait_queue_head [noderef] __rcu *
   include/linux/signalfd.h:22:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   include/linux/signalfd.h:22:17: sparse:     expected struct wait_queue_head *wq_head
   include/linux/signalfd.h:22:17: sparse:     got struct wait_queue_head [noderef] __rcu *
   kernel/signal.c: note: in included file (through include/linux/sched/cputime.h):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:2212:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2212:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2212:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2212:40: sparse: sparse: dereference of noderef expression
   kernel/signal.c: note: in included file (through include/uapi/asm-generic/bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, ...):
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2550:13: sparse: sparse: context imbalance in 'do_signal_stop' - different lock contexts for basic block
   kernel/signal.c:2763:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2763:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2763:49: sparse: sparse: dereference of noderef expression
   kernel/signal.c:2763:49: sparse: sparse: dereference of noderef expression
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/signal.c:2887:33: sparse: sparse: context imbalance in 'get_signal' - unexpected unlock
   kernel/signal.c:4280:33: sparse: sparse: dereference of noderef expression
   kernel/signal.c:4373:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4373:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4373:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:4379:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4379:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/signal.c:4379:33: sparse:     got struct spinlock [noderef] __rcu *
--
   kernel/sys.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sys.c:1143:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/sys.c:1143:32: sparse:     expected struct task_struct *p1
   kernel/sys.c:1143:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/sys.c:1783:9: sparse: sparse: context imbalance in '__se_sys_prlimit64' - different lock contexts for basic block
   kernel/sys.c:1911:33: sparse: sparse: context imbalance in 'getrusage' - different lock contexts for basic block
--
   kernel/task_work.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rcuwait.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/pid.c:397:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:397:9: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:397:9: sparse:    struct pid *
   kernel/pid.c:398:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:398:9: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:398:9: sparse:    struct pid *
   kernel/pid.c:460:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:460:23: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:460:23: sparse:    struct pid *
   kernel/pid.c:519:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/pid.c:519:32: sparse:    struct pid [noderef] __rcu *
   kernel/pid.c:519:32: sparse:    struct pid *
   kernel/pid.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/pid.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/mm.h):
   include/linux/rculist.h:611:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:611:9: sparse:    struct hlist_node [noderef] __rcu *
   include/linux/rculist.h:611:9: sparse:    struct hlist_node *
   include/linux/rculist.h:612:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rculist.h:612:9: sparse:    struct hlist_node [noderef] __rcu *
   include/linux/rculist.h:612:9: sparse:    struct hlist_node *
--
   kernel/kthread.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/nsproxy.c:268:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'
   kernel/nsproxy.c:273:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'
   kernel/nsproxy.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/nsproxy.c:268:9: sparse: sparse: dereference of noderef expression
   kernel/nsproxy.c:273:9: sparse: sparse: dereference of noderef expression
--
   kernel/cred.c:77:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:77:9: sparse:    struct cred *
   kernel/cred.c:77:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:78:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:78:9: sparse:    struct cred *
   kernel/cred.c:78:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:94:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic64_t const [usertype] *v @@     got struct atomic64_t const [noderef] __rcu * @@
   kernel/cred.c:94:9: sparse:     expected struct atomic64_t const [usertype] *v
   kernel/cred.c:94:9: sparse:     got struct atomic64_t const [noderef] __rcu *
   kernel/cred.c:97:22: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/cred.c:100:17: sparse: sparse: cast removes address space '__rcu' of expression
   kernel/cred.c:191:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:191:13: sparse:     expected struct cred const *old
   kernel/cred.c:191:13: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:278:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct cred const *cred @@     got struct cred const [noderef] __rcu *cred @@
   kernel/cred.c:278:47: sparse:     expected struct cred const *cred
   kernel/cred.c:278:47: sparse:     got struct cred const [noderef] __rcu *cred
   kernel/cred.c:278:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *real_cred @@     got struct cred const * @@
   kernel/cred.c:278:30: sparse:     expected struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:278:30: sparse:     got struct cred const *
   kernel/cred.c:279:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic64_t const [usertype] *v @@     got struct atomic64_t const [noderef] __rcu * @@
   kernel/cred.c:279:17: sparse:     expected struct atomic64_t const [usertype] *v
   kernel/cred.c:279:17: sparse:     got struct atomic64_t const [noderef] __rcu *
   kernel/cred.c:318:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct cred const [noderef] __rcu *real_cred @@     got struct cred const * @@
   kernel/cred.c:318:32: sparse:     expected struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:318:32: sparse:     got struct cred const *
   kernel/cred.c:371:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *old @@     got struct cred const [noderef] __rcu *real_cred @@
   kernel/cred.c:371:38: sparse:     expected struct cred const *old
   kernel/cred.c:371:38: sparse:     got struct cred const [noderef] __rcu *real_cred
   kernel/cred.c:376:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/cred.c:376:9: sparse:    struct cred const [noderef] __rcu *
   kernel/cred.c:376:9: sparse:    struct cred const *
   kernel/cred.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rbtree.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cred.c:274:19: sparse: sparse: dereference of noderef expression
--
   kernel/reboot.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h, include/linux/elfcore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/async.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/async.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/smpboot.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/ucount.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/groups.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rbtree.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/freezer.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/freezer.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/freezer.c:206:9: sparse: sparse: context imbalance in '__thaw_task' - wrong count at exit
--
   kernel/stacktrace.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/profile.c: note: in included file (through arch/x86/include/generated/asm/irq_regs.h):
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/uid16.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/crash_core.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/utsname.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/crash_core.c: note: in included file (through include/linux/sched.h, include/linux/utsname.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/kexec_core.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/compat.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/pid_namespace.c:208:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/pid_namespace.c:208:26: sparse:     expected struct spinlock [usertype] *lock
   kernel/pid_namespace.c:208:26: sparse:     got struct spinlock [noderef] __rcu *
   kernel/pid_namespace.c:210:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/pid_namespace.c:210:28: sparse:     expected struct spinlock [usertype] *lock
   kernel/pid_namespace.c:210:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/pid_namespace.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/pid_namespace.c:209:28: sparse: sparse: dereference of noderef expression
--
   kernel/kcov.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kcov.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/hung_task.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/watchdog.c:660:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/watchdog.c:660:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/watchdog.c:660:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/watchdog.c:660:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:666:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:666:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:666:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:666:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:684:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:684:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:684:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:684:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:715:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:715:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:715:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:715:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:716:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:716:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:716:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:716:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:828:21: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:828:21: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:828:21: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:828:21: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:833:25: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:833:25: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:833:25: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:833:25: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:842:20: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:842:20: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:842:20: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c:842:20: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c: note: in included file (through arch/x86/include/generated/asm/irq_regs.h, include/linux/irq.h):
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/watchdog.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/kprobes.c:1236:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/kprobes.c:1236:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/kprobes.c:1236:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/kprobes.c:1236:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:1243:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:1243:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:1243:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:1243:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:2134:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:2134:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:2134:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:2134:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:2141:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:2141:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:2141:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:2141:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:364:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:364:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:364:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:364:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:369:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:369:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:369:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kprobes.c:369:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/utsname_sysctl.c: note: in included file (through include/linux/sched.h, include/linux/utsname.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/seccomp.c:580:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:580:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:580:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:584:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:584:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:584:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1433:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1433:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1433:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1445:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:1445:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:1445:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:1931:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   kernel/seccomp.c:1931:9: sparse:     expected struct lockdep_map const *lock
   kernel/seccomp.c:1931:9: sparse:     got struct lockdep_map [noderef] __rcu *
   kernel/seccomp.c:2017:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:2017:31: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:2017:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:2035:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:2035:33: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:2035:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:2177:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:2177:28: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:2177:28: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:2180:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:2180:38: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:2180:38: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c:2186:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/seccomp.c:2186:30: sparse:     expected struct spinlock [usertype] *lock
   kernel/seccomp.c:2186:30: sparse:     got struct spinlock [noderef] __rcu *
   kernel/seccomp.c: note: in included file (through include/linux/sched.h, include/linux/audit.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/seccomp.c:927:9: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:493:9: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:603:9: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:451:9: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:437:9: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:451:9: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:437:9: sparse: sparse: dereference of noderef expression
   kernel/seccomp.c:451:9: sparse: sparse: dereference of noderef expression
--
>> kernel/irq_work.c:33:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/irq_work.c:33:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/irq_work.c:33:35: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/irq_work.c:33:35: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq_work.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rcuwait.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/context_tracking.c:125:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct context_tracking * @@
   kernel/context_tracking.c:125:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/context_tracking.c:125:39: sparse:     got struct context_tracking *
>> kernel/context_tracking.c:138:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/context_tracking.c:138:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/context_tracking.c:138:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/context_tracking.c:138:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/context_tracking.c:138:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/context_tracking.c:138:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/context_tracking.c:138:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/context_tracking.c:138:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:164:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct context_tracking * @@
   kernel/context_tracking.c:164:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/context_tracking.c:164:39: sparse:     got struct context_tracking *
   kernel/context_tracking.c:205:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct context_tracking * @@
   kernel/context_tracking.c:205:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/context_tracking.c:205:39: sparse:     got struct context_tracking *
   kernel/context_tracking.c:260:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct context_tracking * @@
   kernel/context_tracking.c:260:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/context_tracking.c:260:39: sparse:     got struct context_tracking *
   kernel/context_tracking.c:366:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:366:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:366:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:366:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:366:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:366:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:366:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:366:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:391:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:391:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:391:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:391:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:391:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:391:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:391:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c:391:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c: note: in included file (through include/linux/vtime.h, include/linux/context_tracking.h):
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/context_tracking_state.h:110:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/context_tracking.c: note: in included file (through include/linux/vtime.h, include/linux/context_tracking.h):
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/context_tracking_state.h:122:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/rseq.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/kstack_erase.c: note: in included file (through include/linux/sched.h, include/linux/kstack_erase.h):
>> arch/x86/include/asm/processor.h:554:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/kstack_erase.c: note: in included file (through include/linux/sched.h, include/linux/kstack_erase.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/dump_stack.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> lib/flex_proportions.c:73:9: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/flex_proportions.c:73:9: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/flex_proportions.c:73:9: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/flex_proportions.c:73:9: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/flex_proportions.c:73:9: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/flex_proportions.c:73:9: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/flex_proportions.c:73:9: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/flex_proportions.c:73:9: sparse: sparse: cast removes address space '__percpu' of expression
   lib/flex_proportions.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/percpu_counter.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   lib/flex_proportions.c: note: in included file (through include/linux/flex_proportions.h):
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/is_single_threaded.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/klist.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/klist.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/radix-tree.c:266:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:266:36: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:266:36: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:284:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *parent @@
   lib/radix-tree.c:284:29: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:284:29: sparse:     got struct xa_node *parent
   lib/radix-tree.c:344:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *nodes @@
   lib/radix-tree.c:344:38: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:344:38: sparse:     got struct xa_node *nodes
   lib/radix-tree.c:446:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *node @@
   lib/radix-tree.c:446:54: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:446:54: sparse:     got struct xa_node *node
   lib/radix-tree.c:558:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *parent @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:558:24: sparse:     expected struct xa_node *parent
   lib/radix-tree.c:558:24: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:672:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] child @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:672:31: sparse:     expected struct xa_node *[assigned] child
   lib/radix-tree.c:672:31: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:947:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:947:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:947:22: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1007:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1007:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:1007:22: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1527:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1527:38: sparse:     expected struct xa_node *[assigned] node
   lib/radix-tree.c:1527:38: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1587:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1587:28: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:1587:28: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   lib/radix-tree.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/vsprintf.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/rwsem.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   lib/vsprintf.c: note: in included file (through include/linux/mutex.h, include/linux/notifier.h, include/linux/clk.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/scatterlist.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/iov_iter.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/syscall.c: note: in included file (through include/linux/sched.h, include/linux/ptrace.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/nlattr.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/stackdepot.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   lib/stackdepot.c:722:9: sparse: sparse: context imbalance in 'stack_depot_save_flags' - different lock contexts for basic block
--
   lib/ref_tracker.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/ref_tracker.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/ubsan.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   lib/sbitmap.c:150:9: sparse: sparse: context imbalance in 'sbitmap_resize' - different lock contexts for basic block
   lib/sbitmap.c:200:17: sparse: sparse: context imbalance in 'sbitmap_find_bit_in_word' - different lock contexts for basic block
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
>> lib/sbitmap.c:34:16: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:37:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:50:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:56:17: sparse: sparse: cast removes address space '__percpu' of expression
   lib/sbitmap.c:531:9: sparse: sparse: context imbalance in '__sbitmap_queue_get_batch' - different lock contexts for basic block
--
   mm/mempool.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/oom_kill.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/oom.h):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'find_lock_task_mm' - wrong count at exit
   mm/oom_kill.c:223:28: sparse: sparse: context imbalance in 'oom_badness' - unexpected unlock
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'dump_task' - unexpected unlock
   mm/oom_kill.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/oom_kill.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/oom.h):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in '__oom_kill_process' - unexpected unlock
   mm/oom_kill.c:1248:20: sparse: sparse: context imbalance in '__se_sys_process_mrelease' - unexpected unlock
--
   mm/filemap.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/filemap.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/filemap.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'filemap_fault_recheck_pte_none' - unexpected unlock
   include/linux/rcupdate.h:895:9: sparse: sparse: context imbalance in 'filemap_map_pages' - different lock contexts for basic block
--
   mm/maccess.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/page-writeback.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/readahead.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/swap.c: note: in included file (through include/linux/swap.h):
   include/linux/memcontrol.h:1514:46: sparse: sparse: context imbalance in '__page_cache_release' - unexpected unlock
   mm/swap.c:94:46: sparse: sparse: context imbalance in 'page_cache_release' - unexpected unlock
   include/linux/memcontrol.h:1514:46: sparse: sparse: context imbalance in 'folio_batch_move_lru' - unexpected unlock
   mm/swap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swap.c:980:62: sparse: sparse: context imbalance in 'folios_put_refs' - unexpected unlock
--
   mm/util.c:134:6: sparse: sparse: multiple definitions for function 'kmemdup_noprof'
   mm/util.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   include/linux/fortify-string.h:756:23: sparse:  the previous one is here
   mm/util.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/shmem.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> mm/show_mem.c:299:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/show_mem.c:299:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/show_mem.c:299:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/show_mem.c:299:17: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/workingset.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, include/linux/memcontrol.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/workingset.c:763:9: sparse: sparse: context imbalance in 'shadow_lru_isolate' - wrong count at exit
--
   mm/mincore.c:175:17: sparse: sparse: context imbalance in 'mincore_pte_range' - unexpected unlock
   mm/mincore.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> mm/gup.c:2778:9: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/gup.c:2778:9: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/gup.c:2778:9: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/gup.c:2778:9: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/gup.c:2778:9: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/gup.c:2778:9: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/gup.c:2778:9: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/gup.c:2778:9: sparse: sparse: cast removes address space '__percpu' of expression
   mm/gup.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/mlock.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/mlock.c: note: in included file (through include/linux/swap.h):
   include/linux/memcontrol.h:1500:39: sparse: sparse: context imbalance in '__mlock_folio' - unexpected unlock
   include/linux/memcontrol.h:1500:39: sparse: sparse: context imbalance in '__mlock_new_folio' - unexpected unlock
   include/linux/memcontrol.h:1500:39: sparse: sparse: context imbalance in '__munlock_folio' - unexpected unlock
   mm/mlock.c:208:39: sparse: sparse: context imbalance in 'mlock_folio_batch' - unexpected unlock
   mm/mlock.c:407:20: sparse: sparse: context imbalance in 'mlock_pte_range' - unexpected unlock
--
   mm/mmap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/mmu_gather.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/mprotect.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/msync.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/mremap.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'move_ptes' - unexpected unlock
   mm/mremap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/pagewalk.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/pagewalk.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'walk_pte_range' - unexpected unlock
   mm/pagewalk.c:882:14: sparse: sparse: context imbalance in 'folio_walk_start' - different lock contexts for basic block
--
   mm/process_vm_access.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/mseal.c: note: in included file (through include/linux/sched.h, include/linux/mempolicy.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/vma_exec.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/vma.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/rmap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:958:28: sparse: sparse: context imbalance in 'folio_referenced_one' - unexpected unlock
   include/linux/rmap.h:958:28: sparse: sparse: context imbalance in 'try_to_unmap_one' - unexpected unlock
   include/linux/rmap.h:958:28: sparse: sparse: context imbalance in 'try_to_migrate_one' - unexpected unlock
--
   mm/vmalloc.c:1128:25: sparse: sparse: context imbalance in 'find_vmap_area_exceed_addr_lock' - wrong count at exit
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/vmalloc.c:1745:23: sparse: sparse: cast removes address space '__percpu' of expression
   mm/vmalloc.c:1902:14: sparse: sparse: cast removes address space '__percpu' of expression
   mm/vmalloc.c:1902:14: sparse: sparse: cast removes address space '__percpu' of expression
   mm/vmalloc.c:1902:14: sparse: sparse: cast removes address space '__percpu' of expression
   mm/vmalloc.c:1902:14: sparse: sparse: cast removes address space '__percpu' of expression
   mm/vmalloc.c: note: in included file (through include/linux/sched.h, include/linux/vmalloc.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/vmalloc.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/vmalloc.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/vmalloc.c:4673:28: sparse: sparse: context imbalance in 'vread_iter' - unexpected unlock
--
   mm/page_alloc.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/page_alloc.c:2886:17: sparse: sparse: context imbalance in 'free_frozen_page_commit' - unexpected unlock
   mm/page_alloc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/page_alloc.c:2929:13: sparse: sparse: context imbalance in '__free_frozen_pages' - different lock contexts for basic block
   mm/page_alloc.c:3032:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:3320:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:5164:9: sparse: sparse: context imbalance in 'alloc_pages_bulk_noprof' - different lock contexts for basic block
--
   mm/page_io.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/madvise.c:212:17: sparse: sparse: context imbalance in 'swapin_walk_pmd_entry' - unexpected unlock
   mm/madvise.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/madvise.c:442:28: sparse: sparse: context imbalance in 'madvise_cold_or_pageout_pte_range' - unexpected unlock
   mm/madvise.c:781:9: sparse: sparse: context imbalance in 'madvise_free_pte_range' - different lock contexts for basic block
--
   mm/dmapool.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/slub.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/slub.c:3474:9: sparse: sparse: context imbalance in 'alloc_single_from_new_slab' - different lock contexts for basic block
>> mm/slub.c:806:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/slub.c:806:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/slub.c:806:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/slub.c:806:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/slub.c:806:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/slub.c:806:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/slub.c:806:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/slub.c:806:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/slub.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   mm/slub.c:5893:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock
--
>> mm/swapfile.c:942:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/swapfile.c:942:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/swapfile.c:942:17: sparse: sparse: cast removes address space '__percpu' of expression
>> mm/swapfile.c:942:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:943:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:943:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:943:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:943:17: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:1320:14: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:1320:14: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:1320:14: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:1320:14: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:1321:18: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:1321:18: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:1321:18: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:1321:18: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/swapfile.c:515:20: sparse: sparse: context imbalance in 'swap_cluster_alloc_table' - unexpected unlock
   mm/swapfile.c:615:20: sparse: sparse: context imbalance in 'isolate_lock_cluster' - different lock contexts for basic block
   mm/swapfile.c:780:13: sparse: sparse: context imbalance in 'cluster_reclaim_range' - unexpected unlock
   mm/swapfile.c:939:9: sparse: sparse: context imbalance in 'alloc_swap_scan_cluster' - unexpected unlock
   mm/swapfile.c:1007:36: sparse: sparse: context imbalance in 'swap_reclaim_full_clusters' - unexpected unlock
   mm/swapfile.c:1124:28: sparse: sparse: context imbalance in 'cluster_alloc_swap_entry' - unexpected unlock
   mm/swapfile.c:1336:24: sparse: sparse: context imbalance in 'swap_alloc_fast' - different lock contexts for basic block
   mm/swapfile.c:2242:9: sparse: sparse: context imbalance in 'unuse_pte' - different lock contexts for basic block
   mm/swapfile.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'unuse_pte_range' - unexpected unlock
--
   mm/migrate.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/ksm.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/ksm.c:816:17: sparse: sparse: context imbalance in 'get_mergeable_page' - unexpected unlock
   mm/ksm.c: note: in included file:
   include/linux/rmap.h:958:28: sparse: sparse: context imbalance in 'write_protect_page' - unexpected unlock
   mm/ksm.c:1461:42: sparse: sparse: context imbalance in 'replace_page' - different lock contexts for basic block
   mm/ksm.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'ksm_next_page_pmd_entry' - unexpected unlock
--
   mm/hugetlb.c:667:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
   mm/hugetlb.c:738:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
   mm/hugetlb.c:805:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
   mm/hugetlb.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/hugetlb.c:5520:18: sparse: sparse: context imbalance in 'hugetlb_wp' - unexpected unlock
--
   mm/huge_memory.c:1117:30: sparse: sparse: context imbalance in 'split_queue_lock' - wrong count at exit
   mm/huge_memory.c:1138:30: sparse: sparse: context imbalance in 'split_queue_lock_irqsave' - wrong count at exit
   mm/huge_memory.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/huge_memory.c:2327:20: sparse: sparse: context imbalance in 'madvise_free_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2365:28: sparse: sparse: context imbalance in 'zap_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2506:28: sparse: sparse: context imbalance in 'move_huge_pmd' - unexpected unlock
   mm/huge_memory.c:2644:20: sparse: sparse: context imbalance in 'change_huge_pmd' - unexpected unlock
   mm/huge_memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/x86/include/asm/pgtable.h:854:9: sparse: sparse: context imbalance in 'change_huge_pud' - unexpected unlock
   mm/huge_memory.c:2821:12: sparse: sparse: context imbalance in '__pmd_trans_huge_lock' - wrong count at exit
   mm/huge_memory.c:2838:12: sparse: sparse: context imbalance in '__pud_trans_huge_lock' - wrong count at exit
   mm/huge_memory.c:2864:28: sparse: sparse: context imbalance in 'zap_huge_pud' - unexpected unlock
   mm/huge_memory.c: note: in included file:
   include/linux/mm.h:3346:9: sparse: sparse: context imbalance in '__split_huge_zero_page_pmd' - different lock contexts for basic block
   include/linux/mm.h:3346:9: sparse: sparse: context imbalance in '__split_huge_pmd_locked' - different lock contexts for basic block
   mm/huge_memory.c:3806:35: sparse: sparse: context imbalance in '__folio_freeze_and_split_unmapped' - unexpected unlock
   mm/huge_memory.c:4061:9: sparse: sparse: context imbalance in '__folio_split' - different lock contexts for basic block
   mm/huge_memory.c:4300:38: sparse: sparse: context imbalance in '__folio_unqueue_deferred_split' - unexpected unlock
   mm/huge_memory.c:4355:38: sparse: sparse: context imbalance in 'deferred_split_folio' - unexpected unlock
   mm/huge_memory.c:4429:38: sparse: sparse: context imbalance in 'deferred_split_scan' - unexpected unlock
   mm/huge_memory.c:4679:17: sparse: sparse: context imbalance in 'split_huge_pages_pid' - unexpected unlock
--
   mm/khugepaged.c:829:25: sparse: sparse: symbol 'khugepaged_collapse_control' was not declared. Should it be static?
   mm/khugepaged.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/khugepaged.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in '__collapse_huge_page_swapin' - unexpected unlock
   mm/khugepaged.c:1195:26: sparse: sparse: context imbalance in 'collapse_huge_page' - different lock contexts for basic block
   mm/khugepaged.c:1703:28: sparse: sparse: context imbalance in 'collapse_pte_mapped_thp' - unexpected unlock
--
   mm/memory-failure.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/memory-failure.c:748:17: sparse: sparse: context imbalance in 'hwpoison_pte_range' - unexpected unlock
--
   mm/debug_vm_pgtable.c:576:9: sparse: sparse: incompatible types in conditional expression (different base types):
   mm/debug_vm_pgtable.c:576:9: sparse:    void
   mm/debug_vm_pgtable.c:576:9: sparse:    int
   mm/debug_vm_pgtable.c:594:9: sparse: sparse: incompatible types in conditional expression (different base types):
   mm/debug_vm_pgtable.c:594:9: sparse:    void
   mm/debug_vm_pgtable.c:594:9: sparse:    int
   mm/debug_vm_pgtable.c:1036:17: sparse: sparse: incompatible types in conditional expression (different base types):
   mm/debug_vm_pgtable.c:1036:17: sparse:    void
   mm/debug_vm_pgtable.c:1036:17: sparse:    int
   mm/debug_vm_pgtable.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/debug_vm_pgtable.c:1351:23: sparse: sparse: context imbalance in 'debug_vm_pgtable' - different lock contexts for basic block
--
   mm/page_owner.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/usercopy.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/memfd.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/execmem.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/entry/syscall_64.c:89:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/entry/syscall_64.c:89:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/entry/syscall_64.c:89:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/entry/syscall_64.c:89:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_64.c: note: in included file (through arch/x86/include/asm/timex.h, include/linux/timex.h, include/linux/time32.h, ...):
>> arch/x86/include/asm/processor.h:554:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_64.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_64.c: note: in included file (through include/linux/entry-common.h):
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_64.c: note: in included file (through include/linux/irq-entry-common.h, include/linux/entry-common.h):
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_64.c: note: in included file (through include/linux/entry-common.h):
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/entry/syscall_32.c:148:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/entry/syscall_32.c:148:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/entry/syscall_32.c:148:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/entry/syscall_32.c:148:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c:271:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c:271:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c:271:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c:271:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c: note: in included file (through arch/x86/include/asm/timex.h, include/linux/timex.h, include/linux/time32.h, ...):
>> arch/x86/include/asm/processor.h:554:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c: note: in included file (through include/linux/entry-common.h):
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c: note: in included file (through include/linux/irq-entry-common.h, include/linux/entry-common.h):
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/entry/syscall_32.c: note: in included file (through include/linux/entry-common.h):
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/events/utils.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/events/core.c:1223:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/core.c:1223:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/core.c:1223:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/core.c:1223:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/core.c:1223:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/core.c:1223:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/core.c:1223:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/core.c:1223:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1289:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1289:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1289:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1289:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1289:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1289:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1289:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1289:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1435:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1435:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1435:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1435:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1459:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1459:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1459:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:1459:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2267:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2267:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2267:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2267:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2268:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2268:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2268:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2268:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2269:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2269:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2269:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2269:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2293:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2296:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2436:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2436:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2436:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2436:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2436:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2436:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2436:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c:2436:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c: note: in included file:
>> arch/x86/events/perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/core.c: note: in included file (through include/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_perf_event.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/head64.c:274:35: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/head64.c:274:35: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/head64.c:274:35: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/head64.c:274:35: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/head64.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
>> arch/x86/include/asm/tlbflush.h:181:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/tlbflush.h:181:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/tlbflush.h:181:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/tlbflush.h:181:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/process_64.c:170:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process_64.c:170:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process_64.c:170:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process_64.c:170:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process_64.c:170:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process_64.c:170:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process_64.c:170:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process_64.c:170:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:217:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:217:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:217:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:217:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:217:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:217:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:217:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:217:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:616:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:616:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:616:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:616:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:670:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:670:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:670:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:670:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:671:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:671:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:671:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c:671:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process_64.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   arch/x86/include/asm/processor.h:536:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/processor.h:536:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/processor.h:536:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/processor.h:536:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/signal.c:421:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   arch/x86/kernel/signal.c:421:9: sparse:     expected struct lockdep_map const *lock
   arch/x86/kernel/signal.c:421:9: sparse:     got struct lockdep_map [noderef] __rcu *
   arch/x86/kernel/signal.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/signal_64.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/traps.c:627:60: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/traps.c:627:60: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/traps.c:627:60: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/traps.c:627:60: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c:1105:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c:1105:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c:1105:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c:1105:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c: note: in included file:
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/processor.h:554:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c: note: in included file (through include/linux/entry-common.h, arch/x86/include/asm/idtentry.h, arch/x86/include/asm/traps.h):
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c: note: in included file (through include/linux/irq-entry-common.h, include/linux/entry-common.h, arch/x86/include/asm/idtentry.h, ...):
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c: note: in included file (through include/linux/entry-common.h, arch/x86/include/asm/idtentry.h, arch/x86/include/asm/traps.h):
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/traps.c: note: in included file:
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/idt.c:182:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/idt.c:182:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/idt.c:182:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/idt.c:182:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/idt.c:182:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/idt.c:182:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/idt.c:182:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/idt.c:182:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/irq.c:262:33: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq.c:262:33: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq.c:262:33: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq.c:262:33: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:270:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:270:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:270:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:270:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:319:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c: note: in included file (through arch/x86/include/generated/asm/irq_regs.h, include/linux/irq.h):
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:276:33: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:276:33: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:276:33: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:276:33: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:338:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/irq.c:563:1: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/dumpstack_64.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/dumpstack_64.c:103:32: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/dumpstack_64.c:103:32: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/dumpstack_64.c:103:32: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/dumpstack_64.c:103:32: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/dumpstack_64.c:137:47: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/dumpstack_64.c:137:47: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/dumpstack_64.c:137:47: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/dumpstack_64.c:137:47: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/dumpstack.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/dumpstack.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/nmi.c:376:25: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/nmi.c:376:25: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/nmi.c:376:25: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/nmi.c:376:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:379:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:379:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:379:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:379:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:381:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:381:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:381:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:381:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:405:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:405:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:405:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:405:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:473:20: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:473:20: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:473:20: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:473:20: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:555:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:555:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:555:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:555:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:556:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:556:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:556:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:556:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:559:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:559:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:559:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:559:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:560:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:560:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:560:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:560:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:575:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:575:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:575:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:575:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:597:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:597:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:597:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:597:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:601:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:601:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:601:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:601:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:602:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:602:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:602:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:602:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:751:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:751:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:751:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c:751:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/nmi.c: note: in included file (through arch/x86/include/asm/traps.h):
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/ldt.c:140:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/ldt.c:140:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/ldt.c:140:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/ldt.c:140:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/ldt.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/ldt.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/irq_work.c:17:1: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/signal_32.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/sys_x86_64.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/hw_breakpoint.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/hw_breakpoint.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/hw_breakpoint.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/hw_breakpoint.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/hw_breakpoint.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/hw_breakpoint.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/hw_breakpoint.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/hw_breakpoint.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:118:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:118:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:118:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:118:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:151:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:151:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:151:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:151:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:151:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:151:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:151:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:151:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:165:15: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:165:15: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:165:15: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:165:15: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:178:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:178:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:178:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:178:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:486:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:486:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:486:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:486:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:487:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:487:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:487:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:487:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:488:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:488:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:488:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:488:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:489:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:489:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:489:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:489:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:491:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:491:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:491:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:491:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:532:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:532:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:532:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c:532:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/hw_breakpoint.c: note: in included file (through include/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_perf_event.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/tsc.c:995:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/tsc.c:995:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/tsc.c:995:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/tsc.c:995:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:996:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:996:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:996:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:996:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:89:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:82:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:85:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:86:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/tsc.c:87:39: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/process.c:351:26: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process.c:351:26: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process.c:351:26: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/process.c:351:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:354:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:354:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:354:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:354:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:840:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:840:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:840:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:840:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c: note: in included file (through include/linux/entry-common.h):
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c: note: in included file (through include/linux/irq-entry-common.h, include/linux/entry-common.h):
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c: note: in included file (through include/linux/entry-common.h):
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:645:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:645:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:645:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:645:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:645:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:645:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:645:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:645:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:708:37: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:708:37: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:708:37: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:708:37: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:712:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:712:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:712:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/process.c:712:17: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/ptrace.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/tls.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/step.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/stacktrace.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/machine_kexec_64.c:449:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/machine_kexec_64.c:449:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/machine_kexec_64.c:449:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/machine_kexec_64.c:449:13: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/kvmclock.c:313:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvmclock.c:313:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvmclock.c:313:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvmclock.c:313:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvmclock.c: note: in included file:
>> arch/x86/include/asm/kvmclock.h:11:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/kvmclock.h:11:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/kvmclock.h:11:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/kvmclock.h:11:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/kvmclock.h:16:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/kvmclock.h:16:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/kvmclock.h:16:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/kvmclock.h:16:16: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/kvm.c:150:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvm.c:150:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvm.c:150:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvm.c:150:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvm.c:150:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvm.c:150:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvm.c:150:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kvm.c:150:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:250:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:250:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:250:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:250:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:251:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:251:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:251:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:251:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:252:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:252:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:252:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:252:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:301:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:301:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:301:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:301:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:302:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:302:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:302:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:302:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:304:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:304:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:304:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:304:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:368:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:368:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:368:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:368:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:377:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:377:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:377:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:377:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:389:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:389:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:389:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:389:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:393:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:393:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:393:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:393:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c:292:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kvm.c: note: in included file (through arch/x86/include/generated/asm/irq_regs.h, include/linux/irq.h):
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/perf_regs.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/perf_regs.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/cet.c: note: in included file (through include/linux/sched.h, include/linux/ptrace.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/unwind_frame.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/umip.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/shstk.c:410:55: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kernel/shstk.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/mm/init.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/init.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'poking_init' - unexpected unlock
--
>> arch/x86/mm/fault.c:674:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/mm/fault.c:674:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/mm/fault.c:674:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/mm/fault.c:674:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/fault.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/fault.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/fault.c: note: in included file:
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/mm/mmap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/mm/tlb.c:207:29: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/mm/tlb.c:207:29: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/mm/tlb.c:207:29: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/mm/tlb.c:207:29: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:213:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:213:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:213:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:213:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:215:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:215:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:215:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:215:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:250:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:250:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:250:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:250:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:254:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:254:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:254:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:254:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:259:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:259:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:259:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:259:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:270:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:270:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:270:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:270:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:587:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:587:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:587:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:587:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:601:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:601:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:601:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:601:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:645:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:645:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:645:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:645:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:674:19: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:674:19: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:674:19: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:674:19: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:749:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:749:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:749:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:749:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:770:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:770:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:770:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:770:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:786:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:786:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:786:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:786:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:787:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:787:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:787:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:787:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:788:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:788:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:788:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:788:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:827:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:827:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:827:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:827:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:843:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:843:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:843:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:843:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:892:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:892:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:892:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:892:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:914:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:914:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:914:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:914:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:949:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:949:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:949:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:949:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:950:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:950:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:950:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:950:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:964:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:964:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:964:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:964:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:965:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:965:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:965:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:965:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:989:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:989:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:989:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:989:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:992:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:992:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:992:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:992:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/mm/tlb.c:1107:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1108:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1108:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1108:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1108:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1109:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1109:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1109:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1109:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1110:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1110:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1110:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1110:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1114:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1114:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1114:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1114:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1136:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1136:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1136:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1136:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1137:30: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1137:30: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1137:30: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1137:30: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1164:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1164:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1164:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1164:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1171:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1171:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1171:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1171:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1174:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1174:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1174:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1174:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1188:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1188:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1188:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1188:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1287:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1287:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1287:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1287:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1474:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1474:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1474:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1474:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1475:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1475:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1475:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1475:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1475:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1475:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1475:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1475:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1576:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1576:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1576:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1576:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1577:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1577:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1577:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1577:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1617:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1617:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1617:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1617:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1635:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1635:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1635:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1635:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1636:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1636:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1636:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1636:26: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1679:35: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1679:35: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1679:35: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1679:35: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1696:30: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1696:30: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1696:30: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1696:30: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1748:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1748:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1748:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1748:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1748:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1748:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1748:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1748:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1769:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1769:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1769:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:1769:39: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c:376:13: sparse: sparse: context imbalance in 'use_global_asid' - wrong count at exit
   arch/x86/mm/tlb.c:404:6: sparse: sparse: context imbalance in 'mm_free_global_asid' - wrong count at exit
   arch/x86/mm/tlb.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/mm/tlb.c: note: in included file (through arch/x86/include/asm/mmu_context.h, include/linux/mmu_context.h):
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/sock.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/sock.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h, include/linux/errqueue.h):
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/sock.c: note: in included file:
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/sock.c:2602:9: sparse: sparse: context imbalance in 'sk_clone' - different lock contexts for basic block
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/sock.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/sock.c: note: in included file:
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/sock.c:4280:13: sparse: sparse: context imbalance in 'proto_seq_start' - wrong count at exit
   net/core/sock.c:4292:13: sparse: sparse: context imbalance in 'proto_seq_stop' - wrong count at exit
--
   net/core/stream.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/datagram.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/datagram.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
   include/net/checksum.h:41:45: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:41:45: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:41:45: sparse:     got unsigned int
--
   net/core/scm.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/core/skbuff.c:249:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/skbuff.c:249:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/skbuff.c:249:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/skbuff.c:249:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:288:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:331:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:331:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:331:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:331:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:771:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:771:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:771:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:771:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:844:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:844:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:844:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:844:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:1454:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:1454:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:1454:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c:1454:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/skbuff.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
   include/net/checksum.h:33:39: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int @@
   include/net/checksum.h:33:39: sparse:     expected restricted __wsum [usertype] sum
   include/net/checksum.h:33:39: sparse:     got unsigned int
--
   net/core/gen_stats.c:59:1: sparse: sparse: context imbalance in 'gnet_stats_start_copy_compat' - wrong count at exit
   net/core/gen_stats.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gen_stats.c:32:31: sparse: sparse: context imbalance in '___gnet_stats_copy_basic' - unexpected unlock
   net/core/gen_stats.c:32:31: sparse: sparse: context imbalance in 'gnet_stats_copy_rate_est' - unexpected unlock
   net/core/gen_stats.c:32:31: sparse: sparse: context imbalance in 'gnet_stats_copy_queue' - unexpected unlock
   net/core/gen_stats.c:32:31: sparse: sparse: context imbalance in 'gnet_stats_copy_app' - unexpected unlock
   net/core/gen_stats.c:32:31: sparse: sparse: context imbalance in 'gnet_stats_finish_copy' - unexpected unlock
--
>> net/core/gen_estimator.c:93:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gen_estimator.c:93:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gen_estimator.c:93:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gen_estimator.c:93:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gen_estimator.c:93:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gen_estimator.c:93:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gen_estimator.c:93:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gen_estimator.c:93:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gen_estimator.c:71:9: sparse: sparse: context imbalance in 'est_fetch_counters' - different lock contexts for basic block
   net/core/gen_estimator.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gen_estimator.c: note: in included file (through include/linux/uprobes.h, include/linux/mm_types.h, arch/x86/include/asm/uaccess.h, ...):
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/seqlock.h:221:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gen_estimator.c:194:9: sparse: sparse: context imbalance in 'gen_new_estimator' - different lock contexts for basic block
--
   net/core/net_namespace.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/flow_dissector.c: note: in included file (through include/linux/if_pppox.h):
   include/uapi/linux/if_pppox.h:153:29: sparse: sparse: array of flexible structures
   net/core/flow_dissector.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/dst.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/workqueue.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/dev_ioctl.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/rtnetlink.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'rtnl_link_ops_get' - wrong count at exit
   net/core/rtnetlink.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:463:9: sparse: sparse: context imbalance in 'rtnl_link_ops_put' - unexpected unlock
   net/core/rtnetlink.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/rtnetlink.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'rtnl_af_lookup' - wrong count at exit
   net/core/rtnetlink.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:463:9: sparse: sparse: context imbalance in 'rtnl_af_put' - unexpected unlock
--
   net/core/sock_reuseport.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/dev.c:3438:21: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:3438:21: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:3438:21: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:3438:21: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:3439:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:3439:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:3439:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:3439:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5486:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5486:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5486:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5486:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5487:36: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5487:36: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5487:36: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5487:36: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6450:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6450:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6450:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6450:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6600:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6600:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6600:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6600:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6611:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6611:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6611:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6611:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6628:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6628:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6628:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:6628:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:13157:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:13157:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:13157:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:13157:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c: note: in included file:
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c: note: in included file:
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c: note: in included file (through include/linux/filter.h, include/trace/events/xdp.h, include/linux/bpf_trace.h):
   include/net/sch_generic.h:225:30: sparse: sparse: context imbalance in '__dev_queue_xmit' - different lock contexts for basic block
   net/core/dev.c: note: in included file:
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5244:9: sparse: sparse: context imbalance in 'kick_defer_list_purge' - different lock contexts for basic block
   net/core/dev.c:5337:43: sparse: sparse: context imbalance in 'enqueue_to_backlog' - different lock contexts for basic block
   net/core/dev.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c: note: in included file:
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/netdevice.h:5249:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:5753:17: sparse: sparse: context imbalance in 'net_tx_action' - different lock contexts for basic block
   net/core/dev.c:6450:9: sparse: sparse: context imbalance in 'flush_backlog' - different lock contexts for basic block
   net/core/dev.c:6597:9: sparse: sparse: context imbalance in 'process_backlog' - different lock contexts for basic block
   net/core/dev.c:4903:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4903:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4903:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4903:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4903:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4903:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4903:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4903:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4914:64: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4914:64: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4914:64: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dev.c:4914:64: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/core/xdp.c:752:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/xdp.c:752:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/xdp.c:752:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/xdp.c:752:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/xdp.c:753:14: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/xdp.c:753:14: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/xdp.c:753:14: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/xdp.c:753:14: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/xdp.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/xdp.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/workqueue.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/net-sysfs.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/core/gro_cells.c:30:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gro_cells.c:30:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gro_cells.c:30:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/gro_cells.c:30:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gro_cells.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gro_cells.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gro_cells.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gro_cells.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gro_cells.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/gro_cells.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/core/dst_cache.c:74:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dst_cache.c:74:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dst_cache.c:74:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dst_cache.c:74:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:89:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:89:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:89:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:89:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:111:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:111:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:111:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:111:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:128:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:128:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:128:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:128:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:147:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:147:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:147:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c:147:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/dst_cache.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/core/filter.c:1440:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1440:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1440:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:1518:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1518:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1518:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:2342:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] daddr @@     got unsigned int [usertype] ipv4_nh @@
   net/core/filter.c:2342:45: sparse:     expected restricted __be32 [usertype] daddr
   net/core/filter.c:2342:45: sparse:     got unsigned int [usertype] ipv4_nh
   net/core/filter.c:11203:31: sparse: sparse: symbol 'sk_filter_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11210:27: sparse: sparse: symbol 'sk_filter_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11214:31: sparse: sparse: symbol 'tc_cls_act_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11223:27: sparse: sparse: symbol 'tc_cls_act_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11227:31: sparse: sparse: symbol 'xdp_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11239:31: sparse: sparse: symbol 'cg_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11245:27: sparse: sparse: symbol 'cg_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11249:31: sparse: sparse: symbol 'lwt_in_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11255:27: sparse: sparse: symbol 'lwt_in_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11259:31: sparse: sparse: symbol 'lwt_out_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11265:27: sparse: sparse: symbol 'lwt_out_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11269:31: sparse: sparse: symbol 'lwt_xmit_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11276:27: sparse: sparse: symbol 'lwt_xmit_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11280:31: sparse: sparse: symbol 'lwt_seg6local_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11286:27: sparse: sparse: symbol 'lwt_seg6local_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11289:31: sparse: sparse: symbol 'cg_sock_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11295:27: sparse: sparse: symbol 'cg_sock_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11298:31: sparse: sparse: symbol 'cg_sock_addr_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11304:27: sparse: sparse: symbol 'cg_sock_addr_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11307:31: sparse: sparse: symbol 'sock_ops_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11313:27: sparse: sparse: symbol 'sock_ops_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11316:31: sparse: sparse: symbol 'sk_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11323:27: sparse: sparse: symbol 'sk_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11326:31: sparse: sparse: symbol 'sk_msg_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11333:27: sparse: sparse: symbol 'sk_msg_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11336:31: sparse: sparse: symbol 'flow_dissector_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11342:27: sparse: sparse: symbol 'flow_dissector_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11676:31: sparse: sparse: symbol 'sk_reuseport_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11682:27: sparse: sparse: symbol 'sk_reuseport_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11884:27: sparse: sparse: symbol 'sk_lookup_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11888:31: sparse: sparse: symbol 'sk_lookup_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:1948:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1948:43: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1948:43: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1951:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] old @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1951:36: sparse:     expected restricted __be16 [usertype] old
   net/core/filter.c:1951:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1951:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] new @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1951:42: sparse:     expected restricted __be16 [usertype] new
   net/core/filter.c:1951:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1954:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1954:36: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1954:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1954:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1954:42: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1954:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:2000:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:2000:59: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:2000:59: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:2003:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:2003:52: sparse:     expected restricted __be16 [usertype] from
   net/core/filter.c:2003:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:2003:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:2003:58: sparse:     expected restricted __be16 [usertype] to
   net/core/filter.c:2003:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:2006:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:2006:52: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:2006:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:2006:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:2006:58: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:2006:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:2073:35: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [usertype] csum @@
   net/core/filter.c:2073:35: sparse:     expected unsigned long long
   net/core/filter.c:2073:35: sparse:     got restricted __wsum [usertype] csum
   net/core/filter.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/core/filter.c: note: in included file:
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
>> net/core/dev.h:369:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv4/route.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv4/ip_output.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv4/ip_sockglue.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv4/inet_hashtables.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv4/inet_connection_sock.c:328:36: sparse: sparse: context imbalance in 'inet_csk_find_open_port' - wrong count at exit
   net/ipv4/inet_connection_sock.c:606:23: sparse: sparse: context imbalance in 'inet_csk_get_port' - unexpected unlock
   net/ipv4/inet_connection_sock.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/inet_connection_sock.c:1439:9: sparse: sparse: context imbalance in 'inet_csk_complete_hashdance' - unexpected unlock
--
   net/ipv4/tcp.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/swait.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/swait.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/ipv4/tcp_input.c:7426:15: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/tcp_input.c:7426:15: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/tcp_input.c:7426:15: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/tcp_input.c:7426:15: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_input.c:7432:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_input.c:7432:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_input.c:7432:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_input.c:7432:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_input.c:7549:17: sparse: sparse: context imbalance in 'tcp_conn_request' - unexpected unlock
--
   net/ipv4/tcp_output.c: note: in included file (through include/linux/kernel_stat.h, include/linux/cgroup.h, include/net/netprio_cgroup.h, ...):
   include/linux/interrupt.h:675:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:675:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:675:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:675:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_output.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_output.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_output.c: note: in included file:
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
>> include/net/proto_memory.h:58:19: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/ipv4/tcp_ipv4.c:894:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/tcp_ipv4.c:894:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/tcp_ipv4.c:894:9: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/tcp_ipv4.c:894:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:895:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:895:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:895:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:895:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1017:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1017:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1017:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1017:9: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1018:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1018:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1018:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1018:18: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:2395:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:2395:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:2395:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:2395:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:3489:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@
   net/ipv4/tcp_ipv4.c:3489:41: sparse:     expected void const *data
   net/ipv4/tcp_ipv4.c:3489:41: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
   net/ipv4/tcp_ipv4.c:3615:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control @@
   net/ipv4/tcp_ipv4.c:3615:45: sparse:     expected void const *data
   net/ipv4/tcp_ipv4.c:3615:45: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control
   net/ipv4/tcp_ipv4.c:3619:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@     got struct tcp_congestion_ops * @@
   net/ipv4/tcp_ipv4.c:3619:50: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
   net/ipv4/tcp_ipv4.c:3619:50: sparse:     got struct tcp_congestion_ops *
   net/ipv4/tcp_ipv4.c: note: in included file (through include/linux/preempt.h, include/linux/bottom_half.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/tcp_ipv4.c:1798:25: sparse: sparse: context imbalance in 'tcp_v4_syn_recv_sock' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2099:17: sparse: sparse: context imbalance in 'tcp_add_backlog' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2362:24: sparse: sparse: context imbalance in 'tcp_v4_rcv' - different lock contexts for basic block
   net/ipv4/tcp_ipv4.c:2557:13: sparse: sparse: context imbalance in 'listening_get_first' - wrong count at exit
   net/ipv4/tcp_ipv4.c:2605:29: sparse: sparse: context imbalance in 'listening_get_next' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2638:13: sparse: sparse: context imbalance in 'established_get_first' - wrong count at exit
   net/ipv4/tcp_ipv4.c:2683:40: sparse: sparse: context imbalance in 'established_get_next' - unexpected unlock
   net/ipv4/tcp_ipv4.c:2815:36: sparse: sparse: context imbalance in 'tcp_seq_stop' - unexpected unlock
   net/ipv4/tcp_ipv4.c:3490:41: sparse: sparse: dereference of noderef expression
   net/ipv4/tcp_ipv4.c:3490:41: sparse: sparse: dereference of noderef expression
   net/ipv4/tcp_ipv4.c:3616:45: sparse: sparse: dereference of noderef expression
   net/ipv4/tcp_ipv4.c:3616:45: sparse: sparse: dereference of noderef expression
--
   net/ipv4/raw.c: note: in included file:
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv4/udp.c:1666:28: sparse: sparse: context imbalance in 'udp_rmem_release' - unexpected unlock
   net/ipv4/udp.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/udp.c:3331:9: sparse: sparse: context imbalance in 'udp_get_first' - wrong count at exit
   net/ipv4/udp.c:3348:39: sparse: sparse: context imbalance in 'udp_get_next' - unexpected unlock
   net/ipv4/udp.c:3396:31: sparse: sparse: context imbalance in 'udp_seq_stop' - unexpected unlock
--
>> net/ipv4/icmp.c:207:14: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/icmp.c:207:14: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/icmp.c:207:14: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv4/icmp.c:207:14: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/icmp.c: note: in included file (through include/linux/spinlock.h, include/linux/sched.h, include/linux/percpu.h, ...):
   include/linux/bottom_half.h:33:30: sparse: sparse: context imbalance in 'icmp_reply' - different lock contexts for basic block
   include/linux/bottom_half.h:33:30: sparse: sparse: context imbalance in '__icmp_send' - different lock contexts for basic block
--
   net/ipv4/devinet.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv4/af_inet.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv4/ping.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/ping.c:1070:13: sparse: sparse: context imbalance in 'ping_v4_seq_start' - wrong count at exit
--
   net/ipv4/nexthop.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv4/nexthop.c: note: in included file (through include/linux/sysctl.h, include/net/net_namespace.h, include/linux/netdevice.h, ...):
   include/linux/rbtree.h:102:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:102:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:102:9: sparse:    struct rb_node *
--
   net/ipv4/ipconfig.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv6/ip6_output.c: note: in included file:
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/netdevice.h:3579:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv6/ip6_output.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv6/ipv6_sockglue.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv6/ndisc.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv6/addrconf.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/ipv6/icmp.c:107:14: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/icmp.c:107:14: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/icmp.c:107:14: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/icmp.c:107:14: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv6/icmp.c:103:20: sparse: sparse: context imbalance in 'icmpv6_xmit_lock' - wrong count at exit
   net/ipv6/icmp.c:119:13: sparse: sparse: context imbalance in 'icmpv6_xmit_unlock' - unexpected unlock
--
>> net/ipv6/tcp_ipv6.c:1950:25: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/tcp_ipv6.c:1950:25: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/tcp_ipv6.c:1950:25: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/tcp_ipv6.c:1950:25: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv6/tcp_ipv6.c:1515:25: sparse: sparse: context imbalance in 'tcp_v6_syn_recv_sock' - unexpected unlock
   net/ipv6/tcp_ipv6.c:1912:24: sparse: sparse: context imbalance in 'tcp_v6_rcv' - different lock contexts for basic block
--
>> net/ipv6/route.c:1443:19: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/route.c:1443:19: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/route.c:1443:19: sparse: sparse: cast removes address space '__percpu' of expression
>> net/ipv6/route.c:1443:19: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv6/route.c:2393:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] flow_label @@     got restricted __be32 @@
   net/ipv6/route.c:2393:39: sparse:     expected unsigned int [usertype] flow_label
   net/ipv6/route.c:2393:39: sparse:     got restricted __be32
   net/ipv6/route.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/ipv6/route.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv6/ip6_flowlabel.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   net/ipv6/inet6_hashtables.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> net/sched/sch_frag.c:102:17: sparse: sparse: cast removes address space '__percpu' of expression
>> net/sched/sch_frag.c:102:17: sparse: sparse: cast removes address space '__percpu' of expression
>> net/sched/sch_frag.c:102:17: sparse: sparse: cast removes address space '__percpu' of expression
>> net/sched/sch_frag.c:102:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/sched/sch_frag.c:119:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/sched/sch_frag.c:119:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/sched/sch_frag.c:119:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/sched/sch_frag.c:119:17: sparse: sparse: cast removes address space '__percpu' of expression
   net/sched/sch_frag.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   net/sched/sch_frag.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> drivers/thermal/intel/therm_throt.c:666:13: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/thermal/intel/therm_throt.c:666:13: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/thermal/intel/therm_throt.c:666:13: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/thermal/intel/therm_throt.c:666:13: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:671:13: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:671:13: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:671:13: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:671:13: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:678:21: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:678:21: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:678:21: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:678:21: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:684:21: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:684:21: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:684:21: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/thermal/intel/therm_throt.c:684:21: sparse: sparse: cast removes address space '__percpu' of expression
--
>> drivers/media/usb/uvc/uvc_queue.c:176:9: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/media/usb/uvc/uvc_queue.c:176:9: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/media/usb/uvc/uvc_queue.c:176:9: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/media/usb/uvc/uvc_queue.c:176:9: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/media/usb/uvc/uvc_queue.c:176:9: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/media/usb/uvc/uvc_queue.c:176:9: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/media/usb/uvc/uvc_queue.c:176:9: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/media/usb/uvc/uvc_queue.c:176:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:200:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:200:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:200:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:200:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:200:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:200:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:200:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:200:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:213:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:213:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:213:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:213:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:213:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:213:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:213:9: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/media/usb/uvc/uvc_queue.c:213:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/entry/vdso/vma.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/entry/vdso/extable.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/events/amd/core.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/ptrace.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c: note: in included file:
>> arch/x86/events/amd/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/core.c:879:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/core.c:879:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/core.c:879:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/core.c:879:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c:884:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c:884:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c:884:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c:884:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c:884:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c:884:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c:884:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/amd/core.c:884:13: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/events/amd/ibs.c:265:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/ibs.c:265:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/ibs.c:265:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/ibs.c:265:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/ibs.c:265:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/ibs.c:265:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/ibs.c:265:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/amd/ibs.c:265:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/entry/vsyscall/vsyscall_64.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/events/intel/core.c:3083:22: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/core.c:3083:22: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/core.c:3083:22: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/core.c:3083:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:3183:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:3183:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:3183:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:3183:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4448:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4448:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4448:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4448:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4448:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4448:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4448:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4448:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4558:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4558:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4558:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4558:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4558:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4558:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4558:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4558:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4586:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4586:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4586:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4586:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4586:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4586:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4586:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4586:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4680:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4680:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4680:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4680:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4680:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4680:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4680:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:4680:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:5763:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:5763:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:5763:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:5763:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c: note: in included file:
>> arch/x86/events/intel/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/core.c:3743:1: sparse: sparse: context imbalance in 'intel_start_scheduling' - different lock contexts for basic block
   arch/x86/events/intel/core.c:3816:9: sparse: sparse: context imbalance in 'intel_stop_scheduling' - unexpected unlock
   arch/x86/events/intel/core.c:4028:25: sparse: sparse: context imbalance in 'intel_put_excl_constraints' - unexpected unlock
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/events/intel/ds.c:1782:27: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/ds.c:1782:27: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/ds.c:1782:27: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/ds.c:1782:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:2105:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:2105:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:2105:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:2105:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:2535:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:2535:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:2535:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:2535:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:3183:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:3183:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:3183:34: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/intel/ds.c:3183:34: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/events/intel/lbr.c:961:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/lbr.c:961:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/lbr.c:961:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/lbr.c:961:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/lbr.c:961:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/lbr.c:961:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/lbr.c:961:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/lbr.c:961:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/events/intel/p4.c:1014:20: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/p4.c:1014:20: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/p4.c:1014:20: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/intel/p4.c:1014:20: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/mm/pat/memtype.c: note: in included file (through include/linux/mutex.h, include/linux/seq_file.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/mm/pat/memtype_interval.c: note: in included file (through include/linux/mutex.h, include/linux/seq_file.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/events/zhaoxin/core.c: note: in included file:
>> arch/x86/events/zhaoxin/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/zhaoxin/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/zhaoxin/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/events/zhaoxin/../perf_event.h:1284:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/zhaoxin/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/zhaoxin/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/zhaoxin/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/events/zhaoxin/../perf_event.h:1259:28: sparse: sparse: cast removes address space '__percpu' of expression
--
   block/partitions/core.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/sched/fair.c:7794:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/fair.c:7794:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/fair.c:7794:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/fair.c:7794:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/fair.c:7794:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/fair.c:7794:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/fair.c:7794:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/fair.c:7794:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/fair.c:1151:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1151:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1151:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1187:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1187:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1187:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1243:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1243:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1243:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12922:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12922:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12922:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6768:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6768:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6768:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:7261:22: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/fair.c:7261:22: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/fair.c:7261:22: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/fair.c:7261:22: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/fair.c:8347:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8347:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8347:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8551:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8551:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8551:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8750:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8750:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8750:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8777:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8777:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8777:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9041:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9041:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9041:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:10077:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10077:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10077:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10705:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10705:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10705:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12177:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12177:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12177:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11815:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11815:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11815:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12290:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12290:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12290:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6681:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2637:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2637:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2637:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
--
>> kernel/sched/core.c:691:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/core.c:691:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/core.c:691:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/core.c:691:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/core.c:691:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/core.c:691:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/core.c:691:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/core.c:691:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/core.c:881:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:881:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:881:49: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:1101:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1101:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1101:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2175:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2175:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2175:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2186:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2186:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2186:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3583:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3583:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3583:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3788:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3788:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3788:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5520:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5520:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5520:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6738:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6738:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6738:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6805:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6805:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6805:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7311:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7311:17: sparse:    struct task_struct *
   kernel/sched/core.c:7311:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10212:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10212:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10212:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/core.c:632:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:657:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:681:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1810:9: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1810:9: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:102:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:102:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:102:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:881:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2256:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/core.c:2170:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2170:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2170:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2637:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2637:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2637:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2637:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2637:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2637:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2614:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2614:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2614:9: sparse:    struct task_struct *
--
   kernel/sched/rt.c:1512:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1512:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1512:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1513:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1513:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1513:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1574:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1574:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1574:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1616:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1616:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1616:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1635:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1635:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1635:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1976:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1976:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:1976:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1999:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1999:13: sparse:    struct task_struct *
   kernel/sched/rt.c:1999:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2345:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2345:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2345:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2347:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2347:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2347:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2347:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2347:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2347:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2888:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2888:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2888:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2898:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2898:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2898:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3004:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3004:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3004:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2505:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2505:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2505:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2515:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2515:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2515:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1194:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1194:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1194:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1194:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1292:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1292:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1292:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1423:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:1423:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1423:30: sparse:    struct task_struct *
   kernel/sched/deadline.c:1800:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1800:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1800:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1800:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1800:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1800:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1914:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1914:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1914:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2724:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2724:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2724:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2392:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2392:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2392:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2393:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2393:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2393:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2467:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2467:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2467:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3049:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3049:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3049:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3051:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3051:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3051:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3053:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3053:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3053:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3288:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3288:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3288:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3335:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:185:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:1410:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/syscalls.c:1410:22: sparse:     expected struct task_struct *curr
   kernel/sched/syscalls.c:1410:22: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
>> include/linux/cpuidle.h:121:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/cpuidle.h:121:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/cpuidle.h:121:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/cpuidle.h:121:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/cpuidle.h:121:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/cpuidle.h:121:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/cpuidle.h:121:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/cpuidle.h:121:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/build_policy.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/build_policy.c: note: in included file:
   include/linux/cpuidle.h:204:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/cpuidle.h:204:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/cpuidle.h:204:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/cpuidle.h:204:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2304:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2304:26: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1270:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/syscalls.c:1335:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1659:15: sparse: sparse: dereference of noderef expression
--
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/clock.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/clock.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/clock.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/clock.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/clock.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/clock.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/clock.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/clock.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:624:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:624:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:624:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:952:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:952:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:952:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:952:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:952:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:952:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/completion.c:76:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/completion.c:76:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/completion.c:76:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/completion.c:76:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/topology.c:115:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:115:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:115:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:134:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:134:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:134:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:157:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:157:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:157:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:468:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:468:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:468:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:638:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:638:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:638:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:723:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:723:50: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:723:50: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:731:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:731:55: sparse:     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child
   kernel/sched/topology.c:731:55: sparse:     got struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:744:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:744:29: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:744:29: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:749:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:749:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:749:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:770:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:770:13: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/topology.c:770:13: sparse:     got struct sched_domain [noderef] __rcu *sd
   kernel/sched/topology.c:932:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:932:70: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:932:70: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:961:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:961:59: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:961:59: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1007:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1007:57: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1007:57: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1009:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1009:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1009:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1017:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1017:55: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1017:55: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1019:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1019:25: sparse:     expected struct sched_domain *sibling
   kernel/sched/topology.c:1019:25: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1089:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1089:62: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:1089:62: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1193:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1193:40: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:1193:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1331:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:1331:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:1331:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:1680:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:1680:43: sparse:     expected struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:1680:43: sparse:     got struct sched_domain *child
   kernel/sched/topology.c:2470:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2470:31: sparse:     expected struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2470:31: sparse:     got struct sched_domain *sd
   kernel/sched/topology.c:2591:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2591:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2591:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2612:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:2612:56: sparse:     expected struct sched_domain *child
   kernel/sched/topology.c:2612:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:2611:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2611:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2611:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:2666:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2666:57: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2666:57: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/membarrier.c:211:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/membarrier.c:211:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/membarrier.c:211:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/sched/membarrier.c:211:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/membarrier.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/membarrier.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/membarrier.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/membarrier.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/membarrier.c:445:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/membarrier.c:445:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/membarrier.c:445:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/membarrier.c:445:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2293:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:25: sparse:    struct task_struct *
--
   kernel/locking/semaphore.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/locking/mutex.c: note: in included file (through include/linux/mutex.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/current.h:23:17: sparse: sparse: context imbalance in '__mutex_lock' - different lock contexts for basic block
   arch/x86/include/asm/current.h:23:17: sparse: sparse: context imbalance in '__ww_mutex_lock' - different lock contexts for basic block
   arch/x86/include/asm/current.h:23:17: sparse: sparse: context imbalance in 'mutex_lock_io_nested' - different lock contexts for basic block
--
   kernel/locking/rwsem.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/locking/rwsem.c:143:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/locking/rwsem.c:143:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/locking/rwsem.c:143:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/locking/rwsem.c:143:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/locking/rwsem.c:143:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/locking/rwsem.c:143:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/locking/rwsem.c:143:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/locking/rwsem.c:143:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c:149:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c:149:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c:149:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c:149:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c:149:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c:149:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c:149:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rwsem.c:149:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/locking/percpu-rwsem.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/locking/spinlock_debug.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/locking/rtmutex_api.c: note: in included file (through include/linux/sched/signal.h, kernel/locking/rtmutex.c):
   include/linux/sched/task.h:116:21: sparse: sparse: context imbalance in 'task_blocks_on_rt_mutex' - unexpected unlock
   kernel/locking/rtmutex_api.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/locking/rtmutex_api.c: note: in included file:
   kernel/locking/rtmutex.c:1672:9: sparse: sparse: context imbalance in 'rt_mutex_handle_deadlock' - unexpected unlock
   kernel/locking/rtmutex_api.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/power/main.c:223:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:223:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:224:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:224:26: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:226:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:227:62: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:223:55: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:252:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:252:46: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:253:54: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:252:67: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:272:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:272:36: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:278:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:278:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:278:39: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:278:47: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:757:34: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:757:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:758:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:759:77: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:757:55: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:788:38: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:788:46: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:789:47: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:788:67: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:809:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:809:36: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:815:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:815:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:883:31: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:883:36: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:914:13: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:914:21: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:915:58: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c:916:51: sparse: sparse: restricted suspend_state_t degrades to integer
   kernel/power/main.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/power/process.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/power/process.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/power/user.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/swap.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/printk/printk_safe.c:70:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/printk/printk_safe.c:70:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/printk/printk_safe.c:70:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/printk/printk_safe.c:70:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/printk/printk_safe.c: note: in included file (through include/linux/preempt.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/printk/nbcon.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rcuwait.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/irq/irqdesc.c:268:16: sparse: sparse: context imbalance in 'chip_name_show' - wrong count at exit
   kernel/irq/irqdesc.c:279:16: sparse: sparse: context imbalance in 'hwirq_show' - wrong count at exit
   kernel/irq/irqdesc.c:290:16: sparse: sparse: context imbalance in 'type_show' - wrong count at exit
   kernel/irq/irqdesc.c:300:16: sparse: sparse: context imbalance in 'wakeup_show' - wrong count at exit
   kernel/irq/irqdesc.c:309:16: sparse: sparse: context imbalance in 'name_show' - wrong count at exit
   kernel/irq/irqdesc.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/irq.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq/irqdesc.c:850:17: sparse: sparse: context imbalance in '__irq_get_desc_lock' - wrong count at exit
--
   kernel/irq/handle.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/irq.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/irq/manage.c:50:43: sparse: sparse: context imbalance in '__synchronize_hardirq' - different lock contexts for basic block
   kernel/irq/manage.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/irq.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq/manage.c:1184:13: sparse: sparse: context imbalance in 'irq_wake_secondary' - different lock contexts for basic block
   kernel/irq/manage.c:1272:6: sparse: sparse: context imbalance in 'irq_wake_thread' - different lock contexts for basic block
   kernel/irq/manage.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/irq.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/irq/manage.c:2031:12: sparse: sparse: context imbalance in 'free_nmi' - different lock contexts for basic block
--
   kernel/liveupdate/kexec_handover.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/entry/syscall-common.c: note: in included file (through include/linux/sched.h, include/linux/audit.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/entry/common.c:192:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/entry/common.c:192:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/entry/common.c:192:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/entry/common.c:192:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/entry/common.c:192:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/entry/common.c:192:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/entry/common.c:192:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/entry/common.c:192:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c:235:29: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c:235:29: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c:235:29: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c:235:29: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h, include/linux/irq-entry-common.h):
>> arch/x86/include/asm/processor.h:554:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c: note: in included file (through include/linux/sched.h, include/linux/context_tracking.h, include/linux/irq-entry-common.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/context_tracking.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c: note: in included file:
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c: note: in included file (through include/linux/irq-entry-common.h):
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/entry/common.c: note: in included file:
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/entry/syscall_user_dispatch.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/kasan/common.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, arch/x86/include/asm/pgtable.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   mm/kasan/report.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   mm/kasan/report.c:206:13: sparse: sparse: context imbalance in 'start_report' - wrong count at exit
   mm/kasan/report.c:224:9: sparse: sparse: context imbalance in 'end_report' - unexpected unlock
--
   mm/kasan/report_generic.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/unwind/user.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/unwind/deferred.c:82:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/unwind/deferred.c:82:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/unwind/deferred.c:82:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/unwind/deferred.c:82:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/unwind/deferred.c:82:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/unwind/deferred.c:82:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/unwind/deferred.c:82:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/unwind/deferred.c:82:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:88:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:88:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:88:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:88:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:91:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:91:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:91:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:91:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:149:13: sparse: sparse: context imbalance in 'process_unwind_deferred' - different lock contexts for basic block
   kernel/unwind/deferred.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/unwind/deferred.c:257:13: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/unwind/deferred.c:256:15: sparse: signed value source
--
   lib/kunit/string-stream.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/fpu/init.c:56:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/init.c:56:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/init.c:56:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/init.c:56:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/init.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/fpu/core.c:90:14: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/core.c:90:14: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/core.c:90:14: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/core.c:90:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:454:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:454:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:454:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:454:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:455:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:455:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:455:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:455:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:476:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:476:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:476:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:476:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:477:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:477:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:477:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:477:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:987:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:987:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:987:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:987:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h, include/linux/regset.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c: note: in included file (through include/linux/preempt.h, include/linux/bottom_half.h, arch/x86/include/asm/fpu/api.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c: note: in included file:
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c: note: in included file:
>> arch/x86/kernel/fpu/context.h:28:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/context.h:28:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/context.h:28:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/context.h:28:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/core.c:599:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/core.c:599:39: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/core.c:599:39: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/core.c:603:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/core.c:603:41: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/core.c:603:41: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/context.h:43:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:43:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:43:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:43:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/fpu/regset.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/fpu/signal.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/signal.c: note: in included file:
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/signal.c: note: in included file:
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/signal.c: note: in included file:
>> arch/x86/kernel/fpu/context.h:28:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/context.h:28:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/context.h:28:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/context.h:28:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/fpu/xstate.c:1498:19: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.c:1498:19: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.c:1498:19: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.c:1498:19: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.c:1656:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct lockdep_map const *lock @@     got struct lockdep_map [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1656:9: sparse:     expected struct lockdep_map const *lock
   arch/x86/kernel/fpu/xstate.c:1656:9: sparse:     got struct lockdep_map [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1750:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1750:31: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1750:31: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1758:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1758:33: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1758:33: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1776:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1776:31: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1776:31: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1780:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1780:41: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1780:41: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c:1795:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   arch/x86/kernel/fpu/xstate.c:1795:33: sparse:     expected struct spinlock [usertype] *lock
   arch/x86/kernel/fpu/xstate.c:1795:33: sparse:     got struct spinlock [noderef] __rcu *
   arch/x86/kernel/fpu/xstate.c: note: in included file:
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.h:186:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.c: note: in included file:
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:38:23: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/context.h:49:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/fpu/xstate.c: note: in included file:
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/fpu/xstate.h:194:21: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/time/time.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/time/timer.c:1618:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/timer.c:1618:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/timer.c:1618:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/timer.c:1618:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/timer.c:1618:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/timer.c:1618:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/timer.c:1618:17: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/timer.c:1618:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/timer.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/preempt.h:34:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/timer.c: note: in included file (through include/linux/kernel_stat.h):
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/timer.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/kernel_stat.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/time/sleep_timeout.c: note: in included file (through include/linux/sched.h, include/linux/delay.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/time/hrtimer.c:1001:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/hrtimer.c:1001:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/hrtimer.c:1001:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/hrtimer.c:1001:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/hrtimer.c:1001:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/hrtimer.c:1001:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/hrtimer.c:1001:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/hrtimer.c:1001:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/hrtimer.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/hrtimer.c: note: in included file (through include/linux/trace_recursion.h, include/linux/ftrace.h, include/linux/perf_event.h, ...):
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/interrupt.h:656:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/time/alarmtimer.c:71:19: sparse: sparse: context imbalance in 'alarmtimer_get_rtcdev' - wrong count at exit
   kernel/time/alarmtimer.c:368:6: sparse: sparse: context imbalance in 'alarm_restart' - wrong count at exit
   kernel/time/alarmtimer.c:463:13: sparse: sparse: context imbalance in 'alarmtimer_freezerset' - wrong count at exit
   kernel/time/alarmtimer.c:514:13: sparse: sparse: context imbalance in 'alarm_handle_timer' - wrong count at exit
   kernel/time/alarmtimer.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/time/posix-timers.c:345:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:345:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:345:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:352:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:352:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/posix-timers.c:352:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:554:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:554:41: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:554:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1042:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1042:9: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:1042:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c:1090:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *l @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/posix-timers.c:1090:9: sparse:     expected struct spinlock [usertype] *l
   kernel/time/posix-timers.c:1090:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-timers.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/posix-timers.c:306:13: sparse: sparse: context imbalance in '__posixtimer_deliver_signal' - wrong count at exit
   kernel/time/posix-timers.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/posix-timers.c:336:6: sparse: sparse: context imbalance in 'posixtimer_deliver_signal' - unexpected unlock
   kernel/time/posix-timers.c:374:29: sparse: sparse: context imbalance in 'posix_timer_fn' - wrong count at exit
   kernel/time/posix-timers.c:465:12: sparse: sparse: context imbalance in 'do_timer_create' - different lock contexts for basic block
   kernel/time/posix-timers.c:603:24: sparse: sparse: context imbalance in '__lock_timer' - different lock contexts for basic block
--
>> kernel/time/posix-cpu-timers.c:1406:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/posix-cpu-timers.c:1406:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/posix-cpu-timers.c:1406:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/posix-cpu-timers.c:1406:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/posix-cpu-timers.c:1406:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/posix-cpu-timers.c:1406:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/posix-cpu-timers.c:1406:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/posix-cpu-timers.c:1406:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/posix-cpu-timers.c: note: in included file:
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-cpu-timers.c:42:5: sparse: sparse: context imbalance in 'update_rlimit_cpu' - different lock contexts for basic block
   kernel/time/posix-cpu-timers.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/posix-cpu-timers.c: note: in included file:
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/posix-cpu-timers.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'posix_cpu_timer_wait_running' - unexpected unlock
   kernel/time/posix-cpu-timers.c: note: in included file:
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
--
   kernel/time/itimer.c:53:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:53:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:53:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:70:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:70:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:70:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:82:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:82:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:82:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:86:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:86:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:86:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:197:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:197:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:197:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:211:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:211:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:211:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:235:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:235:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:235:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:244:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:244:45: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:244:45: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c:257:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/time/itimer.c:257:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/time/itimer.c:257:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/time/itimer.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/time/tick-oneshot.c:29:42: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-oneshot.c:29:42: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-oneshot.c:29:42: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-oneshot.c:29:42: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-oneshot.c:56:42: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-oneshot.c:56:42: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-oneshot.c:56:42: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-oneshot.c:56:42: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-oneshot.c:127:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-oneshot.c:127:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-oneshot.c:127:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-oneshot.c:127:15: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/time/tick-common.c:74:42: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-common.c:74:42: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-common.c:74:42: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-common.c:74:42: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-common.c: note: in included file (through arch/x86/include/generated/asm/irq_regs.h):
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/time/tick-sched.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/time/tick-sched.c: note: in included file (through arch/x86/include/generated/asm/irq_regs.h):
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/asm-generic/irq_regs.h:21:16: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-sched.c:193:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-sched.c:193:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-sched.c:193:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-sched.c:193:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-sched.c:193:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-sched.c:193:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-sched.c:193:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/time/tick-sched.c:193:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/cacheinfo.c:188:35: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/cacheinfo.c:188:35: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/cacheinfo.c:188:35: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/cacheinfo.c:188:35: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/aperfmperf.c:47:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/aperfmperf.c:47:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/aperfmperf.c:47:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/aperfmperf.c:47:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/aperfmperf.c:48:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/aperfmperf.c:48:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/aperfmperf.c:48:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/aperfmperf.c:48:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/common.c:480:37: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/common.c:480:37: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/common.c:480:37: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/common.c:480:37: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:482:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:482:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:482:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:482:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:482:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:482:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:482:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:482:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:486:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:486:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:486:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:486:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:495:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:495:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:495:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:495:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:511:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:511:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:511:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:511:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:521:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:521:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:521:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:521:27: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c: note: in included file (through arch/x86/include/asm/tsc.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
   arch/x86/include/asm/msr.h:83:47: sparse: sparse: cast truncates bits from constant value (23001000000000 becomes 0)
   arch/x86/kernel/cpu/common.c:2358:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2358:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2358:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2358:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2359:43: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2359:43: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2359:43: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2359:43: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2360:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2360:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2360:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2360:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2361:43: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2361:43: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2361:43: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2361:43: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2363:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2363:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2363:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c:2363:42: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h, ...):
   arch/x86/include/asm/processor.h:536:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/processor.h:536:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/processor.h:536:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/processor.h:536:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/bugs.c:90:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/bugs.c:90:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/bugs.c:90:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/bugs.c:90:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:100:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:100:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:100:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:100:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:103:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:115:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:115:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:115:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c:115:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/bugs.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/umwait.c:35:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/umwait.c:35:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/umwait.c:35:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/umwait.c:35:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/umwait.c:35:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/umwait.c:35:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/umwait.c:35:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/umwait.c:35:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/intel.c:507:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/intel.c:507:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/intel.c:507:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/intel.c:507:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/intel.c:513:15: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/intel.c:513:15: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/intel.c:513:15: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/intel.c:513:15: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/intel_epb.c:87:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/intel_epb.c:87:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/intel_epb.c:87:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/intel_epb.c:87:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/intel_epb.c:94:19: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/intel_epb.c:94:19: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/intel_epb.c:94:19: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/intel_epb.c:94:19: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/amd.c:563:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/amd.c:563:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/amd.c:563:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/amd.c:563:17: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/acpi/sleep.c:95:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/acpi/sleep.c:95:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/acpi/sleep.c:95:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/acpi/sleep.c:95:13: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/acpi/cstate.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/futex/core.c:582:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:582:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:582:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:582:51: sparse:     got void *
   kernel/futex/core.c:598:38: sparse: sparse: cast removes address space '__user' of expression
   kernel/futex/core.c:598:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] [usertype] __user *naddr @@     got void * @@
   kernel/futex/core.c:598:51: sparse:     expected unsigned int [noderef] [usertype] __user *naddr
   kernel/futex/core.c:598:51: sparse:     got void *
   kernel/futex/core.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/futex/core.c:979:9: sparse: sparse: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit
--
   kernel/futex/pi.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/futex/pi.c:663:9: sparse: sparse: context imbalance in 'wake_futex_pi' - unexpected unlock
   kernel/futex/pi.c:791:9: sparse: sparse: context imbalance in '__fixup_pi_state_owner' - unexpected unlock
   kernel/futex/pi.c:1093:17: sparse: sparse: context imbalance in 'futex_lock_pi' - unexpected unlock
   kernel/futex/pi.c:1132:5: sparse: sparse: context imbalance in 'futex_unlock_pi' - different lock contexts for basic block
--
   kernel/futex/requeue.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/futex/requeue.c:692:9: sparse: sparse: context imbalance in 'futex_requeue' - different lock contexts for basic block
   kernel/futex/requeue.c:841:25: sparse: sparse: context imbalance in 'futex_wait_requeue_pi' - unexpected unlock
--
   kernel/futex/waitwake.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/sched/task.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/futex/waitwake.c:275:41: sparse: sparse: context imbalance in 'futex_wake_op' - different lock contexts for basic block
   kernel/futex/waitwake.c:460:44: sparse: sparse: context imbalance in 'futex_wait_multiple_setup' - unexpected unlock
   kernel/futex/waitwake.c:660:28: sparse: sparse: context imbalance in 'futex_wait_setup' - unexpected unlock
--
   kernel/futex/syscalls.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/notify/mark.c:677:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsnotify_mark_connector [noderef] __rcu *__new @@     got struct fsnotify_mark_connector *[assigned] conn @@
   fs/notify/mark.c:677:13: sparse:     expected struct fsnotify_mark_connector [noderef] __rcu *__new
   fs/notify/mark.c:677:13: sparse:     got struct fsnotify_mark_connector *[assigned] conn
   fs/notify/mark.c:421:9: sparse: sparse: context imbalance in 'fsnotify_put_mark' - unexpected unlock
   fs/notify/mark.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/notify/mark.c:690:39: sparse: sparse: context imbalance in 'fsnotify_grab_connector' - different lock contexts for basic block
   fs/notify/mark.c:789:20: sparse: sparse: context imbalance in 'fsnotify_add_mark_list' - unexpected unlock
   fs/notify/mark.c:873:25: sparse: sparse: context imbalance in 'fsnotify_find_mark' - unexpected unlock
   fs/notify/mark.c:947:17: sparse: sparse: context imbalance in 'fsnotify_destroy_marks' - unexpected unlock
--
   fs/notify/fdinfo.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/crypto/keyring.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/swait.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/crypto/policy.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rbtree.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/apic/apic.c:578:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/apic/apic.c:578:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/apic/apic.c:578:13: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/apic/apic.c:578:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:587:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:587:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:587:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:587:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:609:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:609:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:609:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:609:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2149:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:1056:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c: note: in included file (through arch/x86/include/generated/asm/irq_regs.h, include/linux/irq.h, include/linux/msi.h, include/linux/dmar.h):
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:28:20: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/asm-generic/irq_regs.h:29:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2154:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/apic/apic.c:2162:1: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/apic/x2apic_cluster.c:93:32: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/apic/x2apic_cluster.c:93:32: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/apic/x2apic_cluster.c:93:32: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/apic/x2apic_cluster.c:93:32: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/verity/enable.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/verity/read_metadata.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/notify/inotify/inotify_user.c:576:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *conn @@     got struct fsnotify_mark_connector [noderef] __rcu *i_fsnotify_marks @@
   fs/notify/inotify/inotify_user.c:576:51: sparse:     expected struct fsnotify_mark_connector *conn
   fs/notify/inotify/inotify_user.c:576:51: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *i_fsnotify_marks
   fs/notify/inotify/inotify_user.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/notify/fanotify/fanotify.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/sysctl.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/notify/fanotify/fanotify_user.c:117:13: sparse: sparse: context imbalance in 'perm_group_watchdog' - wrong count at exit
   fs/notify/fanotify/fanotify_user.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/sysctl.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/kprobes/opt.c:525:13: sparse: sparse: function 'arch_unoptimize_kprobes' with external linkage has definition
>> arch/x86/kernel/kprobes/opt.c:194:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/opt.c:194:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/opt.c:194:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/opt.c:194:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/opt.c:197:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/opt.c:197:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/opt.c:197:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/opt.c:197:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/opt.c: note: in included file:
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/kprobes.h:394:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/kprobes.h:394:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/kprobes.h:394:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/kprobes.h:394:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/kprobes/core.c:828:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/core.c:828:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/core.c:828:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/core.c:828:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/core.c: note: in included file:
   include/linux/kprobes.h:394:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/kprobes.h:394:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/kprobes.h:394:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/kprobes.h:394:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/core.c:838:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/core.c:838:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/core.c:838:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/core.c:838:9: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/kprobes/ftrace.c:45:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/ftrace.c:45:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/ftrace.c:45:17: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/kprobes/ftrace.c:45:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/ftrace.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/ftrace.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/ftrace.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/ftrace.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/ftrace.c: note: in included file (through include/linux/mutex.h, include/linux/notifier.h, include/linux/kprobes.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/ftrace.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/rwsem.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/kprobes/ftrace.c: note: in included file:
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/kprobes.h:389:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/cgroup/cgroup.c:6926:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/cgroup.c:6926:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/cgroup.c:6926:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/cgroup.c:6929:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/cgroup.c:6929:43: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/cgroup.c:6929:43: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/cgroup.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, kernel/cgroup/cgroup-internal.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cgroup/cgroup.c:3268:9: sparse: sparse: context imbalance in 'cgroup_lock_and_drain_offline' - wrong count at exit
   kernel/cgroup/cgroup.c:6689:12: sparse: sparse: context imbalance in 'cgroup_css_set_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6805:9: sparse: sparse: context imbalance in 'cgroup_css_set_put_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6825:5: sparse: sparse: context imbalance in 'cgroup_can_fork' - wrong count at exit
   kernel/cgroup/cgroup.c:6874:9: sparse: sparse: context imbalance in 'cgroup_cancel_fork' - unexpected unlock
--
>> kernel/cgroup/rstat.c:83:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cgroup/rstat.c:83:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cgroup/rstat.c:83:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cgroup/rstat.c:83:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cgroup/rstat.c:83:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cgroup/rstat.c:83:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cgroup/rstat.c:83:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/cgroup/rstat.c:83:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cgroup/rstat.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/cgroup.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/cgroup/namespace.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, kernel/cgroup/cgroup-internal.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/cgroup/cgroup-v1.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h, kernel/cgroup/cgroup-internal.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cgroup/cgroup-v1.c:498:16: sparse: sparse: context imbalance in '__cgroup1_procs_write' - wrong count at exit
--
   kernel/cgroup/freezer.c:140:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/freezer.c:140:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/freezer.c:140:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/freezer.c:143:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/cgroup/freezer.c:143:37: sparse:     expected struct spinlock [usertype] *lock
   kernel/cgroup/freezer.c:143:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/cgroup/freezer.c: note: in included file (through include/linux/sched.h, include/linux/cgroup.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/cgroup/freezer.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
--
   fs/iomap/buffered-io.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/iomap/direct-io.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/quota/quota.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/quota/dquot.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/task_mmu.c:1104:17: sparse: sparse: context imbalance in 'smaps_pte_range' - unexpected unlock
   fs/proc/task_mmu.c:1693:28: sparse: sparse: context imbalance in 'clear_refs_pte_range' - unexpected unlock
   fs/proc/task_mmu.c:2078:17: sparse: sparse: context imbalance in 'pagemap_pmd_range' - unexpected unlock
   fs/proc/task_mmu.c:2714:20: sparse: sparse: context imbalance in 'pagemap_scan_thp_entry' - unexpected unlock
   fs/proc/task_mmu.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/root.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/base.c:890:65: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/proc/base.c:890:65: sparse:    struct task_struct [noderef] __rcu *
   fs/proc/base.c:890:65: sparse:    struct task_struct *
   fs/proc/base.c:2326:25: sparse: sparse: cast to restricted fmode_t
   fs/proc/base.c:2383:42: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c:2483:48: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs/super_types.h, ...):
   include/linux/sched/signal.h:756:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:756:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:756:37: sparse:     got struct spinlock [noderef] __rcu *
   fs/proc/base.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/proc/base.c:1170:36: sparse: sparse: context imbalance in '__set_oom_adj' - unexpected unlock
   fs/proc/base.c:2508:13: sparse: sparse: context imbalance in 'timers_start' - wrong count at exit
   fs/proc/base.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, arch/x86/include/asm/uaccess.h, ...):
   include/linux/rcupdate.h:897:25: sparse: sparse: context imbalance in 'timers_stop' - unexpected unlock
   fs/proc/base.c:2538:12: sparse: sparse: context imbalance in 'show_timer' - wrong count at exit
--
   fs/proc/fd.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/loadavg.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/version.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/self.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/thread_self.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/proc_net.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/proc_sysctl.c:303:32: sparse: sparse: context imbalance in 'start_unregistering' - unexpected unlock
   fs/proc/proc_sysctl.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/sysctl.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/proc/kcore.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h, include/linux/elfcore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/kernfs/dir.c:221:5: sparse: sparse: context imbalance in 'kernfs_path_from_node' - different lock contexts for basic block
   fs/kernfs/dir.c: note: in included file (through include/linux/sched.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/mce/core.c:357:25: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/core.c:357:25: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/core.c:357:25: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/core.c:357:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:396:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:396:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:396:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:396:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:431:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:431:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:431:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:431:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:831:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:831:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:831:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:831:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1798:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1798:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1798:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1798:14: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1815:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1815:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1815:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1815:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1834:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1834:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1834:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1834:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1849:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1849:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1849:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1849:22: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1884:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1884:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1884:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1884:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1916:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1916:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1916:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1916:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2045:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2045:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2045:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2045:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2104:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2104:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2104:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2104:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2330:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2330:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2330:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2330:21: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2419:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2419:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2419:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2419:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2775:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2775:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2775:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:2775:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c: note: in included file (through include/linux/thread_info.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:997:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:997:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:997:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:997:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1366:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1366:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1366:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1366:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1315:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1315:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1315:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c:1315:25: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_info.h):
>> arch/x86/include/asm/processor.h:554:24: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c: note: in included file (through arch/x86/include/asm/traps.h):
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/debugreg.h:123:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c: note: in included file (through include/linux/entry-common.h, arch/x86/include/asm/idtentry.h, arch/x86/include/asm/traps.h):
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
>> include/linux/irq-entry-common.h:219:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c: note: in included file (through include/linux/irq-entry-common.h, include/linux/entry-common.h, arch/x86/include/asm/idtentry.h, ...):
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/include/asm/entry-common.h:95:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:99:13: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/include/asm/entry-common.h:101:17: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/core.c: note: in included file (through include/linux/entry-common.h, arch/x86/include/asm/idtentry.h, arch/x86/include/asm/traps.h):
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   include/linux/irq-entry-common.h:235:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   arch/x86/kernel/cpu/mce/severity.c: note: in included file (through include/linux/mutex.h, include/linux/seq_file.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/mce/intel.c:484:46: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/intel.c:484:46: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/intel.c:484:46: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/intel.c:484:46: sparse: sparse: cast removes address space '__percpu' of expression
--
>> arch/x86/kernel/cpu/mce/threshold.c:65:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/threshold.c:65:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/threshold.c:65:16: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/x86/kernel/cpu/mce/threshold.c:65:16: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:70:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:70:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:70:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:70:9: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/kernel/cpu/mce/threshold.c:37:1: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/devpts/inode.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_clock.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/ring_buffer.c:2116:38: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/trace/ring_buffer.c:2144:21: sparse: signed value source
   kernel/trace/ring_buffer.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ring_buffer.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ring_buffer.c:5861:9: sparse: sparse: context imbalance in 'ring_buffer_peek' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5947:9: sparse: sparse: context imbalance in 'ring_buffer_consume' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:5972:25: sparse: sparse: context imbalance in 'ring_buffer_read_start' - wrong count at exit
   kernel/trace/ring_buffer.c:6196:13: sparse: sparse: context imbalance in 'reset_disabled_cpu_buffer' - wrong count at exit
   kernel/trace/ring_buffer.c:6338:17: sparse: sparse: context imbalance in 'ring_buffer_empty' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:6368:9: sparse: sparse: context imbalance in 'ring_buffer_empty_cpu' - different lock contexts for basic block
   kernel/trace/ring_buffer.c:6600:5: sparse: sparse: context imbalance in 'ring_buffer_read_page' - different lock contexts for basic block
--
>> kernel/trace/ftrace.c:180:23: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/ftrace.c:180:23: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/ftrace.c:180:23: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/ftrace.c:180:23: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:233:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:233:49: sparse:     expected struct ftrace_ops *ops
   kernel/trace/ftrace.c:233:49: sparse:     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list
   kernel/trace/ftrace.c:318:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] __rcu **list @@
   kernel/trace/ftrace.c:318:16: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:318:16: sparse:     got struct ftrace_ops [noderef] __rcu **list
   kernel/trace/ftrace.c:318:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops **p @@     got struct ftrace_ops [noderef] __rcu ** @@
   kernel/trace/ftrace.c:318:50: sparse:     expected struct ftrace_ops **p
   kernel/trace/ftrace.c:318:50: sparse:     got struct ftrace_ops [noderef] __rcu **
   kernel/trace/ftrace.c:325:12: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops * @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:325:12: sparse:     expected struct ftrace_ops *
   kernel/trace/ftrace.c:325:12: sparse:     got struct ftrace_ops [noderef] __rcu *next
   kernel/trace/ftrace.c:1094:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1094:43: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1094:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1095:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1095:43: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1095:43: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1320:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1320:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1320:40: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1321:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1321:40: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:1321:40: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1322:37: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1322:37: sparse:     expected struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1322:37: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:1323:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:1323:38: sparse:     expected struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c:1323:38: sparse:     got struct ftrace_hash *
   kernel/trace/ftrace.c:2135:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *old_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2135:54: sparse:     expected struct ftrace_hash *old_hash
   kernel/trace/ftrace.c:2135:54: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:1527:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:1527:9: sparse:    struct ftrace_hash [noderef] __rcu *
   kernel/trace/ftrace.c:1527:9: sparse:    struct ftrace_hash *
   kernel/trace/ftrace.c:1543:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1544:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1545:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1546:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:1717:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:1718:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:1779:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:1780:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:2113:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2124:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:2607:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:2618:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:3414:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3415:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3421:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *B @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3422:66: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:3435:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3436:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3439:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3443:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *src @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3458:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3459:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3467:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3473:81: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3477:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3479:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3509:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *new_hash1 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3510:49: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct ftrace_hash *new_hash2 @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3549:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3551:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3553:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3555:49: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3561:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3562:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3568:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_filter_hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3569:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *save_notrace_hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3571:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3572:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3577:53: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *save_filter_hash @@
   kernel/trace/ftrace.c:3578:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash *save_notrace_hash @@
   kernel/trace/ftrace.c:3625:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3626:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3641:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3642:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3647:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@
   kernel/trace/ftrace.c:3648:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@
   kernel/trace/ftrace.c:3650:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3651:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *[addressable] notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3693:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3694:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3695:45: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3696:46: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *notrace_hash @@     got struct ftrace_hash * @@
   kernel/trace/ftrace.c:3982:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3999:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:4688:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:4691:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:5102:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5104:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5484:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5628:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5634:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash [noderef] __rcu *filter_hash @@     got struct ftrace_hash *[assigned] old_hash @@
   kernel/trace/ftrace.c:5899:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5901:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:5982:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:5985:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6001:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6045:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6102:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *free_hash @@     got struct ftrace_hash [noderef] __rcu *static [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6167:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:6212:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *static [addressable] [assigned] [toplevel] direct_functions @@
   kernel/trace/ftrace.c:6610:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:6618:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash **orig_hash @@     got struct ftrace_hash [noderef] __rcu ** @@
   kernel/trace/ftrace.c:7403:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7404:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7408:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7426:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *[addressable] [toplevel] ftrace_ops_list @@
   kernel/trace/ftrace.c:7426:66: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_ops *ops @@     got struct ftrace_ops [noderef] __rcu *next @@
   kernel/trace/ftrace.c:7478:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7479:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7868:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:7869:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:7913:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/ftrace.c:7913:36: sparse:    struct ftrace_ops [noderef] __rcu *
   kernel/trace/ftrace.c:7913:36: sparse:    struct ftrace_ops *
   kernel/trace/ftrace.c:8235:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8235:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8235:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8235:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8238:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8238:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8238:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8238:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8503:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8503:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8503:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8503:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8506:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8506:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8506:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8506:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:8689:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8689:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8689:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:8738:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:8738:14: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:8738:14: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c: note: in included file (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/ftrace.c:231:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:231:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:231:20: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3469:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3469:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3469:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3469:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3469:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3469:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3503:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3503:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3503:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3503:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3503:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3503:29: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6070:30: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6079:21: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:6081:17: sparse: sparse: dereference of noderef expression
   kernel/trace/ftrace.c:3774:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *filter_hash @@
   kernel/trace/ftrace.c:3774:48: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3774:48: sparse:     got struct ftrace_hash [noderef] __rcu *filter_hash
   kernel/trace/ftrace.c:3775:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct ftrace_hash *hash @@     got struct ftrace_hash [noderef] __rcu *notrace_hash @@
   kernel/trace/ftrace.c:3775:49: sparse:     expected struct ftrace_hash *hash
   kernel/trace/ftrace.c:3775:49: sparse:     got struct ftrace_hash [noderef] __rcu *notrace_hash
   kernel/trace/ftrace.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/trace/trace.c:3172:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace.c:3172:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace.c:3172:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace.c:3172:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:497:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:497:28: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:497:28: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:506:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:506:34: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:506:34: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:2677:29: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:2677:29: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:2677:29: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:2677:29: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:2774:30: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:2774:30: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:2774:30: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:2774:30: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:2848:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace.c:2848:38: sparse:     expected struct event_filter *filter
   kernel/trace/trace.c:2848:38: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace.c:7523:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7523:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7523:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7523:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7523:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7523:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7523:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7523:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7571:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7571:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7571:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7571:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7571:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7571:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7571:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7571:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7878:20: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7878:20: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7878:20: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:7878:20: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace.c:451:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:451:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:451:9: sparse:    struct trace_export *
   kernel/trace/trace.c:466:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:466:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:466:9: sparse:    struct trace_export *
--
>> kernel/trace/trace_sched_switch.c:263:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_sched_switch.c:263:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_sched_switch.c:263:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_sched_switch.c:263:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_sched_switch.c:263:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_sched_switch.c:263:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_sched_switch.c:263:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_sched_switch.c:263:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:363:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:363:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:363:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:363:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:393:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:393:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:393:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:393:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c:425:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_sched_switch.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_functions.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_functions.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/trace/trace_preemptirq.c:61:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_preemptirq.c:61:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_preemptirq.c:61:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_preemptirq.c:61:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:64:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:72:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:72:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:72:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:72:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:75:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:75:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:75:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:75:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:92:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:92:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:92:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:92:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:93:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:93:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:93:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:93:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:106:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:106:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:106:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:106:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:107:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:107:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:107:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_preemptirq.c:107:17: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_irqsoff.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_irqsoff.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_hwlat.c: note: in included file (through include/linux/sched.h, include/linux/kthread.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/trace/trace_stack.c:301:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_stack.c:301:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_stack.c:301:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_stack.c:301:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_stack.c: note: in included file (through include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_stack.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/sched/task_stack.h):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_osnoise.c: note: in included file (through include/linux/sched.h, include/linux/kthread.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_event_perf.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_event_perf.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_syscalls.c: note: in included file (through include/linux/mutex.h, include/linux/srcu.h, include/linux/tracepoint.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_events_inject.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/trace/trace_events.c:648:16: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_events.c:648:16: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_events.c:648:16: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace_events.c:648:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1084:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1084:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1084:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1084:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1102:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1102:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1102:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1102:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1114:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1114:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1114:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1114:14: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1120:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1120:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1120:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1120:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1132:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1132:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1132:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1132:13: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1139:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1139:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1139:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1139:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:1295:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace_events.c:1295:31: sparse:     expected struct event_filter *filter
   kernel/trace/trace_events.c:1295:31: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace_events.c:2378:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:2378:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:2378:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c:2378:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_events_trigger.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rbtree.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_eprobe.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_events_filter.c: note: in included file (through include/linux/sched.h, include/linux/uaccess.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_events_user.c:2249:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:2249:16: sparse:    struct user_event_refs [noderef] __rcu *
   kernel/trace/trace_events_user.c:2249:16: sparse:    struct user_event_refs *
   kernel/trace/trace_events_user.c:2356:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:2356:16: sparse:    struct user_event_refs [noderef] __rcu *
   kernel/trace/trace_events_user.c:2356:16: sparse:    struct user_event_refs *
   kernel/trace/trace_events_user.c:2381:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:2381:9: sparse:    struct user_event_refs [noderef] __rcu *
   kernel/trace/trace_events_user.c:2381:9: sparse:    struct user_event_refs *
   kernel/trace/trace_events_user.c: note: in included file (through include/linux/mutex.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/trace/trace_events_user.c: note: in included file (through kernel/trace/trace_dynevent.h):
>> kernel/trace/trace.h:1571:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace.h:1571:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace.h:1571:13: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/trace/trace.h:1571:13: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/trace_kprobe.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/trace/rethook.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/netfs/buffered_write.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/netfs/misc.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/swap.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/netfs/write_issue.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/bpf/core.c:250:49: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2037:43: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c:2042:48: sparse: sparse: arithmetics on pointers to functions
   kernel/bpf/core.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/xdp.h, ...):
   include/trace/events/xdp.h:304:1: sparse: sparse: Using plain integer as NULL pointer
   include/trace/events/xdp.h:331:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/bpf/core.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/hugetlbfs/inode.c: note: in included file (through include/linux/thread_info.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/exfat/file.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/exfat/balloc.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/file.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/pagelist.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/unlink.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/write.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/mount_clnt.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/nfs3proc.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/nfs4state.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:237:25: sparse: sparse: context imbalance in 'nfs4_put_open_state' - unexpected unlock
   fs/nfs/nfs4state.c:937:20: sparse: sparse: context imbalance in 'nfs4_put_lock_state' - unexpected unlock
   fs/nfs/nfs4state.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/nfs4proc.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/callback.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/swait.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nfs/nfs4client.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/events/callchain.c:68:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:68:9: sparse:    struct callchain_cpus_entries [noderef] __rcu *
   kernel/events/callchain.c:68:9: sparse:    struct callchain_cpus_entries *
   kernel/events/callchain.c:98:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:98:9: sparse:    struct callchain_cpus_entries [noderef] __rcu *
   kernel/events/callchain.c:98:9: sparse:    struct callchain_cpus_entries *
   kernel/events/callchain.c:163:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/callchain.c:163:19: sparse:    struct callchain_cpus_entries [noderef] __rcu *
   kernel/events/callchain.c:163:19: sparse:    struct callchain_cpus_entries *
   kernel/events/callchain.c: note: in included file (through include/linux/preempt.h, include/linux/sched.h, include/linux/ptrace.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/callchain.c: note: in included file (through include/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_perf_event.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/events/hw_breakpoint.c: note: in included file (through include/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_perf_event.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
>> kernel/events/core.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/events/core.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/events/core.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/events/core.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/events/core.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/events/core.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/events/core.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
>> kernel/events/core.c:235:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:276:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:276:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:276:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:276:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:276:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:276:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:276:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:276:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:377:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:377:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:377:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:377:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:377:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:377:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:377:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:377:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:625:23: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:625:23: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:625:23: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:625:23: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:628:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:628:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:628:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:628:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:744:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:744:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:744:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:744:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:744:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:744:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:744:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:744:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1183:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1183:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1183:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1183:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1183:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1183:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1183:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1183:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:1486:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1486:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1486:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1499:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1499:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1499:28: sparse:    struct perf_event_context *
   kernel/events/core.c:2070:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2070:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2070:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2070:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2070:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2070:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2070:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2070:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2107:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2107:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2107:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2107:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2107:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2107:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2107:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2107:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2182:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2182:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2182:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2182:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2182:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2182:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2182:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2182:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2314:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2314:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2314:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2314:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2314:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2314:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2314:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2314:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2420:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2420:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2420:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2420:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2420:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2420:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2420:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2420:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2692:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2692:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2692:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2692:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2692:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2692:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2692:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2692:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2701:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2701:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2701:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2701:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2701:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:2701:9: sparse: sparse: cast removes address space '__percpu' of expression
--
   kernel/events/core.c:6659:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6675:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6675:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6675:14: sparse:    struct perf_buffer *
   kernel/events/core.c:7824:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:7824:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:7824:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:7824:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:7824:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:7824:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:7824:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:7824:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:8654:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8654:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8654:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8742:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8742:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8742:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8846:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8846:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8846:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8848:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8848:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8848:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9584:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9584:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9584:15: sparse:    struct perf_event_context *
   kernel/events/core.c:10238:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:10238:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:10238:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:10238:15: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:10779:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10779:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10779:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:10818:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10818:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10818:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11042:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11042:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11042:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11042:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11042:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11042:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11042:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11042:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11048:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11048:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11048:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11048:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11048:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11048:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11048:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11048:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:11093:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:11093:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:11093:23: sparse:    struct perf_event_context *
   kernel/events/core.c:12127:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12127:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12127:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12127:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12137:30: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12137:30: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12137:30: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12137:30: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12139:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12139:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12139:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12139:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12150:31: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12150:31: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12150:31: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12150:31: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12152:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12152:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12152:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:12152:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:13985:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:13985:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:13985:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:13985:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:13985:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:13985:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:13985:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:13985:17: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14206:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14206:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:14206:9: sparse:    struct perf_event_context *
   kernel/events/core.c:14495:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14495:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14495:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14495:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14495:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14495:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14495:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14495:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:14723:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14723:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:14723:17: sparse:    struct swevent_hlist *
   kernel/events/core.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:184:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:200:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:895:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1533:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:3009:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:3991:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:3991:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:3991:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:3991:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:3991:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:3991:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:3991:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:3991:9: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:4982:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:211:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/core.c: note: in included file (through include/linux/preempt.h, include/linux/alloc_tag.h, include/linux/percpu.h, ...):
>> arch/x86/include/asm/preempt.h:27:16: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/events/core.c:10632:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10632:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10632:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10652:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10652:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10652:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10768:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10768:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10768:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10768:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10768:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10768:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10768:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10768:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10768:16: sparse:    struct swevent_hlist *
--
   fs/lockd/clntlock.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/lockd/clntproc.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:237:25: sparse: sparse: context imbalance in 'nlmclnt_put_lockowner' - unexpected unlock
   fs/lockd/clntproc.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/lockd/host.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/lockd/svclock.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:237:25: sparse: sparse: context imbalance in 'nlmsvc_put_lockowner' - unexpected unlock
   fs/lockd/svclock.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/lockd/svcproc.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/lockd/mon.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
   fs/lockd/mon.c: note: in included file (through include/linux/random.h, include/linux/nodemask.h, include/linux/numa.h, ...):
   include/linux/list.h:237:25: sparse: sparse: context imbalance in 'nsm_release' - unexpected unlock
--
   fs/lockd/svc4proc.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/lockd/procfs.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/autofs/inode.c: note: in included file (through include/linux/mutex.h, include/linux/seq_file.h):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/autofs/root.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/autofs/symlink.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/autofs/waitq.c:69:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/autofs/waitq.c:69:17: sparse:     expected struct spinlock [usertype] *lock
   fs/autofs/waitq.c:69:17: sparse:     got struct spinlock [noderef] __rcu *
   fs/autofs/waitq.c:72:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/autofs/waitq.c:72:48: sparse:     expected struct spinlock [usertype] *lock
   fs/autofs/waitq.c:72:48: sparse:     got struct spinlock [noderef] __rcu *
   fs/autofs/waitq.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/autofs/expire.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/overlayfs/file.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rbtree.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/overlayfs/util.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/overlayfs/inode.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/libxfs/xfs_group.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/libxfs/xfs_btree.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/libxfs/xfs_inode_util.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_aops.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_extent_busy.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_discard.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_file.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_buf.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_fsmap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_handle.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_mru_cache.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_ioctl.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_iops.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_pwork.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_iomap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_icache.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_inode.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_reflink.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_trans.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_log_cil.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_log.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_trans_ail.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_dquot.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_zone_space_resv.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/attr.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_log_recover.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_zone_gc.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/dir.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_ioctl32.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/fscounters.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/metapath.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/dirtree.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/xfs_zone_alloc.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/btree.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/parent.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/ialloc.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/dabtree.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/common.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/bmap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/refcount.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/nlinks.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/readdir.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/xfile.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/rtbitmap.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/scrub.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/quota.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/rtsummary.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/rtrefcount.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/xfarray.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/xfs/scrub/quotacheck.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/semaphore.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/9p/vfs_inode_dotl.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/9p/fid.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/9p/acl.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nilfs2/inode.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nilfs2/dir.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nilfs2/dat.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nilfs2/segment.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/nilfs2/ioctl.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/fat/fatent.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/fat/file.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/trace.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/kref.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/dir.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/link.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/swait.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/connect.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/misc.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/inode.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/file.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/ioctl.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/transport.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/cifsencrypt.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/readdir.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/sess.c: note: in included file (through include/linux/sched.h, include/linux/percpu.h, include/linux/context_tracking_state.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/smb2transport.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/smb2file.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/dns_resolve.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/namespace.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/cifsacl.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/smb2inode.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/cifstransport.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/smb1ops.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/fs_context.c: note: in included file (through include/linux/sched.h, include/linux/rcupdate.h, include/linux/rbtree.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/smb2ops.c: note: in included file (through include/linux/thread_info.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/smb2pdu.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/smb/client/cifssmb.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/ntfs3/fsntfs.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression
--
   fs/ntfs3/inode.c: note: in included file (through arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, include/linux/timex.h, ...):
>> arch/x86/include/asm/current.h:23:24: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +209 arch/x86/lib/delay.c

^1da177e4c3f415 arch/i386/lib/delay.c Linus Torvalds 2005-04-16  206  
81423c37415fe45 arch/x86/lib/delay.c  Andi Kleen     2019-03-29  207  noinline void __const_udelay(unsigned long xloops)
^1da177e4c3f415 arch/i386/lib/delay.c Linus Torvalds 2005-04-16  208  {
4c45c5167c9563b arch/x86/lib/delay.c  Jiri Slaby     2017-01-19 @209  	unsigned long lpj = this_cpu_read(cpu_info.loops_per_jiffy) ? : loops_per_jiffy;
^1da177e4c3f415 arch/i386/lib/delay.c Linus Torvalds 2005-04-16  210  	int d0;
6f84fa2f3edc890 arch/i386/lib/delay.c John Stultz    2006-06-26  211  
^1da177e4c3f415 arch/i386/lib/delay.c Linus Torvalds 2005-04-16  212  	xloops *= 4;
f0fbf0abc093ec8 arch/x86/lib/delay.c  Glauber Costa  2008-07-03  213  	asm("mull %%edx"
^1da177e4c3f415 arch/i386/lib/delay.c Linus Torvalds 2005-04-16  214  		:"=d" (xloops), "=&a" (d0)
4c45c5167c9563b arch/x86/lib/delay.c  Jiri Slaby     2017-01-19  215  		:"1" (xloops), "0" (lpj * (HZ / 4)));
6f84fa2f3edc890 arch/i386/lib/delay.c John Stultz    2006-06-26  216  
^1da177e4c3f415 arch/i386/lib/delay.c Linus Torvalds 2005-04-16  217  	__delay(++xloops);
^1da177e4c3f415 arch/i386/lib/delay.c Linus Torvalds 2005-04-16  218  }
f0fbf0abc093ec8 arch/x86/lib/delay.c  Glauber Costa  2008-07-03  219  EXPORT_SYMBOL(__const_udelay);
^1da177e4c3f415 arch/i386/lib/delay.c Linus Torvalds 2005-04-16  220  

:::::: The code at line 209 was first introduced by commit
:::::: 4c45c5167c9563b1a2eee3e2fe954621355e4ca8 x86/timer: Make delay() work during early bootup

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
