Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAB71E3DED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218041; cv=none; b=Cw+rh9VkPtnEkCAZ25LvDj0m58+LCAGDt3okHf+qO5r/vxohInyC2Gy9qWL6ITtoYE+WFl6fAoZKw/Y6jP9SYFQIYGXZzFqJ8WbwimDI1EoZga/0MJmV4iF6bamaqCWFQigHTwsIQOZZcBDcjKGglJd16FhWXZMOCOmMl+kUCQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218041; c=relaxed/simple;
	bh=/a5/cmTFwfGsSy5KThxd9G4sDvgIOEC9EzVwlO1Hz3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEBYDkGK2HFdTrolEs8lwQO/uxj41V7ltTBdVf1q+p7e2raIzzdbCrjXS6laZEY6w4j0XPkEn+bxNlGM6rGyCXBMo/bYsKkJvlzfNIqHH7Pt3dNhD+0GDZdVoX1YmtKEteOaJPPDwxn56gNe9HZEtNugFg+H8kkSVM30paruMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huGkSrfZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huGkSrfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752218040; x=1783754040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/a5/cmTFwfGsSy5KThxd9G4sDvgIOEC9EzVwlO1Hz3Q=;
  b=huGkSrfZLCPXGpNHj6IcFPJGuyZG1JspZ13utPp65xgTKMjfKy3a/Jx8
   cV8ug8oMvwgwjn2vO49gd/p5gx8NxNWO4K5/yWoks75NFgKDg082P2DXy
   KocT/k5Ttz7r8YU4JPr3MdJAYFyR2JRk5/GmYDF5LD9Gufj8Howt1dK5q
   9DnOQiF+kt9fRc5uPgosSratBPiPJSgXNEGCwHcIPvtWNevzGmG09COQL
   7nZlh0zR96VeW7ewzlJPDcruzVzPg5sD33DItYhmgUaigYQzbBdhB9tsK
   r3GeLLrUUt+m+sHrm6gVcdraJ9fVUvM3BaWQzJNkphQWtHXZ/OKKDzvZQ
   g==;
X-CSE-ConnectionGUID: IFmhIQFlRJW/mAOej0N1/w==
X-CSE-MsgGUID: gKvONrZzSwiU/soOIm2Hjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54638609"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="54638609"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 00:13:59 -0700
X-CSE-ConnectionGUID: g7SdpPTpTa2TCKfUZ0hk7A==
X-CSE-MsgGUID: e77LfgKXRkWvHNFw49V9Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="179997241"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jul 2025 00:13:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua7xA-00064R-2n;
	Fri, 11 Jul 2025 07:13:52 +0000
Date: Fri, 11 Jul 2025 15:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Karthik Poduval <kpoduval@lab126.com>, jyxiong@amazon.com,
	miguel.lopes@synopsys.com, anishkmr@amazon.com, vkoul@kernel.org,
	kishon@kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Karthik Poduval <kpoduval@lab126.com>
Subject: Re: [PATCH v2 1/2] phy: dw-dphy-rx: Add Synopsys DesignWare D-PHY RX
Message-ID: <202507111412.83Oiz7hO-lkp@intel.com>
References: <2383f8cf2a8f5e1b914d4cf9bd11674ed55876d2.1752106239.git.kpoduval@lab126.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2383f8cf2a8f5e1b914d4cf9bd11674ed55876d2.1752106239.git.kpoduval@lab126.com>

Hi Karthik,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc5 next-20250710]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthik-Poduval/phy-dw-dphy-rx-Add-Synopsys-DesignWare-D-PHY-RX/20250710-104505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/2383f8cf2a8f5e1b914d4cf9bd11674ed55876d2.1752106239.git.kpoduval%40lab126.com
patch subject: [PATCH v2 1/2] phy: dw-dphy-rx: Add Synopsys DesignWare D-PHY RX
config: sparc-randconfig-r123-20250711 (https://download.01.org/0day-ci/archive/20250711/202507111412.83Oiz7hO-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250711/202507111412.83Oiz7hO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507111412.83Oiz7hO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-dw-dphy.c:112:24: sparse: sparse: symbol 'range_gen3' was not declared. Should it be static?
>> drivers/phy/phy-dw-dphy.c:427:24: sparse: sparse: symbol 'dw_dphy_1p2' was not declared. Should it be static?

vim +/range_gen3 +112 drivers/phy/phy-dw-dphy.c

   107	
   108	/*
   109	 * DW DPHY Gen3 calibration table
   110	 *
   111	 */
 > 112	struct range_dphy_gen3 range_gen3[] = {
   113		{ 80, 0b0000000, 460 },	  { 90, 0b0010000, 460 },
   114		{ 100, 0b0100000, 460 },  { 110, 0b0110000, 460 },
   115		{ 120, 0b0000001, 460 },  { 130, 0b0010001, 460 },
   116		{ 140, 0b0100001, 460 },  { 150, 0b0110001, 460 },
   117		{ 160, 0b0000010, 460 },  { 170, 0b0010010, 460 },
   118		{ 180, 0b0100010, 460 },  { 190, 0b0110010, 460 },
   119		{ 205, 0b0000011, 460 },  { 220, 0b0010011, 460 },
   120		{ 235, 0b0100011, 460 },  { 250, 0b0110011, 460 },
   121		{ 275, 0b0000100, 460 },  { 300, 0b0010100, 460 },
   122		{ 325, 0b0100101, 460 },  { 350, 0b0110101, 460 },
   123		{ 400, 0b0000101, 460 },  { 450, 0b0010110, 460 },
   124		{ 500, 0b0100110, 460 },  { 550, 0b0110111, 460 },
   125		{ 600, 0b0000111, 460 },  { 650, 0b0011000, 460 },
   126		{ 700, 0b0101000, 460 },  { 750, 0b0111001, 460 },
   127		{ 800, 0b0001001, 460 },  { 850, 0b0011001, 460 },
   128		{ 900, 0b0101001, 460 },  { 950, 0b0111010, 460 },
   129		{ 1000, 0b0001010, 460 }, { 1050, 0b0011010, 460 },
   130		{ 1110, 0b0101010, 460 }, { 1150, 0b0111011, 460 },
   131		{ 1200, 0b0001011, 460 }, { 1250, 0b0011011, 460 },
   132		{ 1300, 0b0101011, 460 }, { 1350, 0b0111100, 460 },
   133		{ 1400, 0b0001100, 460 }, { 1450, 0b0011100, 460 },
   134		{ 1500, 0b0101100, 460 }, { 1550, 0b0111101, 285 },
   135		{ 1600, 0b0001101, 295 }, { 1650, 0b0011101, 304 },
   136		{ 1700, 0b0101110, 313 }, { 1750, 0b0111110, 322 },
   137		{ 1800, 0b0001110, 331 }, { 1850, 0b0011110, 341 },
   138		{ 1900, 0b0101111, 350 }, { 1950, 0b0111111, 359 },
   139		{ 2000, 0b0001111, 368 }, { 2050, 0b1000000, 377 },
   140		{ 2100, 0b1000001, 387 }, { 2150, 0b1000010, 396 },
   141		{ 2200, 0b1000011, 405 }, { 2250, 0b1000100, 414 },
   142		{ 2300, 0b1000101, 423 }, { 2350, 0b1000110, 432 },
   143		{ 2400, 0b1000111, 442 }, { 2450, 0b1001000, 451 },
   144		{ 2500, 0b1001001, 460 }
   145	};
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
