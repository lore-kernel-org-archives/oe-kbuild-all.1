Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF93130E27
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 03:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732936251; cv=none; b=eNxB2Ew3kPjKOLFVnluQ6f4gvimINVSKcp5QSgYhjSwW5XhKdS9rMsoBmAlh15Vj1BqtJbHGog6m32O8OLyEVG02wnd2enHCSj60fcvFqdkD2R4nyALjimIKmBT9lBq8aa233ELJi0vQBxTnRbc0foevzajZnMvhFDhAXlCUFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732936251; c=relaxed/simple;
	bh=PPUeRakokNwlESEGgp6scvD7fKWWpdk3PBxJc2kThH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KizQ3YglFiWUkXxVFR8RfOKU39hcrkwWYgwu5dIhFSUGiwG1PH7wer8RbOHLCsmcLosaULCkiinPIV4iVnWEVfaA1fPbiVqnzJXwhS1RqQYRwIaO62AHwXW7a0QFyqJKV5oj1okFhwf4hX8r/Q61ebGfbmozvhe++IxiPwczp0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5CGGS3Z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5CGGS3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732936250; x=1764472250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PPUeRakokNwlESEGgp6scvD7fKWWpdk3PBxJc2kThH0=;
  b=D5CGGS3ZW2oKnEbiOtG3gr7bwK486ykER1PvYf3cujDboJ6+MTSC0qLH
   ggxYzodan9R8bHiZTDfk1RirBxCXE5gxa18v5R1m4Hn7yCll5LA/YqomW
   qgRNAOHVrnURc7pPQyhLCFqSKWrmBmA1Xd+sYdVs9QB0FqKxwSY/zpuaZ
   6PKA/Zs8FYHTG+w5udjKIFyCJVoQ9auitm0SidP8SXRlrQajsk60S6lLL
   K6iivKcmjC403DbJOijH+KsD0G4ZsgVDbQASja7L05M0CpFoQ80T2oW4q
   /XrTTHdhi5huE4yx8DB84AawxM0JAQnJHU9d7aZVwAHfX1L+/pszUx5YQ
   A==;
X-CSE-ConnectionGUID: G9zaZMvQQDGKtt4BdUZt+A==
X-CSE-MsgGUID: jLHSkG+wSlKV/8uIFR67vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="55655192"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="55655192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 19:10:44 -0800
X-CSE-ConnectionGUID: BUF46KleQm+ImEkcZhv6Yg==
X-CSE-MsgGUID: REZLiVisTFecndfgdNAIeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92710435"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Nov 2024 19:10:43 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHDsW-00003B-1k;
	Sat, 30 Nov 2024 03:10:40 +0000
Date: Sat, 30 Nov 2024 11:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 118/120]
 fs/bcachefs/btree_journal_iter.c:385:34: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202411301111.0WNF8OOc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   9409825501d87ecf84b2f59aed749647d86b72f2
