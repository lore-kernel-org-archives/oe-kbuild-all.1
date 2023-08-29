Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5B82F58
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 22:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693348325; x=1724884325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EOi77pxYG70+QMkJx1JUGg7xq2aLNkfmnRkzk3BufAo=;
  b=QT+b1IlwEpIkTdoAuz1TNq4gckzruLXHV4DPXj/opakTWp6BbfTj5rAX
   KjGDYrSG42/cUtRrbtkBql0IKrWjcP0y4uKSSO0XdeUT/sF1cx6y/UgUe
   eF9B230zK+Zp8ExPiMXuy897saYAFtYM7N/sguoDQi3dfQk47MWqyfxJ3
   8cdrkv9CtShodv81s8neYRpI8lvcenH1mcImPDQVl6exlHq2Nr+GzcEKw
   /7b6Pbu0VtUS+g57T0fCo+jXiXMYW1ENAjXFmNJt+aVDcIQeHFSesb3or
   3QCUgpLzNdIpZ9c0zhbQm5peh1UFwAJ7i3uE7MCuWCYiN4uvXQ2eXPytz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="372905005"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="372905005"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 15:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912561977"
X-IronPort-AV: E=Sophos;i="6.02,211,1688454000"; 
   d="scan'208";a="912561977"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Aug 2023 15:32:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qb7Fg-00099K-0f;
	Tue, 29 Aug 2023 22:32:00 +0000
Date: Wed, 30 Aug 2023 06:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-super-mtd 51/51]
 drivers/mtd/mtdsuper.c:33:undefined reference to `sget_dev'
Message-ID: <202308300613.9Kpddhlx-lkp@intel.com>
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
config: parisc-randconfig-r002-20230830 (https://download.01.org/0day-ci/archive/20230830/202308300613.9Kpddhlx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308300613.9Kpddhlx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308300613.9Kpddhlx-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/mtd/mtdsuper.o: in function `mtd_get_sb':
>> drivers/mtd/mtdsuper.c:33:(.text+0xa4): undefined reference to `sget_dev'


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
