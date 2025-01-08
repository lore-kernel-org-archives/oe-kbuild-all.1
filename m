Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B071F0E35
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 22:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377086; cv=none; b=O8PIE9WH5Lm9rZGAGzhjYTjEAKeTJKYOlfsB6BFviUb0F95q1Esrh+M+IqvDiGShByxBO/LTFp63ty84fiaY+fojJ9g+JXF9rSyyxVDbxjE1rQgAF7LaNJg0ujMFN7mY+PoOygt0DdCHnfeDUCaILuJnzmEFO0kQmVuk1UjTrpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377086; c=relaxed/simple;
	bh=WNtFObcvPQkzMocftHkSLmpCXZedYBkUMa+w/iypTJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LpBN8YSoRwD2QrdvL30TBXxVGD0RU8qf/SbMP9n1Dp/dvlsTeZERe1urUy9xIAqCFRsstTWNlRBgrfW7Jj8xg2QSzmzQ/OtrLPyo9nYx+4Kr01HcnWcjayLcP68jvMwSPLe1FnBThmly07y1AKQKpfaXhk65DR5LGN4OtV3HJaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYXnTXme; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYXnTXme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736377085; x=1767913085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNtFObcvPQkzMocftHkSLmpCXZedYBkUMa+w/iypTJ8=;
  b=PYXnTXmewsJBT2AwOKX2bwlUbQiyJDxgT47/Jk14iWMpcdmOvPaoy6mR
   AafmpSNHBQYwi+wbZSDMjmB6Tingz3/nWHrEkow/2xnedS2vdCBNLVRDU
   DTQzO1EXeDMZPme2BtnLyS5uTdMtjvo1K2tK3k/eSDRXDOoWFmLZYH4iz
   53+uLNOx46Hk+FrU10nRQ7vMqeCjN3SUVLjZ+oADdS8UuDVyj3xAY+H6h
   kHo0VClGL99DB0dYdD/Y+OA4op0+sYZF4E6/GgU1JtDi4giSK1Lhlpgd/
   LacAfuyUoeej7vSbSAietiaW7mvht9cnRs68rm+3z6Noyj03PiN1zcSQW
   Q==;
X-CSE-ConnectionGUID: lb79itpPTMa7JsAv21R7uA==
X-CSE-MsgGUID: Mtf4g002TPKUj/eDJeMH7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36317605"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="36317605"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 14:58:05 -0800
X-CSE-ConnectionGUID: v4TajwUQQ+m0Ubw3YW5MPw==
X-CSE-MsgGUID: /El8CJmlRFyXgDT6I81row==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="103185493"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jan 2025 14:58:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVezx-000Glz-03;
	Wed, 08 Jan 2025 22:58:01 +0000
Date: Thu, 9 Jan 2025 06:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Divya Koppera <divya.koppera@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 4576/7110] microchip_t1.c:undefined reference to
 `mchp_rds_ptp_handle_interrupt'
Message-ID: <202501090604.YEoJXCXi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b90165c7d1173e0f65538d25aa718ec7ecdd5d6
commit: 9fc3d6fe802923b026ecac16e59c0acdd6744d5d [4576/7110] net: phy: microchip_t1 : Add initialization of ptp for lan887x
config: i386-buildonly-randconfig-006-20250109 (https://download.01.org/0day-ci/archive/20250109/202501090604.YEoJXCXi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501090604.YEoJXCXi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090604.YEoJXCXi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/phy/microchip_t1.o: in function `lan887x_handle_interrupt':
>> microchip_t1.c:(.text+0x335): undefined reference to `mchp_rds_ptp_handle_interrupt'
   ld: drivers/net/phy/microchip_t1.o: in function `lan887x_config_intr':
>> microchip_t1.c:(.text+0x3c9): undefined reference to `mchp_rds_ptp_top_config_intr'
   ld: drivers/net/phy/microchip_t1.o: in function `lan887x_phy_init':
>> microchip_t1.c:(.text+0x7d2): undefined reference to `mchp_rds_ptp_probe'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
