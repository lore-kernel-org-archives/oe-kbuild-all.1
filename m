Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1F5349B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172033; cv=none; b=L8tENkq1/8jyVEnS8oiu3rbCNm68yCjXXSnlHoFA+dEyBJlAViPLPWDMYc+6xK9ceeijLwUpPZeistlmjigl8XtdYjCMATviu6OYAXd89VmODSEYY9j8b1je/Troxenx2JZuCUA+Ji4uHsgvLU1SrH+MDk5b09nCm3h6/NQLSfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172033; c=relaxed/simple;
	bh=ZT3V018bgDdwkEuOhMDIeX0ej1kB2SX8vSo3iJS2MkY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Id3XJfjSDZTpkxHHiHJuo/gU+98qsjWHucN3m2BGuqmwUWYUdXTD9lBx8G3f7xDhvaQmcJoayr4/4daI3yDKNVxOHzckDv7ssSR5v5Rk1tL5Sz5ufsG9YqzgOSKytMdojW2ZZhHN91/fozj8tfueOlR1Mj5bHguBBTMr7cTKJ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xc5B/pjM; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xc5B/pjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790172032; x=1821708032;
  h=date:from:to:cc:subject:message-id;
  bh=ZT3V018bgDdwkEuOhMDIeX0ej1kB2SX8vSo3iJS2MkY=;
  b=Xc5B/pjMp87iawTLfot70atzZBABIhmfIHmSA94h36MO7WPlQR1r602A
   QtPUrSokYMAhusLM6HRkeKrr18dkN/XutC87hv+p8IgfMgsQAR0lvnroa
   GcVJBUQdDQzV7WiqvDq/xa/poIV/nooxGvs04+KNq/xkvGaMRYe8S1Bxo
   QFsdGRj5foC/FO0VAEL+vrGlYxgKFHYCbYCTYPq2WDGYsL55khpo37vK1
   ok6Cbz0XunC3sYFUtsNlgpB5+vdLJrqboE+iQxR+dDRww33NfeG1md/Wj
   BBudnwHhWfXe9kQLeMPnHxpHNqelci0T1i2L6t0NCyHZNjFqevFYnOyTO
   w==;
X-CSE-ConnectionGUID: 0AhQuGmNSLGbhmXpa2DeQQ==
X-CSE-MsgGUID: RnylBLLmSAajH8a6CLG0UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1385598"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1385598"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:00:31 -0700
X-CSE-ConnectionGUID: 2qfyXuOJQhy4dFz/EtAPPg==
X-CSE-MsgGUID: qwOa+oT6R+6YN0cQpJpqag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4714120"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 07:00:29 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9NWM-000000000ht-3pzB;
	Wed, 23 Sep 2026 14:00:26 +0000
Date: Wed, 23 Sep 2026 15:59:51 +0200
From: kernel test robot <lkp@intel.com>
To: Coia Prant <coiaprant@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 PCS_XPCS_ROCKCHIP when selected by DWMAC_ROCKCHIP
Message-ID: <202609231545.L3FhBroP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Coia-Prant/net-stmmac-move-XPCS-lifetime-management-to-platform-drivers/20260914-025836
head:   9c4349d135a71f0ca42ec4eacf5babd2995bc54d
commit: 650c4eb379920af71e81d757bc944b2b5e95ef64 net: stmmac: dwmac-rk: add SGMII support for RK3568
date:   10 days ago
config: arm64-kismet-CONFIG_PCS_XPCS_ROCKCHIP-CONFIG_DWMAC_ROCKCHIP-0-0 (https://download.01.org/0day-ci/archive/20260923/202609231545.L3FhBroP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260923/202609231545.L3FhBroP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231545.L3FhBroP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PCS_XPCS_ROCKCHIP when selected by DWMAC_ROCKCHIP
   WARNING: unmet direct dependencies detected for PCS_XPCS_ROCKCHIP
     Depends on [n]: NETDEVICES [=y] && PCS_XPCS [=y] && OF [=y] && (ARCH_ROCKCHIP [=y] || COMPILE_TEST [=n]) && (GENERIC_PHY [=n] || COMPILE_TEST [=n]) && (PM_GENERIC_DOMAINS [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - DWMAC_ROCKCHIP [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=y] && STMMAC_PLATFORM [=y] && OF [=y] && (ARCH_ROCKCHIP [=y] || COMPILE_TEST [=n])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
