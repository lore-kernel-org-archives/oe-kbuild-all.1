Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A5E28E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730185150; cv=none; b=Z5wvsHaCk5Dxn7HLAsYuQHjEPEiWre/77iuckdD1AbyhnVNs4eFQ1ZxScn88XMCaUQqRbc712DodSmKKU0knahqnvS27ZcNKKPXIOQA2jBndL+J5bno8jI2n1PeDL1FBDKhDR5eOHJqGYQ8YoVuReXxmBM6sj4e17kJPX60Ok7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730185150; c=relaxed/simple;
	bh=S6QXFoHqckET5JcYfj9TVv42zPNIPNVGx6HbMU2Zz4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBldIVAKrJLJLq5WegeHC7UZKllrEml/s2KXTJYxvF1C+ilWdRrAmlXeO8eNoOCiUMcrIrhvr1nBhEwIQmVXepDayQ1do/2XYltjybihU6csXbdLO/5yvEN7cMBzKQcpqt2eoxn+L+8mMZY7ujclpxY4xWwY0757E+OMBypOiSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyzU+s+f; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyzU+s+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730185147; x=1761721147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6QXFoHqckET5JcYfj9TVv42zPNIPNVGx6HbMU2Zz4Y=;
  b=FyzU+s+fOCbaFyHmxBhUPVl59rlVZarU7j2B2z9Hy0eWeJ2i232tM5OH
   chxANQYhdov1MLQYkYcq9LeplCTFg+c+8dZjdh1Kq/QJZLLgQhR2EUJOb
   wTBQIf95pWLrkSwYTxyEyJUTw4DST5gZoyKAeISjyC+KJvk4Zh6H1hP0o
   CpDEj6zWMwK40e1CfEKqGSwSi/k2MpGXPIOKSBJQwgOgiwhZ5JvSYN9MX
   SQYVQ0ORYH3SzpFJvkdhXxWBKrIXL3kSZj7lqimT+acCjqhOzdLUSDhyw
   o9vvCkU8sqYdfoily6dwS1Zd4jbIFqvJt/VkOBV6axv8u9NmyHiNnDE74
   g==;
X-CSE-ConnectionGUID: adMfWroPTd+DG8SVq40OQg==
X-CSE-MsgGUID: uZGZglBMTM6K5oRAYSfUmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40426370"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40426370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 23:59:03 -0700
X-CSE-ConnectionGUID: g3GGvJfIR0W5HgxCSMzlgA==
X-CSE-MsgGUID: utsAujZoQrOCrOrkRGVqRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82283296"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2024 23:58:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5gBf-000dLw-10;
	Tue, 29 Oct 2024 06:58:43 +0000
Date: Tue, 29 Oct 2024 14:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/8] drivers/md/dm-bow.c:97:10:
 sparse: sparse: symbol 'range_top' was not declared. Should it be static?
