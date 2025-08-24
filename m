Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4627FB1F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756033746; cv=none; b=Bl99JS90b7xcvV/gsMhC2Ot0fyth7aoU7wn1VUA+gx8g5CYFP8ZVhWiPqpVBlw1pylzdI75VoSR4+kHtMcwqHUemylIVuLOObGE3zzABrWpPFEcvRPCVzLH8bHgDvVIvjalzM9jJWZ0uqOnAk256IKKQluY5a+OMM+/bmEpaTtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756033746; c=relaxed/simple;
	bh=xMJtaJW/s+eSTH9ZaFqnryAXsYmTFtS8DXlLezcFaZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nyVcIiG62V7/inKnht5sM49RxfwSxqyJAmoV1nrj18LsciamjkFigCJj6tTEeFgkOTHYEf4THORe+dcmVENau3JcHK5QziFaM6CKN9X1QNtLJYGTE93UFRy3AftnoaXcWSMWy0C5qLTs+h4LCMgEGqEXy+srMvTKrmsL6IDH1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbeZqmIk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbeZqmIk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756033745; x=1787569745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xMJtaJW/s+eSTH9ZaFqnryAXsYmTFtS8DXlLezcFaZ8=;
  b=TbeZqmIkb/mvqwHD0jXliTNTkRvGno34e/rJIq+hEmElxyn/V44sZMbS
   aDX2NSXcaN3z4xHRtoo8RsEKy20iXzt+NjrqUDRxmnAveFwqnbG+iKnWk
   ynKnE4QnA4fjoqcapHtnQ+QLpDPVSdBH0I2FYlwwrMcV6j1ZeNkzYPBva
   PyvaYzY8h/1fcKhucZKlya3Z33pVE5EnhzcjOPodfpc90mNA3iEaSg39Q
   DVqZIwbIP7aoqL4G/PdGicB1zAzLAoXF6T5SW7PqP+KygLEVH0KXHG+q2
   D3NWi+xHo1ADWHO5DV7izKnHTOIdPgDpZTJoTaCjN4LU2SWelGyixFEUW
   w==;
X-CSE-ConnectionGUID: PIoPdy9EQwGeoIJtCbukxA==
X-CSE-MsgGUID: lWoicJ/DQ+C+jZWBqMhX3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68865479"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68865479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 04:09:04 -0700
X-CSE-ConnectionGUID: zWzUlwTiTdmX35CW2MckTg==
X-CSE-MsgGUID: SezDR/IvQzaCn6kT5SGCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173476659"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Aug 2025 04:09:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq8ao-000MxP-14;
	Sun, 24 Aug 2025 11:08:59 +0000
Date: Sun, 24 Aug 2025 19:08:33 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4pro 53/67]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb:
 pinctrl@1001f000 (mediatek,mt7988-pinctrl): 'pcie-2-hog', 'pcie-3-hog' do
 not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202508241916.RJ6W3za7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4pro
head:   f7b0cba42b3047ca85197f08a0d3b46dffe443b4
commit: 807e5a549e3d9b1b38a5410cf02f91d45aeb046c [53/67] dts: r4pro: verified pcie function (all m.2 slots with gpio-hogs)
config: arm64-randconfig-051-20250824 (https://download.01.org/0day-ci/archive/20250824/202508241916.RJ6W3za7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241916.RJ6W3za7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508241916.RJ6W3za7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt8370' was expected
   	'mediatek,mt8390' was expected
   	'mediatek,mt8395' was expected
   	'mediatek,mt8516' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-pro', 'mediatek,mt7988a']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: / (bananapi,bpi-r4-pro): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: / (bananapi,bpi-r4-pro): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): 'pcie-2-hog', 'pcie-3-hog' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: i2c-switch@70 (nxp,pca9545): $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: i2c-switch@70 (nxp,pca9545): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
