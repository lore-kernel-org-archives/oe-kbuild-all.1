Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235AF15A84E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 16:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737736566; cv=none; b=sfr7faa70Ua69tuMdnTTPRWN8evApx9y8Z1HT87m9MwNUqhKjjuIB1ToKvVDMwiVXH53FYOyG+exPpQ4krNe8OLn7gExqY716SKcAXmeI7k2MyMyIH5Q0jngsFtcFExMfiwnYBdrLhtPXGiuVBvLCN/BE+thwq1+Hs/5ienxct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737736566; c=relaxed/simple;
	bh=hJuDJ6yASvvirdOkg2HSv+8RJEXY3wtBuUGCtfUEYXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YlxWRfc5NXZLIuBtty1P/21vPYQ8VqVbFpUFUhftyVKX6sIo3GpyB5E2y4r68agDUXW7uKr+MDKB9Gk4y34l1H5lFHfHIrifbZg5ECcjH657xeql1AmQhMWG/Jg3OE5zw+jtP02kJ9sTXJ9Mdol+PSi/fWkhaJ9i4mfghNfi7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRuaj6wv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRuaj6wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737736565; x=1769272565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hJuDJ6yASvvirdOkg2HSv+8RJEXY3wtBuUGCtfUEYXk=;
  b=DRuaj6wvHXJmYmRgw22AqBWYyX87sz4uR7quItOtiS6raybCV7CFsP9P
   jqnqLTFrHrQZnvU9e0ZyvZzGFEvzhmwyvvjt0lrvLqiFoX3Iv9MetaesV
   EInRlJCLOY02AYJFBDxM3+L4NZouV4hgz3WsXx1Yh+u23y7edfgyrD3y4
   769CYV18k6fhsqblxmgwJIIPpLCdYDjLS/F4BiLpplRnoY3JHFI8S7kqO
   jmwbt+WGzA/rLG0C/0CHj5sffj2Yls9Nwg+BgILQsHQhQXWDuJH+fYa32
   KMZiLpX1XPVCCgS9NmG9fpri9A4bDsn3WL1y5M1DBbHlDuuu0LzotHL+H
   g==;
X-CSE-ConnectionGUID: 8v+Ae/rWSj6BHkj48Bjrtg==
X-CSE-MsgGUID: CpM7HJ3kRY6ODgO6QjVbZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="37526082"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="37526082"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 08:36:04 -0800
X-CSE-ConnectionGUID: iLLgGSdATr6yoQ0By3vaEw==
X-CSE-MsgGUID: Cp9HRq/LTuqtVlNmZpBIHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112942292"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jan 2025 08:36:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbMf2-000crP-0l;
	Fri, 24 Jan 2025 16:36:00 +0000
Date: Sat, 25 Jan 2025 00:35:05 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Sakai <msakai@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: drivers/md/dm-vdo/recovery-journal.c:1369: warning: Function
 parameter or struct member 'context' not described in 'write_block'
Message-ID: <202501250031.VDNPqIqw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab18b8fff124c9b76ea12692571ca822dcd92854
commit: 19ac19e02ffa318e77f6b086b8fb3917da0aa893 dm vdo: fix function doc comment formatting
date:   9 weeks ago
config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20250125/202501250031.VDNPqIqw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501250031.VDNPqIqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250031.VDNPqIqw-lkp@intel.com/

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
