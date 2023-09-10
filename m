Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B41C3F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 22:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694385513; x=1725921513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WzBjukuJt4LMbxaHpUYO58KiOn/3vDch9dev3DMmh+8=;
  b=VsSRT4c3HBeVY5AMhRyevZAW8pWQLljXf2imrOajgN5bsMvyx1KQX7Uk
   DCrCnelS8t3Q8fBFEuryM1ZG1l3WRr9mIv4PT9WZW+MIOC6y+k+sW26YR
   zDbuBendSd8FTQ7LOJVMqDYnImN6rSpBHwH3CXvT6DaWi5B8nlNOWPdbH
   nMsqOKH8N+9TDUhybxqpV8T9zfu1y2JFM/pntS0mgP1FwKU5R5MBGyhT6
   /47qxupGdei1Bskh1QibEwkhPaPfZ1PL+ORnvALYxbg9ZWy4EDCbMuI16
   XQSDLUpuaGhooXtDzm2gm5kWrJpiDFgYytvUcPUAHSdXX+iEnATHZ03QU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="358231259"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="358231259"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 15:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="746200319"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="746200319"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Sep 2023 15:38:31 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfT4X-0005Vs-1u;
	Sun, 10 Sep 2023 22:38:29 +0000
Date: Mon, 11 Sep 2023 06:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-esp32 35/36] kernel/events/core.c:6629
 perf_get_unmapped_area() warn: unsigned 'ret' is never less than zero.
Message-ID: <202309110617.gLD9VOs0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-esp32
head:   6497b8ba138880f5f4a44ec7315b57ccaca7200c
commit: fed5ff883d40df4789e87c3b8b9476cb70f595e6 [35/36] WIP: perf: support mmapping event on noMMU
config: i386-randconfig-141-20230910 (https://download.01.org/0day-ci/archive/20230911/202309110617.gLD9VOs0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230911/202309110617.gLD9VOs0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110617.gLD9VOs0-lkp@intel.com/

smatch warnings:
kernel/events/core.c:6629 perf_get_unmapped_area() warn: unsigned 'ret' is never less than zero.

vim +/ret +6629 kernel/events/core.c

  6582	
  6583	unsigned long perf_get_unmapped_area(struct file *file,
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
> 6629				if (ret < 0)
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
