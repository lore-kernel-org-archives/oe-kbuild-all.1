Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B087815D5C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 22:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981135; cv=none; b=qCE7noPVksuoSxxkL5LOfS2rPHh7K34yCfLedhghcj0O3ubeuQcy5+wD1MkArQk+OD7yTBKPEJtbApZYFlN6nogIcdR3LvN/eREwBPMzL14NnnI0jDDiKpkWtSl9AlMONo/MmZ9V3U92885tgASqyoCbFVZ2s4/delhxwiWySio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981135; c=relaxed/simple;
	bh=F+o0kNSC6OFibYdOtD3aU6TauXVdj6KPVh+tdW18mDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JjvYyr4fy2gacWwD8V+Q75ZxbyymD71fTCkw+EHA2KlBV73Z1T2XnRVzQ0InzxVci6sdvMEpN033R55TeOGl+T6S3PELJYMNhTSoz+Com3Fw95AlIdKivX7zNVvpf5ecDI1YRk5dsUkU35Xhfr7CQKjJX+wQXSRdvFIcRmFwK4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPSg8JeC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPSg8JeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736981133; x=1768517133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+o0kNSC6OFibYdOtD3aU6TauXVdj6KPVh+tdW18mDM=;
  b=iPSg8JeCDYHSWPLE0J1l+3ldGsu2LdsCiAIN4EyB/QUJS/MIfQ82m+lK
   eQg+cCFIQvKVytuYqD8lxxrMDRCooqPj6ilQyoELh1+RA2EOsMw74J8o5
   K1Z4Z9vPfKtsef7T/fvoRXAqWcBmU64wYO7YOPnnYM3vlniEp0kUEuv/s
   rNdaq5bjI+XsEVyTUlqQyWA2Xoh/NUhztWTKz603OtEEh5AyXqi2Tlsy4
   hDzZaDFsdVWJqrbpzFZfGQqix7RuSzPqaEG/8fEAWl2U+NSm6vYDeMLqX
   d3ANj2r6Ae6AyofKlhO0HvYREEwwJLRc9UbIfAuw/6GgVDWfKnANFpZ8y
   A==;
X-CSE-ConnectionGUID: 2RUhf6hrR+yOJsLmq6bkIw==
X-CSE-MsgGUID: siPLXS+aRPaFKzWuB0iqyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="62708635"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="62708635"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 14:45:33 -0800
X-CSE-ConnectionGUID: +3n2wGkzSdK0rSGuXOLc7Q==
X-CSE-MsgGUID: VNxSHPodTR+FdhuVo+xjyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128545895"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2025 14:45:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYC8g-000QyF-0Q;
	Wed, 15 Jan 2025 22:45:30 +0000
Date: Thu, 16 Jan 2025 06:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Sakai <msakai@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: drivers/md/dm-vdo/recovery-journal.c:1369: warning: Function
 parameter or struct member 'context' not described in 'write_block'
Message-ID: <202501160601.cTy8Bg4C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
commit: 19ac19e02ffa318e77f6b086b8fb3917da0aa893 dm vdo: fix function doc comment formatting
date:   8 weeks ago
config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20250116/202501160601.cTy8Bg4C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160601.cTy8Bg4C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160601.cTy8Bg4C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/md/dm-vdo/recovery-journal.c:268: warning: Function parameter or struct member 'waiter' not described in 'continue_waiter'
   drivers/md/dm-vdo/recovery-journal.c:268: warning: Function parameter or struct member 'context' not described in 'continue_waiter'
   drivers/md/dm-vdo/recovery-journal.c:1085: warning: Function parameter or struct member 'waiter' not described in 'assign_entry'
   drivers/md/dm-vdo/recovery-journal.c:1085: warning: Function parameter or struct member 'context' not described in 'assign_entry'
   drivers/md/dm-vdo/recovery-journal.c:1172: warning: Function parameter or struct member 'waiter' not described in 'continue_committed_waiter'
   drivers/md/dm-vdo/recovery-journal.c:1172: warning: Function parameter or struct member 'context' not described in 'continue_committed_waiter'
   drivers/md/dm-vdo/recovery-journal.c:1369: warning: Function parameter or struct member 'waiter' not described in 'write_block'
>> drivers/md/dm-vdo/recovery-journal.c:1369: warning: Function parameter or struct member 'context' not described in 'write_block'
   drivers/md/dm-vdo/recovery-journal.c:1620: warning: Function parameter or struct member 'state' not described in 'initiate_drain'


