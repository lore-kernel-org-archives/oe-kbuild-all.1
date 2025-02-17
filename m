Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F117B425
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777943; cv=none; b=PSnz2bxOjiedjouSA4LPYtA7WJ23hQxI3DkI39A/tTTiqJ42PxpVthJwy74P/9rgEnVpRzBFoDTQ7Wl7P9hb7q6+KrytWIDSxPRU0g2F3rx4cXgogW/hhn89c669G4s9vQaiF8V8pludUVnV6sDWZIX8mRNFOgkjuLk9Kn9c6rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777943; c=relaxed/simple;
	bh=m0yyAVeSvd9falaHI5aU19Rk/rIWP2nyTNvttExz46A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROcenAYIHytW0I4gUhGuiT8KxxJSQCfheyG45F+n8cSM/HI6Vedg6OsOMVv8p+5coCyNzfRub3Iyg6JzCl4AP1Kd/caLxKoDRn/jpAPxj/0R9d4rwKjKqTO6JhhjrurYa08Takd44UfyDpJmNk6xHpwWhODRkufVFaygDlePh98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyVMDZfg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyVMDZfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739777941; x=1771313941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0yyAVeSvd9falaHI5aU19Rk/rIWP2nyTNvttExz46A=;
  b=NyVMDZfgJDNGcWTNw92+qOP9Jzh4960FIF8Nto335J7qI3yXRj5JFAye
   XfeeYs5nSWRCbmOi2gHd0o9IOd79KBy8pmLsYqujFoXdWjV8VhbjHrWIH
   39WnQp4sk+ZJPugGxNu1OZFbUR2LUarauGqUzPh3XDkHaQU8+SNIm79N8
   cBG4NXxt72yhQ3IH14VYLwhztDZUM+lSuy5jZHJD1ZczXtDfrFjTiNDgz
   uVV0PJKrAa75pHWkhRY2AKTKTiYFw7OJ2S85j4RPE1DdFOSgHlJuYWzV6
   A8R5BfWSVqrBIbkkgzmxJoBLXx457ksJ9F+W2IuMSCBfg19/CYXSoMhtb
   w==;
X-CSE-ConnectionGUID: Se5B02xES+Sr/3CFanoa9Q==
X-CSE-MsgGUID: Tok3HFzrSoy3FN/pmSo1Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51876730"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51876730"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 23:39:00 -0800
X-CSE-ConnectionGUID: RPdbTx/8RiSKWm5trPO8sA==
X-CSE-MsgGUID: 9D/8LqqeRUW7tCBVZi4UBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113907525"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2025 23:38:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjviS-001Ckd-2G;
	Mon, 17 Feb 2025 07:38:56 +0000
Date: Mon, 17 Feb 2025 15:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1424/1424] mm/memory_hotplug.c:926:23:
 warning: unused variable 'start_pfn'
Message-ID: <202502171533.xL4t91Bt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bd6fde5ff5b73d04068bdad2dc7730479d4df355
commit: 2f5f99f3efc5d34c37f9918c50808a4cfe36c211 [1424/1424] mm: handle uninitialized numa nodes gracefully
config: x86_64-buildonly-randconfig-004-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171533.xL4t91Bt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171533.xL4t91Bt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171533.xL4t91Bt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory_hotplug.c: In function '__remove_section':
   mm/memory_hotplug.c:481:23: warning: variable 'start_pfn' set but not used [-Wunused-but-set-variable]
     481 |         unsigned long start_pfn;
         |                       ^~~~~~~~~
   mm/memory_hotplug.c: In function 'hotadd_init_pgdat':
>> mm/memory_hotplug.c:926:23: warning: unused variable 'start_pfn' [-Wunused-variable]
     926 |         unsigned long start_pfn = PFN_DOWN(start);
         |                       ^~~~~~~~~
   mm/memory_hotplug.c: At top level:
>> mm/memory_hotplug.c:971:13: warning: 'rollback_node_hotadd' defined but not used [-Wunused-function]
     971 | static void rollback_node_hotadd(int nid)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/migrate.h:6,
                    from mm/memory_hotplug.c:27:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~


vim +/start_pfn +926 mm/memory_hotplug.c

