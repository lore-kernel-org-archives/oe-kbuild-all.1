Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B47182B4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620573; cv=none; b=Kpj2VoSV3tEeXPojYbM2p3Cs0ocBrZK4Ie0rzsXa6sZ2abYA2ikVYvWm6lD5o/kZa30OC6aXIKMauSAt6XEqM4yOq0mvQyY6qFZyfJld7v23JguKhDy9aIIqz76HPRxSpUNaUuHm8rq83p7ZcwgZpIVOjnS4BveAUcGQjGpoCsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620573; c=relaxed/simple;
	bh=UNJIn5V+r/rBBVsypDDrh92hUkQ3FWiChYfQEgWTcls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jllTutTkfFp9bGEo1AiDXxgMswVqVYO3A6EJ4rgxqqrd51fHE7B7L4mdHg13ovmr4nIXGrwJ0KrBzG3UDswngVPDhE+ezU+fQ1XC0gXg8fQvLvhGPnvysXEGqE8oNMBjBupm3f65oIxXFn2QpRgSnHn1DDCajVUW51CYfeQR0OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9m5lipJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9m5lipJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738620571; x=1770156571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UNJIn5V+r/rBBVsypDDrh92hUkQ3FWiChYfQEgWTcls=;
  b=Z9m5lipJ1azG2+tjxgu+8W3nf5cbKt93nUY54yN8Iw/GdNmARNnIVhJE
   DUhixppJYjNUVRa5bWQcTEQ6oMH5NgO5CDne1coxRGE7nsr6ukTgOxHcl
   7u8xZTqfBtFffGtqnF5IA5n+jVAU+kzNnu+UCt/Ppo6ycRkVJZx3k48YT
   x0GVYxth3wXvo8VKNfGGKWX7GuAN3UoUo9ns8hidm6dATuZYWlnqpgIgw
   5aBBthsoEyr98mjZf5QoOVUeE6hpoh3HNRQbSp9H6eFrbazZoMIOv0/4h
   W/0FMRz3hIKgs9iZtmrGXVJ8EBzt7faiy4vz3QjQsqddiWO5aZl2SkH9H
   g==;
X-CSE-ConnectionGUID: 7uu3P0osRSmsdf2RpGL1uw==
X-CSE-MsgGUID: fR1QfSufQ7OWTyRsQJ1Mig==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50520538"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="50520538"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 14:09:31 -0800
X-CSE-ConnectionGUID: WWt79Ku6RLCF7sWuThFESg==
X-CSE-MsgGUID: UvUEXiPWTdmbl0bu47ZRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="110359214"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Feb 2025 14:09:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf4dD-000ra1-1z;
	Mon, 03 Feb 2025 22:09:27 +0000
Date: Tue, 4 Feb 2025 06:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.13-esp32 50/53]
 kernel/events/core.c:6788:15: sparse: sparse: symbol
 'perf_get_unmapped_area' was not declared. Should it be static?
Message-ID: <202502040637.iha8D2xS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.13-esp32
head:   f4a6cef2509c4e81637b6d5d6f0c27966895985a
commit: 88bd9eae01160b8518176ec8020990780152c0d6 [50/53] WIP: perf: support mmapping event on noMMU
config: arm-randconfig-r133-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040637.iha8D2xS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250204/202502040637.iha8D2xS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040637.iha8D2xS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1419:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1419:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1419:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1432:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1432:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1432:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3586:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3586:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3586:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3590:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3590:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3590:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3591:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3591:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3591:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3645:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3645:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3645:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3646:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3646:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3646:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4024:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4024:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4024:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4436:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4436:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4436:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4930:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4930:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4930:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6363:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6363:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6363:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5850:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:6079:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6079:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6079:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6203:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6203:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6203:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6236:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6236:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6236:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6293:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6293:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6293:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6384:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6384:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6384:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6400:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6400:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6400:14: sparse:    struct perf_buffer *
>> kernel/events/core.c:6788:15: sparse: sparse: symbol 'perf_get_unmapped_area' was not declared. Should it be static?
   kernel/events/core.c:8297:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8297:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8297:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8384:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8384:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8384:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8488:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8488:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8488:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8490:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8490:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8490:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9178:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9178:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9178:15: sparse:    struct perf_event_context *
   kernel/events/core.c:10313:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10313:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10313:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:10352:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10352:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10352:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:11648:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:13504:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13504:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13504:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13598:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13598:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13598:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13610:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13610:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13610:9: sparse:    struct perf_event_context *
   kernel/events/core.c:14049:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14049:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:14049:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:182:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:198:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1466:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c:2889:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c:4904:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:204:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *src @@
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:193:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c:10166:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10166:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10166:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10186:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10186:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10186:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10302:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10302:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10302:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10302:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10302:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10302:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10302:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10302:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10302:16: sparse:    struct swevent_hlist *

vim +/perf_get_unmapped_area +6788 kernel/events/core.c

  6787	
> 6788	unsigned long perf_get_unmapped_area(struct file *file,
  6789					     unsigned long addr, unsigned long len,
  6790					     unsigned long pgoff, unsigned long flags)
  6791	{
  6792		unsigned long ret = -EINVAL;
  6793		struct perf_event *event = file->private_data;
  6794		unsigned long nr_pages = len / PAGE_SIZE;
  6795	
  6796		pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
  6797			 __func__, addr, len, pgoff, flags, event, event->rb);
  6798	
  6799		if (!event->rb) {
  6800			int flags = RING_BUFFER_WRITABLE;
  6801			struct perf_buffer *rb = NULL;
  6802	
  6803			if (pgoff != 0) {
  6804				ret = -EINVAL;
  6805				goto unlock;
  6806			}
  6807			--nr_pages;
  6808			rb = rb_alloc(nr_pages,
  6809				      event->attr.watermark ? event->attr.wakeup_watermark : 0,
  6810				      event->cpu, flags);
  6811	
  6812			if (!rb) {
  6813				ret = -ENOMEM;
  6814				goto unlock;
  6815			}
  6816			atomic_set(&rb->mmap_count, 1);
  6817			rb->mmap_user = get_current_user();
  6818			rb->mmap_locked = 0;
  6819	
  6820			ring_buffer_attach(event, rb);
  6821	
  6822			perf_event_update_time(event);
  6823			perf_event_init_userpage(event);
  6824			perf_event_update_userpage(event);
  6825		}
  6826		if (event->rb) {
  6827			struct perf_buffer *rb = event->rb;
  6828	
  6829			if (!pgoff) {
  6830				ret = (unsigned long)rb->user_page;
  6831			} else {
  6832				ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
  6833						   event->attr.aux_watermark, flags);
  6834				if (ret < 0)
  6835					goto unlock;
  6836				ret = (unsigned long)rb->data_pages[pgoff - 1];
  6837			}
  6838		}
  6839	unlock:
  6840		pr_debug("%s: ret = 0x%lx\n", __func__, ret);
  6841		return ret;
  6842	}
  6843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
