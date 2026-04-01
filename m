Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4835CBCB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 05:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775021061; cv=none; b=Pav+rQpXKgnjm51jntVEnxfkUQAbKkfVZ1z0nyYGoFJKkTuWPFhoHNcm7gTHngwZLZDk+JWDKEbhfUkeJi0SLfKkoI7ZU2ldLC7aAbibA0EhfMQhZ+jERmXBS1Zf+GMhbSIiQD2PpQMGozyOPVZNHZlQQVyUtGsrWnYEMX7G4b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775021061; c=relaxed/simple;
	bh=XGn7wqIbPcktKO8XaYSxnBG9WLJwjDp0Ui5N0kh3yBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gJlWNRUKDZ3LG1s+ImjnlQdWvH5OXrJwcSNe0NYDRFA207c2s/iKYNW7W9KFPJzHab/bgYx4yv8g/xJU2srOIGkXjL8IzRgnq3vY6oKB3iEs4r1PTZDw7bJTFBAIb042ynkmQKMN0TO5OdMle1W1yXyMR+vQtEnho7HCb+JsKII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jiLmPGh7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jiLmPGh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775021060; x=1806557060;
  h=date:from:to:cc:subject:message-id;
  bh=XGn7wqIbPcktKO8XaYSxnBG9WLJwjDp0Ui5N0kh3yBc=;
  b=jiLmPGh7ZsZUvrk9iuS3MBBtPP0JpiU/e+tSubPRFXjWzYDIkdnUsEA8
   WAV6pkaUltgL/ugl7PNjpNvkpnfWuuOntumlMjplJg5zmMH2AnbcxvqPi
   Dr7H2ZeFOuHx8DH82HDbY/sIRKbUtG6CmsfrRtDkTcGmxlvOv6d50z+Dv
   tBJ6/8kXiTXuCSAWc7ICQToUy3haq2w7burajLO3w4wvuYTFhzH73Sym2
   WMWIoaLv2cdm8aiRS8kGIAGb86PXs46EZ10wl/rmaTzIGE9vc/DV+JnLc
   Goq/gtBDUjui1A5f7FsVr0DxAg1UBKpVMntcksTZGM/2NDcSuHPH/EyIO
   g==;
X-CSE-ConnectionGUID: JqdTwinCRPGi6m9R1D/uCg==
X-CSE-MsgGUID: TzvGhKXAT5iWlUsZyPIVeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79653275"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79653275"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 22:24:17 -0700
X-CSE-ConnectionGUID: H1kDGT3VTuit8lY42uY4AA==
X-CSE-MsgGUID: EtWVHV1rQuejmVLFn2g/Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226446083"
Received: from lkp-server01.sh.intel.com (HELO 9def6ffd2e71) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 22:24:16 -0700
Received: from kbuild by 9def6ffd2e71 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7o3p-0000000004H-0ImT;
	Wed, 01 Apr 2026 05:24:13 +0000
Date: Wed, 01 Apr 2026 13:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2026-03 0/1]
 drivers/md/dm-bow.c:97:10: sparse: sparse: symbol 'range_top' was not
 declared. Should it be static?
Message-ID: <202604011359.x2k6vyAG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2026-03
head:   b1ccc7ba749c4d69ac7e52c690bdcc202de4d298
commit: 1f8f8e5cd943333327db8852f1395ca1c4439fe9 [0/1] ANDROID: dm-bow: Fix up revert remove dm-bow
config: x86_64-randconfig-122-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011359.x2k6vyAG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011359.x2k6vyAG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011359.x2k6vyAG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-bow.c:97:10: sparse: sparse: symbol 'range_top' was not declared. Should it be static?
>> drivers/md/dm-bow.c:148:6: sparse: sparse: symbol 'add_before' was not declared. Should it be static?
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
>> drivers/md/dm-bow.c:1096:5: sparse: sparse: symbol 'remap_unless_illegal_trim' was not declared. Should it be static?
>> drivers/md/dm-bow.c:1252:5: sparse: sparse: symbol 'dm_bow_prepare_ioctl' was not declared. Should it be static?
>> drivers/md/dm-bow.c:1284:12: sparse: sparse: symbol 'dm_bow_init' was not declared. Should it be static?
>> drivers/md/dm-bow.c:1293:6: sparse: sparse: symbol 'dm_bow_exit' was not declared. Should it be static?
   drivers/md/dm-bow.c:524:21: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/md/dm-bow.c:523:26: sparse: signed value source

