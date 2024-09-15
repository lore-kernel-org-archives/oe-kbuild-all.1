Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2417579
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726389461; cv=none; b=KxREzlAV1mScB4m3mGtn3OxKXBM21eNxggCpED5BYjrYeDXY+TwGqrVcUFEyv3OhuSrrKUNRTFKok2wY1cV4b1BT+7Edt+xgx2LeYqOD+AqNmQJ7OjRyFjgY+AkEqRjaIZu5lf9RfyJURmoDPXpihNcsQeL9LPNClub82iGtWOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726389461; c=relaxed/simple;
	bh=6Oawpy2fczpeePtCsoRgKEmEffy6rNGR50OT8hjV/GI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQSygL1SAQDbzQ5N4+xihUU925kbOJEmFRnFGsPYqcI7iZP18+W5Mp4SpFnUfu7CC+KHh2BR3wkcGZy8O3RpDH6gRMOztCrBMvwAH1dYqXSVpe2NSx07/8dICGjRM1OPdACYV2xQ19emnjt1gUH22pPflO3HdZtBrbyik5CS7tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MS+LVrT9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MS+LVrT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726389460; x=1757925460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Oawpy2fczpeePtCsoRgKEmEffy6rNGR50OT8hjV/GI=;
  b=MS+LVrT98DXsS26ob/ktc0aaGlLwbT/tARm+sX0aN5gnMI87VllUZcRP
   nTtIcw5GRJBG5F1LBfBQe3L5fId9FpqPhPa9IuD70Qyx1aBDY7moZgKQg
   o2sCP5Rc9gT5eSEu9HoSfVhDLLk/BtkBjzbVrioreaQUvxafg8xQet3OR
   3fAQoBb6DfyQs24WMqfXvt16z0mkBRq8lq+GVa7eGbyuCpZZFxEn+4bSm
   d+V3rB8J09xcl/BcSxKOnEOyeamFBZT5APLeA+Hnzk4BkTy9e1gVbbV6p
   MXYw6D32GfSaNrfTvYvixj6Q+tp+QjOznqUfu4blgHLO9rY+9cE+VxK6x
   A==;
X-CSE-ConnectionGUID: z0mmWb1JSSKAPpQ9YmC2ug==
X-CSE-MsgGUID: VLZo2n6jTj2ejapvlX2i3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="47757484"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="47757484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 01:37:39 -0700
X-CSE-ConnectionGUID: MGCB8jAORTm1dglgWjKs7Q==
X-CSE-MsgGUID: WAp3pDnnSyu0c3xGAMBeOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="69348280"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Sep 2024 01:37:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spklC-0008X0-2s;
	Sun, 15 Sep 2024 08:37:34 +0000
Date: Sun, 15 Sep 2024 16:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-9j 59/59] lib/dynamic_debug.c:1319:18: warning: unused
 variable 'iter'
Message-ID: <202409151621.GOHgi6dN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-9j
head:   d5336141631c126044ea06e556eb1e4401e4ece1
commit: d5336141631c126044ea06e556eb1e4401e4ece1 [59/59] dyndbg: drop premature optimization
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240915/202409151621.GOHgi6dN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151621.GOHgi6dN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151621.GOHgi6dN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/dynamic_debug.c:1319:18: warning: unused variable 'iter' [-Wunused-variable]
    1319 |         struct _ddebug *iter;
         |                         ^~~~
>> lib/dynamic_debug.c:1320:6: warning: unused variable 'i' [-Wunused-variable]
    1320 |         int i;
         |             ^
   2 warnings generated.


vim +/iter +1319 lib/dynamic_debug.c

