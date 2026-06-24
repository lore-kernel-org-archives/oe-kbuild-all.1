Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A7222597
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 01:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782265839; cv=none; b=YH7mRJg8TYcKgqMNN0neiga5OleEIl5IJsplS30UrvmqIcxncjgKuDP5OzMA8uAQ9lYAwe/oh3h4jGjRQvgTAF087iQ/cOTzKBxuhT0hKJ3uDkY6FCKr6H4DGDLGZ76BCSvMOuTRPC/yeBsX/x1LgfjQ6MEXqc9d3/N6FEfwI98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782265839; c=relaxed/simple;
	bh=oMT24jRYGrzKXTEgJpx2NFIbWht7tzc6MTX3nO9iIFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aSjvLJNkmUkrtfHcTS8HuyESxBbKpqf8+lUV5IAfs2tMy+9s0+IlQ2tocxmqjOUxPTPyZ+UgAQIXkr9crMQsjtTzYQ+8TIiruu/Awo2kujyQ7B4yBSSbju52G4zCq4R4fNIcIq1lo5lcm21gToRoUURdEzJveEPnTYhZ/JLPThw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nacgv1w+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nacgv1w+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782265838; x=1813801838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oMT24jRYGrzKXTEgJpx2NFIbWht7tzc6MTX3nO9iIFY=;
  b=nacgv1w+aZaYgzXae63rQxU89G4OUc1g0QxhfChX9BzcEEfVokBRTlz3
   GnUOdGqtB1ZcUnwAcTLpMqSrPeQDhwF/f3VDVv3lIyhmEOXz5MSIgYrp0
   6wqKvUoI1t1e4pnaJnv5H6+vf8qmmNkmSlWVuhq0CUw1/zaIQVmT2HghG
   JhsIlzUsj7YZxZZTHC9VZ4Ewnc/mhAixwcyxx3A36Ga6gpWEAxC6tKiG8
   vECGShJFKLse3t/pozrSfcc8EhpSSj8zPvQn5Yq2EsbEIKsy/yML9cPQp
   LYg5WMe0wleVJdIMbCXA5mjSu/Q5q0jSkHPtfdSn1kQTy1tjlPV9niwC6
   g==;
X-CSE-ConnectionGUID: BBJPcZKvQjCISnA2/uojlQ==
X-CSE-MsgGUID: ZST/avs/QmmOqQioXLAsDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86921899"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86921899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 18:50:37 -0700
X-CSE-ConnectionGUID: KvFy1ijqS4q7LBXnyNqULg==
X-CSE-MsgGUID: PIdxVo7mS8G8Ix+3NPFbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="279845039"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2026 18:50:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcCl6-0000000032p-46WD;
	Wed, 24 Jun 2026 01:50:32 +0000
Date: Wed, 24 Jun 2026 09:49:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-prep-easy 20/57]
 fs/f2fs/sysfs.c:1363:22: error: initialization of 'ssize_t (*)(const struct
 f2fs_attr *, struct f2fs_sb_info *, char *)' {aka 'int (*)(const struct
 f2fs_attr *, struct f2fs_sb_info *, char *)'} from incompatible pointer type
 'ssize_t (*)(struct f2fs_attr ...
Message-ID: <202606240924.IuGtrvSL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-prep-easy
head:   67a3c6abb9033d2ce2a9ac12d4cfb9530148b38f
commit: 8a368f6b39b939b42a5bc9faff00f93d907f2143 [20/57] f2fs
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260624/202606240924.IuGtrvSL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240924.IuGtrvSL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240924.IuGtrvSL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1790,
                    from include/linux/pagemap.h:8,
                    from include/linux/f2fs_fs.h:11,
                    from fs/f2fs/sysfs.c:11:
