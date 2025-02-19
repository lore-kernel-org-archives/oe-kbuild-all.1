Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CA722A81E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 19:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739993193; cv=none; b=CRJoUpnQnliJiIuwhmBuVHhSLZfTLuQoKTdqbL1LEF4RL0OMv3/rJ8xYlZE7dOXJ9YrxO/FAmZak6OLcoAmYWHui44P6IM5IMpCbXMB7/xXjk5IxXfFqyTY5am27QIzhLKdxCZaoqx0gHXcY9Dd78jO56EssZ4Gkwhs22Nr+Tl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739993193; c=relaxed/simple;
	bh=Ra74+gM4LAblYhCTrF0FnwQS8bdQC38UMf/+Yv3jF0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TK1iBsowcVBgd0+8IieyJi2+1T4ZqacbtrItOwUYYks1kr37ggxvWkzqSSwCDhI423QlyutxUqiKKFxKLg3dfFSzWm63J8OIBt/xKwVC0GUorKOnrW40RpUwlRsbKrFuJmkcKEMCnDPKto55P+on5zoEErm9SqHT3PqpuOGAgzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJF4aRkG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJF4aRkG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739993191; x=1771529191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ra74+gM4LAblYhCTrF0FnwQS8bdQC38UMf/+Yv3jF0Q=;
  b=FJF4aRkGYjFLD7BM2sRAPaHmgo1oiRdd4qqOlfXjofH5n9Ho2FTq6jal
   fWL2ia1C3XLAy1Mo5oumBHuizjbMJCHd9iMTLUBgbstIT+3t/CQJOYxve
   IHIUQWXYAKJ4++fiwlomcA0rZpCvfDbo0mJ1WDVRGBg/g706yBur96S5h
   rrP5XLlErjLsEpUaFJDlOMVLor7/soy79itkafIGUq2+SBI6+oqWxiCe3
   XBaQJ7dQOrC303I9j/4Yz8SE27iCPubPKnyp9yBdnE101ohQnX3TvdNvy
   m+QKn9UqUe75/wnQh/7qp7SxVl1NbQYS9DRnBZPyvHfpN39x0tZSuotgV
   Q==;
X-CSE-ConnectionGUID: e53iPtxDSWamO9lIizM6aA==
X-CSE-MsgGUID: pWEMf2pVTKOteBWO3hBePQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="52156479"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="52156479"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 11:26:31 -0800
X-CSE-ConnectionGUID: YCo1f/N6Q+SrO7GBVjb7Qg==
X-CSE-MsgGUID: Ym77USorSpaHhzcRNu3Shw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114551634"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Feb 2025 11:22:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkpeB-0003Md-2h;
	Wed, 19 Feb 2025 19:22:19 +0000
Date: Thu, 20 Feb 2025 03:21:15 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 30/31] include/linux/sched/task.h:231:1:
 warning: spinlock 'p->.alloc_lock' is still held at the end of function
Message-ID: <202502200305.Fr12eLSo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   e064f46a74e53c4986a0acc07a4c60dbea0b0aa5
commit: 26bf30e9185ae72092b427b8a21621b0838354e4 [30/31] drivers/tty: Enable capability analysis for core files
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250220/202502200305.Fr12eLSo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200305.Fr12eLSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200305.Fr12eLSo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/tty_io.c:73:
   In file included from include/linux/sched/signal.h:9:
>> include/linux/sched/task.h:231:1: warning: spinlock 'p->.alloc_lock' is still held at the end of function [-Wthread-safety-analysis]
     231 | }
         | ^
   include/linux/sched/task.h:230:2: note: spinlock acquired here
     230 |         spin_lock(&p->alloc_lock);
         |         ^
>> include/linux/sched/task.h:235:2: warning: releasing spinlock 'p->.alloc_lock' that was not held [-Wthread-safety-analysis]
     235 |         spin_unlock(&p->alloc_lock);
         |         ^
   In file included from drivers/tty/tty_io.c:73:
