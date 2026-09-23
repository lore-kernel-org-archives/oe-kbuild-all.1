Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8F3F410D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155019; cv=none; b=JmHPD6qj0LYwNrgemAj5HMfyKrruXsDOjxhBtZvst5G5tpK3+3CgSLxqdgpUCI+V7tM3/kV+LstOMveF17putpJWLHMBIBGVilw/Zb7P5BgbQgUPbec4zLwTyKz4ZgFIBR6C60JQ68eeX9uG+0YssHcojfGiS/7Lz1B8S5bTPJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155019; c=relaxed/simple;
	bh=cmzlZ+jTcJvDkKvr10C+Rj4EZ88R1aYbrg53u228OUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ffwkmn1nJt5gyzys5ugxeHkyOHucwkjUgAI4HB+wfjKyDtgbcLGjlglZH/S7LEF39Ep2+THFV1taSi6jTzB6nDkhus7Vw9lbQnHwWZ3eJxf5HJgLbOAECmxrMotXZ2tmr+6ksXRjxyiRdjYBIawZLqeYKAcqzJkTmPetGQQzSsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eX1jc1WE; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eX1jc1WE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790155017; x=1821691017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmzlZ+jTcJvDkKvr10C+Rj4EZ88R1aYbrg53u228OUY=;
  b=eX1jc1WEynU08RaniVjwTR6mAwZMvQSlPYheSeo8USfMu8JAGnl0+KGp
   +nHVU3b9juIG/6M0Nqd4tc7hPA0Ui0PwZyOT14+9q9bRu5yGTQbKAER7o
   LGhZeUt0/GIsvrutvKFUUoj91wXuk51U9RsN0NNaW2bntFXSVnFO/g/xb
   K+gM/zAMsCgYJZ3xLTUXfWpsLXlz7V0faRcFMlpHWrO/uSN82filX/lx3
   QSh/gtG0BDfSK1DNO5W6FpS5oD8AIoe3tM08WUlEPUzikLgyr6EtJuwJg
   OBlzlEpkERMTxEkoXov1QC8EZpW1KVdnx45+10vICx7hMZ/lFLSL6RJbF
   w==;
X-CSE-ConnectionGUID: B4q8Vn8aRYK8bvGL/E00NA==
X-CSE-MsgGUID: GmnQsA/LRhyo4k1DV/c/Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1345716"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1345716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 02:16:56 -0700
X-CSE-ConnectionGUID: 3fn3w+UfTDaVFgCrEpfdUA==
X-CSE-MsgGUID: fBohOx8YSmehdQ3JF1jNWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="301449142"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 02:16:55 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9J5w-000000000b5-0Dnz;
	Wed, 23 Sep 2026 09:16:52 +0000
Date: Wed, 23 Sep 2026 11:16:05 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 49/67] lib/bonsai_tree.c:195:35:
 warning: right shift count >= width of type
Message-ID: <202609231156.oir7gIHb-lkp@intel.com>
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
config: microblaze-randconfig-r2202-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231156.oir7gIHb-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231156.oir7gIHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231156.oir7gIHb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/bonsai_tree.c: In function 'bonsai_propagate_meta':
>> lib/bonsai_tree.c:195:35: warning: right shift count >= width of type [-Wshift-count-overflow]
     195 |    u8 tag_bit = (node->l.pivot[i] >> 60) & 0xF;
         |                                   ^~
   lib/bonsai_tree.c: In function 'bonsai_lookup':
   lib/bonsai_tree.c:299:22: warning: right shift count >= width of type [-Wshift-count-overflow]
     299 |  u8 tag_bit = (index >> 60) & 0xF;
         |                      ^~
   lib/bonsai_tree.c: In function 'leaf_insert':
   lib/bonsai_tree.c:429:22: warning: right shift count >= width of type [-Wshift-count-overflow]
     429 |  u8 tag_bit = (index >> 60) & 0xF;
         |                      ^~
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/bonsai_tree.h:5,
                    from lib/bonsai_tree.c:10:
   lib/bonsai_tree.c: In function 'bonsai_store_range':
   lib/bonsai_tree.c:480:13: warning: right shift count >= width of type [-Wshift-count-overflow]
     480 |   if ((last >> 60) & 0xF)
         |             ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   lib/bonsai_tree.c:480:3: note: in expansion of macro 'if'
     480 |   if ((last >> 60) & 0xF)
         |   ^~
   lib/bonsai_tree.c:480:13: warning: right shift count >= width of type [-Wshift-count-overflow]
     480 |   if ((last >> 60) & 0xF)
         |             ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   lib/bonsai_tree.c:480:3: note: in expansion of macro 'if'
     480 |   if ((last >> 60) & 0xF)
         |   ^~
   lib/bonsai_tree.c:480:13: warning: right shift count >= width of type [-Wshift-count-overflow]
     480 |   if ((last >> 60) & 0xF)
         |             ^~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
      68 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   lib/bonsai_tree.c:480:3: note: in expansion of macro 'if'
     480 |   if ((last >> 60) & 0xF)
         |   ^~
   In file included from include/linux/bits.h:5,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from include/linux/bonsai_tree.h:5,
                    from lib/bonsai_tree.c:10:
   lib/bonsai_tree.c:481:34: warning: right shift count >= width of type [-Wshift-count-overflow]
     481 |    curr->m.tag_mask |= BIT((last >> 60) & 0xF);
         |                                  ^~
   include/vdso/bits.h:7:30: note: in definition of macro 'BIT'
       7 | #define BIT(nr)   (UL(1) << (nr))
         |                              ^~
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/bonsai_tree.h:5,
                    from lib/bonsai_tree.c:10:
   lib/bonsai_tree.c:522:13: warning: right shift count >= width of type [-Wshift-count-overflow]
     522 |   if ((last >> 60) & 0xF) {
         |             ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   lib/bonsai_tree.c:522:3: note: in expansion of macro 'if'
     522 |   if ((last >> 60) & 0xF) {
         |   ^~
   lib/bonsai_tree.c:522:13: warning: right shift count >= width of type [-Wshift-count-overflow]
     522 |   if ((last >> 60) & 0xF) {
         |             ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   lib/bonsai_tree.c:522:3: note: in expansion of macro 'if'
     522 |   if ((last >> 60) & 0xF) {
         |   ^~
   lib/bonsai_tree.c:522:13: warning: right shift count >= width of type [-Wshift-count-overflow]
     522 |   if ((last >> 60) & 0xF) {
         |             ^~
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
      68 |  (cond) ?     \
         |   ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   lib/bonsai_tree.c:522:3: note: in expansion of macro 'if'
     522 |   if ((last >> 60) & 0xF) {
         |   ^~
   In file included from include/linux/bits.h:5,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:23,
                    from include/linux/bonsai_tree.h:5,
                    from lib/bonsai_tree.c:10:
   lib/bonsai_tree.c:527:35: warning: right shift count >= width of type [-Wshift-count-overflow]
     527 |      anc->m.tag_mask |= BIT((last >> 60) & 0xF);
         |                                   ^~
   include/vdso/bits.h:7:30: note: in definition of macro 'BIT'
       7 | #define BIT(nr)   (UL(1) << (nr))


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
