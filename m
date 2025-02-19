Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03622EEA6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 16:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739984021; cv=none; b=YKVuv4p7LptEzrjMu+iYGyUm376lxrL0QwNKggDoILJ/jSaeBr/EfZN7/1jaRo7oWc3opXzPsbo2CfwIC3t+Xr3Q3F0n9zwo8WhHqcEDm1erhgz7eKgXdL+G/Wiu6rLdEMvQkZWi5ZvoASgW4uAs8yGw8Ss9VDOoTCY3ybr0nT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739984021; c=relaxed/simple;
	bh=zcZXb6mKv7KAb9l+G/FM6KZ7U+WCwzAZa97Kww9cU7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQSXn3/Vk/YPvUhUj1hZzOurMC5QbCQJsCStSWAVmdA4TgyCsQYnB7wd3JLbOxZzjRgaEi7OkhLJQvQG39m9rx88XVK75lN05F9GzD4nWznitPmHZn9BAafsNvTSFhSf5/jUE+5JQRRKmJoe070QS/NZNkQERX3dzpLPb30ZPWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IFK2YS3/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IFK2YS3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739984018; x=1771520018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zcZXb6mKv7KAb9l+G/FM6KZ7U+WCwzAZa97Kww9cU7E=;
  b=IFK2YS3/WdnDFGBcmFGEboqdIo3n407QIqs85j1ksnbmKDVEyMU7itDN
   /dw7AxcBlnWYu8Eb/58R2s8vuwYvxsJbnZjr4Gnt5RCJxSrJ7bjW51/EN
   UEsRrGG+wcmniJors1hRXegt3AY8nCawFFIwyXuOyJYyngy0KtkUgVgNX
   n4HVMimOFdBi5P99mu0qYUE68UaRcVgAOCrr9pcc47jhaKrSQFnCtPvFT
   1kTno5/Q98EX/oX1zpEbL2C7RKTQ8dwVmjL4atYvpDTXEP/Xbrtl67xAu
   sGHYZiG6jBqzHlYOXP9tcFjAv69tQGWaQiOGZ8Sz+FXEIdFovrzfcxcrp
   g==;
X-CSE-ConnectionGUID: +qcdJ/FSTsm4ogEfenpFCw==
X-CSE-MsgGUID: Z8uX+RHiQcyVtHr2Hc40Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44378783"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="44378783"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 08:53:38 -0800
X-CSE-ConnectionGUID: SO/u/iktRuaHs0hFgejz4A==
X-CSE-MsgGUID: 2cNSeVzDTKi3NC2UuUKFVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114502065"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Feb 2025 08:44:30 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tknAD-0003CX-0x;
	Wed, 19 Feb 2025 16:43:14 +0000
Date: Thu, 20 Feb 2025 00:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 30/31] include/linux/sched/task.h:231:1:
 warning: spinlock 'p->alloc_lock' is still held at the end of function
Message-ID: <202502200013.z7nLTAmO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   d40fe03e8f6b4bca895c8a9695e3e858d4be19d1
commit: 26bf30e9185ae72092b427b8a21621b0838354e4 [30/31] drivers/tty: Enable capability analysis for core files
config: riscv-randconfig-001-20250219 (https://download.01.org/0day-ci/archive/20250220/202502200013.z7nLTAmO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200013.z7nLTAmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200013.z7nLTAmO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/ttynull.c:9:
   In file included from include/linux/console.h:19:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
>> include/linux/sched/task.h:231:1: warning: spinlock 'p->alloc_lock' is still held at the end of function [-Wthread-safety-analysis]
     231 | }
         | ^
   include/linux/sched/task.h:230:2: note: spinlock acquired here
     230 |         spin_lock(&p->alloc_lock);
         |         ^
>> include/linux/sched/task.h:235:2: warning: releasing spinlock 'p->alloc_lock' that was not held [-Wthread-safety-analysis]
     235 |         spin_unlock(&p->alloc_lock);
         |         ^
   In file included from drivers/tty/ttynull.c:9:
   In file included from include/linux/console.h:19:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
>> include/linux/sched/signal.h:741:2: warning: releasing spinlock 'task->sighand->siglock' that was not held [-Wthread-safety-analysis]
     741 |         spin_unlock_irqrestore(&task->sighand->siglock, *flags);
         |         ^
   In file included from drivers/tty/ttynull.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
>> include/linux/radix-tree.h:260:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
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
   In file included from drivers/tty/ttynull.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/riscv/include/asm/elf.h:12:
   In file included from include/linux/compat.h:17:
