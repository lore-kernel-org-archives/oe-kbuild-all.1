Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD754208994
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767476097; cv=none; b=KFiYXx6zMpzFPwBCgqig/hNSezlSp/KP7io1xz4PaGvn9nQ8MLjexBhCV37TUSN2cnsyLm3A27eHjD095uYReem/vH5Ce2PfYL9IZDqsh0fnoP3BrZxWtHL0+Se4DkgMl0msxFKNV6jOkDti+HwosmK9jOtX58gcFm5vSSks90I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767476097; c=relaxed/simple;
	bh=Ofw7B9in40z7r6MIWS/LrxLcAOZaoV6aO+F8REoqabc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wkb88Iqg9X6qvS6G6aUUkyKgohm5HasJjPHkmwx9kvhl72ExYEFE9ytbom4PK4e5hUhe09qW8Xbre2ms6ujEVjIwfUnGjmTs2ysWMzQVQNJuwG5h6UO1PWgUAUaHMkOiAOEb3sv+PzMpF+TJiYnRnWfV1Zmx9w9vH5Z26225U8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTSW4Nii; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTSW4Nii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767476094; x=1799012094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ofw7B9in40z7r6MIWS/LrxLcAOZaoV6aO+F8REoqabc=;
  b=WTSW4Nii5ygEgFfjmKQMoBaxbeQB8JKcRgwCdOwLMXR63drvwnx7J/F2
   TJXTS5W6BUX6wS344FTn12FmlfmYyW+GZqo9kF+JpaN3ikddiz5Dpv3Az
   Wh9keqMXnxljRB0cWZVmptAIqXpAPYBi4ACoUnX8nANkbpZUhxvc0N2Q2
   9ysieDfhKB6kQGJtm8uzAqWBTald0MFvVImxTDBLH0prWsqlVkowfShNG
   pDCmhtWZLTDNqS7E1ohHf1NL4Ft2jSkiX+lFLIkK6kY2HDvhkzgACPIuv
   75X+7BG/od5l3rZ/jRhS+64/6gPKRDZ2bwMZMbnQlKGTnIuPk6lAijBYk
   Q==;
X-CSE-ConnectionGUID: G+oxA8sJT/C5tP81wYR/sA==
X-CSE-MsgGUID: A1sNaS5SSjOKQTS1BiyHLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="69067182"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="69067182"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 13:34:53 -0800
X-CSE-ConnectionGUID: hRaSw+YgQWSGEMngZJ8OGw==
X-CSE-MsgGUID: kPbvVfisQBmlwaNwHPg6bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202526521"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jan 2026 13:34:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc9Gs-000000000Fh-2Xdi;
	Sat, 03 Jan 2026 21:34:50 +0000
Date: Sun, 04 Jan 2026 05:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-maple-2 41/43] lib/dynamic_debug.c:386:27:
 error: 'dt_from_mt' undeclared
