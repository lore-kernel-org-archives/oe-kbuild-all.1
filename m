Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119B218D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 00:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727136476; cv=none; b=FQjEdxi+v6oPebylV3UXKXbEbGLIQDMegqsIxp7cczKt0XI1SKcNMUZNglbNb/om5AO93R4RnnNZCGwbuE3LjfN2NmaNMNGODw+QsylyxFuNR4Hpk3YLy+2PwBA8tA4DS2pUK5RSjklbjIJ18PZvswaWAiSbGNg0+w5pM7lYlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727136476; c=relaxed/simple;
	bh=w9Fj8rmfJW9M1tYObef+ZDpR5VPLudHlXkKgj4slpqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DE2VpmUwrfnceJJbvW+VqaUyUjHNKSfT+0pCFIkSVR+BBLYySaQN9x9f/wQav8Aiw1x0Ks94xTdup1zai6cb29NyKvmJH/yix5Aq3Tw10FE0YfyOJwlJ1+nYF/4EqFi3mjgipdZ1XqYPBag3pcCdXxhiUubknqt9J2XxYVy5aVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J3M5i29S; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J3M5i29S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727136475; x=1758672475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9Fj8rmfJW9M1tYObef+ZDpR5VPLudHlXkKgj4slpqQ=;
  b=J3M5i29SEQd5QHAcBmfCLNC3gMwui7QGbvBVM3D9UnA6sxQc2QuBBjFo
   lv9WKTRs6xfbSG2YRMdn0o3rGoPopL7u1xrqqAJQtJ+Q1fWyB3UXYNrGx
   YZzLj3fyMbVMjDtFLROxCXQ+r9VWn0PhkAZzGTg04Q2yEfmCJK4+8d4+7
   tIakOHgOFPUmUl1p3fsFYNA9M10HZ4ow/FLHf+AFceuyVTStNfD8aMfPk
   +FsiP1sEhevd/an4QzpArej0Fyy0ybLfX9beMpcqC2tHSCUirMXECS+Qd
   syCnr/9NhKjQB/xbBX27q2XBRA1Js0tcwvCwLT61P1J9EUqrb0OZg3Gg4
   Q==;
X-CSE-ConnectionGUID: ZylnBsqLQ3+PAbR7swTGZA==
X-CSE-MsgGUID: qos8Wu1wRcWUSsj5ChIWPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26262098"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="26262098"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 17:07:54 -0700
X-CSE-ConnectionGUID: sxmm8egdRmSK09HPdg2ixQ==
X-CSE-MsgGUID: 4xqjpzD/R3yEqDizcG2Kaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76006400"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2024 17:07:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sst5n-000Hib-3D;
	Tue, 24 Sep 2024 00:07:47 +0000
Date: Tue, 24 Sep 2024 08:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2205/2441] kismet:
 WARNING: unmet direct dependencies detected for GPIO_PHYTIUM_PCI when
 selected by SND_SOC_ES8336
Message-ID: <202409240820.wCFznx6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 39a3bb7fe802a8ed7a0d1bc0f6c10c1d6a80fd42 [2205/2441] I2S driver support for Phytium CPUs
config: x86_64-kismet-CONFIG_GPIO_PHYTIUM_PCI-CONFIG_SND_SOC_ES8336-0-0 (https://download.01.org/0day-ci/archive/20240924/202409240820.wCFznx6W-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409240820.wCFznx6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240820.wCFznx6W-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_PHYTIUM_PCI when selected by SND_SOC_ES8336
   WARNING: unmet direct dependencies detected for GPIO_PHYTIUM_PCI
     Depends on [n]: GPIOLIB [=n] && PCI [=y]
     Selected by [y]:
     - SND_SOC_ES8336 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
