Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF5A37D110
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345113; cv=none; b=hglkxUwQwlxrX4Qmd/RDvub0eySJr1OhD//u6zLcRBOuppsBpnLkEl2d5H+q5XV0Cqgm/nOGJq2xJPpjRUULsNniQ1+9VEftgn+mnIH49jAEToUeVi3kUZcHzwu0fDvwjj/1hQwJNZdnvH13DfaZj05hQkkdIgPat+/bK89Cgek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345113; c=relaxed/simple;
	bh=XT3mFTv/03DzlACFSY9c/9jd3+SMzGNPzBbhDEIv5Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e7GhXCnpaOoNIu/UA6zjYBu0oy3UJpxjEyye2oXhCXAWv0OKzFMVJjwh3tYO2opl0XtE1JXBI79FmSFklOGa7BpzZIQnjdJBfFti1nSV6Rtv/8ixJPXMC2eea0iepJuu2cFRaq/IkHfLo9967JQEKmQLFH+qGbvQnTX8ZhOLaCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUGb5cm8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUGb5cm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780345111; x=1811881111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XT3mFTv/03DzlACFSY9c/9jd3+SMzGNPzBbhDEIv5Ek=;
  b=aUGb5cm8HIn2uEpuBIC3ssZPAdlfW1S7303jHaqQISDYqi+7JXOmhpgF
   W5kDphQGVavv8irv6jpwZumhgwbZ0psVhVHrGN+kqsbfcHRKPL6jkI38T
   AhCALw95DtDWxkKiD+G2xLqeuT5UbBKgdtHtwPuZrnleZAM/WpbfB4+8u
   /uzw/2arLlmohC9WDENh+FLatbVAZS8mc6Mp0QkuCB3WWnlkBtJLdAG3F
   bghz0960S1FZcdWpPv7ibJIZHo1PxBLF2dGRFnKgVDESjHAdfr7YMjgZU
   iglpFCnviwGyiDqb++9fvPa3xif7Ezm7hQwmKFTWDxkOzqTKGp7aDBFPz
   g==;
X-CSE-ConnectionGUID: zOE7D00sRL2OEl/sTVxnlg==
X-CSE-MsgGUID: EtWTf3RhTA2yZoDbqWN0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68651170"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="68651170"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 13:18:30 -0700
X-CSE-ConnectionGUID: aCJ1GA0ORj+jX/gcQlM3RQ==
X-CSE-MsgGUID: v9Rdk4oKTDKhf+NoUwZhag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248603907"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jun 2026 13:18:27 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU95c-00000000B3W-1VFW;
	Mon, 01 Jun 2026 20:18:24 +0000
Date: Tue, 02 Jun 2026 04:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 =?utf-8?Q?"Bj=C3=B6rn?= =?utf-8?Q?_T=C3=B6pel"?= <bjorn@rivosinc.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: fs/dax.c:728:39: sparse: sparse: incorrect type in argument
 1 (different base types)
Message-ID: <202606020427.izbA3vh3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: d438d273417055241ebaaf1ba3be23459fc27cba mm: remove devmap related functions and page table bits
date:   11 months ago
config: s390-randconfig-r112-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020427.izbA3vh3-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020427.izbA3vh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d438d2734170 ("mm: remove devmap related functions and page table bits")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020427.izbA3vh3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/dax.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/fs_dax.h):
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:105:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:105:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:105:1: sparse:     got restricted vm_fault_t
>> fs/dax.c:728:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long v @@     got restricted vm_fault_t @@
   fs/dax.c:728:39: sparse:     expected unsigned long v
   fs/dax.c:728:39: sparse:     got restricted vm_fault_t
   fs/dax.c:730:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long v @@     got restricted vm_fault_t @@
   fs/dax.c:730:39: sparse:     expected unsigned long v
   fs/dax.c:730:39: sparse:     got restricted vm_fault_t
   fs/dax.c:734:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long v @@     got restricted vm_fault_t @@
   fs/dax.c:734:31: sparse:     expected unsigned long v
   fs/dax.c:734:31: sparse:     got restricted vm_fault_t
   fs/dax.c:1370:41: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:1370:41: sparse:     expected int result
   fs/dax.c:1370:41: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
>> fs/dax.c:1878:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/dax.c:1878:21: sparse:     expected int ret
   fs/dax.c:1878:21: sparse:     got restricted vm_fault_t
   fs/dax.c:1881:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/dax.c:1881:21: sparse:     expected int ret
   fs/dax.c:1881:21: sparse:     got restricted vm_fault_t
