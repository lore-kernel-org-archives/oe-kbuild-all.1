Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB617EE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 05:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692683909; x=1724219909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R80NIAKJf8+K1vNAX50fNiHx4eRPU2kfT6kzqCj0UVs=;
  b=TBXY6sdzrJO4jwo0yOCyI+vgXV3bDWr8RlmjHZLz5H0Xyi/oGre1NeIX
   rC+r4al0a9GF3iLt5mMD1knqwRO+LqY8Ep4mTxLFFnY7Amj+fyTwSXo5m
   Ga3AJgTAEnVVnDHEf5c1tfxC+XY7oYt1YBtUBYYohx0rmTXJhtXO8OBuK
   HK7vQuKBoZ6DZ+/bS4O/TsrVE9+ASMvNiJ5sHhRjps6z8iy3as7PAe1eZ
   Kxe3RziiSZ37Wtxzk7FoBKuHA1VV/nbSKwQeXyJ8Prg+M0HWzGlQY8mhA
   IthnYGR4RyK2phirBFF8lJCnpFSUwz+SvQUgwnpXZ4m6yelvkxLuE/3Q+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="460152784"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="460152784"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 22:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1066911725"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="1066911725"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Aug 2023 22:58:26 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYKPJ-0001Po-2h;
	Tue, 22 Aug 2023 05:58:25 +0000
Date: Tue, 22 Aug 2023 13:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 68/27479]
 drivers/md/dm-bow.c:97:10: warning: no previous declaration for 'range_top'
Message-ID: <202308221340.qvmKJErb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   0b89add3a32b77a9c7d68570de0ae6c67daae047
commit: 0ce3eb37e9eab307def1bad31c028d86ae7b2ea1 [68/27479] ANDROID: dm-bow: Add dm-bow feature
config: i386-randconfig-r035-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221340.qvmKJErb-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221340.qvmKJErb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221340.qvmKJErb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-bow.c:97:10: warning: no previous declaration for 'range_top' [-Wmissing-declarations]
    sector_t range_top(struct bow_range *br)
             ^~~~~~~~~
>> drivers/md/dm-bow.c:103:5: warning: no previous declaration for 'range_size' [-Wmissing-declarations]
    u64 range_size(struct bow_range *br)
        ^~~~~~~~~~
>> drivers/md/dm-bow.c:148:6: warning: no previous declaration for 'add_before' [-Wmissing-declarations]
    void add_before(struct rb_root *ranges, struct bow_range *new_br,
         ^~~~~~~~~~
   In file included from include/linux/printk.h:7:0,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from drivers/md/dm.h:13,
                    from drivers/md/dm-bow.c:7:
   drivers/md/dm-bow.c: In function 'copy_data':
   include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'sector_t {aka long long unsigned int}' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:308:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   include/linux/device-mapper.h:534:25: note: in expansion of macro 'pr_err'
    #define DMERR(fmt, ...) pr_err(DM_FMT(fmt), ##__VA_ARGS__)
                            ^~~~~~
   drivers/md/dm-bow.c:294:4: note: in expansion of macro 'DMERR'
       DMERR("Cannot read page %lu", page);
       ^~~~~
   drivers/md/dm-bow.c:294:30: note: format string is defined here
       DMERR("Cannot read page %lu", page);
                               ~~^
                               %llu
   In file included from include/linux/printk.h:7:0,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from drivers/md/dm.h:13,
                    from drivers/md/dm-bow.c:7:
   drivers/md/dm-bow.c: In function 'add_trim':
   include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'sector_t {aka long long unsigned int}' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/kern_levels.h:15:20: note: in expansion of macro 'KERN_SOH'
    #define KERN_DEBUG KERN_SOH "7" /* debug-level messages */
                       ^~~~~~~~
   include/linux/device-mapper.h:542:34: note: in expansion of macro 'KERN_DEBUG'
    #define DMDEBUG(fmt, ...) printk(KERN_DEBUG DM_FMT(fmt), ##__VA_ARGS__)
                                     ^~~~~~~~~~
   drivers/md/dm-bow.c:955:2: note: in expansion of macro 'DMDEBUG'
     DMDEBUG("add_trim: %lu, %u",
     ^~~~~~~
   drivers/md/dm-bow.c:955:23: note: format string is defined here
     DMDEBUG("add_trim: %lu, %u",
                        ~~^
                        %llu
   In file included from include/linux/printk.h:7:0,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from drivers/md/dm.h:13,
                    from drivers/md/dm-bow.c:7:
   drivers/md/dm-bow.c: In function 'remove_trim':
   include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'sector_t {aka long long unsigned int}' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/kern_levels.h:15:20: note: in expansion of macro 'KERN_SOH'
    #define KERN_DEBUG KERN_SOH "7" /* debug-level messages */
                       ^~~~~~~~
   include/linux/device-mapper.h:542:34: note: in expansion of macro 'KERN_DEBUG'
    #define DMDEBUG(fmt, ...) printk(KERN_DEBUG DM_FMT(fmt), ##__VA_ARGS__)
                                     ^~~~~~~~~~
   drivers/md/dm-bow.c:993:2: note: in expansion of macro 'DMDEBUG'
     DMDEBUG("remove_trim: %lu, %u",
     ^~~~~~~
   drivers/md/dm-bow.c:993:26: note: format string is defined here
     DMDEBUG("remove_trim: %lu, %u",
                           ~~^
                           %llu
   drivers/md/dm-bow.c: At top level:
>> drivers/md/dm-bow.c:1025:5: warning: no previous declaration for 'remap_unless_illegal_trim' [-Wmissing-declarations]
    int remap_unless_illegal_trim(struct bow_context *bc, struct bio *bio)
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-bow.c: In function 'dm_bow_map':
   drivers/md/dm-bow.c:1061:23: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
        /* pass-through */;
                          ^
   drivers/md/dm-bow.c:1068:23: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
        /* pass-through */;
                          ^
   drivers/md/dm-bow.c: In function 'dm_bow_tablestatus':
   drivers/md/dm-bow.c:1119:52: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'sector_t {aka long long unsigned int}' [-Wformat=]
      result += scnprintf(result, end - result, "%s: %lu",
                                                     ~~^
                                                     %llu
            readable_type[br->type], br->sector);
                                     ~~~~~~~~~~         
   drivers/md/dm-bow.c: At top level:
>> drivers/md/dm-bow.c:1179:5: warning: no previous declaration for 'dm_bow_prepare_ioctl' [-Wmissing-declarations]
    int dm_bow_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
        ^~~~~~~~~~~~~~~~~~~~
>> drivers/md/dm-bow.c:1209:12: warning: no previous declaration for 'dm_bow_init' [-Wmissing-declarations]
    int __init dm_bow_init(void)
               ^~~~~~~~~~~
>> drivers/md/dm-bow.c:1218:6: warning: no previous declaration for 'dm_bow_exit' [-Wmissing-declarations]
    void dm_bow_exit(void)
         ^~~~~~~~~~~


vim +/range_top +97 drivers/md/dm-bow.c

    96	
  > 97	sector_t range_top(struct bow_range *br)
    98	{
    99		return container_of(rb_next(&br->node), struct bow_range, node)
   100			->sector;
   101	}
   102	
 > 103	u64 range_size(struct bow_range *br)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
