Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA8F4A0153
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471714; cv=none; b=SmjDGbi92pwW6GyOKmEchYtrqFCIqhseGVmV3NyOgmUKfAdvnlJJnTK3GrkfxRPN0adUh7+jJi9s9lQP9ec5P+jeBUzUyEcNlzDclNFOQPEafEmcvv5YWb0AjAbsJ3GUPCVAu7dbMLVQRlfec+X9UFkjGO/S+rQL4My//vXq3+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471714; c=relaxed/simple;
	bh=jSoFJXm+QIYNLCPj4kNqwXdblW01terQhf/YpaOWpmc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DJnMjR5rwFSXp8a53mmAx6W3zYxuG45lTyCdOVZSSka2d5f66OBp8+ZZ82V7ynERcF4fkVE3pNlIkfVCXhct5To3Alpe8grt915WnrNmImmsuhH2tmF32V9S7ekIB3yKvxd0wHfylmQgJ+5RQvcLqybUlA7czuRDgceR0bA4N2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKMVuSNr; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKMVuSNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789471711; x=1821007711;
  h=date:from:to:cc:subject:message-id;
  bh=jSoFJXm+QIYNLCPj4kNqwXdblW01terQhf/YpaOWpmc=;
  b=IKMVuSNrsyWWrMd0AsetulASfizmrUqWuUG0LnCvFs+FxJDVxOVuAnm7
   YFpioRDJ0/RpxSzEmHuSc3IvZqwu5mZnW1IDBWLEYK2ErAChH3/4Y1Mm0
   1TG/CqCPsEdbt+jAnqYXV8Y7IyS/47TrSXMjblmet8+C1f81d/yVRz7Vd
   GozxI9OM2t+NscbTjuB1ydM4XgGk6CNVV07fqI9is6I+CzAAl+UCmQvnl
   RLr7wO85cKRwHT0w379c+AgorPXkxbqa2wQBFXb+TDN3hsgnFMFHUBeeV
   DHWWj3ZNYcpCQB6r7DfJJNuj39N/NRjAVgFuUehedjEmcodyUJ49O9QIi
   Q==;
X-CSE-ConnectionGUID: D+r+OI8NSNKo67FVbJ987w==
X-CSE-MsgGUID: t9C5yE9KSj6an4jAqo6QMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="338917"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="338917"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:28:30 -0700
X-CSE-ConnectionGUID: IBkoLIoYRyGwm01pFHbG4Q==
X-CSE-MsgGUID: RT3DLd5kQxaMNj+a6gokxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278244339"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Sep 2026 04:28:28 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6RKs-000000004Sf-1Nrj;
	Tue, 15 Sep 2026 11:28:26 +0000
Date: Tue, 15 Sep 2026 19:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 458/799]
 fs/bcachefs/btree/key_cache.c:849:9: sparse: sparse: dereference of noderef
 expression
Message-ID: <202609151944.XkdSMhhx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: caf90d22262c52f7c29c4b08bd50f2a27d3dbe25 [458/799] bcachefs: move btree files to subdir
config: openrisc-randconfig-r112-20260915 (https://download.01.org/0day-ci/archive/20260915/202609151944.XkdSMhhx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151944.XkdSMhhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151944.XkdSMhhx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/key_cache.c:849:9: sparse: sparse: dereference of noderef expression
--
>> fs/bcachefs/btree/locking.c:328:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/locking.c:328:36: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree/locking.c:328:36: sparse:    struct btree_path *
--
>> fs/bcachefs/btree/interior.c:1191:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.c:1191:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.c:1191:18: sparse:    unsigned int enum bch_watermark
--
>> fs/bcachefs/btree/iter.c:1713:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:1713:9: sparse:    unsigned long [noderef] __rcu *
   fs/bcachefs/btree/iter.c:1713:9: sparse:    unsigned long *
   fs/bcachefs/btree/iter.c:1714:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:1714:9: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree/iter.c:1714:9: sparse:    struct btree_path *
   fs/bcachefs/btree/iter.c:1715:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:1715:9: sparse:    unsigned short [noderef] __rcu *
   fs/bcachefs/btree/iter.c:1715:9: sparse:    unsigned short [usertype] *
   fs/bcachefs/btree/iter.c:1716:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:1716:9: sparse:    struct btree_insert_entry [noderef] __rcu *
   fs/bcachefs/btree/iter.c:1716:9: sparse:    struct btree_insert_entry *
   fs/bcachefs/btree/iter.c:3735:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree/iter.c:3735:36: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree/iter.c:3735:36: sparse:    struct btree_path *
   fs/bcachefs/btree/iter.c:3331:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_unlock' - unexpected unlock
   fs/bcachefs/btree/iter.c:3355:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_lock' - different lock contexts for basic block
   fs/bcachefs/btree/iter.c:3633:9: sparse: sparse: context imbalance in 'bch2_trans_put' - different lock contexts for basic block

vim +849 fs/bcachefs/btree/key_cache.c

d211b408abbcec fs/bcachefs/btree_key_cache.c Kent Overstreet   2020-06-15  841  
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  842  void bch2_btree_key_cache_to_text(struct printbuf *out, struct btree_key_cache *bc)
d211b408abbcec fs/bcachefs/btree_key_cache.c Kent Overstreet   2020-06-15  843  {
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  844  	printbuf_tabstop_push(out, 24);
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  845  	printbuf_tabstop_push(out, 12);
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  846  
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  847  	prt_printf(out, "keys:\t%lu\r\n",		atomic_long_read(&bc->nr_keys));
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  848  	prt_printf(out, "dirty:\t%lu\r\n",		atomic_long_read(&bc->nr_dirty));
f2bfe7e83765f3 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-06-08 @849  	prt_printf(out, "table size:\t%u\r\n",		bc->table.tbl->size);
5f1929f1f077d3 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-06-13  850  	prt_newline(out);
5f1929f1f077d3 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-06-13  851  	prt_printf(out, "shrinker:\n");
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  852  	prt_printf(out, "requested_to_free:\t%lu\r\n",	bc->requested_to_free);
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  853  	prt_printf(out, "freed:\t%lu\r\n",		bc->freed);
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  854  	prt_printf(out, "skipped_dirty:\t%lu\r\n",	bc->skipped_dirty);
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  855  	prt_printf(out, "skipped_accessed:\t%lu\r\n",	bc->skipped_accessed);
5147b9ae768758 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-04-20  856  	prt_printf(out, "skipped_lock_fail:\t%lu\r\n",	bc->skipped_lock_fail);
5f1929f1f077d3 fs/bcachefs/btree_key_cache.c Kent Overstreet   2024-06-13  857  	prt_newline(out);
5396e5af3c1032 fs/bcachefs/btree_key_cache.c Nathan Chancellor 2024-08-21  858  	prt_printf(out, "pending:\t%zu\r\n",		per_cpu_sum(bc->nr_pending));
d211b408abbcec fs/bcachefs/btree_key_cache.c Kent Overstreet   2020-06-15  859  }
14ba3706b3a8b5 fs/bcachefs/btree_key_cache.c Kent Overstreet   2020-11-18  860  

:::::: The code at line 849 was first introduced by commit
:::::: f2bfe7e83765f3bd84382cc75d8ac3ca619de39a bcachefs: Rip out freelists from btree key cache

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
