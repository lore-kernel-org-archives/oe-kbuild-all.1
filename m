Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD581C2A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJnIt1Di"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699730454; x=1731266454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7DfZeE0mAH0qB1E0e20V7VxoRiqxMbe0fG5sZ6LZ66A=;
  b=FJnIt1DiYNi8AQO4kk6LifNFvJAdBdWu5+f4WWcxlO5PFZvS/gPxqbHr
   IUMxViB1PuCT2zMROMMzFdeBS80U9NBBNzqBG2GuVxznAycPrQDK6fH5K
   ywTfd6/nomrLlst8tjeJVc3dlIumOgAvDXEZn07ld1UaujkYGonxovLVc
   oEWiu4Ut0YFqUqEPLf0MmcZ9MQx6fRCbYJu7s6q2X848BqPNV6jLrpvxg
   All5ThTEnCLxKY/Uk2gKPyd+80tQOu0nnaRPmNlnLcTZTh5fqKieOSDzB
   oWy0CSAUzS+cxW+ZYq1Im3tKqBg/H0aVJiImmoVGM56VDuWvoH9WZt69r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="8938688"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="8938688"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 11:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="798839137"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="798839137"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Nov 2023 11:20:47 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1tXB-000Ahn-0u;
	Sat, 11 Nov 2023 19:20:45 +0000
Date: Sun, 12 Nov 2023 03:19:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4 v1] livedump: Add memory dumping functionality
Message-ID: <202311120256.zqaXBHnU-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/x86/mm linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Hruska/crash-vmcore-VMCOREINFO-creation-from-non-kdump-kernel/20231111-022332
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20231110150057.15717-4-lhruska%40suse.cz
patch subject: [RFC PATCH 3/4 v1] livedump: Add memory dumping functionality
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231112/202311120256.zqaXBHnU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120256.zqaXBHnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120256.zqaXBHnU-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/livedump/memdump.c: In function 'livedump_memdump_init':
>> kernel/livedump/memdump.c:346:53: error: 'FMODE_EXCL' undeclared (first use in this function); did you mean 'FMODE_EXEC'?
     346 |         memdump_bdev = blkdev_get_by_path(bdevpath, FMODE_EXCL, &memdump_bdev);
         |                                                     ^~~~~~~~~~
         |                                                     FMODE_EXEC
   kernel/livedump/memdump.c:346:53: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/livedump/memdump.c:346:24: error: too few arguments to function 'blkdev_get_by_path'
     346 |         memdump_bdev = blkdev_get_by_path(bdevpath, FMODE_EXCL, &memdump_bdev);
         |                        ^~~~~~~~~~~~~~~~~~
   In file included from kernel/livedump/memdump.c:34:
   include/linux/blkdev.h:1484:22: note: declared here
    1484 | struct block_device *blkdev_get_by_path(const char *path, blk_mode_t mode,
         |                      ^~~~~~~~~~~~~~~~~~
   kernel/livedump/memdump.c:347:26: warning: ordered comparison of pointer with integer zero [-Wextra]
     347 |         if (memdump_bdev < 0)
         |                          ^
   kernel/livedump/memdump.c: In function 'livedump_memdump_uninit':
   kernel/livedump/memdump.c:403:34: error: 'FMODE_EXCL' undeclared (first use in this function); did you mean 'FMODE_EXEC'?
     403 |         blkdev_put(memdump_bdev, FMODE_EXCL);
         |                                  ^~~~~~~~~~
         |                                  FMODE_EXEC
   kernel/livedump/memdump.c: In function 'memdump_thread_func':
   kernel/livedump/memdump.c:298:25: warning: ignoring return value of 'bio_add_page' declared with attribute 'warn_unused_result' [-Wunused-result]
     298 |                         bio_add_page(bio, virt_to_page(req.p), PAGE_SIZE, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/livedump/memdump.c:320:25: warning: ignoring return value of 'bio_add_page' declared with attribute 'warn_unused_result' [-Wunused-result]
     320 |                         bio_add_page(bio, virt_to_page(req.p), PAGE_SIZE, 0);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +346 kernel/livedump/memdump.c

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
   347		if (memdump_bdev < 0)
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
