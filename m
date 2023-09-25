Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAAC1B281
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695644876; x=1727180876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSuwtBjtvDFUlF3fObX7GcYCdcLwEZvYk7g3c9iTdWY=;
  b=Pt4Be+vCoQlWjVYksaUc8dXqz/oYA/d7enDwmEOyDtF+0vBgKQ8R79K/
   DD1OJ5LHDbdkHP+MIL1QEkmp36aFuDM5d8B/QGisgidkVOeenarUN7vRY
   5gksAt2LGwBlcQxVF4xHN96w3XTMNOrXYGA8jO41SD09TfcS1ku7MuzrR
   jOc+lGuDUvCr6ZUvAU0/caLm8/UtgOpB7z2AAYKBLvRayU7DcpW24oIws
   kFgxdY/gmks3ZgBNwFli9TUAtFfMIODwP5bPaGbEe3jltUYDbBYHq3ngz
   dZo15tUmEg38ka1CFab4ojI1AAXpqY6PCN+Z5eaLv425CrlY7Kt5rTlee
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378506764"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="378506764"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 05:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872038972"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="872038972"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Sep 2023 05:27:53 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkkgp-0001V1-0c;
	Mon, 25 Sep 2023 12:27:51 +0000
Date: Mon, 25 Sep 2023 20:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-1b 30/30] lib/dynamic_debug.c:1461:19: error:
 assignment from incompatible pointer type
Message-ID: <202309252026.hbS6NGbf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-1b
head:   c4d0397c80ded0aa76c2d2a9ea8241e6c496205a
commit: c4d0397c80ded0aa76c2d2a9ea8241e6c496205a [30/30] dyndbg: wip - drop site ptr between pairs
config: i386-randconfig-002-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252026.hbS6NGbf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252026.hbS6NGbf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252026.hbS6NGbf-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'desc_function':
   lib/dynamic_debug.c:235:22: error: 'const struct _ddebug' has no member named 'site'
            if (ret != dp->site->function)
                         ^~
   In file included from include/linux/kernel.h:30:0,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c:237:36: error: 'const struct _ddebug' has no member named 'site'
             (unsigned long)dp, ret, dp->site->function);
                                       ^
   include/linux/printk.h:427:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:498:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   lib/dynamic_debug.c:236:3: note: in expansion of macro 'pr_err'
      pr_err("mt-load func %lx got %s want %s\n",
      ^~~~~~
   lib/dynamic_debug.c: In function 'desc_filename':
   lib/dynamic_debug.c:248:15: error: 'const struct _ddebug' has no member named 'site'
     if (ret != dp->site->filename)
                  ^~
   In file included from include/linux/kernel.h:30:0,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c:250:36: error: 'const struct _ddebug' has no member named 'site'
             (unsigned long)dp, ret, dp->site->filename);
                                       ^
   include/linux/printk.h:427:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:498:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   lib/dynamic_debug.c:249:3: note: in expansion of macro 'pr_err'
      pr_err("mt-load file %lx got %s want %s\n",
      ^~~~~~
   lib/dynamic_debug.c: In function 'desc_modname':
   lib/dynamic_debug.c:261:15: error: 'const struct _ddebug' has no member named 'site'
     if (ret != dp->site->modname)
                  ^~
   In file included from include/linux/kernel.h:30:0,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c:263:43: error: 'const struct _ddebug' has no member named 'site'
             (unsigned long)dp, (char*)ret, dp->site->modname);
                                              ^
   include/linux/printk.h:427:19: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:498:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   lib/dynamic_debug.c:262:3: note: in expansion of macro 'pr_err'
      pr_err("mt-load mod %lx got %s want %s\n",
      ^~~~~~
   lib/dynamic_debug.c:265:11: error: 'const struct _ddebug' has no member named 'site'
     return dp->site->modname;
              ^~
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:1398:6: warning: no previous declaration for 'dd_store_range' [-Wmissing-declarations]
    void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'intervalize_descs':
>> lib/dynamic_debug.c:1461:19: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     for (i = 0, site = &di->sites; i < di->num_sites; i++, site++) {
                      ^
   lib/dynamic_debug.c:1463:29: error: 'cur' undeclared (first use in this function)
      if (!strcmp(site_function(cur), site_function(funcp)))
                                ^
   lib/dynamic_debug.c:1448:30: note: in definition of macro 'site_function'
    #define site_function(site) (site)->function
                                 ^~~~
   lib/dynamic_debug.c:1463:29: note: each undeclared identifier is reported only once for each function it appears in
      if (!strcmp(site_function(cur), site_function(funcp)))
                                ^
   lib/dynamic_debug.c:1448:30: note: in definition of macro 'site_function'
    #define site_function(site) (site)->function
                                 ^~~~
   lib/dynamic_debug.c:1465:29: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
      dd_store_range(di->funcs, funcp, cur, "func", site_function(funcp));
                                ^~~~~
   lib/dynamic_debug.c:1398:6: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1470:29: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
      dd_store_range(di->files, filep, cur, "file", site_filename(filep));
                                ^~~~~
   lib/dynamic_debug.c:1398:6: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1475:28: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
      dd_store_range(di->mods, modp, cur, "mod", site_modname(modp));
                               ^~~~
   lib/dynamic_debug.c:1398:6: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1478:28: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
     dd_store_range(di->funcs, funcp, cur, "func:", site_function(funcp));
                               ^~~~~
   lib/dynamic_debug.c:1398:6: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1479:28: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
     dd_store_range(di->files, filep, cur, "file:", site_filename(filep));
                               ^~~~~
   lib/dynamic_debug.c:1398:6: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c:1480:27: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
     dd_store_range(di->mods, modp, cur, "mod:", site_modname(modp));
                              ^~~~
   lib/dynamic_debug.c:1398:6: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         ^~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'desc_modname':
   lib/dynamic_debug.c:266:1: error: control reaches end of non-void function [-Werror=return-type]
    }
    ^
   cc1: some warnings being treated as errors


vim +1461 lib/dynamic_debug.c

  1451	
  1452	static void intervalize_descs(struct _ddebug_info *di)
  1453	{
  1454		struct _ddebug_site *site, *funcp, *filep, *modp;
  1455		int i;
  1456	
  1457		plant_trees(di);
  1458	
  1459		funcp = filep = modp = di->sites;
  1460		//for_each_boxed_vector(di, descs, num_descs, i, cur) {
> 1461		for (i = 0, site = &di->sites; i < di->num_sites; i++, site++) {	
  1462	
  1463			if (!strcmp(site_function(cur), site_function(funcp)))
  1464				continue;
  1465			dd_store_range(di->funcs, funcp, cur, "func", site_function(funcp));
  1466			funcp = cur;
  1467	
  1468			if (!strcmp(site_filename(cur), site_filename(filep)))
  1469				continue;
  1470			dd_store_range(di->files, filep, cur, "file", site_filename(filep));
  1471			filep = cur;
  1472	
  1473			if (!strcmp(site_modname(cur), site_modname(modp)))
  1474				continue;
  1475			dd_store_range(di->mods, modp, cur, "mod", site_modname(modp));
  1476			modp = cur;
  1477		}
  1478		dd_store_range(di->funcs, funcp, cur, "func:", site_function(funcp));
  1479		dd_store_range(di->files, filep, cur, "file:", site_filename(filep));
  1480		dd_store_range(di->mods, modp, cur, "mod:", site_modname(modp));
  1481	}
  1482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
