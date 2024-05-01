Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83FA37E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 00:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714523164; cv=none; b=cCjViD/ca1aOdaOIx3Rm3S/aqV5+ch7XLVzHI1Oq7eWk8Z3I5qzhEZx7blrkZcxEBhwqC1w0CMYvB+GU2rrKYjODNfFsRwUOtftgCrVBpsFzUf3/FQYBZBZxtPs6rKH4jKRvFGGTX+E37UIHVeA6mcePNrMZQQjp5pvDZNhBYHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714523164; c=relaxed/simple;
	bh=+ocDhZDgrPgavn5mbvG8M6hcZsAGCa72I5P9E4koq7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lgm4HD0h8uWVNX1PRFqYUzYJ1U1MQU2FvllmUvSvF49Z17zSQtUhdrQgyShjGRIKmwx+p7vSp5kl/nz3b+qsVg1MU5xKjPVxxP6vPKB4X8vz4A9D0UsyRZmlmFNh10nlHxH+sVsSob/7096ZI1b/V7etgg9F5ctQ8aqEC+/6Mns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABrEx7VX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABrEx7VX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714523162; x=1746059162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ocDhZDgrPgavn5mbvG8M6hcZsAGCa72I5P9E4koq7w=;
  b=ABrEx7VXqDBv5U+BQD+95x6nSmWa2MusioyuYBw2lrKpIg7wqOa8Pk4T
   t1IdNvVnp1UCqn/ITABVdNogYN1eoGtBulHiYeqcfWmghMVOaL0nMG1ad
   GbmvJUVXUwb1oGCMQtSKxYc/GnL3/WbCyfoyy6Yh/3yU2Y/vfSIGe2Nz4
   BtQ0p8g+SUPH3D2RBQv9j1OM5Fd/42wwRTYQulN18dqJMWmAyDujY9aBm
   hfuiCO0cj4kPmrC3/cMYWO7JEAd897DsOcKR0bYcB2OPdL1kL6bHcvjQU
   RN1F401BnZQrqtkE11CiNgXDSycsKSTwG8LosANztT9RVd0F+Vs8w1nyi
   g==;
X-CSE-ConnectionGUID: Nj8N38FDS1WhXRchSFQJIQ==
X-CSE-MsgGUID: r3mHJElNTfWbRUryu+cW/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20942845"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="20942845"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 17:26:01 -0700
X-CSE-ConnectionGUID: Ln1rorcZRfCvSZcv1emdvg==
X-CSE-MsgGUID: 9BWxSSmqQ+Gc0qwgGj7m+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="57526397"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Apr 2024 17:26:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1xnJ-0008hT-1Y;
	Wed, 01 May 2024 00:25:57 +0000
Date: Wed, 1 May 2024 08:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 4/17] drivers/pci/p2pdma.c:967:33: error:
 static declaration of 'pci_p2pdma_map_type' follows non-static declaration
Message-ID: <202405010806.IrtWuj9Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9
commit: c9054c6f609d4d89977171559cd16e48e5fdb8b8 [4/17] dma-mapping: check if IOVA can be used
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405010806.IrtWuj9Y-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010806.IrtWuj9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010806.IrtWuj9Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/p2pdma.c:967:33: error: static declaration of 'pci_p2pdma_map_type' follows non-static declaration
     967 | static enum pci_p2pdma_map_type pci_p2pdma_map_type(struct dev_pagemap *pgmap,
         |                                 ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/p2pdma.c:13:
   include/linux/dma-map-ops.h:521:26: note: previous declaration of 'pci_p2pdma_map_type' with type 'enum pci_p2pdma_map_type(struct dev_pagemap *, struct device *)'
     521 | enum pci_p2pdma_map_type pci_p2pdma_map_type(struct dev_pagemap *pgmap,
         |                          ^~~~~~~~~~~~~~~~~~~


vim +/pci_p2pdma_map_type +967 drivers/pci/p2pdma.c

977196b8c5b20b Logan Gunthorpe 2018-10-04  966  
7e2faa1710c408 Logan Gunthorpe 2021-06-10 @967  static enum pci_p2pdma_map_type pci_p2pdma_map_type(struct dev_pagemap *pgmap,
7e2faa1710c408 Logan Gunthorpe 2021-06-10  968  						    struct device *dev)
5d52e1abcd4795 Logan Gunthorpe 2019-08-12  969  {
ae21f835a5bda0 Eric Dumazet    2021-07-01  970  	enum pci_p2pdma_map_type type = PCI_P2PDMA_MAP_NOT_SUPPORTED;
7e2faa1710c408 Logan Gunthorpe 2021-06-10  971  	struct pci_dev *provider = to_p2p_pgmap(pgmap)->provider;
7e2faa1710c408 Logan Gunthorpe 2021-06-10  972  	struct pci_dev *client;
ae21f835a5bda0 Eric Dumazet    2021-07-01  973  	struct pci_p2pdma *p2pdma;
719c98658058f4 Logan Gunthorpe 2022-07-08  974  	int dist;
7e2faa1710c408 Logan Gunthorpe 2021-06-10  975  
5d52e1abcd4795 Logan Gunthorpe 2019-08-12  976  	if (!provider->p2pdma)
5d52e1abcd4795 Logan Gunthorpe 2019-08-12  977  		return PCI_P2PDMA_MAP_NOT_SUPPORTED;
5d52e1abcd4795 Logan Gunthorpe 2019-08-12  978  
7e2faa1710c408 Logan Gunthorpe 2021-06-10  979  	if (!dev_is_pci(dev))
7e2faa1710c408 Logan Gunthorpe 2021-06-10  980  		return PCI_P2PDMA_MAP_NOT_SUPPORTED;
7e2faa1710c408 Logan Gunthorpe 2021-06-10  981  
7e2faa1710c408 Logan Gunthorpe 2021-06-10  982  	client = to_pci_dev(dev);
7e2faa1710c408 Logan Gunthorpe 2021-06-10  983  
ae21f835a5bda0 Eric Dumazet    2021-07-01  984  	rcu_read_lock();
ae21f835a5bda0 Eric Dumazet    2021-07-01  985  	p2pdma = rcu_dereference(provider->p2pdma);
ae21f835a5bda0 Eric Dumazet    2021-07-01  986  
ae21f835a5bda0 Eric Dumazet    2021-07-01  987  	if (p2pdma)
ae21f835a5bda0 Eric Dumazet    2021-07-01  988  		type = xa_to_value(xa_load(&p2pdma->map_types,
5d52e1abcd4795 Logan Gunthorpe 2019-08-12  989  					   map_types_idx(client)));
ae21f835a5bda0 Eric Dumazet    2021-07-01  990  	rcu_read_unlock();
719c98658058f4 Logan Gunthorpe 2022-07-08  991  
719c98658058f4 Logan Gunthorpe 2022-07-08  992  	if (type == PCI_P2PDMA_MAP_UNKNOWN)
719c98658058f4 Logan Gunthorpe 2022-07-08  993  		return calc_map_type_and_dist(provider, client, &dist, true);
719c98658058f4 Logan Gunthorpe 2022-07-08  994  
ae21f835a5bda0 Eric Dumazet    2021-07-01  995  	return type;
5d52e1abcd4795 Logan Gunthorpe 2019-08-12  996  }
5d52e1abcd4795 Logan Gunthorpe 2019-08-12  997  

:::::: The code at line 967 was first introduced by commit
:::::: 7e2faa1710c408712185bb6463eaa0ee4776350f PCI/P2PDMA: Refactor pci_p2pdma_map_type()

:::::: TO: Logan Gunthorpe <logang@deltatee.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
