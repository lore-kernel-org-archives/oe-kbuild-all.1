Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAEA200AB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 03:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707362669; cv=none; b=oNve1JIAoGJlOBd9Oezp8+h4SZwctgjLkbcciSqxfWrgra04yp4yqTIrapzI+WI7RLUu5xNzyLwZT4ehVC0LNNaVxlfI/1CyUif8wAITJUpKryUYPqmmXwibIyn0uf3o021cr9nYF0KnnLf0glB7N3lTFuNsFSfEr7ooTyh4cWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707362669; c=relaxed/simple;
	bh=/1FpkbC0/DVEFBXW0XkYn69R/ur0CKHVubYy7ckNlIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhIaF/dJxW7GN27/CyWkiw4G2UXpSPCkDNmwJHtnUXjzCD5NRiUco5w2Vb1+p/NKQ/NdAxmV4VdZbHjjJspTlF13C6jJ0BLmGuK3HlUXsOXSiLR4wJB8QaEmcC1OZbYzqv9oA4gs2+OoIDNWRmDFYnxmSZl28Uem0qd7I8i7zf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWkrpxV2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWkrpxV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707362667; x=1738898667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1FpkbC0/DVEFBXW0XkYn69R/ur0CKHVubYy7ckNlIg=;
  b=GWkrpxV2PPjT0anmgJQr/OLBpyhuJIgIqkbJX+MiFgQ1gyomKdltkD+a
   rdHRyYUgK/drZQn+6o+5zB1VCGaoZnJ6iCuJ23EbIScUuUQUaKuCS9lRm
   cbgS6ltnldSa0YnnQ7fM03ZQg2wGSAjuHNlGK9pkiXqbmGxMffpJRqqyk
   G2joz/c6metMXw3b4hvDMxd8hGuPdkpFKNvQbgt4u05UdnE2y24Wz28ar
   eY+iHj/yFsokxek2lAXacHFBD7UvwlFG1a0DGTPiUwzgeKImPiN31XVEB
   m+aI+jV58GdOGtUtSx5Y3srB8Igpjv9IiFCjc9z8S8UbFsdEJDBi/ii4n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1019566"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1019566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 19:24:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="32341288"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Feb 2024 19:24:24 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXv1R-0003Ii-2T;
	Thu, 08 Feb 2024 03:24:21 +0000
Date: Thu, 8 Feb 2024 11:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Furong Xu <0x1207@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Simon Horman <horms@kernel.org>
Subject: [linux-next:master 3159/4898]
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:836:20: error:
 initializer element is not constant
