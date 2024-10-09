Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A201A0AFA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 21:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510205; cv=none; b=ZiKyv15A/zpXCt6+9DTs/Hj/p3+Jg3xxkSdmEwqA0Zd3WSTMGKLBDDsIEI7FyGsqaC31Sk6nYjURVC8def/B2WJ0pbJJXkNWe3wSdb0xVJsL8BCbRYA1rquSvTaCRGdtmbjZlrxDmbuLZJ5OGDIx54nt2LFE6CZxBEsglOJW5xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510205; c=relaxed/simple;
	bh=4GEMwaZLiExs19R90QtDeDjjXM7G+HvxTdA+0WoFtUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c6/sx6z1x1chFMXfKscsM6j0WakkN0dlz8+2buCHX5U0PMWoIhSmD1FsexUpwydhSc4jONxVjjyUs99DiXSmTYir6i1iqlqC9pJfUo1yYrmxDpHfEovjmgwjfagt71uQWUklCaglLK3yOwxCcAQEW7EOrH/Hq75swT8pREDYJXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVz+00GO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVz+00GO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728510204; x=1760046204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GEMwaZLiExs19R90QtDeDjjXM7G+HvxTdA+0WoFtUc=;
  b=CVz+00GOo+ytFMkO3wEpViwFATNmPndL9Y4ifxm/Ewe0ATM/OZ3EO8TG
   4/HWTT7Jt5PWq2p0FKhppEGefPrzhnpXs6bNpXr5HXk7iSh8Nk74v3RXh
   GbE90QKlpB/UIM9Y3wsx2AK2P055CNp2bAzJN7EfiyLsZqt/5/d/7FMDT
   Erl7i6ojUTdL3M9hlcZokUAcRA65310QsGWV5T2VBmsFnSdGPbLMjteWr
   GS2LLfZD11HzfF2fZGZbngxW1PvvV8gSleI6/Mve6FXT3tSMeGH/OROkc
   N2ZKzv6Zfhvd5RI1bSVSU1U0fsxm3xIVBjQpNSNE5+xUUF5rxqKlsJnur
   A==;
X-CSE-ConnectionGUID: Lbf31biqSTi4FMya/dCRDQ==
X-CSE-MsgGUID: 45FOcd7ARxuSoAFXrXavKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27652501"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="27652501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:43:23 -0700
X-CSE-ConnectionGUID: U2NIrgl8T4qgvaijjuKaDw==
X-CSE-MsgGUID: 9djeIIT+TjKGWs+bOF2fog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="80908318"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 14:43:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syeSl-0009pw-2T;
	Wed, 09 Oct 2024 21:43:19 +0000
Date: Thu, 10 Oct 2024 05:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Yuting <liyuting2071@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3405/14324]
 drivers/gpu/drm/phytium/phytium_pci.c:236:9: error: call to undeclared
 function 'pci_enable_msi'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202410100523.x3WsGWyG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5d76abff5e121f2d916bcbc121f558c82e5dc221
