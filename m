Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8D632
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 06:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721714663; cv=none; b=LlDupWDTb7fDlooPUozuYNcg4Hsq3B9lBU1OzSQCm0cF1gkVNKzKQ8aqqgRjxcIBruE1xIyIJgUWPwDsTqlkl2TllaGUT21E0pN5OagOnLDwMVw6pA6sJSCW344opjdOqRlDUK52Ygk6aHaFhuZOKhX+xb4VdyWY1tYtqXeYfL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721714663; c=relaxed/simple;
	bh=nL8tasrKACUJ02KLwLDRKnNwhOUocbIJHu7jQNv4kOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CsS3ZKAX203zYWzIifBSezqABWaoRE0tWC+uKYsDHSaPhBxecXFRRbFMiej3ytH0Rb8bWkq89M7BiIW5Z4Sh69hnEaGJlR9pLwJ75RrWvrSgxqYqW3kAaH0LlByg4zVw0XyzvRDOznhqCQPATLbkupxae3N6NgKZPkAZ1eNXn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEZt8Zt8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEZt8Zt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721714661; x=1753250661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nL8tasrKACUJ02KLwLDRKnNwhOUocbIJHu7jQNv4kOU=;
  b=EEZt8Zt82cdDn+CCZhhc/YJ7OY9dg5uk39ft//ocyPK4OvRuzqfJMrrO
   yzWnuY99M2sla6BxODZ2b4r1/kFpb6PxNPfEI+6k2INaQbDPVWprxw4S0
   CW5chPwjFAxj18JwO9c48ajSbpeEREhi0g0x5qlHlEaag+cxXUyiDfPfy
   Cyk5MgiPgEFyp6vFBiwQ8h6BOUynGxLrdZsI1mO6Wk3TPTarUZGOCishe
   CwJbtsUPvdtFMBZUtT2BycSzYzfO8bHQfBc60ZmxVT7Ef10nDePi4wt8y
   bs6dZu7wewuc+jaDf4zlWo0i3HMD+vvOLPuq151+my+wpvls6tSmL8PDF
   A==;
X-CSE-ConnectionGUID: q7/jXUVWSg2GtJG6AMjNzA==
X-CSE-MsgGUID: udrYcI1RQXCIpWdlWybVRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29936317"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="29936317"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 23:04:20 -0700
X-CSE-ConnectionGUID: ZBi48sEjRMeQCzKredv0XQ==
X-CSE-MsgGUID: D9DGlcx6TvSx8l8vHrZ5Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="52012009"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jul 2024 23:04:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW8dD-000lgq-2u;
	Tue, 23 Jul 2024 06:04:15 +0000
Date: Tue, 23 Jul 2024 14:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, tianx <tianx@yunsilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7645/10903]
 drivers/net/ethernet/yunsilicon/xsc/net/main.c:2628:14: error: no member
 named 'physfn' in 'struct pci_dev'
