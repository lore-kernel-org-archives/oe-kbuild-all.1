Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1DE41686B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870472; cv=none; b=ir7exPQg4q2lYfXNDx6FTlJwUNPU5/EGuFXQbEtO4ibcW9q4eydT32EV8KGsHCtGwOSf0VT0ByWkmnsMvyJDbku57etUGkX8p7BgUgD3JGGJjSzX6ynqmk2RnAeQZTcyT/weaDGGQE8jMPZkOoS9soxQAkfioYQMF16cVBE7T4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870472; c=relaxed/simple;
	bh=VJ3Z+FualZF4CUiff67c2iSzunQ9QwAE+SDhc08Bzkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dIrweNSoF1fK/Bwwi3RJnWqf1QbsudLNwufog9khgZpy0DtawflzfliawWttLJ6UTG/4+iL2av9k1EU9PgKolDMbQziOCgxsZ3aCR0Y+4/p02mx9U9zKNJt3G3JH5M+95lwRnLrt7cZ3tJdD+mdu8sqXmxG2xzN5iBbxdVQnAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIHw/y45; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIHw/y45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785870470; x=1817406470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VJ3Z+FualZF4CUiff67c2iSzunQ9QwAE+SDhc08Bzkk=;
  b=SIHw/y45JAwlTpC6EGsDm45brAWgAeHeFOdLRnuFB5OTN77oZnCZXW4A
   LmQpxgr9nSHin3xcv4xchvX0AcG5M56i/wAOzC8vwnXOXjQSav5BXz/Qv
   UM5NDlqN0/nfnMsA2kGJ3ABX8/PGKfKNkrKaV0fapPhnW4obeM+lzh5Qx
   pGRb68FRvaemcXdCcDCWPADTC9IdWu96aaaz6LPTiQqpLZZTV5oiYMHG6
   k/TDExEKTGULTiu4sC+sCI+0UZBmeg61nyFaVLvVt02AGy7frkG7ROneg
   0y2GZO4dVs4+T+gGhPf6r7MxjwIVdeT/JYFky1GU41GicLzVJsxKt5eOx
   Q==;
X-CSE-ConnectionGUID: awLx08oIQ2m2iX3xDX4zdw==
X-CSE-MsgGUID: jTipmGR1Qs2y4tJAkf2QKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97937839"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="97937839"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 12:07:49 -0700
X-CSE-ConnectionGUID: FGb7aA+vRwye7A9tZ3gg8w==
X-CSE-MsgGUID: KWluxCPDSMODz2yroJSoMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="258924412"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Aug 2026 12:07:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrKUL-00000000AVN-1BvL;
	Tue, 04 Aug 2026 19:07:45 +0000
Date: Wed, 05 Aug 2026 03:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-cmap-part2 38/45] lib/dynamic_debug.c:1203:13:
 error: redefinition of 'ddebug_class_map_in_range'
Message-ID: <202608050308.STPwUvAc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-cmap-part2
head:   13f3629b4d5ed9590e6f743c5514ea6d1436f964
commit: 3cc274637983ec79de1f76a40296ad6e55e2c388 [38/45] dyndbg: resolve "protection" of class'd pr_debug
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050308.STPwUvAc-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050308.STPwUvAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050308.STPwUvAc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/dynamic_debug.c:1203:13: error: redefinition of 'ddebug_class_map_in_range'
    1203 | static bool ddebug_class_map_in_range(const int class_id, const struct ddebug_class_map *map)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:203:13: note: previous definition of 'ddebug_class_map_in_range' with type 'bool(const int,  const struct ddebug_class_map *)' {aka '_Bool(const int,  const struct ddebug_class_map *)'}
     203 | static bool ddebug_class_map_in_range(const int class_id, const struct ddebug_class_map *map)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:1211:13: error: redefinition of 'ddebug_class_user_in_range'
    1211 | static bool ddebug_class_user_in_range(const int class_id, const struct ddebug_class_user *user)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:209:13: note: previous definition of 'ddebug_class_user_in_range' with type 'bool(const int,  const struct ddebug_class_user *)' {aka '_Bool(const int,  const struct ddebug_class_user *)'}
     209 | static bool ddebug_class_user_in_range(const int class_id, const struct ddebug_class_user *user)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ddebug_class_map_in_range +1203 lib/dynamic_debug.c

e9d376f0fa66bd Jason Baron 2009-02-05  1202  
d3973339379cee Jim Cromie  2025-11-18 @1203  static bool ddebug_class_map_in_range(const int class_id, const struct ddebug_class_map *map)
19ec642fbe3ebc Jim Cromie  2025-11-18  1204  {
d3973339379cee Jim Cromie  2025-11-18  1205  	if (!map)
d3973339379cee Jim Cromie  2025-11-18  1206  		return false;
19ec642fbe3ebc Jim Cromie  2025-11-18  1207  	return (class_id >= map->base &&
19ec642fbe3ebc Jim Cromie  2025-11-18  1208  		class_id < map->base + map->length);
19ec642fbe3ebc Jim Cromie  2025-11-18  1209  }
a4a2a427413e35 Jim Cromie  2022-09-04  1210  
d3973339379cee Jim Cromie  2025-11-18 @1211  static bool ddebug_class_user_in_range(const int class_id, const struct ddebug_class_user *user)
ad2bd5efcfaac4 Jim Cromie  2026-05-21  1212  {
d3973339379cee Jim Cromie  2025-11-18  1213  	if (!user)
1806908541ca6a Jim Cromie  2026-07-12  1214  		return false;
d3973339379cee Jim Cromie  2025-11-18  1215  	return ddebug_class_map_in_range(class_id - user->offset, user->map);
ad2bd5efcfaac4 Jim Cromie  2026-05-21  1216  }
b7b476699de86d Jim Cromie  2025-11-18  1217  static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
a4a2a427413e35 Jim Cromie  2022-09-04  1218  {
19ec642fbe3ebc Jim Cromie  2025-11-18  1219  	struct ddebug_class_map *map;
ad2bd5efcfaac4 Jim Cromie  2026-05-21  1220  	struct ddebug_class_user *cli;
19ec642fbe3ebc Jim Cromie  2025-11-18  1221  	int i;
a4a2a427413e35 Jim Cromie  2022-09-04  1222  
b7b476699de86d Jim Cromie  2025-11-18  1223  	for_subvec(i, map, di, maps)
d3973339379cee Jim Cromie  2025-11-18  1224  		if (ddebug_class_map_in_range(dp->class_id, map))
a4a2a427413e35 Jim Cromie  2022-09-04  1225  			return map->class_names[dp->class_id - map->base];
a4a2a427413e35 Jim Cromie  2022-09-04  1226  
ad2bd5efcfaac4 Jim Cromie  2026-05-21  1227  	for_subvec(i, cli, di, users)
d3973339379cee Jim Cromie  2025-11-18  1228  		if (ddebug_class_user_in_range(dp->class_id, cli))
ad2bd5efcfaac4 Jim Cromie  2026-05-21  1229  			return cli->map->class_names[dp->class_id - cli->map->base - cli->offset];
ad2bd5efcfaac4 Jim Cromie  2026-05-21  1230  
a4a2a427413e35 Jim Cromie  2022-09-04  1231  	return NULL;
a4a2a427413e35 Jim Cromie  2022-09-04  1232  }
a4a2a427413e35 Jim Cromie  2022-09-04  1233  

:::::: The code at line 1203 was first introduced by commit
:::::: d3973339379ceed1baf9dc63089791ac48f11c65 dyndbg: detect class_id reservation conflicts

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
