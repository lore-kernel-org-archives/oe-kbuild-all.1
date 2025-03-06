Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65A61DDC1A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741247728; cv=none; b=t5rpTn+y7BJpYy6urJ3icC+AsFl3ECyXHkyOBDIIpejdVOzkpGArV/xGKMYnW3QRm83kvRAxidw8ITU1nphGXDf5X8SzvFMVAXJ5AtlIOcyPtElhwpdVUS6cpGvu6yXusIXkwSzdBd4hQF8eE3jInzlR77d+h0j7SGx5muUboPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741247728; c=relaxed/simple;
	bh=DAEaNoQrrefk1KVsILaswnCNQblwgLzm3UI53hv0slE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lHvxrm6MsWLWl5l2KkY9f/1QZLnY8OBPCJR+iIFiMhbj1O9zQ+LrOwYf/bEcylW/kVdAigFihEvUIgp241/qWj/Vz5D7axrAFhBTKdm3CecqU4BAlPtotS7qIzxnmF9AVXul8NjHtlRvQHe1HPMEc6Dj0EHPGayMA0hSAsA1sv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqaRzSq5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqaRzSq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741247727; x=1772783727;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DAEaNoQrrefk1KVsILaswnCNQblwgLzm3UI53hv0slE=;
  b=fqaRzSq55GTA4GKQhAFUkgrskD0F6WHuV4JfaqEtJ/YwCMBPOQocUYkq
   cvRjGw3I3Zru9iV/qa7hRI9OFzzJbBk/z1z2qj0/Mt2w7TDeQE7qsotmO
   BWnH7qjqQZZr3zBJsSciDUaEuIMrC3uy7afrIWvu7/5eLyhlYBm62F68Y
   p8XTH8rzLXJxNpqVNz184TEYEqAIaszhUhHrkLJBLWDM+wqPKpO48KOP2
   LCek5HtFAOKHD7T90cXrLyFhIwKNJLq2hq+Q655uC1+c15cwNt6CugUb3
   AgOGJEYq8yg8nVH/rLBzfW7s5gvYbK4ZUJUQH4fzQKNT8+be+743hlDDJ
   g==;
X-CSE-ConnectionGUID: jV21OcrRT4yF0lnjg5KTcw==
X-CSE-MsgGUID: IDdvLV1rTum9pLHfSTz8Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42381322"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="42381322"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 23:55:26 -0800
X-CSE-ConnectionGUID: T2XJo3jeSUKwNIt8Zq269Q==
X-CSE-MsgGUID: ob5gxQsXSDKaEnC132NKWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="123893991"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2025 23:55:24 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq64T-000MjE-2R;
	Thu, 06 Mar 2025 07:55:14 +0000
Date: Thu, 6 Mar 2025 15:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 58/88] drivers/irqchip/irq-bcm2712-mip.c:176:18:
 error: implicit declaration of function 'irq_domain_add_hierarchy'; did you
 mean 'irq_domain_is_hierarchy'?
Message-ID: <202503061556.HccsV1hC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   321d82b640b78daba94d863283761c8fe95d17d7
commit: 8d66c27c234bf9534a511284ec6c44cb4e7db588 [58/88] drop irq_domain_add_hierarchy
config: arm64-randconfig-001-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061556.HccsV1hC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061556.HccsV1hC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061556.HccsV1hC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-bcm2712-mip.c: In function 'mip_init_domains':
>> drivers/irqchip/irq-bcm2712-mip.c:176:18: error: implicit declaration of function 'irq_domain_add_hierarchy'; did you mean 'irq_domain_is_hierarchy'? [-Wimplicit-function-declaration]
     176 |         middle = irq_domain_add_hierarchy(mip->parent, 0, mip->num_msis, np,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
         |                  irq_domain_is_hierarchy
>> drivers/irqchip/irq-bcm2712-mip.c:176:16: error: assignment to 'struct irq_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     176 |         middle = irq_domain_add_hierarchy(mip->parent, 0, mip->num_msis, np,
         |                ^


vim +176 drivers/irqchip/irq-bcm2712-mip.c

32c6c054661a9b Stanimir Varbanov 2025-02-24  171  
32c6c054661a9b Stanimir Varbanov 2025-02-24  172  static int mip_init_domains(struct mip_priv *mip, struct device_node *np)
32c6c054661a9b Stanimir Varbanov 2025-02-24  173  {
32c6c054661a9b Stanimir Varbanov 2025-02-24  174  	struct irq_domain *middle;
32c6c054661a9b Stanimir Varbanov 2025-02-24  175  
32c6c054661a9b Stanimir Varbanov 2025-02-24 @176  	middle = irq_domain_add_hierarchy(mip->parent, 0, mip->num_msis, np,
32c6c054661a9b Stanimir Varbanov 2025-02-24  177  					  &mip_middle_domain_ops, mip);
32c6c054661a9b Stanimir Varbanov 2025-02-24  178  	if (!middle)
32c6c054661a9b Stanimir Varbanov 2025-02-24  179  		return -ENOMEM;
32c6c054661a9b Stanimir Varbanov 2025-02-24  180  
32c6c054661a9b Stanimir Varbanov 2025-02-24  181  	irq_domain_update_bus_token(middle, DOMAIN_BUS_GENERIC_MSI);
32c6c054661a9b Stanimir Varbanov 2025-02-24  182  	middle->dev = mip->dev;
32c6c054661a9b Stanimir Varbanov 2025-02-24  183  	middle->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
32c6c054661a9b Stanimir Varbanov 2025-02-24  184  	middle->msi_parent_ops = &mip_msi_parent_ops;
32c6c054661a9b Stanimir Varbanov 2025-02-24  185  
32c6c054661a9b Stanimir Varbanov 2025-02-24  186  	/*
32c6c054661a9b Stanimir Varbanov 2025-02-24  187  	 * All MSI-X unmasked for the host, masked for the VPU, and edge-triggered.
32c6c054661a9b Stanimir Varbanov 2025-02-24  188  	 */
32c6c054661a9b Stanimir Varbanov 2025-02-24  189  	writel(0, mip->base + MIP_INT_MASKL_HOST);
32c6c054661a9b Stanimir Varbanov 2025-02-24  190  	writel(0, mip->base + MIP_INT_MASKH_HOST);
32c6c054661a9b Stanimir Varbanov 2025-02-24  191  	writel(~0, mip->base + MIP_INT_MASKL_VPU);
32c6c054661a9b Stanimir Varbanov 2025-02-24  192  	writel(~0, mip->base + MIP_INT_MASKH_VPU);
32c6c054661a9b Stanimir Varbanov 2025-02-24  193  	writel(~0, mip->base + MIP_INT_CFGL_HOST);
32c6c054661a9b Stanimir Varbanov 2025-02-24  194  	writel(~0, mip->base + MIP_INT_CFGH_HOST);
32c6c054661a9b Stanimir Varbanov 2025-02-24  195  
32c6c054661a9b Stanimir Varbanov 2025-02-24  196  	return 0;
32c6c054661a9b Stanimir Varbanov 2025-02-24  197  }
32c6c054661a9b Stanimir Varbanov 2025-02-24  198  

:::::: The code at line 176 was first introduced by commit
:::::: 32c6c054661a9b454837e3df409e9bd8fe9ba5f9 irqchip: Add Broadcom BCM2712 MSI-X interrupt controller

:::::: TO: Stanimir Varbanov <svarbanov@suse.de>
:::::: CC: Krzysztof Wilczyński <kwilczynski@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
