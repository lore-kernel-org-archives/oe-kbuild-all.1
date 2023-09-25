Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602421A266
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 14:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695652397; x=1727188397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mjP1DbQz0axezxZa/xHHk8kX3Dh0vfL76H+Vqp3lIPU=;
  b=NTDl6N3kIg37DiGdTX87oYxrdK81A3LaipcA6qdGsJrnklouOxpMDm1B
   eyJQcj1xaLZp2f38B47UaAlvYF8pCQGVmR7mkVfEpDOkvA1wzaru7LC3v
   aJGop5FZAPUc6oIHXK3/4aUpTgAei8jovOzkFTc4vap9DlY+czNfDzfxt
   jFz9eQG24pQ+xiqIiWlCSht5zM4agy7grY84lpktmUc/ExX8akkld8j/c
   yS6gjJzlXmbEyOUIZtTSZPTJYOUeC1ti2EdLAdeTkaRFgXHsgwur9mKmu
   Gbi07YsoF43Q6THsPjKRDm+5SVdt67p6aAeZpmnxGoCO/uwyy6NySydFk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380137271"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="380137271"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 07:33:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725004753"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="725004753"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 25 Sep 2023 07:33:15 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkme8-0001az-29;
	Mon, 25 Sep 2023 14:33:12 +0000
Date: Mon, 25 Sep 2023 22:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-1b 30/30] lib/dynamic_debug.c:235:22: error: 'const
 struct _ddebug' has no member named 'site'