Message-ID: <202402081135.lAxxBXHk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ae0a045e6814c8c1d676d6153c605a65746aa29
commit: 46eba193d04f8bd717e525eb4110f3c46c12aec3 [3159/4898] net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
config: x86_64-randconfig-121-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081135.lAxxBXHk-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081135.lAxxBXHk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081135.lAxxBXHk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:836:20: error: initializer element is not constant
     { true, "TDPES0", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:836:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[0].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:837:20: error: initializer element is not constant
     { true, "TDPES1", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:837:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[1].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:838:20: error: initializer element is not constant
     { true, "TDPES2", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:838:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[2].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:839:20: error: initializer element is not constant
     { true, "TDPES3", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:839:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[3].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:840:20: error: initializer element is not constant
     { true, "TDPES4", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:840:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[4].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:841:20: error: initializer element is not constant
     { true, "TDPES5", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:841:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[5].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:842:20: error: initializer element is not constant
     { true, "TDPES6", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:842:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[6].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:843:20: error: initializer element is not constant
     { true, "TDPES7", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:843:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[7].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:844:20: error: initializer element is not constant
     { true, "TDPES8", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:844:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[8].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:845:20: error: initializer element is not constant
     { true, "TDPES9", dpp_tx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:845:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[9].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:846:21: error: initializer element is not constant
     { true, "TDPES10", dpp_tx_err },
                        ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:846:21: note: (near initialization for 'dwxgmac3_dma_dpp_errors[10].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:847:21: error: initializer element is not constant
     { true, "TDPES11", dpp_tx_err },
                        ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:847:21: note: (near initialization for 'dwxgmac3_dma_dpp_errors[11].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:848:21: error: initializer element is not constant
     { true, "TDPES12", dpp_tx_err },
                        ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:848:21: note: (near initialization for 'dwxgmac3_dma_dpp_errors[12].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:849:21: error: initializer element is not constant
     { true, "TDPES13", dpp_tx_err },
                        ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:849:21: note: (near initialization for 'dwxgmac3_dma_dpp_errors[13].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:850:21: error: initializer element is not constant
     { true, "TDPES14", dpp_tx_err },
                        ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:850:21: note: (near initialization for 'dwxgmac3_dma_dpp_errors[14].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:851:21: error: initializer element is not constant
     { true, "TDPES15", dpp_tx_err },
                        ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:851:21: note: (near initialization for 'dwxgmac3_dma_dpp_errors[15].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:852:20: error: initializer element is not constant
     { true, "RDPES0", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:852:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[16].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:853:20: error: initializer element is not constant
     { true, "RDPES1", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:853:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[17].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:854:20: error: initializer element is not constant
     { true, "RDPES2", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:854:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[18].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:855:20: error: initializer element is not constant
     { true, "RDPES3", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:855:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[19].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:856:20: error: initializer element is not constant
     { true, "RDPES4", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:856:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[20].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:857:20: error: initializer element is not constant
     { true, "RDPES5", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:857:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[21].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:858:20: error: initializer element is not constant
     { true, "RDPES6", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:858:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[22].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:859:20: error: initializer element is not constant
     { true, "RDPES7", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:859:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[23].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:860:20: error: initializer element is not constant
     { true, "RDPES8", dpp_rx_err },
                       ^~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:860:20: note: (near initialization for 'dwxgmac3_dma_dpp_errors[24].detailed_desc')
   drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:861:20: error: initializer element is not constant

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +836 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c

   832	
   833	static const char * const dpp_rx_err = "Read Rx Descriptor Parity checker Error";
   834	static const char * const dpp_tx_err = "Read Tx Descriptor Parity checker Error";
   835	static const struct dwxgmac3_error_desc dwxgmac3_dma_dpp_errors[32] = {
 > 836		{ true, "TDPES0", dpp_tx_err },
   837		{ true, "TDPES1", dpp_tx_err },
   838		{ true, "TDPES2", dpp_tx_err },
   839		{ true, "TDPES3", dpp_tx_err },
   840		{ true, "TDPES4", dpp_tx_err },
   841		{ true, "TDPES5", dpp_tx_err },
   842		{ true, "TDPES6", dpp_tx_err },
   843		{ true, "TDPES7", dpp_tx_err },
   844		{ true, "TDPES8", dpp_tx_err },
   845		{ true, "TDPES9", dpp_tx_err },
   846		{ true, "TDPES10", dpp_tx_err },
   847		{ true, "TDPES11", dpp_tx_err },
   848		{ true, "TDPES12", dpp_tx_err },
   849		{ true, "TDPES13", dpp_tx_err },
   850		{ true, "TDPES14", dpp_tx_err },
   851		{ true, "TDPES15", dpp_tx_err },
   852		{ true, "RDPES0", dpp_rx_err },
   853		{ true, "RDPES1", dpp_rx_err },
   854		{ true, "RDPES2", dpp_rx_err },
   855		{ true, "RDPES3", dpp_rx_err },
   856		{ true, "RDPES4", dpp_rx_err },
   857		{ true, "RDPES5", dpp_rx_err },
   858		{ true, "RDPES6", dpp_rx_err },
   859		{ true, "RDPES7", dpp_rx_err },
   860		{ true, "RDPES8", dpp_rx_err },
   861		{ true, "RDPES9", dpp_rx_err },
   862		{ true, "RDPES10", dpp_rx_err },
   863		{ true, "RDPES11", dpp_rx_err },
   864		{ true, "RDPES12", dpp_rx_err },
   865		{ true, "RDPES13", dpp_rx_err },
   866		{ true, "RDPES14", dpp_rx_err },
   867		{ true, "RDPES15", dpp_rx_err },
   868	};
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
