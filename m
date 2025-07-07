Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC7D219300
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751922688; cv=none; b=Wn5QhhAm9faeIv6lkoplQQ/q1lWt/051ARJIermICN8QJ2B/ZxHT9F9S6EgLPalo/bbf9Dfw0HfLhjv4Yu9Ddzf+jHoI2VnMWVEc8D3iCskQeLsDKDc2f7pFnLMIkDmapry4SFlfWqxHOULFooMplfRsMemdwhEVmDPomHHYx/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751922688; c=relaxed/simple;
	bh=/beaZOQ5KXW/L1M+TcIqDL+jgyWR+n0J5MiCv9c9i3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nXZ8DUC5upiFPZoSgTET3TeymOuNLuuUpZQ2QuTWin1ZH8oiVYJwyHksmZNQur1/sunj9f0zC1gztlUD/jW11cblizLa27w7ZwgvgQFuo4sPmthEbxP7HeUnb29l6mKNoHV4kr6Hoiu7K9dweg/OR/xvP7pZch1+d441wnOHdPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kv1/1/wO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kv1/1/wO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751922686; x=1783458686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/beaZOQ5KXW/L1M+TcIqDL+jgyWR+n0J5MiCv9c9i3k=;
  b=kv1/1/wOPQ07kle5/R7sY5mLAbP63eaGd5enT4BD3E/CU5Mr+sGK498n
   57radw1sgrdJNlgqCytohJuna6Tga+/GA/r2uP0auG89V1nAAdUJO2/QG
   u4vVvcoPlEBefkAU7xCOYdFzLbbSY5x14SEZjJkOync4jsjmZoBxeFyEN
   ae+6lwEvKm1yhHK0gRZ4hopk/SMlFhrUs1gNAIxv2/y6/8TIBpMD62Odj
   rzIX9L5fpLDWASkb6KG2ML9OGpZqx1cNNgOFhHwtDpFjyAM+SiCgYl/Gz
   EbdMyo4f7ccI0cNtc2U1YvcyqUYXVyAW5z9g7T4dqBFHIs2Bg3P4Zwlo1
   A==;
X-CSE-ConnectionGUID: iNXpBVn8QTmY0s6JGOxASg==
X-CSE-MsgGUID: KeRq0w0qS36QXXB2gV1Qdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54124099"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="54124099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 14:11:26 -0700
X-CSE-ConnectionGUID: rOx9BguxSO6IR7cmLbNRJg==
X-CSE-MsgGUID: 2kjO8pgjQFWm7ySzOHlFgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="155443285"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 07 Jul 2025 14:11:23 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYt7I-0001hh-2k;
	Mon, 07 Jul 2025 21:11:12 +0000
Date: Mon, 7 Jul 2025 23:10:48 +0200
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 2995/7381]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000
 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts'
 was unexpected)
Message-ID: <202507072329.oxBGncrD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
commit: 14e8332e5c5d3b9f8ccfa1f3e0dfe05ca136ba2a [2995/7381] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
config: arm64-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250707/202507072329.oxBGncrD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507072329.oxBGncrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507072329.oxBGncrD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
