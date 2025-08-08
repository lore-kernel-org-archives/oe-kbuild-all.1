Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EDC25A353
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754645030; cv=none; b=sLuSurkiBvBmSbaJ0flm8t8e8l859caCbz/Uwa3o2SjQwQQyPruY5knSGt/7146Ze/9P6+ImuVc/SFYY8UVTbaDiYdH9DPa9U8U7n+cZKlQ+jVCRJ7KDIUDrt6Pf/HjKq88uLRvF3KFxy3YZV7O9ReBOkMY0nBjvYoEyo+QDIdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754645030; c=relaxed/simple;
	bh=7nS/LIUCpHcH2XUsals16Mv5pj3DdV0iml2sEi26PkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXY3R4jGHOWUdyVVOWsP0c/zh12XSg2rf8looX2MV0mo+bGWIIT/zEMyqGwRrpG/JFt4e1VlO/GTGxd7G9owN+7XDv0h4tkvSQCgR1E0OrHgxv5DIrVBrSONsetP1+UfBNaOAYPF82nFmRws6rXBvHVXj5JYyFtpb1o8bg4LbS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtlANLWG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtlANLWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754645028; x=1786181028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7nS/LIUCpHcH2XUsals16Mv5pj3DdV0iml2sEi26PkA=;
  b=CtlANLWGpbf5TLWYU02GCdPltuBB3pLPNrrYHT3peklWsOxUhpS/tnHp
   3EcFY9lnoJTEIEL+YUJlKz3cBTbc40uCz48LgY0R/cbfWTRU8K8Yz5Ncl
   aA3UyrSkno0qWVjn5FccP1fz1I3SqxLwIU/rAtmljBr3a4IwM8DIQWswB
   nqkLYaHWHVBID/Vhge9wCPZcY2IvgGgevhIeXnGJrVUSHUNmm7EjdGEGC
   8shvXWdi0kydqPq3SGzTrs2jZLv7kzTLO7VO3yDgf7NaJlGS4IGnx7SEk
   G8id5KwSniFfALjvLJKLG397tXvgZkGo4p2UfLzF2PFVkJT/d1KMLyGgb
   Q==;
X-CSE-ConnectionGUID: XYjNU2f9TrGMpm35bfcciA==
X-CSE-MsgGUID: V087C78HQKenviJJy8nAGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="79549257"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="79549257"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 02:23:46 -0700
X-CSE-ConnectionGUID: nuGH1uwLT7+gaKobcgGQKw==
X-CSE-MsgGUID: ezZ3zVe1RH2aU2P9on08Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165698538"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Aug 2025 02:23:45 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukJKA-0003jq-2d;
	Fri, 08 Aug 2025 09:23:42 +0000
Date: Fri, 8 Aug 2025 17:20:30 +0800
From: kernel test robot <lkp@intel.com>
To: prey169 <francisdrossi@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement
 expected after case label
