Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047D313A243
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 12:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688131; cv=none; b=j6EsMinSOcLOctKnblvZR8QMPj2K++Jn9M3IunJjzsexT8TVnJM2oCPW6k2H68sOJLUoDcVHMgTwUkxg9P6MspP+gQ7o4y44YOEiHhMZdbJ7ypuYcxk6BJR34azjWAAI6MbSrruSwZ06N9Mq+PXKZ6TSsaZEThyMQHyILOjb+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688131; c=relaxed/simple;
	bh=gDP93NnNs7NIQotD8tfFTPrGFlePLvJVG9XNXQ0m0p0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f6i9b3KSw3HyQB1s4lSjZlHQYbft8Hlngh8VeOv3+tQSKm7GfgwSZAQgdxFZNFEgu1+Y/o+RT99H6xn5jduCQCm+sDI7UvxsiYMRJgI3YutECWwjUNkneZJxQLtEEZcVUZOb9ZDoPLdyXHxxLXtrczeCFw5eeMhWoQ0y+A5TPbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SGM6bQ/S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SGM6bQ/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722688129; x=1754224129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDP93NnNs7NIQotD8tfFTPrGFlePLvJVG9XNXQ0m0p0=;
  b=SGM6bQ/SZf6CDV8EW5ABLuu6hYRQyA8NprbjEu1+RwBoRdoO0c8CPyFH
   4KSrYkK4ML+Z1FkHBBppL7PqSn0dM2ZnMAhJIU4cQ1CMWjK6Kfl/iVwOZ
   tgFr6yRXdPuAxxxQMaYjp+MU3iJhzfkb/+LD86QLxdg98450/Q98RsSDD
   qcP211rnvWllUDIclnS7kcC/SUvo3U2PWVC5kxJCSdeKGky3TUqyaBU4C
   tlumjeNw5NDKRIThI30VsPgteTfrfSGJQRlJhS6E5W4ddLMTN7E6Jq0kP
   gxkQcsC0O/NaXaoIfF6mUvcCXQQ8L6oDbwZ59V0EJU0b51724sGsvo5B7
   w==;
X-CSE-ConnectionGUID: 2I89/IFRSm6vxVlILBGlQA==
X-CSE-MsgGUID: 9Gz9WjTwR7aXECBtEo6bYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20279504"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20279504"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 05:28:43 -0700
X-CSE-ConnectionGUID: WsUANPhwRzSFP7kOgd+Msg==
X-CSE-MsgGUID: uJ45f66eT1WcmZ4dhn9JIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="86642179"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2024 05:28:41 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saDsB-0000RG-2E;
	Sat, 03 Aug 2024 12:28:36 +0000
Date: Sat, 3 Aug 2024 20:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 2209/2947] fs/proc/base.c:879:88: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202408032026.4HZU39Nb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f524a5e4dfb75b277c9a5ad819ca5f035f490f14
commit: b2ae850c7a0b156ce991bb3d5e6090bf9174b161 [2209/2947] proc: add config & param to block forcing mem writes
config: x86_64-randconfig-121-20240803 (https://download.01.org/0day-ci/archive/20240803/202408032026.4HZU39Nb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408032026.4HZU39Nb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408032026.4HZU39Nb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/proc/base.c:879:88: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/proc/base.c:879:88: sparse:    struct task_struct [noderef] __rcu *
   fs/proc/base.c:879:88: sparse:    struct task_struct *
   fs/proc/base.c:2315:25: sparse: sparse: cast to restricted fmode_t
   fs/proc/base.c:2372:42: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c:2472:48: sparse: sparse: cast from restricted fmode_t
   fs/proc/base.c: note: in included file (through include/linux/rcuwait.h, include/linux/percpu-rwsem.h, include/linux/fs.h, ...):
   include/linux/sched/signal.h:754:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:754:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:754:37: sparse:     got struct spinlock [noderef] __rcu *
   fs/proc/base.c:1158:36: sparse: sparse: context imbalance in '__set_oom_adj' - unexpected unlock
   fs/proc/base.c:2162:36: sparse: sparse: self-comparison always evaluates to false
   fs/proc/base.c:2175:36: sparse: sparse: self-comparison always evaluates to false
   fs/proc/base.c:2499:13: sparse: sparse: context imbalance in 'timers_start' - wrong count at exit
   include/linux/sched/signal.h:754:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:754:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:754:37: sparse:     got struct spinlock [noderef] __rcu *
   fs/proc/base.c:2525:36: sparse: sparse: context imbalance in 'timers_stop' - unexpected unlock
   fs/proc/base.c:3855:19: sparse: sparse: self-comparison always evaluates to false

vim +879 fs/proc/base.c

   867	
   868	static bool proc_mem_foll_force(struct file *file, struct mm_struct *mm)
   869	{
   870		struct task_struct *task;
   871		bool ptrace_active = false;
   872	
   873		switch (proc_mem_force_override) {
   874		case PROC_MEM_FORCE_NEVER:
   875			return false;
   876		case PROC_MEM_FORCE_PTRACE:
   877			task = get_proc_task(file_inode(file));
   878			if (task) {
 > 879				ptrace_active = task->ptrace && task->mm == mm && task->parent == current;
   880				put_task_struct(task);
   881			}
   882			return ptrace_active;
   883		default:
   884			return true;
   885		}
   886	}
   887	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
