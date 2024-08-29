Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA3A15AF6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724894443; cv=none; b=T6hni7iWrshZyN+oUdFEumbbFU1XLSiJQfwYCZlSWhDARhH6L+XH5THyx4Zox3VxNOQupnqITXN/ELzuWPTZOTcvM4ZAQrhdcefgAFPVOYarjnz7fW8toWLkQy3D2FCfrbuQoF8K50IPXQXVyTEDwflLhpNoMOWk4WytL9vnW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724894443; c=relaxed/simple;
	bh=g+JB9LdbP6vhR5qyJGxTCdi/HM0G4GdksJG9S6M4OyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJM9HhmC8y3no+SSzQ/hJzq96GB5hhkEW+QzIL3yE9bTpqkBIf/ByUAr83lw95iCDk1WNPfnFsPfOk1hHGNZEsPSfIDWRir1h4ZJZK7lQ9ujwRg6HIcvPqv+0eWgsZJMX7HO6rPRKY2N2iSSZdYCAfUNk79KzXeCbIefxjZWbgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1c0QPBj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1c0QPBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724894442; x=1756430442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g+JB9LdbP6vhR5qyJGxTCdi/HM0G4GdksJG9S6M4OyI=;
  b=b1c0QPBjwWCdJvEVlhjY9b9uuP3n5ZmiZ0fv/RSiDZpvtl87LD/ywJDy
   /+/XA1bJinDtuWWkdHAiVWk9YeV6ol2BaRvUnN2NhqsNxBNJAWukIJXuw
   03ZCbGMbRK84xk39I4qTfRzbQ5EKtN9L9oCP50XIpcF+K05jsQYkKSfe6
   gvMUqf2IIumm37jdDFqWB94us1LR8PtP3v/xiJIuc3ylmWmiQH188BSqR
   9u8wrJM9HxvaFmqCYCI0gIhbRuJ9yXcQiLgb9+EnvQrCJ00pdwumfEJU0
   eXUdGjwJQ0Zse6/fInMdZt0R1HsJMrm4jcfSMLS7vHB8BIZV7FpP8N4D8
   Q==;
X-CSE-ConnectionGUID: tkoJKpqvTFqGWPcHgV79HA==
X-CSE-MsgGUID: LFj9KLdaQJu7Qm2R/RcIvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23627128"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="23627128"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 18:20:38 -0700
X-CSE-ConnectionGUID: oNr+9nbwR2Sx2s0ojtu5Xg==
X-CSE-MsgGUID: AouddBY0QTilUvk6SrubjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="64106754"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Aug 2024 18:20:37 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjTpy-000LXo-0h;
	Thu, 29 Aug 2024 01:20:34 +0000
Date: Thu, 29 Aug 2024 09:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: luyulin <luyulin@eswincomputing.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 14/24]
 include/linux/pinctrl/pinconf-generic.h:230:undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202408290958.PMR6Niz8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: c13db09dcd22d18760c2219e95cfce2243986d4e [14/24] drivers: pinctrl: Add pincontrol driver for EIC7700
config: sh-randconfig-r052-20240829 (https://download.01.org/0day-ci/archive/20240829/202408290958.PMR6Niz8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408290958.PMR6Niz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408290958.PMR6Niz8-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/pinctrl/pinctrl-eic7700.o: in function `pinconf_generic_dt_node_to_map_all':
>> include/linux/pinctrl/pinconf-generic.h:230:(.text+0x410): undefined reference to `pinconf_generic_dt_node_to_map'


vim +230 include/linux/pinctrl/pinconf-generic.h

0d74d4a161c9f9 Linus Walleij   2013-08-15  219  
e5530adc17a79f Andy Shevchenko 2022-10-07  220  static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev,
e5530adc17a79f Andy Shevchenko 2022-10-07  221  		struct device_node *np_config, struct pinctrl_map **map,
e5530adc17a79f Andy Shevchenko 2022-10-07  222  		unsigned *num_maps)
31c89c95966719 Soren Brinkmann 2015-01-09  223  {
31c89c95966719 Soren Brinkmann 2015-01-09  224  	/*
31c89c95966719 Soren Brinkmann 2015-01-09  225  	 * passing the type as PIN_MAP_TYPE_INVALID causes the underlying parser
31c89c95966719 Soren Brinkmann 2015-01-09  226  	 * to infer the map type from the DT properties used.
31c89c95966719 Soren Brinkmann 2015-01-09  227  	 */
31c89c95966719 Soren Brinkmann 2015-01-09  228  	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
31c89c95966719 Soren Brinkmann 2015-01-09  229  			PIN_MAP_TYPE_INVALID);
31c89c95966719 Soren Brinkmann 2015-01-09 @230  }
394349f7789fdf Linus Walleij   2011-11-24  231  

:::::: The code at line 230 was first introduced by commit
:::::: 31c89c959667194350f496947b576c149503ce98 pinctrl: pinconf-generic: Infer map type from DT property

:::::: TO: Soren Brinkmann <soren.brinkmann@xilinx.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
