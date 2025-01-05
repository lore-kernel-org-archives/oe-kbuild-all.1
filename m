Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B95980027
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 03:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736046298; cv=none; b=ALt5hANzgT6pF4R4Dchaay+arzE8NmPfRgDOitb5+nfllR+SV9Z5+5jQQxVLF8OOglqTqqOcQr1MxN8M1DUqV6LXpzjjPVC924PQePSlB8VfF3d2Bejtwnwpg078qmGaz8JM45oX7M2V/CF7Vjqu9cWN8PPesR7mjfZ6YhHtJ0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736046298; c=relaxed/simple;
	bh=BNw9zK6inKSikVLGcAzuO8/e24ExHeKqGeEp/CR8PnA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+gKTvRUyXNHL6XtulHZ9WIO2FsorUyNvsr2+GJOSTfJvfQ7W/qkdKp+GfYEwpSYvz9FmcGBFtWLIAWNXU753m7yzEckLYCUvJzRGvoZC5dAjFLzEuJIm5rL+OM1vFgi1IPhyPADoGn/M4SdsKn1TmMFJfivUOi0qoc4iIHFs4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnBxO3pN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnBxO3pN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736046296; x=1767582296;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BNw9zK6inKSikVLGcAzuO8/e24ExHeKqGeEp/CR8PnA=;
  b=CnBxO3pNoUsV7SkOQUafxUkxvlylYsHMThE2oO7oMY35Qn8tRVdjSus6
   GgrqFKTXfW8W4EBpqP6Rc48iyN1ECbc5dAR+55VMM2IvppVKUWWai3tuH
   /WUqr0R0CTcTiePQUhNuK9o5C/ScFWKL2DxXYP4czKjvm9bgBXjhLCDD6
   lJ1fgj5g9bQDB9yqMTPVhWQUTxnWK2SQ+66rVLkyCHrhRagvV17DIV3SH
   rBLvRyErYmOnXxmtCWpI7WOe38kvJPb6SAqyg3HuMhWyQ0QR5kvRZR/S0
   UjGJHgMG3etY9PiXF87g96K+LgpX4Xqw9+iCyhekvZefZUMhvHyTySppt
   w==;
X-CSE-ConnectionGUID: mYluvowYQ8yucZ2SxdZFkw==
X-CSE-MsgGUID: wr1DdWQJTTyMoHj5ALlXzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="46732137"
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="46732137"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 19:04:55 -0800
X-CSE-ConnectionGUID: Me2NV59QQ+CrnVCKXZ0ElQ==
X-CSE-MsgGUID: L808XPXkQPS9oV0jut62ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,289,1728975600"; 
   d="scan'208";a="102588796"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jan 2025 19:04:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUGwd-000BQ3-1m;
	Sun, 05 Jan 2025 03:04:51 +0000
Date: Sun, 5 Jan 2025 11:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: drivers/mtd/mtdpart.c:999:34: warning: '%s' directive argument is
 null