vim +/range_top +97 drivers/md/dm-bow.c

e8944a38b46967c Paul Lawrence 2023-01-25   96  
e8944a38b46967c Paul Lawrence 2023-01-25  @97  sector_t range_top(struct bow_range *br)
e8944a38b46967c Paul Lawrence 2023-01-25   98  {
e8944a38b46967c Paul Lawrence 2023-01-25   99  	return container_of(rb_next(&br->node), struct bow_range, node)
e8944a38b46967c Paul Lawrence 2023-01-25  100  		->sector;
e8944a38b46967c Paul Lawrence 2023-01-25  101  }
e8944a38b46967c Paul Lawrence 2023-01-25  102  
e8944a38b46967c Paul Lawrence 2023-01-25  103  u64 range_size(struct bow_range *br)
e8944a38b46967c Paul Lawrence 2023-01-25  104  {
e8944a38b46967c Paul Lawrence 2023-01-25  105  	return (range_top(br) - br->sector) * SECTOR_SIZE;
e8944a38b46967c Paul Lawrence 2023-01-25  106  }
e8944a38b46967c Paul Lawrence 2023-01-25  107  
e8944a38b46967c Paul Lawrence 2023-01-25  108  static sector_t bvec_top(struct bvec_iter *bi_iter)
e8944a38b46967c Paul Lawrence 2023-01-25  109  {
e8944a38b46967c Paul Lawrence 2023-01-25  110  	return bi_iter->bi_sector + bi_iter->bi_size / SECTOR_SIZE;
e8944a38b46967c Paul Lawrence 2023-01-25  111  }
e8944a38b46967c Paul Lawrence 2023-01-25  112  
e8944a38b46967c Paul Lawrence 2023-01-25  113  /*
e8944a38b46967c Paul Lawrence 2023-01-25  114   * Find the first range that overlaps with bi_iter
e8944a38b46967c Paul Lawrence 2023-01-25  115   * bi_iter is set to the size of the overlapping sub-range
e8944a38b46967c Paul Lawrence 2023-01-25  116   */
e8944a38b46967c Paul Lawrence 2023-01-25  117  static struct bow_range *find_first_overlapping_range(struct rb_root *ranges,
e8944a38b46967c Paul Lawrence 2023-01-25  118  						      struct bvec_iter *bi_iter)
e8944a38b46967c Paul Lawrence 2023-01-25  119  {
e8944a38b46967c Paul Lawrence 2023-01-25  120  	struct rb_node *node = ranges->rb_node;
e8944a38b46967c Paul Lawrence 2023-01-25  121  	struct bow_range *br;
e8944a38b46967c Paul Lawrence 2023-01-25  122  
e8944a38b46967c Paul Lawrence 2023-01-25  123  	while (node) {
e8944a38b46967c Paul Lawrence 2023-01-25  124  		br = container_of(node, struct bow_range, node);
e8944a38b46967c Paul Lawrence 2023-01-25  125  
e8944a38b46967c Paul Lawrence 2023-01-25  126  		if (br->sector <= bi_iter->bi_sector
e8944a38b46967c Paul Lawrence 2023-01-25  127  		    && bi_iter->bi_sector < range_top(br))
e8944a38b46967c Paul Lawrence 2023-01-25  128  			break;
e8944a38b46967c Paul Lawrence 2023-01-25  129  
e8944a38b46967c Paul Lawrence 2023-01-25  130  		if (bi_iter->bi_sector < br->sector)
e8944a38b46967c Paul Lawrence 2023-01-25  131  			node = node->rb_left;
e8944a38b46967c Paul Lawrence 2023-01-25  132  		else
e8944a38b46967c Paul Lawrence 2023-01-25  133  			node = node->rb_right;
e8944a38b46967c Paul Lawrence 2023-01-25  134  	}
e8944a38b46967c Paul Lawrence 2023-01-25  135  
e8944a38b46967c Paul Lawrence 2023-01-25  136  	WARN_ON(!node);
e8944a38b46967c Paul Lawrence 2023-01-25  137  	if (!node)
e8944a38b46967c Paul Lawrence 2023-01-25  138  		return NULL;
e8944a38b46967c Paul Lawrence 2023-01-25  139  
e8944a38b46967c Paul Lawrence 2023-01-25  140  	if (range_top(br) - bi_iter->bi_sector
e8944a38b46967c Paul Lawrence 2023-01-25  141  	    < bi_iter->bi_size >> SECTOR_SHIFT)
e8944a38b46967c Paul Lawrence 2023-01-25  142  		bi_iter->bi_size = (range_top(br) - bi_iter->bi_sector)
e8944a38b46967c Paul Lawrence 2023-01-25  143  			<< SECTOR_SHIFT;
e8944a38b46967c Paul Lawrence 2023-01-25  144  
e8944a38b46967c Paul Lawrence 2023-01-25  145  	return br;
e8944a38b46967c Paul Lawrence 2023-01-25  146  }
e8944a38b46967c Paul Lawrence 2023-01-25  147  
e8944a38b46967c Paul Lawrence 2023-01-25 @148  void add_before(struct rb_root *ranges, struct bow_range *new_br,
e8944a38b46967c Paul Lawrence 2023-01-25  149  		struct bow_range *existing)
e8944a38b46967c Paul Lawrence 2023-01-25  150  {
e8944a38b46967c Paul Lawrence 2023-01-25  151  	struct rb_node *parent = &(existing->node);
e8944a38b46967c Paul Lawrence 2023-01-25  152  	struct rb_node **link = &(parent->rb_left);
e8944a38b46967c Paul Lawrence 2023-01-25  153  
e8944a38b46967c Paul Lawrence 2023-01-25  154  	while (*link) {
e8944a38b46967c Paul Lawrence 2023-01-25  155  		parent = *link;
e8944a38b46967c Paul Lawrence 2023-01-25  156  		link = &((*link)->rb_right);
e8944a38b46967c Paul Lawrence 2023-01-25  157  	}
e8944a38b46967c Paul Lawrence 2023-01-25  158  
e8944a38b46967c Paul Lawrence 2023-01-25  159  	rb_link_node(&new_br->node, parent, link);
e8944a38b46967c Paul Lawrence 2023-01-25  160  	rb_insert_color(&new_br->node, ranges);
e8944a38b46967c Paul Lawrence 2023-01-25  161  }
e8944a38b46967c Paul Lawrence 2023-01-25  162  
e8944a38b46967c Paul Lawrence 2023-01-25  163  /*
e8944a38b46967c Paul Lawrence 2023-01-25  164   * Given a range br returned by find_first_overlapping_range, split br into a
e8944a38b46967c Paul Lawrence 2023-01-25  165   * leading range, a range matching the bi_iter and a trailing range.
e8944a38b46967c Paul Lawrence 2023-01-25  166   * Leading and trailing may end up size 0 and will then be deleted. The
e8944a38b46967c Paul Lawrence 2023-01-25  167   * new range matching the bi_iter is then returned and should have its type
e8944a38b46967c Paul Lawrence 2023-01-25  168   * and type specific fields populated.
e8944a38b46967c Paul Lawrence 2023-01-25  169   * If bi_iter runs off the end of the range, bi_iter is truncated accordingly
e8944a38b46967c Paul Lawrence 2023-01-25  170   */
e8944a38b46967c Paul Lawrence 2023-01-25  171  static int split_range(struct bow_context *bc, struct bow_range **br,
e8944a38b46967c Paul Lawrence 2023-01-25  172  		       struct bvec_iter *bi_iter)
e8944a38b46967c Paul Lawrence 2023-01-25  173  {
e8944a38b46967c Paul Lawrence 2023-01-25  174  	struct bow_range *new_br;
e8944a38b46967c Paul Lawrence 2023-01-25  175  
e8944a38b46967c Paul Lawrence 2023-01-25  176  	if (bi_iter->bi_sector < (*br)->sector) {
e8944a38b46967c Paul Lawrence 2023-01-25  177  		WARN_ON(true);
e8944a38b46967c Paul Lawrence 2023-01-25 @178  		return BLK_STS_IOERR;
e8944a38b46967c Paul Lawrence 2023-01-25  179  	}
e8944a38b46967c Paul Lawrence 2023-01-25  180  
e8944a38b46967c Paul Lawrence 2023-01-25  181  	if (bi_iter->bi_sector > (*br)->sector) {
e8944a38b46967c Paul Lawrence 2023-01-25  182  		struct bow_range *leading_br =
e8944a38b46967c Paul Lawrence 2023-01-25  183  			kzalloc(sizeof(*leading_br), GFP_KERNEL);
e8944a38b46967c Paul Lawrence 2023-01-25  184  
e8944a38b46967c Paul Lawrence 2023-01-25  185  		if (!leading_br)
e8944a38b46967c Paul Lawrence 2023-01-25  186  			return BLK_STS_RESOURCE;
e8944a38b46967c Paul Lawrence 2023-01-25  187  
e8944a38b46967c Paul Lawrence 2023-01-25  188  		*leading_br = **br;
e8944a38b46967c Paul Lawrence 2023-01-25  189  		if (leading_br->type == TRIMMED)
e8944a38b46967c Paul Lawrence 2023-01-25  190  			list_add(&leading_br->trimmed_list, &bc->trimmed_list);
e8944a38b46967c Paul Lawrence 2023-01-25  191  
e8944a38b46967c Paul Lawrence 2023-01-25  192  		add_before(&bc->ranges, leading_br, *br);
e8944a38b46967c Paul Lawrence 2023-01-25  193  		(*br)->sector = bi_iter->bi_sector;
e8944a38b46967c Paul Lawrence 2023-01-25  194  	}
e8944a38b46967c Paul Lawrence 2023-01-25  195  
e8944a38b46967c Paul Lawrence 2023-01-25  196  	if (bvec_top(bi_iter) >= range_top(*br)) {
e8944a38b46967c Paul Lawrence 2023-01-25  197  		bi_iter->bi_size = (range_top(*br) - (*br)->sector)
e8944a38b46967c Paul Lawrence 2023-01-25  198  					* SECTOR_SIZE;
e8944a38b46967c Paul Lawrence 2023-01-25  199  		return BLK_STS_OK;
e8944a38b46967c Paul Lawrence 2023-01-25  200  	}
e8944a38b46967c Paul Lawrence 2023-01-25  201  
e8944a38b46967c Paul Lawrence 2023-01-25  202  	/* new_br will be the beginning, existing br will be the tail */
e8944a38b46967c Paul Lawrence 2023-01-25  203  	new_br = kzalloc(sizeof(*new_br), GFP_KERNEL);
e8944a38b46967c Paul Lawrence 2023-01-25  204  	if (!new_br)
e8944a38b46967c Paul Lawrence 2023-01-25  205  		return BLK_STS_RESOURCE;
e8944a38b46967c Paul Lawrence 2023-01-25  206  
e8944a38b46967c Paul Lawrence 2023-01-25  207  	new_br->sector = (*br)->sector;
e8944a38b46967c Paul Lawrence 2023-01-25  208  	(*br)->sector = bvec_top(bi_iter);
e8944a38b46967c Paul Lawrence 2023-01-25  209  	add_before(&bc->ranges, new_br, *br);
e8944a38b46967c Paul Lawrence 2023-01-25  210  	*br = new_br;
e8944a38b46967c Paul Lawrence 2023-01-25  211  
e8944a38b46967c Paul Lawrence 2023-01-25  212  	return BLK_STS_OK;
e8944a38b46967c Paul Lawrence 2023-01-25  213  }
e8944a38b46967c Paul Lawrence 2023-01-25  214  

:::::: The code at line 97 was first introduced by commit
:::::: e8944a38b46967c5dc658d0826779105562334bd Revert "ANDROID: dm-bow: remove dm-bow"

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
