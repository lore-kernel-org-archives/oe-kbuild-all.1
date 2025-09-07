Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895D5183CC3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Sep 2025 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757253365; cv=none; b=V7XvZxRMva1lzVA0oHWB64Y62dNQGfn7qsXY4mLZ+WmkEtd9lKR8SF0+RbH96cMo11XGfaq1R+eJEdPHi+yIrOHP6GD+Z1xBOPVBXcfoe4BdsKrbrkjbLKnjgtcerKgI4VX/wzbB9Ph9d6RBSFP9PC9kYQYUk4Hm3RLwXvhoCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757253365; c=relaxed/simple;
	bh=aICSzrvEH0u9tNRV+p6XDIGtaLTmzuWISdeYx4X8QhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPJSr4c3JeCUwPHV8vlRQQxyYtKdBt6Yszm5QjEQYZm3ykhzUxWVRBRPkxcquUQRq3ZsoEKlh7SCu40eXBhzKNqVPISR216tOtAMnnLHs6iHPY1lXoDDnKQQoHQTKEbMU/GWbgWmJl7VzEsk2MMlOmpI24kXwqeAWu36KDJ44XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2N750GK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2N750GK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757253363; x=1788789363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aICSzrvEH0u9tNRV+p6XDIGtaLTmzuWISdeYx4X8QhY=;
  b=M2N750GKEQyl44s7FZn8Lnocy94pRc4ZIs6mV+ylr6K6/FHnaIMWxWeK
   z3wtMj4yiw6j3OtDkqu8k6BPKq+cQLNaqyaQIBElYk4AE18YWma2d/ZXu
   PolGw6ccUxR0p+uTDB1/w/fHpjowtup9d3fhtPEQwRzv+5dYL8CSp42zr
   Sit0SlxooaRO2lTecsUtdFV1RqHX99eaPoZVCUe1KaSTSTkHr5wuuZKwS
   IFEasytKWaZVYzLvsaQ2xghXQ9cLrwhjjgaTN8QB/bNKbFqnfek9TSzVp
   UX8/b0in+NvUnfsp2Ek0ZERU48G+t0+oZaCbPfIhwjNPf+WyaORfPCS08
   A==;
X-CSE-ConnectionGUID: ytoQDOwJT26hxvBtX+U5YQ==
X-CSE-MsgGUID: PELtP+eVSWWg8pxnlZ+rzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59385442"
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="59385442"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2025 06:56:02 -0700
X-CSE-ConnectionGUID: +AxI0yVySUuw9TXV5Txp0w==
X-CSE-MsgGUID: l86w8Fg4RLqxM34vTz3nKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,246,1751266800"; 
   d="scan'208";a="171755645"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Sep 2025 06:56:02 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvFs7-0002Hr-1d;
	Sun, 07 Sep 2025 13:55:59 +0000
Date: Sun, 7 Sep 2025 21:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 18/22] phy: apple: Add Apple Type-C PHY
Message-ID: <202509072156.F8s3V9JA-lkp@intel.com>
References: <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>

Hi Sven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Sven-Peter/dt-bindings-usb-Add-Apple-dwc3/20250906-234603
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250906-atcphy-6-17-v2-18-52c348623ef6%40kernel.org
patch subject: [PATCH v2 18/22] phy: apple: Add Apple Type-C PHY
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250907/202509072156.F8s3V9JA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250907/202509072156.F8s3V9JA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509072156.F8s3V9JA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/apple/atc.c:2108:11: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    2108 |                         return ret;
         |                                ^~~
   drivers/phy/apple/atc.c:2086:9: note: initialize the variable 'ret' to silence this warning
    2086 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +2108 drivers/phy/apple/atc.c

  2083	
  2084	static int atcphy_load_tunables(struct apple_atcphy *atcphy)
  2085	{
  2086		int ret;
  2087		struct {
  2088			const char *dt_name;
  2089			struct apple_tunable **tunable;
  2090		} tunables[] = {
  2091			{ "apple,tunable-fuses", &atcphy->tunables.fuses },
  2092			{ "apple,tunable-axi2af", &atcphy->tunables.axi2af },
  2093			{ "apple,tunable-common", &atcphy->tunables.common },
  2094			{ "apple,tunable-lane0-usb", &atcphy->tunables.lane_usb3[0] },
  2095			{ "apple,tunable-lane1-usb", &atcphy->tunables.lane_usb3[1] },
  2096			{ "apple,tunable-lane0-cio", &atcphy->tunables.lane_usb4[0] },
  2097			{ "apple,tunable-lane1-cio", &atcphy->tunables.lane_usb4[1] },
  2098			{ "apple,tunable-lane0-dp", &atcphy->tunables.lane_displayport[0] },
  2099			{ "apple,tunable-lane1-dp", &atcphy->tunables.lane_displayport[1] },
  2100		};
  2101	
  2102		for (int i = 0; i < ARRAY_SIZE(tunables); i++) {
  2103			*tunables[i].tunable =
  2104				devm_apple_tunable_parse(atcphy->dev, atcphy->np, tunables[i].dt_name);
  2105			if (IS_ERR(tunables[i].tunable)) {
  2106				dev_err(atcphy->dev, "Failed to read tunable %s: %ld\n",
  2107					tunables[i].dt_name, PTR_ERR(tunables[i].tunable));
> 2108				return ret;
  2109			}
  2110		}
  2111	
  2112		return 0;
  2113	}
  2114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
