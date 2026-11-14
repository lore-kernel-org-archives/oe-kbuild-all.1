Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663100;
	b=Bcr7rDnDEjU2OGK4DQ5Id9Dl79SYmXnsEFTWzj+uU8x9/Rf1xM9vWXy6VcidTm5Q0vZv
	 daLy0hoRlpGVyoVs+L2tVTI8EZ93UpxDZUbf4GSe84DFRPscgL8vDMiXmRhDUJxGVyauL
	 zhMATpWe+1wZ7sLMPzM5huM5IMykLZzbU7wSRbjkBsXix/P/5nxGKMUAoKM1LeB+L+FTD
	 lvIONsBoEpHjIvLOS/sj9BDunaTYG24dNmZw56VAbIa7bZPjHWVsZiiUTWavMoA9trnaB
	 rggfvmdDVT+0Vq40sngx78bfmskERkHFfWsSI56XNZwAv9w/NSPBPGOlPHgCKU2IfNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663100;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qXfRfJUXswvmk0850VBbwHhe4iMTse00YkE0we53NAo=;
	b=e/2PxBY3c0x32xrfU7TGnOuWUbCnsAj7Ws3kG/+joXvPcDn7OaGyz9IPp5ZE23htbzk3
	 TajYVAFVOhg8trtK1DQSiR373kkyWx3EjL5wyK9bFf7wgs9aS8xFJsQxOEe7u2mmDUevM
	 MRk0H0yMJiZSy0t9MO7BdOenoRyp6bzrzB6rHHS90gdP2IYKhJA732k93oq3HcUZ8BZGX
	 VA6NS7tw3ZAMj7qr5DTqgejL/BYqpe0iA09L5sDsIvtOLHyj70/upRc0AdRvacXpPgn3L
	 OzQkj/A0UFFNTCl8ms8N/toAaUiAfz+gtlLiWzZisRjs4zUD7Ea2bSg9wg6NByMUdVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCRhu+YF;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65407606A323
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 13:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65407606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OCRhu+YF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794663099; x=1826199099;
  h=date:from:to:cc:subject:message-id;
  bh=V5mOGmZPp1xD+mlNakB1XLktef/bkIwa63N0Vf4nsP0=;
  b=OCRhu+YFztfhw6QtEnvuycaRxu34AAGFvZkA1fEwhgkGffs59K3/5BdT
   CbDkButiAE39LVGKmWgynSGdWlYE11788Xmi6CDP1qtf55/hlveOqz23X
   VS0JjUiD6SiiYQyCw4AhOu7eI1RYa0i0NqTXj6T9sBTd5g963d8Z2HUMu
   fqDWVWmalBbA5QkM3TfjRFgDC+yH7A1FTt31A9dguDLO13s8GLgCVva8Q
   TFBQt7VSZ0ii9bErEhe7Ly5lN+Vh3IzKyb8Ern0wThDNqZeN6OK6Vy+vd
   Lk/bsArZccamZF5IxguRY1oyk6KNzFIg4xWoTGFN24wuA51rGNuwqDE4h
   w==;
X-CSE-ConnectionGUID: DiGWF0gnTvqYid03RWvTvQ==
X-CSE-MsgGUID: hn885PHzRFeukDGOH1zEiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3362435"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3362435"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 05:31:39 -0800
X-CSE-ConnectionGUID: s6DTeDkiQbmClFQ7uf4KIQ==
X-CSE-MsgGUID: GZMNT8taTqGGBYgxbab+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9325781"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 14 Nov 2026 05:31:37 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSDqx-000000001ep-25bG;
	Sat, 14 Nov 2026 13:31:35 +0000
Date: Sat, 14 Nov 2026 14:31:15 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/154]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611141430.QpjeHkcX-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261114/202611141430.QpjeHkcX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141430.QpjeHkcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141430.QpjeHkcX-lkp@intel.com/

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
