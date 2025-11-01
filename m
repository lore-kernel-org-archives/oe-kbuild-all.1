Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B86917B418
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 15:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762012341; cv=none; b=WYRFETCEuj05yl1rCfFCzxBvrHwh3mUeCojT3u8n6VXIHEMcb2i1MdU3u1HkcfgUW3ciUiMa11QIECrcaLhPzaHFI4mY28LphOQFKVY8P8AqQ4jPWFRDP604dkYeN5Bii/kZZhOa81rgY/BsyV5fLC1Dmh0ivdNXMDKwK7HtPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762012341; c=relaxed/simple;
	bh=k+ieIUIHAFRiTKn8zEHSzWyDgKtriWyYn2n4IKQpSFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2IBV2nHmqIdB6VahngxiZgFsQCFgg1Pk7XDlq/v2qElqwbHV2b8Q+Hf7Dz8XarKl/WA0pAR809JaOuP8GPViSvTzt+zHf6bYXA0+++eddHTxX4hulRl7njPOmK9Ah3CPpHNyeyQ5nmX75ZtAivayuTyLSmYvkM0lY80nTySnDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=awYhf2Hv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awYhf2Hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762012340; x=1793548340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+ieIUIHAFRiTKn8zEHSzWyDgKtriWyYn2n4IKQpSFk=;
  b=awYhf2HvYj2ftxwzslPyaL+4126xXUfq5UmXT+KBpEg4nq4ei+vkMNEX
   K0ZtVtlt/q2yJQPHKBYFM4iSqiprVbtguH1RENnacSBsyQibKQSI4BcZ8
   Sda2keY/lD5N3Ew8JPSIA05Sy0jHQvPzDTyTlD8h2jQPiKgA9r4k3aD21
   qgw8yT/AT+UBd8ujAplA2gzwDkKicoMjw/0TVZQWR600hbZebOyXojIxv
   +MIIozz9t3lvd6UMGu3g6voPQMXS6V849iRF7kzl43Bnhi4+kSN3K3sHm
   kDivfplxfYYOz/0kaITo2P2UrCVZaMIpfTPSZd6zZo+n+c6aJ5lwXOshp
   w==;
X-CSE-ConnectionGUID: fnfuwXuqR2CR4ghboDcSrg==
X-CSE-MsgGUID: 7Urw55auRsar5smaNvl2fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="68013766"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="68013766"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 08:52:19 -0700
X-CSE-ConnectionGUID: 6E65GLq4SQ26FMkqVMekgw==
X-CSE-MsgGUID: Ap1krCpjQ4aQxhx+/nwQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="190828619"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2025 08:52:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFDtn-000OQF-1v;
	Sat, 01 Nov 2025 15:52:15 +0000
Date: Sat, 1 Nov 2025 23:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 49/83] lib/dynamic_debug.c:236:2: error: call to
 undeclared function '__chkp_no_side_effects'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202511012344.oRx9MjOk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   7c56937db9e56927f30d9fdecccb793062970841
