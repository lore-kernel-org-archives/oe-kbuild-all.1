Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFB1146E92
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708721022; cv=none; b=P6XHvPVi+qQzfqPaex1RrSvJgs9WR70v+9CILMmoejdOZ1jAQUdBETKhalzS+gEbV90h5Lerw35gT3Ta0iZzsncTNlQUWB3TJTNSxrPoyxorSsNwVAfIUZAL2Z9O5E27oeLXFjl7QpQ5kGoDhcGBa5r6Jl/ZnMKsQp7fEn0EFsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708721022; c=relaxed/simple;
	bh=g/oULGwYw+91UbPhkXHvWf6ahYJFIq0FG9E0x/okirM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N49ipv4xDh62S+EnOpWoG012TBDO4+3y1DxjRaPFkVuc6l2Vl+/m8tHZmf6iO6iaV7ux5OnJ3SOIx1eDiWqbpOyRRDhgSfM4qF0f5p3mpq1TZ1i/O63ys61NuBd6+oaTdz1HJugsc1zsvC/Pca0bEjOdi+o3Xw9hlf5o/j8NgD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hskzuJsX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hskzuJsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708721021; x=1740257021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/oULGwYw+91UbPhkXHvWf6ahYJFIq0FG9E0x/okirM=;
  b=hskzuJsXYBuWPALuMVZ3/t3iN8b+ZJC4/T+jHryqqWe6MAR0/9diUmEs
   6DSpW6Wp7S1u/qkvWtLKpvqVZmqnVUMie0244UGkLYD9NSbXpFcm8jpCx
   5c9Jn9JCA2zPYkYI43Gg/3DV+0nXYHd1YhCsWuYaE0Mkq50DOZ3B6HGXW
   PXvuN+LAx9pVS22Liai5VPVi5LWZir2lhO9JEq7waD78LDTDGi6k1e56x
   AeIvVA2pVhL/5zmY9gGI9i2A3a6+L/llccR8WVQ1pEEYRTo2jIT2UBPrx
   9N8+w+gVbdYRo3X0yQChT/TnPwvp7z2bTHABH7LZaoajflT0hveP4kQYt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2922978"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2922978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 12:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5905880"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 12:43:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdcOO-0007t8-1e;
	Fri, 23 Feb 2024 20:43:36 +0000
Date: Sat, 24 Feb 2024 04:43:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 22/43] net/core/page_pool.c:1098:10: warning:
 incompatible pointer to integer conversion returning 'void *' from a
 function with result type 'netmem_ref' (aka 'unsigned long')
Message-ID: <202402240452.lHs2J9wh-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240224/202402240452.lHs2J9wh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240452.lHs2J9wh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240452.lHs2J9wh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/page_pool.c:1098:10: warning: incompatible pointer to integer conversion returning 'void *' from a function with result type 'netmem_ref' (aka 'unsigned long') [-Wint-conversion]
                   return NULL;
                          ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   net/core/page_pool.c:1115:9: warning: incompatible pointer to integer conversion returning 'void *' from a function with result type 'netmem_ref' (aka 'unsigned long') [-Wint-conversion]
           return NULL;
                  ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   2 warnings generated.


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