Message-ID: <202410291459.pczz2AmT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   962c205e7ed308760a15b79cc7ccfd028a013022
commit: 7a96549fc9ff33f14b4ed1b4c5f49a0fb51ce9c9 [2/8] ANDROID: dm-bow: Fix up revert remove dm-bow
config: i386-randconfig-r111-20241028 (https://download.01.org/0day-ci/archive/20241029/202410291459.pczz2AmT-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291459.pczz2AmT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291459.pczz2AmT-lkp@intel.com/

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
   drivers/md/dm-bow.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h, drivers/md/dm.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/range_top +97 drivers/md/dm-bow.c

dcb994383d2b16 Paul Lawrence 2023-01-25   96  
dcb994383d2b16 Paul Lawrence 2023-01-25  @97  sector_t range_top(struct bow_range *br)
dcb994383d2b16 Paul Lawrence 2023-01-25   98  {
dcb994383d2b16 Paul Lawrence 2023-01-25   99  	return container_of(rb_next(&br->node), struct bow_range, node)
dcb994383d2b16 Paul Lawrence 2023-01-25  100  		->sector;
dcb994383d2b16 Paul Lawrence 2023-01-25  101  }
dcb994383d2b16 Paul Lawrence 2023-01-25  102  
dcb994383d2b16 Paul Lawrence 2023-01-25  103  u64 range_size(struct bow_range *br)
dcb994383d2b16 Paul Lawrence 2023-01-25  104  {
dcb994383d2b16 Paul Lawrence 2023-01-25  105  	return (range_top(br) - br->sector) * SECTOR_SIZE;
dcb994383d2b16 Paul Lawrence 2023-01-25  106  }
dcb994383d2b16 Paul Lawrence 2023-01-25  107  
dcb994383d2b16 Paul Lawrence 2023-01-25  108  static sector_t bvec_top(struct bvec_iter *bi_iter)
dcb994383d2b16 Paul Lawrence 2023-01-25  109  {
dcb994383d2b16 Paul Lawrence 2023-01-25  110  	return bi_iter->bi_sector + bi_iter->bi_size / SECTOR_SIZE;
dcb994383d2b16 Paul Lawrence 2023-01-25  111  }
dcb994383d2b16 Paul Lawrence 2023-01-25  112  
dcb994383d2b16 Paul Lawrence 2023-01-25  113  /*
dcb994383d2b16 Paul Lawrence 2023-01-25  114   * Find the first range that overlaps with bi_iter
dcb994383d2b16 Paul Lawrence 2023-01-25  115   * bi_iter is set to the size of the overlapping sub-range
dcb994383d2b16 Paul Lawrence 2023-01-25  116   */
dcb994383d2b16 Paul Lawrence 2023-01-25  117  static struct bow_range *find_first_overlapping_range(struct rb_root *ranges,
dcb994383d2b16 Paul Lawrence 2023-01-25  118  						      struct bvec_iter *bi_iter)
dcb994383d2b16 Paul Lawrence 2023-01-25  119  {
dcb994383d2b16 Paul Lawrence 2023-01-25  120  	struct rb_node *node = ranges->rb_node;
dcb994383d2b16 Paul Lawrence 2023-01-25  121  	struct bow_range *br;
dcb994383d2b16 Paul Lawrence 2023-01-25  122  
dcb994383d2b16 Paul Lawrence 2023-01-25  123  	while (node) {
dcb994383d2b16 Paul Lawrence 2023-01-25  124  		br = container_of(node, struct bow_range, node);
dcb994383d2b16 Paul Lawrence 2023-01-25  125  
dcb994383d2b16 Paul Lawrence 2023-01-25  126  		if (br->sector <= bi_iter->bi_sector
dcb994383d2b16 Paul Lawrence 2023-01-25  127  		    && bi_iter->bi_sector < range_top(br))
dcb994383d2b16 Paul Lawrence 2023-01-25  128  			break;
dcb994383d2b16 Paul Lawrence 2023-01-25  129  
dcb994383d2b16 Paul Lawrence 2023-01-25  130  		if (bi_iter->bi_sector < br->sector)
dcb994383d2b16 Paul Lawrence 2023-01-25  131  			node = node->rb_left;
dcb994383d2b16 Paul Lawrence 2023-01-25  132  		else
dcb994383d2b16 Paul Lawrence 2023-01-25  133  			node = node->rb_right;
dcb994383d2b16 Paul Lawrence 2023-01-25  134  	}
dcb994383d2b16 Paul Lawrence 2023-01-25  135  
dcb994383d2b16 Paul Lawrence 2023-01-25  136  	WARN_ON(!node);
dcb994383d2b16 Paul Lawrence 2023-01-25  137  	if (!node)
dcb994383d2b16 Paul Lawrence 2023-01-25  138  		return NULL;
dcb994383d2b16 Paul Lawrence 2023-01-25  139  
dcb994383d2b16 Paul Lawrence 2023-01-25  140  	if (range_top(br) - bi_iter->bi_sector
dcb994383d2b16 Paul Lawrence 2023-01-25  141  	    < bi_iter->bi_size >> SECTOR_SHIFT)
dcb994383d2b16 Paul Lawrence 2023-01-25  142  		bi_iter->bi_size = (range_top(br) - bi_iter->bi_sector)
dcb994383d2b16 Paul Lawrence 2023-01-25  143  			<< SECTOR_SHIFT;
dcb994383d2b16 Paul Lawrence 2023-01-25  144  
dcb994383d2b16 Paul Lawrence 2023-01-25  145  	return br;
dcb994383d2b16 Paul Lawrence 2023-01-25  146  }
dcb994383d2b16 Paul Lawrence 2023-01-25  147  
dcb994383d2b16 Paul Lawrence 2023-01-25 @148  void add_before(struct rb_root *ranges, struct bow_range *new_br,
dcb994383d2b16 Paul Lawrence 2023-01-25  149  		struct bow_range *existing)
dcb994383d2b16 Paul Lawrence 2023-01-25  150  {
dcb994383d2b16 Paul Lawrence 2023-01-25  151  	struct rb_node *parent = &(existing->node);
dcb994383d2b16 Paul Lawrence 2023-01-25  152  	struct rb_node **link = &(parent->rb_left);
dcb994383d2b16 Paul Lawrence 2023-01-25  153  
dcb994383d2b16 Paul Lawrence 2023-01-25  154  	while (*link) {
dcb994383d2b16 Paul Lawrence 2023-01-25  155  		parent = *link;
dcb994383d2b16 Paul Lawrence 2023-01-25  156  		link = &((*link)->rb_right);
dcb994383d2b16 Paul Lawrence 2023-01-25  157  	}
dcb994383d2b16 Paul Lawrence 2023-01-25  158  
dcb994383d2b16 Paul Lawrence 2023-01-25  159  	rb_link_node(&new_br->node, parent, link);
dcb994383d2b16 Paul Lawrence 2023-01-25  160  	rb_insert_color(&new_br->node, ranges);
dcb994383d2b16 Paul Lawrence 2023-01-25  161  }
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

:::::: The code at line 97 was first introduced by commit
:::::: dcb994383d2b1641ebe7b518caab88d2d9dbfa72 Revert "ANDROID: dm-bow: remove dm-bow"

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Treehugger Robot <android-test-infra-autosubmit@system.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
