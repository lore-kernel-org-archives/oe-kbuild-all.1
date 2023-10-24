Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11AD7486
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="X2vdk16U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fHeyKtttW0xxio4JmWEM7t7SphyjplWKa1cI7LBp7jg=;
  b=X2vdk16Uz+3/SfvugIa99ZZP96iBBuBtEHA1HNFgvCjXKHC41SuvndLm
   2+EmMbc3YiYuuJN3XHl2ZHd6oPdu4BXr/RKNG809Jjb7aUXunt+j7SfOt
   pBKTv+3s7+W8BL5zKnFX65Whnxls6XgDlZE/ZGUSABhoEQD51F6FTMkk6
   U=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,247,1694728800"; 
   d="scan'208";a="69572936"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 09:30:54 +0200
Date: Tue, 24 Oct 2023 08:30:53 +0100 (WEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Max Filippov <jcmvbkbc@gmail.com>
cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 33/43] kernel/events/core.c:6629:7-10:
 WARNING: Unsigned expression compared with zero: ret     <     0 (fwd)
Message-ID: <c232fe9-458b-24e-3589-e29cad361c7a@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Tue, 24 Oct 2023 13:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 33/43]
    kernel/events/core.c:6629:7-10: WARNING: Unsigned expression compared with
    zero: ret     <     0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   e136b1438e7e7838acc6127c3f1a9200356d7248
commit: 028231d5f2c4db12a43a4c54c45622bb547975be [33/43] WIP: perf: support mmapping event on noMMU
:::::: branch date: 5 days ago
:::::: commit date: 13 days ago
config: x86_64-randconfig-103-20231024 (https://download.01.org/0day-ci/archive/20231024/202310241300.2N1vx69n-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231024/202310241300.2N1vx69n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310241300.2N1vx69n-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/events/core.c:6629:7-10: WARNING: Unsigned expression compared with zero: ret     <     0

vim +6629 kernel/events/core.c

028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6582
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6583  unsigned long perf_get_unmapped_area(struct file *file,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6584  				     unsigned long addr, unsigned long len,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6585  				     unsigned long pgoff, unsigned long flags)
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6586  {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6587  	unsigned long ret = -EINVAL;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6588  	struct perf_event *event = file->private_data;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6589  	unsigned long nr_pages = len / PAGE_SIZE;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6590
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6591  	pr_debug("%s: addr = 0x%lx, len = 0x%lx, pgoff = 0x%lx, flags = 0x%lx, event = %p, event->rb = %p\n",
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6592  		 __func__, addr, len, pgoff, flags, event, event->rb);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6593
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6594  	if (!event->rb) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6595  		int flags = RING_BUFFER_WRITABLE;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6596  		struct perf_buffer *rb = NULL;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6597
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6598  		if (pgoff != 0) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6599  			ret = -EINVAL;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6600  			goto unlock;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6601  		}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6602  		--nr_pages;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6603  		rb = rb_alloc(nr_pages,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6604  			      event->attr.watermark ? event->attr.wakeup_watermark : 0,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6605  			      event->cpu, flags);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6606
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6607  		if (!rb) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6608  			ret = -ENOMEM;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6609  			goto unlock;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6610  		}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6611  		atomic_set(&rb->mmap_count, 1);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6612  		rb->mmap_user = get_current_user();
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6613  		rb->mmap_locked = 0;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6614
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6615  		ring_buffer_attach(event, rb);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6616
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6617  		perf_event_update_time(event);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6618  		perf_event_init_userpage(event);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6619  		perf_event_update_userpage(event);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6620  	}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6621  	if (event->rb) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6622  		struct perf_buffer *rb = event->rb;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6623
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6624  		if (!pgoff) {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6625  			ret = (unsigned long)rb->user_page;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6626  		} else {
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6627  			ret = rb_alloc_aux(rb, event, pgoff, nr_pages,
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6628  					   event->attr.aux_watermark, flags);
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26 @6629  			if (ret < 0)
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6630  				goto unlock;
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6631  			ret = (unsigned long)rb->data_pages[pgoff - 1];
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6632  		}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6633  	}
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6634  unlock:
028231d5f2c4db kernel/events/core.c  Max Filippov   2023-07-26  6635  	pr_debug("%s: ret = 0x%lx\n", __func__, ret);
7b732a75047738 kernel/perf_counter.c Peter Zijlstra 2009-03-23  6636  	return ret;
37d81828385f8f kernel/perf_counter.c Paul Mackerras 2009-03-23  6637  }
37d81828385f8f kernel/perf_counter.c Paul Mackerras 2009-03-23  6638

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
