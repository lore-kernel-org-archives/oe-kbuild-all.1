Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0006011182
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707692242; cv=none; b=V2gAMMw/Op5vkyHd+Kga51YCs/P1pcXgygu3u6MCGfms2pYFT0s+TCnnr/jm+PMZbC8l+AoJZnqvuuFy84rOn7VPkH6wKKnBg4fbqf0i/afJa4Ms3zD2zlbg24Vh1zy31M4GUw1OrqXBympSMel+5mePqPKCM2efR8hpltMdDtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707692242; c=relaxed/simple;
	bh=EncUszjzPei1cQnSJlHdqU/x+Dae9LFh7EXxwJ85qQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHAZGjxws+neESThrS3p76aNntUDuRWlxwZYyDCSpJMHPCopumJ67WUOQKiG5yRF0nDZdjsF+5SAGFbR+8yzfENZteKfxaYy1t5zhmI18cW87dFiF3sVGcLMAjU0+jWSQJRMressbwgobAdnpFFmZuPStCQJK1DdC59UZDqg/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jX4NYLS/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jX4NYLS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707692240; x=1739228240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EncUszjzPei1cQnSJlHdqU/x+Dae9LFh7EXxwJ85qQc=;
  b=jX4NYLS/gZPqJgd40nO0j7+XQu0yDQyD2VcPf2B9NXqPMQDHpC6AhDR+
   NJUwj3oc2cyFJ/kZbpnDfgu6HUMVfFumh4UcrlWMNoaQtHLHcvFTT/IX0
   jXt6XJtnE/UJq2y8beSCTV0kAg0rBLXod7YY1sL86qGEBag2vh+Vbuyx9
   bgonZ3K7HyK70vWeuRDB/RGwMar4cqrlx48DTCZuajTrYrdH7Ooy8SCBR
   Mi2ZKsy+v5+3nwLFzK6Zf1NnQeGhYsIIwHPvsO4ViQOa7Yqn5X2Oq3sRH
   Bx3JsS6R7S/gIV0tcB+O9rmrKOfiKvyALQtgMbHBQpiegqfq4Zd2xoTsR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="5465827"
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="5465827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 14:57:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,261,1701158400"; 
   d="scan'208";a="7104872"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2024 14:57:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZIlA-0006nm-0C;
	Sun, 11 Feb 2024 22:57:16 +0000
Date: Mon, 12 Feb 2024 06:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Ford <aford173@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V4 2/6] phy: freescale: add Samsung HDMI PHY
Message-ID: <202402120610.umG204mj-lkp@intel.com>
References: <20240210204606.11944-3-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240210204606.11944-3-aford173@gmail.com>

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on arm64/for-next/core arm/for-next arm/fixes kvmarm/next rockchip/for-next soc/for-next linus/master v6.8-rc3 next-20240209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Ford/dt-bindings-phy-add-binding-for-the-i-MX8MP-HDMI-PHY/20240211-044836
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20240210204606.11944-3-aford173%40gmail.com
patch subject: [PATCH V4 2/6] phy: freescale: add Samsung HDMI PHY
config: arc-randconfig-r123-20240211 (https://download.01.org/0day-ci/archive/20240212/202402120610.umG204mj-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240212/202402120610.umG204mj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402120610.umG204mj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/freescale/phy-fsl-samsung-hdmi.c:372:27: sparse: sparse: symbol 'common_phy_cfg' was not declared. Should it be static?
   drivers/phy/freescale/phy-fsl-samsung-hdmi.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/common_phy_cfg +372 drivers/phy/freescale/phy-fsl-samsung-hdmi.c

   371	
 > 372	const struct reg_settings common_phy_cfg[] = {
   373		{ PHY_REG_00, 0x00 }, { PHY_REG_01, 0xd1 },
   374		{ PHY_REG_08, 0x4f }, { PHY_REG_09, 0x30 },
   375		{ PHY_REG_10, 0x33 }, { PHY_REG_11, 0x65 },
   376		/* REG12 pixclk specific */
   377		/* REG13 pixclk specific */
   378		/* REG14 pixclk specific */
   379		{ PHY_REG_15, 0x80 }, { PHY_REG_16, 0x6c },
   380		{ PHY_REG_17, 0xf2 }, { PHY_REG_18, 0x67 },
   381		{ PHY_REG_19, 0x00 }, { PHY_REG_20, 0x10 },
   382		/* REG21 pixclk specific */
   383		{ PHY_REG_22, 0x30 }, { PHY_REG_23, 0x32 },
   384		{ PHY_REG_24, 0x60 }, { PHY_REG_25, 0x8f },
   385		{ PHY_REG_26, 0x00 }, { PHY_REG_27, 0x00 },
   386		{ PHY_REG_28, 0x08 }, { PHY_REG_29, 0x00 },
   387		{ PHY_REG_30, 0x00 }, { PHY_REG_31, 0x00 },
   388		{ PHY_REG_32, 0x00 }, { PHY_REG_33, 0x80 },
   389		{ PHY_REG_34, 0x00 }, { PHY_REG_35, 0x00 },
   390		{ PHY_REG_36, 0x00 }, { PHY_REG_37, 0x00 },
   391		{ PHY_REG_38, 0x00 }, { PHY_REG_39, 0x00 },
   392		{ PHY_REG_40, 0x00 }, { PHY_REG_41, 0xe0 },
   393		{ PHY_REG_42, 0x83 }, { PHY_REG_43, 0x0f },
   394		{ PHY_REG_44, 0x3E }, { PHY_REG_45, 0xf8 },
   395		{ PHY_REG_46, 0x00 }, { PHY_REG_47, 0x00 }
   396	};
   397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