>> fs/f2fs/sysfs.c:1363:22: error: initialization of 'ssize_t (*)(const struct f2fs_attr *, struct f2fs_sb_info *, char *)' {aka 'int (*)(const struct f2fs_attr *, struct f2fs_sb_info *, char *)'} from incompatible pointer type 'ssize_t (*)(struct f2fs_attr *, struct f2fs_sb_info *, char *)' {aka 'int (*)(struct f2fs_attr *, struct f2fs_sb_info *, char *)'} [-Wincompatible-pointer-types]
    1363 | F2FS_GENERAL_RO_ATTR(defrag_blocks);
         |                      ^~~~~~~~~~~~~
   include/linux/sysfs.h:243:19: note: in definition of macro '__ATTR'
     243 |         .show   = _show,                                                \
         |                   ^~~~~
   fs/f2fs/sysfs.c:1363:1: note: in expansion of macro 'F2FS_GENERAL_RO_ATTR'
    1363 | F2FS_GENERAL_RO_ATTR(defrag_blocks);
         | ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:1363:22: note: (near initialization for 'f2fs_attr_defrag_blocks.show')
   include/linux/sysfs.h:243:19: note: in definition of macro '__ATTR'
     243 |         .show   = _show,                                                \
         |                   ^~~~~
   fs/f2fs/sysfs.c:1363:1: note: in expansion of macro 'F2FS_GENERAL_RO_ATTR'
    1363 | F2FS_GENERAL_RO_ATTR(defrag_blocks);
         | ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/sysfs.c:342:16: note: 'defrag_blocks_show' declared here
     342 | static ssize_t defrag_blocks_show(struct f2fs_attr *a,
         |                ^~~~~~~~~~~~~~~~~~


vim +1363 fs/f2fs/sysfs.c

6201c478dedcf7c Yangtao Li       2023-05-06  1343  
8f1572f7ce6169a Jaegeuk Kim      2017-10-24  1344  F2FS_GENERAL_RO_ATTR(dirty_segments);
fc7100ea2a52fcf Hridya Valsaraju 2020-01-22  1345  F2FS_GENERAL_RO_ATTR(free_segments);
0823427989c1124 Jaegeuk Kim      2021-03-01  1346  F2FS_GENERAL_RO_ATTR(ovp_segments);
8ceffcb29e61ba8 Chao Yu          2017-06-14  1347  F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
bf9e697ecd4214c Jaegeuk Kim      2017-07-21  1348  F2FS_GENERAL_RO_ATTR(features);
80d421450187e89 Yunlong Song     2017-10-27  1349  F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
4d3aed70902f299 Daniel Rosenberg 2019-05-29  1350  F2FS_GENERAL_RO_ATTR(unusable);
5aba54302a46fdd Daniel Rosenberg 2019-07-23  1351  F2FS_GENERAL_RO_ATTR(encoding);
3fea0641b06ff4e Chao Yu          2025-05-06  1352  F2FS_GENERAL_RO_ATTR(encoding_flags);
1bd119da0b93d6d Daniel Lee       2025-08-04  1353  F2FS_GENERAL_RO_ATTR(effective_lookup_mode);
a7e679b53393c76 Jaegeuk Kim      2020-02-25  1354  F2FS_GENERAL_RO_ATTR(mounted_time_sec);
ffcde4b29a5f20d Dehe Gu          2020-07-03  1355  F2FS_GENERAL_RO_ATTR(main_blkaddr);
ae2e2804caa120a Jaegeuk Kim      2021-11-29  1356  F2FS_GENERAL_RO_ATTR(pending_discard);
6f092b55e1ad2d5 liujinbao1       2024-02-21  1357  F2FS_GENERAL_RO_ATTR(atgc_enabled);
a3951cd199a5d26 Yangtao Li       2022-10-25  1358  F2FS_GENERAL_RO_ATTR(gc_mode);
fc7100ea2a52fcf Hridya Valsaraju 2020-01-22  1359  #ifdef CONFIG_F2FS_STAT_FS
fc7100ea2a52fcf Hridya Valsaraju 2020-01-22  1360  F2FS_GENERAL_RO_ATTR(moved_blocks_background);
fc7100ea2a52fcf Hridya Valsaraju 2020-01-22  1361  F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
fc7100ea2a52fcf Hridya Valsaraju 2020-01-22  1362  F2FS_GENERAL_RO_ATTR(avg_vblocks);
265dccda706667b liujinbao1       2026-02-27 @1363  F2FS_GENERAL_RO_ATTR(defrag_blocks);
fc7100ea2a52fcf Hridya Valsaraju 2020-01-22  1364  #endif
bf9e697ecd4214c Jaegeuk Kim      2017-07-21  1365  

:::::: The code at line 1363 was first introduced by commit
:::::: 265dccda706667b9c2b6d690636db1df1f751948 f2fs: Add defrag_blocks sysfs node

:::::: TO: liujinbao1 <liujinbao1@xiaomi.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