c45f67ace832e4 Jim Cromie       2022-09-04  1311  
e9d376f0fa66bd Jason Baron      2009-02-05  1312  /*
e9d376f0fa66bd Jason Baron      2009-02-05  1313   * Allocate a new ddebug_table for the given module
e9d376f0fa66bd Jason Baron      2009-02-05  1314   * and add it to the global list.
e9d376f0fa66bd Jason Baron      2009-02-05  1315   */
7deabd67498869 Jason Baron      2023-03-03  1316  static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
e9d376f0fa66bd Jason Baron      2009-02-05  1317  {
e9d376f0fa66bd Jason Baron      2009-02-05  1318  	struct ddebug_table *dt;
3a4204ad8f36a4 Jim Cromie       2022-12-21 @1319  	struct _ddebug *iter;
d5336141631c12 Jim Cromie       2024-09-14 @1320  	int i;
e9d376f0fa66bd Jason Baron      2009-02-05  1321  
ae8ff4887c56f4 Jim Cromie       2023-09-18  1322  	if (!di->num_descs)
b7b4eebdba7b6a Jim Cromie       2022-09-04  1323  		return 0;
ae8ff4887c56f4 Jim Cromie       2023-09-18  1324  
ae8ff4887c56f4 Jim Cromie       2023-09-18  1325  	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
b7b4eebdba7b6a Jim Cromie       2022-09-04  1326  
e9d376f0fa66bd Jason Baron      2009-02-05  1327  	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
513770f54edba8 Rasmus Villemoes 2019-03-07  1328  	if (dt == NULL) {
b7b4eebdba7b6a Jim Cromie       2022-09-04  1329  		pr_err("error adding module: %s\n", modname);
e9d376f0fa66bd Jason Baron      2009-02-05  1330  		return -ENOMEM;
513770f54edba8 Rasmus Villemoes 2019-03-07  1331  	}
cdf6d00696865a Rasmus Villemoes 2019-03-07  1332  	/*
cdf6d00696865a Rasmus Villemoes 2019-03-07  1333  	 * For built-in modules, name lives in .rodata and is
cdf6d00696865a Rasmus Villemoes 2019-03-07  1334  	 * immortal. For loaded modules, name points at the name[]
cdf6d00696865a Rasmus Villemoes 2019-03-07  1335  	 * member of struct module, which lives at least as long as
cdf6d00696865a Rasmus Villemoes 2019-03-07  1336  	 * this struct ddebug_table.
cdf6d00696865a Rasmus Villemoes 2019-03-07  1337  	 */
b7b4eebdba7b6a Jim Cromie       2022-09-04  1338  	dt->mod_name = modname;
b7b4eebdba7b6a Jim Cromie       2022-09-04  1339  	dt->ddebugs = di->descs;
b7b4eebdba7b6a Jim Cromie       2022-09-04  1340  	dt->num_ddebugs = di->num_descs;
b7b4eebdba7b6a Jim Cromie       2022-09-04  1341  
b7b4eebdba7b6a Jim Cromie       2022-09-04  1342  	INIT_LIST_HEAD(&dt->link);
c45f67ace832e4 Jim Cromie       2022-09-04  1343  
d5336141631c12 Jim Cromie       2024-09-14  1344  	if (di->num_classes)
600df7bfcf675c Jim Cromie       2022-11-01  1345  		ddebug_attach_module_classes(dt, di);
e9d376f0fa66bd Jason Baron      2009-02-05  1346  
e9d376f0fa66bd Jason Baron      2009-02-05  1347  	mutex_lock(&ddebug_lock);
2ad556f700430f Jim Cromie       2022-09-04  1348  	list_add_tail(&dt->link, &ddebug_tables);
e9d376f0fa66bd Jason Baron      2009-02-05  1349  	mutex_unlock(&ddebug_lock);
e9d376f0fa66bd Jason Baron      2009-02-05  1350  
d5336141631c12 Jim Cromie       2024-09-14  1351  	if (di->num_class_users)
3a4204ad8f36a4 Jim Cromie       2022-12-21  1352  		ddebug_attach_user_module_classes(dt, di);
3a4204ad8f36a4 Jim Cromie       2022-12-21  1353  
b7b4eebdba7b6a Jim Cromie       2022-09-04  1354  	vpr_info("%3u debug prints in module %s\n", di->num_descs, modname);
e9d376f0fa66bd Jason Baron      2009-02-05  1355  	return 0;
e9d376f0fa66bd Jason Baron      2009-02-05  1356  }
e9d376f0fa66bd Jason Baron      2009-02-05  1357  

:::::: The code at line 1319 was first introduced by commit
:::::: 3a4204ad8f36a45223905152b8bc92bf5e3ee5ce dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