Message-ID: <202501051058.uM0FMNXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 37686b1353cfc30e127cef811959cdbcd0495d98 tracing: Improve "if" macro code generation
date:   6 years ago
config: powerpc-randconfig-r011-20220404 (https://download.01.org/0day-ci/archive/20250105/202501051058.uM0FMNXL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051058.uM0FMNXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051058.uM0FMNXL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:472:9: note: in expansion of macro 'unlikely'
     472 |         unlikely(branch);                                                       \
         |         ^~~~~~~~
   include/linux/dynamic_debug.h:98:9: note: in expansion of macro 'static_branch_unlikely'
      98 |         static_branch_unlikely(&descriptor.key.dd_key_false)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:117:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     117 |         if (DYNAMIC_DEBUG_BRANCH(id))                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:136:9: note: in expansion of macro '__dynamic_func_call'
     136 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:146:9: note: in expansion of macro '_dynamic_func_call'
     146 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:334:9: note: in expansion of macro 'dynamic_pr_debug'
     334 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:994:25: note: in expansion of macro 'pr_debug'
     994 |                         pr_debug("%s: parsing partitions %s\n", master->name,
         |                         ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/dynamic_debug.h:117:9: note: in expansion of macro 'if'
     117 |         if (DYNAMIC_DEBUG_BRANCH(id))                   \
         |         ^~
   include/linux/dynamic_debug.h:136:9: note: in expansion of macro '__dynamic_func_call'
     136 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:146:9: note: in expansion of macro '_dynamic_func_call'
     146 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:334:9: note: in expansion of macro 'dynamic_pr_debug'
     334 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:994:25: note: in expansion of macro 'pr_debug'
     994 |                         pr_debug("%s: parsing partitions %s\n", master->name,
         |                         ^~~~~~~~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/dynamic_debug.h:117:9: note: in expansion of macro 'if'
     117 |         if (DYNAMIC_DEBUG_BRANCH(id))                   \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/jump_label.h:472:9: note: in expansion of macro 'unlikely'
     472 |         unlikely(branch);                                                       \
         |         ^~~~~~~~
   include/linux/dynamic_debug.h:98:9: note: in expansion of macro 'static_branch_unlikely'
      98 |         static_branch_unlikely(&descriptor.key.dd_key_false)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:117:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     117 |         if (DYNAMIC_DEBUG_BRANCH(id))                   \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:136:9: note: in expansion of macro '__dynamic_func_call'
     136 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:146:9: note: in expansion of macro '_dynamic_func_call'
     146 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:334:9: note: in expansion of macro 'dynamic_pr_debug'
     334 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:999:25: note: in expansion of macro 'pr_debug'
     999 |                         pr_debug("%s: got parser %s\n", master->name,
         |                         ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/dynamic_debug.h:117:9: note: in expansion of macro 'if'
     117 |         if (DYNAMIC_DEBUG_BRANCH(id))                   \
         |         ^~
   include/linux/dynamic_debug.h:136:9: note: in expansion of macro '__dynamic_func_call'
     136 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:146:9: note: in expansion of macro '_dynamic_func_call'
     146 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:334:9: note: in expansion of macro 'dynamic_pr_debug'
     334 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:999:25: note: in expansion of macro 'pr_debug'
     999 |                         pr_debug("%s: got parser %s\n", master->name,
         |                         ^~~~~~~~
   In file included from include/linux/kernel.h:15:
>> drivers/mtd/mtdpart.c:999:34: warning: '%s' directive argument is null [-Wformat-overflow=]
     999 |                         pr_debug("%s: got parser %s\n", master->name,
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:286:21: note: in definition of macro 'pr_fmt'
     286 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:136:9: note: in expansion of macro '__dynamic_func_call'
     136 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:146:9: note: in expansion of macro '_dynamic_func_call'
     146 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:334:9: note: in expansion of macro 'dynamic_pr_debug'
     334 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:999:25: note: in expansion of macro 'pr_debug'
     999 |                         pr_debug("%s: got parser %s\n", master->name,
         |                         ^~~~~~~~
   drivers/mtd/mtdpart.c:999:50: note: format string is defined here
     999 |                         pr_debug("%s: got parser %s\n", master->name,
         |                                                  ^~


vim +999 drivers/mtd/mtdpart.c

5b644aa012f67f Rafał Miłecki           2018-03-14   955  
ad274cecdbce18 Artem Bityutskiy        2011-06-08   956  /**
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   957   * parse_mtd_partitions - parse and register MTD partitions
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   958   *
ad274cecdbce18 Artem Bityutskiy        2011-06-08   959   * @master: the master partition (describes whole MTD device)
ad274cecdbce18 Artem Bityutskiy        2011-06-08   960   * @types: names of partition parsers to try or %NULL
c7975330154af1 Dmitry Eremin-Solenikov 2011-06-10   961   * @data: MTD partition parser-specific data
ad274cecdbce18 Artem Bityutskiy        2011-06-08   962   *
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   963   * This function tries to find & register partitions on MTD device @master. It
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   964   * uses MTD partition parsers, specified in @types. However, if @types is %NULL,
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   965   * then the default list of parsers is used. The default list contains only the
d26c87d64eff27 Dmitry Eremin-Solenikov 2011-05-29   966   * "cmdlinepart" and "ofpart" parsers ATM.
c51803ddba10d8 Huang Shijie            2012-08-18   967   * Note: If there are more then one parser in @types, the kernel only takes the
c51803ddba10d8 Huang Shijie            2012-08-18   968   * partitions parsed out by the first parser.
ad274cecdbce18 Artem Bityutskiy        2011-06-08   969   *
ad274cecdbce18 Artem Bityutskiy        2011-06-08   970   * This function may return:
ad274cecdbce18 Artem Bityutskiy        2011-06-08   971   * o a negative error code in case of failure
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   972   * o number of found partitions otherwise
ad274cecdbce18 Artem Bityutskiy        2011-06-08   973   */
26a4734623e4f0 Artem Bityutskiy        2013-03-11   974  int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
c7975330154af1 Dmitry Eremin-Solenikov 2011-06-10   975  			 struct mtd_part_parser_data *data)
^1da177e4c3f41 Linus Torvalds          2005-04-16   976  {
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   977  	struct mtd_partitions pparts = { };
^1da177e4c3f41 Linus Torvalds          2005-04-16   978  	struct mtd_part_parser *parser;
5a2415b0769233 Brian Norris            2015-10-11   979  	int ret, err = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16   980  
5c4eefbd5bb82a Dmitry Eremin-Solenikov 2011-06-02   981  	if (!types)
76a832254ab055 Rafał Miłecki           2018-07-13   982  		types = mtd_is_partition(master) ? default_subpartition_types :
76a832254ab055 Rafał Miłecki           2018-07-13   983  			default_mtd_part_types;
5c4eefbd5bb82a Dmitry Eremin-Solenikov 2011-06-02   984  
5a2415b0769233 Brian Norris            2015-10-11   985  	for ( ; *types; types++) {
5b644aa012f67f Rafał Miłecki           2018-03-14   986  		/*
5b644aa012f67f Rafał Miłecki           2018-03-14   987  		 * ofpart is a special type that means OF partitioning info
5b644aa012f67f Rafał Miłecki           2018-03-14   988  		 * should be used. It requires a bit different logic so it is
5b644aa012f67f Rafał Miłecki           2018-03-14   989  		 * handled in a separated function.
5b644aa012f67f Rafał Miłecki           2018-03-14   990  		 */
5b644aa012f67f Rafał Miłecki           2018-03-14   991  		if (!strcmp(*types, "ofpart")) {
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   992  			ret = mtd_part_of_parse(master, &pparts);
5b644aa012f67f Rafał Miłecki           2018-03-14   993  		} else {
5b644aa012f67f Rafał Miłecki           2018-03-14   994  			pr_debug("%s: parsing partitions %s\n", master->name,
5b644aa012f67f Rafał Miłecki           2018-03-14   995  				 *types);
5531ae4818fb04 Brian Norris            2015-12-04   996  			parser = mtd_part_parser_get(*types);
^1da177e4c3f41 Linus Torvalds          2005-04-16   997  			if (!parser && !request_module("%s", *types))
5531ae4818fb04 Brian Norris            2015-12-04   998  				parser = mtd_part_parser_get(*types);
8e2c992b59fcb5 Michal Suchanek         2015-08-18  @999  			pr_debug("%s: got parser %s\n", master->name,
8e2c992b59fcb5 Michal Suchanek         2015-08-18  1000  				parser ? parser->name : NULL);
7c802fbd541448 Artem Bityutskiy        2011-05-17  1001  			if (!parser)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1002  				continue;
5ac67ce36cfe38 Rafał Miłecki           2018-03-27  1003  			ret = mtd_part_do_parse(parser, master, &pparts, data);
5b644aa012f67f Rafał Miłecki           2018-03-14  1004  			if (ret <= 0)
5b644aa012f67f Rafał Miłecki           2018-03-14  1005  				mtd_part_parser_put(parser);
5b644aa012f67f Rafał Miłecki           2018-03-14  1006  		}
01f9c7240a900d Brian Norris            2017-05-23  1007  		/* Found partitions! */
5ac67ce36cfe38 Rafał Miłecki           2018-03-27  1008  		if (ret > 0) {
5ac67ce36cfe38 Rafał Miłecki           2018-03-27  1009  			err = add_mtd_partitions(master, pparts.parts,
5ac67ce36cfe38 Rafał Miłecki           2018-03-27  1010  						 pparts.nr_parts);
5ac67ce36cfe38 Rafał Miłecki           2018-03-27  1011  			mtd_part_parser_cleanup(&pparts);
5ac67ce36cfe38 Rafał Miłecki           2018-03-27  1012  			return err ? err : pparts.nr_parts;
5ac67ce36cfe38 Rafał Miłecki           2018-03-27  1013  		}
5a2415b0769233 Brian Norris            2015-10-11  1014  		/*
5a2415b0769233 Brian Norris            2015-10-11  1015  		 * Stash the first error we see; only report it if no parser
5a2415b0769233 Brian Norris            2015-10-11  1016  		 * succeeds
5a2415b0769233 Brian Norris            2015-10-11  1017  		 */
5a2415b0769233 Brian Norris            2015-10-11  1018  		if (ret < 0 && !err)
5a2415b0769233 Brian Norris            2015-10-11  1019  			err = ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1020  	}
5a2415b0769233 Brian Norris            2015-10-11  1021  	return err;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1022  }
5daa7b21496aeb Roman Tereshonkov       2010-09-17  1023  

:::::: The code at line 999 was first introduced by commit
:::::: 8e2c992b59fcb5e56e3667f5c30c7d26fbbf14a2 mtd: mtdpart: add debug prints to partition parser.

:::::: TO: Michal Suchanek <hramrach@gmail.com>
:::::: CC: Brian Norris <computersforpeace@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
