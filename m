Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605346;
	b=L4665UEofLsDTVjIl1xlxN8zUfxY0BJqzqEzTHP8YY/l9jLF01yYYxtMa33Y9TH5nNzS
	 l3NB5QKup8e7gVmcC8B4BlOqKuWsJfwm9YeTRaoI+yYaCJoFVZlORrrvve2O8pHpa9hMK
	 VWyWAxBoAUpGtfvcWPKibUZ8t5HlGf6Zxkru1O8r/Yv5YEnoAnyN46LaqgTBlrlRrIstB
	 wQUveB3FU0OwW998vzPWEREUD4wuHXIwMT9bMrYNLpzZ+Tm0p1gj1Y9No97JTpObMPj2D
	 ctdm0m/e/DP0jbCdpSEPCnywbVrd+Xbvf+AATxTAMNiDDKXg+fb61C7paC8/ml/ZT0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605346;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=g6C2i45pKO/ZLe5tB+Z3JX1gFiQybKJfwTbP1tjUeiU=;
	b=k0SmSKLExU1Dq3gG78Fb2wmgcwxmwxtf1dALING+bZDkBwTrwmuAkWh2UOjhykC/L0vQ
	 JAbEoTMwjgRDKR8T+3k9CJPpmwJqllxEl5C+LoEUCZYWF40sYnO9u+Ar8P5rXFLQZYNPc
	 6ax/kpudkNUYklfachIB2h9S1DKIFRyFVH7Ev61Da7lE7gngOZhqaaXdVlckxzHEna14k
	 s+4dbelRrnOljaNHtnkGTHnBShA2JBtL4N/jPJmEugrexzd4s6asxpeE72H/ITiRt+wnb
	 TWhqQqqIVCsePq67QnOsU6M4QapA+RwHG97yGfZoBhqlKSshjxZU6m5mXc2YT3zIVzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfILUM3g;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75386606A326
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 07:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75386606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kfILUM3g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793605346; x=1825141346;
  h=date:from:to:cc:subject:message-id;
  bh=PrwPluZ7ISnxr7gfNJGZ4TTzRJYgP8ziSigI3VXs7FA=;
  b=kfILUM3gHIXNvv5R70B2eypti++8+MPkn1izKXd2LFa3tjVw8PBWm27C
   hY6YJWNL4TKx/c8JaI9mwhTvqFG5vmbNFZUCpcPXVwPVdVxlxwlbJPRO+
   njCaFWPHeQvjfjOd/CiZb/nr2GsZxaXZpvXTcmxTEER6pICBNSTzMAiUw
   fHbfLw2fBteZlogwmUIU6JbpmEQpHTZkRD/vo1Ej1JAY/MPkIoGdZIsir
   rMgjMoq7uSYZiyt89n66oKLMbw8C7QFj1LMBtGkXmDGYCMfqC16M23LY9
   Exa9s5J423a8iMhzm/2wg5yM5RKPCOHxexIJAyqFBtLC4YBkt5qW84296
   w==;
X-CSE-ConnectionGUID: ypPBhmTXRwalx+6FInHnkw==
X-CSE-MsgGUID: jynBkjRiQQqqa+gRhkj6lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2192238"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2192238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 23:42:25 -0800
X-CSE-ConnectionGUID: VHWnGyWMRXiAY8B/2+UmgA==
X-CSE-MsgGUID: acnmZGj8TLuJodvTcw1rgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6023269"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2026 23:42:23 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNmgO-000000008Ox-2rGZ;
	Mon, 02 Nov 2026 07:42:20 +0000