Message-ID: <202309252253.8UL12vPJ-lkp@intel.com>
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
config: x86_64-randconfig-071-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252253.8UL12vPJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252253.8UL12vPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252253.8UL12vPJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'desc_function':
>> lib/dynamic_debug.c:235:22: error: 'const struct _ddebug' has no member named 'site'
     235 |         if (ret != dp->site->function)
         |                      ^~
   In file included from include/linux/kernel.h:30,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c:237:50: error: 'const struct _ddebug' has no member named 'site'
     237 |                        (unsigned long)dp, ret, dp->site->function);
         |                                                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/dynamic_debug.c:236:17: note: in expansion of macro 'pr_err'
     236 |                 pr_err("mt-load func %lx got %s want %s\n",
         |                 ^~~~~~
   lib/dynamic_debug.c: In function 'desc_filename':
   lib/dynamic_debug.c:248:22: error: 'const struct _ddebug' has no member named 'site'
     248 |         if (ret != dp->site->filename)
         |                      ^~
   lib/dynamic_debug.c:250:50: error: 'const struct _ddebug' has no member named 'site'
     250 |                        (unsigned long)dp, ret, dp->site->filename);
         |                                                  ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/dynamic_debug.c:249:17: note: in expansion of macro 'pr_err'
     249 |                 pr_err("mt-load file %lx got %s want %s\n",
         |                 ^~~~~~
   lib/dynamic_debug.c: In function 'desc_modname':
   lib/dynamic_debug.c:261:22: error: 'const struct _ddebug' has no member named 'site'
     261 |         if (ret != dp->site->modname)
         |                      ^~
   lib/dynamic_debug.c:263:57: error: 'const struct _ddebug' has no member named 'site'
     263 |                        (unsigned long)dp, (char*)ret, dp->site->modname);
         |                                                         ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:498:9: note: in expansion of macro 'printk'
     498 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   lib/dynamic_debug.c:262:17: note: in expansion of macro 'pr_err'
     262 |                 pr_err("mt-load mod %lx got %s want %s\n",
         |                 ^~~~~~
   lib/dynamic_debug.c:265:18: error: 'const struct _ddebug' has no member named 'site'
     265 |         return dp->site->modname;
         |                  ^~
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:1398:6: warning: no previous prototype for 'dd_store_range' [-Wmissing-prototypes]
    1398 | void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         |      ^~~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'intervalize_descs':
>> lib/dynamic_debug.c:1461:26: error: assignment to 'struct _ddebug_site *' from incompatible pointer type 'struct _ddebug_site **' [-Werror=incompatible-pointer-types]
    1461 |         for (i = 0, site = &di->sites; i < di->num_sites; i++, site++) {
         |                          ^
>> lib/dynamic_debug.c:1463:43: error: 'cur' undeclared (first use in this function)
    1463 |                 if (!strcmp(site_function(cur), site_function(funcp)))
         |                                           ^~~
   lib/dynamic_debug.c:1448:34: note: in definition of macro 'site_function'
    1448 | #define site_function(site)     (site)->function
         |                                  ^~~~
   lib/dynamic_debug.c:1463:43: note: each undeclared identifier is reported only once for each function it appears in
    1463 |                 if (!strcmp(site_function(cur), site_function(funcp)))
         |                                           ^~~
   lib/dynamic_debug.c:1448:34: note: in definition of macro 'site_function'
    1448 | #define site_function(site)     (site)->function
         |                                  ^~~~
>> lib/dynamic_debug.c:1465:43: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1465 |                 dd_store_range(di->funcs, funcp, cur, "func", site_function(funcp));
         |                                           ^~~~~
         |                                           |
         |                                           struct _ddebug_site *
   lib/dynamic_debug.c:1398:60: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    1398 | void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         |                                            ~~~~~~~~~~~~~~~~^~~~~
   lib/dynamic_debug.c:1470:43: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1470 |                 dd_store_range(di->files, filep, cur, "file", site_filename(filep));
         |                                           ^~~~~
         |                                           |
         |                                           struct _ddebug_site *
   lib/dynamic_debug.c:1398:60: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    1398 | void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         |                                            ~~~~~~~~~~~~~~~~^~~~~
   lib/dynamic_debug.c:1475:42: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1475 |                 dd_store_range(di->mods, modp, cur, "mod", site_modname(modp));
         |                                          ^~~~
         |                                          |
         |                                          struct _ddebug_site *
   lib/dynamic_debug.c:1398:60: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    1398 | void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         |                                            ~~~~~~~~~~~~~~~~^~~~~
   lib/dynamic_debug.c:1478:35: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1478 |         dd_store_range(di->funcs, funcp, cur, "func:", site_function(funcp));
         |                                   ^~~~~
         |                                   |
         |                                   struct _ddebug_site *
   lib/dynamic_debug.c:1398:60: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    1398 | void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         |                                            ~~~~~~~~~~~~~~~~^~~~~
   lib/dynamic_debug.c:1479:35: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1479 |         dd_store_range(di->files, filep, cur, "file:", site_filename(filep));
         |                                   ^~~~~
         |                                   |
         |                                   struct _ddebug_site *
   lib/dynamic_debug.c:1398:60: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    1398 | void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         |                                            ~~~~~~~~~~~~~~~~^~~~~
   lib/dynamic_debug.c:1480:34: error: passing argument 2 of 'dd_store_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1480 |         dd_store_range(di->mods, modp, cur, "mod:", site_modname(modp));
         |                                  ^~~~
         |                                  |
         |                                  struct _ddebug_site *
   lib/dynamic_debug.c:1398:60: note: expected 'struct _ddebug *' but argument is of type 'struct _ddebug_site *'
    1398 | void dd_store_range(struct maple_tree *mt, struct _ddebug *start, struct _ddebug *next,
         |                                            ~~~~~~~~~~~~~~~~^~~~~
   lib/dynamic_debug.c: In function 'desc_modname':
   lib/dynamic_debug.c:266:1: error: control reaches end of non-void function [-Werror=return-type]
     266 | }
         | ^
   cc1: some warnings being treated as errors


vim +235 lib/dynamic_debug.c

a4a2a427413e35 Jim Cromie 2022-09-04  224  
f2c0aec3b8224e Jim Cromie 2023-09-11  225  /*
f2c0aec3b8224e Jim Cromie 2023-09-11  226   * tmp accessors, they cheat and seek a match in builtins.  Obviously
f2c0aec3b8224e Jim Cromie 2023-09-11  227   * this wont work for loaded modules, but doesnt work at all yet.
f2c0aec3b8224e Jim Cromie 2023-09-11  228   */
f2c0aec3b8224e Jim Cromie 2023-09-11  229  static const char * desc_function(struct _ddebug const *dp)
f2c0aec3b8224e Jim Cromie 2023-09-11  230  {
f2c0aec3b8224e Jim Cromie 2023-09-11  231  	struct maple_tree *mt = ddi_builtin.funcs;
f2c0aec3b8224e Jim Cromie 2023-09-11  232  
f2c0aec3b8224e Jim Cromie 2023-09-11  233  	char *ret = mtree_load(mt, (unsigned long)dp);
f2c0aec3b8224e Jim Cromie 2023-09-11  234  
f2c0aec3b8224e Jim Cromie 2023-09-11 @235          if (ret != dp->site->function)
f2c0aec3b8224e Jim Cromie 2023-09-11  236  		pr_err("mt-load func %lx got %s want %s\n",
f2c0aec3b8224e Jim Cromie 2023-09-11  237  		       (unsigned long)dp, ret, dp->site->function);
f2c0aec3b8224e Jim Cromie 2023-09-11  238  
f2c0aec3b8224e Jim Cromie 2023-09-11  239  	return ret;
f2c0aec3b8224e Jim Cromie 2023-09-11  240  }
f2c0aec3b8224e Jim Cromie 2023-09-11  241  

:::::: The code at line 235 was first introduced by commit
:::::: f2c0aec3b8224e17c87daa700978054ddb17ba7c dyndbg: save _ddebug_site mod,file,func fields into 3 maple-trees

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
