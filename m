Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBB158527
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 23:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732923728; cv=none; b=QJTobrQksosrCYEKERaTyC16aNeh0xzwLMoeGlJnMu1B5/Fg1nJHsLr+/xbUTFzARZB6TRuJR+gY5a4+lZarPvCnPQUnSvKPS/lRGD5+26Cc5nB1su+LbtiOxjYVEB2Q7vmQHILqgv6DklsB8Ywm/c0AgKoW1Y9NQkp3ECulb+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732923728; c=relaxed/simple;
	bh=iRxoav3iM0VeqOIPiSzLhY41h3rQokQe+kIwj1ePrnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNW9aTEV5zgP97wF8SFwLgu4Npce7rfNpYvYYcazAO3F4QH5lRNa2tM9I2Dc1TwcWlFZQYlJ2cn3PV+Mmy84JXH/uwLdI21jX+xswAmYlhJKWWuuAduyVXSw89XVDDyRqdfEryyRVAnCuHso1H5GIC96YOLqZIg6Tev+jzbjG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsD3qjF6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsD3qjF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732923727; x=1764459727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRxoav3iM0VeqOIPiSzLhY41h3rQokQe+kIwj1ePrnU=;
  b=BsD3qjF6uKAHf2A18Zo2sq1GCVcvDtoKyMTOgQ4Zt7e1DxTxvu2p/3pn
   8YEhOxvmy8fs3nmRo19TTfD9FM5VgeLuq2RgTtPIs8WBR/7IfIkUWVj5R
   7FaClSoRa/hLa1++zKxL7SwZIFZx4JwwTb09AoLFp26ZaGAkT5dq0/akp
   yb1kxzXfqEq4IYn7aiHv2AMqKNS5Q2kx3fQ6E6Y7hGQQ1DQjJRLmoFtfH
   O9unaqZuJS2wSplKRSMw8UAjR0fKxG281o7MMYYIJlBRRoub6osqKpHgi
   IG97MV4pZmQgjVgmjH8FiQi0u31GkjRzpFbTX6FMqMlBSdRRVZAlSFCtT
   w==;
X-CSE-ConnectionGUID: xyuaxEVUSku6twa/D/sIJw==
X-CSE-MsgGUID: CwsQtJTXQ+qkjkmzqCKK6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="20746093"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="20746093"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 15:42:06 -0800
X-CSE-ConnectionGUID: /h4PwfhuRi2WmltBwixGLg==
X-CSE-MsgGUID: gCfgCujjSTCq6zGDqXs0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="97358380"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Nov 2024 15:42:06 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHAcd-0000ln-0m;
	Fri, 29 Nov 2024 23:42:03 +0000
Date: Sat, 30 Nov 2024 07:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.12.0-scu4-dt-overlay 29/30] drivers/i2c/i2c-core.h:97:49:
 error: unknown type name 'gpio_chip'
Message-ID: <202411300732.AiwTuU7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.12.0-scu4-dt-overlay
head:   6a87eb702125c86f68c9c466c941b914713c8252
commit: 8aae31b5d95b83a200d406db1b9c0108e36eb5a4 [29/30] i2c: Add node with phandle and entry to __symbols__ for DT overlays
config: sh-ecovec24-romimage_defconfig (https://download.01.org/0day-ci/archive/20241130/202411300732.AiwTuU7p-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300732.AiwTuU7p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300732.AiwTuU7p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-boardinfo.c:13:
>> drivers/i2c/i2c-core.h:97:49: error: unknown type name 'gpio_chip'
      97 | static inline void of_i2c_make_adapter_dev_node(gpio_chip *chip) {};
         |                                                 ^~~~~~~~~
--
   In file included from drivers/i2c/i2c-core-base.c:46:
>> drivers/i2c/i2c-core.h:97:49: error: unknown type name 'gpio_chip'
      97 | static inline void of_i2c_make_adapter_dev_node(gpio_chip *chip) {};
         |                                                 ^~~~~~~~~
   drivers/i2c/i2c-core-base.c: In function 'i2c_del_adapter':
>> drivers/i2c/i2c-core-base.c:1797:9: error: implicit declaration of function 'of_i2c_remove_adapter_dev_node'; did you mean 'of_i2c_make_adapter_dev_node'? [-Wimplicit-function-declaration]
    1797 |         of_i2c_remove_adapter_dev_node(adap);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         of_i2c_make_adapter_dev_node


vim +/gpio_chip +97 drivers/i2c/i2c-core.h

    91	
    92	#ifdef CONFIG_OF_DYNAMIC
    93	void of_i2c_remove_adapter_dev_node(struct i2c_adapter *adap);
    94	void of_i2c_make_adapter_dev_node(struct i2c_adapter *adap);
    95	#else
    96	static inline void of_i2c_make_adapter_dev_node(struct i2c_adapter *adap) {};
  > 97	static inline void of_i2c_make_adapter_dev_node(gpio_chip *chip) {};
    98	#endif
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
