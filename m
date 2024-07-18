Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE4112F375
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721303079; cv=none; b=LbODheDVELLlYZgS5tJSab+/ob+LC5awrCWE2IiBvFZovpY648yHzinvTXh5FQ3rUCrEPBY0yRS6o9mN3V00IQA+TmZdgAC8PBkzgYT1y8GCXrpT6XPeBy5FtHxOsuE7i3oIidYMj8nteOWHVelw4ccZZmDXGt25Jc/h+zYruuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721303079; c=relaxed/simple;
	bh=Fsw16ryTFgIpYGn3w5WAwCLgjHd56N/OMPLFcl+R4Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bjmcuRGvLIdmPYWoGxP+YYipms0nhV3zdS+bGRTPnz7BpepibygJZdZcihFU2RTcQYrE+pEq4YKxLKTq2F7IO7qiyHbHapniqV2LYY8/FonHwMVnbC4yqXV2dsABFhCoWisfKfFq9Ch49JO6vH380RHEG1RGKy8bPdTfma/dGTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gl+uqA2k; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gl+uqA2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721303078; x=1752839078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fsw16ryTFgIpYGn3w5WAwCLgjHd56N/OMPLFcl+R4Rk=;
  b=gl+uqA2kl7zuFwV5TePemIo0DQEcWfPv8UfIe2BZj4pIVpJ8b2Epwkgn
   soldnsPyZQRKz+ylSGvJeWJ/0vxOW6NYtRXQcvjOic6hDCUbIi+APG5mQ
   2b3fgK6GiulssoBLzIcV9aCXJl1wh8Qtw6VL70RWkFXDGiyn7tYAqe448
   a3B28hIL+C9drG1Rwfe6UY7Mrm/E0MoCorTAbWwL4ngRm7NM7l6Ir1u1b
   u8U/bBJgKzABnlhgEnizFZX0N3F8+h3xedE26U5M3nEKeHOKwmuSyaZ0J
   Q5/d6askndZOW7KQr62eQnl90/ijM3oCtSrwE51I5Zm8cBD0aAETTzNIc
   w==;
X-CSE-ConnectionGUID: fg8JCRNYRwqWfh2fEgrQ9A==
X-CSE-MsgGUID: GEyEnncXRIW4YSTppSYSdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29529558"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="29529558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:44:37 -0700
X-CSE-ConnectionGUID: etKAFUFkTWCSGqjcpy9QsA==
X-CSE-MsgGUID: mBg5ekv3TsO9W1cIQwh45Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="88221940"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2024 04:44:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUPYo-000hCa-0W;
	Thu, 18 Jul 2024 11:44:34 +0000
Date: Thu, 18 Jul 2024 19:43:54 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-static-calls-v3 2/2] kernel/dma/mapping.c:831:28:
 error: implicit declaration of function 'dma_is_default_iommu'
Message-ID: <202407181930.ZVHuCaS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-static-calls-v3
head:   7eb55aeea773a5827b4c6ab06f77beed71254e44
commit: 7eb55aeea773a5827b4c6ab06f77beed71254e44 [2/2] dma: add IOMMU static calls with clear default ops
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240718/202407181930.ZVHuCaS3-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407181930.ZVHuCaS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407181930.ZVHuCaS3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/memblock.h:12,
                    from kernel/dma/mapping.c:8:
   kernel/dma/mapping.c: In function 'dma_supported':
>> kernel/dma/mapping.c:831:28: error: implicit declaration of function 'dma_is_default_iommu' [-Werror=implicit-function-declaration]
     831 |         if (WARN_ON(ops && dma_is_default_iommu(dev)))
         |                            ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   cc1: some warnings being treated as errors
--
>> kernel/dma/ops_helpers.c:61:14: error: redefinition of 'dma_common_alloc_pages'
      61 | struct page *dma_common_alloc_pages(struct device *dev, size_t size,
         |              ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/dma/ops_helpers.c:6:
   include/linux/dma-map-ops.h:166:1: note: previous definition of 'dma_common_alloc_pages' with type 'struct page *(struct device *, size_t,  dma_addr_t *, enum dma_data_direction,  gfp_t)' {aka 'struct page *(struct device *, long unsigned int,  long long unsigned int *, enum dma_data_direction,  unsigned int)'}
     166 | dma_common_alloc_pages(struct device *dev, size_t size, dma_addr_t *dma_handle,
         | ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/dma/ops_helpers.c:84:6: error: redefinition of 'dma_common_free_pages'
      84 | void dma_common_free_pages(struct device *dev, size_t size, struct page *page,
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-map-ops.h:171:20: note: previous definition of 'dma_common_free_pages' with type 'void(struct device *, size_t,  struct page *, dma_addr_t,  enum dma_data_direction)' {aka 'void(struct device *, long unsigned int,  struct page *, long long unsigned int,  enum dma_data_direction)'}
     171 | static inline void dma_common_free_pages(struct device *dev, size_t size,
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/dma_is_default_iommu +831 kernel/dma/mapping.c

   826	
   827	static int dma_supported(struct device *dev, u64 mask)
   828	{
   829		const struct dma_map_ops *ops = get_dma_ops(dev);
   830	
 > 831		if (WARN_ON(ops && dma_is_default_iommu(dev)))
   832			return false;
   833		/*
   834		 * ->dma_supported sets the bypass flag, so we must always call
   835		 * into the method here unless the device is truly direct mapped.
   836		 */
   837		if (!ops)
   838			return dma_direct_supported(dev, mask);
   839		if (!ops->dma_supported)
   840			return 1;
   841		return ops->dma_supported(dev, mask);
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
