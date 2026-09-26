Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324D3438A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790401187; cv=none; b=IyTENdsO/ScuHe+62W0eVuEpB1A4woUNyj1hOJL7oFvtOAKflvlZdLK2yJrsUjxOfvv6dhMNLrBzyuxO8W5gxuLBCagL/LIM2fE71LRo4t1Fs9RO0apV59LylOB3ZMJ+STzYrg3NDgd2Q7zsutuE5XQOzg12IyzbIY68VnE4bco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790401187; c=relaxed/simple;
	bh=GxeO7ZR+43/HiQDLS0mh9PITwkx3wf4sbluS4Lw9CLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERExgMnsdvKOTSZhFJ2TW0oAKVLYn8etAI2D6s/pQRhd/Rv4dkDfSBAdmjphBfneiLVo6QPnyC8Jq155nPSaANu0DhP+4vInIl776f/dbzBVA5mQeHegAVyoPdsBiabSFHcJf9mKyWXXHN6KbZjo0ziFMnMEAdyy9lAdXECFrn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kD0mYF8O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kD0mYF8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790401186; x=1821937186;
  h=date:from:to:cc:subject:message-id;
  bh=GxeO7ZR+43/HiQDLS0mh9PITwkx3wf4sbluS4Lw9CLM=;
  b=kD0mYF8O4wO6UeGoXn9ui7q397i1cyLJBeC6C4CeLVL81vJjCTtQnsqd
   r3wgq/dIc6ZHwJyE85zOeCy75JdrVLyjnHNhZ4oA3NEsxIp9nQg6qs8j2
   ykvQJiNQqs1J9FbijQe6QOirzDaY+aIanRVIS4QIb64GHYSNgVEkWSuOL
   amEkfpFb1YwmvhOSIRYFTv1n18plLLYrww4bf5EOgdL9H+xUyYsEI6PKK
   4cpztzgv8qJEWreexRtujjNmX8x5OaCq76QrpS3QCOu6bFQWsMN8MfKP3
   VVV+G1XvAa2scy55ecFUjJVra0N21lM3xXviCzPtc9hoZwL3WKRGIeJTC
   w==;
X-CSE-ConnectionGUID: ltiPlO0BSwe00HQ4HTDJ9w==
X-CSE-MsgGUID: dr4ZmYf+SiCIuPGTTpeJEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="94063264"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="94063264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 22:39:45 -0700
X-CSE-ConnectionGUID: 8vthwh1uQgqp7JBOH4U12A==
X-CSE-MsgGUID: hP3LBtOBRuqKnjx8p6uegA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2026 22:39:44 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAL8P-000000000Lf-3dTF;
	Sat, 26 Sep 2026 05:39:41 +0000
Date: Sat, 26 Sep 2026 07:38:48 +0200
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 9478/10910]
 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000
 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai',
 'cmpbi'] is too short
Message-ID: <202609260721.RtG4LmP9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 84cfe37c261eef10ea4030ae75bc038e04ae26a1 [9478/10910] arm64: dts: renesas: r9a09g087: Drop unwired ADC interrupts
config: arm64-randconfig-2400-20260925 (https://download.01.org/0day-ci/archive/20260926/202609260721.RtG4LmP9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260721.RtG4LmP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260721.RtG4LmP9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014000 (renesas,r9a09g087-adc): interrupts: [[0, 698, 1], [0, 699, 1], [0, 700, 1], [0, 701, 4], [0, 702, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014400 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014400 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@90014400 (renesas,r9a09g087-adc): interrupts: [[0, 703, 1], [0, 704, 1], [0, 705, 1], [0, 706, 4], [0, 707, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@80008000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: adc@80008000 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
--
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@90014000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@90014000 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@90014000 (renesas,r9a09g087-adc): interrupts: [[0, 698, 1], [0, 699, 1], [0, 700, 1], [0, 701, 4], [0, 702, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@90014400 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@90014400 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@90014400 (renesas,r9a09g087-adc): interrupts: [[0, 703, 1], [0, 704, 1], [0, 705, 1], [0, 706, 4], [0, 707, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@80008000 (renesas,r9a09g087-adc): 'dma-names', 'dmas' do not match any of the regexes: '^channel@[0-9a-f]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/renesas,r9a09g077-adc.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb: adc@80008000 (renesas,r9a09g087-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
