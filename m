Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513F42737FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766950638; cv=none; b=YDmh1jbou9zpxdOxoQ6T9DM7pugWS+8NnLNJfIaBYTZkxlDGA0ywEVFGfOv8h4TGIz3SAEb/SCU3muprYsHIrJ4yk4OKyFKDXqiIyPiKjEtFUY931GRYLvA3AIxSg2yre0IMGFrsr5f/B8JgCdAMAEBDXOgACo3vmx2gNNVpLB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766950638; c=relaxed/simple;
	bh=rQlkGsGGmuDKbNfxMLD8pN+wOyjptlu8C4/Jm0Nv8yU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n1RLKSz5DN6QWO83bCoGCFDS0aXf50KGylkCcEzFk1JdMfEjJWcPy02cM1RjXNWJrjbiYNkaUxwQLmn4N56GT+5kxwrVypYX1AF78k4Ng3nO327qnhI8MqDMx3Ix7XRanWEftDAcZ8hvOx0oF7NAGjwoPPAktBkgdysEeSCb6yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsqAsxk9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsqAsxk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766950636; x=1798486636;
  h=date:from:to:cc:subject:message-id;
  bh=rQlkGsGGmuDKbNfxMLD8pN+wOyjptlu8C4/Jm0Nv8yU=;
  b=KsqAsxk9A7MN2rPxO2DGcZXQNSiE44LP+XQedft9U6WSdvJQN2t8sHoR
   J0SmlKJGpk1zHrhp7VpdJJRJ//VIK7OhyJ/Oayy+109wawUpnHVQm7QJp
   iM2if1I2BIRAmUCngXThWijTBoAl6tXAtY3V6uQ2SEu3mK1XJYEQqHWOm
   nke4MT0TgO/psAOiqj4HL2qkYrQGmnO36fdWBd0DXCdTzfKO9WV3QO5Hy
   utn/hYFA04VwYr/qpEXcRgzjQJuM18J4wuMrcDilCdrfrSIoBc4EmzrN2
   3Bzqy8Hs+8devYe28dB6PytNc7ko3rRjdnpru66bMw2gGoRZUTf7yrl/K
   A==;
X-CSE-ConnectionGUID: h7wlSvcrRve2+4LDqDxp6g==
X-CSE-MsgGUID: L0bXvVGnT/2u2u6cUeNklw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="86004183"
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="86004183"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 11:37:16 -0800
X-CSE-ConnectionGUID: Hx0McefIQRWb3ASN3GIeTw==
X-CSE-MsgGUID: Ihi0fO+AR+KALSVO7m1n0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,184,1763452800"; 
   d="scan'208";a="205679444"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Dec 2025 11:37:14 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZwZk-000000006f7-0hMX;
	Sun, 28 Dec 2025 19:37:12 +0000
Date: Mon, 29 Dec 2025 03:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 21/117]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:557:2-3: Unneeded semicolon
Message-ID: <202512290313.SqY7uZe2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   44b0991cc3efe339e015f1f9bb402537bdb5e10c
commit: 052d4519526faab75ea2210735b9e35b3cff89ef [21/117] net: pcs: implement Firmware node support for PCS driver
config: arm64-randconfig-r053-20251228 (https://download.01.org/0day-ci/archive/20251229/202512290313.SqY7uZe2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512290313.SqY7uZe2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:557:2-3: Unneeded semicolon

vim +557 drivers/net/ethernet/mediatek/mtk_eth_soc.c

445eb6448ed3bf Lorenzo Bianconi      2023-07-25  541  
97e347446bd9fd Daniel Golle          2023-12-12  542  static bool mtk_check_gmac23_idle(struct mtk_mac *mac)
14a44ab0330d29 Russell King (Oracle  2022-05-18  543) {
97e347446bd9fd Daniel Golle          2023-12-12  544  	u32 mac_fsm, gdm_fsm;
14a44ab0330d29 Russell King (Oracle  2022-05-18  545) 
97e347446bd9fd Daniel Golle          2023-12-12  546  	mac_fsm = mtk_r32(mac->hw, MTK_MAC_FSM(mac->id));
14a44ab0330d29 Russell King (Oracle  2022-05-18  547) 
97e347446bd9fd Daniel Golle          2023-12-12  548  	switch (mac->id) {
97e347446bd9fd Daniel Golle          2023-12-12  549  	case MTK_GMAC2_ID:
97e347446bd9fd Daniel Golle          2023-12-12  550  		gdm_fsm = mtk_r32(mac->hw, MTK_FE_GDM2_FSM);
97e347446bd9fd Daniel Golle          2023-12-12  551  		break;
97e347446bd9fd Daniel Golle          2023-12-12  552  	case MTK_GMAC3_ID:
97e347446bd9fd Daniel Golle          2023-12-12  553  		gdm_fsm = mtk_r32(mac->hw, MTK_FE_GDM3_FSM);
97e347446bd9fd Daniel Golle          2023-12-12  554  		break;
97e347446bd9fd Daniel Golle          2023-12-12  555  	default:
97e347446bd9fd Daniel Golle          2023-12-12  556  		return true;
97e347446bd9fd Daniel Golle          2023-12-12 @557  	};
14a44ab0330d29 Russell King (Oracle  2022-05-18  558) 
97e347446bd9fd Daniel Golle          2023-12-12  559  	if ((mac_fsm & 0xFFFF0000) == 0x01010000 &&
97e347446bd9fd Daniel Golle          2023-12-12  560  	    (gdm_fsm & 0xFFFF0000) == 0x00000000)
97e347446bd9fd Daniel Golle          2023-12-12  561  		return true;
97e347446bd9fd Daniel Golle          2023-12-12  562  
97e347446bd9fd Daniel Golle          2023-12-12  563  	return false;
14a44ab0330d29 Russell King (Oracle  2022-05-18  564) }
14a44ab0330d29 Russell King (Oracle  2022-05-18  565) 

:::::: The code at line 557 was first introduced by commit
:::::: 97e347446bd9fd4c41db0520d167f50724acff9a net: ethernet: mtk_eth_soc: add paths and SerDes modes for MT7988

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