Message-ID: <202407231343.3uTyW1i0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b156200a7f2f34854751d767d9fa40f81be9f05c
commit: 601fb01dc16f747534b866610743d95830b6655e [7645/10903] drivers: support for xsc drivers from Yunsilicon Technology
config: arm64-randconfig-004-20240723 (https://download.01.org/0day-ci/archive/20240723/202407231343.3uTyW1i0-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231343.3uTyW1i0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231343.3uTyW1i0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/main.c:6:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1732:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
           if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:136:4: warning: no previous prototype for function 'xsc_devid_to_pcie_no' [-Wmissing-prototypes]
   u8 xsc_devid_to_pcie_no(int dev_id)
      ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u8 xsc_devid_to_pcie_no(int dev_id)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:288:5: warning: no previous prototype for function 'xsc_priv_init' [-Wmissing-prototypes]
   int xsc_priv_init(struct xsc_core_device *dev)
       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:288:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_priv_init(struct xsc_core_device *dev)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:302:5: warning: no previous prototype for function 'xsc_dev_res_init' [-Wmissing-prototypes]
   int xsc_dev_res_init(struct xsc_core_device *dev)
       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:302:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_dev_res_init(struct xsc_core_device *dev)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:321:6: warning: no previous prototype for function 'xsc_dev_res_cleanup' [-Wmissing-prototypes]
   void xsc_dev_res_cleanup(struct xsc_core_device *dev)
        ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:321:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_dev_res_cleanup(struct xsc_core_device *dev)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:327:6: warning: no previous prototype for function 'xsc_init_reg_addr' [-Wmissing-prototypes]
   void xsc_init_reg_addr(struct xsc_core_device *dev)
        ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:327:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_init_reg_addr(struct xsc_core_device *dev)
   ^
   static 
>> drivers/net/ethernet/yunsilicon/xsc/pci/main.c:412:8: error: call to undeclared function 'pci_request_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           err = pci_request_region(pdev, bar_num, name);
                 ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:412:8: note: did you mean 'pci_request_regions'?
   include/linux/pci.h:2048:19: note: 'pci_request_regions' declared here
   static inline int pci_request_regions(struct pci_dev *dev, const char *res_name)
                     ^
>> drivers/net/ethernet/yunsilicon/xsc/pci/main.c:454:2: error: call to undeclared function 'pci_release_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_release_region(pdev, bar_num);
           ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:454:2: note: did you mean 'pci_release_regions'?
   include/linux/pci.h:2050:20: note: 'pci_release_regions' declared here
   static inline void pci_release_regions(struct pci_dev *dev) { }
                      ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:475:2: error: call to undeclared function 'pci_release_region'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_release_region(pdev, dev->bar_num);
           ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:518:5: warning: no previous prototype for function 'xsc_reset_function_resource' [-Wmissing-prototypes]
   int xsc_reset_function_resource(struct xsc_core_device *dev)
       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:518:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_reset_function_resource(struct xsc_core_device *dev)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:612:19: error: no member named 'physfn' in 'struct pci_dev'
                   if (!dev->pdev->physfn) {
                        ~~~~~~~~~  ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:718:5: warning: no previous prototype for function 'xsc_load_one' [-Wmissing-prototypes]
   int xsc_load_one(struct xsc_core_device *dev, bool boot)
       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:718:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_load_one(struct xsc_core_device *dev, bool boot)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:796:5: warning: no previous prototype for function 'xsc_unload_one' [-Wmissing-prototypes]
   int xsc_unload_one(struct xsc_core_device *dev, bool cleanup)
       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/main.c:796:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_unload_one(struct xsc_core_device *dev, bool cleanup)
   ^
   static 
   9 warnings and 4 errors generated.
--
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:16:
   In file included from drivers/net/ethernet/yunsilicon/xsc/common/driver.h:18:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1732:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
           if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:913:17: error: call to undeclared function 'dma_pool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           mailbox->buf = dma_pool_alloc(xdev->cmd.pool, flags,
                          ^
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:913:17: note: did you mean 'mempool_alloc'?
   include/linux/mempool.h:57:14: note: 'mempool_alloc' declared here
   extern void *mempool_alloc(mempool_t *pool, gfp_t gfp_mask) __malloc;
                ^
>> drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:913:15: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
           mailbox->buf = dma_pool_alloc(xdev->cmd.pool, flags,
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:929:2: error: call to undeclared function 'dma_pool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           dma_pool_free(xdev->cmd.pool, mailbox->buf, mailbox->dma);
           ^
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:929:2: note: did you mean 'mempool_free'?
   include/linux/mempool.h:58:13: note: 'mempool_free' declared here
   extern void mempool_free(void *element, mempool_t *pool);
               ^
>> drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:1846:14: error: call to undeclared function 'dma_pool_create'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cmd->pool = dma_pool_create("xsc_cmd", &xdev->pdev->dev, size, align, 0);
                       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:1846:14: note: did you mean 'mempool_create'?
   include/linux/mempool.h:49:19: note: 'mempool_create' declared here
   extern mempool_t *mempool_create(int min_nr, mempool_alloc_t *alloc_fn,
                     ^
>> drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:1846:12: error: incompatible integer to pointer conversion assigning to 'struct dma_pool *' from 'int' [-Wint-conversion]
           cmd->pool = dma_pool_create("xsc_cmd", &xdev->pdev->dev, size, align, 0);
                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:2015:2: error: call to undeclared function 'dma_pool_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           dma_pool_destroy(cmd->pool);
           ^
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:2015:2: note: did you mean 'mempool_destroy'?
   include/linux/mempool.h:56:13: note: 'mempool_destroy' declared here
   extern void mempool_destroy(mempool_t *pool);
               ^
   drivers/net/ethernet/yunsilicon/xsc/pci/cmd2.c:2036:2: error: call to undeclared function 'dma_pool_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           dma_pool_destroy(cmd->pool);
           ^
   1 warning and 7 errors generated.
--
   In file included from drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:11:
   In file included from drivers/net/ethernet/yunsilicon/xsc/common/driver.h:18:
   drivers/net/ethernet/yunsilicon/xsc/common/xsc_core.h:1732:32: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
           if (dev->caps.hw_feature_flag | XSC_HW_RDMA_SUPPORT)
               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:558:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_free_irq_vectors(dev->pdev);
           ^
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:558:2: note: did you mean 'pci_alloc_irq_vectors'?
   include/linux/pci.h:2100:1: note: 'pci_alloc_irq_vectors' declared here
   pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
   ^
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:616:2: error: call to undeclared function 'pci_free_irq_vectors'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           pci_free_irq_vectors(dev->pdev);
           ^
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:721:5: warning: no previous prototype for function 'xsc_request_irq_for_cmdq' [-Wmissing-prototypes]
   int xsc_request_irq_for_cmdq(struct xsc_core_device *dev, u8 vecidx)
       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:721:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_request_irq_for_cmdq(struct xsc_core_device *dev, u8 vecidx)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:734:6: warning: no previous prototype for function 'xsc_free_irq_for_cmdq' [-Wmissing-prototypes]
   void xsc_free_irq_for_cmdq(struct xsc_core_device *dev)
        ^
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:734:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_free_irq_for_cmdq(struct xsc_core_device *dev)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:756:5: warning: no previous prototype for function 'xsc_request_irq_for_event' [-Wmissing-prototypes]
   int xsc_request_irq_for_event(struct xsc_core_device *dev)
       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:756:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_request_irq_for_event(struct xsc_core_device *dev)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:767:6: warning: no previous prototype for function 'xsc_free_irq_for_event' [-Wmissing-prototypes]
   void xsc_free_irq_for_event(struct xsc_core_device *dev)
        ^
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:767:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_free_irq_for_event(struct xsc_core_device *dev)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:773:5: warning: no previous prototype for function 'xsc_cmd_enable_msix' [-Wmissing-prototypes]
   int xsc_cmd_enable_msix(struct xsc_core_device *xdev)
       ^
   drivers/net/ethernet/yunsilicon/xsc/pci/pci_irq.c:773:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_cmd_enable_msix(struct xsc_core_device *xdev)
   ^
   static 
   6 warnings and 2 errors generated.
--
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1707:6: warning: no previous prototype for function 'xsc_eth_deactivate_priv_channels' [-Wmissing-prototypes]
   void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1707:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_eth_deactivate_priv_channels(struct xsc_adapter *adapter)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1850:5: warning: no previous prototype for function 'xsc_eth_change_link_status' [-Wmissing-prototypes]
   int xsc_eth_change_link_status(struct xsc_adapter *adapter)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1850:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_eth_change_link_status(struct xsc_adapter *adapter)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1907:6: warning: no previous prototype for function 'xsc_eth_event_handler' [-Wmissing-prototypes]
   void xsc_eth_event_handler(void *arg)
        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1907:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_eth_event_handler(void *arg)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1915:5: warning: no previous prototype for function 'xsc_eth_enable_nic_hca' [-Wmissing-prototypes]
   int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1915:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_eth_enable_nic_hca(struct xsc_adapter *adapter)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1977:5: warning: no previous prototype for function 'xsc_eth_disable_nic_hca' [-Wmissing-prototypes]
   int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:1977:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_eth_disable_nic_hca(struct xsc_adapter *adapter)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2010:6: warning: no previous prototype for function 'xsc_eth_rss_params_change' [-Wmissing-prototypes]
   void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2010:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_eth_rss_params_change(struct xsc_adapter *adapter, u32 change, void *modify)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2318:6: warning: no previous prototype for function 'xsc_build_default_indir_rqt' [-Wmissing-prototypes]
   void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2318:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_build_default_indir_rqt(u32 *indirection_rqt, int len,
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2416:5: warning: no previous prototype for function 'xsc_eth_nic_mtu_changed' [-Wmissing-prototypes]
   int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2416:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_eth_nic_mtu_changed(struct xsc_adapter *priv)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2479:5: warning: no previous prototype for function 'xsc_set_vf_mac' [-Wmissing-prototypes]
   int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2479:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_set_vf_mac(struct net_device *netdev, int vf, u8 *mac)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2496:5: warning: no previous prototype for function 'xsc_get_vf_config' [-Wmissing-prototypes]
   int xsc_get_vf_config(struct net_device *dev,
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2496:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_get_vf_config(struct net_device *dev,
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2512:5: warning: no previous prototype for function 'set_feature_rxcsum' [-Wmissing-prototypes]
   int set_feature_rxcsum(struct net_device *netdev, bool enable)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2512:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_feature_rxcsum(struct net_device *netdev, bool enable)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2564:5: warning: no previous prototype for function 'xsc_eth_set_features' [-Wmissing-prototypes]
   int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2564:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_eth_set_features(struct net_device *netdev, netdev_features_t features)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2581:5: warning: no previous prototype for function 'xsc_select_queue' [-Wmissing-prototypes]
   u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2581:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u16 xsc_select_queue(struct net_device *dev, struct sk_buff *skb,
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2590:10: warning: variable 'txq_ix' is uninitialized when used here [-Wuninitialized]
                   return txq_ix;
                          ^~~~~~
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2584:12: note: initialize the variable 'txq_ix' to silence this warning
           int txq_ix, up = 0;
                     ^
                      = 0
>> drivers/net/ethernet/yunsilicon/xsc/net/main.c:2628:14: error: no member named 'physfn' in 'struct pci_dev'
                   if (!pdev->physfn)
                        ~~~~  ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2630:35: error: no member named 'physfn' in 'struct pci_dev'
                   pf_xdev = pci_get_drvdata(pdev->physfn);
                                             ~~~~  ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2769:24: warning: no previous prototype for function 'xsc_tirc_get_default_config' [-Wmissing-prototypes]
   struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
                          ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2769:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct xsc_tirc_config xsc_tirc_get_default_config(enum xsc_traffic_types tt)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2774:6: warning: no previous prototype for function 'xsc_build_rss_params' [-Wmissing-prototypes]
   void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2774:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_build_rss_params(struct xsc_rss_params *rss_params, u16 num_channels)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2792:6: warning: no previous prototype for function 'xsc_eth_build_nic_params' [-Wmissing-prototypes]
   void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2792:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_eth_build_nic_params(struct xsc_adapter *adapter, u32 ch_num, u32 tc_num)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2814:6: warning: no previous prototype for function 'xsc_eth_build_nic_netdev' [-Wmissing-prototypes]
   void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
        ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2814:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void xsc_eth_build_nic_netdev(struct xsc_adapter *adapter)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2885:5: warning: no previous prototype for function 'xsc_eth_create_xdev_resources' [-Wmissing-prototypes]
   int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2885:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_eth_create_xdev_resources(struct xsc_core_device *xdev)
   ^
   static 
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2906:5: warning: no previous prototype for function 'xsc_eth_init_nic_rx' [-Wmissing-prototypes]
   int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
       ^
   drivers/net/ethernet/yunsilicon/xsc/net/main.c:2906:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xsc_eth_init_nic_rx(struct xsc_adapter *adapter)
   ^
   static 
   47 warnings and 2 errors generated.


vim +2628 drivers/net/ethernet/yunsilicon/xsc/net/main.c

  2614	
  2615	static int xsc_get_phys_port_name(struct net_device *dev,
  2616					  char *buf, size_t len)
  2617	{
  2618		struct xsc_adapter *adapter = netdev_priv(dev);
  2619		struct xsc_core_device *xdev = adapter->xdev;
  2620		struct xsc_core_device *pf_xdev;
  2621		struct net_device *pf_netdev;
  2622		struct pci_dev *pdev = xdev->pdev;
  2623		int ret = len;
  2624	
  2625		if (!pdev)
  2626			return -EOPNOTSUPP;
  2627		if (!xsc_core_is_pf(xdev)) {
> 2628			if (!pdev->physfn)
  2629				return -EOPNOTSUPP;
  2630			pf_xdev = pci_get_drvdata(pdev->physfn);
  2631			if (!pf_xdev || !pf_xdev->netdev)
  2632				return -EOPNOTSUPP;
  2633			pf_netdev = (struct net_device *)pf_xdev->netdev;
  2634			ret = snprintf(buf, len, "%s_%d",
  2635				       pf_netdev->name, xdev->vf_id);
  2636		} else {
  2637			return -EOPNOTSUPP;
  2638		}
  2639		if (ret >= len)
  2640			return -EOPNOTSUPP;
  2641	
  2642		return 0;
  2643	}
  2644	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