>> fs/dax.c:1884:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int ret @@
   fs/dax.c:1884:16: sparse:     expected restricted vm_fault_t
   fs/dax.c:1884:16: sparse:     got int ret
>> fs/dax.c:1902:46: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [usertype] ret @@
   fs/dax.c:1902:46: sparse:     expected int result
   fs/dax.c:1902:46: sparse:     got restricted vm_fault_t [usertype] ret
>> fs/dax.c:1918:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] ret @@     got unsigned long @@
   fs/dax.c:1918:21: sparse:     expected restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:1918:21: sparse:     got unsigned long
   fs/dax.c:1961:51: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:1961:51: sparse:     expected int result
   fs/dax.c:1961:51: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:2041:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] ret @@     got unsigned long @@
   fs/dax.c:2041:21: sparse:     expected restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:2041:21: sparse:     got unsigned long
   fs/dax.c:2076:62: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:2076:62: sparse:     expected int result
   fs/dax.c:2076:62: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:2138:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t @@
   fs/dax.c:2138:55: sparse:     expected int result
   fs/dax.c:2138:55: sparse:     got restricted vm_fault_t
   fs/dax.c:2156:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:2156:58: sparse:     expected int result
   fs/dax.c:2156:58: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:279:13: sparse: sparse: context imbalance in 'wait_entry_unlocked' - unexpected unlock
   fs/dax.c:509:49: sparse: sparse: context imbalance in 'dax_lock_folio' - different lock contexts for basic block
   fs/dax.c:576:17: sparse: sparse: context imbalance in 'dax_lock_mapping_entry' - different lock contexts for basic block
   fs/dax.c:1142:9: sparse: sparse: context imbalance in 'dax_writeback_one' - unexpected unlock

vim +728 fs/dax.c

