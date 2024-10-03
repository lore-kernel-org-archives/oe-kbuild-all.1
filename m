Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E023450EE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727936183; cv=none; b=om0qVuMtmg87po61ItZSnDLzBGC9KyOVgBoPdgT3RFkV3RKTbzqJ13jOt+h6To0UgsM8JwbHmubaaPFcv3nClIzZdc5Dv43TyxONXjKIN3EyEvNCPq1Eh2oL0hBCSx2MNHUkxo/9YgWSEkhHOleLJm5xPDQI5PFfZ/p+O2gXtPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727936183; c=relaxed/simple;
	bh=DaRqVu0V0/5Vq40NWUjjHU286m5mbINOxfexRBFVk+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PU/CVgtMsPy3Y/mcdN7rZ6D4M6Ejh81+UJ6oUs30sZHMI8kGMltdd4xbEXbBdHst4WhvjaFDFsWuBv1PSBM7O8cLKPIETOwQUeaq3edZ8HqNXdW9rQI8r99Tp3ijtU88CDaeG5An8QgbnTJbHGapZW9f1NF8CzEnW21AG3Agj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMRlOp91; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMRlOp91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727936182; x=1759472182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DaRqVu0V0/5Vq40NWUjjHU286m5mbINOxfexRBFVk+0=;
  b=lMRlOp91CEbWbp1tpGr4v4tsbce6/x9fRHjS6PyvOOI09G2uzxvhzxAF
   mkLUyMwMs0oZ9//kqWQdtLu/Y9p4yulArMVlRox0UZljN4Skde4fGsVXo
   8ODovrm/+Q23po1FFEjcLsWKX6d6FhfZckd1wmKQ38J0qu9vfmSTR9pnp
   JP5w01i01qGKcMMQLN3/Algn1JPsG+0jQtrU7rWE+EdS2DHlFZmEfnyHx
   AvxWXzrWcmkRbHmqW5X41R/M1vS1VBC01n6dtnUcF/hUI5CBq7zl/YY9F
   1Q5afULhq3BIqjKa21FXF/RiFmcL05EpTrH0JcgZvmsoGcNikcWMzgG2J
   g==;
X-CSE-ConnectionGUID: 5pQaTssRTayCY4CvPOmbSg==
X-CSE-MsgGUID: xofXkT3GTSSFG0OI9VwwZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="44588319"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="44588319"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 23:16:20 -0700
X-CSE-ConnectionGUID: Aiv2gFz2R1iYCYQFyCVsoQ==
X-CSE-MsgGUID: wXQon37bQU2LelL3n1yaUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74491181"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Oct 2024 23:16:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swF8J-00007U-32;
	Thu, 03 Oct 2024 06:16:15 +0000
Date: Thu, 3 Oct 2024 14:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 1520/2170] kismet: WARNING: unmet direct
 dependencies detected for PINCTRL_IMX_SCU when selected by PINCTRL_IMX8QM
Message-ID: <202410031439.GyTSa0kX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c02d24a5af66a9806922391493205a344749f2c4
commit: a55222b7a1327fabad71e1e61661077ab66bb98d [1520/2170] pinctrl: freescale: enable use with COMPILE_TEST
config: x86_64-kismet-CONFIG_PINCTRL_IMX_SCU-CONFIG_PINCTRL_IMX8QM-0-0 (https://download.01.org/0day-ci/archive/20241003/202410031439.GyTSa0kX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241003/202410031439.GyTSa0kX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031439.GyTSa0kX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PINCTRL_IMX_SCU when selected by PINCTRL_IMX8QM
   WARNING: unmet direct dependencies detected for PINCTRL_IMX_SCU
     Depends on [n]: PINCTRL [=y] && IMX_SCU [=n]
     Selected by [y]:
     - PINCTRL_IMX8QM [=y] && PINCTRL [=y] && OF [=y] && (IMX_SCU [=n] && ARCH_MXC && ARM64 || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
