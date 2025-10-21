Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2F034C14C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 18:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072932; cv=none; b=i1cCFSqAYxJIcS3h4YEtAq+pa3p9WqsUf1fb4bzTngwZLlDB6U24k14qaSSmeO5/JgdPFQtIc6JHr6doUr1wm5Jh5iSLn7fhfDPn57uUj1mk3HoF7/u8dMvfUWzYHIjfHtUThLD5vYLVC72QHdtU51U6giqZLut3HdxlvtgXrf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072932; c=relaxed/simple;
	bh=gcuB6Kr9UwBGL3I+TqGnJz3X5MXMi1YPq6hiQn3ouZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oO6DzxRq/IJjm7fRKvwhsu0YyyP7czl6bjNIAAlR0oBM+HYUM6OuyiLIV0vTBgD//4R7Kl87u946NMUyTkBd3Y11rbghhGm87yc4TNLpT4acRSIX8qHGz8+nH7qorxxruZCTaKO6jAGz9soowAMUITdq8zzcljBbiTG0HHRzBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUr3Bwr+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUr3Bwr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761072931; x=1792608931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gcuB6Kr9UwBGL3I+TqGnJz3X5MXMi1YPq6hiQn3ouZ0=;
  b=VUr3Bwr+ivgC/dJRpoTxlCGpTkdHLdsfOu4zJ5cNsltN5sT9h8Vyvacn
   wn2Fd+HZFlUD2xlMqIO0JFMJ/BnJWGpaFG1BJ2vU4vV+FO/penHU9x9+S
   iaZ3Ac81RpIfjVmxKbGuE2RzPV9b5WXZmMX/Q6FCWPctGkqqIQ/xPZHkm
   4F2oZrcZCh7V73mDH9De95UdE+EHLKomNLeR3l8KujrWEVECPxwca8xWU
   Aj3DsqU+1SSnCwUrX9Td50HyLJuqE6A5IUpZDYk9JFbMqUr7FA3iR6Dx3
   WhCg/YiR+rzfOwPPz7uoNYT/JH5GoHDHMk/Ux5FQP/5KF+6gyRYg7/cfU
   g==;
X-CSE-ConnectionGUID: phRiA+FATWe0r4GLs3rLFA==
X-CSE-MsgGUID: vPCyCmdrQ86qtcDNAkQgQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63249315"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63249315"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 11:55:31 -0700
X-CSE-ConnectionGUID: qiImKVVKQK27qNIeCippmQ==
X-CSE-MsgGUID: uBOkBxeUQMmtUyMlUa7GfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="183528586"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2025 11:55:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBHW1-000BC9-22;
	Tue, 21 Oct 2025 18:55:25 +0000
Date: Wed, 22 Oct 2025 02:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl-v1 4/7]
 include/linux/pinctrl/pinconf-generic.h:235:undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202510220249.oG8nM3LT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl-v1
head:   2a9e670758f639c552513080c7688b161ef78bf7
commit: 4ebe93ed9c854eedb59a02198d64545c429bbc89 [4/7] pinctrl: add pic64gx "gpio2" pinmux driver
config: x86_64-buildonly-randconfig-001-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220249.oG8nM3LT-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220249.oG8nM3LT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220249.oG8nM3LT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pinconf_generic_dt_node_to_map_all':
>> include/linux/pinctrl/pinconf-generic.h:235:(.text+0x78): undefined reference to `pinconf_generic_dt_node_to_map'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +235 include/linux/pinctrl/pinconf-generic.h

0d74d4a161c9f98 Linus Walleij   2013-08-15  226  
e5530adc17a79f2 Andy Shevchenko 2022-10-07  227  static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev,
e5530adc17a79f2 Andy Shevchenko 2022-10-07  228  		struct device_node *np_config, struct pinctrl_map **map,
e5530adc17a79f2 Andy Shevchenko 2022-10-07  229  		unsigned *num_maps)
31c89c959667194 Soren Brinkmann 2015-01-09  230  {
31c89c959667194 Soren Brinkmann 2015-01-09  231  	/*
31c89c959667194 Soren Brinkmann 2015-01-09  232  	 * passing the type as PIN_MAP_TYPE_INVALID causes the underlying parser
31c89c959667194 Soren Brinkmann 2015-01-09  233  	 * to infer the map type from the DT properties used.
31c89c959667194 Soren Brinkmann 2015-01-09  234  	 */
31c89c959667194 Soren Brinkmann 2015-01-09 @235  	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
31c89c959667194 Soren Brinkmann 2015-01-09  236  			PIN_MAP_TYPE_INVALID);
31c89c959667194 Soren Brinkmann 2015-01-09  237  }
394349f7789fdfc Linus Walleij   2011-11-24  238  

:::::: The code at line 235 was first introduced by commit
:::::: 31c89c959667194350f496947b576c149503ce98 pinctrl: pinconf-generic: Infer map type from DT property

:::::: TO: Soren Brinkmann <soren.brinkmann@xilinx.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
