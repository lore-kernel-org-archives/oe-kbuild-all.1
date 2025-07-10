Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1EB291C0E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140692; cv=none; b=bD1ZX7prg5gA2dlXWacmzjrD8/oqpk2JtNJWNkMnYqW103sec1qf8IXbYkOl6gEcNmfx66KN2GqkyBTJtNsjz5eQ35mOXp0/K8BcEsgKwbeK2qfaNV9yN6Wri1tU6MfVEelXd2Do5pm4g8sw84yXKOlPiyOjy6KFlWI/whYMeWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140692; c=relaxed/simple;
	bh=6SwpX44RUlVO1OaOkxgiZ2BY0E+cUR7S0bjhyDCXfKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgreXwFomtKRjez7wUy6+uj32XrCJ/Ck4+i3gT1xqVpsYEupdFBKUppWVhiGBAc3msZrtsQBAFyDWcgPPKxsZEELF+TOJsa4gXaUqd/JUW8vqv2U4QqYQCBTWBMvBWJuDGoNbtnN6IbSQuOjt0nnluNK+PT0R4tIeLNbaL9c1Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyrFdI1V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyrFdI1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752140691; x=1783676691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6SwpX44RUlVO1OaOkxgiZ2BY0E+cUR7S0bjhyDCXfKY=;
  b=EyrFdI1VdQSsAC6wMcI/rZNHXMF3NjA3Y995zugkGRmYFh6PQCL+KXpa
   44NYF5i4G0TMTFB0bTfumCeUrEQr99jIgmo+hn7lbD/O2XivNZqspcBf4
   CkZOySirzF/t0LrWpMJCy/UhV0qPTSyKN/sKZjjcVjI8S2cV/AQfgb+hW
   rAdX/qSl8ArZKhflXLoaHfzA1ejNrLyI7NcugVUMDMVP9/cUN2uCue/eg
   CtVp0/p2X9Z9W9PWvgXk15eXeTjZ7LKcs9A+nh5NhAAssCT1Ux6LN1WiO
   WS0rQq7AoBnAcO6W8Wz3r3x8ZD0ot5dNvuld1+vJptWzUhqLEWNhrnGrU
   w==;
X-CSE-ConnectionGUID: +vYu/jLUSL+fnYNxqgXSew==
X-CSE-MsgGUID: 7VEJr1J4TMemUkoYIv08dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65766958"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="65766958"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 02:44:50 -0700
X-CSE-ConnectionGUID: tZmkJZ4ZRXSO817z6StuyA==
X-CSE-MsgGUID: wlzcQwfcTM20syhiGagvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160351166"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 02:44:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZnpe-0004sN-39;
	Thu, 10 Jul 2025 09:44:46 +0000
Date: Thu, 10 Jul 2025 17:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 11/16] drivers/pci/p2pdma.c:977:28: warning:
 declaration of 'struct pci_Dev' will not be visible outside of this function
Message-ID: <202507101704.aThdDBSt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   76398694a39d0be3b1e8a107e4dd025cfd1448fd
commit: 07f78ef067ca643ea92cf0c95e25cd3c40420b03 [11/16] PCI/P2PDMA: Move to higher level PCI device pointer calculation
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250710/202507101704.aThdDBSt-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101704.aThdDBSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101704.aThdDBSt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/p2pdma.c:977:28: warning: declaration of 'struct pci_Dev' will not be visible outside of this function [-Wvisibility]
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:984:31: error: incomplete definition of type 'struct pci_Dev'
     984 |         p2pdma = rcu_dereference(pdev->p2pdma);
         |                                  ~~~~^
   drivers/pci/p2pdma.c:977:28: note: forward declaration of 'struct pci_Dev'
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                            ^
   drivers/pci/p2pdma.c:992:33: error: incompatible pointer types passing 'struct pci_Dev *' to parameter of type 'struct pci_dev *' [-Werror,-Wincompatible-pointer-types]
     992 |                 return calc_map_type_and_dist(pdev, client, &dist, true);
         |                                               ^~~~
   drivers/pci/p2pdma.c:584:40: note: passing argument to parameter 'provider' here
     584 | calc_map_type_and_dist(struct pci_dev *provider, struct pci_dev *client,
         |                                        ^
   drivers/pci/p2pdma.c:1002:18: error: redefinition of 'client'
    1002 |         struct pci_dev *client;
         |                         ^
   drivers/pci/p2pdma.c:998:27: note: previous definition is here
     998 |                                struct pci_dev *client, struct page *page)
         |                                                ^
   drivers/pci/p2pdma.c:1010:35: error: incompatible pointer types passing 'struct pci_dev *' to parameter of type 'struct pci_Dev *' [-Werror,-Wincompatible-pointer-types]
    1010 |         state->map = pci_p2pdma_map_type(pdev, client);
         |                                          ^~~~
   drivers/pci/p2pdma.c:977:37: note: passing argument to parameter 'pdev' here
     977 | pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
         |                                     ^
   1 warning and 14 errors generated.


vim +977 drivers/pci/p2pdma.c

   975	
   976	static enum pci_p2pdma_map_type
 > 977	pci_p2pdma_map_type(struct pci_Dev *pdev, struct pci_dev *client)
   978	{
   979		enum pci_p2pdma_map_type type = PCI_P2PDMA_MAP_NOT_SUPPORTED;
   980		struct pci_p2pdma *p2pdma;
   981		int dist;
   982	
   983		rcu_read_lock();
   984		p2pdma = rcu_dereference(pdev->p2pdma);
   985	
   986		if (p2pdma)
   987			type = xa_to_value(xa_load(&p2pdma->map_types,
   988						   map_types_idx(client)));
   989		rcu_read_unlock();
   990	
   991		if (type == PCI_P2PDMA_MAP_UNKNOWN)
   992			return calc_map_type_and_dist(pdev, client, &dist, true);
   993	
   994		return type;
   995	}
   996	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