2f437effc689ef9 Shiyang Ruan            2022-06-03  621  
ac401cc782429cc Jan Kara                2016-05-12  622  /*
a77d19f46a37c0f Matthew Wilcox          2018-03-27  623   * Find page cache entry at given index. If it is a DAX entry, return it
a77d19f46a37c0f Matthew Wilcox          2018-03-27  624   * with the entry locked. If the page cache doesn't contain an entry at
a77d19f46a37c0f Matthew Wilcox          2018-03-27  625   * that index, add a locked empty entry.
ac401cc782429cc Jan Kara                2016-05-12  626   *
3159f943aafdbac Matthew Wilcox          2017-11-03  627   * When requesting an entry with size DAX_PMD, grab_mapping_entry() will
b15cd800682fcaf Matthew Wilcox          2018-03-29  628   * either return that locked entry or will return VM_FAULT_FALLBACK.
b15cd800682fcaf Matthew Wilcox          2018-03-29  629   * This will happen if there are any PTE entries within the PMD range
b15cd800682fcaf Matthew Wilcox          2018-03-29  630   * that we are requesting.
642261ac995e01d Ross Zwisler            2016-11-08  631   *
b15cd800682fcaf Matthew Wilcox          2018-03-29  632   * We always favor PTE entries over PMD entries. There isn't a flow where we
b15cd800682fcaf Matthew Wilcox          2018-03-29  633   * evict PTE entries in order to 'upgrade' them to a PMD entry.  A PMD
b15cd800682fcaf Matthew Wilcox          2018-03-29  634   * insertion will fail if it finds any PTE entries already in the tree, and a
b15cd800682fcaf Matthew Wilcox          2018-03-29  635   * PTE insertion will cause an existing PMD entry to be unmapped and
b15cd800682fcaf Matthew Wilcox          2018-03-29  636   * downgraded to PTE entries.  This happens for both PMD zero pages as
b15cd800682fcaf Matthew Wilcox          2018-03-29  637   * well as PMD empty entries.
642261ac995e01d Ross Zwisler            2016-11-08  638   *
b15cd800682fcaf Matthew Wilcox          2018-03-29  639   * The exception to this downgrade path is for PMD entries that have
b15cd800682fcaf Matthew Wilcox          2018-03-29  640   * real storage backing them.  We will leave these real PMD entries in
b15cd800682fcaf Matthew Wilcox          2018-03-29  641   * the tree, and PTE writes will simply dirty the entire PMD entry.
642261ac995e01d Ross Zwisler            2016-11-08  642   *
ac401cc782429cc Jan Kara                2016-05-12  643   * Note: Unlike filemap_fault() we don't honor FAULT_FLAG_RETRY flags. For
ac401cc782429cc Jan Kara                2016-05-12  644   * persistent memory the benefit is doubtful. We can add that later if we can
ac401cc782429cc Jan Kara                2016-05-12  645   * show it helps.
b15cd800682fcaf Matthew Wilcox          2018-03-29  646   *
b15cd800682fcaf Matthew Wilcox          2018-03-29  647   * On error, this function does not return an ERR_PTR.  Instead it returns
b15cd800682fcaf Matthew Wilcox          2018-03-29  648   * a VM_FAULT code, encoded as an xarray internal entry.  The ERR_PTR values
b15cd800682fcaf Matthew Wilcox          2018-03-29  649   * overlap with xarray value entries.
ac401cc782429cc Jan Kara                2016-05-12  650   */
b15cd800682fcaf Matthew Wilcox          2018-03-29  651  static void *grab_mapping_entry(struct xa_state *xas,
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  652) 		struct address_space *mapping, unsigned int order)
ac401cc782429cc Jan Kara                2016-05-12  653  {
b15cd800682fcaf Matthew Wilcox          2018-03-29  654  	unsigned long index = xas->xa_index;
1a14e3779dd58c1 Jan Kara                2021-06-28  655  	bool pmd_downgrade;	/* splitting PMD entry into PTE entries? */
b15cd800682fcaf Matthew Wilcox          2018-03-29  656  	void *entry;
ac401cc782429cc Jan Kara                2016-05-12  657  
b15cd800682fcaf Matthew Wilcox          2018-03-29  658  retry:
1a14e3779dd58c1 Jan Kara                2021-06-28  659  	pmd_downgrade = false;
b15cd800682fcaf Matthew Wilcox          2018-03-29  660  	xas_lock_irq(xas);
6be3e21d25ca2db Alistair Popple         2025-02-28  661  	entry = get_next_unlocked_entry(xas, order);
642261ac995e01d Ross Zwisler            2016-11-08  662  
b15cd800682fcaf Matthew Wilcox          2018-03-29  663  	if (entry) {
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  664) 		if (dax_is_conflict(entry))
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  665) 			goto fallback;
0e40de0338d005f Matthew Wilcox          2018-11-16  666  		if (!xa_is_value(entry)) {
49688e654e48ae1 Hao Li                  2020-07-29  667  			xas_set_err(xas, -EIO);
91d25ba8a6b0d81 Ross Zwisler            2017-09-06  668  			goto out_unlock;
91d25ba8a6b0d81 Ross Zwisler            2017-09-06  669  		}
91d25ba8a6b0d81 Ross Zwisler            2017-09-06  670  
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  671) 		if (order == 0) {
91d25ba8a6b0d81 Ross Zwisler            2017-09-06  672  			if (dax_is_pmd_entry(entry) &&
642261ac995e01d Ross Zwisler            2016-11-08  673  			    (dax_is_zero_entry(entry) ||
642261ac995e01d Ross Zwisler            2016-11-08  674  			     dax_is_empty_entry(entry))) {
642261ac995e01d Ross Zwisler            2016-11-08  675  				pmd_downgrade = true;
642261ac995e01d Ross Zwisler            2016-11-08  676  			}
642261ac995e01d Ross Zwisler            2016-11-08  677  		}
642261ac995e01d Ross Zwisler            2016-11-08  678  	}
642261ac995e01d Ross Zwisler            2016-11-08  679  
642261ac995e01d Ross Zwisler            2016-11-08  680  	if (pmd_downgrade) {
642261ac995e01d Ross Zwisler            2016-11-08  681  		/*
642261ac995e01d Ross Zwisler            2016-11-08  682  		 * Make sure 'entry' remains valid while we drop
b93b016313b3ba8 Matthew Wilcox          2018-04-10  683  		 * the i_pages lock.
642261ac995e01d Ross Zwisler            2016-11-08  684  		 */
b15cd800682fcaf Matthew Wilcox          2018-03-29  685  		dax_lock_entry(xas, entry);
642261ac995e01d Ross Zwisler            2016-11-08  686  
642261ac995e01d Ross Zwisler            2016-11-08  687  		/*
642261ac995e01d Ross Zwisler            2016-11-08  688  		 * Besides huge zero pages the only other thing that gets
642261ac995e01d Ross Zwisler            2016-11-08  689  		 * downgraded are empty entries which don't need to be
642261ac995e01d Ross Zwisler            2016-11-08  690  		 * unmapped.
642261ac995e01d Ross Zwisler            2016-11-08  691  		 */
b15cd800682fcaf Matthew Wilcox          2018-03-29  692  		if (dax_is_zero_entry(entry)) {
b15cd800682fcaf Matthew Wilcox          2018-03-29  693  			xas_unlock_irq(xas);
b15cd800682fcaf Matthew Wilcox          2018-03-29  694  			unmap_mapping_pages(mapping,
b15cd800682fcaf Matthew Wilcox          2018-03-29  695  					xas->xa_index & ~PG_PMD_COLOUR,
977fbdcd5986c9f Matthew Wilcox          2018-01-31  696  					PG_PMD_NR, false);
b15cd800682fcaf Matthew Wilcox          2018-03-29  697  			xas_reset(xas);
b15cd800682fcaf Matthew Wilcox          2018-03-29  698  			xas_lock_irq(xas);
e11f8b7b6c4ea13 Ross Zwisler            2017-04-07  699  		}
e11f8b7b6c4ea13 Ross Zwisler            2017-04-07  700  
d2c997c0f14535e Dan Williams            2017-12-22  701  		dax_disassociate_entry(entry, mapping, false);
b15cd800682fcaf Matthew Wilcox          2018-03-29  702  		xas_store(xas, NULL);	/* undo the PMD join */
698ab77aebffe08 Vivek Goyal             2021-04-28  703  		dax_wake_entry(xas, entry, WAKE_ALL);
7f0e07fb0289519 Matthew Wilcox (Oracle  2021-05-04  704) 		mapping->nrpages -= PG_PMD_NR;
b15cd800682fcaf Matthew Wilcox          2018-03-29  705  		entry = NULL;
b15cd800682fcaf Matthew Wilcox          2018-03-29  706  		xas_set(xas, index);
642261ac995e01d Ross Zwisler            2016-11-08  707  	}
642261ac995e01d Ross Zwisler            2016-11-08  708  
b15cd800682fcaf Matthew Wilcox          2018-03-29  709  	if (entry) {
b15cd800682fcaf Matthew Wilcox          2018-03-29  710  		dax_lock_entry(xas, entry);
b15cd800682fcaf Matthew Wilcox          2018-03-29  711  	} else {
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  712) 		unsigned long flags = DAX_EMPTY;
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  713) 
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  714) 		if (order > 0)
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  715) 			flags |= DAX_PMD;
23c84eb7837514e Matthew Wilcox (Oracle  2019-07-03  716) 		entry = dax_make_entry(pfn_to_pfn_t(0), flags);
b15cd800682fcaf Matthew Wilcox          2018-03-29  717  		dax_lock_entry(xas, entry);
b15cd800682fcaf Matthew Wilcox          2018-03-29  718  		if (xas_error(xas))
b15cd800682fcaf Matthew Wilcox          2018-03-29  719  			goto out_unlock;
7f0e07fb0289519 Matthew Wilcox (Oracle  2021-05-04  720) 		mapping->nrpages += 1UL << order;
ac401cc782429cc Jan Kara                2016-05-12  721  	}
b15cd800682fcaf Matthew Wilcox          2018-03-29  722  
642261ac995e01d Ross Zwisler            2016-11-08  723  out_unlock:
b15cd800682fcaf Matthew Wilcox          2018-03-29  724  	xas_unlock_irq(xas);
b15cd800682fcaf Matthew Wilcox          2018-03-29  725  	if (xas_nomem(xas, mapping_gfp_mask(mapping) & ~__GFP_HIGHMEM))
b15cd800682fcaf Matthew Wilcox          2018-03-29  726  		goto retry;
b15cd800682fcaf Matthew Wilcox          2018-03-29  727  	if (xas->xa_node == XA_ERROR(-ENOMEM))
b15cd800682fcaf Matthew Wilcox          2018-03-29 @728  		return xa_mk_internal(VM_FAULT_OOM);
b15cd800682fcaf Matthew Wilcox          2018-03-29  729  	if (xas_error(xas))
b15cd800682fcaf Matthew Wilcox          2018-03-29  730  		return xa_mk_internal(VM_FAULT_SIGBUS);
e3ad61c64abceeb Ross Zwisler            2016-11-08  731  	return entry;
b15cd800682fcaf Matthew Wilcox          2018-03-29  732  fallback:
b15cd800682fcaf Matthew Wilcox          2018-03-29  733  	xas_unlock_irq(xas);
b15cd800682fcaf Matthew Wilcox          2018-03-29  734  	return xa_mk_internal(VM_FAULT_FALLBACK);
ac401cc782429cc Jan Kara                2016-05-12  735  }
ac401cc782429cc Jan Kara                2016-05-12  736  

:::::: The code at line 728 was first introduced by commit
:::::: b15cd800682fcaf27048b05e42f5c208e4c756c0 dax: Convert page fault handlers to XArray

:::::: TO: Matthew Wilcox <willy@infradead.org>
:::::: CC: Matthew Wilcox <willy@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
