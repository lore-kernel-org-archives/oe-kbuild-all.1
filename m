Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E3822370D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 06:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761287217; cv=none; b=nYfonlKdHlWkHdXXOTRLhELZObeeMWqj8at3QO1kFxZqoe1HQ7yhUl+V3+tqSEGx0tvEQt8KCO3/O4mfGjpZ/mJoSzr9UakHriHJ9Z242IjcsxnLGhKMdKOfP6onIPCcrO4a27zMrtQuxtfB+es2oxvoRO+Wg+CSiOBlLd+lKhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761287217; c=relaxed/simple;
	bh=7FUDSO3ECmP+66KkSaLl9tJ+l5g6i4aElpf2bdQJ6qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7t+ApRhLMmkRrlWHwdObuTVmOl/3gsAF1l2LNU85DFwZtRi9iPhLpWNNtWYdYod9GwCOiBBR6pzOnuEZKWU84lOeXbDNywfJaa0FZU2EZxClizNbPU31GR+HOpOk73HJDiQ1O/2Ga5pI9WAtiA4YDE/BWNuRIFvM2pKpJj8Qww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q6AX07Jv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q6AX07Jv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761287216; x=1792823216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7FUDSO3ECmP+66KkSaLl9tJ+l5g6i4aElpf2bdQJ6qc=;
  b=Q6AX07JvzZn/oQyux3sFiDTS3k30oM+0t5HfwrhlJYU+cXl63wGrJIaP
   ks2H+AmbXNCz9L3rXv6QQCfMlC+EIjgkphlp0ytssHDWAoX9obEPVap47
   Npd9gx8FxlhAmj09ggiEtbQWiAInT7YrrL9DPdLiomPOKkkIRci5sU1Du
   WcDSIq9gUBzk5VTVuxam2FPcAS7rC9AYcS2M5opRX/uGrCTZBy6UYYdT1
   VfeYf/CQALEDJ0rg3pgfR3z57gSWIzPix3O//PAt7AyoV2h0fKABcmgo8
   qN8xpDJQGH56LJYm+kZbTiBtLwTrtKxEBkLiNvHeYYPPeOpSOaCUaMKl+
   A==;
X-CSE-ConnectionGUID: SftMCKvyQ+Gz0mZEpfbB6w==
X-CSE-MsgGUID: wP3nQ8qOS0q7DvHQ+DUdjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63505696"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="63505696"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 23:26:55 -0700
X-CSE-ConnectionGUID: W25/y6PDS1y6s0ECMPiZ3g==
X-CSE-MsgGUID: E4sll0OpQwqeQunxeWfyRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="184836637"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2025 23:26:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCBEl-000EEv-0w;
	Fri, 24 Oct 2025 06:26:22 +0000
Date: Fri, 24 Oct 2025 14:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Koichiro Den <den@valinux.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 17/25] dmaengine: dw-edma: Add
 dw_edma_find_by_child() helper
Message-ID: <202510241442.yTxV02KN-lkp@intel.com>
References: <20251023071916.901355-18-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023071916.901355-18-den@valinux.co.jp>

Hi Koichiro,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on jonmason-ntb/ntb-next]
[also build test ERROR on linus/master next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Koichiro-Den/PCI-endpoint-pci-epf-vntb-Use-array_index_nospec-on-mws_size-access/20251023-153325
base:   https://github.com/jonmason/ntb ntb-next
patch link:    https://lore.kernel.org/r/20251023071916.901355-18-den%40valinux.co.jp
patch subject: [RFC PATCH 17/25] dmaengine: dw-edma: Add dw_edma_find_by_child() helper
config: csky-randconfig-002-20251024 (https://download.01.org/0day-ci/archive/20251024/202510241442.yTxV02KN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241442.yTxV02KN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241442.yTxV02KN-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/pci/controller/dwc/pcie-designware-debugfs.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-designware-host.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-designware-ep.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-designware-plat.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-fu740.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pci-keystone.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pci-layerscape.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-qcom-common.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-qcom.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-artpec6.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-dw-rockchip.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-intel-gw.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-keembay.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-histb.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-uniphier.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-uniphier-ep.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here
   csky-linux-ld: drivers/pci/controller/dwc/pcie-rcar-gen4.o: in function `dw_edma_find_by_child':
>> include/linux/dma/edma.h:148: multiple definition of `dw_edma_find_by_child'; drivers/pci/controller/dwc/pcie-designware.o:include/linux/dma/edma.h:148: first defined here


vim +148 include/linux/dma/edma.h

   140	
   141	static inline void dw_edma_unregister_selfirq(struct dw_edma *dw,
   142						      dw_edma_selfirq_fn fn, void *data)
   143	{
   144	}
   145	struct dw_edma *dw_edma_find_by_child(struct device *child)
   146	{
   147		return NULL;
 > 148	}
   149	#endif /* CONFIG_DW_EDMA */
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
