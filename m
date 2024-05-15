Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390CA41C73
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715759497; cv=none; b=smSoPY2i4gFGVB0uGIi2ClU2hO2JPGrZ+jrTipo4oVvGpS4S9SzB61Mfz/SYA16xRXQNpAB4Wab++5UsPS+8ddcOiratKul/YQ6A4EH/sn2QaY/NnJPtju+JSx9gogV6GYnPO9dtAdfXiXG6irwMtkk1y4jxKfq+PCRio2tiZbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715759497; c=relaxed/simple;
	bh=dDGycgU73DCT9n+z67VaLlVi85tgmvAsdHZv6DBe8+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cc+4ul8h36ataKeYvE55lLpB1klVguIVDEWjafefSDLBhMnm/4E1tZkt6lDo3E5KBeDScu/k62EYCnPBMglSCDnjQ+be1d0IdFa2EoAww9TekU9jaanJ4VhQZwuaUzHIiDb1lLgnYyk0n+fofG5EJj4p9m+KfcXI+ZfuHNILMqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evK3xe9t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evK3xe9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715759496; x=1747295496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dDGycgU73DCT9n+z67VaLlVi85tgmvAsdHZv6DBe8+Q=;
  b=evK3xe9t/KDl9YHetOXfxlOTgOUbJfs2B+MN5usuDuzxlHgY2dgF/bvT
   U0eZ9zen2jlyfLp/HQ+QiLHgoqbqF/1xDX6wQaAKt9XD0G9xJuVeX919Z
   H+5a2Q8gMLCPg/cNpveugkuW3Ph7P/bilQvTWWU+8u69FQE3nEV8SWL1S
   S587Qtj9EAngtqgq7UI18Hmfi/n3EewcnhcJulnOCIoxqBI5kEadrkpBd
   Fkipr3HzrQraOd+QcNR+m8uZ9gzpeBSRW+B5VTrTsEHS9w4AukDizgQSW
   FYZO0+5U1qVMwoaw0TeTm/gOfW37mD5eFfrsrtfEFXNlsRhwolEo9Ulgt
   g==;
X-CSE-ConnectionGUID: Ufg0WR8wRzyL5ySI3Tl5tA==
X-CSE-MsgGUID: EIFk4za9TeKHXKbrXEdB4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29311985"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="29311985"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 00:51:34 -0700
X-CSE-ConnectionGUID: dCCS43v0QMqV4uxosEKcwA==
X-CSE-MsgGUID: DkJ4vs3lTd6ZAF4KoZ5BNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; 
   d="scan'208";a="31056713"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 May 2024 00:51:33 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s79Q9-000Cb9-2D;
	Wed, 15 May 2024 07:51:29 +0000
Date: Wed, 15 May 2024 15:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 25/27] net/core/page_pool.c:691:19: warning:
 variable 'niov' set but not used
Message-ID: <202405151524.RBc0Q1A4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   8f99f44fc1fabf943cf0d1989f0afdff15e064e8
commit: 26fa2c4456e3c703b1dc7d61ec32180e4e7864d6 [25/27] wip: bnxt
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240515/202405151524.RBc0Q1A4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405151524.RBc0Q1A4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405151524.RBc0Q1A4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/page_pool.c:13:
   In file included from include/net/page_pool/helpers.h:55:
   In file included from include/net/page_pool/types.h:7:
   In file included from include/linux/ptr_ring.h:26:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/core/page_pool.c:691:19: warning: variable 'niov' set but not used [-Wunused-but-set-variable]
     691 |                 struct net_iov *niov;
         |                                 ^
   2 warnings generated.


vim +/niov +691 net/core/page_pool.c

   675	
   676	/* Only allow direct recycling in special circumstances, into the
   677	 * alloc side cache.  E.g. during RX-NAPI processing for XDP_DROP use-case.
   678	 *
   679	 * Caller must provide appropriate safe context.
   680	 */
   681	static bool page_pool_recycle_in_cache(netmem_ref netmem,
   682					       struct page_pool *pool)
   683	{
   684		if (unlikely(pool->alloc.count == PP_ALLOC_CACHE_SIZE)) {
   685			recycle_stat_inc(pool, cache_full);
   686			return false;
   687		}
   688	
   689		if (netmem_is_net_iov(netmem)) {
   690			// struct io_zc_rx_buf *buf;
 > 691			struct net_iov *niov;
   692	
   693			niov = netmem_to_net_iov(netmem);
   694			// buf = container_of(niov, struct io_zc_rx_buf, niov);
   695			// printk(KERN_INFO "----- page_pool_recycle_in_cache: recycling page, physical address: %#llx\n", (unsigned long long)page_to_phys(buf->page));
   696		}
   697	
   698		/* Caller MUST have verified/know (page_ref_count(page) == 1) */
   699		pool->alloc.cache[pool->alloc.count++] = netmem;
   700		recycle_stat_inc(pool, cached);
   701		return true;
   702	}
   703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