Date: Mon, 02 Nov 2026 08:41:23 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/md/dm-bow.c:178:24: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202611020858.DPTyzoxd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   48fd322ff78a638e319b1a321268821b3aaabbe9
commit: 7a96549fc9ff33f14b4ed1b4c5f49a0fb51ce9c9 [1/1] ANDROID: dm-bow: Fix up revert remove dm-bow
config: arm64-randconfig-r2301-20261102 (https://download.01.org/0day-ci/archive/20261102/202611020858.DPTyzoxd-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020858.DPTyzoxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611020858.DPTyzoxd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/dm-bow.c:97:10: sparse: sparse: symbol 'range_top' was not declared. Should it be static?
   drivers/md/dm-bow.c:103:5: sparse: sparse: symbol 'range_size' was not declared. Should it be static?
   drivers/md/dm-bow.c:148:6: sparse: sparse: symbol 'add_before' was not declared. Should it be static?
>> drivers/md/dm-bow.c:178:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:178:24: sparse:     expected int
   drivers/md/dm-bow.c:178:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:186:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:186:32: sparse:     expected int
   drivers/md/dm-bow.c:186:32: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:205:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:205:24: sparse:     expected int
   drivers/md/dm-bow.c:205:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:282:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:282:24: sparse:     expected int
   drivers/md/dm-bow.c:282:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:395:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:395:24: sparse:     expected int
   drivers/md/dm-bow.c:395:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:339:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:339:24: sparse:     expected int
   drivers/md/dm-bow.c:339:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:344:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:344:24: sparse:     expected int
   drivers/md/dm-bow.c:344:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:350:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:350:24: sparse:     expected int
   drivers/md/dm-bow.c:350:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:358:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:358:24: sparse:     expected int
   drivers/md/dm-bow.c:358:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:422:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:422:24: sparse:     expected int
   drivers/md/dm-bow.c:422:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:427:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:427:24: sparse:     expected int
   drivers/md/dm-bow.c:427:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:437:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:437:24: sparse:     expected int
   drivers/md/dm-bow.c:437:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:443:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:443:24: sparse:     expected int
   drivers/md/dm-bow.c:443:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:462:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:462:24: sparse:     expected int
   drivers/md/dm-bow.c:462:24: sparse:     got restricted blk_status_t [usertype]
>> drivers/md/dm-bow.c:553:53: sparse: sparse: Using plain integer as NULL pointer
   drivers/md/dm-bow.c:820:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:820:24: sparse:     expected int
   drivers/md/dm-bow.c:820:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:839:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:839:24: sparse:     expected int
   drivers/md/dm-bow.c:839:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:932:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:932:24: sparse:     expected int
   drivers/md/dm-bow.c:932:24: sparse:     got restricted blk_status_t [usertype]
>> drivers/md/dm-bow.c:968:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted blk_status_t [usertype] bi_status @@     got int [assigned] ret @@
   drivers/md/dm-bow.c:968:32: sparse:     expected restricted blk_status_t [usertype] bi_status
   drivers/md/dm-bow.c:968:32: sparse:     got int [assigned] ret
   drivers/md/dm-bow.c:1096:5: sparse: sparse: symbol 'remap_unless_illegal_trim' was not declared. Should it be static?
   drivers/md/dm-bow.c:1252:5: sparse: sparse: symbol 'dm_bow_prepare_ioctl' was not declared. Should it be static?
   drivers/md/dm-bow.c:1284:12: sparse: sparse: symbol 'dm_bow_init' was not declared. Should it be static?
   drivers/md/dm-bow.c:1293:6: sparse: sparse: symbol 'dm_bow_exit' was not declared. Should it be static?
   drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/md/dm-bow.c:523:26: sparse: signed value source

vim +178 drivers/md/dm-bow.c

dcb994383d2b16 Paul Lawrence 2023-01-25  162  
dcb994383d2b16 Paul Lawrence 2023-01-25  163  /*
dcb994383d2b16 Paul Lawrence 2023-01-25  164   * Given a range br returned by find_first_overlapping_range, split br into a
dcb994383d2b16 Paul Lawrence 2023-01-25  165   * leading range, a range matching the bi_iter and a trailing range.
dcb994383d2b16 Paul Lawrence 2023-01-25  166   * Leading and trailing may end up size 0 and will then be deleted. The
dcb994383d2b16 Paul Lawrence 2023-01-25  167   * new range matching the bi_iter is then returned and should have its type
dcb994383d2b16 Paul Lawrence 2023-01-25  168   * and type specific fields populated.
dcb994383d2b16 Paul Lawrence 2023-01-25  169   * If bi_iter runs off the end of the range, bi_iter is truncated accordingly
dcb994383d2b16 Paul Lawrence 2023-01-25  170   */
dcb994383d2b16 Paul Lawrence 2023-01-25  171  static int split_range(struct bow_context *bc, struct bow_range **br,
dcb994383d2b16 Paul Lawrence 2023-01-25  172  		       struct bvec_iter *bi_iter)
dcb994383d2b16 Paul Lawrence 2023-01-25  173  {
dcb994383d2b16 Paul Lawrence 2023-01-25  174  	struct bow_range *new_br;
dcb994383d2b16 Paul Lawrence 2023-01-25  175  
dcb994383d2b16 Paul Lawrence 2023-01-25  176  	if (bi_iter->bi_sector < (*br)->sector) {
dcb994383d2b16 Paul Lawrence 2023-01-25  177  		WARN_ON(true);
dcb994383d2b16 Paul Lawrence 2023-01-25 @178  		return BLK_STS_IOERR;
dcb994383d2b16 Paul Lawrence 2023-01-25  179  	}
dcb994383d2b16 Paul Lawrence 2023-01-25  180  
dcb994383d2b16 Paul Lawrence 2023-01-25  181  	if (bi_iter->bi_sector > (*br)->sector) {
dcb994383d2b16 Paul Lawrence 2023-01-25  182  		struct bow_range *leading_br =
dcb994383d2b16 Paul Lawrence 2023-01-25  183  			kzalloc(sizeof(*leading_br), GFP_KERNEL);
dcb994383d2b16 Paul Lawrence 2023-01-25  184  
dcb994383d2b16 Paul Lawrence 2023-01-25  185  		if (!leading_br)
dcb994383d2b16 Paul Lawrence 2023-01-25  186  			return BLK_STS_RESOURCE;
dcb994383d2b16 Paul Lawrence 2023-01-25  187  
dcb994383d2b16 Paul Lawrence 2023-01-25  188  		*leading_br = **br;
dcb994383d2b16 Paul Lawrence 2023-01-25  189  		if (leading_br->type == TRIMMED)
dcb994383d2b16 Paul Lawrence 2023-01-25  190  			list_add(&leading_br->trimmed_list, &bc->trimmed_list);
dcb994383d2b16 Paul Lawrence 2023-01-25  191  
dcb994383d2b16 Paul Lawrence 2023-01-25  192  		add_before(&bc->ranges, leading_br, *br);
dcb994383d2b16 Paul Lawrence 2023-01-25  193  		(*br)->sector = bi_iter->bi_sector;
dcb994383d2b16 Paul Lawrence 2023-01-25  194  	}
dcb994383d2b16 Paul Lawrence 2023-01-25  195  
dcb994383d2b16 Paul Lawrence 2023-01-25  196  	if (bvec_top(bi_iter) >= range_top(*br)) {
dcb994383d2b16 Paul Lawrence 2023-01-25  197  		bi_iter->bi_size = (range_top(*br) - (*br)->sector)
dcb994383d2b16 Paul Lawrence 2023-01-25  198  					* SECTOR_SIZE;
dcb994383d2b16 Paul Lawrence 2023-01-25  199  		return BLK_STS_OK;
dcb994383d2b16 Paul Lawrence 2023-01-25  200  	}
dcb994383d2b16 Paul Lawrence 2023-01-25  201  
dcb994383d2b16 Paul Lawrence 2023-01-25  202  	/* new_br will be the beginning, existing br will be the tail */
dcb994383d2b16 Paul Lawrence 2023-01-25  203  	new_br = kzalloc(sizeof(*new_br), GFP_KERNEL);
dcb994383d2b16 Paul Lawrence 2023-01-25  204  	if (!new_br)
dcb994383d2b16 Paul Lawrence 2023-01-25  205  		return BLK_STS_RESOURCE;
dcb994383d2b16 Paul Lawrence 2023-01-25  206  
dcb994383d2b16 Paul Lawrence 2023-01-25  207  	new_br->sector = (*br)->sector;
dcb994383d2b16 Paul Lawrence 2023-01-25  208  	(*br)->sector = bvec_top(bi_iter);
dcb994383d2b16 Paul Lawrence 2023-01-25  209  	add_before(&bc->ranges, new_br, *br);
dcb994383d2b16 Paul Lawrence 2023-01-25  210  	*br = new_br;
dcb994383d2b16 Paul Lawrence 2023-01-25  211  
dcb994383d2b16 Paul Lawrence 2023-01-25  212  	return BLK_STS_OK;
dcb994383d2b16 Paul Lawrence 2023-01-25  213  }
dcb994383d2b16 Paul Lawrence 2023-01-25  214  

:::::: The code at line 178 was first introduced by commit
:::::: dcb994383d2b1641ebe7b518caab88d2d9dbfa72 Revert "ANDROID: dm-bow: remove dm-bow"

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