>> include/linux/fs.h:545:1: warning: rw_semaphore 'mapping->i_mmap_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     545 | }
         | ^
   include/linux/fs.h:544:2: note: rw_semaphore acquired here
     544 |         down_write(&mapping->i_mmap_rwsem);
         |         ^
>> include/linux/fs.h:554:2: warning: releasing rw_semaphore 'mapping->i_mmap_rwsem' that was not held [-Wthread-safety-analysis]
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
>> include/linux/fs.h:878:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     878 | }
         | ^
   include/linux/fs.h:877:2: note: rw_semaphore acquired here
     877 |         down_write(&inode->i_rwsem);
         |         ^
>> include/linux/fs.h:882:2: warning: releasing rw_semaphore 'inode->i_rwsem' that was not held [-Wthread-safety-analysis]
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
>> include/linux/fs.h:923:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
     923 | }
         | ^
   include/linux/fs.h:922:2: note: rw_semaphore acquired here
     922 |         down_write(&mapping->invalidate_lock);
         |         ^
>> include/linux/fs.h:927:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
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
   In file included from drivers/tty/ttynull.c:10:
   In file included from include/linux/module.h:21:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
>> include/linux/idr.h:174:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
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
   In file included from drivers/tty/ttynull.c:11:
   In file included from include/linux/tty.h:9:
   In file included from include/linux/tty_driver.h:9:
   In file included from include/linux/cdev.h:8:
>> include/linux/device.h:1031:1: warning: mutex 'dev->mutex' is still held at the end of function [-Wthread-safety-analysis]
    1031 | }
         | ^
   include/linux/device.h:1030:2: note: mutex acquired here
    1030 |         mutex_lock(&dev->mutex);
         |         ^
   include/linux/mutex.h:167:26: note: expanded from macro 'mutex_lock'
     167 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                          ^
   In file included from drivers/tty/ttynull.c:11:
   In file included from include/linux/tty.h:9:
   In file included from include/linux/tty_driver.h:9:
   In file included from include/linux/cdev.h:8:
>> include/linux/device.h:1045:2: warning: releasing mutex 'dev->mutex' that was not held [-Wthread-safety-analysis]
    1045 |         mutex_unlock(&dev->mutex);
         |         ^
   21 warnings generated.
--
   In file included from drivers/tty/goldfish.c:8:
   In file included from include/linux/console.h:19:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
>> include/linux/sched/task.h:231:1: warning: spinlock 'p->alloc_lock' is still held at the end of function [-Wthread-safety-analysis]
     231 | }
         | ^
   include/linux/sched/task.h:230:2: note: spinlock acquired here
     230 |         spin_lock(&p->alloc_lock);
         |         ^
>> include/linux/sched/task.h:235:2: warning: releasing spinlock 'p->alloc_lock' that was not held [-Wthread-safety-analysis]
     235 |         spin_unlock(&p->alloc_lock);
         |         ^
   In file included from drivers/tty/goldfish.c:8:
   In file included from include/linux/console.h:19:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
>> include/linux/sched/signal.h:741:2: warning: releasing spinlock 'task->sighand->siglock' that was not held [-Wthread-safety-analysis]
     741 |         spin_unlock_irqrestore(&task->sighand->siglock, *flags);
         |         ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:578:
   In file included from include/linux/irqdesc.h:6:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
   In file included from include/linux/idr.h:15:
>> include/linux/radix-tree.h:260:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
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
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:578:
   In file included from include/linux/irqdesc.h:6:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:12:
>> include/linux/idr.h:174:2: warning: releasing local_lock 'radix_tree_preloads.lock' that was not held [-Wthread-safety-analysis]
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
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
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
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   include/linux/irq.h:1230:2: warning: releasing raw_spinlock 'gc->lock' that was not held [-Wthread-safety-analysis]
    1230 |         raw_spin_unlock(&gc->lock);
         |         ^
   include/linux/spinlock.h:277:32: note: expanded from macro 'raw_spin_unlock'
     277 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
         |                                         ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:16:
>> include/linux/mmap_lock.h:137:1: warning: rw_semaphore 'mm->.mmap_lock' is still held at the end of function [-Wthread-safety-analysis]
     137 | }
         | ^
   include/linux/mmap_lock.h:134:2: note: rw_semaphore acquired here
     134 |         down_write(&mm->mmap_lock);
         |         ^
   include/linux/mmap_lock.h:145:1: warning: rw_semaphore 'mm->.mmap_lock' is still held at the end of function [-Wthread-safety-analysis]
     145 | }
         | ^
   include/linux/mmap_lock.h:142:2: note: rw_semaphore acquired here
     142 |         down_write_nested(&mm->mmap_lock, subclass);
         |         ^
