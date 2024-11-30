Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC8B29A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 05:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732944428; cv=none; b=AOsVXqi9Qi8bJNwlgw+uF+p7NwPVVNHczbPnKPk4QXkhZ5o73SRfMjPDoiwMxTL6Cw8K62qvtmC07iEdcJnOu2fRaDSAC8yG8FWAHSRV3zx5VCsCL8LKOtQBCOEHNzRQtrMKI/Io0ALAKO6fBYErEJIZUdvFX5lD6njSZeNB8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732944428; c=relaxed/simple;
	bh=0XCoC2sLQ7FLBzF0SOy+rpTZ+tH63/lT+HL88tRA4hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iBWPmhBpnRf7TrqjzKJj8Kq+i6uTrQG3u4iNDaRNUR66wFhU5xfupT6Md8PcalmSCmhyr+F7eSSuxOV/S1YZaujJPrC6xqYVvAIKrPx3JropR8ihWO5T4VNSbu6mIfhiOHdmDMpAFdMwQVd4yCtzqDWM1rRriGsMPLIpdgDl0AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNVgPcWq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNVgPcWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732944426; x=1764480426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0XCoC2sLQ7FLBzF0SOy+rpTZ+tH63/lT+HL88tRA4hg=;
  b=UNVgPcWqFtJ/VhhrWE60BYSJK/Lrgtmp2vFPCOjQ64dC5a398v/diD4T
   T/IYVMqZXpcb8X96daf9+iG6K/xlB47Y1DVCRwplasA5ZFv34cgCapioO
   2IP//JI6HfE1hyEM8Iz5O44a+hLGHnGqRR37telc4WCGsIdAxSSMuJP5q
   m0OufyWzmlVEsKgLm7YCs+u1lWvw2qX78MrHCFHCO8F+1WoyauSVMeCsW
   owmLuMubmmBMeRFw0mTMNHBrCtmpp3F12wZxZmBG8JeSommnCmu+mrejW
   1M3ZpXVQnjI/T5i0A+rkbMvWdKQ8AtecloKR3G7i3jFh2Y+sAH3GSlhqB
   w==;
X-CSE-ConnectionGUID: Z9kA2s+yQ7GA2nVXFCJveA==
X-CSE-MsgGUID: BSPCU904SQCZ9WD23G3Phw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44549787"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="44549787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 21:27:05 -0800
X-CSE-ConnectionGUID: aE8UpyJqQTeNS6buiqWj2Q==
X-CSE-MsgGUID: GMsFSr/JSTmJCIZGa+NO8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="97050758"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Nov 2024 21:27:04 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHG0U-00006p-07;
	Sat, 30 Nov 2024 05:27:02 +0000
Date: Sat, 30 Nov 2024 13:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-mt7988upstream 30/35]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000:
 pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202411301302.IGXc4bTA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-mt7988upstream
head:   0394c5dd3789237469301f096d1e011365f926be
commit: 702368cf2829f1358e16ff2d1ba1347192d7f51f [30/35] arm64: dts: mediatek: mt7988: add ethernet-nodes
config: arm64-randconfig-051-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301302.IGXc4bTA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411301302.IGXc4bTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301302.IGXc4bTA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/syscon@10060000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/syscon@10070000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcs@10080000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcs@10081000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: reg: [[0, 353370112, 0, 524288], [0, 356515840, 0, 3670016]] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:0: 'crypto' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:1: 'fe' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:2: 'gp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:3: 'gp1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:4: 'gp3' was expected
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:19: 'top_netsys_ppefb_250m_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:20: 'top_netsys_warp_sel' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:21: 'xgp1' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:22: 'xgp2' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: clock-names:23: 'xgp3' was expected
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet@15100000: Unevaluated properties are not allowed ('mac@2', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
