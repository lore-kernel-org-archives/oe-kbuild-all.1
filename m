Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9A3369980
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 02:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787805; cv=none; b=n5NCpqXspxpV5M3VHIOFw8E9UMwzdvYHlFxsDRoY9AYamLJ6jUdTwvFyf8Vkz+ugqOIUqXHAcPDzWyb1MbSDdma+c0b/5SlrfbSbX44dZ6+p+glgcfdObheUEWaizvt1CJ8vz3GEBqeInocTwRpvcn3WTktln3sSID7iO4W5Zns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787805; c=relaxed/simple;
	bh=dzJtBQpNMSniVGwmLXoLXf7iLNAViwuvKXCaYzmQN4o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=duTnZjLF7vSY20KKkOhhQ3jUiZZx447cdOqu6cxKqRZC5aZTDUjGLMxqjSm1b1aT54GoNILR2YqwCDQIvnJC4up7YTRdFuEhFj+j7iOzilxq7Fr/KRvOzhC9HAs0UhEcAEoEMNDy+66vCFADXQea/bhCtAy4QtmXIU6+lU9a+/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipicdiQd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipicdiQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782787803; x=1814323803;
  h=date:from:to:cc:subject:message-id;
  bh=dzJtBQpNMSniVGwmLXoLXf7iLNAViwuvKXCaYzmQN4o=;
  b=ipicdiQd5M8C7m1QnWSQUIbOqfRYUFPNLBaAvDQ8oUk/+tYSxEPvP+yQ
   jCfQtU37d8/XwvhoICIjfNVAgFN7bE1aQXQ+w4i1pDupn773O4jcXPmeG
   zyb/R5P5uZSzoBcAiwRsYgTT2kVye0PFAcv1Y0JxMSAp73UydTy/GDYVz
   Qj94jJuW6zOUG0w39bycoCSiPxYa2LnDu2U8OErKgqWJCMC9emaUqdBDL
   x6FFu38n9iy0cYK55E2CesWpLVJCCut3zHtO9mk4YsEGANeXbwUAQi551
   z+g5X2XnI4OAFIBIQ/ZVV0pq550WH0JIFnV9cgS9mwN4FDMUkwPbR6xh8
   w==;
X-CSE-ConnectionGUID: Hey5k13UQCGzn6sgVcSnfA==
X-CSE-MsgGUID: 4SypIpB8SzStYWBME5wJDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83549175"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83549175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 19:50:03 -0700
X-CSE-ConnectionGUID: rLTnW2HlTTux7tkYNmgnRg==
X-CSE-MsgGUID: MW1Hb2lARLK7iqsa0FjYhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="252274459"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Jun 2026 19:50:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weOXZ-000000007y1-2sgd;
	Tue, 30 Jun 2026 02:49:37 +0000
Date: Tue, 30 Jun 2026 10:49:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 95/160]
 drivers/net/dsa/mxl862xx/mxl862xx-api.h:2154:6: error: redeclaration of 'enum
 mxl862xx_port_type'