>> include/linux/mmap_lock.h:155:2: warning: rw_semaphore 'mm->.mmap_lock' is not held on every path through here [-Wthread-safety-analysis]
     155 |         __mmap_lock_trace_acquire_returned(mm, true, ret == 0);
         |         ^
   include/linux/mmap_lock.h:152:8: note: rw_semaphore acquired here
     152 |         ret = down_write_killable(&mm->mmap_lock);
         |               ^
>> include/linux/mmap_lock.h:177:2: warning: releasing rw_semaphore 'mm->.mmap_lock' that was not held [-Wthread-safety-analysis]
     177 |         up_write(&mm->mmap_lock);
         |         ^
   include/linux/mmap_lock.h:184:2: warning: releasing rw_semaphore 'mm->.mmap_lock' that was not held [-Wthread-safety-analysis]
     184 |         downgrade_write(&mm->mmap_lock);
         |         ^
   include/linux/mmap_lock.h:185:1: warning: rw_semaphore 'mm->.mmap_lock' is still held at the end of function [-Wthread-safety-analysis]
     185 | }
         | ^
   include/linux/mmap_lock.h:184:2: note: rw_semaphore acquired here
     184 |         downgrade_write(&mm->mmap_lock);
         |         ^
   include/linux/mmap_lock.h:192:1: warning: rw_semaphore 'mm->.mmap_lock' is still held at the end of function [-Wthread-safety-analysis]
     192 | }
         | ^
   include/linux/mmap_lock.h:190:2: note: rw_semaphore acquired here
     190 |         down_read(&mm->mmap_lock);
         |         ^
   include/linux/mmap_lock.h:217:2: warning: releasing rw_semaphore 'mm->.mmap_lock' that was not held [-Wthread-safety-analysis]
     217 |         up_read(&mm->mmap_lock);
         |         ^
   include/linux/mmap_lock.h:223:2: warning: releasing rw_semaphore 'mm->.mmap_lock' that was not held [-Wthread-safety-analysis]
     223 |         up_read_non_owner(&mm->mmap_lock);
         |         ^
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:1133:
   In file included from include/linux/huge_mm.h:7:
>> include/linux/fs.h:545:1: warning: rw_semaphore 'mapping->i_mmap_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     545 | }
         | ^
   include/linux/fs.h:544:2: note: rw_semaphore acquired here
     544 |         down_write(&mapping->i_mmap_rwsem);
         |         ^
>> include/linux/fs.h:554:2: warning: releasing rw_semaphore 'mapping->i_mmap_rwsem' that was not held [-Wthread-safety-analysis]
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
>> include/linux/fs.h:878:1: warning: rw_semaphore 'inode->i_rwsem' is still held at the end of function [-Wthread-safety-analysis]
     878 | }
         | ^
   include/linux/fs.h:877:2: note: rw_semaphore acquired here
     877 |         down_write(&inode->i_rwsem);
         |         ^
>> include/linux/fs.h:882:2: warning: releasing rw_semaphore 'inode->i_rwsem' that was not held [-Wthread-safety-analysis]
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
>> include/linux/fs.h:923:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
     923 | }
         | ^
   include/linux/fs.h:922:2: note: rw_semaphore acquired here
     922 |         down_write(&mapping->invalidate_lock);
         |         ^
>> include/linux/fs.h:927:2: warning: releasing rw_semaphore 'mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
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
   In file included from drivers/tty/goldfish.c:9:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
>> include/linux/mm.h:3099:1: warning: spinlock 'ptl' is still held at the end of function [-Wthread-safety-analysis]
    3099 | }
         | ^
   include/linux/mm.h:3097:2: note: spinlock acquired here
    3097 |         spin_lock(ptl);
         |         ^
   include/linux/mm.h:3127:1: warning: spinlock 'ptl' is still held at the end of function [-Wthread-safety-analysis]
    3127 | }
         | ^
   include/linux/mm.h:3125:2: note: spinlock acquired here
    3125 |         spin_lock(ptl);
         |         ^
   In file included from drivers/tty/goldfish.c:9:
>> include/linux/interrupt.h:239:1: warning: 'assert_capability' attribute requires arguments whose type is annotated with 'capability' attribute; type here is 'int *' [-Wthread-safety-attributes]
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
   In file included from drivers/tty/goldfish.c:10:
   In file included from include/linux/platform_device.h:13:
