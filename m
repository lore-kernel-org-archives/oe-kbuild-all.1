Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067753C3C1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 22:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782512407; cv=none; b=Zv4dCrH9LfT+raPWfiSLAw1SeZpfmyzXI7Zq3Kn7xbsBhQiKCa6RNrVMbOX8+Dpxkza/XTzerUnktfdW8vk11rA7Ij5I+kiPJpbk0nfgotDZuEjmGmVsLJxKDt5SYyMAjVycPD54FWWBNnEQP8e3TFKINqL9RqKx1dtxt76O2Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782512407; c=relaxed/simple;
	bh=SL/1LmhrvCf5w3cZbDKmcqphMj7fOq9wz0/A8xxAsrE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bklvU7aj6CtbGXKXh2sdFDgONmvHbFddmINqg1RkbRZfd1zQgXvb5dOKPWb5OGydpl+lMD9R9Pdys8zTlJhjhzqMUjwiOkHDWOyddjXPPvlAbD/y7COQFHUGUgPaLtda83MHUjNiMmIwaF+H/XCF0Mqa1e85NE4SAXGGBN0iaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJJMIWG3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJJMIWG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782512404; x=1814048404;
  h=date:from:to:cc:subject:message-id;
  bh=SL/1LmhrvCf5w3cZbDKmcqphMj7fOq9wz0/A8xxAsrE=;
  b=AJJMIWG3TNJUEgpDDixoWr6Qv/X5WiEeNblxGUtnM89WvAXFmpVD3TwV
   VpQAYFD4EnQW1WLOprrB+OPCXWhMtEMu2O/QRx7wF1/9Kak87IUsifK1B
   qNQ41xdTJIJSrhAx7GSvNUn1ZEv/zQCLJIaVTTAPnuhpah6/HY92NqSoJ
   vICZW4e49yUHUrqB5HxbaUc0wfOuLsD/XqvF9PUz6iZzOEJmsffrblcc9
   Oda7qpN1eAFUhzbPeiRORXKItNbuP2OGMHn3BUPiENeTArbCK0m7yzlIa
   zAEMIkmursAzkZ+P77d02CwvlsShe1NS1ozF51D5qWEEH9gS/HqTQVPwE
   A==;
X-CSE-ConnectionGUID: 1NgfC4/pTFazYe/pLc8/Zw==
X-CSE-MsgGUID: rk2ms02jThWVhItZ8oyDuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="100743410"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="100743410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 15:20:04 -0700
X-CSE-ConnectionGUID: 1rJfbGwVSpaaRx+0LKYggw==
X-CSE-MsgGUID: VkFIIqFtRpSyYlpwuS1eog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="251578885"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Jun 2026 15:20:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdEtz-000000005TH-29Tu;
	Fri, 26 Jun 2026 22:19:59 +0000
Date: Sat, 27 Jun 2026 06:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v7.2 28/31] lib/test_maple_tree.c:426:21:
 warning: assignment to 'long unsigned int *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202606270613.ydWPPnl6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2
head:   be119ad50e9c87a4a975871d84614f7c6aeaf0de
commit: d4eb0ef8b516c8492a60a066c467f580ae9c0074 [28/31] maple_tree: Testing code update for triple split
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260627/202606270613.ydWPPnl6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270613.ydWPPnl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270613.ydWPPnl6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_maple_tree.c: In function 'test_mas_next_node':
   lib/test_maple_tree.c:299:17: error: implicit declaration of function 'mas_next_slot' [-Werror=implicit-function-declaration]
     299 |                 mas_next_slot(mas, ULONG_MAX, true);
         |                 ^~~~~~~~~~~~~
   lib/test_maple_tree.c: In function 'test_mas_prev_node':
   lib/test_maple_tree.c:314:17: error: implicit declaration of function 'mas_prev_slot'; did you mean 'mas_reset'? [-Werror=implicit-function-declaration]
     314 |                 mas_prev_slot(mas, 0, true);
         |                 ^~~~~~~~~~~~~
         |                 mas_reset
   lib/test_maple_tree.c: In function 'mas_node_fill':
   lib/test_maple_tree.c:356:36: error: implicit declaration of function 'mt_slot_count' [-Werror=implicit-function-declaration]
     356 |         if (mas->max - mas->min <= mt_slot_count(mas->node))
         |                                    ^~~~~~~~~~~~~
   lib/test_maple_tree.c:359:15: error: implicit declaration of function 'mas_data_end' [-Werror=implicit-function-declaration]
     359 |         val = mas_data_end(mas) + 1;
         |               ^~~~~~~~~~~~
   lib/test_maple_tree.c: In function 'test_mas_node_depth':
   lib/test_maple_tree.c:420:9: error: implicit declaration of function 'mas_start'; did you mean 'mas_store'? [-Werror=implicit-function-declaration]
     420 |         mas_start(mas);
         |         ^~~~~~~~~
         |         mas_store
   lib/test_maple_tree.c:426:23: error: implicit declaration of function 'ma_pivots' [-Werror=implicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                       ^~~~~~~~~
   lib/test_maple_tree.c:426:33: error: implicit declaration of function 'mas_mn' [-Werror=implicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                 ^~~~~~
   lib/test_maple_tree.c:426:46: error: implicit declaration of function 'mte_node_type' [-Werror=implicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                              ^~~~~~~~~~~~~
>> lib/test_maple_tree.c:426:21: warning: assignment to 'long unsigned int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                     ^
   lib/test_maple_tree.c:432:17: error: implicit declaration of function 'mas_descend'; did you mean 'mas_reset'? [-Werror=implicit-function-declaration]
     432 |                 mas_descend(mas);
         |                 ^~~~~~~~~~~
         |                 mas_reset
   In file included from lib/test_maple_tree.c:10:
   lib/test_maple_tree.c: In function 'mas_internal_node_fill':
   lib/test_maple_tree.c:443:30: error: implicit declaration of function 'mte_is_leaf' [-Werror=implicit-function-declaration]
     443 |         MT_BUG_ON(mas->tree, mte_is_leaf(mas->node));
         |                              ^~~~~~~~~~~
   include/linux/maple_tree.h:758:13: note: in definition of macro 'MT_BUG_ON'
     758 |         if (__x) {                                                      \
         |             ^~~
   lib/test_maple_tree.c: In function 'check_ranges':
   lib/test_maple_tree.c:1528:65: error: subscripted value is neither array nor pointer nor vector
    1528 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[7] + 1;
         |                                                                 ^
   lib/test_maple_tree.c:1535:65: error: subscripted value is neither array nor pointer nor vector
    1535 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[8] + 1;
         |                                                                 ^
   cc1: some warnings being treated as errors


vim +426 lib/test_maple_tree.c

   415	
   416	static noinline void __init test_mas_node_depth(struct ma_state *mas,
   417			int depth)
   418	{
   419		mas_reset(mas);
   420		mas_start(mas);
   421		while (mas->depth < depth) {
   422			unsigned long *piv;
   423			int count, offset;
   424	
   425			count = mas_data_end(mas);
 > 426			piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
   427			offset = 0;
   428			while (offset < count && mas->index > piv[offset]) {
   429				offset++;
   430			}
   431			mas->offset = offset;
   432			mas_descend(mas);
   433			mas->depth++;
   434		}
   435	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
