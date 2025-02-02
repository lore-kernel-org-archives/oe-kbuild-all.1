Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AFF35979
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Feb 2025 19:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738523669; cv=none; b=nWuj8DqYZwFKaAEXVzDX1OmKVm5V0/7uzuqxOUiL/Cs4cxS3DXJh/JEeprV6HnyB6ik7xGCfsTfQyFm4LjS0vF3RLMVZmrvZkol2g/Im1zmZPm/2+UCrtdsVFEJvcmCLocFNpF6wqoZNR8f6524eECY7kiUYcDTk1vEiZVJ7XBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738523669; c=relaxed/simple;
	bh=2PJWkh0Q9YKuSWBv7D59oRMrvI3iHQSKCHx+jNvbPP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTwbEITEDwawwf8wt1qhXxk5xW0HhahCr/CZvqb58O6LxxZXGTkIDjcUIQSfqw/n5eLqmmJA/61KxrXa2ASQh4BXgEObxBJuXyR1NQVS9ROr7Hdwn3KEhoVN38TbD7GLi/XZZdPvSpWhdHvzjfcKpnv5knXv4NR9RHS0UQjzfRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ik4/dhm8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ik4/dhm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738523668; x=1770059668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2PJWkh0Q9YKuSWBv7D59oRMrvI3iHQSKCHx+jNvbPP4=;
  b=ik4/dhm8+y2gkWiP/NIDPnselW9e4cMncBjCKnwBUGXJR/zKHxlS5iZV
   6X7yRd3dl3+3r2NPC5wnpwX29UccQK4s2X2p6SByXfUIBCsFxGb2kmRvE
   94C6esyq+hsVuv67guAJjEjomLSeVtpzCEshj3tIIruWgsfWW8XIQpcv4
   Yc41Zn3RIPTrOseCRBi1pakXciTvfM5F8gpt+ylUfIQPlk3JMeKs+ZOMk
   MMglgcDQCWL/htDzrEqUZOSvNk548u2h28yVWdJJE1c7fLKDew+azaoF7
   tbIpgPLa7tRprauH2SXrryq3nlbA9Hjn29lR7xyivkV3Jgj/LzRr2zp53
   g==;
X-CSE-ConnectionGUID: sQlwh272Q7ec3rr1m/1X0g==
X-CSE-MsgGUID: WBqL/vf4QPOHbkTr9WsfQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="42943844"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="42943844"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 11:14:27 -0800
X-CSE-ConnectionGUID: d3WtdhOfRC6K4W5u0Ec+tg==
X-CSE-MsgGUID: Y2GhhpcXTPaUt3Ub3Z6gTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110973633"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Feb 2025 11:14:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tefQG-000q0p-0Z;
	Sun, 02 Feb 2025 19:14:24 +0000
Date: Mon, 3 Feb 2025 03:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-rc 15/42]
 drivers/net/pcs/pcs-mtk-usxgmii.c:342:19: error: incompatible function
 pointer types initializing 'void (*)(struct phylink_pcs *, unsigned int,
 struct phylink_link_state *)' with an expression of type 'void (struct
 phylink_pcs *, struct phylink_link_state...
Message-ID: <202502030512.gxYaWc4u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-rc
head:   2fa6baddbda0144c4f3e6556722f72c48f6885fb
commit: 6e1fe8381599b1d385c086e36210b9f01173bf07 [15/42] net: pcs: add helper module for standalone drivers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250203/202502030512.gxYaWc4u-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030512.gxYaWc4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030512.gxYaWc4u-lkp@intel.com/

Note: the frank-w-bpi-r2-4.14/6.14-rc HEAD 2fa6baddbda0144c4f3e6556722f72c48f6885fb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/net/pcs/pcs-mtk-usxgmii.c:342:19: error: incompatible function pointer types initializing 'void (*)(struct phylink_pcs *, unsigned int, struct phylink_link_state *)' with an expression of type 'void (struct phylink_pcs *, struct phylink_link_state *)' [-Wincompatible-function-pointer-types]
     342 |         .pcs_get_state = mtk_usxgmii_pcs_get_state,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +342 drivers/net/pcs/pcs-mtk-usxgmii.c

e7a2b076eccfda Daniel Golle 2023-12-12  339  
e7a2b076eccfda Daniel Golle 2023-12-12  340  static const struct phylink_pcs_ops mtk_usxgmii_pcs_ops = {
e7a2b076eccfda Daniel Golle 2023-12-12  341  	.pcs_config = mtk_usxgmii_pcs_config,
e7a2b076eccfda Daniel Golle 2023-12-12 @342  	.pcs_get_state = mtk_usxgmii_pcs_get_state,
e7a2b076eccfda Daniel Golle 2023-12-12  343  	.pcs_an_restart = mtk_usxgmii_pcs_restart_an,
e7a2b076eccfda Daniel Golle 2023-12-12  344  	.pcs_link_up = mtk_usxgmii_pcs_link_up,
e7a2b076eccfda Daniel Golle 2023-12-12  345  	.pcs_enable = mtk_usxgmii_pcs_enable,
e7a2b076eccfda Daniel Golle 2023-12-12  346  	.pcs_disable = mtk_usxgmii_pcs_disable,
e7a2b076eccfda Daniel Golle 2023-12-12  347  };
e7a2b076eccfda Daniel Golle 2023-12-12  348  

:::::: The code at line 342 was first introduced by commit
:::::: e7a2b076eccfda7ff3ed1d851c18a2348050a932 net: pcs: add driver for MediaTek USXGMII PCS

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
