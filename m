Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333973;
	b=FzbKVZm2QIAHwC6a/P6EuLrnecvhh2jqWMRPUJswP3XcDsEk+p64ViaNqlEdFjVZ31F9
	 nAgque21hlVk40jP7uBoophYBzK7ByexDKMQml2RBKPBj6T0bnFJE2eXV5oNdBqUnIe5p
	 1W6q/bH6Yd8NCKzJRr/HTipNs7gaKALoPaNapOrKpopZ/sqRQRZzEG+rtwSVK0g3sTQKI
	 lECBbUIoNkWCaoQwItbhxV5say3G2/P+IzOyk8iRFPbBodcwSmtFPqO84nPgKeEvepiMD
	 geru5WbAQqmMCyecf0+4vBGIeEkZyeGs817iGfXgGRShNmKYLUuT+psi5nQblht60yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333973;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=+tM/oU4zNYa63wGtX5VyuihF0FDoxq7JCyhsClu9mMQ=;
	b=Mpq9EZLoxth/K9a7YKJbZo26SJ+S4iXHmNH4zGipWinO+Pcc1Vfc3/YHrzEt/YEiGMLt
	 DZH8KD51UIanEKF0eU90v1jCVWVptZwnxRSHPdJsYAxytfJGbAxS3dAN5ahItENKBQYyH
	 oUW1I8exhQ1YxIhkCdjofJffEen0gHbh2bC5E1vaQDE5e54V/7EZzdLesV8bjP11fNWXh
	 uZ7G8wqlgjF2kVvbbDjayvpdgBujgO9jFOtzUXuoCnvhzKjomhTDEIlV2MqHrRgZY8dbT
	 KYhrinBpmGcBkmHYxJ+OjRnylwq5FBBiNeLQyGX3PEkq2/n0VGxgWsC0xxgDAMYCKiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BqPgm20S;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE0D606A320
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 18:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE0D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BqPgm20S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794333972; x=1825869972;
  h=date:from:to:cc:subject:message-id;
  bh=OKyvbkseiSLShZM3bH7HuBmeZSx2N2Ja4bk2jLaUKU8=;
  b=BqPgm20S7GmFnj8gF/9dv+jvYCEgGBcmB9FZV1/T24OsKVOp9uO2yqjN
   WRqSoCbTSLcT8KE0BP90oiNFxth0W9lbDIXTmoqbYypaUPzUEPlDn/d8p
   Hg+HW/b3RpYJccPOKGzPalhe+4VWWMIxULkRmwFuGSdHgMUAWuo26hV/Z
   +5Zt2uIQbUarr2wZz8ESk9HWw/1HX1NJPLTm3z9Z4Ip3+usfQDcsarVyS
   0WzTMQy797hpJpojtv5cOslrrtLJPkC9ZOF/gcJqntUz8+exRRpGusxkK
   suQMw8xeJPy52vOEySxmu0SdmG7822R8ltCw4dAnxj7pKDpVLJBoEOhfE
   A==;
X-CSE-ConnectionGUID: DkV1xiFXSOqVrh+lb8lW4g==
X-CSE-MsgGUID: JDDJ7qDXRLSUmzzpZivmmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2996100"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2996100"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 10:06:11 -0800
X-CSE-ConnectionGUID: IaR8Q1M3RbGeG+WPa2Yuzw==
X-CSE-MsgGUID: 0EtAzkTGRliWI7EtHpsmUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8559946"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 10 Nov 2026 10:06:10 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQqER-000000000KB-3nYm;
	Tue, 10 Nov 2026 18:06:07 +0000
Date: Tue, 10 Nov 2026 19:05:57 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 51/154]
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: clock-controller@1a100800
 (mediatek,mt7622-pciesys): compatible: ['mediatek,mt7622-pciesys', 'syscon']
 is too long
Message-ID: <202611101804.k0oaHkn7-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261110/202611101804.k0oaHkn7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101804.k0oaHkn7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101804.k0oaHkn7-lkp@intel.com/

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
