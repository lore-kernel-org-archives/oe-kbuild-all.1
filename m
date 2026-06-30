Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB63622097
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 04:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782794862; cv=none; b=HgXDhwE1DUdNOYPNSUNpL1lIjx8XiqYRi460CIdXRJMfO4kw0daJAw8Kity/ThgSNz2pdSkdqrdfSWDW1hAS8CKPjhgGVVJhRYm7LQxWPouRG83IZc6oqLxlCwl9MwIwIu7iO5TujNqgGEHMlM37CDpxvz87sR9/8kA8mMmzgWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782794862; c=relaxed/simple;
	bh=L6h4F5BU2MrCykbXZJfqMY3RcXytTkcUKqsbemBCfco=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DWIyN9+DzuMNL4FNVS+7NE5w0mv9YOEC2mzdMtg2SZFpHJsDi0ZTqawg3CGABQtghuyaylDRRTczOs3xE1GbHtAN3J1V9zU4g/kR5Rwda0ctpdVhV+qkx0tXSAQiUU0r/FWfzFLZZpb8HQuzwdB/nCFscTlokPgi0CRVUP6JErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xba0iAmF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xba0iAmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782794860; x=1814330860;
  h=date:from:to:cc:subject:message-id;
  bh=L6h4F5BU2MrCykbXZJfqMY3RcXytTkcUKqsbemBCfco=;
  b=Xba0iAmFi5DRg/xo6DfoOMF6plpNDvZQjf9CKL2o5Yb+DyS+JhyCf2KH
   N2na8LUsL4qpOevgASJ2y2qIT6YqRpAUMf1EVGp+rigtGj/X8WPXC8rNl
   sbag75nHL4nzyJquJ98AjCzOg+w+bYJ6uVy/pCiKB/FMDiXUkUOgs+JNX
   ZZExooaKDZrZPeNsSoBolkGWwOZVueiA6/7Awgc5LuxcOobY+vc+W8cmS
   WUAd4HjBGXKmMIW/SERQbnbRALrXZu6+xreoyQcjp1mVacTX8vBVDN4hr
   eZ7saTosRFQv3Et33Pb7VfbTVfoTmW7B2MHCeH6Crn4/EULRN6qC+2PMz
   g==;
X-CSE-ConnectionGUID: 3uK0cjXVTjG/xB9LOvpZWg==
X-CSE-MsgGUID: jRoxpt8wSm6vjNmUUKC6KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83634578"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83634578"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 21:47:39 -0700
X-CSE-ConnectionGUID: A2jwblI6QjmiNExRLnYs2g==
X-CSE-MsgGUID: QcDU57GDTJWDM/TPU2G+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="245813326"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jun 2026 21:47:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weQNd-00000000817-2WpC;
	Tue, 30 Jun 2026 04:47:30 +0000
Date: Tue, 30 Jun 2026 12:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 95/160]
 drivers/net/dsa/mxl862xx/mxl862xx-api.h:2154:6: error: nested redefinition of
 'enum mxl862xx_port_type'
