Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2132D3A7D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752764878; cv=none; b=Dar2SCZAMBvnO54I6MT5zj/mpBIwRdL6v78Z+0Cpm2KyDYhnyaQQMcHJDGZYZ9rPmnJS0PWLZmmdGOgcW03pE7saq+G7G96CXZ/SaRuYzVlUcuvUcQhUYvLwr3qPxOFRKgmzkxrXXdRxwHeZVdiRGYU1xM5OhypVgJcIPesIMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752764878; c=relaxed/simple;
	bh=gDtbsHccbGCjgR2YEojc/A+klQME8+brY5v68iysq58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ToyxN1KgrP5Z3/ifESUjC7rgeTY8CzPNnQa0Gm551rNCZQi+E5oNyDAtB3iE8GcSAI1Pa7AjxBYn7ei1SfFBj5jNRmuS6Brj/JKIPuhI868zoGM5U2s9PvrtMBsPOJNPcgqsMby9+j4NYUYAlMNRUMHv9pqrE3qud0FHbCiOZ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9v51rq0; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9v51rq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752764877; x=1784300877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDtbsHccbGCjgR2YEojc/A+klQME8+brY5v68iysq58=;
  b=i9v51rq06qGQGoCOklBsoJOm1HtdPcm8RlKOT7irQXpDtXcy5zarSr83
   /Rt+G/06nnj4+Zr7TmzfRxP7WTEKfa8Rq560H5NR7ytzrodOQuxet9RGL
   sAm0ci99EHW1rsHJi/b7Pey0M1WY5lkX4b7K1DHqyenDgxK7m4tMfopAD
   9tnrarQBUeDlFqlujuji1af9BqAVUZj64XbjLovWQ7uianc7G8oqBRbaB
   HxdgSI78pibXKZdzMRGKCbpzNe3GsRFGSNPLgw6hEGRQ2tzPEu5f1rOSE
   dgPqI/rEb9uzTEjBajf5+1xyvZXNmOPLsWzaa1MP7nYamAGAqMOUE5+ql
   Q==;
X-CSE-ConnectionGUID: Av4imKMHSLy/zvAJCcS7wg==
X-CSE-MsgGUID: 5PRkaamHSDqnut3BzRVFEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55195164"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55195164"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 08:07:56 -0700
X-CSE-ConnectionGUID: Oez6G63uTii/XtWyc/7zXw==
X-CSE-MsgGUID: adQXDjSPQ4mUpDqzSG6BcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="181522588"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Jul 2025 08:07:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucQDA-000DkF-0i;
	Thu, 17 Jul 2025 15:07:52 +0000
Date: Thu, 17 Jul 2025 23:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>,
	Nitesh Shetty <nj.shetty@samsung.com>
Subject: [linux-nvme:nvme-6.17 8/8] drivers/nvme/host/pci.c:2086:26: error:
 passing argument 1 of '_dev_info' from incompatible pointer type
