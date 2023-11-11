Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E2E14F67
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4HOLePf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699715280; x=1731251280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k4wNT45EiqYCDmoRJ5KNwPc4tnUFqoPjXfiI7XFF5tA=;
  b=d4HOLePfuBqSUp/PaRFuFQHlwNqshd0upzaGY/1Ff4rNwGY2Bkap5018
   ti7KzzCQne5UXRB7nE0lmT4xkFzn9eUhBDCicLLcJP3qxPFLssUJPhAlX
   zaMN4uDSg+gmcWQgJ1wzCLOrwja8SDhrduxHutXNo/KMZv61QgmFs5hDV
   J8Yx0TwlRVPYJrcoOlxBfILctyOnQNCfcPvfDq09fn3HC2fxsWcF9l9BV
   kVRqU+FEecLEVdcVrmAcUTV04Y1il6wv0aPzlRkkbg7arW07Ntaj1rgAu
   yFaxGqSooKPZN3aakZ1i8iAC88S3j/lww/psFc8QyJuInWiot4JNVuJ1v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="11830888"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="11830888"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 07:07:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="11685563"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2023 07:07:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1paT-000AWy-0t;
	Sat, 11 Nov 2023 15:07:53 +0000
Date: Sat, 11 Nov 2023 23:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4 v1] livedump: Add memory dumping functionality
Message-ID: <202311112220.byee3qTQ-lkp@intel.com>
References: <20231110150057.15717-4-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110150057.15717-4-lhruska@suse.cz>

