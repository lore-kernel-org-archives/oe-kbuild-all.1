Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCDF190665
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731933272; cv=none; b=X4Bxz6EUxi2FT+ZzimwV1nBbEuzuvOcj0KRmBCGS4zWyG829erQax2ZACRQ0ogwFX4onag7Z5NhcBwfo2D0Qibuh+dCrrDzyRbi5iAg13quu5YInVAeX4PXC211FMQIkezH2wQueMk+eSp8U56lLtKgoB/guk3eBwdv/LjUqa0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731933272; c=relaxed/simple;
	bh=ksGDK1/U26th3guThKmGfeTEzNKziX3032OOsUdpD/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wvuyk42k81wu+urPjp8GutbC4WlAWtJsjuho6HSF23gCx3/DlPChL3vU7vhvRiguOsJs2zE5cwu2EZ/sSkT7eG+uEXV4TlOcI/1AvLuBYkmYF7QtfjpPWIXbaRG5FtocyAXFDNZydJE1iSyHVWM7vxhCTbsdmG2ru1TPPnc0thw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/7QMTY4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/7QMTY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731933270; x=1763469270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ksGDK1/U26th3guThKmGfeTEzNKziX3032OOsUdpD/s=;
  b=P/7QMTY4yeCIr7VA+5nbvywPXonoNN3Vxam1y7hVbg6hiim4F4fsJlhK
   xKRqq4LPdemu+rOBGlQgLDvzDifJHVNrHX59bz/T61SIfu4JZqhVGLWIm
   jACOEpkbotgblu2ZLf4LvKLu2Roszg3PomqlN4A4DbgLWQlS8BWkJdSaC
   V8kDJH9lDU/L/QfWUhRqRmBfmHMIgEmh9Ma8u0GP7wYp+WMiYEqjvU+Xw
   vll5ODuBJVARnmInTaFgJW37AI+C9R865WyMH/0ihnnsE7VaX9XDGq/Lp
   /Ur1KhWn+6e7DOPaTRn9g8/JBP9NVChLJ2m9Gq3YXj5Mn4v7cxK+SsNwN
   w==;
X-CSE-ConnectionGUID: vPQHd9d3RJuZzI1VhXlWLg==
X-CSE-MsgGUID: FlGvQaxSQwykTosLAGMAzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32027372"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32027372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:34:29 -0800
X-CSE-ConnectionGUID: 7q9jOEWeTfqiwquWA/k72g==
X-CSE-MsgGUID: cMTCYizrT9C3tR80q2wcjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="90005282"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Nov 2024 04:34:29 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD0xV-0002QL-37;
	Mon, 18 Nov 2024 12:34:25 +0000
Date: Mon, 18 Nov 2024 20:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 118/120]
 fs/bcachefs/btree_journal_iter.c:385:34: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202411182013.DD1rwsIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   e15820f3f2ecb8d5337781ce8e6ba02aa7615561
commit: c22bd3413784c8b22dd7388fdca7af62364678ca [118/120] bcachefs: fix O(n^2) issue with whiteouts in journal keys
config: nios2-randconfig-r111-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182013.DD1rwsIY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411182013.DD1rwsIY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182013.DD1rwsIY-lkp@intel.com/

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