commit: 792b82446538ed840a6e23b89673ce21564702bd [3405/14324] Fix gic support for Phytium S2500
config: arm64-randconfig-002-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100523.x3WsGWyG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100523.x3WsGWyG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100523.x3WsGWyG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/phytium/phytium_pci.c:7:
   In file included from include/linux/pci.h:2106:
   In file included from arch/arm64/include/asm/pci.h:7:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/gpu/drm/phytium/phytium_pci.c:23:6: warning: no previous prototype for function 'phytium_pci_vram_hw_init' [-Wmissing-prototypes]
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         |      ^
   drivers/gpu/drm/phytium/phytium_pci.c:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      23 | void phytium_pci_vram_hw_init(struct phytium_display_private *priv)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_pci.c:30:5: warning: no previous prototype for function 'phytium_pci_vram_init' [-Wmissing-prototypes]
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         |     ^
   drivers/gpu/drm/phytium/phytium_pci.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | int phytium_pci_vram_init(struct pci_dev *pdev, struct phytium_display_private *priv)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_pci.c:68:6: warning: no previous prototype for function 'phytium_pci_vram_fini' [-Wmissing-prototypes]
      68 | void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
         |      ^
   drivers/gpu/drm/phytium/phytium_pci.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | void phytium_pci_vram_fini(struct pci_dev *pdev, struct phytium_display_private *priv)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_pci.c:89:5: warning: no previous prototype for function 'phytium_pci_dma_init' [-Wmissing-prototypes]
      89 | int phytium_pci_dma_init(struct phytium_display_private *priv)
         |     ^
   drivers/gpu/drm/phytium/phytium_pci.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | int phytium_pci_dma_init(struct phytium_display_private *priv)
         | ^
         | static 
   drivers/gpu/drm/phytium/phytium_pci.c:137:6: warning: no previous prototype for function 'phytium_pci_dma_fini' [-Wmissing-prototypes]
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         |      ^
   drivers/gpu/drm/phytium/phytium_pci.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     137 | void phytium_pci_dma_fini(struct phytium_display_private *priv)
         | ^
         | static 
>> drivers/gpu/drm/phytium/phytium_pci.c:236:9: error: call to undeclared function 'pci_enable_msi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     236 |                 ret = pci_enable_msi(pdev);
         |                       ^
>> drivers/gpu/drm/phytium/phytium_pci.c:271:3: error: call to undeclared function 'pci_disable_msi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     271 |                 pci_disable_msi(pdev);
         |                 ^
   drivers/gpu/drm/phytium/phytium_pci.c:271:3: note: did you mean 'pci_disable_sriov'?
   include/linux/pci.h:2437:20: note: 'pci_disable_sriov' declared here
    2437 | static inline void pci_disable_sriov(struct pci_dev *dev) { }
         |                    ^
   drivers/gpu/drm/phytium/phytium_pci.c:291:3: error: call to undeclared function 'pci_disable_msi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     291 |                 pci_disable_msi(pdev);
         |                 ^
   6 warnings and 3 errors generated.


vim +/pci_enable_msi +236 drivers/gpu/drm/phytium/phytium_pci.c

