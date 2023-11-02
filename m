Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2027E208BA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 17:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSB8wckY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698947745; x=1730483745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zAA9Olh7OtU2bCicPvHVAC8b7yV7oAASBKfwh2jWEWc=;
  b=QSB8wckYm5TY/0u10tu+47Ro0dJoILQewX/tKkn7jlSRIOdGFB7kqKGL
   aLpbyWtz/BorbuduX8elM67dsWGfadXnq/FRSB09CFjZc9rjvpTcYAMXg
   O4CtKzfZU0RN0Fcv+RTtj0R3WKRonEmgw/VddUaXMmu45pLj8duGbu5xm
   rTghoPDj5V+qhS4csvg4R/J7Ji+1ak4363YQzq03rUhCx4Gl7czZXTUZr
   MV3i4graaQN5EGtJlRmsETuoTze18GnU6pO4/h3bzqH3+Rp0AMftZ/cKw
   ca3pBpPTkAIO5g6nUBOwJgh7C/+yQ58u/+t1a5vPf+h5fBwlFAV1R/H65
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="368122891"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="368122891"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 10:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="796328269"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="796328269"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Nov 2023 10:55:20 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qybuY-0001jo-0q;
	Thu, 02 Nov 2023 17:55:18 +0000
Date: Fri, 3 Nov 2023 01:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3c 30/36] lib/dynamic_debug.c:1417:13: warning:
 'ddebug_clear_range' defined but not used
Message-ID: <202311030123.CFZKWyCn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-3c
head:   c1dcab1aabdf354c05dd26f99a68177f8f0a9566
commit: 1278e29a472200e1d86307677e44b95eab641804 [30/36] dyndbg: ddebug_clear_range - prune module's site info on rmmod
config: arm-randconfig-003-20231101 (https://download.01.org/0day-ci/archive/20231103/202311030123.CFZKWyCn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030123.CFZKWyCn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030123.CFZKWyCn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1417:13: warning: 'ddebug_clear_range' defined but not used [-Wunused-function]
    1417 | static void ddebug_clear_range(const struct _ddebug *start)
         |             ^~~~~~~~~~~~~~~~~~


vim +/ddebug_clear_range +1417 lib/dynamic_debug.c

  1416	
> 1417	static void ddebug_clear_range(const struct _ddebug *start)
  1418	{
  1419		void *ret;
  1420		MA_STATE(mod_mas, &mt_mods, (long unsigned)start, ULONG_MAX);
  1421		MA_STATE(file_mas, &mt_files, (long unsigned)start, ULONG_MAX);
  1422		MA_STATE(func_mas, &mt_funcs, (long unsigned)start, ULONG_MAX);
  1423	
  1424		v2pr_info("clearing %px\n", start);
  1425	
  1426		mas_walk(&mod_mas);
  1427		v2pr_info("walked mods: i:%lx l:%lx ct:%ld\n", mod_mas.index, mod_mas.last,
  1428			  (mod_mas.last - mod_mas.index) >> 3);
  1429		ret = mas_erase(&mod_mas);
  1430		v2pr_info("mods:  %px %s\n", ret, (char*)ret);
  1431	
  1432		file_mas.last = mod_mas.last;
  1433		mas_walk(&file_mas);
  1434		v2pr_info("walked files: i:%lx l:%lx ct:%ld\n", file_mas.index, file_mas.last,
  1435			  (file_mas.last - file_mas.index) >> 3);
  1436		ret = mas_erase(&file_mas);
  1437		v2pr_info("files:  %px %s\n", ret, (char*)ret);
  1438	
  1439		func_mas.last = mod_mas.last;
  1440		mas_walk(&func_mas);
  1441		v2pr_info("walked funcs: i:%lx l:%lx ct:%ld\n", func_mas.index, func_mas.last,
  1442			  (func_mas.last - func_mas.index) >> 3);
  1443		ret = mas_erase(&func_mas);
  1444		v2pr_info("funcs:  %px %s\n", ret, (char*)ret);
  1445	}
  1446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
