Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFA2E628
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 21:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189184; cv=none; b=PH0fPnNxO7P4+NUi/5cG3koekVyI7LauZZ4Vw5jcBuCnI84MpQTG+6aeZ2kjNwclnCVcbdsoalhcZuZcLNtl1L6+Tjn9YHE5huUt4XTcBD/Ii1IaBeJtVsIHu9luIToljcJlfm92Nsojg3CNivsg1K1hx+Jl7Ho4wp+Flo90DTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189184; c=relaxed/simple;
	bh=BP7fMSF3wq1EQHSaMVDRB4Bwss9dswVYErBAmvQFI5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+GhAz90GRQX70WeJ5C7xdTXsmaEwoPX45XHa+p+MLkbn7Fh9rqgYUHrfwq65HAQXLLu6t92gaLgXH4JSd4Zj3iSfZjCuKP5W5b8tKO3I4Dobtb/zdL6sMfBOPjBSraQl6oBYEb66iBIAHV0295g/t49YvMcvKgTgQMw0pgzC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNs6Irvv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNs6Irvv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731189183; x=1762725183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BP7fMSF3wq1EQHSaMVDRB4Bwss9dswVYErBAmvQFI5s=;
  b=HNs6IrvvTb42s3xsT6Vot10yDbrNRu9jM68Cg+Sdxq3f0+/RrykIE0zi
   ALiiuaijCN72rDcj9djLYZCPh/sq29Pv6NaoNul1HCnmiSK3g7FpoWMzo
   37agZddskl7pWK67qUc5XPpoDVVVh+FEUqxFnzw+wDZuTwwG5hvXslhtn
   dBG/ufrXqY3oKau5rA3dtuT0orX5mvopVoLGxJiREO/ov0e5Ctp6/NfK/
   nvUDkwdXh5m/AnxCkQANgmBZKcSYyrL1mOCZFmCqUHtbHEy79EobRVaVD
   fNf7wJfcGJMFPPQ+/KRKnOF0SV4gg/h/fyesnl1kRQkPOW1yQBxTy6R9c
   Q==;
X-CSE-ConnectionGUID: PlWgBUQZTNaL2Uom+OOn+A==
X-CSE-MsgGUID: v6S6orNnSxqnvoouKwi/Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="34830190"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="34830190"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 13:53:02 -0800
X-CSE-ConnectionGUID: sOlffzc4Rt295WyrbhtSLg==
X-CSE-MsgGUID: UDIuRe8yQVule1ExudcHLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86981540"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Nov 2024 13:53:01 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9tO6-000sfq-1e;
	Sat, 09 Nov 2024 21:52:58 +0000
Date: Sun, 10 Nov 2024 05:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFCv1 6/7] PCI/MSI: Add pci_alloc_irq_vectors_iovas helper
Message-ID: <202411100427.zzpAjWnY-lkp@intel.com>
References: <e9399426b08b16efbdf7224c0122f5bf80f6d0ea.1731130093.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9399426b08b16efbdf7224c0122f5bf80f6d0ea.1731130093.git.nicolinc@nvidia.com>

Hi Nicolin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus awilliam-vfio/next tip/irq/core linus/master awilliam-vfio/for-linus v6.12-rc6 next-20241108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/genirq-msi-Allow-preset-IOVA-in-struct-msi_desc-for-MSI-doorbell-address/20241109-135311
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/e9399426b08b16efbdf7224c0122f5bf80f6d0ea.1731130093.git.nicolinc%40nvidia.com
patch subject: [PATCH RFCv1 6/7] PCI/MSI: Add pci_alloc_irq_vectors_iovas helper
config: i386-randconfig-141-20241110 (https://download.01.org/0day-ci/archive/20241110/202411100427.zzpAjWnY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100427.zzpAjWnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100427.zzpAjWnY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/e1000/e1000_main.c:4:
   In file included from drivers/net/ethernet/intel/e1000/e1000.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/ethernet/intel/e1000/e1000_main.c:4:
   In file included from drivers/net/ethernet/intel/e1000/e1000.h:16:
>> include/linux/pci.h:1719:2: error: expected function body after function declarator
    1719 |         return -ENOSPC; /* No support if !CONFIG_PCI_MSI */
         |         ^
>> include/linux/pci.h:1720:1: error: extraneous closing brace ('}')
    1720 | }
         | ^
   drivers/net/ethernet/intel/e1000/e1000_main.c:999:45: warning: shift count >= width of type [-Wshift-count-overflow]
     999 |             !dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64))) {
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   2 warnings and 2 errors generated.
--
   In file included from drivers/net/ethernet/intel/e1000/e1000_hw.c:9:
   In file included from drivers/net/ethernet/intel/e1000/e1000.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/net/ethernet/intel/e1000/e1000_hw.c:9:
   In file included from drivers/net/ethernet/intel/e1000/e1000.h:16:
>> include/linux/pci.h:1719:2: error: expected function body after function declarator
    1719 |         return -ENOSPC; /* No support if !CONFIG_PCI_MSI */
         |         ^
>> include/linux/pci.h:1720:1: error: extraneous closing brace ('}')
    1720 | }
         | ^
   1 warning and 2 errors generated.


vim +1719 include/linux/pci.h

  1704	
  1705	static inline int
  1706	pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
  1707				       unsigned int max_vecs, unsigned int flags,
  1708				       struct irq_affinity *aff_desc)
  1709	{
  1710		if ((flags & PCI_IRQ_INTX) && min_vecs == 1 && dev->irq)
  1711			return 1;
  1712		return -ENOSPC;
  1713	}
  1714	static inline int
  1715	pci_alloc_irq_vectors_iovas(struct pci_dev *dev, unsigned int min_vecs,
  1716				    unsigned int max_vecs, unsigned int flags,
  1717				    dma_addr_t *msi_iovas)
  1718	
> 1719		return -ENOSPC; /* No support if !CONFIG_PCI_MSI */
> 1720	}
  1721	static inline int
  1722	pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
  1723			      unsigned int max_vecs, unsigned int flags)
  1724	{
  1725		return pci_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
  1726						      flags, NULL);
  1727	}
  1728	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
