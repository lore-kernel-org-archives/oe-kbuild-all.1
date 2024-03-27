Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE315099B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 18:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711564481; cv=none; b=heRF6fYjamA1uFwelylvNa+27gN/bYiDgam1INbNCFXKJKkqzyypPHY4NYORmOIKFdrykSNo6yMPlZ/X2XSFqCP5xikThSe3hukGFouJw4fsTQpkS4wZ991ofawUu8y2pUmJmreT3Jb+mXtNZTEF5obFU/KW++1ZYlnw88nhnZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711564481; c=relaxed/simple;
	bh=Zf3UfhIck5KDNQ4IxrlGr07PKbPDztgAtgN/Cvzlkjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biBLwM6gaZvX4yi2aHGZw5a8xEps2XEzroq0OIcpAmHZk+b4BzC0t3Czyy8VKiIjkmS355rHp5LtPg2Tuw837XL7nmDGz+aEZOozi1gfcqlQNYW6p3QQGg/jaf+Sr+f7FHsStfNctZIf9hKj3UJeGbph92layGalZYFtvlwp5vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsYdqusI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsYdqusI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711564479; x=1743100479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zf3UfhIck5KDNQ4IxrlGr07PKbPDztgAtgN/Cvzlkjg=;
  b=JsYdqusIcMun0jBBSGJcDHiPMIqzw+Ozxx8lq1mInVZaYxRecVpt6cbU
   3+WcFhIe1P6k3BuW7aZtaNUE39yb1o9jk3+0qrH9IgVNU1QUs3MIicCgR
   044VmMzf8DnNZXJG6rjlA67QjuV6bxpG/JeeGVlxDCKMgkUvBxaBfV2fC
   wegilxPBMHawHT5+JPTNoAVbzdDkHieVsTCRt50/T+aetyODiokNaqmAR
   j9A1ddkhSbnMYmG5j4IWbEU/rKzPr9iPpse0j3NiN01l8KllwlYciPMqi
   9PW3XMoV6yp8rdOxl49Gh1Jjg8XQxuUwWoQxIkL9kfHbdvWiCLJbQFhsY
   w==;
X-CSE-ConnectionGUID: 3y94DUYySfKtHxb+etZh1w==
X-CSE-MsgGUID: GMjp9kiRQpGMdAyvJOJcRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6803431"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6803431"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 11:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="47384400"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2024 11:34:37 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpY6b-0001Mw-2v;
	Wed, 27 Mar 2024 18:34:33 +0000
Date: Thu, 28 Mar 2024 02:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] spi: cs42l43: Add bridged cs35l56 amplifiers
Message-ID: <202403280258.rjWikSAr-lkp@intel.com>
References: <20240326141108.1079993-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326141108.1079993-4-ckeepax@opensource.cirrus.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on brgl/gpio/for-next linus/master v6.9-rc1 next-20240327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/gpio-swnode-Add-ability-to-specify-native-chip-selects-for-SPI/20240326-221422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20240326141108.1079993-4-ckeepax%40opensource.cirrus.com
patch subject: [PATCH 3/3] spi: cs42l43: Add bridged cs35l56 amplifiers
config: sh-randconfig-r121-20240327 (https://download.01.org/0day-ci/archive/20240328/202403280258.rjWikSAr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240328/202403280258.rjWikSAr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280258.rjWikSAr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-cs42l43.c:48:28: sparse: sparse: symbol 'ampr' was not declared. Should it be static?
>> drivers/spi/spi-cs42l43.c:52:23: sparse: sparse: symbol 'ampl_info' was not declared. Should it be static?
>> drivers/spi/spi-cs42l43.c:61:23: sparse: sparse: symbol 'ampr_info' was not declared. Should it be static?
   drivers/spi/spi-cs42l43.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/ampr +48 drivers/spi/spi-cs42l43.c

    47	
  > 48	const struct software_node ampr = {
    49		.name			= "cs35l56-right",
    50	};
    51	
  > 52	struct spi_board_info ampl_info = {
    53		.modalias		= "cs35l56",
    54		.max_speed_hz		= 2000000,
    55		.chip_select		= 0,
    56		.mode			= SPI_MODE_0,
    57		.swnode			= &ampl,
    58		.use_fwnode_name	= true,
    59	};
    60	
  > 61	struct spi_board_info ampr_info = {
    62		.modalias		= "cs35l56",
    63		.max_speed_hz		= 2000000,
    64		.chip_select		= 1,
    65		.mode			= SPI_MODE_0,
    66		.swnode			= &ampr,
    67		.use_fwnode_name	= true,
    68	};
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
