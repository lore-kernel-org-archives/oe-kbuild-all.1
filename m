Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9DE3C68B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 21:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjFvshGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699650961; x=1731186961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wo3HADip41LOgAa4UzALnabxbB8Dy9nHKjxEiCgsSww=;
  b=GjFvshGeGPjy1ArHj6bEaey0Y3f6Ylibs7II1trLX0BmD2GrdKrOlp7q
   t9RDtq9XpdDMmGSzp1Sa+n+CePBeLakHvxi5Ltcs9SI6mzBHJd8X9JDJE
   hKK43eiDVwN4yLwzi1NEcCDvLdFUtt29nAhKDWwbmAOGr0o+0oDeQQ0sI
   njvCkgq8Ijb+EJE4c5/18uNcDjhFPXTaW3nfgmmX1d4+qkycZDlpor6du
   PQXG2eEuuvww/9excyFf+EzIjW4FNupDJeU5MkEFwX1zTOqBePdzB93iF
   +rHsfb8OcWtzKsIz63rh+6kWbTsvPuZGbxGBKogv4h/nxbyZAmMVSH4Un
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456729946"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="456729946"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 13:16:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="829741942"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="829741942"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Nov 2023 13:15:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1Yr5-0009uA-3D;
	Fri, 10 Nov 2023 21:15:55 +0000
Date: Sat, 11 Nov 2023 05:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 68/24081] drivers/md/dm-bow.c:97:10:
 sparse: sparse: symbol 'range_top' was not declared. Should it be static?
Message-ID: <202311110531.oGQpj9Dg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d8156345d8c56a2b082c1877eaee48a22c33014f
commit: 0ce3eb37e9eab307def1bad31c028d86ae7b2ea1 [68/24081] ANDROID: dm-bow: Add dm-bow feature
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231111/202311110531.oGQpj9Dg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110531.oGQpj9Dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110531.oGQpj9Dg-lkp@intel.com/

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
   drivers/md/dm-bow.c:281:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:281:24: sparse:     expected int
   drivers/md/dm-bow.c:281:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:393:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:393:24: sparse:     expected int
   drivers/md/dm-bow.c:393:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:337:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:337:24: sparse:     expected int
   drivers/md/dm-bow.c:337:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:342:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:342:24: sparse:     expected int
   drivers/md/dm-bow.c:342:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:348:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:348:24: sparse:     expected int
   drivers/md/dm-bow.c:348:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:356:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:356:24: sparse:     expected int
   drivers/md/dm-bow.c:356:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:420:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:420:24: sparse:     expected int
   drivers/md/dm-bow.c:420:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:425:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:425:24: sparse:     expected int
   drivers/md/dm-bow.c:425:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:435:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:435:24: sparse:     expected int
   drivers/md/dm-bow.c:435:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:441:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:441:24: sparse:     expected int
   drivers/md/dm-bow.c:441:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:459:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:459:24: sparse:     expected int
   drivers/md/dm-bow.c:459:24: sparse:     got restricted blk_status_t [usertype]
>> drivers/md/dm-bow.c:550:53: sparse: sparse: Using plain integer as NULL pointer
   drivers/md/dm-bow.c:752:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:752:24: sparse:     expected int
   drivers/md/dm-bow.c:752:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:771:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:771:24: sparse:     expected int
   drivers/md/dm-bow.c:771:24: sparse:     got restricted blk_status_t [usertype]
   drivers/md/dm-bow.c:863:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/md/dm-bow.c:863:24: sparse:     expected int
   drivers/md/dm-bow.c:863:24: sparse:     got restricted blk_status_t [usertype]
>> drivers/md/dm-bow.c:899:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted blk_status_t [usertype] bi_status @@     got int [assigned] ret @@
   drivers/md/dm-bow.c:899:32: sparse:     expected restricted blk_status_t [usertype] bi_status
   drivers/md/dm-bow.c:899:32: sparse:     got int [assigned] ret
