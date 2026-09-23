Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAEE44C664
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156239; cv=none; b=h8csobSXG5p9mE6qrqxdfUdJBmQHTzC+CcID7ZWJB2Y+BbtddML3HmpFbGqITyPSgXGN4L/tIu9iBs+MJ9b+MCg+R44jBxIlohcLz8JkRBHnaoIZEOGQoPwvvUwvytCU+jJg7IlECgBsQMXgEJ26+91FaJ6wr4zmNcCAJ5nQeaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156239; c=relaxed/simple;
	bh=LB+CFGG2lz/5dvm473XA9blLfE3B0GPtknaZzZ8XL5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bV0Br62Ggcfhu+T3+LkCeGNusI0nrCicimwQkU8Qsz/mmoo9WMXyrz05XKCgmhfewsA5b27s5RWkxnVON8XASNIhNUa/n5UeXHR6owE0DdWK9iv0vSX1uENgPAWjYc7H3ReUrzGf5H5gzZZIT1Ye0iVro0YCeYSK/qRqzewvUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFGFptPd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFGFptPd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790156236; x=1821692236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LB+CFGG2lz/5dvm473XA9blLfE3B0GPtknaZzZ8XL5w=;
  b=TFGFptPdcBwXu3QjD4hz3wb1mxBcnVnmqNhkKaI4a7Len+bLcQigLlte
   w6BfRehMayzd8eJBcmuLqWd55+M9Uif+hYEYGxqbW9Rte72V4Br19ofqx
   Vba1HWm/TkLYIdDhxN+3zq3Uc8U4FohZVInjzrWOmFew1Jqzs8tyKEp1S
   HIe2+yxy5ZUbT1T2IiZ/vBjZsRFqwVvWFvconLsRSLSQqD4NlZ7icYeqH
   Rp4rpS06oNOKU+hDbzam5zZJmbiby+q40hdeW37Tff3kMbJWZ153TSXsk
   5q8+kbG9XyDduG/1Glpl31xs4MRWRIlMpjEp49gLnxwTtQfDx/PTEjtk/
   Q==;
X-CSE-ConnectionGUID: Hww5rh3WR3Sott0NcK3DbQ==
X-CSE-MsgGUID: M69ENl0yQrqteTFjb6QylQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101493543"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101493543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:37:15 -0700
X-CSE-ConnectionGUID: gbj8z/BvSp6JlwhdtNpUNQ==
X-CSE-MsgGUID: VVBmqbHmS/iuwo/QnNFpfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="273017721"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2026 02:37:13 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9JPa-000000000bP-30Ta;
	Wed, 23 Sep 2026 09:37:10 +0000
Date: Wed, 23 Sep 2026 11:36:49 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 49/67] lib/bonsai_tree.c:195:35:
 warning: shift count >= width of type