Message-ID: <202606301008.hi5Mjwud-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   39cd8d05e83250c6294b8e0da3ca69359eff8a3c
commit: 78b80c34a4169c4e258421dd004ea2fc640a8b4f [95/160] net: dsa: mxl862xx: trap link-local and multicast snooping frames to CPU
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260630/202606301008.hi5Mjwud-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301008.hi5Mjwud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301008.hi5Mjwud-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/dsa/mxl862xx/mxl862xx.c:23:
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2154:6: error: redeclaration of 'enum mxl862xx_port_type'
    2154 | enum mxl862xx_port_type {
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1206:6: note: originally defined here
    1206 | enum mxl862xx_port_type {
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2155:9: error: redeclaration of enumerator 'MXL862XX_LOGICAL_PORT'
    2155 |         MXL862XX_LOGICAL_PORT = 0,
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1207:9: note: previous definition of 'MXL862XX_LOGICAL_PORT' with type 'enum mxl862xx_port_type'
    1207 |         MXL862XX_LOGICAL_PORT = 0,
         |         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2156:9: error: redeclaration of enumerator 'MXL862XX_PHYSICAL_PORT'
    2156 |         MXL862XX_PHYSICAL_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1208:9: note: previous definition of 'MXL862XX_PHYSICAL_PORT' with type 'enum mxl862xx_port_type'
    1208 |         MXL862XX_PHYSICAL_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2157:9: error: redeclaration of enumerator 'MXL862XX_CTP_PORT'
    2157 |         MXL862XX_CTP_PORT,
         |         ^~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1209:9: note: previous definition of 'MXL862XX_CTP_PORT' with type 'enum mxl862xx_port_type'
    1209 |         MXL862XX_CTP_PORT,
         |         ^~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2158:9: error: redeclaration of enumerator 'MXL862XX_BRIDGE_PORT'
    2158 |         MXL862XX_BRIDGE_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1210:9: note: previous definition of 'MXL862XX_BRIDGE_PORT' with type 'enum mxl862xx_port_type'
    1210 |         MXL862XX_BRIDGE_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:16:
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2154:6: error: redeclaration of 'enum mxl862xx_port_type'
    2154 | enum mxl862xx_port_type {
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1206:6: note: originally defined here
    1206 | enum mxl862xx_port_type {
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2155:9: error: redeclaration of enumerator 'MXL862XX_LOGICAL_PORT'
    2155 |         MXL862XX_LOGICAL_PORT = 0,
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1207:9: note: previous definition of 'MXL862XX_LOGICAL_PORT' with type 'enum mxl862xx_port_type'
    1207 |         MXL862XX_LOGICAL_PORT = 0,
         |         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2156:9: error: redeclaration of enumerator 'MXL862XX_PHYSICAL_PORT'
    2156 |         MXL862XX_PHYSICAL_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1208:9: note: previous definition of 'MXL862XX_PHYSICAL_PORT' with type 'enum mxl862xx_port_type'
    1208 |         MXL862XX_PHYSICAL_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2157:9: error: redeclaration of enumerator 'MXL862XX_CTP_PORT'
    2157 |         MXL862XX_CTP_PORT,
         |         ^~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1209:9: note: previous definition of 'MXL862XX_CTP_PORT' with type 'enum mxl862xx_port_type'
    1209 |         MXL862XX_CTP_PORT,
         |         ^~~~~~~~~~~~~~~~~
>> drivers/net/dsa/mxl862xx/mxl862xx-api.h:2158:9: error: redeclaration of enumerator 'MXL862XX_BRIDGE_PORT'
    2158 |         MXL862XX_BRIDGE_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-api.h:1210:9: note: previous definition of 'MXL862XX_BRIDGE_PORT' with type 'enum mxl862xx_port_type'
    1210 |         MXL862XX_BRIDGE_PORT,
         |         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c: In function 'mxl862xx_serdes_get_stats':
   drivers/net/dsa/mxl862xx/mxl862xx-phylink.c:502:28: error: implicit declaration of function 'mxl862xx_xpcs_port_id'; did you mean 'mxl862xx_pcs_config'? [-Wimplicit-function-declaration]
     502 |                 .port_id = mxl862xx_xpcs_port_id(port),
         |                            ^~~~~~~~~~~~~~~~~~~~~
         |                            mxl862xx_pcs_config


vim +2154 drivers/net/dsa/mxl862xx/mxl862xx-api.h

23794bec1cb606 Daniel Golle 2026-02-07  2146  
e6295d124644b1 Daniel Golle 2026-04-12  2147  /**
e6295d124644b1 Daniel Golle 2026-04-12  2148   * enum mxl862xx_port_type - Port Type
e6295d124644b1 Daniel Golle 2026-04-12  2149   * @MXL862XX_LOGICAL_PORT: Logical Port
e6295d124644b1 Daniel Golle 2026-04-12  2150   * @MXL862XX_PHYSICAL_PORT: Physical Port
e6295d124644b1 Daniel Golle 2026-04-12  2151   * @MXL862XX_CTP_PORT: Connectivity Termination Port (CTP)
e6295d124644b1 Daniel Golle 2026-04-12  2152   * @MXL862XX_BRIDGE_PORT: Bridge Port
e6295d124644b1 Daniel Golle 2026-04-12  2153   */
e6295d124644b1 Daniel Golle 2026-04-12 @2154  enum mxl862xx_port_type {
e6295d124644b1 Daniel Golle 2026-04-12 @2155  	MXL862XX_LOGICAL_PORT = 0,
e6295d124644b1 Daniel Golle 2026-04-12 @2156  	MXL862XX_PHYSICAL_PORT,
e6295d124644b1 Daniel Golle 2026-04-12 @2157  	MXL862XX_CTP_PORT,
e6295d124644b1 Daniel Golle 2026-04-12 @2158  	MXL862XX_BRIDGE_PORT,
e6295d124644b1 Daniel Golle 2026-04-12  2159  };
e6295d124644b1 Daniel Golle 2026-04-12  2160  

:::::: The code at line 2154 was first introduced by commit
:::::: e6295d124644b14a12b55edf5d3e89cf86a4a2ce net: dsa: mxl862xx: add ethtool statistics support

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