Message-ID: <202601040550.PjV3HikW-lkp@intel.com>
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
commit: d1eba1abd0b73378f51f714e8f5b2b8541487dc7 [41/43] dyndbg: rename maple trees and refine logging
config: nios2-randconfig-001-20260104 (https://download.01.org/0day-ci/archive/20260104/202601040550.PjV3HikW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040550.PjV3HikW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040550.PjV3HikW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_change':
   lib/dynamic_debug.c:381:1: error: version control conflict marker in file
     381 | <<<<<<< HEAD
         | ^~~~~~~
   lib/dynamic_debug.c:383:1: error: version control conflict marker in file
     383 | =======
         | ^~~~~~~
>> lib/dynamic_debug.c:386:27: error: 'dt_from_mt' undeclared (first use in this function)
     386 |                 if (dt != dt_from_mt) {
         |                           ^~~~~~~~~~
   lib/dynamic_debug.c:386:27: note: each undeclared identifier is reported only once for each function it appears in
   lib/dynamic_debug.c:390:1: error: version control conflict marker in file
     390 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         | ^~~~~~~
>> lib/dynamic_debug.c:390:9: error: invalid suffix "b8a76a259" on floating constant
     390 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         |         ^~~~~~~~~~~~
>> lib/dynamic_debug.c:399:25: error: 'mods_map' undeclared (first use in this function)
     399 |                         mods_map = ddebug_find_valid_class(di, query->class_string,
         |                         ^~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_add_module':
   lib/dynamic_debug.c:1612:1: error: version control conflict marker in file
    1612 | <<<<<<< HEAD
         | ^~~~~~~
>> lib/dynamic_debug.c:1616:13: error: 'rc' undeclared (first use in this function); did you mean 'rq'?
    1616 |         if (rc)
         |             ^~
         |             rq
   lib/dynamic_debug.c:1620:1: error: version control conflict marker in file
    1620 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         | ^~~~~~~
   lib/dynamic_debug.c:1620:9: error: invalid suffix "b8a76a259" on floating constant
    1620 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         |         ^~~~~~~~~~~~
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:99:13: warning: 'ddebug_drop_cached_prefix' declared 'static' but never defined [-Wunused-function]
      99 | static void ddebug_drop_cached_prefix(struct _ddebug *dp);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1570:12: warning: 'ddebug_remove_module' declared 'static' but never defined [-Wunused-function]
    1570 | static int ddebug_remove_module(const char *mod_name);
         |            ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:12,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/dynamic_debug.c:17:
>> lib/dynamic_debug.c:98:21: warning: 'pr_prefixes' defined but not used [-Wunused-variable]
      98 | static DEFINE_MTREE(pr_prefixes);
         |                     ^~~~~~~~~~~
   include/linux/maple_tree.h:269:27: note: in definition of macro 'DEFINE_MTREE'
     269 |         struct maple_tree name = MTREE_INIT(name, 0)
         |                           ^~~~
>> lib/dynamic_debug.c:95:21: warning: 'ddx_modinfo_map' defined but not used [-Wunused-variable]
      95 | static DEFINE_MTREE(ddx_modinfo_map);
         |                     ^~~~~~~~~~~~~~~
   include/linux/maple_tree.h:269:27: note: in definition of macro 'DEFINE_MTREE'
     269 |         struct maple_tree name = MTREE_INIT(name, 0)
         |                           ^~~~


vim +/dt_from_mt +386 lib/dynamic_debug.c

   367	
   368	static int ddebug_change(const struct ddebug_query *query, struct flag_settings *modifiers)
   369	{
   370		int i;
   371		struct ddebug_table *dt;
   372		unsigned int newflags;
   373		unsigned int nfound = 0;
   374		struct flagsbuf fbuf, nbuf;
   375		int selected_class;
   376	
   377		/* search for matching ddebugs */
   378		mutex_lock(&ddebug_lock);
   379		list_for_each_entry(dt, &ddebug_tables, link) {
   380			struct _ddebug_info *di = &dt->info;
   381	<<<<<<< HEAD
   382			struct _ddebug_class_map *mods_map;
   383	=======
   384			struct ddebug_table *dt_from_mt = mtree_load(&ddx_modinfo_map, (unsigned long)&dt->info);
   385	
 > 386			if (dt != dt_from_mt) {
   387				pr_err("mt_mod_infos out of sync with ddebug_tables\n");
   388				continue;
   389			}
 > 390	>>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
   391	
   392			/* match against the module name */
   393			if (query->module &&
   394			    !match_wildcard(query->module, di->mod_name))
   395				continue;
   396	
   397			selected_class = _DPRINTK_CLASS_DFLT;
   398			if (query->class_string) {
 > 399				mods_map = ddebug_find_valid_class(di, query->class_string,
   400								   &selected_class);
   401				if (!mods_map)
   402					continue;
   403			}
   404	
   405			for (i = 0; i < di->descs.len; i++) {
   406				struct _ddebug *dp = &di->descs.start[i];
   407	
   408				if (!ddebug_match_desc(query, dp, di, selected_class))
   409					continue;
   410	
   411				nfound++;
   412	
   413				newflags = (dp->flags & modifiers->mask) | modifiers->flags;
   414				if (newflags == dp->flags)
   415					continue;
   416	#ifdef CONFIG_JUMP_LABEL
   417				if (dp->flags & _DPRINTK_FLAGS_PRINT) {
   418					if (!(newflags & _DPRINTK_FLAGS_PRINT))
   419						static_branch_disable(&dp->key.dd_key_true);
   420				} else if (newflags & _DPRINTK_FLAGS_PRINT) {
   421					static_branch_enable(&dp->key.dd_key_true);
   422				}
   423	#endif
   424				v4pr_info("changed %s:%d [%s]%s %s => %s\n",
   425					  trim_prefix(desc_filename(dp)), dp->lineno,
   426					  di->mod_name, desc_function(dp),
   427					  ddebug_describe_flags(dp->flags, &fbuf),
   428					  ddebug_describe_flags(newflags, &nbuf));
   429				dp->flags = newflags;
   430			}
   431		}
   432		mutex_unlock(&ddebug_lock);
   433	
   434		return nfound;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
