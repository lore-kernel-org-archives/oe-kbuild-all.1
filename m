Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF25442F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Feb 2025 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738532324; cv=none; b=XXEw3UeFiwAxK2X0ObwDobz8MW+q0y4tbTeNHbukuQURSgTE81xczk3xD+5XBjFpfLU64jKnxYJPfl+qzFcnKgJ52U7Ac8ACUsyr+R3QlXQ7cDu1Uw6JBPG1+RmAbivv9Pa40LaI8FaKmDFpMMtGMM/wt62Hpu6UBpx5Uy2t4WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738532324; c=relaxed/simple;
	bh=uGViOe6JDsiXLAm1xx+CvCt6bCAnab6sFvV8bwN02rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f50491YStZpVNpst9FpUVZrfvVTW+LVA0yw+whBZLM20UTTc5xWjv8un6y8ZhhGHJpCawvZZJ3aV8/bm1uTE9hSyFJCTCrZxGpwpCZeqjg+nQCQ9+H6Vgg3itreEiRmcJ+qq0UxvSBb5rE2Oo65s6m1DsLHaUF7k2rg+nq1GHhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWJ8JObR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWJ8JObR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738532323; x=1770068323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uGViOe6JDsiXLAm1xx+CvCt6bCAnab6sFvV8bwN02rw=;
  b=VWJ8JObRzkmfy0BM/oUZnLDDcG2vk3twFGOuN68qR8BquqbIPhlQv+1H
   k6NffGqnoF2aAMSulOTAeQKPNxxnmPrckhX2XpAY3UDrQ3WCCyI/ae6Q7
   TcT98jrOGmCLg31+8Xg079yWbPzZlyzVlnXz51y5K//uVN/ScttNL9v9M
   E9EMqJbmXaHNUhLZf2M11r419oCa/jyZpUpCReHHKLrPOH8WdJFed713c
   IFKYaiwDAHIREsWoELMGW4IXmLEYqo59MYUevY6+9bTNxbPZfE0AjDwz+
   7QexAFTxtJcnNXI6yNB0VoFOmIwwnlGElYirdlFsVOb2FIkOjJIDNnjlO
   g==;
X-CSE-ConnectionGUID: JXoBXM3YS8G54h2dGIDg3w==
X-CSE-MsgGUID: 69zziagYQZ+3X/MkYq4lvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49682693"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="49682693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 13:38:42 -0800
X-CSE-ConnectionGUID: qZRGU8m1ThO/ct3A1IdVww==
X-CSE-MsgGUID: mblZ5TSSRky51xHGM64JsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="110285120"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Feb 2025 13:38:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tehfr-000q95-0M;
	Sun, 02 Feb 2025 21:38:39 +0000
Date: Mon, 3 Feb 2025 05:38:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-rc 15/42]
 drivers/net/pcs/pcs-mtk-usxgmii.c:342:26: error: initialization of 'void
 (*)(struct phylink_pcs *, unsigned int,  struct phylink_link_state *)' from
 incompatible pointer type 'void (*)(struct phylink_pcs *, struct
 phylink_link_state *)'
Message-ID: <202502030539.eFq8hD1H-lkp@intel.com>
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250203/202502030539.eFq8hD1H-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030539.eFq8hD1H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030539.eFq8hD1H-lkp@intel.com/

Note: the frank-w-bpi-r2-4.14/6.14-rc HEAD 2fa6baddbda0144c4f3e6556722f72c48f6885fb builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/net/pcs/pcs-mtk-usxgmii.c:342:26: error: initialization of 'void (*)(struct phylink_pcs *, unsigned int,  struct phylink_link_state *)' from incompatible pointer type 'void (*)(struct phylink_pcs *, struct phylink_link_state *)' [-Wincompatible-pointer-types]
     342 |         .pcs_get_state = mtk_usxgmii_pcs_get_state,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/pcs/pcs-mtk-usxgmii.c:342:26: note: (near initialization for 'mtk_usxgmii_pcs_ops.pcs_get_state')


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