Message-ID: <202508081734.WXGUSwQR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/932
head:   915859f405371256809f5cfd351e87d53a396d8f
commit: baec94c2772407d9791a3560e7fbf5f3042a1876 Switch statment evaluate ids and confirm they are unique going forward
date:   29 hours ago
config: x86_64-randconfig-123-20250808 (https://download.01.org/0day-ci/archive/20250808/202508081734.WXGUSwQR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081734.WXGUSwQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508081734.WXGUSwQR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/acl.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/bkey.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/alloc_foreground.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/alloc_foreground.c:207:27: sparse: sparse: context imbalance in '__try_alloc_bucket' - different lock contexts for basic block
   fs/bcachefs/alloc_foreground.c:835:12: sparse: sparse: context imbalance in 'bucket_alloc_set_partial' - wrong count at exit
   fs/bcachefs/alloc_foreground.c:1447:9: sparse: sparse: context imbalance in 'bch2_open_buckets_to_text' - different lock contexts for basic block
   fs/bcachefs/alloc_foreground.c:1461:9: sparse: sparse: context imbalance in 'bch2_open_buckets_partial_to_text' - wrong count at exit
--
   fs/bcachefs/backpointers.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/alloc_background.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/alloc_background.c:1009:21: sparse: sparse: context imbalance in 'bch2_trigger_alloc' - different lock contexts for basic block
   fs/bcachefs/alloc_background.c:1795:17: sparse: sparse: context imbalance in 'bch2_discard_one_bucket' - different lock contexts for basic block
   fs/bcachefs/alloc_background.c:2105:17: sparse: sparse: context imbalance in 'invalidate_one_bucket' - different lock contexts for basic block
--
   fs/bcachefs/bkey_sort.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/bkey_methods.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/btree_cache.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/btree_gc.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/bset.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/btree_journal_iter.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/btree_journal_iter.c:406:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct journal_key_range_overwritten *prev_range @@     got struct journal_key_range_overwritten [noderef] __rcu * @@
   fs/bcachefs/btree_journal_iter.c:406:34: sparse:     expected struct journal_key_range_overwritten *prev_range
   fs/bcachefs/btree_journal_iter.c:406:34: sparse:     got struct journal_key_range_overwritten [noderef] __rcu *
   fs/bcachefs/btree_journal_iter.c:408:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct journal_key_range_overwritten *next_range @@     got struct journal_key_range_overwritten [noderef] __rcu * @@
   fs/bcachefs/btree_journal_iter.c:408:34: sparse:     expected struct journal_key_range_overwritten *next_range
   fs/bcachefs/btree_journal_iter.c:408:34: sparse:     got struct journal_key_range_overwritten [noderef] __rcu *
   fs/bcachefs/btree_journal_iter.c:416:51: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct journal_key_range_overwritten [noderef] __rcu *overwritten_range @@     got struct journal_key_range_overwritten *prev_range @@
   fs/bcachefs/btree_journal_iter.c:416:51: sparse:     expected struct journal_key_range_overwritten [noderef] __rcu *overwritten_range
   fs/bcachefs/btree_journal_iter.c:416:51: sparse:     got struct journal_key_range_overwritten *prev_range
   fs/bcachefs/btree_journal_iter.c:419:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_journal_iter.c:419:25: sparse:    struct journal_key_range_overwritten [noderef] __rcu *
   fs/bcachefs/btree_journal_iter.c:419:25: sparse:    struct journal_key_range_overwritten *
   fs/bcachefs/btree_journal_iter.c:687:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct journal_key_range_overwritten [noderef] __rcu *overwritten_range @@
   fs/bcachefs/btree_journal_iter.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1323:38: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_journal_iter.c:145:9: sparse: sparse: context imbalance in 'bch2_journal_keys_peek_prev_min' - different lock contexts for basic block
--
   fs/bcachefs/btree_io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/btree_key_cache.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/btree_key_cache.c:863:9: sparse: sparse: dereference of noderef expression
--
   fs/bcachefs/btree_node_scan.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/btree_locking.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/btree_locking.c:320:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_locking.c:320:36: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree_locking.c:320:36: sparse:    struct btree_path *
--
   fs/bcachefs/btree_iter.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/btree_iter.c:1685:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_iter.c:1685:9: sparse:    unsigned long [noderef] __rcu *
   fs/bcachefs/btree_iter.c:1685:9: sparse:    unsigned long *
   fs/bcachefs/btree_iter.c:1686:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_iter.c:1686:9: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree_iter.c:1686:9: sparse:    struct btree_path *
   fs/bcachefs/btree_iter.c:1687:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_iter.c:1687:9: sparse:    unsigned short [noderef] __rcu *
   fs/bcachefs/btree_iter.c:1687:9: sparse:    unsigned short [usertype] *
   fs/bcachefs/btree_iter.c:1688:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_iter.c:1688:9: sparse:    struct btree_insert_entry [noderef] __rcu *
   fs/bcachefs/btree_iter.c:1688:9: sparse:    struct btree_insert_entry *
   fs/bcachefs/btree_iter.c:3703:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_iter.c:3703:36: sparse:    struct btree_path [noderef] __rcu *
   fs/bcachefs/btree_iter.c:3703:36: sparse:    struct btree_path *
   fs/bcachefs/btree_iter.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:400:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_unlock' - unexpected unlock
   fs/bcachefs/btree_iter.c:3326:9: sparse: sparse: context imbalance in 'bch2_trans_srcu_lock' - different lock contexts for basic block
   fs/bcachefs/btree_iter.c:3604:9: sparse: sparse: context imbalance in 'bch2_trans_put' - different lock contexts for basic block
--
   fs/bcachefs/btree_trans_commit.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/btree_trans_commit.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1323:38: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_trans_commit.c: note: in included file (through fs/bcachefs/btree_update.h, fs/bcachefs/btree_update_interior.h):
   fs/bcachefs/journal.h:323:29: sparse: sparse: context imbalance in '__bch2_trans_commit' - different lock contexts for basic block
--
   fs/bcachefs/btree_update.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/buckets_waiting_for_journal.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/btree_write_buffer.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/btree_write_buffer.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1323:38: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_write_buffer.c:216:13: sparse: sparse: context imbalance in 'move_keys_from_inc_to_flushing' - wrong count at exit
   fs/bcachefs/btree_write_buffer.c:540:9: sparse: sparse: context imbalance in 'fetch_wb_keys_from_journal' - different lock contexts for basic block
--
   fs/bcachefs/clock.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/clock.c:41:6: sparse: sparse: context imbalance in 'bch2_io_timer_del' - wrong count at exit
   fs/bcachefs/clock.c:136:9: sparse: sparse: context imbalance in '__bch2_increment_clock' - wrong count at exit
   fs/bcachefs/clock.c:150:9: sparse: sparse: context imbalance in 'bch2_io_timers_to_text' - wrong count at exit
--
   fs/bcachefs/btree_update_interior.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/btree_update_interior.c:1210:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree_update_interior.c:1210:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree_update_interior.c:1210:18: sparse:    unsigned int enum bch_watermark
   fs/bcachefs/btree_update_interior.c:315:21: sparse: sparse: context imbalance in '__bch2_btree_node_alloc' - different lock contexts for basic block
--
   fs/bcachefs/chardev.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/chardev.c: note: in included file (through fs/bcachefs/move_types.h, fs/bcachefs/rebalance_types.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_ioctl.h:308:43: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_ioctl.h:461:44: sparse: sparse: array of flexible structures
--
   fs/bcachefs/checksum.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/buckets.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/compress.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/debug.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/data_update.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/dirent.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/disk_accounting.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/errcode.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/enumerated_ref.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/disk_groups.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/error.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/extent_update.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/fs-ioctl.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/ec.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/ec.c:910:13: sparse: sparse: context imbalance in 'bch2_stripe_is_open' - wrong count at exit
   fs/bcachefs/ec.c:928:9: sparse: sparse: context imbalance in 'bch2_try_open_stripe' - wrong count at exit
   fs/bcachefs/ec.c:936:23: sparse: sparse: context imbalance in 'bch2_stripe_close' - wrong count at exit
--
   fs/bcachefs/fs-io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/extents.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/fs.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/fs.c:314:13: sparse: sparse: context imbalance in '__wait_on_freeing_inode' - unexpected unlock
   fs/bcachefs/fs.c:330:30: sparse: sparse: context imbalance in 'bch2_inode_hash_find' - wrong count at exit
--
   fs/bcachefs/fs-io-pagecache.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/fs-io-pagecache.c:170:9: sparse: sparse: context imbalance in '__bch2_folio_set' - wrong count at exit
   fs/bcachefs/fs-io-pagecache.c:261:17: sparse: sparse: context imbalance in 'bch2_mark_pagecache_unallocated' - different lock contexts for basic block
   fs/bcachefs/fs-io-pagecache.c:305:17: sparse: sparse: context imbalance in 'bch2_mark_pagecache_reserved' - different lock contexts for basic block
--
   fs/bcachefs/fs-io-direct.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/fs-io-direct.c:551:35: sparse: sparse: context imbalance in 'bch2_dio_write_continue' - different lock contexts for basic block
   fs/bcachefs/fs-io-direct.c:580:9: sparse: sparse: context imbalance in 'bch2_dio_write_loop_async' - wrong count at exit
   fs/bcachefs/fs-io-direct.c:551:35: sparse: sparse: context imbalance in 'bch2_direct_write' - different lock contexts for basic block
--
   fs/bcachefs/fs-io-buffered.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/fs-io-buffered.c:436:17: sparse: sparse: context imbalance in 'bch2_writepage_io_done' - different lock contexts for basic block
--
   fs/bcachefs/io_misc.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/inode.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/inode.c:887:9: sparse: sparse: cast to restricted __le64
   fs/bcachefs/inode.c:887:9: sparse: sparse: cast from restricted __le32
   fs/bcachefs/inode.c:1063:35: sparse: sparse: cast to restricted __le64
   fs/bcachefs/inode.c:1063:35: sparse: sparse: cast from restricted __le32
--
   fs/bcachefs/journal_sb.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/journal_seq_blacklist.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/keylist.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/io_read.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/journal_reclaim.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/journal_reclaim.c:280:13: sparse: sparse: context imbalance in 'should_discard_bucket' - wrong count at exit
   fs/bcachefs/journal_reclaim.c:353:9: sparse: sparse: context imbalance in 'bch2_journal_pin_put' - wrong count at exit
   fs/bcachefs/journal_reclaim.c:389:9: sparse: sparse: context imbalance in 'bch2_journal_pin_drop' - wrong count at exit
   fs/bcachefs/journal_reclaim.c:432:6: sparse: sparse: context imbalance in 'bch2_journal_pin_copy' - wrong count at exit
   fs/bcachefs/journal_reclaim.c:640:16: sparse: sparse: context imbalance in 'journal_seq_to_flush' - wrong count at exit
   fs/bcachefs/journal_reclaim.c:833:13: sparse: sparse: context imbalance in 'journal_pins_still_flushing' - wrong count at exit
   fs/bcachefs/journal_reclaim.c:861:12: sparse: sparse: context imbalance in 'journal_flush_done' - different lock contexts for basic block
   fs/bcachefs/journal_reclaim.c:991:6: sparse: sparse: context imbalance in 'bch2_journal_seq_pins_to_text' - wrong count at exit
--
   fs/bcachefs/logged_ops.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/journal.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/journal.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1323:38: sparse: sparse: array of flexible structures
   fs/bcachefs/journal.c:339:6: sparse: sparse: context imbalance in 'bch2_journal_halt' - wrong count at exit
   fs/bcachefs/journal.c:365:6: sparse: sparse: context imbalance in 'bch2_journal_entry_close' - wrong count at exit
   fs/bcachefs/journal.c:534:9: sparse: sparse: context imbalance in 'journal_write_work' - wrong count at exit
   fs/bcachefs/journal.c:752:6: sparse: sparse: context imbalance in 'bch2_journal_entry_res_resize' - wrong count at exit
   fs/bcachefs/journal.c: note: in included file (through fs/bcachefs/btree_update.h):
   fs/bcachefs/journal.h:323:29: sparse: sparse: context imbalance in 'bch2_journal_flush_seq_async' - different lock contexts for basic block
   fs/bcachefs/journal.c:926:6: sparse: sparse: context imbalance in 'bch2_journal_noflush_seq' - different lock contexts for basic block
   fs/bcachefs/journal.h:323:29: sparse: sparse: context imbalance in '__bch2_journal_meta' - different lock contexts for basic block
   fs/bcachefs/journal.c:1076:9: sparse: sparse: context imbalance in '__bch2_next_write_buffer_flush_journal_buf' - wrong count at exit
   fs/bcachefs/journal.c:1200:9: sparse: sparse: context imbalance in 'bch2_set_nr_journal_buckets_iter' - different lock contexts for basic block
   fs/bcachefs/journal.c:1399:13: sparse: sparse: context imbalance in 'bch2_journal_writing_to_device' - wrong count at exit
   fs/bcachefs/journal.c:1544:6: sparse: sparse: context imbalance in 'bch2_journal_set_replay_done' - wrong count at exit
   fs/bcachefs/journal.c:1807:6: sparse: sparse: context imbalance in 'bch2_journal_debug_to_text' - wrong count at exit
--
   fs/bcachefs/fsck.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/fsck.c:378:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] fs_path_parent @@     got int @@
   fs/bcachefs/fsck.c:378:42: sparse:     expected restricted __le32 [usertype] fs_path_parent
   fs/bcachefs/fsck.c:378:42: sparse:     got int
--
   fs/bcachefs/io_write.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/lru.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/migrate.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/nocow_locking.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/nocow_locking.c:44:6: sparse: sparse: context imbalance in '__bch2_bucket_nocow_trylock' - wrong count at exit
--
   fs/bcachefs/progress.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/quota.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/journal_io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/journal_io.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1323:38: sparse: sparse: array of flexible structures
--
   fs/bcachefs/sb-counters.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/sb-clean.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/sb-clean.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:632:38: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1323:38: sparse: sparse: array of flexible structures
--
   fs/bcachefs/sb-downgrade.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/sb-downgrade.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/sb-downgrade_format.h:14:52: sparse: sparse: array of flexible structures
--
   fs/bcachefs/sb-errors.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/recovery_passes.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/recovery_passes.c:340:5: sparse: sparse: context imbalance in '__bch2_run_explicit_recovery_pass' - wrong count at exit
   fs/bcachefs/recovery_passes.c: note: in included file:
   fs/bcachefs/movinggc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/movinggc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/movinggc.h:11:33: sparse:    struct task_struct *
--
   fs/bcachefs/movinggc.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/movinggc.c:421:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/movinggc.c:421:21: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/movinggc.c:421:21: sparse:    struct task_struct *
--
   fs/bcachefs/namei.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/recovery.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/recovery.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:632:38: sparse: sparse: array of flexible structures
   fs/bcachefs/bcachefs_format.h:1323:38: sparse: sparse: array of flexible structures
   fs/bcachefs/recovery.c: note: in included file:
   fs/bcachefs/movinggc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/movinggc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/movinggc.h:11:33: sparse:    struct task_struct *
--
   fs/bcachefs/sb-members.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/rebalance.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/replicas.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/replicas.c: note: in included file (through fs/bcachefs/disk_accounting_format.h, fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/replicas_format.h:25:45: sparse: sparse: array of flexible structures
   fs/bcachefs/replicas_format.h:13:45: sparse: sparse: array of flexible structures
--
   fs/bcachefs/reflink.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/str_hash.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/move.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/opts.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/opts.c: note: in included file:
   fs/bcachefs/movinggc.h:11:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/movinggc.h:11:33: sparse:    struct task_struct [noderef] __rcu *
   fs/bcachefs/movinggc.h:11:33: sparse:    struct task_struct *
--
   fs/bcachefs/thread_with_file.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/subvolume.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/async_objs.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/sysfs.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/xattr.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/xattr.c:564:9: sparse: sparse: context imbalance in 'bch2_xattr_bcachefs_set' - different lock contexts for basic block
--
   fs/bcachefs/super-io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/super-io.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
   fs/bcachefs/sb-downgrade_format.h:14:52: sparse: sparse: array of flexible structures
   fs/bcachefs/super-io.c:579:19: sparse: sparse: cast to restricted __le32
   fs/bcachefs/super-io.c:578:19: sparse: sparse: cast to restricted __le64
--
   fs/bcachefs/super.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
   fs/bcachefs/super.c:2416:9: sparse: sparse: context imbalance in 'bdev_get_fs' - wrong count at exit
   fs/bcachefs/super.c:2432:13: sparse: sparse: context imbalance in 'bch2_fs_bdev_mark_dead' - unexpected unlock
   fs/bcachefs/super.c:2484:13: sparse: sparse: context imbalance in 'bch2_fs_bdev_sync' - unexpected unlock
--
   fs/bcachefs/snapshot.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label
--
   fs/bcachefs/trace.c: note: in included file (through fs/bcachefs/bcachefs_format.h, fs/bcachefs/bcachefs.h):
>> fs/bcachefs/sb-counters_format.h:132:9: sparse: sparse: statement expected after case label

vim +132 fs/bcachefs/sb-counters_format.h

   126	
   127	static inline void __maybe_unused check_bch_counter_ids_unique(void) {
   128		switch(0){
   129	#define x(t, n, ...) case (n):
   130	        BCH_PERSISTENT_COUNTERS()
   131	#undef x
 > 132		}
   133	}
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
