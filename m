Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794120057;
	b=Iu/1EWiDYSdD5nhL9jWMSTROtRACOTWaKyhD+l/1bUvYDyjI0jr5PXi2eTGAMHmF2CDg
	 5AsrlJ7FEbriPwfR0JLsYd74/+JFRpgC2jWPW58srUccelTQc3U0gH+femRXVJ8V20Htf
	 9i3FpKnp127P2Ja1l2G0gsKF+a229nTvRw1wS9J2g25AJO2ogWAzmvQe6KLiK+1MeSbW6
	 FKPafSvJIKHRFx5FhGYrQ7snaJ2TTn/KainCWbYftSBtOX8AROWW2OBLxoAbUrT08FV89
	 WbyR54looSqGs/svY4MjQ2zePqdcNf6rt2+BOXpIiqxetgzATdoy1jIS2DFCcHjWWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794120057;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=vzEAiaxR1zKyisSZOqMoMNWXSLqa3lsEO72Veor4yrI=;
	b=5a0CMQb67trhZP++z8VJy65W+ad+juzuINiZya9Q4yqQ+qJb9OhfZiGno6J+FRMlCDlk
	 a3Mrncy60bcXu6oeNMF83Q8dqZtCgRe+CiJKGc0VQ1jgPp1sssFWT5exZUyEXrnmGSdwE
	 MjIcTm5A/qS6v3mxGC5zuZHZqckj4qYhwoTqxE5VxBMxdvOXyBrdMQXd5YGRFpkh+vBFC
	 PdkZmpMH2ngPHLyUO6WsOGxC3cGq4spowOHEz+LnZ0AVtuhBxBjd9z0J/7bhbjukJWYJm
	 cH0+XNA95Io+VdqQdS6yLT7GZlgTtMZfDBgzA1t+1he1b8HRzuEyhYprwZhMxcnUo9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PpxU2g4i;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B76606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 06:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PpxU2g4i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794120055; x=1825656055;
  h=date:from:to:cc:subject:message-id;
  bh=YSCBYmTGs83WTktHXKr5b7V0ywjebu3QSBuSFuZKFGI=;
  b=PpxU2g4ip+D/j/8BjivCrrtJqpsPfpanX9sq4Se3SLKcSFGHNpKsD4NC
   miwj4tjYI2KydOiZdI2Cdu9J2NmuKeQpXnbkZvdG3hLDsnFeDeQNiiWKR
   QrT1Hqa2ckYCb1OVLqlcz1RhzuZ3glFdR4EoqHhnkeCt/eiMgcEXlfaLZ
   fXQvVX5g63/TJKx3NcE3Wxf4KOc9YL4OHuDq2kfqsvEkXuhw6sa9drc1W
   HH+yotV6UC8G1pKxqo6TjkNhntT8vQeohabZPAj3qJnDGBLrdYA5RK+dG
   WWh/6owXUE/Y9fQE8msyueUrlfpnx7oiRJ2r2JG/eBdd3J6Ne/v6I6ZWw
   g==;
X-CSE-ConnectionGUID: efV7Iwj/ThqLGfzYPPwcRw==
X-CSE-MsgGUID: wE9lKjsVTcSXEdJ0gGqEKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2980965"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2980965"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 22:40:54 -0800
X-CSE-ConnectionGUID: YpcgZZ9yQGWLR0GsKTstyQ==
X-CSE-MsgGUID: 1MTSnjceSQap4Vdk/m8C9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9358569"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Nov 2026 22:40:53 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPwaB-00000000B3Q-1LYz;
	Sun, 08 Nov 2026 06:40:51 +0000
Date: Sun, 08 Nov 2026 07:40:51 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 39/154]
 drivers/net/pcs/pcs-mtk-usxgmii.c:387:undefined reference to
 `mtk_xfi_tphy_valid_ctle'
Message-ID: <202611080743.15a4qqfE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: 9a052b8df8d2bc4bf7dd144f34dc9aa7d60f0b6b [39/154] net: pcs: mtk-usxgmii: check link status and phy ctle before reset
config: s390-randconfig-2005-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080743.15a4qqfE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080743.15a4qqfE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080743.15a4qqfE-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/net/pcs/pcs-mtk-usxgmii.o: in function `mtk_usxgmii_pcs_link_up':
>> drivers/net/pcs/pcs-mtk-usxgmii.c:387:(.text+0xc3a): undefined reference to `mtk_xfi_tphy_valid_ctle'


vim +387 drivers/net/pcs/pcs-mtk-usxgmii.c

   376	
   377	static void mtk_usxgmii_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
   378					    phy_interface_t interface,
   379					    int speed, int duplex)
   380	{
   381		struct mtk_usxgmii_pcs *mpcs = pcs_to_mtk_usxgmii_pcs(pcs);
   382	
   383		/* Reconfiguring USXGMII to ensure the quality of the RX signal
   384		 * after the line side link up.
   385		 */
   386		if (mtk_usxgmii_pcs_link_status(mpcs) &&
 > 387		    mtk_xfi_tphy_valid_ctle(mpcs->xfi_tphy))
   388			return;
   389	
   390		mtk_usxgmii_pcs_config(pcs, neg_mode, interface, NULL, false);
   391		phy_reset(mpcs->xfi_tphy);
   392		phy_set_mode_ext(mpcs->xfi_tphy, PHY_MODE_ETHERNET, interface);
   393	}
   394	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
