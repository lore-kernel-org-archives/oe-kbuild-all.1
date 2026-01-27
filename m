Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1069221F1C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 01:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769477783; cv=none; b=Glw2DIrJqFvuTWiMT2IAJvlP2ASaL0caAb+4Qaofy5/ryF8RD2HzCQscHIJ3bFjAdPBZR5Nb3iAgalB3cX0ENFedA0f6kTU2pLns3ash1NoyQ/r/2Zbrtq4U/VhJhMmBEtjtbv71gqzMH9Iger59WplUeJFHlGBRowJv2076Jss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769477783; c=relaxed/simple;
	bh=GBBuL4uIIQP4TkFIIi4yMHe+0f5L17I104oXjMs0SQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dn7/o7te0X+qTKCQkLZW1uKTaJ/dVcMwaCJapInepGggb1v4foghmwC3sVF4zlYfXZ3tzw77YfPTnS5C7tPCbpavc/VU89qBd0/xqmPYRWzHwqZ8jTABPDWeJGDvnzL6Ug716LNCNwc1bPERmN9d6RV9ptWTf4E+1/3wGCM6wgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIQ2WzjM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIQ2WzjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769477782; x=1801013782;
  h=date:from:to:cc:subject:message-id;
  bh=GBBuL4uIIQP4TkFIIi4yMHe+0f5L17I104oXjMs0SQA=;
  b=iIQ2WzjMT+Vh/c+djZhGnV/tuICbKcY4ySyPNUoMCSm3YkRvptHZzQ1E
   gWas8yBLmMZtiS39Ph8DYDJBAjDm0N12jkM6ydepAYdKNQhkwwsJFp0LO
   eL+QHudtH4B5kiSNifeVBFhqfuCk8aDLW4pNjfTxMs3qkY5uOE8zIXLTY
   gAXa+e6mS+e06LEsMuLUZpYF8p5V3mYKR9EDJgRn0JENghhDu+HwYwdp6
   ZoBWJtYle6s2zJEqsdDSRZhE4AHc0XTX2y+dmcc7dT1vQbm88o6Qen5bp
   FpGoIcUkzX+XJRDB9AhjyYmRNQSg+m7XKw2kWVzwHMQp2N7mr53GFoihv
   g==;
X-CSE-ConnectionGUID: nQRHpInhTLCNeEkp919JJA==
X-CSE-MsgGUID: IrBuuzJCQCubLwgG4TcztA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88240516"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="88240516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:36:20 -0800
X-CSE-ConnectionGUID: 1TylMZPkRziBsC7gLapNyw==
X-CSE-MsgGUID: iUNFVSAvSi+wtbbWEWr37A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207893631"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2026 17:36:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkY07-00000000Xqo-3hyY;
	Tue, 27 Jan 2026 01:36:15 +0000
Date: Tue, 27 Jan 2026 09:35:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 21/270]
 fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum
 types:
Message-ID: <202601270901.RjSvy9Q0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   80f991a3bb405aeddb334b8bf58c2273318dee2f
commit: ef4225fd3371dd0ce8b31150446324c3bd268589 [21/270] bcachefs: Btree node rewrites don't run at BCH_WATERMARK_btree
config: x86_64-randconfig-r122-20260126 (https://download.01.org/0day-ci/archive/20260127/202601270901.RjSvy9Q0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270901.RjSvy9Q0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270901.RjSvy9Q0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree/interior.c: note: in included file:
>> fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_watermark
>> fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_watermark
--
   fs/bcachefs/data/move.c: note: in included file:
>> fs/bcachefs/btree/interior.h:136:18: sparse: sparse: mixing different enum types:
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_trans_commit_flags
   fs/bcachefs/btree/interior.h:136:18: sparse:    unsigned int enum bch_watermark

vim +136 fs/bcachefs/btree/interior.h

   125	
   126	static inline enum bch_trans_commit_flags
   127	btree_update_set_watermark_hipri(enum bch_trans_commit_flags flags)
   128	{
   129		enum bch_watermark watermark = flags & BCH_WATERMARK_MASK;
   130		if (watermark == BCH_WATERMARK_copygc)
   131			watermark = BCH_WATERMARK_btree_copygc;
   132		if (watermark < BCH_WATERMARK_btree)
   133			watermark = BCH_WATERMARK_btree;
   134	
   135		flags &= ~BCH_WATERMARK_MASK;
 > 136		flags |= watermark;
   137		return flags;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
