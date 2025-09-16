Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0D52F5A15
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 17:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758042576; cv=none; b=Iwj6oQIyNc9FR3KDkB/VmNGwbEqiLgXdXFoAQR3NHxxljz2nr8GewM6P18UY7dgtpmChVZc5FoNo7c1LHPTxy+BhiNE3lzl4RJJr21w0MWjBK3wvMM/Tb+3iXsNHTngZ2BIqZ7OPxWskZyOkShc9HthhuFyFblVjW/CQnpr9rFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758042576; c=relaxed/simple;
	bh=NPDELuGhbIzEE/QvP9F8DOPIPQllRwIBRepM76Q9qHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFHF2PHpwclHdz6Gdlh7rI+M4dSajKLoZKj6wSROpiks4KeBS/Ij0ILCmiEL6xmF85vOPH17H9/79C+MJ3Jq9IJ7IGvIzLRoxPnvR0E57ifSXS+ES+4Ja2A9f0TuHF/lOi9JWrjfkgNBqpFSPLsbtIKA1yKU1jJnb0NvIdhJknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/TkYmx0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/TkYmx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758042574; x=1789578574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NPDELuGhbIzEE/QvP9F8DOPIPQllRwIBRepM76Q9qHM=;
  b=G/TkYmx0y3/qStEKbBkLmmwl/9xg336T+Ce+ziydTJq6MTyCvlwtyiR8
   FK7ta3J4Pa/LtGbLJPsQ04bfDK88BAZHAR//Dxlv4HjzCoTZG96uQYDmt
   k4QH1GvOMLNEPU9hqsmn+9N9nSSWXNS84MfZbnbIMpIX7MAnM6/Ts4h5A
   rShPqMYVUxkG5f/OgYuATlKSMf43wIyohTsesdsnMeGdOznJ4vb34j50E
   8yNwgopy2bg0Zndsl6LA6GrT2TNApEFzRoXysRkuzy2C96WWz/zyTv/HW
   eZdqar1c+Bhl8+ff7Bkf1Ts63lweZNkqyFCqVTGEquA3lyKB4uyiB/cl5
   Q==;
X-CSE-ConnectionGUID: cEjlHMcERmanSSzU2/Ywcw==
X-CSE-MsgGUID: zJpMHcVNSEyGaNTjVCa3LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="47908458"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="47908458"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 10:09:29 -0700
X-CSE-ConnectionGUID: /2qCvbnvRMec4HXC1aL3nw==
X-CSE-MsgGUID: Cusg/BobSzuEePNmG6RHAw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Sep 2025 10:09:28 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyZBF-0000Y1-2M;
	Tue, 16 Sep 2025 17:09:25 +0000
Date: Wed, 17 Sep 2025 01:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 42/42] kernel/dma/mapping.c:178:2: error:
 conflicting types for 'trace_dma_map_phys'
Message-ID: <202509170137.rRMG3oZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   887b59804850b679831fda6eba707cc1b1b077e0
commit: 887b59804850b679831fda6eba707cc1b1b077e0 [42/42] dma-mapping: remove unused map_page callback
config: riscv-randconfig-002-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170137.rRMG3oZK-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170137.rRMG3oZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170137.rRMG3oZK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/dma/mapping.c: In function 'dma_map_phys':
   kernel/dma/mapping.c:160:13: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
     160 |  dma_addr_t addr = DMA_MAPPING_ERROR;
         |             ^~~~
   kernel/dma/mapping.c: At top level:
   kernel/dma/mapping.c:176:2: error: expected identifier or '(' before 'if'
     176 |  if (!is_mmio)
         |  ^~
   kernel/dma/mapping.c:178:2: warning: data definition has no type or storage class
     178 |  trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
         |  ^~~~~~~~~~~~~~~~~~
   kernel/dma/mapping.c:178:2: error: type defaults to 'int' in declaration of 'trace_dma_map_phys' [-Werror=implicit-int]
