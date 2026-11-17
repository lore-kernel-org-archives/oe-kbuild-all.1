Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898373;
	b=MSKJ9oePoyn1twY4IQTQOCVdKDy6ySQyWmGe1BLn9aNdejgRxdquGaHRSH/AmwRLCmYp
	 ctpB+RDfEmpf5wH2RsL31oDVi5anPL7Z2v4/sXBuYQEck1QhZz3YcADQSiFgWbuMwintk
	 Pd+8Ah9AmMWR7eTyKgceA+lgs1uiAOvzxm2yvI3u8zVqFAdX4y0l6TZWSFIpwJKF4fpV8
	 XsB8+ZbL9ZuzZ/zkZFMehD3ahk8nRF/1zE2p+cVTedUsZojp8lrunPaBHDCfDTH8Kd+E+
	 rjohP8kOjk2V2e9OUq9p5Skhu5BOoURw7OsWLCtTYMKu7SfQTbKMX5+OjpO7upWbSbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898373;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=yR4h9DQyRef4iX+qSBPRunUjxxdOQr85IfciZS30LXg=;
	b=IPldaVnC1ZCIm5WSyTqo16EHXSOeOhhpEnLW16xC6gZbhRnXiGvttpfXhvW9nQ0KVgeg
	 pVeq2M/q1wBtTvcJlO3Mb/XtRJy1uHFAylN/3ze1VDerqIYHE/IrmYXSmq6laKQsnaIFP
	 Q+OTaM1mF0WxVHdoXd8As8jDJ57yWOcz5LDSzpJH9VCTmuqxgWSWzKj17gAn0AtMA65u4
	 wGmQbIQJjN8PVxuTPZsr4QQX2AKektYWwEyMIhyxLzS3AfgkTNsi+caIUXp7s93oX4gDt
	 9n2zB/ZyhrDMGCH9zKTBLo/FfLFnLmp0Vhh1IveHa+5d3NYSku6M3EHh+Tg907HEffw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UWPxculZ;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B4606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 06:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82B4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UWPxculZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794898373; x=1826434373;
  h=date:from:to:cc:subject:message-id;
  bh=U6jRohgevbPzDYIXw5SThEpxmyRWy54eaCrdvKq0fFA=;
  b=UWPxculZTpCkGVXWJ/qjTFjI9dGuTLjU2E7lbKIwQoBK3hwfln6CLFn+
   VX+kTIM5A8UXsxBMGu58XguUCYXptD6ZGrOGhBEbsWqv4LV1FT1cqglAX
   sJZMwBgjFrRj28J8OAfZHyGiDAY1Ba6fY3iFxtuWKjBq4hNvpbl4ahccc
   4RbggUYUkCi8pvIpctOpIdOIPkAHtfAwdeA1F7cOx9vXEfcfTsIL1hTyr
   5WKcSJ/KhZxbEYXUeqFDqU9zSy6Dr4sN/KmH95ZAmwM0WYO2+7Z0aYxY4
   2WgHzyMqIeivA6AiPCZeass0sq3Ps404rGb2U2pWGpbmtjI2grnHiYVZq
   Q==;
X-CSE-ConnectionGUID: VXx/YIgOS06jOs/E2C1FDQ==
X-CSE-MsgGUID: aPEOgIARSsuizSHi90Hfmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3665738"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3665738"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:49:28 -0800
X-CSE-ConnectionGUID: O++D5D4eSxOjLFjdxjNAdQ==
X-CSE-MsgGUID: IqzjhdzERmunAZoutvXmZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9925823"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2026 22:49:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTD0N-0000000030C-0qC8;
	Tue, 17 Nov 2026 06:49:23 +0000
Date: Tue, 17 Nov 2026 07:49:11 +0100
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Rob Herring <robh@kernel.org>
Subject: drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use
 ARRAY_SIZE
Message-ID: <202611170729.LNqlHdfg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
commit: ce26f588c8310e0fdd1bc7524a86fdf0ef6b1c85 misc: rp1: drop overlay support
date:   11 months ago
config: arm64-randconfig-r2109-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170729.LNqlHdfg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5637411ce5dc86d0b7f87cde0f7ee47406d29db6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ce26f588c831 ("misc: rp1: drop overlay support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170729.LNqlHdfg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/pinctrl-rp1.c:343:39-40: WARNING: Use ARRAY_SIZE
   drivers/pinctrl/pinctrl-rp1.c:444:33-34: WARNING: Use ARRAY_SIZE

vim +343 drivers/pinctrl/pinctrl-rp1.c

e3ce7b89738833 Andrea della Porta 2025-06-24  339  
e3ce7b89738833 Andrea della Porta 2025-06-24  340  #define PIN_ARRAY(...) \
e3ce7b89738833 Andrea della Porta 2025-06-24  341  	(const unsigned int []) {__VA_ARGS__}
e3ce7b89738833 Andrea della Porta 2025-06-24  342  #define PIN_ARRAY_SIZE(...) \
e3ce7b89738833 Andrea della Porta 2025-06-24 @343  	(sizeof((unsigned int[]) {__VA_ARGS__}) / sizeof(unsigned int))
e3ce7b89738833 Andrea della Porta 2025-06-24  344  #define RP1_GROUP(name, ...) \
e3ce7b89738833 Andrea della Porta 2025-06-24  345  	PINCTRL_PINGROUP(#name, PIN_ARRAY(__VA_ARGS__), \
e3ce7b89738833 Andrea della Porta 2025-06-24  346  			 PIN_ARRAY_SIZE(__VA_ARGS__))
e3ce7b89738833 Andrea della Porta 2025-06-24  347  

:::::: The code at line 343 was first introduced by commit
:::::: e3ce7b897388339b407d57969acaa26063e38209 pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support

:::::: TO: Andrea della Porta <andrea.porta@suse.com>
:::::: CC: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
