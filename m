Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0DD1474D3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 02:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735872295; cv=none; b=t4upDzAKLepiDR8V0cZboeX84qdqMbglF+tTpZOxbuwIShVL8k3O7WMIyxECUUtVKiNfa/JNA//mOusAU1DJ3TQYsw026hgkb5HGcEE/c5f6blmyAnUsCUt1e7sjxgLO2Fjp77QqSwFlFQs836+LsbLQA4dRK7FVaSfz63byRWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735872295; c=relaxed/simple;
	bh=xDmVvWum+2pQwtyeDl3jhN1lbFf5sjjL5w7xQ+6n1R8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhiwEfzEXt3RShsFb36kJzSuGHGLzKBcCsxOdtYTr+kOoUNC/tqV5HWSRuWJfHLwgYoVLVifkn0tBq5W4bW3QK4nQpUT6WjJcd4YQLQNSRo4ae/q1C+F0HMsaMN5hVK1RRT3y0ua/N1xSQQwDXc/8PQAMFRGixoaoU3VuLnuFCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mg4EZVon; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mg4EZVon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735872294; x=1767408294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xDmVvWum+2pQwtyeDl3jhN1lbFf5sjjL5w7xQ+6n1R8=;
  b=mg4EZVonjgBWe7IhsIjBHau1GqArop5t6FK2Him5/2SP8iuJfbP3kTFD
   ieHWOV2BWa/m6YtgEhTEedD3wXK4qYdj5s3wBL3oCKRJQhhyQ0uoLaqOU
   6QERJMciz0MaXGKnztEQhxwBWLuFl+VB2o8KF2s/uBcJ88zzkkm7zyk60
   03RDP3ab99nVVYU1Ab2rImmd8W3XJ7kGy3B8soCvPu0zOekI+FZ31V6Lr
   lu2LJltxHLkEqNbNTcv2tHYj3T/YYgsOZolSvG2WJU7Jdy0YqAfp3EvAw
   BoObMTOJMLOL7uZc361veXD5wDXPaRAh79rw1MvQbh9vAGZFp+vMP4QsU
   A==;
X-CSE-ConnectionGUID: RzWrMw6+TLiWmfknu57b+w==
X-CSE-MsgGUID: i9+LIE8+TG+janRyKOmwuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36137630"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36137630"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 18:44:53 -0800
X-CSE-ConnectionGUID: lTwS+xNDRLuYuDx5oX322w==
X-CSE-MsgGUID: JqdPJw+nQRejs9exkUpXZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101522833"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jan 2025 18:44:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTXg9-00096d-2i;
	Fri, 03 Jan 2025 02:44:49 +0000
Date: Fri, 3 Jan 2025 10:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v10-wip 8/26] net/core/devmem.h:169:8: error:
 'inline' can only appear on functions
Message-ID: <202501031004.FWfvo1FU-lkp@intel.com>
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
config: riscv-randconfig-001-20250103 (https://download.01.org/0day-ci/archive/20250103/202501031004.FWfvo1FU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031004.FWfvo1FU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031004.FWfvo1FU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/dev.c:80:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/core/dev.c:164:
>> net/core/devmem.h:169:8: error: 'inline' can only appear on functions
     169 | static inline bool
         |        ^
   include/linux/compiler_types.h:236:16: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:169:8: warning: '__gnu_inline__' attribute only applies to functions [-Wignored-attributes]
   include/linux/compiler_types.h:236:23: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:169:8: warning: '__no_instrument_function__' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/compiler_types.h:236:58: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   include/linux/compiler_types.h:218:34: note: expanded from macro 'notrace'
     218 | #define notrace                 __attribute__((__no_instrument_function__))
         |                                                ^
   In file included from net/core/dev.c:164:
>> net/core/devmem.h:170:1: error: redefinition of 'bool' as different kind of symbol
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         | ^
   include/linux/types.h:35:17: note: previous definition is here
      35 | typedef _Bool                   bool;
         |                                 ^
   In file included from net/core/dev.c:164:
>> net/core/devmem.h:170:5: error: expected ';' after top level declarator
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |     ^
         |     ;
   3 warnings and 3 errors generated.
--
   In file included from net/ipv4/tcp.c:252:
   In file included from include/linux/inet_diag.h:5:
   In file included from include/net/netlink.h:6:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/riscv/include/asm/cacheflush.h:9:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/ipv4/tcp.c:288:
>> net/ipv4/../core/devmem.h:169:8: error: 'inline' can only appear on functions
     169 | static inline bool
         |        ^
   include/linux/compiler_types.h:236:16: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from net/ipv4/tcp.c:288:
   net/ipv4/../core/devmem.h:169:8: warning: '__gnu_inline__' attribute only applies to functions [-Wignored-attributes]
   include/linux/compiler_types.h:236:23: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   In file included from net/ipv4/tcp.c:288:
   net/ipv4/../core/devmem.h:169:8: warning: '__no_instrument_function__' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/compiler_types.h:236:58: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   include/linux/compiler_types.h:218:34: note: expanded from macro 'notrace'
     218 | #define notrace                 __attribute__((__no_instrument_function__))
         |                                                ^
   In file included from net/ipv4/tcp.c:288:
>> net/ipv4/../core/devmem.h:170:1: error: redefinition of 'bool' as different kind of symbol
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         | ^
   include/linux/types.h:35:17: note: previous definition is here
      35 | typedef _Bool                   bool;
         |                                 ^
   In file included from net/ipv4/tcp.c:288:
>> net/ipv4/../core/devmem.h:170:5: error: expected ';' after top level declarator
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |     ^
         |     ;
>> net/ipv4/tcp.c:2479:9: error: call to undeclared function 'net_is_devmem_iov'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2479 |                         if (!net_is_devmem_iov(niov)) {
         |                              ^
   3 warnings and 4 errors generated.


vim +/inline +169 net/core/devmem.h

   168	
 > 169	static inline bool
 > 170	bool net_is_devmem_iov(struct net_iov *niov)
   171	{
   172		return false;
   173	}
   174	#endif
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
