Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A560ED1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708422757; cv=none; b=WuGhkZrHgqc4oXK1xvilsBZ2idEl8+YPZP4xm6jFiQtsY0e8xtFnzehYJXaUQp0hpx2sVXp7yiB1cHQtZ69n4szg/UfmParf6b0IYxocv94ve1NF4naJSMYE5lVyHZQQnrEc4XXvqcI0+EpQC7ei51+QmoiD5auGocyHV3dslAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708422757; c=relaxed/simple;
	bh=UMsQA0CIZHQzEFCupgH1niPzb8qOoJhCmSCVTfCdszA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sa/SIApZFAYK8v4xakzDFTilEn7vrSyoHcmKMmuBOp7kY2rCB3a70ZMeZPWq0lM7kSnBCiYYkL9KRU4XpsWd5II4vJ74w6PxGsUg5fNgaNEkpCfA9qh4gG6rXLugpJQNkTCVSHJ01rRVd4iF6Y2R2veHUw0KPFetgV/0crGJeEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnOv8uWv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnOv8uWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708422756; x=1739958756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMsQA0CIZHQzEFCupgH1niPzb8qOoJhCmSCVTfCdszA=;
  b=JnOv8uWvi6jCJPWHzihM4T+/UUQAS23+6Hiho1VJZjd5z7eRYBuTATUJ
   dK+nsYG+cW1+b5sTLmB+h+eDiLnmSOdyb+lnS3MKUm680rah/e3E+XQmT
   dzRLhkzdGTPKk7wPgvpIjHKAmDwM+7o/e3TLc1GI07O+C6h8jzqbSb3d/
   TNnwSCd5+G4/Xzhg8yA1seN3HapXBdvvJItBXlVAz7SgcyxOyNYFzLMDI
   dgoyjb5IgiRAc2WXgobm9hNxzytkepMWgyUvD2B8iFbIH6RrwpEcfhIHL
   nXwK49ZQWYSTYPebWA/OfsQqI4Rb1ptmpZ1dkbFtWA3gX68Ji0y5Tsr9d
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="13928260"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="13928260"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 01:52:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="27897265"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Feb 2024 01:52:33 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcMnZ-0004Om-11;
	Tue, 20 Feb 2024 09:52:31 +0000
Date: Tue, 20 Feb 2024 17:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Ford <aford173@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V5 2/6] phy: freescale: add Samsung HDMI PHY
Message-ID: <202402201733.Pd6C9LbH-lkp@intel.com>
References: <20240218041649.1209173-3-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240218041649.1209173-3-aford173@gmail.com>

Hi Adam,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on arm64/for-next/core arm/for-next kvmarm/next rockchip/for-next soc/for-next linus/master arm/fixes v6.8-rc5 next-20240219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Ford/dt-bindings-phy-add-binding-for-the-i-MX8MP-HDMI-PHY/20240218-121955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240218041649.1209173-3-aford173%40gmail.com
patch subject: [PATCH V5 2/6] phy: freescale: add Samsung HDMI PHY
config: sh-randconfig-001-20240220 (https://download.01.org/0day-ci/archive/20240220/202402201733.Pd6C9LbH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240220/202402201733.Pd6C9LbH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402201733.Pd6C9LbH-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/phy/freescale/phy-fsl-samsung-hdmi.o: in function `fsl_samsung_hdmi_phy_remove':
   phy-fsl-samsung-hdmi.c:(.text+0x64): undefined reference to `of_clk_del_provider'
   sh4-linux-ld: drivers/phy/freescale/phy-fsl-samsung-hdmi.o: in function `fsl_samsung_hdmi_phy_probe':
   phy-fsl-samsung-hdmi.c:(.text+0x204): undefined reference to `__clk_get_name'
>> sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x20c): undefined reference to `devm_clk_register'
>> sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x214): undefined reference to `of_clk_add_hw_provider'
>> sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x218): undefined reference to `of_clk_hw_simple_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