vim +1369 drivers/md/dm-vdo/recovery-journal.c

95a72357688803 Matthew Sakai 2023-11-16  1362  
95a72357688803 Matthew Sakai 2023-11-16  1363  /**
95a72357688803 Matthew Sakai 2023-11-16  1364   * write_block() - Issue a block for writing.
95a72357688803 Matthew Sakai 2023-11-16  1365   *
95a72357688803 Matthew Sakai 2023-11-16  1366   * Implements waiter_callback_fn.
95a72357688803 Matthew Sakai 2023-11-16  1367   */
19ac19e02ffa31 Matthew Sakai 2024-10-02  1368  static void write_block(struct vdo_waiter *waiter, void __always_unused *context)
95a72357688803 Matthew Sakai 2023-11-16 @1369  {
95a72357688803 Matthew Sakai 2023-11-16  1370  	struct recovery_journal_block *block =
95a72357688803 Matthew Sakai 2023-11-16  1371  		container_of(waiter, struct recovery_journal_block, write_waiter);
95a72357688803 Matthew Sakai 2023-11-16  1372  	struct recovery_journal *journal = block->journal;
95a72357688803 Matthew Sakai 2023-11-16  1373  	struct packed_journal_header *header = get_block_header(block);
95a72357688803 Matthew Sakai 2023-11-16  1374  
d6e260cc426164 Mike Snitzer  2023-11-20  1375  	if (block->committing || !vdo_waitq_has_waiters(&block->entry_waiters) ||
d6e260cc426164 Mike Snitzer  2023-11-20  1376  	    is_read_only(journal))
95a72357688803 Matthew Sakai 2023-11-16  1377  		return;
95a72357688803 Matthew Sakai 2023-11-16  1378  
d6e260cc426164 Mike Snitzer  2023-11-20  1379  	block->entries_in_commit = vdo_waitq_num_waiters(&block->entry_waiters);
95a72357688803 Matthew Sakai 2023-11-16  1380  	add_queued_recovery_entries(block);
95a72357688803 Matthew Sakai 2023-11-16  1381  
95a72357688803 Matthew Sakai 2023-11-16  1382  	journal->pending_write_count += 1;
95a72357688803 Matthew Sakai 2023-11-16  1383  	journal->events.blocks.written += 1;
95a72357688803 Matthew Sakai 2023-11-16  1384  	journal->events.entries.written += block->entries_in_commit;
95a72357688803 Matthew Sakai 2023-11-16  1385  
95a72357688803 Matthew Sakai 2023-11-16  1386  	header->block_map_head = __cpu_to_le64(journal->block_map_head);
95a72357688803 Matthew Sakai 2023-11-16  1387  	header->slab_journal_head = __cpu_to_le64(journal->slab_journal_head);
95a72357688803 Matthew Sakai 2023-11-16  1388  	header->entry_count = __cpu_to_le16(block->entry_count);
95a72357688803 Matthew Sakai 2023-11-16  1389  
95a72357688803 Matthew Sakai 2023-11-16  1390  	block->committing = true;
95a72357688803 Matthew Sakai 2023-11-16  1391  
95a72357688803 Matthew Sakai 2023-11-16  1392  	/*
95a72357688803 Matthew Sakai 2023-11-16  1393  	 * We must issue a flush and a FUA for every commit. The flush is necessary to ensure that
95a72357688803 Matthew Sakai 2023-11-16  1394  	 * the data being referenced is stable. The FUA is necessary to ensure that the journal
95a72357688803 Matthew Sakai 2023-11-16  1395  	 * block itself is stable before allowing overwrites of the lbn's previous data.
95a72357688803 Matthew Sakai 2023-11-16  1396  	 */
f7f46761ccd9b4 Mike Snitzer  2023-08-25  1397  	vdo_submit_metadata_vio(&block->vio, journal->origin + block->block_number,
b863d7f7503c42 Mike Snitzer  2024-02-05  1398  				complete_write_endio, handle_write_error,
b863d7f7503c42 Mike Snitzer  2024-02-05  1399  				REQ_OP_WRITE | REQ_PRIO | REQ_PREFLUSH | REQ_SYNC | REQ_FUA);
95a72357688803 Matthew Sakai 2023-11-16  1400  }
95a72357688803 Matthew Sakai 2023-11-16  1401  

:::::: The code at line 1369 was first introduced by commit
:::::: 95a72357688803736bf60db973cbf94c0ff3a6da dm vdo: add the recovery journal

:::::: TO: Matthew Sakai <msakai@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