Message-ID: <202507172219.3GZVetEC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.17
head:   1ab5ce2790f41c2966a549eeafde8f3abd46d46d
commit: 1ab5ce2790f41c2966a549eeafde8f3abd46d46d [8/8] nvme-pci: try function level reset on init failure
config: csky-randconfig-001-20250717 (https://download.01.org/0day-ci/archive/20250717/202507172219.3GZVetEC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507172219.3GZVetEC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507172219.3GZVetEC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/nvme/host/pci.c:7:
   drivers/nvme/host/pci.c: In function 'nvme_pci_configure_admin_queue':
>> drivers/nvme/host/pci.c:2086:26: error: passing argument 1 of '_dev_info' from incompatible pointer type [-Wincompatible-pointer-types]
    2086 |                 dev_info(&dev->ctrl.device,
         |                          ^~~~~~~~~~~~~~~~~
         |                          |
         |                          struct device **
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/nvme/host/pci.c:2086:17: note: in expansion of macro 'dev_info'
    2086 |                 dev_info(&dev->ctrl.device,
         |                 ^~~~~~~~
   include/linux/dev_printk.h:56:37: note: expected 'const struct device *' but argument is of type 'struct device **'
      56 | void _dev_info(const struct device *dev, const char *fmt, ...);
         |                ~~~~~~~~~~~~~~~~~~~~~^~~


vim +/_dev_info +2086 drivers/nvme/host/pci.c

  2041	
  2042	static int nvme_pci_configure_admin_queue(struct nvme_dev *dev)
  2043	{
  2044		int result;
  2045		u32 aqa;
  2046		struct nvme_queue *nvmeq;
  2047	
  2048		result = nvme_remap_bar(dev, db_bar_size(dev, 0));
  2049		if (result < 0)
  2050			return result;
  2051	
  2052		dev->subsystem = readl(dev->bar + NVME_REG_VS) >= NVME_VS(1, 1, 0) ?
  2053					NVME_CAP_NSSRC(dev->ctrl.cap) : 0;
  2054	
  2055		if (dev->subsystem &&
  2056		    (readl(dev->bar + NVME_REG_CSTS) & NVME_CSTS_NSSRO))
  2057			writel(NVME_CSTS_NSSRO, dev->bar + NVME_REG_CSTS);
  2058	
  2059		/*
  2060		 * If the device has been passed off to us in an enabled state, just
  2061		 * clear the enabled bit.  The spec says we should set the 'shutdown
  2062		 * notification bits', but doing so may cause the device to complete
  2063		 * commands to the admin queue ... and we don't know what memory that
  2064		 * might be pointing at!
  2065		 */
  2066		result = nvme_disable_ctrl(&dev->ctrl, false);
  2067		if (result < 0) {
  2068			struct pci_dev *pdev = to_pci_dev(dev->dev);
  2069	
  2070			/*
  2071			 * The NVMe Controller Reset method did not get an expected
  2072			 * CSTS.RDY transition, so something with the device appears to
  2073			 * be stuck. Use the lower level and bigger hammer PCIe
  2074			 * Function Level Reset to attempt restoring the device to its
  2075			 * initial state, and try again.
  2076			 */
  2077			result = pcie_reset_flr(pdev, false);
  2078			if (result < 0)
  2079				return result;
  2080	
  2081			pci_restore_state(pdev);
  2082			result = nvme_disable_ctrl(&dev->ctrl, false);
  2083			if (result < 0)
  2084				return result;
  2085	
> 2086			dev_info(&dev->ctrl.device,
  2087				"controller reset completed after pcie flr\n");
  2088		}
  2089	
  2090		result = nvme_alloc_queue(dev, 0, NVME_AQ_DEPTH);
  2091		if (result)
  2092			return result;
  2093	
  2094		dev->ctrl.numa_node = dev_to_node(dev->dev);
  2095	
  2096		nvmeq = &dev->queues[0];
  2097		aqa = nvmeq->q_depth - 1;
  2098		aqa |= aqa << 16;
  2099	
  2100		writel(aqa, dev->bar + NVME_REG_AQA);
  2101		lo_hi_writeq(nvmeq->sq_dma_addr, dev->bar + NVME_REG_ASQ);
  2102		lo_hi_writeq(nvmeq->cq_dma_addr, dev->bar + NVME_REG_ACQ);
  2103	
  2104		result = nvme_enable_ctrl(&dev->ctrl);
  2105		if (result)
  2106			return result;
  2107	
  2108		nvmeq->cq_vector = 0;
  2109		nvme_init_queue(nvmeq, 0);
  2110		result = queue_request_irq(nvmeq);
  2111		if (result) {
  2112			dev->online_queues--;
  2113			return result;
  2114		}
  2115	
  2116		set_bit(NVMEQ_ENABLED, &nvmeq->flags);
  2117		return result;
  2118	}
  2119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
