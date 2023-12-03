Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E5A3B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiMFwTrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585108; x=1733121108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DG21kFQ0D4JnjKvuNyMguKtjcOw2FeQROhzlMw0eKPY=;
  b=PiMFwTrALydAQD0Fsxn60tQFuHC2w4wmp+ZjXjjd1IgOO/HVHcKyv1EF
   7+x4FmikRzi3wzSKEkpISV7TICXFVIITTn1FKUWXCVrAs1buiEPLCjCTz
   CSTzNjAcYy8uHih4HrFps++dPyNwaRwMHz5Zv7Xlt3qoD4lgkxWnedG+g
   ndMuTcRYz0vDdxPNZf+yXzqsg7muieGY88Nl9PmcoCUEpd8ND1rpZsmhy
   TYAjIxAsiv+LTPtjzxD4+9LOxAE2j2ZWWru7ljJcC1FD8o0Z1XndypTbI
   bXUY1KUQKnzYjnrbysSVr9s8KqgIslc3oYfB0wiP3ZKBVoO58eR85z/lQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="15180351"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="15180351"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="943556073"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="943556073"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Dec 2023 22:31:44 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g10-0006Jz-1G;
	Sun, 03 Dec 2023 06:31:42 +0000
Date: Sun, 3 Dec 2023 14:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>
Subject: drivers/mtd/mtdpart.c:768:26: warning: '%s' directive argument is
 null
Message-ID: <202312022333.adC50Ho6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michal,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 8e2c992b59fcb5e56e3667f5c30c7d26fbbf14a2 mtd: mtdpart: add debug prints to partition parser.
date:   8 years ago
config: x86_64-randconfig-x001-20230722 (https://download.01.org/0day-ci/archive/20231202/202312022333.adC50Ho6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312022333.adC50Ho6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312022333.adC50Ho6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/module.h:17,
                    from drivers/mtd/mtdpart.c:24:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:496:44: warning: pointer targets in passing argument 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     496 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:428:57: note: expected 'const char *' but argument is of type 'const unsigned char *'
     428 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   In file included from include/linux/kernel.h:13,
                    from include/linux/list.h:8,
                    from include/linux/module.h:9:
   drivers/mtd/mtdpart.c: In function 'parse_mtd_partitions':
>> drivers/mtd/mtdpart.c:768:26: warning: '%s' directive argument is null [-Wformat-overflow=]
     768 |                 pr_debug("%s: got parser %s\n", master->name,
         |                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:236:21: note: in definition of macro 'pr_fmt'
     236 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/printk.h:283:9: note: in expansion of macro 'dynamic_pr_debug'
     283 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:768:17: note: in expansion of macro 'pr_debug'
     768 |                 pr_debug("%s: got parser %s\n", master->name,
         |                 ^~~~~~~~
   drivers/mtd/mtdpart.c:768:42: note: format string is defined here
     768 |                 pr_debug("%s: got parser %s\n", master->name,
         |                                          ^~


vim +768 drivers/mtd/mtdpart.c

   732	
   733	/**
   734	 * parse_mtd_partitions - parse MTD partitions
   735	 * @master: the master partition (describes whole MTD device)
   736	 * @types: names of partition parsers to try or %NULL
   737	 * @pparts: array of partitions found is returned here
   738	 * @data: MTD partition parser-specific data
   739	 *
   740	 * This function tries to find partition on MTD device @master. It uses MTD
   741	 * partition parsers, specified in @types. However, if @types is %NULL, then
   742	 * the default list of parsers is used. The default list contains only the
   743	 * "cmdlinepart" and "ofpart" parsers ATM.
   744	 * Note: If there are more then one parser in @types, the kernel only takes the
   745	 * partitions parsed out by the first parser.
   746	 *
   747	 * This function may return:
   748	 * o a negative error code in case of failure
   749	 * o zero if no partitions were found
   750	 * o a positive number of found partitions, in which case on exit @pparts will
   751	 *   point to an array containing this number of &struct mtd_info objects.
   752	 */
   753	int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
   754				 struct mtd_partition **pparts,
   755				 struct mtd_part_parser_data *data)
   756	{
   757		struct mtd_part_parser *parser;
   758		int ret = 0;
   759	
   760		if (!types)
   761			types = default_mtd_part_types;
   762	
   763		for ( ; ret <= 0 && *types; types++) {
   764			pr_debug("%s: parsing partitions %s\n", master->name, *types);
   765			parser = get_partition_parser(*types);
   766			if (!parser && !request_module("%s", *types))
   767				parser = get_partition_parser(*types);
 > 768			pr_debug("%s: got parser %s\n", master->name,
   769				 parser ? parser->name : NULL);
   770			if (!parser)
   771				continue;
   772			ret = (*parser->parse_fn)(master, pparts, data);
   773			pr_debug("%s: parser %s: %i\n",
   774				 master->name, parser->name, ret);
   775			put_partition_parser(parser);
   776			if (ret > 0) {
   777				printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
   778				       ret, parser->name, master->name);
   779				break;
   780			}
   781		}
   782		return ret;
   783	}
   784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