Message-ID: <202606301223.B3ESUnM6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 78b80c34a4169c4e258421dd004ea2fc640a8b4f [95/160] net: dsa: mxl862xx: trap link-local and multicast snooping frames to CPU
config: arm-randconfig-004-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301223.B3ESUnM6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301223.B3ESUnM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301223.B3ESUnM6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/dsa/mxl862xx/mxl862xx.c:23:
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2154:6: error: nested redefinition of 'enum mxl862xx_port_type'
    enum mxl862xx_port_type {
         ^~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2154:6: error: redeclaration of 'enum mxl862xx_port_type'
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1206:6: note: originally defined here
    enum mxl862xx_port_type {
         ^~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2155:2: error: redeclaration of enumerator 'MXL862XX_LOGICAL_PORT'
     MXL862XX_LOGICAL_PORT = 0,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1207:2: note: previous definition of 'MXL862XX_LOGICAL_PORT' was here
     MXL862XX_LOGICAL_PORT = 0,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2156:2: error: redeclaration of enumerator 'MXL862XX_PHYSICAL_PORT'
     MXL862XX_PHYSICAL_PORT,
     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1208:2: note: previous definition of 'MXL862XX_PHYSICAL_PORT' was here
     MXL862XX_PHYSICAL_PORT,
     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2157:2: error: redeclaration of enumerator 'MXL862XX_CTP_PORT'
     MXL862XX_CTP_PORT,
     ^~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1209:2: note: previous definition of 'MXL862XX_CTP_PORT' was here
     MXL862XX_CTP_PORT,
     ^~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2158:2: error: redeclaration of enumerator 'MXL862XX_BRIDGE_PORT'
     MXL862XX_BRIDGE_PORT,
     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1210:2: note: previous definition of 'MXL862XX_BRIDGE_PORT' was here
     MXL862XX_BRIDGE_PORT,
     ^~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:16:
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2154:6: error: nested redefinition of 'enum mxl862xx_port_type'
    enum mxl862xx_port_type {
         ^~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2154:6: error: redeclaration of 'enum mxl862xx_port_type'
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1206:6: note: originally defined here
    enum mxl862xx_port_type {
         ^~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2155:2: error: redeclaration of enumerator 'MXL862XX_LOGICAL_PORT'
     MXL862XX_LOGICAL_PORT = 0,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1207:2: note: previous definition of 'MXL862XX_LOGICAL_PORT' was here
     MXL862XX_LOGICAL_PORT = 0,
     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2156:2: error: redeclaration of enumerator 'MXL862XX_PHYSICAL_PORT'
     MXL862XX_PHYSICAL_PORT,
     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1208:2: note: previous definition of 'MXL862XX_PHYSICAL_PORT' was here
     MXL862XX_PHYSICAL_PORT,
     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2157:2: error: redeclaration of enumerator 'MXL862XX_CTP_PORT'
     MXL862XX_CTP_PORT,
     ^~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1209:2: note: previous definition of 'MXL862XX_CTP_PORT' was here
     MXL862XX_CTP_PORT,
     ^~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:2158:2: error: redeclaration of enumerator 'MXL862XX_BRIDGE_PORT'
     MXL862XX_BRIDGE_PORT,
     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1210:2: note: previous definition of 'MXL862XX_BRIDGE_PORT' was here
     MXL862XX_BRIDGE_PORT,
     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c: In function 'mxl862xx_serdes_get_stats':
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:502:14: error: implicit declaration of function 'mxl862xx_xpcs_port_id'; did you mean 'mxl862xx_pcs_config'? [-Werror=implicit-function-declaration]
      .port_id = mxl862xx_xpcs_port_id(port),
                 ^~~~~~~~~~~~~~~~~~~~~
                 mxl862xx_pcs_config
   cc1: some warnings being treated as errors


vim +2154 drivers/net/dsa/mxl862xx/mxl862xx-api.h

23794bec1cb606f Daniel Golle 2026-02-07  2146  
e6295d124644b14 Daniel Golle 2026-04-12  2147  /**
e6295d124644b14 Daniel Golle 2026-04-12  2148   * enum mxl862xx_port_type - Port Type
e6295d124644b14 Daniel Golle 2026-04-12  2149   * @MXL862XX_LOGICAL_PORT: Logical Port
e6295d124644b14 Daniel Golle 2026-04-12  2150   * @MXL862XX_PHYSICAL_PORT: Physical Port
e6295d124644b14 Daniel Golle 2026-04-12  2151   * @MXL862XX_CTP_PORT: Connectivity Termination Port (CTP)
e6295d124644b14 Daniel Golle 2026-04-12  2152   * @MXL862XX_BRIDGE_PORT: Bridge Port
e6295d124644b14 Daniel Golle 2026-04-12  2153   */
e6295d124644b14 Daniel Golle 2026-04-12 @2154  enum mxl862xx_port_type {
e6295d124644b14 Daniel Golle 2026-04-12  2155  	MXL862XX_LOGICAL_PORT = 0,
e6295d124644b14 Daniel Golle 2026-04-12  2156  	MXL862XX_PHYSICAL_PORT,
e6295d124644b14 Daniel Golle 2026-04-12  2157  	MXL862XX_CTP_PORT,
e6295d124644b14 Daniel Golle 2026-04-12  2158  	MXL862XX_BRIDGE_PORT,
e6295d124644b14 Daniel Golle 2026-04-12  2159  };
e6295d124644b14 Daniel Golle 2026-04-12  2160  

:::::: The code at line 2154 was first introduced by commit
:::::: e6295d124644b14a12b55edf5d3e89cf86a4a2ce net: dsa: mxl862xx: add ethtool statistics support

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
