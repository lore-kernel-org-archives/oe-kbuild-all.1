Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD05134CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 17:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692899441; x=1724435441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ii54Xgap6nKfgKj+3jqxStyCcajeCI1tHDnQ8cOpNes=;
  b=QZ/lpBCF/aKYJD0BzDFcuLffvxde2wCsqwhClBjh18h1se/CNNcT/E35
   /fMoNpFQC+kh6hoUKu5aGxf8XV/yRtHlirRdaYpeACm1E6yJY93dx5vVx
   iSNwXCEQJaMEK2DddHh+H07yZf8EJYzdzgLynsuYS5ytrQl4nCltu6/CA
   7ymLKaAOcX9lam53OkggH+2d/mxYkf0j7N2B3/YQtWepBJGaugY1Hlnvy
   8w7uf3HOlmrIEjiL12LPvc1iniE4WDHdY9tHmXrkP+OUbg/veRBimIqSW
   wwqph0Aa1nb+b5ioTcHjR2c1LwT5pL7xwionJVDQ7tNRWlx1CSW6wDPDk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="377261365"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="377261365"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 10:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880877998"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 10:50:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZETX-0002sk-0f;
	Thu, 24 Aug 2023 17:50:31 +0000
Date: Fri, 25 Aug 2023 01:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Justin Stitt <justinstitt@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] partitions/ibm: refactor deprecated strncpy
Message-ID: <202308250139.GRjOAsEz-lkp@intel.com>
References: <20230823-strncpy-block-partitions-cmdline-ibm-v2-1-40c77f7182fc@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823-strncpy-block-partitions-cmdline-ibm-v2-1-40c77f7182fc@google.com>

Hi Justin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 706a741595047797872e669b3101429ab8d378ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Justin-Stitt/partitions-ibm-refactor-deprecated-strncpy/20230824-052625
base:   706a741595047797872e669b3101429ab8d378ef
patch link:    https://lore.kernel.org/r/20230823-strncpy-block-partitions-cmdline-ibm-v2-1-40c77f7182fc%40google.com
patch subject: [PATCH v2] partitions/ibm: refactor deprecated strncpy
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230825/202308250139.GRjOAsEz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250139.GRjOAsEz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250139.GRjOAsEz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <command-line>:
   block/partitions/ibm.c: In function 'find_label.isra':
   include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_329' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/string.h:281:9: note: in expansion of macro 'BUILD_BUG_ON'
     281 |         BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||                \
         |         ^~~~~~~~~~~~
   block/partitions/ibm.c:114:33: note: in expansion of macro 'strtomem_pad'
     114 |                                 strtomem_pad(type, label->vol.vollbl, 4);
         |                                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_331' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(_dest_len) || _dest_len == (size_t)-1
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/string.h:281:9: note: in expansion of macro 'BUILD_BUG_ON'
     281 |         BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||                \
         |         ^~~~~~~~~~~~
   block/partitions/ibm.c:117:33: note: in expansion of macro 'strtomem_pad'
     117 |                                 strtomem_pad(type, label->lnx.vollbl, 4);
         |                                 ^~~~~~~~~~~~
   block/partitions/ibm.c: In function 'ibm_partition':
>> block/partitions/ibm.c:335:22: warning: 'strncmp' of strings of length 0 and 4 and bound of 4 evaluates to nonzero [-Wstring-compare]
     335 |                 if (!strncmp(type, "VOL1", 4)) {
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/ibm.c:338:29: warning: 'strncmp' of strings of length 0 and 4 and bound of 4 evaluates to nonzero [-Wstring-compare]
     338 |                 } else if (!strncmp(type, "LNX1", 4)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~
   block/partitions/ibm.c:342:29: warning: 'strncmp' of strings of length 0 and 4 and bound of 4 evaluates to nonzero [-Wstring-compare]
     342 |                 } else if (!strncmp(type, "CMS1", 4)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncmp +335 block/partitions/ibm.c

46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  285  
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  286  
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  287  /*
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  288   * This is the main function, called by check.c
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  289   */
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  290  int ibm_partition(struct parsed_partitions *state)
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  291  {
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  292  	int (*fn)(struct gendisk *disk, dasd_information2_t *info);
a08aa9bccdc282 block/partitions/ibm.c Christoph Hellwig 2021-08-10  293  	struct gendisk *disk = state->disk;
a08aa9bccdc282 block/partitions/ibm.c Christoph Hellwig 2021-08-10  294  	struct block_device *bdev = disk->part0;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  295  	int blocksize, res;
97eeb5fc14cc4b block/partitions/ibm.c Christoph Hellwig 2021-10-19  296  	loff_t offset, size;
97eeb5fc14cc4b block/partitions/ibm.c Christoph Hellwig 2021-10-19  297  	sector_t nr_sectors;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  298  	dasd_information2_t *info;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  299  	struct hd_geometry *geo;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  300  	char type[5] = {0,};
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  301  	char name[7] = {0,};
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  302  	sector_t labelsect;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  303  	union label_t *label;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  304  
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  305  	res = 0;
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  306  	if (!disk->fops->getgeo)
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  307  		goto out_exit;
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  308  	fn = symbol_get(dasd_biodasdinfo);
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  309  	blocksize = bdev_logical_block_size(bdev);
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  310  	if (blocksize <= 0)
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  311  		goto out_symbol;
97eeb5fc14cc4b block/partitions/ibm.c Christoph Hellwig 2021-10-19  312  	nr_sectors = bdev_nr_sectors(bdev);
97eeb5fc14cc4b block/partitions/ibm.c Christoph Hellwig 2021-10-19  313  	if (nr_sectors == 0)
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  314  		goto out_symbol;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  315  	info = kmalloc(sizeof(dasd_information2_t), GFP_KERNEL);
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  316  	if (info == NULL)
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  317  		goto out_symbol;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  318  	geo = kmalloc(sizeof(struct hd_geometry), GFP_KERNEL);
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  319  	if (geo == NULL)
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  320  		goto out_nogeo;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  321  	label = kmalloc(sizeof(union label_t), GFP_KERNEL);
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  322  	if (label == NULL)
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  323  		goto out_nolab;
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  324  	/* set start if not filled by getgeo function e.g. virtblk */
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  325  	geo->start = get_start_sect(bdev);
26d7e28e38206b block/partitions/ibm.c Stefan Haberland  2020-05-19  326  	if (disk->fops->getgeo(bdev, geo))
57881dd9df40b7 fs/partitions/ibm.c    Suzuki K P        2006-12-06  327  		goto out_freeall;
7370997d48520a block/partitions/ibm.c Christoph Hellwig 2020-10-07  328  	if (!fn || fn(disk, info)) {
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  329  		kfree(info);
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  330  		info = NULL;
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  331  	}
57881dd9df40b7 fs/partitions/ibm.c    Suzuki K P        2006-12-06  332  
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  333  	if (find_label(state, info, geo, blocksize, &labelsect, name, type,
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31  334  		       label)) {
46e8894786327c block/partitions/ibm.c Stefan Weinhuber  2012-08-31 @335  		if (!strncmp(type, "VOL1", 4)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
