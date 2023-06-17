Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC10279EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687016619; x=1718552619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rZ0WEa0JpD303vcIq/buFr0a8+EuBmoLDEZjHluurPQ=;
  b=JRz/d7JVcmLN/mr4eAWxo6A7PmrvArZge7gluRue2zMj6WaBBA4lv8CC
   y9hXnLi0RWZ1FpDyxU3/bn0VfY48cp1rs5ZKBgGIOSTn2viEJgIey/9Ca
   ES9apVH+UfNo0KXzfJlgJ0SYnsXi3eqSzW8RwGUxxls5nNKWXwtHeJiWD
   I6f4uSQ5vBPeR/5I89PA2p3RiVx3k47i1DLSpDE5EXlXAoRHXC3JDG6jk
   gV1CfuIQVXCJkYKeDnA6jyvy4ILoRJGnihGUxVTsshCgCelRP8iXPspgC
   CcRkLvIHtUYFARiRkAPPiFeaGKqLJSQh9jCs2Jmcp5Cg6AD2qrsZ69Ezj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="358272247"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="358272247"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 08:43:38 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="746792221"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="746792221"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jun 2023 08:43:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAY5Q-0002rQ-2m;
	Sat, 17 Jun 2023 15:43:36 +0000
Date: Sat, 17 Jun 2023 23:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-20230617-hacks 44/45] block/bdev.c:140:47:
 error: 'struct block_device' has no member named 'bd_buffer_head_mounted'
Message-ID: <202306172356.7Ap7UmF6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230617-hacks
head:   87ea751f68b5bc03c4c3491b5cab898765002565
commit: b1bd39924b170a4c910626be18f732385e206f2a [44/45] bdev: make iomap aops default and allow to switch
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230617/202306172356.7Ap7UmF6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172356.7Ap7UmF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306172356.7Ap7UmF6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/bug.h:159,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from block/bdev.c:9:
   block/bdev.c: In function 'set_init_blocksize':
>> block/bdev.c:140:47: error: 'struct block_device' has no member named 'bd_buffer_head_mounted'
     140 |                 WARN_ON_ONCE(atomic_read(&bdev->bd_buffer_head_mounted) != 0);
         |                                               ^~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~


vim +140 block/bdev.c

   124	
   125	static void set_init_blocksize(struct block_device *bdev)
   126	{
   127		unsigned int bsize = bdev_logical_block_size(bdev);
   128		loff_t size = i_size_read(bdev->bd_inode);
   129		int order, folio_order;
   130	
   131		while (bsize < PAGE_SIZE) {
   132			if (size & bsize)
   133				break;
   134			bsize <<= 1;
   135		}
   136		bdev->bd_inode->i_blkbits = blksize_bits(bsize);
   137		order = bdev->bd_inode->i_blkbits - PAGE_SHIFT;
   138		folio_order = mapping_min_folio_order(bdev->bd_inode->i_mapping);
   139		if (order > 0 && folio_order == 0) {
 > 140			WARN_ON_ONCE(atomic_read(&bdev->bd_buffer_head_mounted) != 0);
   141			mapping_set_min_folio_order(bdev->bd_inode->i_mapping, order);
   142			bdev->bd_inode->i_data.a_ops = &def_blk_aops_iomap;
   143		}
   144	}
   145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
