Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07642556E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 19:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036972; cv=none; b=dpi0yzjS/sAxVZNloMp8oCeBXgCCdogK6shDCL18D52LdzGQCDkqv6jskmk4MxjBV75G3sLRE2sj3YH/20ufH8gd7rOzyXn2kXkSKoJAV1+lMQMzLz2xa95FgLC3R41iJ/FQxWegdGSWWhrzT7Qb7N7kTOEgAm4qHsiZ0K8+RmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036972; c=relaxed/simple;
	bh=Xx5KliLyAPs5x58LOJGcBxHWJMPp4C3kkAlSs+Y/zAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojUFozfheLHCLVJMMSkZjWTi92t6FIfVi2z4dKtYXF/6GFlMpRRiEMt2I0m85kcOT2egvqnekfv8NFHEFOTedk/tSbM395zTFMAqc7AhrrVyg1pbOmctqDkP6+odWYuoqG5/KSU0ppMwV96Za6j3Bc94DubMB+/ll4LTdeU16kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYkbSTYA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYkbSTYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760036971; x=1791572971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xx5KliLyAPs5x58LOJGcBxHWJMPp4C3kkAlSs+Y/zAA=;
  b=SYkbSTYAM8Nb41nTKZsQxeKbUILLLJ5Xdv7RQ6G4r2xCacEUMHgBoRp2
   n5kuQzxDcbxZySQXZHxv2oZmB1lftiOWtTwS3ZRN/1leiHD1GmyM7tT4x
   Qebo/HlBnlkS5dWgt8kVB6WgLnls9SE0zcCzhIc1XTCVxjqcxQP9a6Zs7
   87ilIP5GBAjSWF6jk2nj3aCTCsR8CiY79VS8bHcayAjCPo0BIqyfBAXp3
   tok0EMpJwODYgKa3Tq6uE4YCS779EPJLBWykbWV51NL3vF6LKtvjMhbpg
   3PTY4y2gvMBM5aBo8aedPl8LvJERdSWa1eqKmBXtxbnRrQxKVMrUIyNM0
   g==;
X-CSE-ConnectionGUID: giaJ4Zf5RKaKBabnXmGTiQ==
X-CSE-MsgGUID: typIUOZhRsOUjaTf6HPJZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73362263"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73362263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 12:09:30 -0700
X-CSE-ConnectionGUID: 2VyYTLmqTcWpVumgy4+FtQ==
X-CSE-MsgGUID: Ksa7ANbnRnWtPYz9bYp8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="211439777"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Oct 2025 12:09:29 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6w10-0001GJ-1H;
	Thu, 09 Oct 2025 19:09:26 +0000
Date: Fri, 10 Oct 2025 03:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 7/8] fs/f2fs/gc.c:1272:31: error: passing
 argument 1 of 'ERR_PTR' makes integer from pointer without a cast
Message-ID: <202510100242.gY7XTRWR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   f413b3ee5d939ae78a851e6451d374f0d4772b15
commit: 61d4bb37555be9c60f096a988d05569095c789f3 [7/8] f2fs: use f2fs_filemap_get_folio() instead of f2fs_pagecache_get_page()
config: sh-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100242.gY7XTRWR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100242.gY7XTRWR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100242.gY7XTRWR-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/gc.c: In function 'ra_data_block':
>> fs/f2fs/gc.c:1272:31: error: passing argument 1 of 'ERR_PTR' makes integer from pointer without a cast [-Wint-conversion]
    1272 |                 err = ERR_PTR(efolio);
         |                               ^~~~~~
         |                               |
         |                               struct folio *
   In file included from include/linux/cleanup.h:6,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/f2fs/gc.c:8:
   include/linux/err.h:39:48: note: expected 'long int' but argument is of type 'struct folio *'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                           ~~~~~^~~~~
