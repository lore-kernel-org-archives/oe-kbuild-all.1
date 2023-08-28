Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5F812B64
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693234489; x=1724770489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q2Q4rWeNTLzF0xFIwME6J+rQFsaBWYnK4pvCfWRy0AM=;
  b=Gj3mvspnM5N5Q5nbmtJs/7lJh5y/0T4lgX9ZGRUjRDSSUb9VDIFXk5Gr
   iapwvgb5EYcg/3lkIPx+a3o2XXD0bpw78lAbWz5JdEwI/GIQ8rehADOny
   dKgA3diyJfzmUgKa4LUDQ0hfyeOJQvSNZEtRd6VXn3z8vpm42Fq2MqNSv
   rYISMyKuYemFdQfZjUv2aumS8EUTtJBYxGfiGzof6uErjPoqSIket9gIh
   9OLkgE2QpMW8rO9OmAvMtoIMwbP5tMPy4zL7NBjHQdXX6evNT7aDGGxab
   Zf1T/xO+ITs6a1zRcbyY2BTjKlTo/gQqVvooCBekVJ4ypqByuK1lX316X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="354642211"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="354642211"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 07:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803735117"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="803735117"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 07:54:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaddT-0007xv-1f;
	Mon, 28 Aug 2023 14:54:35 +0000
Date: Mon, 28 Aug 2023 22:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 33/34]
 kernel/events/core.c:6583:15: warning: no previous prototype for
 'perf_get_unmapped_area'
Message-ID: <202308282256.sW65iIQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   13c28b8472d4f847e299f266a9f7ef9615205e93
commit: d3664362e60ef00123d4b7af9a34633a034e2e99 [33/34] WIP: perf: support mmapping event on noMMU
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230828/202308282256.sW65iIQJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230828/202308282256.sW65iIQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308282256.sW65iIQJ-lkp@intel.com/

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
