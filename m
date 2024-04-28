Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096011E522
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 08:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714293444; cv=none; b=JV/exOuYKCltxJ9LqQktJVNRIprSgk9aUnYNaUsTRpCM6dN7xrN9otbZS5QdAH+xL6DgQ2l0MAmux+9imlwrkJAcVZCFcjZZ5gq270Tp4puh+6BcBwGbR7N7fn3b3MXaGPryEmoeQ24vAsvtrVCYHCNqd0PJIrU0XuiAbdam94E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714293444; c=relaxed/simple;
	bh=3duMmzCnPaTsGBeHJGnPVaEBXAA/SchnFFmr0d7a3j4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uktHi/D415P6V5MxiMx5QMdrCWLFfFhUjCROmjc2DaW/e85Chv8WhlNmzVmhGAUPwL6QoP/Jc9Obyrel4jYMPEa0c1tjcCQ2kFTr/Mgd2sK2ZbJqwajPBaEU3fGed4+eZxxxgib0jCQqFihYpV5QvIEf5q2mCOjLgIInqjgoge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrhBwoqs; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrhBwoqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714293443; x=1745829443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3duMmzCnPaTsGBeHJGnPVaEBXAA/SchnFFmr0d7a3j4=;
  b=NrhBwoqsXE94XfnWy2kL9dp5iXAbZvEuWNEVOXaC5oCMUIeM6M9W7btA
   y9boAiygc+ToSpLS/kFdCXm38J429gdN/pCCJSVIkOVQxlE41kbqR3Lym
   3doo/GCPHopCYcZVpDPCZbf2w//BaS8sUibv3lGPVc+tePgm3dFJpSJzD
   srsFL0uQv3CUG0TCQ/4RNpDxSUh8phfqO4RuOquMZeAHuzOXQbttoxDhs
   DPtI2iCR4au0a+DzbLwwx5E204YhinBuoa3h0yuh2RN2HQshc8PbeqQqg
   VdwyzsXZpf9DK/++svkySPQoS3S2de/WF0Sbm12hleYnOwgkDgq+seNDc
   Q==;
X-CSE-ConnectionGUID: TGFG2AqfQkiEawOHrQ4oSw==
X-CSE-MsgGUID: Z2ZcO6GyQcewoCB4L6Fglg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10141130"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="10141130"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 01:37:22 -0700
X-CSE-ConnectionGUID: hqKUlFO7RvuNdebrcmHpmw==
X-CSE-MsgGUID: qA0Go81PTBu3Mss6BoTCsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="30301215"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Apr 2024 01:37:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s102A-00060y-2p;
	Sun, 28 Apr 2024 08:37:18 +0000
Date: Sun, 28 Apr 2024 16:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5741/11728]
 drivers/net/pcs/pcs-xpcs.c:1382:5: warning: no previous prototype for
 function 'xpcs_register_phy'
Message-ID: <202404281622.UQr6LwfT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: f5d7b7a0ff41b77456b370b4e48051b0cdc00cc6 [5741/11728] LF-10639-4 net: pcs: xpcs: add mx95 serdes support
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240428/202404281622.UQr6LwfT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281622.UQr6LwfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281622.UQr6LwfT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-xpcs.c:1382:5: warning: no previous prototype for function 'xpcs_register_phy' [-Wmissing-prototypes]
   u32 xpcs_register_phy(struct dw_xpcs *xpcs, struct mii_bus *bus)
       ^
   drivers/net/pcs/pcs-xpcs.c:1382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 xpcs_register_phy(struct dw_xpcs *xpcs, struct mii_bus *bus)
   ^
   static 
   1 warning generated.
--
>> drivers/net/pcs/pcs-xpcs-phy.c:228:5: warning: no previous prototype for function 'xpcs_phy_read_pma' [-Wmissing-prototypes]
   int xpcs_phy_read_pma(struct dw_xpcs *xpcs, u32 reg)
       ^
   drivers/net/pcs/pcs-xpcs-phy.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xpcs_phy_read_pma(struct dw_xpcs *xpcs, u32 reg)
   ^
   static 
>> drivers/net/pcs/pcs-xpcs-phy.c:233:5: warning: no previous prototype for function 'xpcs_phy_write_pma' [-Wmissing-prototypes]
   int xpcs_phy_write_pma(struct dw_xpcs *xpcs, int reg, u16 val)
       ^
   drivers/net/pcs/pcs-xpcs-phy.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xpcs_phy_write_pma(struct dw_xpcs *xpcs, int reg, u16 val)
   ^
   static 
>> drivers/net/pcs/pcs-xpcs-phy.c:238:5: warning: no previous prototype for function 'xpcs_phy_usxgmii_init_seq_2' [-Wmissing-prototypes]
   int xpcs_phy_usxgmii_init_seq_2(struct dw_xpcs *xpcs)
       ^
   drivers/net/pcs/pcs-xpcs-phy.c:238:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int xpcs_phy_usxgmii_init_seq_2(struct dw_xpcs *xpcs)
   ^
   static 
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
