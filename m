Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BB13F7A98
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372402; cv=none; b=nIEVMrEadiPgVLyxIyCEkyhgBY8DrCc2hS6fMwEazRZKATW5O/MF1ZypAw8C67rwKwMrhyxlKXF6MiVC/a8Oew18QgRczreRGUva9qtT691oLp/pbPy/NRaat6VbzQyRq16Bzndv3HfIT+EoHiOs0ggm1o+apT2bCsv9kAJi9jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372402; c=relaxed/simple;
	bh=WEp//iHtVWgqctlmi470KOrN2eNDj0JLj9tF8u1lGHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KSy+Pd8dK4cu92VP3T5/cpBF5+HHO8U+5mGYxLa/j9zYLzdJHbIRAqZQTuFQwzIvoGk9kNM/JrvoM8yz1tdPLxMxt6CKl7XKp4SbOcVJulw0y2x31WpTF1UBklOszubSgL9noD4aE7rJN0L0qis+FMytl8JTadmvsX6pq9H2RRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBLoNKP5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBLoNKP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789372400; x=1820908400;
  h=date:from:to:cc:subject:message-id;
  bh=WEp//iHtVWgqctlmi470KOrN2eNDj0JLj9tF8u1lGHQ=;
  b=bBLoNKP5VPEiFx6AHeFCgrDxxPpHFOLUhU3cuNuWfm/y9m+wsKasUFtm
   cuPEXt68ULwCMhPsVmXvCsojdxerR26k2E9Qqxxpa3c4gZMKGfJ+wnLLi
   BuakBqrWpedBheD4xxcpj1aVbfx+FRQDBi/ldovA6PYKmwJtldiozYmBS
   ANqJI33xXureW7V/ofH7vN0T0wHBDaTCnQJ5AeXyFQGRK68hLfFo/UtGM
   z9tpD1mNQlWgwJ/R2wvVQO/5XdPUFxlLTd/qoSYN4X7N36wid7+/ewdM0
   4kfEDvuiENQHGeNu9Q68Z1Zlf+Cfbi6rVl3TgV0w7rv0qq93+9sl84Qwa
   w==;
X-CSE-ConnectionGUID: teDMfiiERzCuCxp7N/tX8w==
X-CSE-MsgGUID: P6WtWnuBTXa0d53PWwviQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="107094757"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="107094757"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 00:53:19 -0700
X-CSE-ConnectionGUID: QoZbUWnJQi2k8U8bVRPfiA==
X-CSE-MsgGUID: 08FTeZDFR3uZCDRASed8Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="266361166"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Sep 2026 00:53:17 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x61V5-000000002cV-0JgQ;
	Mon, 14 Sep 2026 07:53:15 +0000
Date: Mon, 14 Sep 2026 15:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v4 9/16] lib/test_maple_tree.c:426:21:
 error: assignment to 'long unsigned int *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202609141550.O2fApGkn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v4
head:   de1ab7ba20a1402fb09d82f56c37732e65e1b0f7
commit: 59685a5ddca1208bbdcbb990f5cacabb224b369f [9/16] maple_tree: Testing code update for triple split
config: x86_64-randconfig-013-20260914 (https://download.01.org/0day-ci/archive/20260914/202609141550.O2fApGkn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260914/202609141550.O2fApGkn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609141550.O2fApGkn-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_maple_tree.c: In function 'mas_node_fill':
   lib/test_maple_tree.c:356:36: error: implicit declaration of function 'mt_slot_count' [-Wimplicit-function-declaration]
     356 |         if (mas->max - mas->min <= mt_slot_count(mas->node))
         |                                    ^~~~~~~~~~~~~
   lib/test_maple_tree.c:359:15: error: implicit declaration of function 'mas_data_end' [-Wimplicit-function-declaration]
     359 |         val = mas_data_end(mas) + 1;
         |               ^~~~~~~~~~~~
   lib/test_maple_tree.c: In function 'test_mas_node_depth':
   lib/test_maple_tree.c:420:9: error: implicit declaration of function 'mas_start'; did you mean 'mas_store'? [-Wimplicit-function-declaration]
     420 |         mas_start(mas);
         |         ^~~~~~~~~
         |         mas_store
   lib/test_maple_tree.c:426:23: error: implicit declaration of function 'ma_pivots' [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                       ^~~~~~~~~
   lib/test_maple_tree.c:426:33: error: implicit declaration of function 'mas_mn' [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                 ^~~~~~
   lib/test_maple_tree.c:426:46: error: implicit declaration of function 'mte_node_type' [-Wimplicit-function-declaration]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                                              ^~~~~~~~~~~~~
>> lib/test_maple_tree.c:426:21: error: assignment to 'long unsigned int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     426 |                 piv = ma_pivots(mas_mn(mas), mte_node_type(mas->node));
         |                     ^
   lib/test_maple_tree.c:432:17: error: implicit declaration of function 'mas_descend'; did you mean 'mas_reset'? [-Wimplicit-function-declaration]
     432 |                 mas_descend(mas);
         |                 ^~~~~~~~~~~
         |                 mas_reset
   lib/test_maple_tree.c: In function 'mas_internal_node_fill':
   lib/test_maple_tree.c:443:30: error: implicit declaration of function 'mte_is_leaf' [-Wimplicit-function-declaration]
     443 |         MT_BUG_ON(mas->tree, mte_is_leaf(mas->node));
         |                              ^~~~~~~~~~~
   lib/test_maple_tree.c:30:13: note: in definition of macro 'MT_BUG_ON'
      30 |         if (__x) {                                                      \
         |             ^~~
   lib/test_maple_tree.c: In function 'check_ranges':
   lib/test_maple_tree.c:1528:65: error: subscripted value is neither array nor pointer nor vector
    1528 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[7] + 1;
         |                                                                 ^
   lib/test_maple_tree.c:1535:65: error: subscripted value is neither array nor pointer nor vector
    1535 |         index = ma_pivots(mas_mn(&mas), mte_node_type(mas.node))[8] + 1;
         |                                                                 ^


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
