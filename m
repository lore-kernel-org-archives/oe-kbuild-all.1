Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607253;
	b=XNbUVsGboKferQT92cwqaFcHMVr8LQhSSYZKExiLzmrLn90KviLYM14kR1Gumig065Jt
	 SQeP6QQvpDVKesmYK8tVEnE1aS2AhG4cxoF+ezVjoj0jLFvgCPPaMnyBBBkbkWT892g8+
	 1iI5WWUxhLIDDtbWksDLWqVayEIZMp5cCq/a5GeSrvvjKNFK+/jc/CrBbK+C/zbZ1nBR2
	 BbHRzH5y63pdRd8sfJZV6KB5EHvCANLYTYtAcApnURVR+EUS89Q1FU6e1TsTTLbzTo/Q1
	 Iwi3lnMsu+hoSXxAPA99SN0QTkPL2+ZyuCWnL7Sa1BAiKJIfzWxAG4WtWz+C9f6+W8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607253;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=laHA8FgjcLPWqAQVaStQeTuL2FZBXSwrWIokUEsHY74=;
	b=KjWkdQv7HNm0B0HhqRC3DZw1C5v76q7w+rSuAkzoANxbglDvYviyVb40XgrVp79y34fm
	 55ow4zZKuC11fwDQ5JiexqBO0SWC5t1eF0qhOQGlXQ+fmvaWB0FdwOxwljn40DIp2xDxs
	 pqpK2k3uQniSm6TUwjVG7kdGn9eaKBcIPzscjYqjtvAmoBArSGtR6syBZ6ek0c5dS02BH
	 9CPtI06b2Gue2LsZJYKPCFFTHVrUG12RC8Nkeey9QGQbgF6wkt8+CxfeY8kRiW0yZsoPS
	 SwgMlTSoQXahCkTjlWpd4BYdoTe8VpROomixwWzCSilR25Vy1j+7xlmD0kUO7UgKT+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AvJFJKQm;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901A606A329
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 22:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C901A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AvJFJKQm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794607252; x=1826143252;
  h=date:from:to:cc:subject:message-id;
  bh=RcYWRynCMpotzLRWZvVxcs5eYpSvkmRXXSZgfFrroUo=;
  b=AvJFJKQmYl9PJ7oinL/tY66bu0HbCd0jIFm90Mdfk5+FtK9tEuhY0k1H
   +DodLmRJYSyyiquFHg8fEsj02qhaHKXAjqVzO21QgnZN5kL1t2vKdZEvq
   j0B1nbU7Pd/bGHh7tDSXmg/G+D7hCVZRwC7w1SxQ9DBTXTQad48c50Aml
   9xrZPzRAvs1PZzXFWqhYRQSV9Erd9PXy+jZcyqj128fWsus1QRjkv9P+E
   slk3CinfeDLqyI/0ELWqO9ogEGLs+iZnfb6CeYpVHm196GXtVlAWQIP8D
   9+EJ2yiGfKnyl7xedIBou4cBnLhbs1rqn+2OVN8GxkVlckdXOAl1fPPQq
   g==;
X-CSE-ConnectionGUID: DTWM5Qx7QsuTmNnn5PKn0A==
X-CSE-MsgGUID: 1iqGXCHlSTK3mhVWrYARjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3423919"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3423919"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 14:00:52 -0800
X-CSE-ConnectionGUID: 0KiAs0j8S0GY+gkVZodGAQ==
X-CSE-MsgGUID: CEOouM4dQJCm2kr+2T1qWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9291229"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 13 Nov 2026 14:00:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRzKB-000000001LP-1JxV;
	Fri, 13 Nov 2026 22:00:47 +0000
Date: Fri, 13 Nov 2026 22:59:50 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/154]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611132237.2PDOUdtu-lkp@intel.com>
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
commit: c178127e627efce9560b07a81e3d2682759ad608 [51/154] arm64: dts: mt7622: fix sata
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611132237.2PDOUdtu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132237.2PDOUdtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132237.2PDOUdtu-lkp@intel.com/

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
