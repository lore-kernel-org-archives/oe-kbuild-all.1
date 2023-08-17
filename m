Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FB112B7D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692268730; x=1723804730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N4VEBx1FAuHvS0prc7/Lxt0hkcLoviFh34OK+31dtE0=;
  b=lWPbkNqMDZSVJGvApOpjB1zcojure7OaG2jBKki/kl5P2iUR1uxCd7RH
   fnvg/ZtnXk9IKJjr7GEgrJKRqbYBOe21sfBrIUI89ZrDsPmoR5Fi0Pkcy
   q89f31194zG30UPQY53MOMC2SGoUz6sFL5AGoR1DpTHPqvdcgOPtMCAzz
   zOrOxgC+UasP3cdi6tFCIu/QuFzU+QIvaza+hIVYN+x/VEVlY+5fc7P+B
   Hmc5/CMPCqdW9UTubgf0hVsIKAbdl3tqGfbsg3qZahxyJOJS9IbZ4GQb4
   A/ZFuxRYUdVunnPFsZNO5EzLXPa1av4/gzbJysVYzOVF4tRBUFTmCw13v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362923799"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="362923799"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 03:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="799998563"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="799998563"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 03:38:45 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWaOp-00013J-3D;
	Thu, 17 Aug 2023 10:38:44 +0000
Date: Thu, 17 Aug 2023 18:38:15 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: block/partitions/efi.c:341: warning: Function parameter or member
 'ignored' not described in 'is_gpt_valid'
Message-ID: <202308171820.XmHdNAfW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 21eacadabb197072ecbf26969efe5c4c7b0c655d CHROMIUM: block: partitions: efi: Add support for IGNOREME GPT signature
date:   2 years, 8 months ago
config: i386-randconfig-r015-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171820.XmHdNAfW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171820.XmHdNAfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171820.XmHdNAfW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/partitions/efi.c:341: warning: Function parameter or member 'ignored' not described in 'is_gpt_valid'


vim +341 block/partitions/efi.c

