Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3286180A6A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 11:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726658238; cv=none; b=k9RFXIM3fxYN5e6u7xCtsvTC+MBTP5YfuBs0exIK6FLGHg73MUXSquw71ePo19PEFandXoHDAilZP3CrBuK3nwSM2VTySZdDCKNIiGzQqc4zGXNOHZy4KDy539Yi+bLrArej5gdJnUblu0fa5+bNQ/ku131NdCZo+52r+FgDBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726658238; c=relaxed/simple;
	bh=Ho5YcLsnJMASZix+ihGxg71Lwspxpo+27CzuWATqWMU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVEJqhL0CxxG6wlT+rf420HE4NTqDrVeoyUsYNL2q6IzT3Hty9/A7ylGXk/6Oe8oq9nze2PIPrxcZs/FueTN+f21pq59RyyLo8PyHZ5+yz3liQiircI7VpJh1ccVs1roC5aG6l1gBw3gqIsqQaAMNHfHTaVQsYiPbGZm62VTs1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2BfAFEM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2BfAFEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726658236; x=1758194236;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Ho5YcLsnJMASZix+ihGxg71Lwspxpo+27CzuWATqWMU=;
  b=B2BfAFEMmFoycyTlDh/mDqum2Ml/te/chdZ/C1DROE2SOa7cBbQihxVa
   eqb6fCzWAQHQRlHTdLhs4V9Xovzg+GlRQUSscPHo8fwfhAhp4szvdr48g
   ZCfsqeGAlnqHSc6N63R/rByCFYvS8FRkZfLh7VetWrt8BEzZf2lrNuYBP
   0T0jYcucBYZIaJG8+iwH7oU2zawOEhRHQlUw9K8WPvPoWnWL5MWXC4Cpc
   jignmYbig19d7Wh0sCsy9Es0RwslTCtsaX2v8gcrWkFvsccwBm/5zuln1
   AKLjG6hDUwrfmoNMyjtzTwwkaYCc0suPSjpQQMUvyziYhyqzp5ezNZeOp
   Q==;
X-CSE-ConnectionGUID: WQ8UIaCQSW+tKua/fMa0Qg==
X-CSE-MsgGUID: StjNYkfuRDq55RJrhbzrMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25757521"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="25757521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 04:17:15 -0700
X-CSE-ConnectionGUID: KbImJmuBSQ6QkMOUyFnWQg==
X-CSE-MsgGUID: rOdB3gUIS9yMw0rXnbjG+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69604475"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2024 04:17:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqsgJ-000CBy-3A;
	Wed, 18 Sep 2024 11:17:11 +0000
Date: Wed, 18 Sep 2024 19:16:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] kismet: WARNING: unmet direct
 dependencies detected for OF_GPIO when selected by VIDEO_DS90UB960
Message-ID: <202409181916.j1yjhoOf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   96b0ebd82722d16e9ab646cd3a73080e6f790747
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: nios2-kismet-CONFIG_OF_GPIO-CONFIG_VIDEO_DS90UB960-0-0 (https://download.01.org/0day-ci/archive/20240918/202409181916.j1yjhoOf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409181916.j1yjhoOf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181916.j1yjhoOf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by VIDEO_DS90UB960
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=n] && OF [=y] && HAS_IOMEM [=y]
     Selected by [y]:
     - VIDEO_DS90UB960 [=y] && MEDIA_SUPPORT [=y] && OF [=y] && I2C [=y] && VIDEO_DEV [=y]
   
   WARNING: unmet direct dependencies detected for MEDIA_TUNER_XC5000
     Depends on [n]: (MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n] || MEDIA_RADIO_SUPPORT [=n] || MEDIA_SDR_SUPPORT [=n]) && MEDIA_SUPPORT [=y] && I2C [=y]
     Selected by [y]:
     - VIDEO_TM6000 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && STAGING_MEDIA_DEPRECATED [=y] && VIDEO_DEV [=y] && I2C [=y] && INPUT [=y] && RC_CORE [=y] && USB [=y]
   
   WARNING: unmet direct dependencies detected for MEDIA_TUNER_XC2028
     Depends on [n]: (MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n] || MEDIA_RADIO_SUPPORT [=n] || MEDIA_SDR_SUPPORT [=n]) && MEDIA_SUPPORT [=y] && I2C [=y]
     Selected by [y]:
     - VIDEO_TM6000 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && STAGING_MEDIA_DEPRECATED [=y] && VIDEO_DEV [=y] && I2C [=y] && INPUT [=y] && RC_CORE [=y] && USB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
