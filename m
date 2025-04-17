Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370AB253F28
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908007; cv=none; b=GPIBYKVOQZMMy5bhuCwaC2245LIQwWMpFh/8jFkOnMkBo2FA9UOryJdkbeF0ZlqS7mFwmOkm8sRq/ZU7ZrKIHI0nGLL5AF2ACrR/WV7VVsyJHB4uT0r50Goxb8ofqogxbOimwWA/VCe+eFhBlqLdxQZq4ocfnJnMXu2yOtJPNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908007; c=relaxed/simple;
	bh=HK9dWcEeQyiylAW4hxiD6pm/era2bq2i0I+BKeTiuvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkZJ5eZPGUUWP0qEPsJmKDRVFQwy1x6+fKMWh2rlUjKsmXDvN6ucDTcQBvg4diqc2TowbJ7J47iA7zd6gqhRgGVrFUX4z3/aYjK1MUgvqLjbTrWbCsGDNMTlsgNaXm6iV7G3rcViXqPdP6U9gAQtt3R1qsEWdGLfP9sWnb6Ix0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C00hDIbE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C00hDIbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744908006; x=1776444006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HK9dWcEeQyiylAW4hxiD6pm/era2bq2i0I+BKeTiuvU=;
  b=C00hDIbEg6tOL6QwB9It6AHt4CYq/JzqW1zatntJ7tk5PHISAJLn8y34
   PTd0ZvAq4ntFwoCOHHrcsr6VAPFxlL8ZELMtCn1Fvxv8Vfnur3SFyTOAf
   +twgAEC4oOI0Y6lqmDopKbFOpqpnSbZphQGUCk5bzAcHauHj6fpw3c3nK
   +rarlSVeWRhrC9srZKs3gbXwhwQhi6BjNKQWZNW7FiJX/PN+L1Jcd4gUN
   VWB8qQ9KtJXgYMZXyzfwaxYrBPckHHGpBrbvvlitxOdis1nZwL9lb56PS
   RKjfIMZu9HKbpDwpHIVTITtxI1d+usLWJL8/lI5KMHmsxDqnids6C/y2j
   A==;
X-CSE-ConnectionGUID: k/MFje5yTkCQO8NsJIiNwQ==
X-CSE-MsgGUID: GlPDNq2uRaiiKsf3Iw1aRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57501115"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57501115"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:40:06 -0700
X-CSE-ConnectionGUID: 1SP4gisRRQG24N8DK3MwRw==
X-CSE-MsgGUID: BiPzncNrRsq3BqfVeXHhMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130789569"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2025 09:40:03 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5SHQ-0000W7-1g;
	Thu, 17 Apr 2025 16:40:00 +0000
Date: Fri, 18 Apr 2025 00:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: Re: [PATCH v3 02/10] pinctrl: core: add
 devm_pinctrl_register_mappings()
Message-ID: <202504180047.vMkMYzD4-lkp@intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee@bootlin.com>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Richard/gpiolib-add-support-to-register-sparse-pin-range/20250416-221852
base:   8a834b0ac9ceb354a6e0b8cf5b363edca8221bdd
patch link:    https://lore.kernel.org/r/20250416-aaeon-up-board-pinctrl-support-v3-2-f40776bd06ee%40bootlin.com
patch subject: [PATCH v3 02/10] pinctrl: core: add devm_pinctrl_register_mappings()
config: i386-buildonly-randconfig-003-20250417 (https://download.01.org/0day-ci/archive/20250418/202504180047.vMkMYzD4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180047.vMkMYzD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180047.vMkMYzD4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pinctrl/pinconf-generic.h:16,
                    from drivers/pinctrl/renesas/sh_pfc.h:12,
                    from drivers/pinctrl/renesas/pfc-r8a77965.c:18:
>> include/linux/pinctrl/machine.h:158:50: warning: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration
     158 | extern int devm_pinctrl_register_mappings(struct device *dev,
         |                                                  ^~~~~~


vim +158 include/linux/pinctrl/machine.h

   155	
   156	extern int pinctrl_register_mappings(const struct pinctrl_map *map,
   157					     unsigned int num_maps);
 > 158	extern int devm_pinctrl_register_mappings(struct device *dev,
   159						  const struct pinctrl_map *map,
   160						  unsigned int num_maps);
   161	extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
   162	extern void pinctrl_provide_dummies(void);
   163	#else
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
