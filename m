Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B828E20299B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767475496; cv=none; b=Dj9uNkNzS/ou9WSyV44JeUl74SzhGxG8pvizQCmWeC9xzrmDeq6hZUdVkEM6CJAJc3ImahYab+/JxDrogZJLqUn2CXtv/ljLf9lSoc3XLAuPNwE/UfsUKNqt2ktx3jrd+Vsc5QBJJJAg1gmv2P2aOgyq5yIcrujVWf/XpiMUo7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767475496; c=relaxed/simple;
	bh=UHbhhz1BiXuE58bVjU/T0dV+mKLIhSsuMg5VJKjGyvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aJFdbtemTevq922ChM5Fj2FdysPEdUvEokm9v8p00ULD9SjFe/sJgBq2uGxQmm9BeB2LB2kfhHE1O1ttMjat/H+G2mjoNpV5jEyYQ2oiYGIaxKC8AvkIyTTJcOvaBP2Z1fOXcX4u7OTOZE4Ee1l+rh+yU8Mo0g4L/mywCbxGCXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNoM6o9E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNoM6o9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767475495; x=1799011495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHbhhz1BiXuE58bVjU/T0dV+mKLIhSsuMg5VJKjGyvY=;
  b=LNoM6o9EskohnXvJ8qJ3sCRTilDd7oAFgqs1IiXTtuaq9SzmPfDOt0jr
   t4BnsgHmuYZWtePzR5RhmHo8aONvlhyiLJcJ49R+XP6Wm4I6X7vNcrHiA
   lkaOqUMhl1DgmeOR0oYqz1t4LZkZc9YE/DI6dAeed0pTO6Y9d55jv5gxo
   0s1S/FzTzvzkKZJCCU7GbvvMr+hVH09/3wvJPYg1tgViKgQFFewLPbnC6
   yd707KB99eDNyaQV8SF5p3Cz9lKa1v6r9CkMLjsAn8It0EGbH6+slHNYG
   6Rni4gbL7RnzSLFvHa+KemAD14/7q8WzzhlpjhMMcZDbP1VTA6Fkh7fyF
   Q==;
X-CSE-ConnectionGUID: 3mKo+1FrR7+y4uN3NTVvQw==
X-CSE-MsgGUID: YzWoU+QHRz2VtrySrs36fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80353121"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="80353121"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 13:24:54 -0800
X-CSE-ConnectionGUID: k8a5wuDGTiOptkMlPRew5w==
X-CSE-MsgGUID: UsJc7sKlRtC7sAExruImGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="201816416"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jan 2026 13:24:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc97C-000000000FR-1Sln;
	Sat, 03 Jan 2026 21:24:50 +0000
Date: Sun, 04 Jan 2026 05:24:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-maple-2 41/43] lib/dynamic_debug.c:1707:36:
 error: 'i' undeclared
