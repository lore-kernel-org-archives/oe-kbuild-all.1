Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF453149E00
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 23:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735861777; cv=none; b=Tr25MuSS5gJ+em9+ekpa2cnYAsX3e9d6iAJ+Vh22A/eQpHQyFJk18LVfxMXEZeCKwyfG993lqoaxGGr8+stmrb6HVWWe8uLABRJmFz4fKexfc/S3Yt3ZiSh5kWeSGcEBdq9ep8mARPfR7WBc0h9szWQlIWQJNLYl7AtNHOUXS6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735861777; c=relaxed/simple;
	bh=VazX4UPWTtCChuBpit30Wi5jPUEYRmspLdehneMH+uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yx0ciQS9BsauugPfoWbVaTsMYD3QZW43bRWeoDhnNC9EeZp9dFXB5zHgbIxC72rpPjkpzW/tqmQIJfXZqrFiAld75DWvDXlFfBdE60eeKbkcQdl9fz7ZYwqL5/WgZX4/vTdMNdAxCkkyhs8ZKP66/ViN0RLmggxmle6fDu0o9ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBXICxBr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBXICxBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735861775; x=1767397775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VazX4UPWTtCChuBpit30Wi5jPUEYRmspLdehneMH+uA=;
  b=PBXICxBrIgEiuAPAu06ulFT3AU0nwMZHfM53EJh2IYUQw50RpsDHBLh1
   FkH+CqqoykpqmLp9rjh0qT8LIC/VA7S0imojj0Wtc2KXGooUFR0Ae+Nzg
   4erq8Ch8KoT8IcY9CW2AmDozW6jE2IA3WPTx5a+U1G1Wa+FB+gByZt4J/
   gElmhGSJ42565rsz0mSlB9tdvuAQdieQHZWi2dpS64OoYsICHs/ZvPOTw
   cdqvGLPxfaGNZKzMPDl11IMlPo0q0d0k8hJVnmKgf6MBHEE42MJh6nvtw
   YRmR2Y69lFLM+yeixv6WOz32h7I1AmvfFVVPad+RzZ/R1OPddfDNNVP0Q
   g==;
X-CSE-ConnectionGUID: 2WFowfayRDKK90Q4UybO0w==
X-CSE-MsgGUID: x01tAB/WRBWMnRqD0Y5rtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53517760"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="53517760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 15:49:34 -0800
X-CSE-ConnectionGUID: bsAQE0YVQ+OIlIxZaQ4uOg==
X-CSE-MsgGUID: 8903hlFYQpW2Kn/CDtBlNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102153001"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jan 2025 15:49:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTUwV-0008yF-16;
	Thu, 02 Jan 2025 23:49:31 +0000
Date: Fri, 3 Jan 2025 07:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v10-wip 8/26] net/ipv4/../core/devmem.h:169:8:
 warning: '__gnu_inline__' attribute only applies to functions
Message-ID: <202501030748.VsNRgzA0-lkp@intel.com>
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
config: riscv-randconfig-001-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030748.VsNRgzA0-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030748.VsNRgzA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030748.VsNRgzA0-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   net/ipv4/../core/devmem.h:169:8: error: 'inline' can only appear on functions
     169 | static inline bool
         |        ^
   include/linux/compiler_types.h:236:16: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from net/ipv4/tcp.c:288:
>> net/ipv4/../core/devmem.h:169:8: warning: '__gnu_inline__' attribute only applies to functions [-Wignored-attributes]
   include/linux/compiler_types.h:236:23: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   In file included from net/ipv4/tcp.c:288:
>> net/ipv4/../core/devmem.h:169:8: warning: '__no_instrument_function__' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/compiler_types.h:236:58: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   include/linux/compiler_types.h:218:34: note: expanded from macro 'notrace'
     218 | #define notrace                 __attribute__((__no_instrument_function__))
         |                                                ^
   In file included from net/ipv4/tcp.c:288:
   net/ipv4/../core/devmem.h:170:1: error: redefinition of 'bool' as different kind of symbol
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         | ^
   include/linux/types.h:35:17: note: previous definition is here
      35 | typedef _Bool                   bool;
         |                                 ^
   In file included from net/ipv4/tcp.c:288:
   net/ipv4/../core/devmem.h:170:5: error: expected ';' after top level declarator
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |     ^
         |     ;
   net/ipv4/tcp.c:2479:9: error: call to undeclared function 'net_is_devmem_iov'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2479 |                         if (!net_is_devmem_iov(niov)) {
         |                              ^
   3 warnings and 4 errors generated.
--
   In file included from net/core/dev.c:80:
   In file included from include/linux/sched/isolation.h:5:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/core/dev.c:164:
   net/core/devmem.h:169:8: error: 'inline' can only appear on functions
     169 | static inline bool
         |        ^
   include/linux/compiler_types.h:236:16: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                ^
   In file included from net/core/dev.c:164:
>> net/core/devmem.h:169:8: warning: '__gnu_inline__' attribute only applies to functions [-Wignored-attributes]
   include/linux/compiler_types.h:236:23: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                       ^
   include/linux/compiler_attributes.h:165:56: note: expanded from macro '__gnu_inline'
     165 | #define __gnu_inline                    __attribute__((__gnu_inline__))
         |                                                        ^
   In file included from net/core/dev.c:164:
>> net/core/devmem.h:169:8: warning: '__no_instrument_function__' attribute only applies to functions and Objective-C methods [-Wignored-attributes]
   include/linux/compiler_types.h:236:58: note: expanded from macro 'inline'
     236 | #define inline inline __gnu_inline __inline_maybe_unused notrace
         |                                                          ^
   include/linux/compiler_types.h:218:34: note: expanded from macro 'notrace'
     218 | #define notrace                 __attribute__((__no_instrument_function__))
         |                                                ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:170:1: error: redefinition of 'bool' as different kind of symbol
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         | ^
   include/linux/types.h:35:17: note: previous definition is here
      35 | typedef _Bool                   bool;
         |                                 ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h:170:5: error: expected ';' after top level declarator
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |     ^
         |     ;
   3 warnings and 3 errors generated.


vim +/__gnu_inline__ +169 net/ipv4/../core/devmem.h

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