>> include/linux/sched/signal.h:741:2: warning: releasing spinlock 'task->.sighand->siglock' that was not held [-Wthread-safety-analysis]
     741 |         spin_unlock_irqrestore(&task->sighand->siglock, *flags);
         |         ^
   In file included from drivers/tty/tty_io.c:75:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:131:
   In file included from include/asm-generic/io.h:1108:
   include/linux/pgtable.h:136:2: warning: releasing __capability_RCU 'RCU' that was not held [-Wthread-safety-analysis]
     136 |         rcu_read_unlock();
         |         ^
   In file included from drivers/tty/tty_io.c:75:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:578:
   In file included from include/linux/irqdesc.h:6:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
   include/linux/radix-tree.h:260:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
     260 |         local_unlock(&radix_tree_preloads.lock);
         |         ^
   include/linux/local_lock.h:37:29: note: expanded from macro 'local_unlock'
      37 | #define local_unlock(lock)              __local_unlock(lock)
         |                                         ^
   include/linux/local_lock_internal.h:103:3: note: expanded from macro '__local_unlock'
     103 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-capability-analysis.h:291:23: note: expanded from macro '__release'
     291 | #define __release(x)            __release_cap(x)
         |                                 ^
   In file included from drivers/tty/tty_io.c:75:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:578:
   In file included from include/linux/irqdesc.h:6:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   include/linux/idr.h:174:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
     174 |         local_unlock(&radix_tree_preloads.lock);
         |         ^
   include/linux/local_lock.h:37:29: note: expanded from macro 'local_unlock'
      37 | #define local_unlock(lock)              __local_unlock(lock)
         |                                         ^
   include/linux/local_lock_internal.h:103:3: note: expanded from macro '__local_unlock'
     103 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-capability-analysis.h:291:23: note: expanded from macro '__release'
     291 | #define __release(x)            __release_cap(x)
         |                                 ^
   In file included from drivers/tty/tty_io.c:75:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   include/linux/irq.h:1226:1: warning: raw_spinlock 'gc->lock' is still held at the end of function [-Wthread-safety-analysis]
    1226 | }
         | ^
   include/linux/irq.h:1225:2: note: raw_spinlock acquired here
    1225 |         raw_spin_lock(&gc->lock);
         |         ^
   include/linux/spinlock.h:218:29: note: expanded from macro 'raw_spin_lock'
     218 | #define raw_spin_lock(lock)     _raw_spin_lock(lock)
         |                                 ^
   In file included from drivers/tty/tty_io.c:75:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   include/linux/irq.h:1230:2: warning: releasing raw_spinlock 'gc->lock' that was not held [-Wthread-safety-analysis]
    1230 |         raw_spin_unlock(&gc->lock);
         |         ^
   include/linux/spinlock.h:277:32: note: expanded from macro 'raw_spin_unlock'
     277 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                         ^
   In file included from drivers/tty/tty_io.c:75:
   include/linux/interrupt.h:239:1: warning: 'assert_capability' attribute requires arguments whose type is annotated with 'capability' attribute; type here is 'int *' [-Wthread-safety-attributes]
     239 | DEFINE_LOCK_GUARD_1(disable_irq, int,
         | ^
   include/linux/cleanup.h:413:60: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     413 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         |                                                                         ^
   include/linux/cleanup.h:390:27: note: expanded from macro '\
   __DEFINE_LOCK_GUARD_1'
     390 |         __no_capability_analysis __asserts_cap(l)                       \
         |                                  ^
   include/linux/compiler-capability-analysis.h:21:46: note: expanded from macro '__asserts_cap'
      21 | # define __asserts_cap(var)                     __attribute__((assert_capability(var)))
         |                                                                ^
   In file included from drivers/tty/tty_io.c:76:
   In file included from include/linux/tty.h:5:
--
   In file included from drivers/tty/n_tty.c:40:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:15:
   include/linux/radix-tree.h:260:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
     260 |         local_unlock(&radix_tree_preloads.lock);
         |         ^
   include/linux/local_lock.h:37:29: note: expanded from macro 'local_unlock'
      37 | #define local_unlock(lock)              __local_unlock(lock)
         |                                         ^
   include/linux/local_lock_internal.h:103:3: note: expanded from macro '__local_unlock'
     103 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-capability-analysis.h:291:23: note: expanded from macro '__release'
     291 | #define __release(x)            __release_cap(x)
         |                                 ^
   In file included from drivers/tty/n_tty.c:40:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
>> include/linux/sched/task.h:231:1: warning: spinlock 'p->.alloc_lock' is still held at the end of function [-Wthread-safety-analysis]
     231 | }
         | ^
   include/linux/sched/task.h:230:2: note: spinlock acquired here
     230 |         spin_lock(&p->alloc_lock);
         |         ^
