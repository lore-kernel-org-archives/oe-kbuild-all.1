Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7042192F2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767473636; cv=none; b=KP9PdNSowIhAETT5uthtrXuT+EDfP+lbi2YMCp16ZQnTrdsJeL5Q3OQ2T0g/z7pSxegz6dMohnATe7pY1RCHA3RZFgGrIO9Bf91nztC00hbsTjG3CcfEADJDDcTatqmmHsIkVroFWESAzU2Vr4nEvh1L/Q+eHTJ193cb3Si2KY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767473636; c=relaxed/simple;
	bh=PaR7NA+IkQbiI6fUfbU+IOV8wxRxgv+HMlbsHyNmL60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MmwJAxBk/nzTKtoqVSnC3VFAHrjuyo1ArLCJjMge8FqilZGqSx4fcoVTrNNPpoUn4NjZ8/OSpcOB1K+xZrrOzNiwkg1DWItpTSVm9limtwKt+gnpSABK4tBanU6QBh573HnKSgWjlFT9+JHJcLLlOAe9UGl9wWnu2q1XZ1hMf1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnB3+tH2; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnB3+tH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767473635; x=1799009635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PaR7NA+IkQbiI6fUfbU+IOV8wxRxgv+HMlbsHyNmL60=;
  b=XnB3+tH2oQF4UKNaUgIoC8CRCaszwQliPFVJRPcV1Axs3CHDjw4JTgBg
   XrRsW4R2s8Ij2jr4GB14D+G44Kr1hU/7Yk598/2YAe0R2T3I+KgkfKgDR
   gfGtvhuegJOIP6Dtb34cFYv/7OdbI/bVhz3LDZJswFzGaPN5fQAK0dr3F
   egQ74/KKFoJWDP4sW5OUFyWm3qatq/I+/huQIySLz0DNu7fUWFLa5tYwR
   X0KfDPk7aHzeN2g7s5wyo+GTQ75/dbTX3qVsOV0SIbSdt/AkYlWbb9q1g
   CGFj2pJxpQkRwkNqtSXToGLJ1HUII0XRWLBxuJ1mlH5bJKcG/5A0l84+P
   g==;
X-CSE-ConnectionGUID: WVZdQB0pRh+yH98py3kI7g==
X-CSE-MsgGUID: fxM5qi9vROiHuoZUd5HiUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="56468763"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="56468763"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 12:53:54 -0800
X-CSE-ConnectionGUID: EkGRguwlRg6OfyNqbcOt3w==
X-CSE-MsgGUID: gG/WtOVKRY6xvSv+rFuZoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="207096626"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Jan 2026 12:53:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc8dB-000000000F7-4BD8;
	Sat, 03 Jan 2026 20:53:49 +0000
Date: Sun, 04 Jan 2026 04:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-maple-2 36/43] lib/dynamic_debug.c:1537:12:
 warning: 'ddebug_remove_module' declared 'static' but never defined