Message-ID: <202609231110.OQrD4Vlt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-bonsai-clean
head:   1b386f2c853c6e84025fa93d485e69ba8c1d76f4
commit: e4e0485eb66e62a7b03098827e7c3cb59a50d72b [49/67] lib/bonsai_tree: Add 1-byte micro-header and tag filtering metadata
config: hexagon-randconfig-r2102-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231110.OQrD4Vlt-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231110.OQrD4Vlt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231110.OQrD4Vlt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/bonsai_tree.c:195:35: warning: shift count >= width of type [-Wshift-count-overflow]
     195 |                         u8 tag_bit = (node->l.pivot[i] >> 60) & 0xF;
         |                                                        ^  ~~
   lib/bonsai_tree.c:299:22: warning: shift count >= width of type [-Wshift-count-overflow]
     299 |         u8 tag_bit = (index >> 60) & 0xF;
         |                             ^  ~~
   lib/bonsai_tree.c:429:22: warning: shift count >= width of type [-Wshift-count-overflow]
     429 |         u8 tag_bit = (index >> 60) & 0xF;
         |                             ^  ~~
   lib/bonsai_tree.c:480:13: warning: shift count >= width of type [-Wshift-count-overflow]
     480 |                 if ((last >> 60) & 0xF)
         |                           ^  ~~
   lib/bonsai_tree.c:481:34: warning: shift count >= width of type [-Wshift-count-overflow]
     481 |                         curr->m.tag_mask |= BIT((last >> 60) & 0xF);
         |                                                       ^  ~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   lib/bonsai_tree.c:522:13: warning: shift count >= width of type [-Wshift-count-overflow]
     522 |                 if ((last >> 60) & 0xF) {
         |                           ^  ~~
   lib/bonsai_tree.c:527:35: warning: shift count >= width of type [-Wshift-count-overflow]
     527 |                                         anc->m.tag_mask |= BIT((last >> 60) & 0xF);
         |                                                                      ^  ~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   lib/bonsai_tree.c:548:13: warning: shift count >= width of type [-Wshift-count-overflow]
     548 |                 if ((last >> 60) & 0xF)
         |                           ^  ~~
   lib/bonsai_tree.c:549:38: warning: shift count >= width of type [-Wshift-count-overflow]
     549 |                         new_leaf->m.tag_mask |= BIT((last >> 60) & 0xF);
         |                                                           ^  ~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   lib/bonsai_tree.c:556:26: warning: shift count >= width of type [-Wshift-count-overflow]
     556 |                         if ((leaf->l.pivot[i] >> 60) & 0xF)
         |                                               ^  ~~
   lib/bonsai_tree.c:557:51: warning: shift count >= width of type [-Wshift-count-overflow]
     557 |                                 new_leaf->m.tag_mask |= BIT((leaf->l.pivot[i] >> 60) & 0xF);
         |                                                                               ^  ~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   lib/bonsai_tree.c:637:14: warning: shift count >= width of type [-Wshift-count-overflow]
     637 |                         if ((last >> 60) & 0xF) {
         |                                   ^  ~~
   lib/bonsai_tree.c:642:36: warning: shift count >= width of type [-Wshift-count-overflow]
     642 |                                                 anc->m.tag_mask |= BIT((last >> 60) & 0xF);
         |                                                                              ^  ~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   lib/bonsai_tree.c:780:12: warning: shift count >= width of type [-Wshift-count-overflow]
     780 |         if ((last >> 60) & 0xF)
         |                   ^  ~~
   lib/bonsai_tree.c:781:37: warning: shift count >= width of type [-Wshift-count-overflow]
     781 |                 new_root->m.tag_mask |= BIT((last >> 60) & 0xF);
         |                                                   ^  ~~
   include/vdso/bits.h:7:30: note: expanded from macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   15 warnings generated.


vim +195 lib/bonsai_tree.c

   183	
   184	static u8 bonsai_propagate_meta(struct bonsai_tree *bt, u16 node_idx)
   185	{
   186		union bonsai_node *node = bonsai_node_at(bt, node_idx);
   187		u8 mask = 0;
   188		int i, num_children;
   189	
   190		if (!node)
   191			return 0;
   192	
   193		if (node->m.node_type == BONSAI_TYPE_LEAF) {
   194			for (i = 0; i < node->l.meta.num_pivots; i++) {
 > 195				u8 tag_bit = (node->l.pivot[i] >> 60) & 0xF;
   196	
   197				if (tag_bit)
   198					mask |= BIT(tag_bit);
   199			}
   200			node->m.tag_mask = mask;
   201			return mask;
   202		}
   203	
   204		num_children = node->m.num_pivots + 1;
   205		for (i = 0; i < num_children; i++) {
   206			u16 child_idx = (node->m.node_type == BONSAI_TYPE_BRANCH_8)
   207				? node->b8.child_idx[i]
   208				: node->b16.child_idx[i];
   209	
   210			if (child_idx)
   211				mask |= bonsai_propagate_meta(bt, child_idx);
   212		}
   213		node->m.tag_mask = mask;
   214		return mask;
   215	}
   216	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
