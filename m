Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18B8F42
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 19:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677871604; x=1709407604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZF/PFOlS3OfYLtN+sJIevL8ahTFKHhZzuOsphGp4nss=;
  b=DoO6+h54yHuRPf4vDpvXZSzXLHARYoTRe5eYgyYdmhIbnLjgW7tbIdN6
   s1+FmmPa+tU+GPh1jmZ9e0Uzt8eus53lP4u+5WodTjdqEbvqnm+HvaSov
   rUYOzVRvSRi2E99kP2WxtZ2kspnYfa6Qycp1ju4mLQKXbDUrgnh810wMG
   M/7G9TMY10Z5Yv1ZMFMup4hgri7wiY7GDN5NrwOCeCoFe20j3I+X3EKRo
   dsi78YDZBtGSZNTKNYyhKPPG064L3XVyMPr8EFFC+VCp4i3N9jGerLdBC
   9EQOuB91azreLJG/xladT0lu0BqMLle64GPdNF91pVX508SLLkLy1dhOp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="336655608"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="336655608"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 11:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="1004696281"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; 
   d="scan'208";a="1004696281"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Mar 2023 11:26:23 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYB2t-0001cy-03;
	Fri, 03 Mar 2023 19:26:23 +0000
Date: Sat, 4 Mar 2023 03:25:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-q-release
 3921/7614] drivers/md/dm-bow.c:97:10: sparse: sparse: symbol 'range_top' was
 not declared. Should it be static?
Message-ID: <202303040338.2Y9s9qZH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-q-release
head:   39793952000376f86462e9cfc33766da2aa57084
commit: 45bc7d86e7d04f8ef944ca509e225df392e36642 [3921/7614] ANDROID: dm-bow: Add dm-bow feature
config: alpha-randconfig-s052-20230302 (https://download.01.org/0day-ci/archive/20230304/202303040338.2Y9s9qZH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/45bc7d86e7d04f8ef944ca509e225df392e36642
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-q-release
        git checkout 45bc7d86e7d04f8ef944ca509e225df392e36642
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash crypto/asymmetric_keys/ drivers/md/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303040338.2Y9s9qZH-lkp@intel.com/

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
   drivers/md/dm-bow.c: At top level:
   drivers/md/dm-bow.c:1179:5: warning: no previous prototype for 'dm_bow_prepare_ioctl' [-Wmissing-prototypes]
    1179 | int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c:1209:12: warning: no previous prototype for 'dm_bow_init' [-Wmissing-prototypes]
    1209 | int __init dm_bow_init(void)
         |            ^~~~~~~~~~~
   drivers/md/dm-bow.c:1218:6: warning: no previous prototype for 'dm_bow_exit' [-Wmissing-prototypes]
    1218 | void dm_bow_exit(void)
         |      ^~~~~~~~~~~

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
https://github.com/intel/lkp-tests
