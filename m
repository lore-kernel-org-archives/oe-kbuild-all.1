Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B780D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 05:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691473143; x=1723009143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zvh3GrhGVGze02H35SyAwQhxIFSYBYD+uXq7ouiiNvE=;
  b=WOB8Nq/ghYe7mPwOrlABfPfv36xro55r5YaM47IkyYYix7Rd3kvj0zy0
   XakW59mxk4Cwot14KKH6kcdpoPMnCkleduR/zpYfSEjAzeMiFDjBDTDZ9
   PepFK4mvFzy2y86kMUGlkYxBwZCr1nqhxtR9HAdAaRA8fUfWNhnklcKOY
   1HkCqhoEjzBgm08iormiWobUlkYuP1WViLrfFIGboe4JAqH/2jZBdbTTq
   5p7oC3/79RXuLk5r+tZKtWN563gIbQZXCd+d5M67unncaS8Ypr4jNEReg
   XdXGtub6sV8u2j/gHVD/b8inqUw5QUNPoY4jWUhMMTNSYwHR+Z4sG4IqC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="360814177"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="360814177"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 22:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061865298"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; 
   d="scan'208";a="1061865298"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Aug 2023 22:38:48 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTFQd-000580-19;
	Tue, 08 Aug 2023 05:38:47 +0000
Date: Tue, 8 Aug 2023 13:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:remove-get_super 20/24] block/bdev.c:992:19: error:
 'bdev_nofify_remove' undeclared here (not in a function)
Message-ID: <202308081347.Pg4GvFy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git remove-get_super
head:   01044435dc8ba87950775ad622b44bffb114844f
commit: 4eeb8f3473c90b2a4b6a2e7c45f039febdeaf273 [20/24] block: refactor the __invalidate_device logic
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230808/202308081347.Pg4GvFy0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081347.Pg4GvFy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308081347.Pg4GvFy0-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/bdev.c: In function 'bdev_mark_dead':
   block/bdev.c:966:13: warning: variable 'res' set but not used [-Wunused-but-set-variable]
     966 |         int res = 0;
         |             ^~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/s390/include/asm/bug.h:69,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from block/bdev.c:9:
   block/bdev.c: At top level:
>> block/bdev.c:992:19: error: 'bdev_nofify_remove' undeclared here (not in a function)
     992 | EXPORT_SYMBOL_GPL(bdev_nofify_remove);
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/export.h:74:23: note: in definition of macro '__EXPORT_SYMBOL'
      74 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/linux/export.h:87:41: note: in expansion of macro '_EXPORT_SYMBOL'
      87 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   block/bdev.c:992:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     992 | EXPORT_SYMBOL_GPL(bdev_nofify_remove);
         | ^~~~~~~~~~~~~~~~~


vim +/bdev_nofify_remove +992 block/bdev.c

   962	
   963	void bdev_mark_dead(struct block_device *bdev, bool surprise)
   964	{
   965		struct super_block *sb = get_super(bdev);
   966		int res = 0;
   967	
   968		if (sb) {
   969			if (!surprise)
   970				sync_filesystem(sb);
   971			/*
   972			 * no need to lock the super, get_super holds the
   973			 * read mutex so the filesystem cannot go away
   974			 * under us (->put_super runs with the write lock
   975			 * hold).
   976			 */
   977			shrink_dcache_sb(sb);
   978			res = invalidate_inodes(sb, true);
   979			drop_super(sb);
   980		} else {
   981			if (!surprise)
   982				sync_blockdev(bdev);
   983		}
   984		invalidate_bdev(bdev);
   985	}
   986	#ifdef CONFIG_DASD
   987	/*
   988	 * Drivers should not use this directly, but the DASD driver has a weird
   989	 * shutdown to offline mode that doesn't actually remove the gendisk
   990	 * that otherwise looks a lot like a safe device removal.
   991	 */
 > 992	EXPORT_SYMBOL_GPL(bdev_nofify_remove);
   993	#endif
   994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
