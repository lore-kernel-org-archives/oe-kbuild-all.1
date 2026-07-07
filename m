Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B5535898
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450185; cv=none; b=m6VbPJUL4KuLeE+7/VezAVAMCCrHvplPmsvrNQY7dlRUwqqLPnJJHVuZHbmt+ZYc9fQsoHt55YiIg6Gue6x/lCjInSUpwJ+LITHpoebTOliDzkKBV0haURNmsuvM70BvH/2kHdTIME/u5PsLtK5W2r8sSoxYs8Glwj0RIz9ONuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450185; c=relaxed/simple;
	bh=oinqraJQYcV8zRs1ZaMbDIRCMLtDhRnZMUeGosn2rbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KGWtsQViAROyTj8VI022AdhmC0W7mMGZ4FOZ0EXTPlW2eNdGoYzRlvvOYbUfN0U46q8wxiAriyxv5zGEF/4CjK+uEmMUHlmvHhCNX1Zv+AHnj3nv+yp6QW1sO+sbpQ8htBhwAzP/vbzXSSoALek1ynfiVknVLjI/n2JYwsrBRBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nA4dwM8o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nA4dwM8o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783450184; x=1814986184;
  h=date:from:to:cc:subject:message-id;
  bh=oinqraJQYcV8zRs1ZaMbDIRCMLtDhRnZMUeGosn2rbQ=;
  b=nA4dwM8o9wjNbXqXNcAxbFUGGCnYySkXOc1ZP4j7NzexSpifXzd1oMEt
   /xL2lDT2Sh7aaOJrCHlDfWr2VrsOdTb4gbKB1sjsw0h9/OaxaAV22RZ93
   V4NpS78ea8WHZSmonBL6iYo3ipGFh1lvZKfDYnWhRUWTx37qHzUdj20Mf
   DBdsDdeDnE2R3CJzeMRA+qqqLfRYewDB8ce0eomvCT3YGPUnGQ6BRZo7l
   ocbKKQ+Xc/b4EoYWeRdWikFxLfKmZ8hXdaFn1UKnVs68meVunbpxM2TDP
   AIdhNhvEZaL/omVt3lDY6Ecrt8PPJV3oOtthjbdkT0xAqC8bhnj1dG/LK
   w==;
X-CSE-ConnectionGUID: 1ZMVpe5eRSmt08WUPnv4/A==
X-CSE-MsgGUID: ziZrJZ3fQ5CfJ0f//hp/TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83085241"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83085241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 11:49:43 -0700
X-CSE-ConnectionGUID: K7W5G9clSkCNqLlW3AP7JA==
X-CSE-MsgGUID: KTovbdegQ+aqDLHi7EHB6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="255992784"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jul 2026 11:49:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whAqf-00000000FaE-2hxa;
	Tue, 07 Jul 2026 18:49:01 +0000
Date: Wed, 08 Jul 2026 02:47:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sanghyun Park <sanghyun.park.cnu@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Daniel Borkmann <daniel@iogearbox.net>,
 Puranjay Mohan <puranjay@kernel.org>
Subject: [linux-next:master 4051/4300] kernel/bpf/task_iter.c:759:14:
 warning: variable 'mmput_needed' set but not used
Message-ID: <202607080254.6qrH5NrH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5c73cd9f0819c1c44e373e3dabb68318b1de1a12
commit: 311e11cfbfbf3bf8030de95b831d5c45766b847a [4051/4300] bpf: Fix use-after-free on mm_struct in bpf_find_vma()
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260708/202607080254.6qrH5NrH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080254.6qrH5NrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080254.6qrH5NrH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/task_iter.c: In function '____bpf_find_vma':
>> kernel/bpf/task_iter.c:759:14: warning: variable 'mmput_needed' set but not used [-Wunused-but-set-variable=]
     759 |         bool mmput_needed = false;
         |              ^~~~~~~~~~~~


vim +/mmput_needed +759 kernel/bpf/task_iter.c

   752	
   753	BPF_CALL_5(bpf_find_vma, struct task_struct *, task, u64, start,
   754		   bpf_callback_t, callback_fn, void *, callback_ctx, u64, flags)
   755	{
   756		struct mmap_unlock_irq_work *work = NULL;
   757		struct vm_area_struct *vma;
   758		bool irq_work_busy = false;
 > 759		bool mmput_needed = false;
   760		struct mm_struct *mm;
   761		int ret = -ENOENT;
   762	
   763		if (flags)
   764			return -EINVAL;
   765	
   766		if (!task)
   767			return -ENOENT;
   768	
   769		if (task == current) {
   770			mm = task->mm;
   771		} else {
   772			/*
   773			 * Foreign task: pin task->mm against a concurrent exit_mm().
   774			 * Use trylock on alloc_lock instead of get_task_mm()'s
   775			 * blocking task_lock() to avoid deadlocking the target task.
   776			 */
   777			if (!IS_ENABLED(CONFIG_MMU))
   778				return -EOPNOTSUPP;
   779			if (irqs_disabled())
   780				return -EBUSY;
   781			if (!spin_trylock(&task->alloc_lock))
   782				return -EBUSY;
   783			mm = task->mm;
   784			if (mm && !(task->flags & PF_KTHREAD)) {
   785				mmget(mm);
   786				mmput_needed = true;
   787			} else {
   788				mm = NULL;
   789			}
   790			spin_unlock(&task->alloc_lock);
   791		}
   792		if (!mm)
   793			return -ENOENT;
   794	
   795		irq_work_busy = bpf_mmap_unlock_get_irq_work(&work);
   796	
   797		if (irq_work_busy || !mmap_read_trylock(mm)) {
   798			ret = -EBUSY;
   799			goto out;
   800		}
   801	
   802		vma = find_vma(mm, start);
   803	
   804		if (vma && vma->vm_start <= start && vma->vm_end > start) {
   805			callback_fn((u64)(long)task, (u64)(long)vma,
   806				    (u64)(long)callback_ctx, 0, 0);
   807			ret = 0;
   808		}
   809		bpf_mmap_unlock_mm(work, mm);
   810	out:
   811	#ifdef CONFIG_MMU
   812		if (mmput_needed)
   813			mmput_async(mm);
   814	#endif
   815		return ret;
   816	}
   817	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
