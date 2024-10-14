Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE4F149013
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 07:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891476; cv=none; b=RaufkOCLecNNAZ9T2/cEofXwsrHMxN8TuyDn3FsSPLHqY75W+x7ZmsnClAPeUM5w5EO/53aDGegpGIQPLIKpieTlo0c8iTRRYgoZSMAAPAzFn5p+sncUXi975f2m4goaVfixDIEGSPkSmca1hdF+tRRbmTxfRhDlNgwuQb04cVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891476; c=relaxed/simple;
	bh=S6qzZiNAy4J6iN415eQ/T6FZKRzjOrNUhZNLZzy9iv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cRae0lRf/BjTsoh+JyiAANd38wolfnhcqpMwsktvjrMR0C9glWA8wVrzodAiygbSPuEV1mne8EGC6BWATSw1t3e2KFaxZI/Kcv+p7ruT2FDqwnzH8C2y8atZMLjB1V3/vGi30u2JH+504YsyAl+RooLGZ7NsYqWx/TbMr64Ku2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NcmjC8NF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NcmjC8NF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728891474; x=1760427474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6qzZiNAy4J6iN415eQ/T6FZKRzjOrNUhZNLZzy9iv8=;
  b=NcmjC8NFuzL3ys8hksHSglI1xBCXMuaRf25j0oxzLE7x0cTy0jjTt+YB
   VPJH7q/axk0Z8ivGkJpD/Bock5eEUceVel44HJSOxO8b908fMSzOhO71D
   Ed0aWXM7YvNfLUw7SnPQB47e6l0aTSKJ62mPP3oyZ1ejg0PfjxxJ+dRvj
   qtwnjQEE6agEKhN7DyejVlPHI2dTSlsT5TeiFwtLSZVvycz0147g1xDCC
   jl1QrG1z5vy+0pxsgCvCMB3mvORMIFp9tBr51oiRuLxBMBi2N8//gD+Zo
   5LnUsnWOpUgJSgJK4kQeUPa0SxmSSnEPFeeCzMRQTYgAAW0j2RuZIFJLi
   A==;
X-CSE-ConnectionGUID: jUtv6OQpRvamM5exIbiGgQ==
X-CSE-MsgGUID: aaAGlsFoS7Owsg2PrX81ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32142389"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="32142389"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 00:37:54 -0700
X-CSE-ConnectionGUID: iq/+saqwRbuVqEumz875fg==
X-CSE-MsgGUID: nkrxef/PTDmLwIFDFwWXiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77122736"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Oct 2024 00:37:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0FeI-000F2H-2v;
	Mon, 14 Oct 2024 07:37:50 +0000
Date: Mon, 14 Oct 2024 15:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.1.x-imx 5741/17816]
 drivers/net/pcs/pcs-xpcs.c:1382:5: warning: no previous prototype for
 function 'xpcs_register_phy'
Message-ID: <202410141510.PP63eCZ6-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.6-2.1.x-imx
head:   d45fcfc7eac49282ddaa08a771318a9b0f4a01bc
commit: f5d7b7a0ff41b77456b370b4e48051b0cdc00cc6 [5741/17816] LF-10639-4 net: pcs: xpcs: add mx95 serdes support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241014/202410141510.PP63eCZ6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241014/202410141510.PP63eCZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410141510.PP63eCZ6-lkp@intel.com/

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
