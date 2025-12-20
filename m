Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3225A64C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238419; cv=none; b=T4PtDvUONJrTknD74zFbYT1R11pqVkp6SqoiZHyD+0mOmCHRFNOMTpU7/fsNOxSXIqGo+HJ+AnXX6g9z6xvPyI32dY/xXg4KEWZrK4u3UZgCEKXbrjAsDqE6EkuPUuSzXs+VzW4o9aFoEJQFBnQOpLxA/jRA5JBdBb3eXmmdPOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238419; c=relaxed/simple;
	bh=be4t7+fO9Wu+YvKRQO+8/5Z5bT2IEIiUDBeERoNzV1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlnZd10GqOX661EvcsSKHHnXBsJRyhGtsJGVo2CfQd00lyw25p6EvAukvSVAFmTudN1P3U8frTHIrpjhTQlG7hp0a1X25xDkYIC+ix0P1WR2+LImB0AbIztlY+EN3+NP7fmdEI/Sss7BG+L2FakamDnfX5xvbNe7LUDgjt+6WUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTeplMzR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTeplMzR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766238418; x=1797774418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=be4t7+fO9Wu+YvKRQO+8/5Z5bT2IEIiUDBeERoNzV1M=;
  b=CTeplMzR486ZB8K02++Qd+m/HV00VaO7opdGQpV39NjKwzh3jnLUZY73
   GXYPnlxKmEO4pSfGVF1OpMjjjdVaaVtjHK9x2ncqylryFvF1qFtRMlmci
   SiNonM88h3LtZUPUYJYnp15EijyhLIV0Y42q/gu+V+VSCwizb9Om7amS7
   y1Fgz/8aiiBbKSGp7RclYSkYNDCXU8YS4lyAwIlr7KKbSgApmDKxOLGYl
   qhQl6ei/ae0P655/eXRc/jzNZZzKM//Ba7jLWanZoEz02uf19IaFWFMJ5
   9rKSQ+nVDfhCiHd1ynPiZ905t+9i9zljYSgnW1x4Cqtp3D+W3yxqgLdri
   Q==;
X-CSE-ConnectionGUID: AefkAonOT7uVN4/u6ANOTQ==
X-CSE-MsgGUID: o6dxupBmRzKwfXzsH6wmcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68110709"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68110709"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:46:56 -0800
X-CSE-ConnectionGUID: ZzbW/rtuRiaZjozO7FEr5A==
X-CSE-MsgGUID: uesomd8RS7yufmIJUOtMxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198864809"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 05:46:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxIK-000000004Zx-3cMO;
	Sat, 20 Dec 2025 13:46:52 +0000
Date: Sat, 20 Dec 2025 21:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 7/8] vduse: add vq group asid support
Message-ID: <202512202109.xeEcmt60-lkp@intel.com>
References: <20251217112414.2374672-8-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217112414.2374672-8-eperezma@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-add-v1-API-definition/20251217-195729
base:   linus/master
patch link:    https://lore.kernel.org/r/20251217112414.2374672-8-eperezma%40redhat.com
patch subject: [PATCH v10 7/8] vduse: add vq group asid support
config: i386-randconfig-141-20251218 (https://download.01.org/0day-ci/archive/20251220/202512202109.xeEcmt60-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202109.xeEcmt60-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202109.xeEcmt60-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vdpa/vdpa_user/vduse_dev.c:983:26: warning: variable 'iova' is uninitialized when used here [-Wuninitialized]
     983 |         *dma_addr = (dma_addr_t)iova;
         |                                 ^~~~
   drivers/vdpa/vdpa_user/vduse_dev.c:972:20: note: initialize the variable 'iova' to silence this warning
     972 |         unsigned long iova;
         |                           ^
         |                            = 0
   1 warning generated.


vim +/iova +983 drivers/vdpa/vdpa_user/vduse_dev.c

   967	
   968	static void *vduse_dev_alloc_coherent(union virtio_map token, size_t size,
   969					      dma_addr_t *dma_addr, gfp_t flag)
   970	{
   971		struct vduse_iova_domain *domain;
   972		unsigned long iova;
   973		void *addr;
   974	
   975		*dma_addr = DMA_MAPPING_ERROR;
   976		if (!token.group)
   977			return NULL;
   978	
   979		addr = alloc_pages_exact(size, flag);
   980		if (!addr)
   981			return NULL;
   982	
 > 983		*dma_addr = (dma_addr_t)iova;
   984		read_lock(&token.group->as_lock);
   985		domain = token.group->as->domain;
   986		addr = vduse_domain_alloc_coherent(domain, size,
   987						   (dma_addr_t *)&iova, addr);
   988		if (!addr)
   989			goto err;
   990	
   991		*dma_addr = (dma_addr_t)iova;
   992		read_unlock(&token.group->as_lock);
   993	
   994		return addr;
   995	
   996	err:
   997		read_unlock(&token.group->as_lock);
   998		free_pages_exact(addr, size);
   999		return NULL;
  1000	}
  1001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
