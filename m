Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B507FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 01:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693271495; x=1724807495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZMcLCEIIfyNYK6bvQuiedGOYZfO6GbEqaGOcItTW3Q=;
  b=BU5awz69LshihCjH24pC6wmCMBD9zqbZH4wwyG9H/Rptb5zxGEhvDwv6
   u5q2bDvkOJhepXuNozRh43tzzNBpYy74P2e+k9MgraCxOoaqY6yiuDAkH
   aI7frd53I0GpGMnIsxJ9Hc7NPOo+l9wuz0lc/fx18GcABya3xtIF6XceU
   E0kTwv5LAXZyWTt4TKERUwWX9HbaumO0350uKo4ZBx1B5vxYF+KkGzyh8
   +NxYWVGpidOYxm8acZfCI/jKPq2sujHhk0UVs1yQZB7BtLyqcy+WUIzKQ
   9xqMvKu+N9U+7gflQ4rthhdEMqmMV+vLTdgzC2kMLJy4kHcLonJwKQXYs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="360251487"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="360251487"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 18:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="688313858"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="688313858"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Aug 2023 18:11:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qanGW-0008FX-1o;
	Tue, 29 Aug 2023 01:11:32 +0000
Date: Tue, 29 Aug 2023 09:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 33/34]
 kernel/events/core.c:6583:15: warning: no previous prototype for
 'perf_get_unmapped_area'
Message-ID: <202308290938.pwz1ilrP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   edbe560c2ce9974f4b2e47ca13050e6a62d604b3
commit: aced503663eb363cb3da0475b133143e486e239f [33/34] WIP: perf: support mmapping event on noMMU
config: s390-randconfig-r012-20230829 (https://download.01.org/0day-ci/archive/20230829/202308290938.pwz1ilrP-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308290938.pwz1ilrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308290938.pwz1ilrP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:6583:15: warning: no previous prototype for 'perf_get_unmapped_area' [-Wmissing-prototypes]
    6583 | unsigned long perf_get_unmapped_area(struct file *file,
         |               ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/events/core.c:6639:17: warning: 'perf_mmap_capabilities' defined but not used [-Wunused-function]
    6639 | static unsigned perf_mmap_capabilities(struct file *file)
         |                 ^~~~~~~~~~~~~~~~~~~~~~


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
> 6639	static unsigned perf_mmap_capabilities(struct file *file)
  6640	{
  6641		return NOMMU_MAP_DIRECT | NOMMU_MAP_READ | NOMMU_MAP_WRITE;
  6642	}
  6643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