>> include/linux/device.h:1031:1: warning: mutex 'dev->mutex' is still held at the end of function [-Wthread-safety-analysis]
    1031 | }
         | ^
   include/linux/device.h:1030:2: note: mutex acquired here
    1030 |         mutex_lock(&dev->mutex);
         |         ^
   include/linux/mutex.h:167:26: note: expanded from macro 'mutex_lock'
     167 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                          ^
   In file included from drivers/tty/goldfish.c:10:
   In file included from include/linux/platform_device.h:13:
>> include/linux/device.h:1045:2: warning: releasing mutex 'dev->mutex' that was not held [-Wthread-safety-analysis]
    1045 |         mutex_unlock(&dev->mutex);
         |         ^
   In file included from drivers/tty/goldfish.c:20:
>> include/linux/serial_core.h:606:1: warning: spinlock 'up->lock' is still held at the end of function [-Wthread-safety-analysis]
     606 | }
         | ^
   include/linux/serial_core.h:605:2: note: spinlock acquired here
     605 |         spin_lock_irqsave(&up->lock, *flags);
         |         ^
   include/linux/spinlock.h:378:35: note: expanded from macro 'spin_lock_irqsave'
     378 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-capability-analysis.h:283:23: note: expanded from macro '__acquire'
     283 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   In file included from drivers/tty/goldfish.c:20:
>> include/linux/serial_core.h:614:2: warning: releasing spinlock 'up->lock' that was not held [-Wthread-safety-analysis]
     614 |         spin_unlock_irqrestore(&up->lock, flags);
         |         ^
   include/linux/serial_core.h:696:1: warning: spinlock 'up->lock' is still held at the end of function [-Wthread-safety-analysis]
     696 | }
         | ^
   include/linux/serial_core.h:694:2: note: spinlock acquired here
     694 |         spin_lock(&up->lock);
         |         ^
   include/linux/serial_core.h:706:1: warning: spinlock 'up->lock' is still held at the end of function [-Wthread-safety-analysis]
     706 | }
         | ^
   include/linux/serial_core.h:704:2: note: spinlock acquired here
     704 |         spin_lock_irq(&up->lock);
         |         ^
   include/linux/serial_core.h:717:1: warning: spinlock 'up->lock' is still held at the end of function [-Wthread-safety-analysis]
     717 | }
         | ^
   include/linux/serial_core.h:715:2: note: spinlock acquired here
     715 |         spin_lock_irqsave(&up->lock, *flags);
         |         ^
   include/linux/spinlock.h:378:35: note: expanded from macro 'spin_lock_irqsave'
     378 |         __release(spinlock_check(lock)); __acquire(lock);       \
         |                                          ^
   include/linux/compiler-capability-analysis.h:283:23: note: expanded from macro '__acquire'
     283 | #define __acquire(x)            __acquire_cap(x)
         |                                 ^
   In file included from drivers/tty/goldfish.c:20:
   include/linux/serial_core.h:736:1: warning: spinlock 'up->lock' is not held on every path through here [-Wthread-safety-analysis]
     736 | }
         | ^
   include/linux/serial_core.h:727:7: note: spinlock acquired here
     727 |         if (!spin_trylock(&up->lock))
         |              ^
   include/linux/serial_core.h:756:1: warning: spinlock 'up->lock' is not held on every path through here [-Wthread-safety-analysis]
     756 | }
         | ^
   include/linux/serial_core.h:747:7: note: spinlock acquired here
     747 |         if (!spin_trylock_irqsave(&up->lock, *flags))
         |              ^
   include/linux/spinlock.h:428:43: note: expanded from macro 'spin_trylock_irqsave'
     428 | #define spin_trylock_irqsave(lock, flags) _spin_trylock_irqsave(lock, &(flags))
         |                                           ^
   In file included from drivers/tty/goldfish.c:20:
   include/linux/serial_core.h:765:2: warning: releasing spinlock 'up->lock' that was not held [-Wthread-safety-analysis]
     765 |         spin_unlock(&up->lock);
         |         ^
   include/linux/serial_core.h:775:2: warning: releasing spinlock 'up->lock' that was not held [-Wthread-safety-analysis]
     775 |         spin_unlock_irq(&up->lock);
         |         ^
   include/linux/serial_core.h:786:2: warning: releasing spinlock 'up->lock' that was not held [-Wthread-safety-analysis]
     786 |         spin_unlock_irqrestore(&up->lock, flags);
         |         ^
   52 warnings generated.
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
