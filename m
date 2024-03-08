Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5405B5D9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709928605; cv=none; b=DlLVvEmG0rEX5vxvoozuPKW7goAgjJSPpGBNEd1H6KxkdMnXS8Fyc+EW9lMZgAiaZk0ReLSLppYpgEtJ0ntovxBRpzixLAw18SgcN/tdGa5KtCMewClBACF8LVmBmq142sK6fuK9fluXX1URa3o+6bcgLPNwm5Dd01/hk/xvppk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709928605; c=relaxed/simple;
	bh=PTE/rMEMEqDj8cKzSKUnVECPVqeBvk/P/dIn3O1Gs7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gf1ZW+CGGaJjg9J0mWd2cJ1LVdJM+m82RaYk97NRH+KFGbUf1rpF7H545JANzJ++EmIp59jBLBMQTew/jOvYNIMGZZgKJM2ZX5nzhhGDyCIoDAc103hjHqlbCbEB6s4oEPGZ3hl6lmfhvLuRzfwTacFm3RJ4aFsO7lDeMJHzQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JC1LF7pC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JC1LF7pC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709928603; x=1741464603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PTE/rMEMEqDj8cKzSKUnVECPVqeBvk/P/dIn3O1Gs7w=;
  b=JC1LF7pCjmOjh4XoQ71iX6mOmNW7fYhF3hdvGO+zK5BS5B22HSWycv0g
   TNPU/XsSFf3+SnyEXAbrSfaACCdfF1XXZw31FNp9zzh4jmhaLXn+jQ+zI
   l1AEJAYC9F2T0Zrnv44unsS7FZPaUJSH1Zu3DksIpm4dbz/BqD7f0iQiM
   B/eIgdiU70boTCho5u9FeOiO1KtaMFkoZ5bS51kfvXbH9OSNZRN1Zdssp
   gRAtZQJ/Y3ecdEHcNj89aMKVToUa5mct3mu9XOZ5Wrj6j/dOdpDzZMmyU
   0zID0CpTQD+IsnQXFxLTbMAVE71VWox9txWy446+2eIedDKJeQISkpHn9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="16093994"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="16093994"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 12:10:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="10447102"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Mar 2024 12:10:00 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rigXW-0006fb-1O;
	Fri, 08 Mar 2024 20:09:58 +0000
Date: Sat, 9 Mar 2024 04:09:56 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Leech <cleech@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-next 69/70]
 drivers/uio/uio_dmem_genirq.c:63:39: warning: cast from pointer to integer
 of different size
Message-ID: <202403090402.VwJRCsyR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-next
head:   367b3560e10bbae3660d8ba4d0a7cc92170d8398
commit: 019947805a8d703fbb57d607187ff1148bb267ff [69/70] uio_dmem_genirq: UIO_MEM_DMA_COHERENT conversion
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240309/202403090402.VwJRCsyR-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090402.VwJRCsyR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090402.VwJRCsyR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/uio/uio_dmem_genirq.c: In function 'uio_dmem_genirq_open':
>> drivers/uio/uio_dmem_genirq.c:63:39: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      63 |                 uiomem->addr = addr ? (phys_addr_t) addr : DMEM_MAP_ERROR;
         |                                       ^
   drivers/uio/uio_dmem_genirq.c: In function 'uio_dmem_genirq_release':
>> drivers/uio/uio_dmem_genirq.c:92:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      92 |                                           (void *) uiomem->addr,
         |                                           ^


vim +63 drivers/uio/uio_dmem_genirq.c

    47	
    48	static int uio_dmem_genirq_open(struct uio_info *info, struct inode *inode)
    49	{
    50		struct uio_dmem_genirq_platdata *priv = info->priv;
    51		struct uio_mem *uiomem;
    52	
    53		uiomem = &priv->uioinfo->mem[priv->dmem_region_start];
    54	
    55		mutex_lock(&priv->alloc_lock);
    56		while (!priv->refcnt && uiomem < &priv->uioinfo->mem[MAX_UIO_MAPS]) {
    57			void *addr;
    58			if (!uiomem->size)
    59				break;
    60	
    61			addr = dma_alloc_coherent(&priv->pdev->dev, uiomem->size,
    62						  &uiomem->dma_addr, GFP_KERNEL);
  > 63			uiomem->addr = addr ? (phys_addr_t) addr : DMEM_MAP_ERROR;
    64			++uiomem;
    65		}
    66		priv->refcnt++;
    67	
    68		mutex_unlock(&priv->alloc_lock);
    69		/* Wait until the Runtime PM code has woken up the device */
    70		pm_runtime_get_sync(&priv->pdev->dev);
    71		return 0;
    72	}
    73	
    74	static int uio_dmem_genirq_release(struct uio_info *info, struct inode *inode)
    75	{
    76		struct uio_dmem_genirq_platdata *priv = info->priv;
    77		struct uio_mem *uiomem;
    78	
    79		/* Tell the Runtime PM code that the device has become idle */
    80		pm_runtime_put_sync(&priv->pdev->dev);
    81	
    82		uiomem = &priv->uioinfo->mem[priv->dmem_region_start];
    83	
    84		mutex_lock(&priv->alloc_lock);
    85	
    86		priv->refcnt--;
    87		while (!priv->refcnt && uiomem < &priv->uioinfo->mem[MAX_UIO_MAPS]) {
    88			if (!uiomem->size)
    89				break;
    90			if (uiomem->addr) {
    91				dma_free_coherent(uiomem->dma_device, uiomem->size,
  > 92						  (void *) uiomem->addr,
    93						  uiomem->dma_addr);
    94			}
    95			uiomem->addr = DMEM_MAP_ERROR;
    96			++uiomem;
    97		}
    98	
    99		mutex_unlock(&priv->alloc_lock);
   100		return 0;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