commit: c22bd3413784c8b22dd7388fdca7af62364678ca [118/120] bcachefs: fix O(n^2) issue with whiteouts in journal keys
config: nios2-randconfig-r111-20241118 (https://download.01.org/0day-ci/archive/20241130/202411301111.0WNF8OOc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411301111.0WNF8OOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301111.0WNF8OOc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree_journal_iter.c: note: in included file:
   fs/bcachefs/bcachefs.h:992:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/btree_journal_iter.c:385:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct journal_key_range_overwritten *prev_range @@     got struct journal_key_range_overwritten [noderef] __rcu * @@
   fs/bcachefs/btree_journal_iter.c:385:34: sparse:     expected struct journal_key_range_overwritten *prev_range
   fs/bcachefs/btree_journal_iter.c:385:34: sparse:     got struct journal_key_range_overwritten [noderef] __rcu *
>> fs/bcachefs/btree_journal_iter.c:387:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct journal_key_range_overwritten *next_range @@     got struct journal_key_range_overwritten [noderef] __rcu * @@
   fs/bcachefs/btree_journal_iter.c:387:34: sparse:     expected struct journal_key_range_overwritten *next_range
   fs/bcachefs/btree_journal_iter.c:387:34: sparse:     got struct journal_key_range_overwritten [noderef] __rcu *
>> fs/bcachefs/btree_journal_iter.c:395:51: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct journal_key_range_overwritten [noderef] __rcu *overwritten_range @@     got struct journal_key_range_overwritten *prev_range @@
   fs/bcachefs/btree_journal_iter.c:395:51: sparse:     expected struct journal_key_range_overwritten [noderef] __rcu *overwritten_range
   fs/bcachefs/btree_journal_iter.c:395:51: sparse:     got struct journal_key_range_overwritten *prev_range
>> fs/bcachefs/btree_journal_iter.c:398:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/bcachefs/btree_journal_iter.c:398:25: sparse:    struct journal_key_range_overwritten [noderef] __rcu *
   fs/bcachefs/btree_journal_iter.c:398:25: sparse:    struct journal_key_range_overwritten *
>> fs/bcachefs/btree_journal_iter.c:659:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct journal_key_range_overwritten [noderef] __rcu *overwritten_range @@
   fs/bcachefs/btree_journal_iter.c: note: in included file (through fs/bcachefs/bcachefs.h):
   fs/bcachefs/bcachefs_format.h:1265:38: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_journal_iter.c:141:9: sparse: sparse: context imbalance in 'bch2_journal_keys_peek_prev_min' - different lock contexts for basic block
   fs/bcachefs/btree_journal_iter.c: note: in included file (through include/linux/backing-dev-defs.h, fs/bcachefs/bcachefs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/bcachefs/btree_journal_iter.c:653:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/btree_journal_iter.c:756:9: sparse: sparse: self-comparison always evaluates to false
   fs/bcachefs/btree_journal_iter.c:775:9: sparse: sparse: self-comparison always evaluates to false

vim +385 fs/bcachefs/btree_journal_iter.c

   370	
   371	static void __bch2_journal_key_overwritten(struct journal_keys *keys, size_t pos)
   372	{
   373		struct journal_key *k = keys->data + pos;
   374		size_t idx = pos_to_idx(keys, pos);
   375	
   376		k->overwritten = true;
   377	
   378		struct journal_key *prev = idx > 0 ? keys->data + idx_to_pos(keys, idx - 1) : NULL;
   379		struct journal_key *next = idx + 1 < keys->nr ? keys->data + idx_to_pos(keys, idx + 1) : NULL;
   380	
   381		bool prev_overwritten = prev && prev->overwritten;
   382		bool next_overwritten = next && next->overwritten;
   383	
   384		struct journal_key_range_overwritten *prev_range =
 > 385			prev_overwritten ? prev->overwritten_range : NULL;
   386		struct journal_key_range_overwritten *next_range =
 > 387			next_overwritten ? next->overwritten_range : NULL;
   388	
   389		BUG_ON(prev_range && prev_range->end != idx);
   390		BUG_ON(next_range && next_range->start != idx + 1);
   391	
   392		if (prev_range && next_range) {
   393			prev_range->end = next_range->end;
   394	
 > 395			keys->data[pos].overwritten_range = prev_range;
   396			for (size_t i = next_range->start; i < next_range->end; i++) {
   397				struct journal_key *ip = keys->data + idx_to_pos(keys, i);
 > 398				BUG_ON(ip->overwritten_range != next_range);
   399				ip->overwritten_range = prev_range;
   400			}
   401	
   402			kfree_rcu_mightsleep(next_range);
   403		} else if (prev_range) {
   404			prev_range->end++;
   405			k->overwritten_range = prev_range;
   406			if (next_overwritten) {
   407				prev_range->end++;
   408				next->overwritten_range = prev_range;
   409			}
   410		} else if (next_range) {
   411			next_range->start--;
   412			k->overwritten_range = next_range;
   413			if (prev_overwritten) {
   414				next_range->start--;
   415				prev->overwritten_range = next_range;
   416			}
   417		} else if (prev_overwritten || next_overwritten) {
   418			struct journal_key_range_overwritten *r = kmalloc(sizeof(*r), GFP_KERNEL);
   419			if (!r)
   420				return;
   421	
   422			r->start = idx - (size_t) prev_overwritten;
   423			r->end = idx + 1 + (size_t) next_overwritten;
   424	
   425			rcu_assign_pointer(k->overwritten_range, r);
   426			if (prev_overwritten)
   427				prev->overwritten_range = r;
   428			if (next_overwritten)
   429				next->overwritten_range = r;
   430		}
   431	}
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
