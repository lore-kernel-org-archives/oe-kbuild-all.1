Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E5C383A5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 22:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726957031; cv=none; b=LiLNBTSJ3oBLSoj5w7Zv6/JyKoFXIOMQ1ZGuCv5+ps3ubJ3QzVJL9F12a/9JqCh3z6x57WRfo9FGBD+gNHj81Hyps9vnZhvfdodOm/9R7EWt6ciToBTph7ZCUZY+FDC7+gQYak+IC7zKocwc1YDplp3N92Bmk5IqrMV/7O4jq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726957031; c=relaxed/simple;
	bh=q8bse3zr2gZ44UN7/iWINJj2V3rd6We9AmJ6+miKobs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kK4pNlZCjo54eVwa0YqRbacLhN6jC+2rdW9aZdL0adF7JMDm0IXJWvXslNS+/NJQSAvEMltA/2Nv6mw/47tb/JkPZ7T9QS80oXewlSTB6czS1xJi8lvG736+7+SjFxsYDo/gM4DVdlFXiPMahxaNs+gKkjqWStpNfWWwFn2P2Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTdpJAK3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTdpJAK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726957029; x=1758493029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8bse3zr2gZ44UN7/iWINJj2V3rd6We9AmJ6+miKobs=;
  b=OTdpJAK3ZYuYk5oKrRWAjfjet877+Ynq1EgBFjZYdBesP4YGknZUCqhK
   H3kETQmTEVkJhwAWHvwT8H5d+Xy/EtbhkErbE22jlkA25d54jlV/iMqHj
   gTPf40LmT7T59Pk77HJGZ8LOx9Az/F14OFchVyPjjHgakGs98R1QvN1Ja
   AtL/nK6yd+lYvmZ3PwKi0rhUYH+G0HlEFjeYYs4igp/U8Ang+EAQsmZQx
   QBRmXJLAtAqOtBBRb50CX3QlVr8ROiU9Q8BLQT89ZEwrLa12uoBi7ny+s
   eSMxgW/mhw3Z9Pa4ubTEhcmGMRBZ1aV271cOsR557Q37nQYlwHN3KDWY2
   Q==;
X-CSE-ConnectionGUID: nBYkasMPS0msumsnniiVxA==
X-CSE-MsgGUID: yNXekGJoRe6SU1wocwFJ2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25814073"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="25814073"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 15:17:09 -0700
X-CSE-ConnectionGUID: jZ2l2ht7QOmKgAgCuXFmww==
X-CSE-MsgGUID: Pc9EQUxQTuatdbBosffP3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="75614609"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Sep 2024 15:17:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss8PZ-000Fpo-21;
	Sat, 21 Sep 2024 22:17:05 +0000
Date: Sun, 22 Sep 2024 06:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5741/16782]
 drivers/net/pcs/pcs-xpcs.c:1382:5: warning: no previous prototype for
 function 'xpcs_register_phy'
Message-ID: <202409220623.WJHZnOdH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Clark,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   d023c381fa6161a7af966abaad8e7d9a997f07e7
commit: f5d7b7a0ff41b77456b370b4e48051b0cdc00cc6 [5741/16782] LF-10639-4 net: pcs: xpcs: add mx95 serdes support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240922/202409220623.WJHZnOdH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220623.WJHZnOdH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220623.WJHZnOdH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-xpcs.c:1382:5: warning: no previous prototype for function 'xpcs_register_phy' [-Wmissing-prototypes]
    1382 | u32 xpcs_register_phy(struct dw_xpcs *xpcs, struct mii_bus *bus)
         |     ^
   drivers/net/pcs/pcs-xpcs.c:1382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1382 | u32 xpcs_register_phy(struct dw_xpcs *xpcs, struct mii_bus *bus)
         | ^
         | static 
   1 warning generated.
--
>> drivers/net/pcs/pcs-xpcs-phy.c:228:5: warning: no previous prototype for function 'xpcs_phy_read_pma' [-Wmissing-prototypes]
     228 | int xpcs_phy_read_pma(struct dw_xpcs *xpcs, u32 reg)
         |     ^
   drivers/net/pcs/pcs-xpcs-phy.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     228 | int xpcs_phy_read_pma(struct dw_xpcs *xpcs, u32 reg)
         | ^
         | static 
>> drivers/net/pcs/pcs-xpcs-phy.c:233:5: warning: no previous prototype for function 'xpcs_phy_write_pma' [-Wmissing-prototypes]
     233 | int xpcs_phy_write_pma(struct dw_xpcs *xpcs, int reg, u16 val)
         |     ^
   drivers/net/pcs/pcs-xpcs-phy.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     233 | int xpcs_phy_write_pma(struct dw_xpcs *xpcs, int reg, u16 val)
         | ^
         | static 
>> drivers/net/pcs/pcs-xpcs-phy.c:238:5: warning: no previous prototype for function 'xpcs_phy_usxgmii_init_seq_2' [-Wmissing-prototypes]
     238 | int xpcs_phy_usxgmii_init_seq_2(struct dw_xpcs *xpcs)
         |     ^
   drivers/net/pcs/pcs-xpcs-phy.c:238:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     238 | int xpcs_phy_usxgmii_init_seq_2(struct dw_xpcs *xpcs)
         | ^
         | static 
   3 warnings generated.


vim +/xpcs_register_phy +1382 drivers/net/pcs/pcs-xpcs.c

  1381	
> 1382	u32 xpcs_register_phy(struct dw_xpcs *xpcs, struct mii_bus *bus)
  1383	{
  1384		u32 xpcs_phy_id;
  1385		int ret = 0;
  1386	
  1387		xpcs_phy_reg_lock(xpcs);
  1388	
  1389		xpcs_phy_id = xpcs_phy_get_id(xpcs);
  1390		ret = xpcs_phy_check_id(xpcs_phy_id);
  1391		if (!ret)
  1392			return 0;
  1393	
  1394		return xpcs_phy_id;
  1395	}
  1396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
