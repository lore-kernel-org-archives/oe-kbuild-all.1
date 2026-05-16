Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0882EC0A4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959378; cv=none; b=mGxX+3kE3d1ZHwSIimAvfu7jXczKn6KRMGkfb6aRN1GDBLRnAhHnjwU0ne/vxpQS2AnU/sfHHWcwtkKqBs7DKSWqM9NQjCs3k6MCVwqpPCNS2ff9TfJVS//2LQwTXvXE/bO0Drl9PbseD11FMxuWVlfZJcZ2VyHYisf6qVpDqnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959378; c=relaxed/simple;
	bh=6K7DLeEwL61f8tcQCgQT5t9znnzIm77Ve2lwvtCgDgs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VScTTyly1gE1Mem53V/8UIO7bIy5gmUETuP3zBQeQCfSAeF8lsBHuEvrKmkz5bfnVUhnm66MJj8rE8tvEhlRat3g/2FSCLPHZhK09Wp2Tqf/fug/mp+73x8aTBrl1zOysZjpM6Zvgo2OP6z47qOOmUJkH0bDJ7mNkMUpLK4g2W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9tPjI/f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9tPjI/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778959377; x=1810495377;
  h=date:from:to:cc:subject:message-id;
  bh=6K7DLeEwL61f8tcQCgQT5t9znnzIm77Ve2lwvtCgDgs=;
  b=H9tPjI/fidYZQpfgDL2zivJlYSRQtNPICwiklofqX6nsB8RNLMHGepzj
   n5Yw3c+yatwwwBX3OAcYkCSPjFIu8iqs1uzEEWlugE444T7BBKooQ+oGt
   ynjbH7QITMavUN90X+geaflyExEOBILiKCUJH5prWPDLMF3ojOBn/Kz3j
   kLJQG+8kgbYST3cYHOinpLcWDbLg2l5l9EYUxsybXmku+2M7jpYvbt3F+
   nigyjAhZJWhMVWPWGTETDbPZl6G4mz6u+e9FyOpZfLcbCpGrg3JoUPNTu
   P+2f8fZ50+lIfdopyZBD8xMT0DXDzet/oLzUm/DlCzHACNQwP9n6oPb7w
   Q==;
X-CSE-ConnectionGUID: WfA68VQvRnmv2sVXnWCw7A==
X-CSE-MsgGUID: E253wGJKTZi4+7Qn6LUnmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90981052"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="90981052"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 12:22:56 -0700
X-CSE-ConnectionGUID: MzYqKMdZTcutAani7xIXJw==
X-CSE-MsgGUID: Y4P2fKuuQnKk0yVBIHpiHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="239260001"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 May 2026 12:22:54 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOKb6-0000000014u-2Hvw;
	Sat, 16 May 2026 19:22:52 +0000
Date: Sun, 17 May 2026 03:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 757/889]
 drivers/phy/xilinx/phy-amd-versal2-usbdp.c:47:16: error: implicit declaration
 of function 'readl'
Message-ID: <202605170300.bfnkeEMc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   641071b397e4ef707f4512d9b6e48794c3b28f8f
commit: 1a4c35a0903a3fa817bd3155abf46609e8f49801 [757/889] phy: xilinx: add AMD Versal Gen 2 USB3.1 SSP+/DP Alt Combo PHY driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260517/202605170300.bfnkeEMc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170300.bfnkeEMc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170300.bfnkeEMc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/xilinx/phy-amd-versal2-usbdp.c: In function 'amd_versal2_udphy_crpara_read':
>> drivers/phy/xilinx/phy-amd-versal2-usbdp.c:47:16: error: implicit declaration of function 'readl' [-Wimplicit-function-declaration]
      47 |         return readl(udphy->base_crpara + reg);
         |                ^~~~~
   drivers/phy/xilinx/phy-amd-versal2-usbdp.c: In function 'amd_versal2_udphy_tca_write':
>> drivers/phy/xilinx/phy-amd-versal2-usbdp.c:57:9: error: implicit declaration of function 'writel' [-Wimplicit-function-declaration]
      57 |         writel(val, udphy->base_tca + reg);
         |         ^~~~~~


vim +/readl +47 drivers/phy/xilinx/phy-amd-versal2-usbdp.c

    44	
    45	static inline u32 amd_versal2_udphy_crpara_read(struct amd_versal2_udphy *udphy, u32 reg)
    46	{
  > 47		return readl(udphy->base_crpara + reg);
    48	}
    49	
    50	static inline u32 amd_versal2_udphy_tca_read(struct amd_versal2_udphy *udphy, u32 reg)
    51	{
    52		return readl(udphy->base_tca + reg);
    53	}
    54	
    55	static inline void amd_versal2_udphy_tca_write(struct amd_versal2_udphy *udphy, u32 reg, u32 val)
    56	{
  > 57		writel(val, udphy->base_tca + reg);
    58	}
    59	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