>> kernel/dma/mapping.c:178:2: warning: parameter names (without types) in function declaration
>> kernel/dma/mapping.c:178:2: error: conflicting types for 'trace_dma_map_phys'
   In file included from include/trace/events/dma.h:8,
                    from kernel/dma/mapping.c:22:
   include/linux/tracepoint.h:278:21: note: previous definition of 'trace_dma_map_phys' was here
     278 |  static inline void trace_##name(proto)    \
         |                     ^~~~~~
   include/linux/tracepoint.h:481:2: note: in expansion of macro '__DECLARE_TRACE'
     481 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
         |  ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:608:2: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     608 |  DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/events/dma.h:70:1: note: in expansion of macro 'DEFINE_EVENT'
      70 | DEFINE_EVENT(dma_map, name, \
         | ^~~~~~~~~~~~
   include/trace/events/dma.h:75:1: note: in expansion of macro 'DEFINE_MAP_EVENT'
      75 | DEFINE_MAP_EVENT(dma_map_phys);
         | ^~~~~~~~~~~~~~~~
   kernel/dma/mapping.c:179:2: warning: data definition has no type or storage class
     179 |  debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
         |  ^~~~~~~~~~~~~~~~~~
   kernel/dma/mapping.c:179:2: error: type defaults to 'int' in declaration of 'debug_dma_map_phys' [-Werror=implicit-int]
   kernel/dma/mapping.c:179:2: warning: parameter names (without types) in function declaration
>> kernel/dma/mapping.c:179:2: error: conflicting types for 'debug_dma_map_phys'
   In file included from kernel/dma/mapping.c:18:
   kernel/dma/debug.h:12:13: note: previous declaration of 'debug_dma_map_phys' was here
      12 | extern void debug_dma_map_phys(struct device *dev, phys_addr_t phys,
         |             ^~~~~~~~~~~~~~~~~~
   kernel/dma/mapping.c:181:2: error: expected identifier or '(' before 'return'
     181 |  return addr;
         |  ^~~~~~
   kernel/dma/mapping.c:182:1: error: expected identifier or '(' before '}' token
     182 | }
         | ^
   kernel/dma/mapping.c: In function 'dma_map_phys':
   kernel/dma/mapping.c:174:2: warning: control reaches end of non-void function [-Wreturn-type]
     174 |  }
         |  ^
   cc1: some warnings being treated as errors


vim +/trace_dma_map_phys +178 kernel/dma/mapping.c

d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  154  
98aa19211ca8ab Leon Romanovsky      2025-06-17  155  dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
98aa19211ca8ab Leon Romanovsky      2025-06-17  156  		enum dma_data_direction dir, unsigned long attrs)
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  157  {
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  158  	const struct dma_map_ops *ops = get_dma_ops(dev);
c332420ebc1822 Leon Romanovsky      2025-06-17  159  	bool is_mmio = attrs & DMA_ATTR_MMIO;
19e1683200df53 Leon Romanovsky      2025-09-15  160  	dma_addr_t addr = DMA_MAPPING_ERROR;
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  161  
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  162  	BUG_ON(!valid_dma_direction(dir));
f959dcd6ddfd29 Thomas Tai           2020-09-17  163  
f959dcd6ddfd29 Thomas Tai           2020-09-17  164  	if (WARN_ON_ONCE(!dev->dma_mask))
f959dcd6ddfd29 Thomas Tai           2020-09-17  165  		return DMA_MAPPING_ERROR;
f959dcd6ddfd29 Thomas Tai           2020-09-17  166  
8d8d53cf8fd028 Alexey Kardashevskiy 2020-10-29  167  	if (dma_map_direct(dev, ops) ||
c332420ebc1822 Leon Romanovsky      2025-06-17  168  	    (!is_mmio && arch_dma_map_phys_direct(dev, phys + size)))
907f79a29dcbc1 Leon Romanovsky      2025-06-17  169  		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
b5c58b2fdc427e Leon Romanovsky      2024-07-24  170  	else if (use_dma_iommu(dev))
fe635b87c42ebd Leon Romanovsky      2025-06-17  171  		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
098e1e1eeeee44 Leon Romanovsky      2025-09-15  172  	else if (ops->map_phys)
098e1e1eeeee44 Leon Romanovsky      2025-09-15  173  		addr = ops->map_phys(dev, phys, size, dir, attrs);
c332420ebc1822 Leon Romanovsky      2025-06-17  174  	}
00730608c19fca Leon Romanovsky      2025-06-17  175  
c332420ebc1822 Leon Romanovsky      2025-06-17 @176  	if (!is_mmio)
00730608c19fca Leon Romanovsky      2025-06-17  177  		kmsan_handle_dma(phys, size, dir);
7d6250d472a5fb Leon Romanovsky      2025-06-17 @178  	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
46758939d12150 Leon Romanovsky      2025-06-17 @179  	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  180  
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  181  	return addr;
d3fa60d7bfdc9a Christoph Hellwig    2020-07-08  182  }
98aa19211ca8ab Leon Romanovsky      2025-06-17  183  EXPORT_SYMBOL_GPL(dma_map_phys);
98aa19211ca8ab Leon Romanovsky      2025-06-17  184  

:::::: The code at line 178 was first introduced by commit
:::::: 7d6250d472a5fb7da5f2f6c822aa63f556c3ed6d dma-mapping: rename trace_dma_*map_page to trace_dma_*map_phys

:::::: TO: Leon Romanovsky <leonro@nvidia.com>
:::::: CC: Leon Romanovsky <leon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
