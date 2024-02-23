Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517AD1B95F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 09:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708680346; cv=none; b=jE4zne/2cMe+oV3venUTct90lM7Ae+zgWjcD6bNPyZEH8WmG4qjP/bF4TxTuYQXSp4WsdhrSxby/fxfByarNq8ruV/Dxf4G9r0LYnfwwrNVfxu8xDZyS0V/qlm5azGAXU3mlrypsIQ+mKh3e2QImF8H1OJrAes0QidgEpQ6O5g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708680346; c=relaxed/simple;
	bh=O6wCPEDf5O+9Pu6YvSeWPM1PWp4R5rgRpm3yLHS4Ljc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o7kBUr6l3FTk6lYwVpBGGbfdnwhnZ2S+AVVkpDz/NkeXptL29fDfoj81GTFmyDKrYJmpkBctfIP5f6TrOhjvD4ZZvxv6YIdqc5rcm80xFnvnuVDNVUEqiQjhAbh3CA5PPKFXkLbvwkIbLRLfANgZ1mF3YCztPlxuGJ2hgb6vC9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3Y6wDNK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3Y6wDNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708680344; x=1740216344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O6wCPEDf5O+9Pu6YvSeWPM1PWp4R5rgRpm3yLHS4Ljc=;
  b=X3Y6wDNKXmA504rnHMK48h/Llzyd7F3HIn6qSHUFvNlk2fxMgnjK9u/l
   mxIO8TAgvMAPgprST1n9gJTzq3OV6w4hJwSyNyOW/nzBvjId7aYGt8GyE
   lBhutnEimQzxiWwMxlwMGg3K6ozmTPTWlACn0k/oqKWXT/C74c0MhczX/
   FCiSBRzmPgNKvFYwXhaHFblf7STS7mHSoCFkndDq8UqEmwpIQbKz5DV6p
   MR41a1NSk5Ey79nWGk2KuzHrtvVSmTCXtivpR7v6pOW0b4o91MnEetW5Q
   WQ5lBosh9lFX+XvG4HTWxU7XnvBjQrrg3t+yIWvlThI5pCfcipSusahZD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20426256"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20426256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 01:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10456654"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Feb 2024 01:25:41 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdRnw-0007H2-2j;
	Fri, 23 Feb 2024 09:25:30 +0000
Date: Fri, 23 Feb 2024 17:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: "andy.shevchenko" <andy.shevchenko@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [brgl:gpio/for-next 42/42] undefined reference to `iowrite64be'
Message-ID: <202402231729.PvxQ1uRx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   36e44186e0badfda499b65d4462c49783bf92314
commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/42] gpio: mmio: Support 64-bit BE access
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240223/202402231729.PvxQ1uRx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402231729.PvxQ1uRx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231729.PvxQ1uRx-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/gpio/gpio-mmio.o: in function `bgpio_write64be':
>> (.text+0x910): undefined reference to `iowrite64be'
>> alpha-linux-ld: (.text+0x920): undefined reference to `iowrite64be'
   alpha-linux-ld: drivers/gpio/gpio-mmio.o: in function `bgpio_read64be':
>> (.text+0x95c): undefined reference to `ioread64be'
>> alpha-linux-ld: (.text+0x964): undefined reference to `ioread64be'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
