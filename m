Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769599;
	b=Nhcnw+rZ5uEzvSR/xhvkH+19gPOFqFen8BTI9ljG92l6nDvSoB15rQtnjtUjeBwKydcG
	 n0wkbIbvNom6Ij6xJnTLg6dZGf0dx8jRVVaIOcr/ft8Toks0ySmKYmUOuS1M/srxc2zuo
	 rLvhJzTWNDYXTTD3frOQHKB33AmyUXkLVEBKwGKZBJYEI3Hbel5l+5cMffn9Fg2hmJLBm
	 UZl9bTtAf5yMxIc4ZAL0zJ0s8z8NLNCYRGf9/OVB9c5uIBRX8UYdAyz5marNRshPPRema
	 1kdCriZxtKEIXrdHwQuyY6M+Kb2woPuoYYUYNNBVqlHtnc0ZxMfWTwCgwMI8HcaDKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769599;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rbmvQnuEXiQzc7ReFCXHSiWnCtG6+syNo+hDWNYAv90=;
	b=tffdveLSxPTk4XAR3mtk2owZqDBf9Z6V4VtgKsSFJ8biOXrsqsf5KF63x/IeUKvYNH5u
	 YYWMazLrLYPAZQd8PDzPTaQQLkLTUZ1vJrWbn0FNgxu4x5Z5bY0qiNShKreB2LmwK2v76
	 3gk5w7sC1VbP8e2tv8nS1awx/XtcROZEliNVV4JPCrrZhJTHmkfm5wiUVthz9E+jsl+7W
	 0Cr8OplxPrMor7KK1+Ra0qV0rYjToIuZ2hSwqZM23mhGIgN0F0rBm2Yw5kH96ujIlklRS
	 JlzpnL+EvY1mJJJJbUIPXNtTtESCIH2ZYZzivJzlDqnyVXH6NOiErgAYUCZsbemdbVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YjV7pZqn;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE8606A331
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 19:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AE8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YjV7pZqn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794769599; x=1826305599;
  h=date:from:to:cc:subject:message-id;
  bh=sFoRG0ZV1FtGajqBt1NxtSTAiwwiruWb/bJtXV1YDXs=;
  b=YjV7pZqnrgasUljOsONvhj4sbUsAY29T5GL4yQ24jR4zhSw824qPoiEY
   MY3yJHeMBcb8VeLKWR+kMnXuy3T8cv0tn7Ks+lYEueWBkD+6DVPZKXX4Q
   R23QNndS6PWD2mnm8a2P3FyWQhTkBhKy3VIVNGdApu6uU6217FKvYzI1d
   Uec2qp08OKCt99O9BjmtcrMTSGOwxbSslPHD0/wbl2vcAaQXQRMCWMA4l
   WvxreWtfWNo+k1HDjkgOIwQmkgIdfuaL+aL9jFQNNZUxBIEYUc8JCCBG9
   ZZ5ATawXlH1prCsLD/3gw+fChrjujBFHvAhdTlgSfAewP2fkF5JjRWREx
   A==;
X-CSE-ConnectionGUID: dRA08ls1T7G8o8yfZTxNHA==
X-CSE-MsgGUID: t9EdpQRXREaubdCheYDL9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3515809"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3515809"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 11:06:38 -0800
X-CSE-ConnectionGUID: RMpJLODESl+u6teUSu1iCA==
X-CSE-MsgGUID: 1uJILQVdQ5GG827cG+D8YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9690461"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 15 Nov 2026 11:06:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSfYg-000000002MJ-2Wuc;
	Sun, 15 Nov 2026 19:06:34 +0000
Date: Sun, 15 Nov 2026 20:05:46 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/155]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611151944.qzPHrGAB-lkp@intel.com>
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
head:   cd0eb1d4dd5d81633888178d716cb96817bdd927
commit: c178127e627efce9560b07a81e3d2682759ad608 [51/155] arm64: dts: mt7622: fix sata
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261115/202611151944.qzPHrGAB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151944.qzPHrGAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151944.qzPHrGAB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
>> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml
--
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@11220000 (mediatek,mt7622-audsys): audio-controller: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,audsys.yaml
   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: audio-controller (mediatek,mt7622-audio): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mediatek,mt2701-audio.yaml
>> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: clock-controller@1a100800 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
