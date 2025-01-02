Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1E1B6CE9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735855887; cv=none; b=UK43gfd0lR2OzMprnzASJOsLLalDd8zqeMB6UEczdSPZn9v5+lwc+FBA3/b44uMPWDreOa2C7cH4ksKQm9L9/RgTZRkuTVqcEHlWiKEe7RZiYDmVx8H4I5mY8voc85GRcBCeIeEpzLcBFkHZHtAvq1PeGIVEP5tPzMJ/8W0A2iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735855887; c=relaxed/simple;
	bh=oToeq5owyPzktvd6AGLtlVzW7BygsNuqWoaMQJgdTsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LiVUwQzhX2Ojnvrj8zPpFtVjiknk8SNkE2oqKCJgKgmoTkN4ZCO1gxxYUE6QI675VSuKsKdY4zlIRnUip4imIsmRciU6Hkr7PMf90O/uFlXYIBChVglr8KEE2tb2zSkQvj49buiJGVG0Bp9KNdPGnCXk7+c6b9AV1My9MCBP3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sgt5CeAx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sgt5CeAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735855886; x=1767391886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oToeq5owyPzktvd6AGLtlVzW7BygsNuqWoaMQJgdTsw=;
  b=Sgt5CeAxTAKeoq5UHMe9+s7VGlPgwNK2vUzxUCsUuFkzixJGmKDhJJxo
   jFMFziKFqcFlCt5pw30C7eVY3td2V+qDzgEcvJrgfvrn5JSKGn/CPRCWn
   FxH0qXxY+15Amu8H2CZp1IspkVfqN9xLYL5OUDt4LsuFdXSDDaDLHOD3y
   PS1VCWXOQq6Rucjf0OjTTDe7gmJpFLuYzIEXLJbhxGGbwmLyn0a2f5EQT
   h2SlPPehaUq29Qsp0XwQnbBQ3pOsZEbPfn5+5rh0sCztoBJ1t268/ONzW
   hVX7gxGoiJmmVLMzHPlUq4R49xJR3JeER3F7KnTHzS17I75eIwSH03yij
   w==;
X-CSE-ConnectionGUID: npMtiE6GRhij432Cly2fdA==
X-CSE-MsgGUID: uM6t/cP5RKiwFCJ5c05LEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35984085"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35984085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 14:11:26 -0800
X-CSE-ConnectionGUID: hDJvPUhvTlSXxk3cAWgBng==
X-CSE-MsgGUID: +QV2ob4mTMeAWPY8QIEXag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138950300"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Jan 2025 14:11:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTTPW-0008uY-19;
	Thu, 02 Jan 2025 22:11:22 +0000
Date: Fri, 3 Jan 2025 06:11:08 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v10-wip 14/26] include/net/page_pool/helpers.h:509:1:
 warning: no return statement in function returning non-void
Message-ID: <202501030600.oCRoEm8W-lkp@intel.com>
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
commit: afd4f768b9c9b770da047bc8b829c4845da1c420 [14/26] net: page pool: export page_pool_set_dma_addr_netmem()
config: i386-buildonly-randconfig-003-20250103 (https://download.01.org/0day-ci/archive/20250103/202501030600.oCRoEm8W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030600.oCRoEm8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030600.oCRoEm8W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/xdp.c:17:
   include/net/page_pool/helpers.h: In function 'page_pool_set_dma_addr_netmem':
>> include/net/page_pool/helpers.h:509:1: warning: no return statement in function returning non-void [-Wreturn-type]
     509 | }
         | ^
--
   In file included from net/core/dev.c:159:
   include/net/page_pool/helpers.h: In function 'page_pool_set_dma_addr_netmem':
>> include/net/page_pool/helpers.h:509:1: warning: no return statement in function returning non-void [-Wreturn-type]
     509 | }
         | ^
   In file included from net/core/dev.c:164:
   net/core/devmem.h: At top level:
   net/core/devmem.h:170:6: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'net_is_devmem_iov'
     170 | bool net_is_devmem_iov(struct net_iov *niov)
         |      ^~~~~~~~~~~~~~~~~


vim +509 include/net/page_pool/helpers.h

   499	
   500	void page_pool_mp_return_in_cache(struct page_pool *pool, netmem_ref netmem);
   501	#else
   502	static inline void page_pool_set_pp_info(struct page_pool *pool,
   503						 netmem_ref netmem)
   504	{
   505	}
   506	static inline bool page_pool_set_dma_addr_netmem(netmem_ref netmem,
   507							 dma_addr_t addr)
   508	{
 > 509	}
   510	static inline void page_pool_clear_pp_info(netmem_ref netmem)
   511	{
   512	}
   513	#endif
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
