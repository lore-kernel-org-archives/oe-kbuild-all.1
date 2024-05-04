Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9256DAD55
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714809444; cv=none; b=k69j+JemerBKY0Q2zxjyUj/pchVwgma6j9fQNmzDemJu074Fe8fFCE2Da4mY0zkDeM/v/EJA17+oyznlyt9tnVk8X9/WELQpahSe8hE+yZC5+Hz8Q7wFsnJkq9OFd9TbrYb4CGWDKIpoMmIrnJnGZhkr88avUY4S85sp+MyNPQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714809444; c=relaxed/simple;
	bh=mrbgX3d/tGpklVFrnwtLyJCrtifPEAe2RuRJjtWYZX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhH6/UUJQ066RZUL6UJmH//ex6lImR0WFWp2q/zcYXbgHYYofvrpsuB5XlzyJvBobLEfFezVmuYDlVgjn7/TSE0LiahKmBZLZkQwtf+tNIsp6w9EUqNIfmoyX/1u3OFa+k+N8eFl7LotTkBt7BrVEt8IA9gNVdRWh4qXyuowOa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjeUh1BD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjeUh1BD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714809443; x=1746345443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mrbgX3d/tGpklVFrnwtLyJCrtifPEAe2RuRJjtWYZX4=;
  b=TjeUh1BDgsluuw/DhLLX+QWFw5jXrZsmKx/yabJVTOiu/wttmYlYF7hH
   5FfcSPVhOFFfuY4pryLaDJk3tBHvvLljoM9iNb1CHEsbCu546YTNttVPX
   +ZGtHjNHqrqlcyoTJfSJ9bwl6Sd5JzKw6+HVTpI6BgKpS6mz3uBo5MX7i
   Kj1JUBIR7hP8ltWQUzKAL/0arR1/EK7U9uEgAfd4mINLINQCHDjnvT2ZT
   bz6ojKvvqQNFxIQG5pHQ7iTHwIneCZrPhzgxb92xK5TrFAadPWEGGq0fV
   cBOj7eL8X4/zXQ8/ehqi4ZnSUHViyJ+to9NLIoc2gfiuu2mhXWXKWPgi+
   g==;
X-CSE-ConnectionGUID: 68/dJ/NoS/mf3qEh/jlpig==
X-CSE-MsgGUID: pPzTEaJQRDW3K++bo5d5Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10469079"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="10469079"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 00:57:22 -0700
X-CSE-ConnectionGUID: 8WpmSTxiTH+egYeuGRd2Qw==
X-CSE-MsgGUID: 9ePgG+AISwuTWTeowk5oKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="32352079"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 May 2024 00:57:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3AGk-000CYk-2O;
	Sat, 04 May 2024 07:57:18 +0000
Date: Sat, 4 May 2024 15:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10966/10967]
 fs/ext4/super.c:1356:(.text+0x3945c): relocation truncated to fit:
 R_RISCV_GPREL_I against `.LANCHOR15'
Message-ID: <202405041522.1kGSNbp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9221b2819b8a4196eecf5476d66201be60fbcf29
commit: d82ddecceb499745a8c436fb94dd0ccc0cb097b4 [10966/10967] Merge branch 'refactor-heap' of https://evilpiepirate.org/git/bcachefs.git
config: riscv-randconfig-r005-20230228 (https://download.01.org/0day-ci/archive/20240504/202405041522.1kGSNbp1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041522.1kGSNbp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041522.1kGSNbp1-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: section .data LMA [0000000000454000,0000000001d5a5af] overlaps section .text LMA [0000000000155b70,00000000036ea517]
   riscv64-linux-ld: section .init.pi.text VMA [ffffffff836ea518,ffffffff836ed8db] overlaps section .data VMA [ffffffff82000000,ffffffff839065af]
   riscv64-linux-ld: section .got VMA [ffffffff839065b0,ffffffff839065bf] overlaps section .rodata VMA [ffffffff836ed900,ffffffff84390e1d]
   riscv64-linux-ld: section .init.pi.rodata.str1.8 VMA [ffffffff84390e20,ffffffff84390ea2] overlaps section .bss VMA [ffffffff83a32000,ffffffff849e773f]
   fs/ext4/super.o: in function `ext4_put_super':
>> fs/ext4/super.c:1356:(.text+0x3945c): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR15'
   fs/jffs2/malloc.o: in function `jffs2_create_slab_caches':
>> fs/jffs2/malloc.c:36:(.init.text+0x20): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR0'
   fs/ntfs3/frecord.o: in function `ni_new_attr_flags':
   fs/ntfs3/frecord.c:1792:(.text+0x7ec8): relocation truncated to fit: R_RISCV_GPREL_I against symbol `ntfs_aops_cmpr' defined in .rodata section in fs/ntfs3/inode.o
   fs/ntfs3/fslog.o: in function `is_rec_base':
>> fs/ntfs3/ntfs.h:308:(.text+0xa774): relocation truncated to fit: R_RISCV_GPREL_I against `.L3843'
   fs/ntfs3/inode.o: in function `put_page_testzero':
>> include/linux/mm.h:1135:(.text+0x9fc): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR2'
   fs/jffs2/read.o: in function `jffs2_read_dnode':
>> fs/jffs2/read.c:41:(.text+0x200): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR0'
   fs/jffs2/nodemgmt.o: in function `jffs2_add_physical_node_ref':
