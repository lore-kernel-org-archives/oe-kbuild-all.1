Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490130;
	b=sowWRSVz6wagXuYij4f70D3V3wrUz/17/XcJ8n2X2ZzbOtG0COyyw86baSqLiMJrkZuF
	 O/5EMTjg2/sHDpiRFwTVo3GmuY7QJdeqwCO0z6kFIyT8Uz97iVCktw+7sWi93+fXY/KTs
	 Tl5Tb5+x6gjnFQMBQKY7FSna9Kspv6AGpyJsd9JmDf3v5HO98mI08bSkid/ZIgA0SiHPR
	 VjDMNMvJjbly20uRiVMXFClCHf/Pyqp1paNjtQgnwAOH7IIefEvO5ZecME5Ge9F2c4juf
	 CHRGpgwJ3f8k7JpJLbkSfSyeEe2JG5GOT5Uwi30YqllWqrHJAy/LGbZsaicdLe+W4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490130;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JQMzZfQ+EgBNMc7UXntjIz0bbdpQHfaOxFX4rLyg5e8=;
	b=TMky4IriW/sq2KaDjpY9U0LIini8e4HZ3wk90MWNRBsoNqoBA2y5/iqEYa74FBqfscck
	 04T7h81QuurzxTZ0ipjbm54GIIrnYZX+OghSo9GY1uJfuJE2IbjxNU4GDOPzvWGwqkQEl
	 Ej6p+WhbGCWldDzDAiLzs5zYOuAz5iOcFMK6buBKRlAqXCKVtDB0x+3/t7iMg+KF+UF3b
	 8mYZgIY20ZOxeRD8e7ClLjg9gb5zx0YLUyUrEqwzwBXmcp94vcluEZRL3kbPI6BEzXG/m
	 39KIOlUUgooEm0WzT+oMY37GcgC20odMa8WCTXmDMelkxk7bjrBbsS1y9Ew7aCfgGJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U93BOl5O;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B50606A327
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 13:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B50606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U93BOl5O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794490130; x=1826026130;
  h=date:from:to:cc:subject:message-id;
  bh=eHrti0UY5XypLIvpk82G377w/rbdAAPvVRevdq9OJxo=;
  b=U93BOl5OQzZkbGX33hqIFe3TSsdvx85QlQaOQSejWjLZpCTNDuxSGnhJ
   T2kmXpHzzVpByTHOHmWZlzdO92sPn2ibLr8xiwAuxJHggHlWVC0wDiB2o
   zyKQ7NtjhxyuN068lMHlCFKXUWhsHDvZHH/PtN7OEyoiQEnpUHYKjAHka
   mERPgd78/DsWUO0syUursImwUurSnP7r6/hZlW10fYIlM67qYzYqEmS1k
   o6CLbC2UhwGVXP347JpY3RjVorGTO9pW4ILRWQvrEdOMSVEB7R1NNemrl
   vzts7lTr/YZLUalUHc8SdPYGXcyQbS56ae26X493zjyn56aTDzm/vpKmJ
   A==;
X-CSE-ConnectionGUID: vnXjNMTXTsKxos4iyT9f9g==
X-CSE-MsgGUID: fnUFLwx0TfSoy5LoipdNRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3319133"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3319133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:28:49 -0800
X-CSE-ConnectionGUID: y4Hj4JNfR+2/TqNyYoGfXw==
X-CSE-MsgGUID: Bw8K7P4ETvW+TujLIZTt4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8993221"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2026 05:28:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRUr7-000000000sx-0iWp;
	Thu, 12 Nov 2026 13:28:45 +0000
Date: Thu, 12 Nov 2026 14:27:46 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/154]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611121417.m6R3SIzb-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611121417.m6R3SIzb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611121417.m6R3SIzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611121417.m6R3SIzb-lkp@intel.com/

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
