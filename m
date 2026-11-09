Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191213;
	b=rPGQTROEGY8HjaycRfAIrd1WRMdpxOj5hTYt8izfluuGLKRmAESeczQLhw5oaJq3QODs
	 XJ6v+sFdvfp42xY5n8GDbcrBvjEIvrLVvllwx3mv2syLP2k+ArT4w75l5N9JG/h4ga4TR
	 UobYXpiDnZcyUbS+fP/YupOnA/gt41TyIoZHea43OIeIeP0hGVnw4hINspZP67qJm8YSH
	 RtH5T5DYs8lcfTrBI3XM1zBehlHwCHUuqM98eTGzbd+mw7EXaxBqjUaYl8IKB0YWAwbHb
	 j0zLw2Q1YbU7RCWESJgf8cdzNBFAHxwdUu1JPrUv6O2Q6I9lu4ClSvKncqZB2Zy37fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191213;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wV4nti/OKG/P/juOYB8TjPRTpYq8J//oZf+g9ljF1xQ=;
	b=e8ot5Xxlf3H3acq3UAGGg6tGmLyPaT3w0B1S5G3wVSp99uOUgEMr0Eo4xuoEyhpiI0lc
	 YVVSSd0Bs8vD3/6h8RargE+yrVkerjp4VkqJw9eAFTrg7lIGJzDRCi8lyjonPJzgMubZ/
	 jpzf2qfpMe8zMH9SfDevsyUTu3FA8990W214IcjYMkNyVQMqXg8r4TZ0oUume0XLhbTUK
	 RTYTZRoWSeu3JjkWJOVvScjzUF53NRkZgECqXKRGlTXsZUXrZ69IDLZ6vspoNB+kifELU
	 kqtk+t0nnroqWiy92nzRy9efjwVUKJ2MqE5RsJ47dzBqa8eLjYU99+Y0iGoZ7IKd4Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BXkh/Rbh";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF445606A320
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 02:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF445606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BXkh/Rbh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794191211; x=1825727211;
  h=date:from:to:cc:subject:message-id;
  bh=lSqJ/yIAztRAJHVjFZUerGvjFDkZ2HMWt3bGdAWntek=;
  b=BXkh/Rbhpkem+Oxku9qXnk4+xVG/UVzVA7pvBlwIg8wDtwtcmImbloUD
   SXzoMHmdKzr5AcoFsn4XxDnFHvkFhm1MtZ+jsEhEHXyCY9LTYiTSxyAG/
   kFwMlv1TK/gjz1y/kPA+WKRsk7ADBgIkvhakoHyTMa62W2Bdpe5NxMtsk
   BbVLmvRlG2ShjFCerN/gTMqyl1XhENwHLM9gHX8YoC9RVXN8bNff+6BmZ
   8DLb7HayLNUyVPQ5OfzezExBMwjYfkup+PdTduOZL5ifCntzcXDQo74nZ
   SUs/zTKgpaZBzbtL1MNZPC7L1sf6//CxXnr0SjvQtf1h7lQRRcfUkrH8d
   A==;
X-CSE-ConnectionGUID: cH9WzO3TRVKGFzddTUQxiA==
X-CSE-MsgGUID: PBpftwHMRbWlYWuyRpCZkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2955580"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2955580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 18:26:51 -0800
X-CSE-ConnectionGUID: F/P9OFoURjGql8pS/GXh9Q==
X-CSE-MsgGUID: wJh9mnCkRPeeZ4niaLZKzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7795445"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 08 Nov 2026 18:26:48 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQF5l-000000000AL-07M8;
	Mon, 09 Nov 2026 02:26:41 +0000
Date: Mon, 09 Nov 2026 03:25:47 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/154]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611090215.hysaGroy-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611090215.hysaGroy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090215.hysaGroy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090215.hysaGroy-lkp@intel.com/

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
