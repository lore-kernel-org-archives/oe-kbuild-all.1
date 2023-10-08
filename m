Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F2717D8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpCsRbyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696741608; x=1728277608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SmjnO7bdc/RZcwx89VhWc45Yy2vg17feFqgikPTDc2A=;
  b=cpCsRbypzhrNnEFlx+WjijLc7iDX0ZTLhOxE3lVxdrtYz5yZ4k9kZBWl
   ZHJhVMTKCchBCCmrHTwhnZXBrleOFvYRqfXCON6fHRNl5sPjVfbAKnWqA
   T0CivsoTdh3DeohKbL7E4GyivTN++PEzXbi6W4qSuACKXpUETYRuPIbzD
   jrDgG86WJTO0DElg/u+aE+abyIttz7CNyMH452EkBcRI4lMLcfB7eUeEv
   B3kIjxgMts0BBjh5c/MufmL63/NO60lptGQONm3zGVhdD7+Jo0Xa3GYiu
   guEo0xOc/Q5nf5wFZ56UMLKdN27Qe2Ol4LhgYlC5U/C8Q7IGwzSF1bK2Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="450478625"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="450478625"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2023 22:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="756348364"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="756348364"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2023 22:06:46 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpM03-00057t-2F;
	Sun, 08 Oct 2023 05:06:43 +0000
Date: Sun, 8 Oct 2023 13:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5i 13/25] lib/dynamic_debug.c:1307:61: error: expected
 ';' before 'if'
Message-ID: <202310081320.mPDlDQb0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5i
head:   0a69c097fec09676af8c1850c63b79c8eeacdaf0
commit: e7956a9618fd5be889e4e9529f2999bbe636b4f4 [13/25] dyndbg-API: fix CONFIG_DRM_USE_DYNAMIC_DEBUG regression
config: x86_64-randconfig-015-20231008 (https://download.01.org/0day-ci/archive/20231008/202310081320.mPDlDQb0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231008/202310081320.mPDlDQb0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310081320.mPDlDQb0-lkp@intel.com/

Note: the jimc/dd-fix-5i HEAD 0a69c097fec09676af8c1850c63b79c8eeacdaf0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_add_module':
   lib/dynamic_debug.c:1307:9: error: implicit declaration of function 'for_each_boxed_vector' [-Werror=implicit-function-declaration]
    1307 |         for_each_boxed_vector(di, descs, num_descs, i, iter)
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1307:35: error: 'descs' undeclared (first use in this function)
    1307 |         for_each_boxed_vector(di, descs, num_descs, i, iter)
         |                                   ^~~~~
   lib/dynamic_debug.c:1307:35: note: each undeclared identifier is reported only once for each function it appears in
   lib/dynamic_debug.c:1307:42: error: 'num_descs' undeclared (first use in this function)
    1307 |         for_each_boxed_vector(di, descs, num_descs, i, iter)
         |                                          ^~~~~~~~~
>> lib/dynamic_debug.c:1307:61: error: expected ';' before 'if'
    1307 |         for_each_boxed_vector(di, descs, num_descs, i, iter)
         |                                                             ^
         |                                                             ;
    1308 |                 if (iter->class_id != _DPRINTK_CLASS_DFLT)
         |                 ~~                                           
   cc1: some warnings being treated as errors


vim +1307 lib/dynamic_debug.c

  1273	
  1274	/*
  1275	 * Allocate a new ddebug_table for the given module
  1276	 * and add it to the global list.
  1277	 */
  1278	static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
  1279	{
  1280		struct ddebug_table *dt;
  1281		struct _ddebug *iter;
  1282		int i, mod_uses_classes = 0;
  1283	
  1284		if (!di->num_descs)
  1285			return 0;
  1286	
  1287		v3pr_info("add-module: %s %d sites %d.%d classes.refs\n",
  1288			  modname, di->num_descs, di->num_classes, di->num_class_users);
  1289	
  1290		dt = kzalloc(sizeof(*dt), GFP_KERNEL);
  1291		if (dt == NULL) {
  1292			pr_err("error adding module: %s\n", modname);
  1293			return -ENOMEM;
  1294		}
  1295		/*
  1296		 * For built-in modules, name lives in .rodata and is
  1297		 * immortal. For loaded modules, name points at the name[]
  1298		 * member of struct module, which lives at least as long as
  1299		 * this struct ddebug_table.
  1300		 */
  1301		dt->mod_name = modname;
  1302		dt->ddebugs = di->descs;
  1303		dt->num_ddebugs = di->num_descs;
  1304	
  1305		INIT_LIST_HEAD(&dt->link);
  1306	
> 1307		for_each_boxed_vector(di, descs, num_descs, i, iter)
  1308			if (iter->class_id != _DPRINTK_CLASS_DFLT)
  1309				mod_uses_classes++;
  1310	
  1311		mutex_lock(&ddebug_lock);
  1312		list_add_tail(&dt->link, &ddebug_tables);
  1313		mutex_unlock(&ddebug_lock);
  1314	
  1315		if (mod_uses_classes && di->num_classes)
  1316			ddebug_attach_module_classes(dt, di);
  1317	
  1318		if (mod_uses_classes && di->num_class_users)
  1319			ddebug_attach_user_module_classes(dt, di);
  1320	
  1321		vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
  1322		return 0;
  1323	}
  1324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