commit: c9fd8802a13674b46ad8d574838fbb353189d2fc [49/83] no-side-for-subvec
config: x86_64-randconfig-012-20251031 (https://download.01.org/0day-ci/archive/20251101/202511012344.oRx9MjOk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511012344.oRx9MjOk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511012344.oRx9MjOk-lkp@intel.com/

Note: the jimc/dd-drm-fix HEAD 7c56937db9e56927f30d9fdecccb793062970841 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> lib/dynamic_debug.c:236:2: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     236 |         for_subvec(i, map, di, maps) {
         |         ^
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:174:2: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |         ^
>> lib/dynamic_debug.c:236:2: error: expected expression
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:175:3: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     175 |         (void)sizeof((_box)->_vec.start);               \
         |          ^
>> lib/dynamic_debug.c:236:25: error: use of undeclared identifier 'maps'; did you mean 'map'?
     236 |         for_subvec(i, map, di, maps) {
         |                                ^~~~
         |                                map
   lib/dynamic_debug.c:181:32: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |                                       ^
   lib/dynamic_debug.c:174:25: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |                                ^
   lib/dynamic_debug.c:232:28: note: 'map' declared here
     232 |         struct _ddebug_class_map *map;
         |                                   ^
   lib/dynamic_debug.c:244:2: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     244 |         for_subvec(i, cli, di, users) {
         |         ^
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:174:2: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |         ^
   lib/dynamic_debug.c:244:2: error: expected expression
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:175:3: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     175 |         (void)sizeof((_box)->_vec.start);               \
         |          ^
>> lib/dynamic_debug.c:244:25: error: use of undeclared identifier 'users'
     244 |         for_subvec(i, cli, di, users) {
         |                                ^
   lib/dynamic_debug.c:275:2: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     275 |         for_subvec(i, map, di, maps)
         |         ^
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:174:2: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |         ^
   lib/dynamic_debug.c:275:2: error: expected expression
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:175:3: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     175 |         (void)sizeof((_box)->_vec.start);               \
         |          ^
   lib/dynamic_debug.c:275:25: error: use of undeclared identifier 'maps'; did you mean 'map'?
     275 |         for_subvec(i, map, di, maps)
         |                                ^~~~
         |                                map
   lib/dynamic_debug.c:181:32: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |                                       ^
   lib/dynamic_debug.c:174:25: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |                                ^
   lib/dynamic_debug.c:271:28: note: 'map' declared here
     271 |         struct _ddebug_class_map *map;
         |                                   ^
   lib/dynamic_debug.c:279:2: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     279 |         for_subvec(i, cli, di, users)
         |         ^
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:174:2: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |         ^
   lib/dynamic_debug.c:279:2: error: expected expression
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:175:3: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     175 |         (void)sizeof((_box)->_vec.start);               \
         |          ^
   lib/dynamic_debug.c:279:25: error: use of undeclared identifier 'users'
     279 |         for_subvec(i, cli, di, users)
         |                                ^
   lib/dynamic_debug.c:1284:2: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1284 |         for_subvec(i, map, di, maps)
         |         ^
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:174:2: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |         ^
   lib/dynamic_debug.c:1284:2: error: expected expression
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:175:3: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     175 |         (void)sizeof((_box)->_vec.start);               \
         |          ^
   lib/dynamic_debug.c:1284:25: error: use of undeclared identifier 'maps'; did you mean 'map'?
    1284 |         for_subvec(i, map, di, maps)
         |                                ^~~~
         |                                map
   lib/dynamic_debug.c:181:32: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |                                       ^
   lib/dynamic_debug.c:174:25: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |                                ^
   lib/dynamic_debug.c:1280:28: note: 'map' declared here
    1280 |         struct _ddebug_class_map *map;
         |                                   ^
   lib/dynamic_debug.c:1288:2: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1288 |         for_subvec(i, cli, di, users)
         |         ^
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:174:2: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     174 |         __chkp_no_side_effects(_vec)                    \
         |         ^
   lib/dynamic_debug.c:1288:2: error: expected expression
   lib/dynamic_debug.c:181:2: note: expanded from macro 'for_subvec'
     181 |         __ASSERT_HAS_VEC_MEMBER(_box, _vec);            \
         |         ^
   lib/dynamic_debug.c:175:3: note: expanded from macro '__ASSERT_HAS_VEC_MEMBER'
     175 |         (void)sizeof((_box)->_vec.start);               \
         |          ^
   lib/dynamic_debug.c:1288:25: error: use of undeclared identifier 'users'
    1288 |         for_subvec(i, cli, di, users)
         |                                ^
   lib/dynamic_debug.c:1409:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct _ddebug_class_param *' [-Wnon-literal-null-conversion]
    1409 |                 return false;


vim +/__chkp_no_side_effects +236 lib/dynamic_debug.c

ca34ff4964e90c0 Jim Cromie 2023-09-15  228  
19cc4aa255705f1 Jim Cromie 2022-12-21  229  static struct _ddebug_class_map *
19cc4aa255705f1 Jim Cromie 2022-12-21  230  ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class, int *class_id)
a4a2a427413e350 Jim Cromie 2022-09-04  231  {
af894f0a0fe5b16 Jim Cromie 2024-10-19  232  	struct _ddebug_class_map *map;
19cc4aa255705f1 Jim Cromie 2022-12-21  233  	struct _ddebug_class_user *cli;
67ace79df5b8140 Jim Cromie 2022-11-01  234  	int i, idx;
a4a2a427413e350 Jim Cromie 2022-09-04  235  
19cc4aa255705f1 Jim Cromie 2022-12-21 @236  	for_subvec(i, map, di, maps) {
19cc4aa255705f1 Jim Cromie 2022-12-21  237  		idx = match_string(map->class_names, map->length, query_class);
a4a2a427413e350 Jim Cromie 2022-09-04  238  		if (idx >= 0) {
19cc4aa255705f1 Jim Cromie 2022-12-21  239  			vpr_di_info(di, "good-class: %s.%s ", map->mod_name, query_class);
a4a2a427413e350 Jim Cromie 2022-09-04  240  			*class_id = idx + map->base;
a4a2a427413e350 Jim Cromie 2022-09-04  241  			return map;
a4a2a427413e350 Jim Cromie 2022-09-04  242  		}
a4a2a427413e350 Jim Cromie 2022-09-04  243  	}
19cc4aa255705f1 Jim Cromie 2022-12-21 @244  	for_subvec(i, cli, di, users) {
19cc4aa255705f1 Jim Cromie 2022-12-21  245  		idx = match_string(cli->map->class_names, cli->map->length, query_class);
19cc4aa255705f1 Jim Cromie 2022-12-21  246  		if (idx >= 0) {
19cc4aa255705f1 Jim Cromie 2022-12-21  247  			vpr_di_info(di, "class-ref: %s -> %s.%s ",
19cc4aa255705f1 Jim Cromie 2022-12-21  248  				    cli->mod_name, cli->map->mod_name, query_class);
431965079049da7 Jim Cromie 2025-09-03  249  			*class_id = idx + cli->map->base - cli->offset;
19cc4aa255705f1 Jim Cromie 2022-12-21  250  			return cli->map;
19cc4aa255705f1 Jim Cromie 2022-12-21  251  		}
19cc4aa255705f1 Jim Cromie 2022-12-21  252  	}
a4a2a427413e350 Jim Cromie 2022-09-04  253  	*class_id = -ENOENT;
a4a2a427413e350 Jim Cromie 2022-09-04  254  	return NULL;
a4a2a427413e350 Jim Cromie 2022-09-04  255  }
a4a2a427413e350 Jim Cromie 2022-09-04  256  

:::::: The code at line 236 was first introduced by commit
:::::: 19cc4aa255705f15bfd5460a7c9db158f955186d dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
