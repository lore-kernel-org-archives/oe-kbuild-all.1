Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3B16F510
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 22:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712271202; cv=none; b=IsIYNovb+jjwGiG/5VYTWnB1LXkhvh1Xr6KVlrJ1CwCvhxp4Z0nby9i69oAoRgoDIQRbthEfBWyA8KS04wnlyeWtJj87O61lJpwGiYWWlkvvKOmtqwTeOrWNcgDYe9XUW/7TEAWAeHkXPMgIj2Rp0Q2q+MzCBQNGJZXxg9/VSL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712271202; c=relaxed/simple;
	bh=nHDeIZjgG/ABq+COPbhriixxj1CJ1aiFsFPnz9B5/Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmH84ftGdrhAxB7+E530Leuh+M/PB6zchSqMkoje14InQuIxeKUHYwTbOzrkY5Z47kvw83r8o+kNartVKBd50SdkdDJmVYyZNJPAfY0niv3ItnibHUMp24oEf8VqduMrmef+PeXfghdS1Hh/eEzbmpuG+DEvlnAhe3nTese+wjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSE7T0LO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSE7T0LO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712271201; x=1743807201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nHDeIZjgG/ABq+COPbhriixxj1CJ1aiFsFPnz9B5/Ew=;
  b=YSE7T0LOrgiY1+x2EnQOfJT7jNQAqI2KPn+fJxoiVbSzj3J0uYXc4RKC
   /XVeUvP3vNyqWU23hsc0KgMrD2JuElBppI7pZaPwrD+0W82W8LBtjirRD
   pQJ3YoNONKZeCcmeslrp9wj34Z1M4lbgs1V9VCs2CPz0VfMORkMWY8Gic
   BhO3eTAqq5eJ2mteK54tyuGC4NvknI6aCTVu5bZSj8OJQxUquKGqHh4sv
   TiGvpHnpHu2vCDZhF9wlmCpZEUPL7dXD+4JG+W69RHaIdSqec8xCesAg1
   QGwyNu4UI6dbv0BoQ3RwokccCzSOYjucQOg1E9/6dGeftBlWswOXZAY3y
   Q==;
X-CSE-ConnectionGUID: iJCuNgVrS32Jy9Q9TrnUpQ==
X-CSE-MsgGUID: 1xxOL58ZSj2n7MHKFO9iiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7747174"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7747174"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 15:53:21 -0700
X-CSE-ConnectionGUID: DMVI8dVNQt+mFpCKldjuFw==
X-CSE-MsgGUID: qHDgff3ISNujXJMguBDG9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="50191958"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 15:53:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsVxH-0001b6-2d;
	Thu, 04 Apr 2024 22:53:11 +0000
Date: Fri, 5 Apr 2024 06:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org,
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	saravanak@google.com, willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 08/17] clk: samsung: gs101: add support for cmu_hsi2
Message-ID: <202404050633.EZfOttFD-lkp@intel.com>
References: <20240404122559.898930-9-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404122559.898930-9-peter.griffin@linaro.org>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on robh/for-next clk/clk-next linus/master v6.9-rc2 next-20240404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Griffin/dt-bindings-clock-google-gs101-clock-add-HSI2-clock-management-unit/20240404-205113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20240404122559.898930-9-peter.griffin%40linaro.org
patch subject: [PATCH 08/17] clk: samsung: gs101: add support for cmu_hsi2
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050633.EZfOttFD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050633.EZfOttFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050633.EZfOttFD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/clk/samsung/clk-gs101.c:16:
>> drivers/clk/samsung/clk-gs101.c:3640:7: warning: 'mout_hsi2_mmc_card_p' defined but not used [-Wunused-const-variable=]
    3640 | PNAME(mout_hsi2_mmc_card_p)     = { "fout_shared2_pll", "fout_shared3_pll",
         |       ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:229:44: note: in definition of macro 'PNAME'
     229 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
>> drivers/clk/samsung/clk-gs101.c:3633:7: warning: 'mout_hsi2_bus_p' defined but not used [-Wunused-const-variable=]
    3633 | PNAME(mout_hsi2_bus_p)          = { "dout_cmu_shared0_div4",
         |       ^~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:229:44: note: in definition of macro 'PNAME'
     229 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
>> drivers/clk/samsung/clk-gs101.c:3631:7: warning: 'mout_hsi2_pcie_p' defined but not used [-Wunused-const-variable=]
    3631 | PNAME(mout_hsi2_pcie_p)         = { "oscclk", "dout_cmu_shared2_div2" };
         |       ^~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:229:44: note: in definition of macro 'PNAME'
     229 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^
>> drivers/clk/samsung/clk-gs101.c:3628:7: warning: 'mout_hsi2_ufs_embd_p' defined but not used [-Wunused-const-variable=]
    3628 | PNAME(mout_hsi2_ufs_embd_p)     = { "oscclk", "dout_cmu_shared0_div4",
         |       ^~~~~~~~~~~~~~~~~~~~
   drivers/clk/samsung/clk.h:229:44: note: in definition of macro 'PNAME'
     229 | #define PNAME(x) static const char * const x[] __initconst
         |                                            ^


vim +/mout_hsi2_mmc_card_p +3640 drivers/clk/samsung/clk-gs101.c

  3627	
> 3628	PNAME(mout_hsi2_ufs_embd_p)	= { "oscclk", "dout_cmu_shared0_div4",
  3629					    "dout_cmu_shared2_div2", "fout_spare_pll" };
  3630	
> 3631	PNAME(mout_hsi2_pcie_p)		= { "oscclk", "dout_cmu_shared2_div2" };
  3632	
> 3633	PNAME(mout_hsi2_bus_p)		= { "dout_cmu_shared0_div4",
  3634					    "dout_cmu_shared1_div4",
  3635					    "dout_cmu_shared2_div2",
  3636					    "dout_cmu_shared3_div2",
  3637					    "fout_spare_pll", "oscclk", "oscclk",
  3638					    "oscclk" };
  3639	
> 3640	PNAME(mout_hsi2_mmc_card_p)	= { "fout_shared2_pll", "fout_shared3_pll",
  3641					    "dout_cmu_shared0_div4", "fout_spare_pll" };
  3642	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
