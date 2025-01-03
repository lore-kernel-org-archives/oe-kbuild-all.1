Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30A933DF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 01:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735866403; cv=none; b=SWwcMTWklHgQZWO8rA6Ru8/XgLf8LFbZ26w82OagJJ7JH7qfr8wLnLPXyp/Dy0yx/+XEdwIddfbPEy+FyKV11sjZb23zCb6JcXt4rlyMFP6KlVZNzBa/nmVVRyEbjOZOWw66SmWXpkTSb39lANmak1SeDVa/h9obMMFtyRokUwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735866403; c=relaxed/simple;
	bh=rINH4zqL9sY9GpCaU/qdhNWRYp4nKOD08mqjOlNLeIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqoD3bWOPnxqP0AYCNXN79Iry+Kchlxv8G99dOQNsjpnbE8QzTVrXArrgnUii2S5Uci8In9d0DIx5aonffW4j0u3KcycUY2TBi3YwuvjmnCpFcj9zCNeALAluW978Y6rIjq4v4VrWc8CHYL8FUZtjM/QRfmM1psaTfbSwWfLdoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXl1Ss6i; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXl1Ss6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735866402; x=1767402402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rINH4zqL9sY9GpCaU/qdhNWRYp4nKOD08mqjOlNLeIE=;
  b=aXl1Ss6iQyFA1T2TqXB+q960EIjd2qSZs3MuD7HKZvK/qgxeh80r/6y/
   WeiZJWcPfVmdGA3PFN2rOQtkFtMp2pvFKGMyrb2Tw38khIFedGuRcI0og
   2sa4M0u9HDDFaKQ8C8wwcO15IrTC1nxgUMx0hDFK3N0sUzEXAlNhBNJsd
   pKxwnNFYfI1Qg9gZKSUWHQFnw04Rc8zOJaTqchk++T5vw77JjuLNKf44q
   Q3K1NogxhHiH3iUBDFmSy2kzFT4k8UVzUzqnGvwoGIKT+NsJODYf59eKF
   fheTVwrMkRPApAZMP/bCVbyGhOjFc/QZ4X0UI4b+6cJkI4AFWhlWk6Nxf
   A==;
X-CSE-ConnectionGUID: nZkJoy2NRBylHA/D7LBC2A==
X-CSE-MsgGUID: kIg9tX7EQFivzznkO5FeRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36019904"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36019904"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 17:06:41 -0800
X-CSE-ConnectionGUID: yvp0+eDGRQCrjUTgU1lKAQ==
X-CSE-MsgGUID: woTRX0uZRXGDWwx/HvoZJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138987631"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jan 2025 17:06:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTW98-00091J-0l;
	Fri, 03 Jan 2025 01:06:38 +0000
Date: Fri, 3 Jan 2025 09:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v10-wip 8/26] net/core/devmem.h:169:8: warning:
 'no_instrument_function' attribute only applies to functions and Objective-C
 methods
Message-ID: <202501030856.y3ahTYhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v10-wip
head:   1e1214d152c4b21b5bc3e9b37e26cd60ed14632b
commit: 9852e159a9d1e771fe98518bf7f67ac9ee145203 [8/26] net: prepare for non devmem TCP memory providers
config: x86_64-buildonly-randconfig-004-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030856.y3ahTYhF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030856.y3ahTYhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030856.y3ahTYhF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/netdev-genl.c:3:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/core/netdev-genl.c:15:
   net/core/devmem.h:169:8: error: 'inline' can only appear on functions
     169 | static inline bool
         |        ^
   include/linux/compiler_types.h:236:16: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from net/core/netdev-genl.c:15:
   net/core/devmem.h:169:8: warning: '__gnu_inline__' attribute only applies to functions [-Wignored-attributes]
   include/linux/compiler_types.h:236:23: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   In file included from net/core/netdev-genl.c:15:
>> net/core/devmem.h:169:8: warning: 'no_instrument_function' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/compiler_types.h:236:58: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   arch/x86/include/asm/linkage.h:9:32: note: expanded from macro 'notrace'
       9 | #define notrace __attribute__((no_instrument_function))
         |                                ^
   In file included from net/core/netdev-genl.c:15:
   net/core/devmem.h:170:1: error: redefinition of 'bool' as different kind of symbol
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         | ^
   include/linux/types.h:35:17: note: previous definition is here
      35 | typedef _Bool                   bool;
         |                                 ^
   In file included from net/core/netdev-genl.c:15:
   net/core/devmem.h:170:5: error: expected ';' after top level declarator
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |     ^
         |     ;
   3 warnings and 3 errors generated.


vim +/no_instrument_function +169 net/core/devmem.h

   168	
 > 169	static inline bool
   170	bool net_is_devmem_iov(struct net_iov *niov)
   171	{
   172		return false;
   173	}
   174	#endif
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
