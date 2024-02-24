Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D77125A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 05:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708751640; cv=none; b=klEzKZNpIRErAJSWd7ZlSiqf529l30+XClkbwFr0nHRzgtJULYKnlvm+X/pNHpa2pEZg1f2KakEGqAvwwzMca+M6DnLKgYhv3vcYqAn97uV9nDtYbKp15iADbTSxmv3q+ZaAlrgnJFQaLRMrobIi0baQ/qjReEe1bwck1T/HINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708751640; c=relaxed/simple;
	bh=+dwpjOn/QgiIQ23afMeeoETVnpAadJhLJazm4fRYkB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZRWcV1zHTHheYONrzD/xlhUc5ekDysFixB6td/4kU/pUtBrij9ktfQyE8HXL3i2xCnMTAUg90MbcX1JxkT92Yg3J8WNU+yJl7UGhQ9tvbVAwcIxbjHD6EYHRaM4gmfAG6pcI8Ggmf6lplLHZM+KIGM8ZrfvAZCyiSlpE/amYC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1paKcX/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1paKcX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708751638; x=1740287638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dwpjOn/QgiIQ23afMeeoETVnpAadJhLJazm4fRYkB8=;
  b=J1paKcX/aFfbZdqYXdtG+q35y8P0MiHaoWEiMOckp0/AXYFkaacu1QUJ
   awbJvDSKYu4ucclJIjZg2uWpoCFJ6RSSR/j6OrZKmqRQXCyuwX/VtLxnv
   9X4jmR8m1OX0pk9309fzopKcNtrZVE8yyLZoZ8CUw/6h56uJ5mUdrEfYO
   rrYz1NRS/9ENoOFdd1p/ONtT2Y4ovf+PEzd9UMOoSuRh+5bfBD0pj4BcU
   3APKI2lMFY4La4Sg6WgFmAZSF0dCXEtZ8m7egUnMMo1bfg4qHLhbA8Km1
   bA8uNsFrN74klh16WryArUAlpGW3JU9rUVYgaKNX7ed7TEceSbkqPToPd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20536987"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="20536987"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 21:13:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="10686756"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Feb 2024 21:13:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdkME-0008FB-2D;
	Sat, 24 Feb 2024 05:13:54 +0000
Date: Sat, 24 Feb 2024 13:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 22/43] net/core/page_pool.c:1098:10: error:
 incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'netmem_ref' (aka 'unsigned long')
Message-ID: <202402241356.XfKy4XaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   422e699712a532c85e16c4e6afda9d4d4164bdf3
commit: 95496e256dcf9e2750a2704c03b0287ce341da88 [22/43] memory-provider: dmabuf devmem memory provider
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240224/202402241356.XfKy4XaE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241356.XfKy4XaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241356.XfKy4XaE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/page_pool.c:1098:10: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'netmem_ref' (aka 'unsigned long') [-Wint-conversion]
    1098 |                 return NULL;
         |                        ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   net/core/page_pool.c:1115:9: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'netmem_ref' (aka 'unsigned long') [-Wint-conversion]
    1115 |         return NULL;
         |                ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^~~~~~~~~~~
   2 errors generated.


vim +1098 net/core/page_pool.c

  1087	
  1088	static netmem_ref mp_dmabuf_devmem_alloc_pages(struct page_pool *pool,
  1089						       gfp_t gfp)
  1090	{
  1091		struct netdev_dmabuf_binding *binding = pool->mp_priv;
  1092		netmem_ref netmem;
  1093		struct net_iov *niov;
  1094		dma_addr_t dma_addr;
  1095	
  1096		niov = netdev_alloc_dmabuf(binding);
  1097		if (!niov)
> 1098			return NULL;
  1099	
  1100		dma_addr = net_iov_dma_addr(niov);
  1101	
  1102		netmem = net_iov_to_netmem(niov);
  1103	
  1104		page_pool_set_pp_info(pool, netmem);
  1105	
  1106		if (page_pool_set_dma_addr_netmem(netmem, dma_addr))
  1107			goto err_free;
  1108	
  1109		pool->pages_state_hold_cnt++;
  1110		trace_page_pool_state_hold(pool, netmem, pool->pages_state_hold_cnt);
  1111		return netmem;
  1112	
  1113	err_free:
  1114		netdev_free_dmabuf(niov);
  1115		return NULL;
  1116	}
  1117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