>> include/linux/sched/task.h:235:2: warning: releasing spinlock 'p->.alloc_lock' that was not held [-Wthread-safety-analysis]
     235 |         spin_unlock(&p->alloc_lock);
         |         ^
   In file included from drivers/tty/n_tty.c:40:
   In file included from include/linux/poll.h:10:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
>> include/linux/sched/signal.h:741:2: warning: releasing spinlock 'task->.sighand->siglock' that was not held [-Wthread-safety-analysis]
     741 |         spin_unlock_irqrestore(&task->sighand->siglock, *flags);
         |         ^
   In file included from drivers/tty/n_tty.c:40:
   In file included from include/linux/poll.h:10:
   include/linux/fs.h:545:1: warning: rw_semaphore 'mapping->i_mmap_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     545 | }
         | ^
   include/linux/fs.h:544:2: note: rw_semaphore acquired here
     544 |         down_write(&mapping->i_mmap_rwsem);
         |         ^
   include/linux/fs.h:554:2: warning: releasing rw_semaphore 'mapping->i_mmap_rwsem' that was not held [-Wthread-safety-analysis]
     554 |         up_write(&mapping->i_mmap_rwsem);
         |         ^
   include/linux/fs.h:565:1: warning: rw_semaphore 'mapping->i_mmap_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     565 | }
         | ^
   include/linux/fs.h:564:2: note: rw_semaphore acquired here
     564 |         down_read(&mapping->i_mmap_rwsem);
         |         ^
   include/linux/fs.h:569:2: warning: releasing rw_semaphore 'mapping->i_mmap_rwsem' that was not held [-Wthread-safety-analysis]
     569 |         up_read(&mapping->i_mmap_rwsem);
         |         ^
   include/linux/fs.h:878:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     878 | }
         | ^
   include/linux/fs.h:877:2: note: rw_semaphore acquired here
     877 |         down_write(&inode->i_rwsem);
         |         ^
   include/linux/fs.h:882:2: warning: releasing rw_semaphore 'inode->i_rwsem' that was not held [-Wthread-safety-analysis]
     882 |         up_write(&inode->i_rwsem);
         |         ^
   include/linux/fs.h:888:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     888 | }
         | ^
   include/linux/fs.h:887:2: note: rw_semaphore acquired here
     887 |         down_read(&inode->i_rwsem);
         |         ^
   include/linux/fs.h:892:2: warning: releasing rw_semaphore 'inode->i_rwsem' that was not held [-Wthread-safety-analysis]
     892 |         up_read(&inode->i_rwsem);
         |         ^
   include/linux/fs.h:913:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     913 | }
         | ^
   include/linux/fs.h:912:2: note: rw_semaphore acquired here
     912 |         down_write_nested(&inode->i_rwsem, subclass);
         |         ^
   include/linux/fs.h:918:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     918 | }
         | ^
   include/linux/fs.h:917:2: note: rw_semaphore acquired here
     917 |         down_read_nested(&inode->i_rwsem, subclass);
         |         ^
   include/linux/fs.h:923:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
     923 | }
         | ^
   include/linux/fs.h:922:2: note: rw_semaphore acquired here
     922 |         down_write(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:927:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     927 |         up_write(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:933:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
     933 | }
         | ^
   include/linux/fs.h:932:2: note: rw_semaphore acquired here
     932 |         down_read(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:944:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     944 |         up_read(&mapping->invalidate_lock);
         |         ^
   In file included from drivers/tty/n_tty.c:46:
   In file included from include/linux/tty.h:9:
   In file included from include/linux/tty_driver.h:9:
   In file included from include/linux/cdev.h:5:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   include/linux/idr.h:174:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
     174 |         local_unlock(&radix_tree_preloads.lock);
         |         ^
   include/linux/local_lock.h:37:29: note: expanded from macro 'local_unlock'
      37 | #define local_unlock(lock)              __local_unlock(lock)
         |                                         ^
   include/linux/local_lock_internal.h:103:3: note: expanded from macro '__local_unlock'
     103 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-capability-analysis.h:291:23: note: expanded from macro '__release'
     291 | #define __release(x)            __release_cap(x)
         |                                 ^
   In file included from drivers/tty/n_tty.c:46:
   In file included from include/linux/tty.h:9:
   In file included from include/linux/tty_driver.h:9:
   In file included from include/linux/cdev.h:8:
   include/linux/device.h:1031:1: warning: mutex 'dev->mutex' is still held at the end of function [-Wthread-safety-analysis]
    1031 | }
         | ^
   include/linux/device.h:1030:2: note: mutex acquired here
    1030 |         mutex_lock(&dev->mutex);
         |         ^
   include/linux/mutex.h:167:26: note: expanded from macro 'mutex_lock'
--
   In file included from drivers/tty/tty_ioctl.c:14:
   In file included from include/linux/sched/signal.h:9:
>> include/linux/sched/task.h:231:1: warning: spinlock 'p->.alloc_lock' is still held at the end of function [-Wthread-safety-analysis]
     231 | }
         | ^
   include/linux/sched/task.h:230:2: note: spinlock acquired here
     230 |         spin_lock(&p->alloc_lock);
         |         ^