0bd85420087389 Tang Chen         2014-11-13  921  
e13193319d3a55 Hidetoshi Seto    2009-11-17  922  /* we are OK calling __meminit stuff here - we have CONFIG_MEMORY_HOTPLUG */
2f5f99f3efc5d3 Michal Hocko      2023-11-08  923  static pg_data_t __ref *hotadd_init_pgdat(int nid, u64 start)
9af3c2dea3a3ae Yasunori Goto     2006-06-27  924  {
9af3c2dea3a3ae Yasunori Goto     2006-06-27  925  	struct pglist_data *pgdat;
c8e861a531b019 Fabian Frederick  2014-06-04 @926  	unsigned long start_pfn = PFN_DOWN(start);
9af3c2dea3a3ae Yasunori Goto     2006-06-27  927  
a1e565aa3cfc7c Tang Chen         2013-02-22  928  	pgdat = NODE_DATA(nid);
9af3c2dea3a3ae Yasunori Goto     2006-06-27  929  
2f5f99f3efc5d3 Michal Hocko      2023-11-08  930  	/*
2f5f99f3efc5d3 Michal Hocko      2023-11-08  931  	 * NODE_DATA is preallocated (free_area_init) but its internal
2f5f99f3efc5d3 Michal Hocko      2023-11-08  932  	 * state is not allocated completely. Add missing pieces.
2f5f99f3efc5d3 Michal Hocko      2023-11-08  933  	 * Completely offline nodes stay around and they just need
2f5f99f3efc5d3 Michal Hocko      2023-11-08  934  	 * reintialization.
2f5f99f3efc5d3 Michal Hocko      2023-11-08  935  	 */
2f5f99f3efc5d3 Michal Hocko      2023-11-08  936  	if (pgdat->per_cpu_nodestats == &boot_nodestats) {
b0dc3a342af36f Gu Zheng          2015-03-25  937  	} else {
e716f2eb24defb Mel Gorman        2017-05-03  938  		/*
e716f2eb24defb Mel Gorman        2017-05-03  939  		 * Reset the nr_zones, order and classzone_idx before reuse.
e716f2eb24defb Mel Gorman        2017-05-03  940  		 * Note that kswapd will init kswapd_classzone_idx properly
e716f2eb24defb Mel Gorman        2017-05-03  941  		 * when it starts in the near future.
e716f2eb24defb Mel Gorman        2017-05-03  942  		 */
b0dc3a342af36f Gu Zheng          2015-03-25  943  		pgdat->nr_zones = 0;
38087d9b036098 Mel Gorman        2016-07-28  944  		pgdat->kswapd_order = 0;
38087d9b036098 Mel Gorman        2016-07-28  945  		pgdat->kswapd_classzone_idx = 0;
a1e565aa3cfc7c Tang Chen         2013-02-22  946  	}
9af3c2dea3a3ae Yasunori Goto     2006-06-27  947  
2f5f99f3efc5d3 Michal Hocko      2023-11-08  948  	pgdat->node_start_pfn = 0;
03e85f9d5f1f8c Oscar Salvador    2018-08-21  949  
9af3c2dea3a3ae Yasunori Goto     2006-06-27  950  	/* init node's zones as empty zones, we don't have any present pages.*/
03e85f9d5f1f8c Oscar Salvador    2018-08-21  951  	free_area_init_core_hotplug(nid);
5830169f47269f Reza Arbab        2016-08-11  952  	pgdat->per_cpu_nodestats = alloc_percpu(struct per_cpu_nodestat);
9af3c2dea3a3ae Yasunori Goto     2006-06-27  953  
959ecc48fc7506 KAMEZAWA Hiroyuki 2011-06-15  954  	/*
959ecc48fc7506 KAMEZAWA Hiroyuki 2011-06-15  955  	 * The node we allocated has no zone fallback lists. For avoiding
959ecc48fc7506 KAMEZAWA Hiroyuki 2011-06-15  956  	 * to access not-initialized zonelist, build here.
959ecc48fc7506 KAMEZAWA Hiroyuki 2011-06-15  957  	 */
72675e131eb418 Michal Hocko      2017-09-06  958  	build_all_zonelists(pgdat);
959ecc48fc7506 KAMEZAWA Hiroyuki 2011-06-15  959  
0bd85420087389 Tang Chen         2014-11-13  960  	/*
0bd85420087389 Tang Chen         2014-11-13  961  	 * When memory is hot-added, all the memory is in offline state. So
0bd85420087389 Tang Chen         2014-11-13  962  	 * clear all zones' present_pages because they will be updated in
0bd85420087389 Tang Chen         2014-11-13  963  	 * online_pages() and offline_pages().
0bd85420087389 Tang Chen         2014-11-13  964  	 */
03e85f9d5f1f8c Oscar Salvador    2018-08-21  965  	reset_node_managed_pages(pgdat);
0bd85420087389 Tang Chen         2014-11-13  966  	reset_node_present_pages(pgdat);
0bd85420087389 Tang Chen         2014-11-13  967  
9af3c2dea3a3ae Yasunori Goto     2006-06-27  968  	return pgdat;
9af3c2dea3a3ae Yasunori Goto     2006-06-27  969  }
9af3c2dea3a3ae Yasunori Goto     2006-06-27  970  
b9ff036082cd17 Oscar Salvador    2018-08-17 @971  static void rollback_node_hotadd(int nid)
9af3c2dea3a3ae Yasunori Goto     2006-06-27  972  {
b9ff036082cd17 Oscar Salvador    2018-08-17  973  	pg_data_t *pgdat = NODE_DATA(nid);
b9ff036082cd17 Oscar Salvador    2018-08-17  974  
9af3c2dea3a3ae Yasunori Goto     2006-06-27  975  	arch_refresh_nodedata(nid, NULL);
5830169f47269f Reza Arbab        2016-08-11  976  	free_percpu(pgdat->per_cpu_nodestats);
9af3c2dea3a3ae Yasunori Goto     2006-06-27  977  	arch_free_nodedata(pgdat);
9af3c2dea3a3ae Yasunori Goto     2006-06-27  978  	return;
9af3c2dea3a3ae Yasunori Goto     2006-06-27  979  }
9af3c2dea3a3ae Yasunori Goto     2006-06-27  980  

:::::: The code at line 926 was first introduced by commit
:::::: c8e861a531b0199dc6ef9e402e29c474dfa507ce mm/memory_hotplug.c: use PFN_DOWN()

:::::: TO: Fabian Frederick <fabf@skynet.be>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