b80df10f845813 lishuo 2024-01-31  215  
b80df10f845813 lishuo 2024-01-31  216  static int phytium_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
b80df10f845813 lishuo 2024-01-31  217  {
b80df10f845813 lishuo 2024-01-31  218  	struct phytium_display_private *priv = NULL;
b80df10f845813 lishuo 2024-01-31  219  	struct drm_device *dev = NULL;
b80df10f845813 lishuo 2024-01-31  220  	int ret = 0;
b80df10f845813 lishuo 2024-01-31  221  
b80df10f845813 lishuo 2024-01-31  222  	dev = drm_dev_alloc(&phytium_display_drm_driver, &pdev->dev);
b80df10f845813 lishuo 2024-01-31  223  	if (IS_ERR(dev)) {
b80df10f845813 lishuo 2024-01-31  224  		DRM_ERROR("failed to allocate drm_device\n");
b80df10f845813 lishuo 2024-01-31  225  		return PTR_ERR(dev);
b80df10f845813 lishuo 2024-01-31  226  	}
b80df10f845813 lishuo 2024-01-31  227  	pci_set_drvdata(pdev, dev);
b80df10f845813 lishuo 2024-01-31  228  	pci_set_master(pdev);
b80df10f845813 lishuo 2024-01-31  229  	ret = pci_enable_device(pdev);
b80df10f845813 lishuo 2024-01-31  230  	if (ret) {
b80df10f845813 lishuo 2024-01-31  231  		DRM_ERROR("pci enable device fail\n");
b80df10f845813 lishuo 2024-01-31  232  		goto failed_enable_device;
b80df10f845813 lishuo 2024-01-31  233  	}
b80df10f845813 lishuo 2024-01-31  234  
b80df10f845813 lishuo 2024-01-31  235  	if (dc_msi_enable) {
b80df10f845813 lishuo 2024-01-31 @236  		ret = pci_enable_msi(pdev);
b80df10f845813 lishuo 2024-01-31  237  		if (ret)
b80df10f845813 lishuo 2024-01-31  238  			DRM_ERROR("pci enable msi fail\n");
b80df10f845813 lishuo 2024-01-31  239  	}
b80df10f845813 lishuo 2024-01-31  240  
b80df10f845813 lishuo 2024-01-31  241  	dma_set_mask(&pdev->dev, DMA_BIT_MASK(40));
b80df10f845813 lishuo 2024-01-31  242  
b80df10f845813 lishuo 2024-01-31  243  	priv = phytium_pci_private_init(pdev, ent);
b80df10f845813 lishuo 2024-01-31  244  	if (priv)
b80df10f845813 lishuo 2024-01-31  245  		dev->dev_private = priv;
b80df10f845813 lishuo 2024-01-31  246  	else
b80df10f845813 lishuo 2024-01-31  247  		goto failed_pci_private_init;
b80df10f845813 lishuo 2024-01-31  248  
b80df10f845813 lishuo 2024-01-31  249  	ret = phytium_pci_vram_init(pdev, priv);
b80df10f845813 lishuo 2024-01-31  250  	if (ret) {
b80df10f845813 lishuo 2024-01-31  251  		DRM_ERROR("failed to init pci vram\n");
b80df10f845813 lishuo 2024-01-31  252  		goto failed_pci_vram_init;
b80df10f845813 lishuo 2024-01-31  253  	}
b80df10f845813 lishuo 2024-01-31  254  
b80df10f845813 lishuo 2024-01-31  255  	ret = drm_dev_register(dev, 0);
b80df10f845813 lishuo 2024-01-31  256  	if (ret) {
b80df10f845813 lishuo 2024-01-31  257  		DRM_ERROR("failed to register drm dev\n");
b80df10f845813 lishuo 2024-01-31  258  		goto failed_register_drm;
b80df10f845813 lishuo 2024-01-31  259  	}
b80df10f845813 lishuo 2024-01-31  260  
b80df10f845813 lishuo 2024-01-31  261  	phytium_dp_hpd_irq_setup(dev, true);
b80df10f845813 lishuo 2024-01-31  262  
b80df10f845813 lishuo 2024-01-31  263  	return 0;
b80df10f845813 lishuo 2024-01-31  264  
b80df10f845813 lishuo 2024-01-31  265  failed_register_drm:
b80df10f845813 lishuo 2024-01-31  266  	phytium_pci_vram_fini(pdev, priv);
b80df10f845813 lishuo 2024-01-31  267  failed_pci_vram_init:
b80df10f845813 lishuo 2024-01-31  268  	phytium_pci_private_fini(pdev, priv);
b80df10f845813 lishuo 2024-01-31  269  failed_pci_private_init:
b80df10f845813 lishuo 2024-01-31  270  	if (pdev->msi_enabled)
b80df10f845813 lishuo 2024-01-31 @271  		pci_disable_msi(pdev);
b80df10f845813 lishuo 2024-01-31  272  	pci_disable_device(pdev);
b80df10f845813 lishuo 2024-01-31  273  failed_enable_device:
b80df10f845813 lishuo 2024-01-31  274  	pci_set_drvdata(pdev, NULL);
b80df10f845813 lishuo 2024-01-31  275  	drm_dev_put(dev);
b80df10f845813 lishuo 2024-01-31  276  
b80df10f845813 lishuo 2024-01-31  277  	return -1;
b80df10f845813 lishuo 2024-01-31  278  }
b80df10f845813 lishuo 2024-01-31  279  

:::::: The code at line 236 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