>> drivers/md/dm-bow.c:1025:5: sparse: sparse: symbol 'remap_unless_illegal_trim' was not declared. Should it be static?
>> drivers/md/dm-bow.c:1179:5: sparse: sparse: symbol 'dm_bow_prepare_ioctl' was not declared. Should it be static?
>> drivers/md/dm-bow.c:1209:12: sparse: sparse: symbol 'dm_bow_init' was not declared. Should it be static?
>> drivers/md/dm-bow.c:1218:6: sparse: sparse: symbol 'dm_bow_exit' was not declared. Should it be static?
   drivers/md/dm-bow.c:97:10: warning: no previous prototype for 'range_top' [-Wmissing-prototypes]
      97 | sector_t range_top(struct bow_range *br)
         |          ^~~~~~~~~
   drivers/md/dm-bow.c:103:5: warning: no previous prototype for 'range_size' [-Wmissing-prototypes]
     103 | u64 range_size(struct bow_range *br)
         |     ^~~~~~~~~~
   drivers/md/dm-bow.c:148:6: warning: no previous prototype for 'add_before' [-Wmissing-prototypes]
     148 | void add_before(struct rb_root *ranges, struct bow_range *new_br,
         |      ^~~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from drivers/md/dm.h:13,
                    from drivers/md/dm-bow.c:7:
   drivers/md/dm-bow.c: In function 'copy_data':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'sector_t' {aka 'long long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:308:16: note: in expansion of macro 'KERN_ERR'
     308 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~
   include/linux/device-mapper.h:534:25: note: in expansion of macro 'pr_err'
     534 | #define DMERR(fmt, ...) pr_err(DM_FMT(fmt), ##__VA_ARGS__)
         |                         ^~~~~~
   drivers/md/dm-bow.c:294:25: note: in expansion of macro 'DMERR'
     294 |                         DMERR("Cannot read page %lu", page);
         |                         ^~~~~
   drivers/md/dm-bow.c: In function 'add_trim':
   drivers/md/dm-bow.c:955:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'sector_t' {aka 'long long unsigned int'} [-Wformat=]
     955 |         DMDEBUG("add_trim: %lu, %u",
         |                 ^~~~~~~~~~~~~~~~~~~
     956 |                 bio->bi_iter.bi_sector, bio->bi_iter.bi_size);
         |                 ~~~~~~~~~~~~~~~~~~~~~~
         |                             |
         |                             sector_t {aka long long unsigned int}
   include/linux/printk.h:136:24: note: in definition of macro 'no_printk'
     136 |                 printk(fmt, ##__VA_ARGS__);             106-      |                        ^~~
   drivers/md/dm-bow.c:955:9: note: in expansion of macro 'DMDEBUG'
     955 |         DMDEBUG("add_trim: %lu, %u",
         |         ^~~~~~~
   drivers/md/dm-bow.c:955:30: note: format string is defined here
     955 |         DMDEBUG("add_trim: %lu, %u",
         |                            ~~^
         |                              |
         |                              long unsigned int
         |                            %llu
   drivers/md/dm-bow.c: In function 'remove_trim':
   drivers/md/dm-bow.c:993:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'sector_t' {aka 'long long unsigned int'} [-Wformat=]
     993 |         DMDEBUG("remove_trim: %lu, %u",
         |                 ^~~~~~~~~~~~~~~~~~~~~~
     994 |                 bio->bi_iter.bi_sector, bio->bi_iter.bi_size);
         |                 ~~~~~~~~~~~~~~~~~~~~~~
         |                             |
         |                             sector_t {aka long long unsigned int}
   include/linux/printk.h:136:24: note: in definition of macro 'no_printk'
     136 |                 printk(fmt, ##__VA_ARGS__);             126-      |                        ^~~
   drivers/md/dm-bow.c:993:9: note: in expansion of macro 'DMDEBUG'
     993 |         DMDEBUG("remove_trim: %lu, %u",
         |         ^~~~~~~
   drivers/md/dm-bow.c:993:33: note: format string is defined here
     993 |         DMDEBUG("remove_trim: %lu, %u",
         |                               ~~^
         |                                 |
         |                                 long unsigned int
         |                               %llu
   drivers/md/dm-bow.c: At top level:
   drivers/md/dm-bow.c:1025:5: warning: no previous prototype for 'remap_unless_illegal_trim' [-Wmissing-prototypes]
    1025 | int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c: In function 'dm_bow_map':
   drivers/md/dm-bow.c:1061:51: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1061 |                                 /* pass-through */;
         |                                                   ^
   drivers/md/dm-bow.c:1068:51: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1068 |                                 /* pass-through */;
         |                                                   ^
   drivers/md/dm-bow.c: In function 'dm_bow_tablestatus':
   drivers/md/dm-bow.c:1119:66: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'sector_t' {aka 'long long unsigned int'} [-Wformat=]
    1119 |                 result += scnprintf(result, end - result, "%s: %lu",
         |                                                                ~~^
         |                                                                  |
         |                                                                  long unsigned int
         |                                                                %llu
    1120 |                                     readable_type[br->type], br->sector);
         |                                                              ~~~~~~~~~~
         |                                                                |
         |                                                                sector_t {aka long long unsigned int}
   drivers/md/dm-bow.c: At top level:
   drivers/md/dm-bow.c:1179:5: warning: no previous prototype for 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1179 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:1209:12: warning: no previous prototype for 'dm_bow_init' [-Wmissing-prototypes]

vim +/range_top +97 drivers/md/dm-bow.c

    96	
  > 97	sector_t range_top(struct bow_range *br)
    98	{
    99		return container_of(rb_next(&br->node), struct bow_range, node)
   100			->sector;
   101	}
   102	
   103	u64 range_size(struct bow_range *br)
   104	{
   105		return (range_top(br) - br->sector) * SECTOR_SIZE;
   106	}
   107	
   108	static sector_t bvec_top(struct bvec_iter *bi_iter)
   109	{
   110		return bi_iter->bi_sector + bi_iter->bi_size / SECTOR_SIZE;
   111	}
   112	
   113	/*
   114	 * Find the first range that overlaps with bi_iter
   115	 * bi_iter is set to the size of the overlapping sub-range
   116	 */
   117	static struct bow_range *find_first_overlapping_range(struct rb_root *ranges,
   118							      struct bvec_iter *bi_iter)
   119	{
   120		struct rb_node *node = ranges->rb_node;
   121		struct bow_range *br;
   122	
   123		while (node) {
   124			br = container_of(node, struct bow_range, node);
   125	
   126			if (br->sector <= bi_iter->bi_sector
   127			    && bi_iter->bi_sector < range_top(br))
   128				break;
   129	
   130			if (bi_iter->bi_sector < br->sector)
   131				node = node->rb_left;
   132			else
   133				node = node->rb_right;
   134		}
   135	
   136		WARN_ON(!node);
   137		if (!node)
   138			return NULL;
   139	
   140		if (range_top(br) - bi_iter->bi_sector
   141		    < bi_iter->bi_size >> SECTOR_SHIFT)
   142			bi_iter->bi_size = (range_top(br) - bi_iter->bi_sector)
   143				<< SECTOR_SHIFT;
   144	
   145		return br;
   146	}
   147	
 > 148	void add_before(struct rb_root *ranges, struct bow_range *new_br,
   149			struct bow_range *existing)
   150	{
   151		struct rb_node *parent = &(existing->node);
   152		struct rb_node **link = &(parent->rb_left);
   153	
   154		while (*link) {
   155			parent = *link;
   156			link = &((*link)->rb_right);
   157		}
   158	
   159		rb_link_node(&new_br->node, parent, link);
   160		rb_insert_color(&new_br->node, ranges);
   161	}
   162	
   163	/*
   164	 * Given a range br returned by find_first_overlapping_range, split br into a
   165	 * leading range, a range matching the bi_iter and a trailing range.
   166	 * Leading and trailing may end up size 0 and will then be deleted. The
   167	 * new range matching the bi_iter is then returned and should have its type
   168	 * and type specific fields populated.
   169	 * If bi_iter runs off the end of the range, bi_iter is truncated accordingly
   170	 */
   171	static int split_range(struct bow_context *bc, struct bow_range **br,
   172			       struct bvec_iter *bi_iter)
   173	{
   174		struct bow_range *new_br;
   175	
   176		if (bi_iter->bi_sector < (*br)->sector) {
   177			WARN_ON(true);
 > 178			return BLK_STS_IOERR;
   179		}
   180	
   181		if (bi_iter->bi_sector > (*br)->sector) {
   182			struct bow_range *leading_br =
   183				kzalloc(sizeof(*leading_br), GFP_KERNEL);
   184	
   185			if (!leading_br)
   186				return BLK_STS_RESOURCE;
   187	
   188			*leading_br = **br;
   189			if (leading_br->type == TRIMMED)
   190				list_add(&leading_br->trimmed_list, &bc->trimmed_list);
   191	
   192			add_before(&bc->ranges, leading_br, *br);
   193			(*br)->sector = bi_iter->bi_sector;
   194		}
   195	
   196		if (bvec_top(bi_iter) >= range_top(*br)) {
   197			bi_iter->bi_size = (range_top(*br) - (*br)->sector)
   198						* SECTOR_SIZE;
   199			return BLK_STS_OK;
   200		}
   201	
   202		/* new_br will be the beginning, existing br will be the tail */
   203		new_br = kzalloc(sizeof(*new_br), GFP_KERNEL);
   204		if (!new_br)
   205			return BLK_STS_RESOURCE;
   206	
   207		new_br->sector = (*br)->sector;
   208		(*br)->sector = bvec_top(bi_iter);
   209		add_before(&bc->ranges, new_br, *br);
   210		*br = new_br;
   211	
   212		return BLK_STS_OK;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