>> include/linux/sched/task.h:235:2: warning: releasing spinlock 'p->.alloc_lock' that was not held [-Wthread-safety-analysis]
     235 |         spin_unlock(&p->alloc_lock);
         |         ^
   In file included from drivers/tty/tty_ioctl.c:14:
>> include/linux/sched/signal.h:741:2: warning: releasing spinlock 'task->.sighand->siglock' that was not held [-Wthread-safety-analysis]
     741 |         spin_unlock_irqrestore(&task->sighand->siglock, *flags);
         |         ^
   In file included from drivers/tty/tty_ioctl.c:17:
   In file included from include/linux/tty.h:5:
   In file included from include/linux/fs.h:15:
   include/linux/radix-tree.h:260:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
     260 |         local_unlock(&radix_tree_preloads.lock);
         |         ^
   include/linux/local_lock.h:37:29: note: expanded from macro 'local_unlock'
      37 | #define local_unlock(lock)              __local_unlock(lock)
         |                                         ^
   include/linux/local_lock_internal.h:103:3: note: expanded from macro '__local_unlock'
     103 |                 __release(lock);                                \
         |                 ^
   include/linux/compiler-capability-analysis.h:291:23: note: expanded from macro '__release'
     291 | #define __release(x)            __release_cap(x)
         |                                 ^
   In file included from drivers/tty/tty_ioctl.c:17:
   In file included from include/linux/tty.h:5:
   include/linux/fs.h:545:1: warning: rw_semaphore 'mapping->i_mmap_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     545 | }
         | ^
   include/linux/fs.h:544:2: note: rw_semaphore acquired here
     544 |         down_write(&mapping->i_mmap_rwsem);
         |         ^
   include/linux/fs.h:554:2: warning: releasing rw_semaphore 'mapping->i_mmap_rwsem' that was not held [-Wthread-safety-analysis]
     554 |         up_write(&mapping->i_mmap_rwsem);
         |         ^
   include/linux/fs.h:565:1: warning: rw_semaphore 'mapping->i_mmap_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     565 | }
         | ^
   include/linux/fs.h:564:2: note: rw_semaphore acquired here
     564 |         down_read(&mapping->i_mmap_rwsem);
         |         ^
   include/linux/fs.h:569:2: warning: releasing rw_semaphore 'mapping->i_mmap_rwsem' that was not held [-Wthread-safety-analysis]
     569 |         up_read(&mapping->i_mmap_rwsem);
         |         ^
   include/linux/fs.h:878:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     878 | }
         | ^
   include/linux/fs.h:877:2: note: rw_semaphore acquired here
     877 |         down_write(&inode->i_rwsem);
         |         ^
   include/linux/fs.h:882:2: warning: releasing rw_semaphore 'inode->i_rwsem' that was not held [-Wthread-safety-analysis]
     882 |         up_write(&inode->i_rwsem);
         |         ^
   include/linux/fs.h:888:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     888 | }
         | ^
   include/linux/fs.h:887:2: note: rw_semaphore acquired here
     887 |         down_read(&inode->i_rwsem);
         |         ^
   include/linux/fs.h:892:2: warning: releasing rw_semaphore 'inode->i_rwsem' that was not held [-Wthread-safety-analysis]
     892 |         up_read(&inode->i_rwsem);
         |         ^
   include/linux/fs.h:913:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     913 | }
         | ^
   include/linux/fs.h:912:2: note: rw_semaphore acquired here
     912 |         down_write_nested(&inode->i_rwsem, subclass);
         |         ^
   include/linux/fs.h:918:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     918 | }
         | ^
   include/linux/fs.h:917:2: note: rw_semaphore acquired here
     917 |         down_read_nested(&inode->i_rwsem, subclass);
         |         ^
   include/linux/fs.h:923:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
     923 | }
         | ^
   include/linux/fs.h:922:2: note: rw_semaphore acquired here
     922 |         down_write(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:927:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     927 |         up_write(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:933:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
     933 | }
         | ^
   include/linux/fs.h:932:2: note: rw_semaphore acquired here
     932 |         down_read(&mapping->invalidate_lock);
         |         ^
   include/linux/fs.h:944:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     944 |         up_read(&mapping->invalidate_lock);
         |         ^
   In file included from drivers/tty/tty_ioctl.c:17:
   In file included from include/linux/tty.h:9:
   In file included from include/linux/tty_driver.h:9:
   In file included from include/linux/cdev.h:5:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   include/linux/idr.h:174:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
     174 |         local_unlock(&radix_tree_preloads.lock);
         |         ^
   include/linux/local_lock.h:37:29: note: expanded from macro 'local_unlock'
      37 | #define local_unlock(lock)              __local_unlock(lock)
         |                                         ^
   include/linux/local_lock_internal.h:103:3: note: expanded from macro '__local_unlock'
     103 |                 __release(lock);                                \
..


vim +231 include/linux/sched/task.h

901b14bd946a8b Ingo Molnar           2017-02-03  217  
56cd697366b6d6 Ingo Molnar           2017-02-06  218  /*
56cd697366b6d6 Ingo Molnar           2017-02-06  219   * Protects ->fs, ->files, ->mm, ->group_info, ->comm, keyring
56cd697366b6d6 Ingo Molnar           2017-02-06  220   * subscriptions and synchronises with wait4().  Also used in procfs.  Also
56cd697366b6d6 Ingo Molnar           2017-02-06  221   * pins the final release of task.io_context.  Also protects ->cpuset and
85b6d24646e412 Alexander Mikhalitsyn 2021-11-19  222   * ->cgroup.subsys[]. And ->vfork_done. And ->sysvshm.shm_clist.
56cd697366b6d6 Ingo Molnar           2017-02-06  223   *
56cd697366b6d6 Ingo Molnar           2017-02-06  224   * Nests both inside and outside of read_lock(&tasklist_lock).
56cd697366b6d6 Ingo Molnar           2017-02-06  225   * It must not be nested with write_lock_irq(&tasklist_lock),
56cd697366b6d6 Ingo Molnar           2017-02-06  226   * neither inside nor outside.
56cd697366b6d6 Ingo Molnar           2017-02-06  227   */
56cd697366b6d6 Ingo Molnar           2017-02-06  228  static inline void task_lock(struct task_struct *p)
56cd697366b6d6 Ingo Molnar           2017-02-06  229  {
56cd697366b6d6 Ingo Molnar           2017-02-06  230  	spin_lock(&p->alloc_lock);
56cd697366b6d6 Ingo Molnar           2017-02-06 @231  }
56cd697366b6d6 Ingo Molnar           2017-02-06  232  
56cd697366b6d6 Ingo Molnar           2017-02-06  233  static inline void task_unlock(struct task_struct *p)
56cd697366b6d6 Ingo Molnar           2017-02-06  234  {
56cd697366b6d6 Ingo Molnar           2017-02-06 @235  	spin_unlock(&p->alloc_lock);
56cd697366b6d6 Ingo Molnar           2017-02-06  236  }
56cd697366b6d6 Ingo Molnar           2017-02-06  237  

:::::: The code at line 231 was first introduced by commit
:::::: 56cd697366b6d6f67acb6c58ac7f3b185d11ef07 sched/headers: Move the task_lock()/unlock() APIs to <linux/sched/task.h>

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