^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  326  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  327  /**
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  328   * is_gpt_valid() - tests one GPT header and PTEs for validity
16e1556526241b block/partitions/efi.c Fabian Frederick 2014-06-12  329   * @state: disk parsed partitions
16e1556526241b block/partitions/efi.c Fabian Frederick 2014-06-12  330   * @lba: logical block address of the GPT header to test
16e1556526241b block/partitions/efi.c Fabian Frederick 2014-06-12  331   * @gpt: GPT header ptr, filled on return.
16e1556526241b block/partitions/efi.c Fabian Frederick 2014-06-12  332   * @ptes: PTEs ptr, filled on return.
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  333   * @ignored is filled on return with 1 if this is an IGNOREME GPT,
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  334   *     0 otherwise. May be NULL.
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  335   *
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  336   * Description: returns 1 if valid,  0 on error.
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  337   * If valid, returns pointers to newly allocated GPT header and PTEs.
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  338   */
1493bf217f7f59 fs/partitions/efi.c    Tejun Heo        2010-05-15  339  static int is_gpt_valid(struct parsed_partitions *state, u64 lba,
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  340  			gpt_header **gpt, gpt_entry **ptes, int *ignored)
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16 @341  {
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  342  	u32 crc, origcrc;
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  343  	u64 lastlba, pt_size;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  344  
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  345  	if (ignored)
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  346  		*ignored = 0;
1493bf217f7f59 fs/partitions/efi.c    Tejun Heo        2010-05-15  347  	if (!ptes)
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  348  		return 0;
1493bf217f7f59 fs/partitions/efi.c    Tejun Heo        2010-05-15  349  	if (!(*gpt = alloc_read_gpt_header(state, lba)))
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  350  		return 0;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  351  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  352  	/* Check the GUID Partition Table signature */
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  353  	if (le64_to_cpu((*gpt)->signature) == GPT_HEADER_SIGNATURE_IGNORED) {
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  354  		pr_debug("GUID Partition Table at LBA %llu marked IGNOREME\n",
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  355  			 lba);
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  356  		if (ignored)
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  357  			*ignored = 1;
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  358  		goto fail;
21eacadabb1970 block/partitions/efi.c Julius Werner    2016-04-20  359  	} else if (le64_to_cpu((*gpt)->signature) != GPT_HEADER_SIGNATURE) {
d991696263a704 fs/partitions/efi.c    Thomas Gleixner  2008-07-25  360  		pr_debug("GUID Partition Table Header signature is wrong:"
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  361  			 "%lld != %lld\n",
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  362  			 (unsigned long long)le64_to_cpu((*gpt)->signature),
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  363  			 (unsigned long long)GPT_HEADER_SIGNATURE);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  364  		goto fail;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  365  	}
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  366  
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  367  	/* Check the GUID Partition Table header size is too big */
3eb8e74ec72736 fs/partitions/efi.c    Timo Warns       2011-05-26  368  	if (le32_to_cpu((*gpt)->header_size) >
3eb8e74ec72736 fs/partitions/efi.c    Timo Warns       2011-05-26  369  			bdev_logical_block_size(state->bdev)) {
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  370  		pr_debug("GUID Partition Table Header size is too large: %u > %u\n",
3eb8e74ec72736 fs/partitions/efi.c    Timo Warns       2011-05-26  371  			le32_to_cpu((*gpt)->header_size),
3eb8e74ec72736 fs/partitions/efi.c    Timo Warns       2011-05-26  372  			bdev_logical_block_size(state->bdev));
3eb8e74ec72736 fs/partitions/efi.c    Timo Warns       2011-05-26  373  		goto fail;
3eb8e74ec72736 fs/partitions/efi.c    Timo Warns       2011-05-26  374  	}
3eb8e74ec72736 fs/partitions/efi.c    Timo Warns       2011-05-26  375  
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  376  	/* Check the GUID Partition Table header size is too small */
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  377  	if (le32_to_cpu((*gpt)->header_size) < sizeof(gpt_header)) {
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  378  		pr_debug("GUID Partition Table Header size is too small: %u < %zu\n",
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  379  			le32_to_cpu((*gpt)->header_size),
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  380  			sizeof(gpt_header));
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  381  		goto fail;
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  382  	}
8b8a6e1881be8d block/partitions/efi.c Peter Jones      2013-02-27  383  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  384  	/* Check the GUID Partition Table CRC */
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  385  	origcrc = le32_to_cpu((*gpt)->header_crc32);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  386  	(*gpt)->header_crc32 = 0;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  387  	crc = efi_crc32((const unsigned char *) (*gpt), le32_to_cpu((*gpt)->header_size));
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  388  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  389  	if (crc != origcrc) {
d991696263a704 fs/partitions/efi.c    Thomas Gleixner  2008-07-25  390  		pr_debug("GUID Partition Table Header CRC is wrong: %x != %x\n",
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  391  			 crc, origcrc);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  392  		goto fail;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  393  	}
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  394  	(*gpt)->header_crc32 = cpu_to_le32(origcrc);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  395  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  396  	/* Check that the my_lba entry points to the LBA that contains
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  397  	 * the GUID Partition Table */
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  398  	if (le64_to_cpu((*gpt)->my_lba) != lba) {
d991696263a704 fs/partitions/efi.c    Thomas Gleixner  2008-07-25  399  		pr_debug("GPT my_lba incorrect: %lld != %lld\n",
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  400  			 (unsigned long long)le64_to_cpu((*gpt)->my_lba),
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  401  			 (unsigned long long)lba);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  402  		goto fail;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  403  	}
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  404  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  405  	/* Check the first_usable_lba and last_usable_lba are
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  406  	 * within the disk.
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  407  	 */
1493bf217f7f59 fs/partitions/efi.c    Tejun Heo        2010-05-15  408  	lastlba = last_lba(state->bdev);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  409  	if (le64_to_cpu((*gpt)->first_usable_lba) > lastlba) {
d991696263a704 fs/partitions/efi.c    Thomas Gleixner  2008-07-25  410  		pr_debug("GPT: first_usable_lba incorrect: %lld > %lld\n",
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  411  			 (unsigned long long)le64_to_cpu((*gpt)->first_usable_lba),
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  412  			 (unsigned long long)lastlba);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  413  		goto fail;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  414  	}
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  415  	if (le64_to_cpu((*gpt)->last_usable_lba) > lastlba) {
d991696263a704 fs/partitions/efi.c    Thomas Gleixner  2008-07-25  416  		pr_debug("GPT: last_usable_lba incorrect: %lld > %lld\n",
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  417  			 (unsigned long long)le64_to_cpu((*gpt)->last_usable_lba),
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  418  			 (unsigned long long)lastlba);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  419  		goto fail;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  420  	}
aa054bc93743ec block/partitions/efi.c Davidlohr Bueso  2013-09-11  421  	if (le64_to_cpu((*gpt)->last_usable_lba) < le64_to_cpu((*gpt)->first_usable_lba)) {
aa054bc93743ec block/partitions/efi.c Davidlohr Bueso  2013-09-11  422  		pr_debug("GPT: last_usable_lba incorrect: %lld > %lld\n",
aa054bc93743ec block/partitions/efi.c Davidlohr Bueso  2013-09-11  423  			 (unsigned long long)le64_to_cpu((*gpt)->last_usable_lba),
aa054bc93743ec block/partitions/efi.c Davidlohr Bueso  2013-09-11  424  			 (unsigned long long)le64_to_cpu((*gpt)->first_usable_lba));
aa054bc93743ec block/partitions/efi.c Davidlohr Bueso  2013-09-11  425  		goto fail;
aa054bc93743ec block/partitions/efi.c Davidlohr Bueso  2013-09-11  426  	}
fa039d5f6b126f fs/partitions/efi.c    Timo Warns       2011-05-06  427  	/* Check that sizeof_partition_entry has the correct value */
fa039d5f6b126f fs/partitions/efi.c    Timo Warns       2011-05-06  428  	if (le32_to_cpu((*gpt)->sizeof_partition_entry) != sizeof(gpt_entry)) {
c19ca6cb4c0891 block/partitions/efi.c Masanari Iida    2016-02-08  429  		pr_debug("GUID Partition Entry Size check failed.\n");
fa039d5f6b126f fs/partitions/efi.c    Timo Warns       2011-05-06  430  		goto fail;
fa039d5f6b126f fs/partitions/efi.c    Timo Warns       2011-05-06  431  	}
fa039d5f6b126f fs/partitions/efi.c    Timo Warns       2011-05-06  432  
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  433  	/* Sanity check partition table size */
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  434  	pt_size = (u64)le32_to_cpu((*gpt)->num_partition_entries) *
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  435  		le32_to_cpu((*gpt)->sizeof_partition_entry);
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  436  	if (pt_size > KMALLOC_MAX_SIZE) {
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  437  		pr_debug("GUID Partition Table is too large: %llu > %lu bytes\n",
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  438  			 (unsigned long long)pt_size, KMALLOC_MAX_SIZE);
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  439  		goto fail;
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  440  	}
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  441  
1493bf217f7f59 fs/partitions/efi.c    Tejun Heo        2010-05-15  442  	if (!(*ptes = alloc_read_gpt_entries(state, *gpt)))
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  443  		goto fail;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  444  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  445  	/* Check the GUID Partition Entry Array CRC */
c5082b70adfe8e block/partitions/efi.c Alden Tondettar  2017-01-15  446  	crc = efi_crc32((const unsigned char *) (*ptes), pt_size);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  447  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  448  	if (crc != le32_to_cpu((*gpt)->partition_entry_array_crc32)) {
c19ca6cb4c0891 block/partitions/efi.c Masanari Iida    2016-02-08  449  		pr_debug("GUID Partition Entry Array CRC check failed.\n");
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  450  		goto fail_ptes;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  451  	}
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  452  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  453  	/* We're done, all's well */
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  454  	return 1;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  455  
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  456   fail_ptes:
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  457  	kfree(*ptes);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  458  	*ptes = NULL;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  459   fail:
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  460  	kfree(*gpt);
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  461  	*gpt = NULL;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  462  	return 0;
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  463  }
^1da177e4c3f41 fs/partitions/efi.c    Linus Torvalds   2005-04-16  464  

:::::: The code at line 341 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
