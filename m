Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0101DFC7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gis09WXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699536411; x=1731072411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NdquBNMUbaKTIJL0FMWidc/kyhclEE6PjLLzV2+dMX8=;
  b=Gis09WXcaOOB/xtP8IYvv2SL8VDlFzkoeQ/c5plYRhraNK3jf4X19+lI
   o4BfkXIK2nVuMhUSSUuxxttlaqMcN6G66hOa0uyjCRJvZlGYIuHcY+d+B
   igXSWT11Ug+rLLvz1GPCxDsyPSABANSI2xDq60eKOBfntRMHnX4ZJ+1aA
   AQgebQeUslC1tECC9HoasemIDfYprEX7iEYv6W+U59zy4981TiXwhOvEd
   uwGo3dnjEpBbxHFnsW/AdEFkhyf+2qiqxSjE6tQCQITyW2VCoq+/j8s0Z
   L3sKif2VzfKe7zo415Kv/c8gxz7AtX+9FuyRlSU/9XrHXwu+Z3dQRI6jt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="392851523"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="392851523"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 05:26:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1010629417"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="1010629417"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2023 05:26:49 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r153X-0008k7-2e;
	Thu, 09 Nov 2023 13:26:47 +0000
Date: Thu, 9 Nov 2023 21:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 33/43]
 kernel/events/core.c:6583:15: sparse: sparse: symbol
 'perf_get_unmapped_area' was not declared. Should it be static?
Message-ID: <202311092113.55cKzD0N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   e136b1438e7e7838acc6127c3f1a9200356d7248
commit: 028231d5f2c4db12a43a4c54c45622bb547975be [33/43] WIP: perf: support mmapping event on noMMU
config: i386-randconfig-063-20231019 (https://download.01.org/0day-ci/archive/20231109/202311092113.55cKzD0N-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311092113.55cKzD0N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092113.55cKzD0N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1375:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1375:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1375:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1388:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1388:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1388:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3460:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3460:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3460:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3464:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3464:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3464:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3465:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3465:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3465:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3514:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3514:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3515:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3515:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3515:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3914:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3914:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3914:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4306:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4306:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4306:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4785:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4785:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4785:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6165:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6165:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6165:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5637:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:5881:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5881:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5881:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6005:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6005:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6005:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6038:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6038:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6038:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6095:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6095:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6095:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6186:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6186:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6186:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6202:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6202:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6202:14: sparse:    struct perf_buffer *
>> kernel/events/core.c:6583:15: sparse: sparse: symbol 'perf_get_unmapped_area' was not declared. Should it be static?
   kernel/events/core.c:8010:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8010:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8010:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8097:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8097:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8097:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8201:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8201:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8201:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8203:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8203:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8203:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8891:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8891:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8891:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9931:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9931:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9931:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9970:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9970:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9970:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10244:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10244:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10244:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11357:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:13098:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13098:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13098:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13192:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13192:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13192:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13204:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13204:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13204:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13625:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13625:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13625:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:162:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:170:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1422:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2775:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:4759:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:209:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'perf_get_pgtable_size' - unexpected unlock
   kernel/events/core.c:9780:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9780:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9780:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9800:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9800:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9800:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9920:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9920:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9920:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9920:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9920:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9920:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9920:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9920:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9920:16: sparse:    struct swevent_hlist *

vim +/perf_get_unmapped_area +6583 kernel/events/core.c

  6582	
> 6583	unsigned long perf_get_unmapped_area(struct file *file,
  6584					     unsigned long addr, unsigned long len,
  6585					     unsigned long pgoff, unsigned long flags)
  6586	{
  6587		unsigned long ret = -EINVAL;
  6588		struct perf_event *event = file->private_data;
  6589		unsigned long nr_pages = len / PAGE_SIZE;
  6590	
  6591		pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
  6592			 __func__, addr, len, pgoff, flags, event, event->rb);
  6593	
  6594		if (!event->rb) {
  6595			int flags = RING_BUFFER_WRITABLE;
  6596			struct perf_buffer *rb = NULL;
  6597	
  6598			if (pgoff != 0) {
  6599				ret = -EINVAL;
  6600				goto unlock;
  6601			}
  6602			--nr_pages;
  6603			rb = rb_alloc(nr_pages,
  6604				      event->attr.watermark ? event->attr.wakeup_watermark : 0,
  6605				      event->cpu, flags);
  6606	
  6607			if (!rb) {
  6608				ret = -ENOMEM;
  6609				goto unlock;
  6610			}
  6611			atomic_set(&rb->mmap_count, 1);
  6612			rb->mmap_user = get_current_user();
  6613			rb->mmap_locked = 0;
  6614	
  6615			ring_buffer_attach(event, rb);
  6616	
  6617			perf_event_update_time(event);
  6618			perf_event_init_userpage(event);
  6619			perf_event_update_userpage(event);
  6620		}
  6621		if (event->rb) {
  6622			struct perf_buffer *rb = event->rb;
  6623	
  6624			if (!pgoff) {
  6625				ret = (unsigned long)rb->user_page;
  6626			} else {
  6627				ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
  6628						   event->attr.aux_watermark, flags);
  6629				if (ret < 0)
  6630					goto unlock;
  6631				ret = (unsigned long)rb->data_pages[pgoff - 1];
  6632			}
  6633		}
  6634	unlock:
  6635		pr_debug("%s: ret = 0x%lx\n", __func__, ret);
  6636		return ret;
  6637	}
  6638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
