Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FF3288D1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 03:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725592384; cv=none; b=pE9jUI5m1F1P8pCLwiZoy0DQsXtgkTUFqLXjRsuxNKU5FEoLDnIPdGvwdsNNxudTWm0eNy7DROBW6T3EHgq4N3Fvhbent72o+uIGfQmvx/EzogNEu14C9MLzxkEkcWVpnFgopwVEvhU0ZyubAHCB9dV5jcJQeE0YF9ujWDXq2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725592384; c=relaxed/simple;
	bh=63YUgw12tUr0wQQxWmESufbkw6lTV8lnt4An6MTY+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sxlYv4xpRXxvdLL+/S9QSACnFKl0CQuShEbxop7Vl//xeZMUCMpse1iBjfdkUOP/5hhaZGyV0Ul77CyueoE718c8uTGZMGf5kmCRScQW2pZU6QLKqZ4b3qs2zMABuOylIol4k3JIRO8C6SaMn3iM5XDDyEBO3O2SRpKI0Q/0EYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFagDSEN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFagDSEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725592382; x=1757128382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63YUgw12tUr0wQQxWmESufbkw6lTV8lnt4An6MTY+ko=;
  b=PFagDSENuks0HLyGRDGFfVbIUiR2hujZhUFwXL2aNPtB+uyCrR0GYO+T
   +k9IJnosvseoGV0i3hXC0M8kNH9q0TVuE8b+xXlTUJhJv/XIJzI2YfdE7
   ctsV7FPmX7OX9RSUSneTqN5ni6Az+a8SMRJ3kgiYnOAlthxfKDumhDM4o
   BrKxZyKvX/lGCYR1j0pF6iXLNNPANP+h+9xbaBOm9nTuEaSXb1YQAMWMP
   IPJD8gDHRB5/vADow4ebQYp65i4fZ121MorprY3aVsRyN3ITq3SE3Wbey
   rjyetocyS7ZWggtHjDaUjzAtHCCmdBWmMHo4FCKTMxfnxbQ3Lb79F/Aha
   w==;
X-CSE-ConnectionGUID: Xz0crAs5R7q5o6WXGs+psQ==
X-CSE-MsgGUID: LCgO0HlySz+TQZp5r5hDAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41823302"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="41823302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 20:13:02 -0700
X-CSE-ConnectionGUID: GKTy7Zi1Q++MuHOL8KkwhA==
X-CSE-MsgGUID: sYyC2VCuSI6fwnvP/ez0WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="70624967"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2024 20:13:01 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smPP8-000AYF-0u;
	Fri, 06 Sep 2024 03:12:58 +0000
Date: Fri, 6 Sep 2024 11:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 50/53]
 kernel/events/core.c:6702:15: sparse: sparse: symbol
 'perf_get_unmapped_area' was not declared. Should it be static?
Message-ID: <202409061100.XcIbHXss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: 32453b48969a9a1bb7026e6035c13ce6e1245455 [50/53] WIP: perf: support mmapping event on noMMU
config: x86_64-randconfig-123-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061100.XcIbHXss-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061100.XcIbHXss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061100.XcIbHXss-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1386:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1386:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1386:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1399:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1399:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1399:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3492:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3492:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3492:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3496:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3496:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3496:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3497:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3497:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3497:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3546:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3546:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3546:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3547:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3547:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3547:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3935:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3935:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3935:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4343:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4343:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4343:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4834:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4834:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4834:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6282:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6282:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6282:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5754:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:5998:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5998:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5998:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6122:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6122:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6122:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6155:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6155:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6155:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6212:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6212:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6212:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6303:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6303:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6303:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6319:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6319:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6319:14: sparse:    struct perf_buffer *
>> kernel/events/core.c:6702:15: sparse: sparse: symbol 'perf_get_unmapped_area' was not declared. Should it be static?
   kernel/events/core.c:8141:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8141:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8141:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8228:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8228:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8228:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8332:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8332:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8332:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8334:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8334:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8334:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9022:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9022:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9022:15: sparse:    struct perf_event_context *
   kernel/events/core.c:10151:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10151:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10151:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:10190:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10190:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10190:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10464:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10464:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10464:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11486:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:13253:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13253:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13253:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13347:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13347:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13347:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13359:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13359:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13359:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13783:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13783:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13783:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:162:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:170:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:867:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1433:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2801:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:4808:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:209:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:191:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:869:25: sparse: sparse: context imbalance in 'perf_get_pgtable_size' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c:10004:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10004:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10004:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10024:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10024:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10024:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10140:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10140:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10140:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10140:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10140:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10140:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10140:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10140:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10140:16: sparse:    struct swevent_hlist *

vim +/perf_get_unmapped_area +6702 kernel/events/core.c

  6701	
> 6702	unsigned long perf_get_unmapped_area(struct file *file,
  6703					     unsigned long addr, unsigned long len,
  6704					     unsigned long pgoff, unsigned long flags)
  6705	{
  6706		unsigned long ret = -EINVAL;
  6707		struct perf_event *event = file->private_data;
  6708		unsigned long nr_pages = len / PAGE_SIZE;
  6709	
  6710		pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
  6711			 __func__, addr, len, pgoff, flags, event, event->rb);
  6712	
  6713		if (!event->rb) {
  6714			int flags = RING_BUFFER_WRITABLE;
  6715			struct perf_buffer *rb = NULL;
  6716	
  6717			if (pgoff != 0) {
  6718				ret = -EINVAL;
  6719				goto unlock;
  6720			}
  6721			--nr_pages;
  6722			rb = rb_alloc(nr_pages,
  6723				      event->attr.watermark ? event->attr.wakeup_watermark : 0,
  6724				      event->cpu, flags);
  6725	
  6726			if (!rb) {
  6727				ret = -ENOMEM;
  6728				goto unlock;
  6729			}
  6730			atomic_set(&rb->mmap_count, 1);
  6731			rb->mmap_user = get_current_user();
  6732			rb->mmap_locked = 0;
  6733	
  6734			ring_buffer_attach(event, rb);
  6735	
  6736			perf_event_update_time(event);
  6737			perf_event_init_userpage(event);
  6738			perf_event_update_userpage(event);
  6739		}
  6740		if (event->rb) {
  6741			struct perf_buffer *rb = event->rb;
  6742	
  6743			if (!pgoff) {
  6744				ret = (unsigned long)rb->user_page;
  6745			} else {
  6746				ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
  6747						   event->attr.aux_watermark, flags);
  6748				if (ret < 0)
  6749					goto unlock;
  6750				ret = (unsigned long)rb->data_pages[pgoff - 1];
  6751			}
  6752		}
  6753	unlock:
  6754		pr_debug("%s: ret = 0x%lx\n", __func__, ret);
  6755		return ret;
  6756	}
  6757	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
