Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417237;
	b=n0XtbTsLYmkYgqpgpL7eQbiCxXMaF+IjoO7xSeH0vYHJwHOSR0DYCAO1tgWFuhGMFZM9
	 EZ9ovplGghjYf2XHRenbpUbqrGoHbyGs6IdDUgwaaX6Uubv23Ia9T1szY+BMoW6s00WeD
	 OOxhHNCzJRCwHiJ4PylcKP1htTPUqk9svamUaHSg8kSMiiQOyKjNlVRyL/K4A8WS4BPQT
	 1XudHjlr9IY/kW6FRFqS+fGCGyObNaXBtLz/3dElDN3LpIdr9pZvZJLpgyaWdKYHQeqyR
	 lvWTM68Atqiz5ziFYwC8pS6pyB8hTzueIhgMPRAT2WFoEVC8aS7kvi7+Ha6mKB1GYIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417237;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AsdUh5DYh8y6iNkfZBvVUffcI4jqkFYOPZ2CAoGP2UI=;
	b=WdegthT43qRsFzIPdPJrVRKEWd1SezP1DQIn8NFPQ3nTsgco+BhSouMRuYkJo3q6JkPl
	 v+ldjT2+HwcTPcNBp+9m7p2oW+VgMt2H0U3YG0Px6MhZLaJIaQDDAgZf0TSUu4wg6S07F
	 kD3xSMMir4HSG3gdVTlkuWeBvFtzqskaOxbfNFnlPl0Kb5RJ4kHSpBMen9ASpsOmXfbL1
	 ZFSn7NL5CYzqmdrmQa01aHQFkCnJVUYG+GEP9rQ7+o+fAHyyo+H1Imds+OIyx04zKwUSm
	 CUc1mSD34iZVdJhkqJGyahwmtC7bQLb/2eH4A4Da/NXlf+gTIa/aP33fmoJubRAEQyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d06P6KK+;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4994C606A336
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Nov 2026 17:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4994C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d06P6KK+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794417236; x=1825953236;
  h=date:from:to:cc:subject:message-id;
  bh=C9UKNZx6LaLWIivu8LWjR8CazCef55ZfwS6V7tvZAfc=;
  b=d06P6KK+vUaLgUytAMC7aDuW/jaSB7NDVHMPxPe3pNOZCR6Rtxgz/2rS
   ZaTcoq0CKWzjffc16ixss4VsGjqlnaB1FVNThGN0ujRzBkCZ4IiPrlUjb
   TUfUn493pGiaOmNsr3H5VsJI1p6YXa66AI4cTNFb28l9YSb1e5R5JGXy+
   g7RAibgh/buoTUwM942b63liutJK6Dc34vPlIkgSRJeK4lt/NLuCq2tRs
   vdYHsQvwH1NXI9lKMIlo4mwwDRgo6XLprbRt8S/covxxovwDWtNA2jE5+
   2v/hqUgwxj55y+SzuzAVvdjNfHVgQKEJBWTkqwyNxkQ28vKFhAB1NOfQ7
   Q==;
X-CSE-ConnectionGUID: K+W1EW/0Q+qEcGXkgzgKow==
X-CSE-MsgGUID: DvVDsUkoQ++zZBupbk+v3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3191170"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3191170"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 09:13:55 -0800
X-CSE-ConnectionGUID: mbG3oRmfTNKInf9bo1uBkQ==
X-CSE-MsgGUID: r3hyxoMfSFGoF9B+gYvqpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="10183805"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 11 Nov 2026 09:13:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRBtQ-000000000ch-2Bnv;
	Wed, 11 Nov 2026 17:13:52 +0000
Date: Wed, 11 Nov 2026 18:13:07 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/154]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611111839.Tc8oyWo8-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261111/202611111839.Tc8oyWo8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111839.Tc8oyWo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111839.Tc8oyWo8-lkp@intel.com/

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