Hi Lukas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/x86/mm linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Hruska/crash-vmcore-VMCOREINFO-creation-from-non-kdump-kernel/20231111-022332
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231110150057.15717-4-lhruska%40suse.cz
patch subject: [RFC PATCH 3/4 v1] livedump: Add memory dumping functionality
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311112220.byee3qTQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311112220.byee3qTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311112220.byee3qTQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livedump/memdump.c: In function 'livedump_memdump_init':
   kernel/livedump/memdump.c:346:53: error: 'FMODE_EXCL' undeclared (first use in this function); did you mean 'FMODE_EXEC'?
     346 |         memdump_bdev = blkdev_get_by_path(bdevpath, FMODE_EXCL, &memdump_bdev);
         |                                                     ^~~~~~~~~~
         |                                                     FMODE_EXEC
   kernel/livedump/memdump.c:346:53: note: each undeclared identifier is reported only once for each function it appears in
   kernel/livedump/memdump.c:346:24: error: too few arguments to function 'blkdev_get_by_path'
     346 |         memdump_bdev = blkdev_get_by_path(bdevpath, FMODE_EXCL, &memdump_bdev);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from kernel/livedump/memdump.c:34:
   include/linux/blkdev.h:1484:22: note: declared here
    1484 | struct block_device *blkdev_get_by_path(const char *path, blk_mode_t mode,
         |                      ^~~~~~~~~~~~~~~~~~
>> kernel/livedump/memdump.c:347:26: warning: ordered comparison of pointer with integer zero [-Wextra]
     347 |         if (memdump_bdev < 0)
         |                          ^
   kernel/livedump/memdump.c: In function 'livedump_memdump_uninit':
   kernel/livedump/memdump.c:403:34: error: 'FMODE_EXCL' undeclared (first use in this function); did you mean 'FMODE_EXEC'?
     403 |         blkdev_put(memdump_bdev, FMODE_EXCL);
         |                                  ^~~~~~~~~~
         |                                  FMODE_EXEC
   kernel/livedump/memdump.c: In function 'memdump_thread_func':
>> kernel/livedump/memdump.c:298:25: warning: ignoring return value of 'bio_add_page' declared with attribute 'warn_unused_result' [-Wunused-result]
     298 |                         bio_add_page(bio, virt_to_page(req.p), PAGE_SIZE, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/livedump/memdump.c:320:25: warning: ignoring return value of 'bio_add_page' declared with attribute 'warn_unused_result' [-Wunused-result]
     320 |                         bio_add_page(bio, virt_to_page(req.p), PAGE_SIZE, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +347 kernel/livedump/memdump.c

   277	
   278	static int memdump_thread_func(void *_)
   279	{
   280		struct bio *bio;
   281		struct memdump_request req;
   282	
   283		do {
   284			/* Process request */
   285			while (kfifo_get(&memdump_req_queue.pend, &req)) {
   286				bio = bio_alloc(memdump_bdev, 1, REQ_OP_WRITE, GFP_KERNEL);
   287	
   288				if (WARN_ON(!bio)) {
   289					spin_lock(&memdump_req_queue.pool_w_lock);
   290					kfifo_put(&memdump_req_queue.pool, req);
   291					spin_unlock(&memdump_req_queue.pool_w_lock);
   292					continue;
   293				}
   294	
   295				bio->bi_bdev = memdump_bdev;
   296				bio->bi_end_io = memdump_endio;
   297				bio->bi_iter.bi_sector = req.pfn << (PAGE_SHIFT - SECTOR_SHIFT);
 > 298				bio_add_page(bio, virt_to_page(req.p), PAGE_SIZE, 0);
   299	
   300				trace_memdump_bio_submit(memdump_bdev, req.pfn);
   301	
   302				submit_bio(bio);
   303			}
   304	
   305			/* Process request for sweep*/
   306			while (kfifo_get(&memdump_req_queue_for_sweep.pend, &req)) {
   307				bio = bio_alloc(memdump_bdev, 1, REQ_OP_WRITE, GFP_KERNEL);
   308	
   309				if (WARN_ON(!bio)) {
   310					spin_lock(&memdump_req_queue_for_sweep.pool_w_lock);
   311					kfifo_put(&memdump_req_queue_for_sweep.pool, req);
   312					spin_unlock(&memdump_req_queue_for_sweep.pool_w_lock);
   313					continue;
   314				}
   315	
   316				bio->bi_bdev = memdump_bdev;
   317				bio->bi_end_io = memdump_endio;
   318				bio->bi_iter.bi_sector = req.pfn << (PAGE_SHIFT - SECTOR_SHIFT);
   319				bio->bi_private = (void *)1; /* for sweep */
   320				bio_add_page(bio, virt_to_page(req.p), PAGE_SIZE, 0);
   321	
   322				trace_memdump_bio_submit(memdump_bdev, req.pfn);
   323	
   324				submit_bio(bio);
   325			}
   326	
   327			msleep(20);
   328		} while (memdump_thread.is_active);
   329	
   330		complete(&memdump_thread.completion);
   331		return 0;
   332	}
   333	
   334	static int select_pages(void);
   335	
   336	int livedump_memdump_init(const char *bdevpath)
   337	{
   338		long ret;
   339	
   340		if (WARN(!memdump_state_transit(MEMDUMP_INACTIVE),
   341					"livedump: memdump is already initialized.\n"))
   342			return -EBUSY;
   343	
   344		/* Get bdev */
   345		ret = -ENOENT;
 > 346		memdump_bdev = blkdev_get_by_path(bdevpath, FMODE_EXCL, &memdump_bdev);
 > 347		if (memdump_bdev < 0)
   348			goto err;
   349	
   350		/* Allocate request queue */
   351		ret = alloc_req_queue();
   352		if (ret)
   353			goto err_bdev;
   354	
   355		/* Start thread */
   356		ret = start_memdump_thread();
   357		if (ret)
   358			goto err_freeq;
   359	
   360		/* Select target pages */
   361		select_pages();
   362	
   363		/* Allocate space for vmcore info */
   364		vmcoreinfo = vmalloc(PAGE_SIZE);
   365		cmem = vzalloc(struct_size(cmem, ranges, 1));
   366		if (WARN_ON(!vmcoreinfo || !cmem))
   367			return -ENOMEM;
   368	
   369		memdump_state_transit(MEMDUMP_ACTIVATING); /* always succeeds */
   370		return 0;
   371	
   372	err_freeq:
   373		free_req_queue();
   374	err_bdev:
   375		blkdev_put(memdump_bdev, FMODE_EXCL);
   376	err:
   377		memdump_state_transit_back();
   378		return ret;
   379	}
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