Message-ID: <202601040519.988o2LrT-lkp@intel.com>
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
config: s390-randconfig-002-20260104 (https://download.01.org/0day-ci/archive/20260104/202601040519.988o2LrT-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601040519.988o2LrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601040519.988o2LrT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_change':
   lib/dynamic_debug.c:381:1: error: version control conflict marker in file
     381 | <<<<<<< HEAD
         | ^~~~~~~
   lib/dynamic_debug.c:383:1: error: version control conflict marker in file
     383 | =======
         | ^~~~~~~
   lib/dynamic_debug.c:386:27: error: 'dt_from_mt' undeclared (first use in this function)
     386 |                 if (dt != dt_from_mt) {
         |                           ^~~~~~~~~~
   lib/dynamic_debug.c:386:27: note: each undeclared identifier is reported only once for each function it appears in
   lib/dynamic_debug.c:390:1: error: version control conflict marker in file
     390 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         | ^~~~~~~
   lib/dynamic_debug.c:390:9: error: invalid suffix "b8a76a259" on floating constant
     390 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         |         ^~~~~~~~~~~~
   lib/dynamic_debug.c:399:25: error: 'mods_map' undeclared (first use in this function)
     399 |                         mods_map = ddebug_find_valid_class(di, query->class_string,
         |                         ^~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_add_module':
   lib/dynamic_debug.c:1612:1: error: version control conflict marker in file
    1612 | <<<<<<< HEAD
         | ^~~~~~~
   lib/dynamic_debug.c:1616:13: error: 'rc' undeclared (first use in this function); did you mean 'rq'?
    1616 |         if (rc)
         |             ^~
         |             rq
   lib/dynamic_debug.c:1620:1: error: version control conflict marker in file
    1620 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         | ^~~~~~~
   lib/dynamic_debug.c:1620:9: error: invalid suffix "b8a76a259" on floating constant
    1620 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         |         ^~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_remove_module':
   lib/dynamic_debug.c:1702:1: error: version control conflict marker in file
    1702 | <<<<<<< HEAD
         | ^~~~~~~
>> lib/dynamic_debug.c:1707:36: error: 'i' undeclared (first use in this function)
    1707 |                         for_subvec(i, dp, &dt->info, descs)
         |                                    ^
   lib/dynamic_debug.c:163:56: note: in definition of macro '__ASSERT_IS_LVALUE'
     163 | #define __ASSERT_IS_LVALUE(x) ((void)sizeof((void)0, &(x)))
         |                                                        ^
   lib/dynamic_debug.c:1707:25: note: in expansion of macro 'for_subvec'
    1707 |                         for_subvec(i, dp, &dt->info, descs)
         |                         ^~~~~~~~~~
>> lib/dynamic_debug.c:172:22: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     172 |         for ((_i) = 0, (_sp) = (_box)->_vec.start;      \
         |                      ^
   lib/dynamic_debug.c:1707:25: note: in expansion of macro 'for_subvec'
    1707 |                         for_subvec(i, dp, &dt->info, descs)
         |                         ^~~~~~~~~~
   lib/dynamic_debug.c:174:20: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     174 |              (_i)++, (_sp)++)           /* { block } */
         |                    ^
   lib/dynamic_debug.c:1707:25: note: in expansion of macro 'for_subvec'
    1707 |                         for_subvec(i, dp, &dt->info, descs)
         |                         ^~~~~~~~~~
   lib/dynamic_debug.c:1712:1: error: version control conflict marker in file
    1712 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         | ^~~~~~~
   lib/dynamic_debug.c:1712:9: error: invalid suffix "b8a76a259" on floating constant
    1712 | >>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
         |         ^~~~~~~~~~~~
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:99:13: warning: 'ddebug_drop_cached_prefix' used but never defined
      99 | static void ddebug_drop_cached_prefix(struct _ddebug *dp);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:12,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from lib/dynamic_debug.c:17:
   lib/dynamic_debug.c:98:21: warning: 'pr_prefixes' defined but not used [-Wunused-variable]
      98 | static DEFINE_MTREE(pr_prefixes);
         |                     ^~~~~~~~~~~
   include/linux/maple_tree.h:269:27: note: in definition of macro 'DEFINE_MTREE'
     269 |         struct maple_tree name = MTREE_INIT(name, 0)
         |                           ^~~~


vim +/i +1707 lib/dynamic_debug.c

  1685	
  1686	/*
  1687	 * Called in response to a module being unloaded.  Removes
  1688	 * any ddebug_table's which point at the module.
  1689	 */
  1690	static int ddebug_remove_module(const char *mod_name)
  1691	{
  1692		struct ddebug_table *dt, *nextdt;
  1693		int ret = -ENOENT;
  1694	
  1695		mutex_lock(&ddebug_lock);
  1696		list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
  1697			/*
  1698			 * NB: with multiple "main" builtins, strcmp would be
  1699			 * incorrect.  Linker gives us this one.
  1700			 */
  1701			if (dt->info.mod_name == mod_name) {
  1702	<<<<<<< HEAD
  1703	=======
  1704				int i;
  1705				struct _ddebug *dp;
  1706	
> 1707				for_subvec(i, dp, &dt->info, descs)
  1708					ddebug_drop_cached_prefix(dp);
  1709	
  1710				ddebug_clear_range(dt->info.descs.start, dt->info.descs.len);
  1711				mtree_erase(&ddx_modinfo_map, (unsigned long)&dt->info.mod_name);
  1712	>>>>>>> 2e4b8a76a259 (dyndbg: rename maple trees and refine logging)
  1713				ddebug_table_free(dt);
  1714				ret = 0;
  1715				break;
  1716			}
  1717		}
  1718		mutex_unlock(&ddebug_lock);
  1719		if (!ret)
  1720			v2pr_info("removed module \"%s\"\n", mod_name);
  1721		return ret;
  1722	}
  1723	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