Message-ID: <202601040453.m0Uviy0r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-shrink-maple-2
head:   549b560de653db8ff24a3813ab2e985a355c9d18
commit: 9f7d8c255378bc6a576b9288004736604c3617fb [36/43] dyndbg: ddebug_clear_range - prune module's site info on rmmod
config: nios2-randconfig-001-20260104 (https://download.01.org/0day-ci/archive/20260104/202601040453.m0Uviy0r-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040453.m0Uviy0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040453.m0Uviy0r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1537:12: warning: 'ddebug_remove_module' declared 'static' but never defined [-Wunused-function]
    1537 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~


vim +1537 lib/dynamic_debug.c

615c294910e634 Jim Cromie       2023-09-11  1536  
615c294910e634 Jim Cromie       2023-09-11 @1537  static int ddebug_remove_module(const char *mod_name);
e9d376f0fa66bd Jason Baron      2009-02-05  1538  /*
e9d376f0fa66bd Jason Baron      2009-02-05  1539   * Allocate a new ddebug_table for the given module
e9d376f0fa66bd Jason Baron      2009-02-05  1540   * and add it to the global list.
e9d376f0fa66bd Jason Baron      2009-02-05  1541   */
7fbbb5768b2e11 Jim Cromie       2025-11-18  1542  static int ddebug_add_module(struct _ddebug_info *di)
e9d376f0fa66bd Jason Baron      2009-02-05  1543  {
e9d376f0fa66bd Jason Baron      2009-02-05  1544  	struct ddebug_table *dt;
1e80d1e7216425 Jim Cromie       2025-11-18  1545  	struct _ddebug_class_map *cm;
f6f7160ad809a7 Jim Cromie       2025-11-18  1546  	struct _ddebug_class_user *cli;
86372543818d5a Jim Cromie       2025-11-18  1547  	u64 reserved_ids = 0;
1e80d1e7216425 Jim Cromie       2025-11-18  1548  	int i;
e9d376f0fa66bd Jason Baron      2009-02-05  1549  
72d7e8ea974a09 Jim Cromie       2025-11-18  1550  	if (!di->descs.len)
b7b4eebdba7b6a Jim Cromie       2022-09-04  1551  		return 0;
8a0003353f88e0 Jim Cromie       2025-11-18  1552  
7fbbb5768b2e11 Jim Cromie       2025-11-18  1553  	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
b7b4eebdba7b6a Jim Cromie       2022-09-04  1554  
e9d376f0fa66bd Jason Baron      2009-02-05  1555  	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
513770f54edba8 Rasmus Villemoes 2019-03-07  1556  	if (dt == NULL) {
7fbbb5768b2e11 Jim Cromie       2025-11-18  1557  		pr_err("error adding module: %s\n", di->mod_name);
e9d376f0fa66bd Jason Baron      2009-02-05  1558  		return -ENOMEM;
513770f54edba8 Rasmus Villemoes 2019-03-07  1559  	}
f6f7160ad809a7 Jim Cromie       2025-11-18  1560  	INIT_LIST_HEAD(&dt->link);
cdf6d00696865a Rasmus Villemoes 2019-03-07  1561  	/*
f6f7160ad809a7 Jim Cromie       2025-11-18  1562  	 * For built-in modules, di-> referents live in .*data and are
f6f7160ad809a7 Jim Cromie       2025-11-18  1563  	 * immortal. For loaded modules, di points at the dyndbg_info
f6f7160ad809a7 Jim Cromie       2025-11-18  1564  	 * member of its struct module, which lives at least as
f6f7160ad809a7 Jim Cromie       2025-11-18  1565  	 * long as this struct ddebug_table.
cdf6d00696865a Rasmus Villemoes 2019-03-07  1566  	 */
72d7e8ea974a09 Jim Cromie       2025-11-18  1567  	dt->info = *di;
9f7d8c255378bc Jim Cromie       2023-10-01  1568  	ddebug_condense_sites(&dt->info);
f6f7160ad809a7 Jim Cromie       2025-11-18  1569  	dd_mark_vector_subrange(i, cm, &dt->info, maps, dt);
f6f7160ad809a7 Jim Cromie       2025-11-18  1570  	dd_mark_vector_subrange(i, cli, &dt->info, users, dt);
f6f7160ad809a7 Jim Cromie       2025-11-18  1571  	/* now di is stale */
e9d376f0fa66bd Jason Baron      2009-02-05  1572  
86372543818d5a Jim Cromie       2025-11-18  1573  	/* insure 2+ classmaps share the per-module 0..62 class_id space */
86372543818d5a Jim Cromie       2025-11-18  1574  	for_subvec(i, cm, &dt->info, maps)
86372543818d5a Jim Cromie       2025-11-18  1575  		if (ddebug_class_range_overlap(cm, &reserved_ids))
86372543818d5a Jim Cromie       2025-11-18  1576  			goto cleanup;
86372543818d5a Jim Cromie       2025-11-18  1577  
e9d376f0fa66bd Jason Baron      2009-02-05  1578  	mutex_lock(&ddebug_lock);
2ad556f700430f Jim Cromie       2022-09-04  1579  	list_add_tail(&dt->link, &ddebug_tables);
e9d376f0fa66bd Jason Baron      2009-02-05  1580  	mutex_unlock(&ddebug_lock);
e9d376f0fa66bd Jason Baron      2009-02-05  1581  
f6f7160ad809a7 Jim Cromie       2025-11-18  1582  	if (dt->info.maps.len)
f6f7160ad809a7 Jim Cromie       2025-11-18  1583  		ddebug_apply_class_maps(&dt->info);
f6f7160ad809a7 Jim Cromie       2025-11-18  1584  	if (dt->info.users.len)
f6f7160ad809a7 Jim Cromie       2025-11-18  1585  		ddebug_apply_class_users(&dt->info);
f6f7160ad809a7 Jim Cromie       2025-11-18  1586  
f6f7160ad809a7 Jim Cromie       2025-11-18  1587  	vpr_info("%3u debug prints in module %s\n",
f6f7160ad809a7 Jim Cromie       2025-11-18  1588  		 dt->info.descs.len, dt->info.mod_name);
e9d376f0fa66bd Jason Baron      2009-02-05  1589  	return 0;
86372543818d5a Jim Cromie       2025-11-18  1590  cleanup:
86372543818d5a Jim Cromie       2025-11-18  1591  	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
86372543818d5a Jim Cromie       2025-11-18  1592  	kfree(dt);
86372543818d5a Jim Cromie       2025-11-18  1593  	return -EINVAL;
e9d376f0fa66bd Jason Baron      2009-02-05  1594  }
e9d376f0fa66bd Jason Baron      2009-02-05  1595  

:::::: The code at line 1537 was first introduced by commit
:::::: 615c294910e6348c051a89bbc23f806dc5196c6e dyndbg: save _ddebug_site mod,file,func fields into maple-trees

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
