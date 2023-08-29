Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7407414AAF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 21:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693345735; x=1724881735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y0UXN5ycaPBVB5FbZ8W8nZZlOB+mawKdgswjS4A9tck=;
  b=hliXghxlq7P3UGuWe3KdaTJrI44hTKkAaKY8NjpYo+1rVH1zyuKe8Hde
   iJ4ypiAA8UJHlArMP202xiO56gAL7y9VbLoGAmJfTYccWlIb21efIuRqQ
   6DwBZ3tajvgwUMDe8lTG3rRoSNd7IFwA5d7hEdP4/ZRK3bpeR/4T3d04g
   GceVGWt59mU+cXXUn9jnj6yskBS8dcOdvF9AhX2uxGtyr3B+HJ+GrcCGV
   X1Z6awBx2ZVP0ARkH0Nedi1t60+P5ZZO8hQXCtbZTnJ6EPdPo3BbCMBx3
   rf51k3Fuabh2OxbyjDiqV7pGdBtxPwkTvVUyjyfHTlDhvQi2k1UeT3iQ4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406483031"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="406483031"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 14:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804275995"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="804275995"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2023 14:48:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb6Zw-00096x-2J;
	Tue, 29 Aug 2023 21:48:52 +0000
Date: Wed, 30 Aug 2023 05:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-super-mtd 51/51]
 drivers/mtd/mtdsuper.c:33:(.text.mtd_get_sb+0x3c): undefined reference to
 `sget_dev'
Message-ID: <202308300543.McGF5apr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-super-mtd
head:   a115996e417a9245d3f9974b94f649479ad76f99
commit: a115996e417a9245d3f9974b94f649479ad76f99 [51/51] mtd: key superblock by device number
config: riscv-randconfig-r025-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300543.McGF5apr-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300543.McGF5apr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300543.McGF5apr-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/mtd/mtdsuper.o: in function `.L0 ':
>> drivers/mtd/mtdsuper.c:33:(.text.mtd_get_sb+0x3c): undefined reference to `sget_dev'


vim +33 drivers/mtd/mtdsuper.c

    21	
    22	/*
    23	 * get a superblock on an MTD-backed filesystem
    24	 */
    25	static int mtd_get_sb(struct fs_context *fc,
    26			      struct mtd_info *mtd,
    27			      int (*fill_super)(struct super_block *,
    28						struct fs_context *))
    29	{
    30		struct super_block *sb;
    31		int ret;
    32	
  > 33		sb = sget_dev(fc, MKDEV(MTD_BLOCK_MAJOR, mtd->index));
    34		if (IS_ERR(sb))
    35			return PTR_ERR(sb);
    36	
    37		if (sb->s_root) {
    38			/* new mountpoint for an already mounted superblock */
    39			pr_debug("MTDSB: Device %d (\"%s\") is already mounted\n",
    40				 mtd->index, mtd->name);
    41			put_mtd_device(mtd);
    42		} else {
    43			/* fresh new superblock */
    44			pr_debug("MTDSB: New superblock for device %d (\"%s\")\n",
    45				 mtd->index, mtd->name);
    46	
    47			/*
    48			 * Would usually have been set with @sb_lock held but in
    49			 * contrast to sb->s_bdev that's checked with only
    50			 * @sb_lock held, nothing checks sb->s_mtd without also
    51			 * holding sb->s_umount and we're holding sb->s_umount
    52			 * here.
    53			 */
    54			sb->s_mtd = mtd;
    55			sb->s_bdi = bdi_get(mtd_bdi);
    56	
    57			ret = fill_super(sb, fc);
    58			if (ret < 0)
    59				goto error_sb;
    60	
    61			sb->s_flags |= SB_ACTIVE;
    62		}
    63	
    64		BUG_ON(fc->root);
    65		fc->root = dget(sb->s_root);
    66		return 0;
    67	
    68	error_sb:
    69		deactivate_locked_super(sb);
    70		return ret;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