>> fs/jffs2/nodemgmt.c:517:(.text+0x6a8): relocation truncated to fit: R_RISCV_GPREL_I against `.LANCHOR0'


vim +1356 fs/ext4/super.c

ac27a0ec112a08 Dave Kleikamp           2006-10-11  1335  
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1336  	/* Debugging code just in case the in-memory inode orphan list
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1337  	 * isn't empty.  The on-disk one can be non-empty if we've
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1338  	 * detected an error and taken the fs readonly, but the
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1339  	 * in-memory list had better be clean by this point. */
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1340  	if (!list_empty(&sbi->s_orphan))
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1341  		dump_orphan_list(sb, sbi);
837c23fbc1b812 Chunguang Xu            2020-11-07  1342  	ASSERT(list_empty(&sbi->s_orphan));
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1343  
89d96a6f8e6491 Theodore Ts'o           2015-06-20  1344  	sync_blockdev(sb->s_bdev);
f98393a64ca139 Peter Zijlstra          2007-05-06  1345  	invalidate_bdev(sb->s_bdev);
61ead71476cf8b Christian Brauner       2024-01-23  1346  	if (sbi->s_journal_bdev_file) {
1489dffd51d7e4 Christoph Hellwig       2023-08-09  1347  		/*
1489dffd51d7e4 Christoph Hellwig       2023-08-09  1348  		 * Invalidate the journal device's buffers.  We don't want them
1489dffd51d7e4 Christoph Hellwig       2023-08-09  1349  		 * floating about in memory - the physical journal device may
1489dffd51d7e4 Christoph Hellwig       2023-08-09  1350  		 * hotswapped, and it breaks the `ro-after' testing code.
1489dffd51d7e4 Christoph Hellwig       2023-08-09  1351  		 */
61ead71476cf8b Christian Brauner       2024-01-23  1352  		sync_blockdev(file_bdev(sbi->s_journal_bdev_file));
61ead71476cf8b Christian Brauner       2024-01-23  1353  		invalidate_bdev(file_bdev(sbi->s_journal_bdev_file));
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1354  	}
50c15df69e062b Chengguang Xu           2018-12-04  1355  
dec214d00e0d78 Tahsin Erdogan          2017-06-22 @1356  	ext4_xattr_destroy_cache(sbi->s_ea_inode_cache);
dec214d00e0d78 Tahsin Erdogan          2017-06-22  1357  	sbi->s_ea_inode_cache = NULL;
50c15df69e062b Chengguang Xu           2018-12-04  1358  
47387409ee2e09 Tahsin Erdogan          2017-06-22  1359  	ext4_xattr_destroy_cache(sbi->s_ea_block_cache);
47387409ee2e09 Tahsin Erdogan          2017-06-22  1360  	sbi->s_ea_block_cache = NULL;
50c15df69e062b Chengguang Xu           2018-12-04  1361  
618f003199c618 Pavel Skripkin          2021-04-30  1362  	ext4_stop_mmpd(sbi);
618f003199c618 Pavel Skripkin          2021-04-30  1363  
9060dd2c5036b1 Eric Sandeen            2016-11-26  1364  	brelse(sbi->s_sbh);
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1365  	sb->s_fs_info = NULL;
3197ebdb130473 Theodore Ts'o           2009-03-31  1366  	/*
3197ebdb130473 Theodore Ts'o           2009-03-31  1367  	 * Now that we are completely done shutting down the
3197ebdb130473 Theodore Ts'o           2009-03-31  1368  	 * superblock, we need to actually destroy the kobject.
3197ebdb130473 Theodore Ts'o           2009-03-31  1369  	 */
3197ebdb130473 Theodore Ts'o           2009-03-31  1370  	kobject_put(&sbi->s_kobj);
3197ebdb130473 Theodore Ts'o           2009-03-31  1371  	wait_for_completion(&sbi->s_kobj_unregister);
0441984a339897 Darrick J. Wong         2012-04-29  1372  	if (sbi->s_chksum_driver)
0441984a339897 Darrick J. Wong         2012-04-29  1373  		crypto_free_shash(sbi->s_chksum_driver);
705895b61133ef Pekka Enberg            2009-02-15  1374  	kfree(sbi->s_blockgroup_lock);
8012b866085523 Shiyang Ruan            2022-06-03  1375  	fs_put_dax(sbi->s_daxdev, NULL);
ac4acb1f4b2b6b Eric Biggers            2020-09-16  1376  	fscrypt_free_dummy_policy(&sbi->s_dummy_enc_policy);
5298d4bfe80f6a Christoph Hellwig       2022-01-18  1377  #if IS_ENABLED(CONFIG_UNICODE)
f8f4acb6cded4e Daniel Rosenberg        2020-10-28  1378  	utf8_unload(sb->s_encoding);
c83ad55eaa91c8 Gabriel Krisman Bertazi 2019-04-25  1379  #endif
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1380  	kfree(sbi);
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1381  }
ac27a0ec112a08 Dave Kleikamp           2006-10-11  1382  

:::::: The code at line 1356 was first introduced by commit
:::::: dec214d00e0d78a08b947d7dccdfdb84407a9f4d ext4: xattr inode deduplication

:::::: TO: Tahsin Erdogan <tahsin@google.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
