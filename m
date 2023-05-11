Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB4365
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 00:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683766011; x=1715302011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFLaAricfTchlEl5f/i2Kav433jekhWDTGqlAghOLC0=;
  b=hKo22bffd86V6Mnfz56DZkZf81nZH2ZNoC0Y87gdpAdFxfTuF/br83sj
   GoZCGXZmfkJ4vw96GKghXC8t91auEPanKXPEFDQ1UKRnwouZP10H3qmxA
   FRW6Ym/EYMrKCteYih908J5EedggIbhBzcn0wcDZj9EpKoz2LaM8/rOXw
   ny84va4vY4M9oojFYhyXiHRxclFhgjf71/SbPBO2Hz8RSfxnUrQN+f3JR
   8Nbu1qA9/yLW2n/4+RychWydk3bxnIFjuZFgowjcnh6aqIYDxpoZw8fWS
   qnpeGwWivwjEF4KW66Pw5Ulo5Axde0OhPlb82pjb+0svcjjyeJ+hZSl8g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329976760"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="329976760"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 17:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="811362848"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="811362848"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 May 2023 17:46:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwuSH-0003g9-1k;
	Thu, 11 May 2023 00:46:49 +0000
Date: Thu, 11 May 2023 08:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/core 2/2] drivers/md/bcache/btree.c:596:35:
 error: 'btree_lock_cmp_fn' undeclared; did you mean 'lock_cmp_fn'?
Message-ID: <202305110850.FE7N4lGg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   c9b4ca9414103eefcb5b2fdce5b0238f64768a53
commit: c9b4ca9414103eefcb5b2fdce5b0238f64768a53 [2/2] bcache: Convert to lock_cmp_fn
config: openrisc-randconfig-c032-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110850.FE7N4lGg-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=c9b4ca9414103eefcb5b2fdce5b0238f64768a53
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout c9b4ca9414103eefcb5b2fdce5b0238f64768a53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110850.FE7N4lGg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/bcache/btree.c: In function 'mca_bucket_alloc':
   drivers/md/bcache/btree.c:596:9: error: implicit declaration of function 'lock_set_cmp_fn'; did you mean 'lock_set_class'? [-Werror=implicit-function-declaration]
     596 |         lock_set_cmp_fn(&b->lock, btree_lock_cmp_fn, btree_lock_print_fn);
         |         ^~~~~~~~~~~~~~~
         |         lock_set_class
>> drivers/md/bcache/btree.c:596:35: error: 'btree_lock_cmp_fn' undeclared (first use in this function); did you mean 'lock_cmp_fn'?
     596 |         lock_set_cmp_fn(&b->lock, btree_lock_cmp_fn, btree_lock_print_fn);
         |                                   ^~~~~~~~~~~~~~~~~
         |                                   lock_cmp_fn
   drivers/md/bcache/btree.c:596:35: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/md/bcache/btree.c:596:54: error: 'btree_lock_print_fn' undeclared (first use in this function); did you mean 'lock_print_fn'?
     596 |         lock_set_cmp_fn(&b->lock, btree_lock_cmp_fn, btree_lock_print_fn);
         |                                                      ^~~~~~~~~~~~~~~~~~~
         |                                                      lock_print_fn
   cc1: some warnings being treated as errors


vim +596 drivers/md/bcache/btree.c

   582	
   583	static struct btree *mca_bucket_alloc(struct cache_set *c,
   584					      struct bkey *k, gfp_t gfp)
   585	{
   586		/*
   587		 * kzalloc() is necessary here for initialization,
   588		 * see code comments in bch_btree_keys_init().
   589		 */
   590		struct btree *b = kzalloc(sizeof(struct btree), gfp);
   591	
   592		if (!b)
   593			return NULL;
   594	
   595		init_rwsem(&b->lock);
 > 596		lock_set_cmp_fn(&b->lock, btree_lock_cmp_fn, btree_lock_print_fn);
   597		mutex_init(&b->write_lock);
   598		lockdep_set_novalidate_class(&b->write_lock);
   599		INIT_LIST_HEAD(&b->list);
   600		INIT_DELAYED_WORK(&b->work, btree_node_write_work);
   601		b->c = c;
   602		sema_init(&b->io_mutex, 1);
   603	
   604		mca_data_alloc(b, k, gfp);
   605		return b;
   606	}
   607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