>> fs/f2fs/gc.c:1272:21: error: assignment to 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
    1272 |                 err = ERR_PTR(efolio);
         |                     ^
   fs/f2fs/gc.c: In function 'move_data_block':
   fs/f2fs/gc.c:1414:31: error: passing argument 1 of 'ERR_PTR' makes integer from pointer without a cast [-Wint-conversion]
    1414 |                 err = ERR_PTR(efolio);
         |                               ^~~~~~
         |                               |
         |                               struct folio *
   include/linux/err.h:39:48: note: expected 'long int' but argument is of type 'struct folio *'
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                           ~~~~~^~~~~
   fs/f2fs/gc.c:1414:21: error: assignment to 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
    1414 |                 err = ERR_PTR(efolio);
         |                     ^


vim +/ERR_PTR +1272 fs/f2fs/gc.c

  1207	
  1208	static int ra_data_block(struct inode *inode, pgoff_t index)
  1209	{
  1210		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
  1211		struct address_space *mapping = f2fs_is_cow_file(inode) ?
  1212					F2FS_I(inode)->atomic_inode->i_mapping : inode->i_mapping;
  1213		struct dnode_of_data dn;
  1214		struct folio *folio, *efolio;
  1215		struct f2fs_io_info fio = {
  1216			.sbi = sbi,
  1217			.ino = inode->i_ino,
  1218			.type = DATA,
  1219			.temp = COLD,
  1220			.op = REQ_OP_READ,
  1221			.op_flags = 0,
  1222			.encrypted_page = NULL,
  1223			.in_list = 0,
  1224		};
  1225		int err;
  1226	
  1227		folio = f2fs_grab_cache_folio(mapping, index, true);
  1228		if (IS_ERR(folio))
  1229			return PTR_ERR(folio);
  1230	
  1231		if (f2fs_lookup_read_extent_cache_block(inode, index,
  1232							&dn.data_blkaddr)) {
  1233			if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
  1234							DATA_GENERIC_ENHANCE_READ))) {
  1235				err = -EFSCORRUPTED;
  1236				goto put_folio;
  1237			}
  1238			goto got_it;
  1239		}
  1240	
  1241		set_new_dnode(&dn, inode, NULL, NULL, 0);
  1242		err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
  1243		if (err)
  1244			goto put_folio;
  1245		f2fs_put_dnode(&dn);
  1246	
  1247		if (!__is_valid_data_blkaddr(dn.data_blkaddr)) {
  1248			err = -ENOENT;
  1249			goto put_folio;
  1250		}
  1251		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
  1252							DATA_GENERIC_ENHANCE))) {
  1253			err = -EFSCORRUPTED;
  1254			goto put_folio;
  1255		}
  1256	got_it:
  1257		/* read folio */
  1258		fio.folio = folio;
  1259		fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
  1260	
  1261		/*
  1262		 * don't cache encrypted data into meta inode until previous dirty
  1263		 * data were writebacked to avoid racing between GC and flush.
  1264		 */
  1265		f2fs_folio_wait_writeback(folio, DATA, true, true);
  1266	
  1267		f2fs_wait_on_block_writeback(inode, dn.data_blkaddr);
  1268	
  1269		efolio = f2fs_filemap_get_folio(META_MAPPING(sbi), dn.data_blkaddr,
  1270						FGP_LOCK | FGP_CREAT, GFP_NOFS);
  1271		if (IS_ERR(efolio)) {
> 1272			err = ERR_PTR(efolio);
  1273			goto put_folio;
  1274		}
  1275	
  1276		fio.encrypted_page = &efolio->page;
  1277	
  1278		err = f2fs_submit_page_bio(&fio);
  1279		if (err)
  1280			goto put_encrypted_page;
  1281		f2fs_put_page(fio.encrypted_page, 0);
  1282		f2fs_folio_put(folio, true);
  1283	
  1284		f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
  1285		f2fs_update_iostat(sbi, NULL, FS_GDATA_READ_IO, F2FS_BLKSIZE);
  1286	
  1287		return 0;
  1288	put_encrypted_page:
  1289		f2fs_put_page(fio.encrypted_page, 1);
  1290	put_folio:
  1291		f2fs_folio_put(folio, true);
  1292		return err;
  1293	}
  1294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
