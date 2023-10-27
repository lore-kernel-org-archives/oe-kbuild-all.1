Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC038F61
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5L4NKU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698389954; x=1729925954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s8Buofxg49GDuF8JrPl+i9FwT/K0OjBD3uSMT08iVec=;
  b=H5L4NKU/sCTGNOMyfirpAWeQ+srBmTZ4p1l0Qs9ISV5PF/5oEVXcexZR
   NAdfQ+5lw5YNA6oWQkDheiFl3AiUhubgOaCaQ0FDk+ULxW2//+R55NEtP
   ggI/quZiv/i6goPD8PFnlWSMPzq+pcOBj0F8HpH0NX5BC3bhl7R9r2ZFl
   Zc1zLtSDO9ygoHdEoxul6x00Td3NaKoL10W+/M0KIOhvell77EGGwnngp
   BYFPp12fxrLMgku3a+pbhP05aQ1HlItcBGJKKSxYJzsE/SbqNkeEb6E8s
   HzhDfLycYLXiR4UzuCn3xLxQp3J6B/MUrUgNsDtRkujN0Ux6uDe9+VO8z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391597582"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="391597582"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 23:59:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="759520963"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="759520963"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Oct 2023 23:59:13 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwGoJ-000AZO-11;
	Fri, 27 Oct 2023 06:59:11 +0000
Date: Fri, 27 Oct 2023 14:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-3c 32/37] lib/dynamic_debug.c:1420:13: warning:
 'ddebug_clear_range' defined but not used
Message-ID: <202310271405.8xW7sQjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-3c
head:   ce3d95daece5907b225700c41fcf063936d9e9db
commit: 2bb7b21490ef651ad687341af1b030a0add68eb7 [32/37] dyndbg: ddebug_clear_range - prune module's site info on rmmod
config: nios2-randconfig-001-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271405.8xW7sQjf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271405.8xW7sQjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271405.8xW7sQjf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1420:13: warning: 'ddebug_clear_range' defined but not used [-Wunused-function]
    1420 | static void ddebug_clear_range(const struct _ddebug *start)
         |             ^~~~~~~~~~~~~~~~~~


vim +/ddebug_clear_range +1420 lib/dynamic_debug.c

  1419	
> 1420	static void ddebug_clear_range(const struct _ddebug *start)
  1421	{
  1422		void *ret;
  1423		MA_STATE(mod_mas, &mt_mods, (long unsigned)start, ULONG_MAX);
  1424		MA_STATE(file_mas, &mt_files, (long unsigned)start, ULONG_MAX);
  1425		MA_STATE(func_mas, &mt_funcs, (long unsigned)start, ULONG_MAX);
  1426	
  1427		v2pr_info("clearing %px\n", start);
  1428	
  1429		mas_walk(&mod_mas);
  1430		v2pr_info("walked mods: i:%lx l:%lx ct:%ld\n", mod_mas.index, mod_mas.last,
  1431			  (mod_mas.last - mod_mas.index) >> 3);
  1432		ret = mas_erase(&mod_mas);
  1433		v2pr_info("mods:  %px %s\n", ret, (char*)ret);
  1434	
  1435		file_mas.last = mod_mas.last;
  1436		mas_walk(&file_mas);
  1437		v2pr_info("walked files: i:%lx l:%lx ct:%ld\n", file_mas.index, file_mas.last,
  1438			  (file_mas.last - file_mas.index) >> 3);
  1439		ret = mas_erase(&file_mas);
  1440		v2pr_info("files:  %px %s\n", ret, (char*)ret);
  1441	
  1442		func_mas.last = mod_mas.last;
  1443		mas_walk(&func_mas);
  1444		v2pr_info("walked funcs: i:%lx l:%lx ct:%ld\n", func_mas.index, func_mas.last,
  1445			  (func_mas.last - func_mas.index) >> 3);
  1446		ret = mas_erase(&func_mas);
  1447		v2pr_info("funcs:  %px %s\n", ret, (char*)ret);
  1448	}
  1449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
