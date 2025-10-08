Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D921C167
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Oct 2025 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928805; cv=none; b=iqqA2T2bFHYf+kjVw+TtD1RtOpyU02pBwxOMQTLD3zx6/RwJcpAIa7p/4F5KkpL6dRvLfUkamKjYmsZ9dle3BNriwpdgmpQ+alm9uUB0L7fxIJV99vEx4YFdSjjIgDfPQUSKaqnn3oexKAmLphm21/awTf9Geq+VIL4og/H0874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928805; c=relaxed/simple;
	bh=KrqdSt3XSWwH8CAtkNnkV+60irajv79ZJdeVIIOHISQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QK/+s6iJ0+lBbWTaKob4XyxEfboGMkhi6Agi28noHn9tluccoCqkFYgXp9+Gj93kC+bhwC2x8Jo8rWa5+fw2UqU/K+xc1cnGHlt+qL0FBEpiAqm+Iuryn0obQSuigsZ5AQRKI+RHfC5b3/Z+7ffqaCX84CNYFrEpiUWyM03ie4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyxjxfWR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyxjxfWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759928803; x=1791464803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KrqdSt3XSWwH8CAtkNnkV+60irajv79ZJdeVIIOHISQ=;
  b=MyxjxfWRVyi7Dized19Zq62yPaK2mwR+xaIqoWsLoofotzMDLOkbztov
   26CE5FBpHGpUX9LOzmU9qJ7CS9jV/X1MYDsjoaQo1CbxQnMK7pLfvyICH
   9GttRF/7nxi9ojG/pUesi0sa2nkOD0OPW8t8YmKx4o2MFsP+aJD7iRaVH
   4hVvQKsa/lk675kp1nQETxbzHxGZBrm21xEs7z2fpOrR/x2MCAaDhWKZK
   fjWz+MihNA14VfqWf2dLAg2nvVjnNF/nEeUol2Xhv5Fs/PLgH2UQgM1tx
   TROgsbij3XczsRGLEGyV5t2qFYKONxNgKAeL1YoejL6SJzDGyh6Re3FpP
   A==;
X-CSE-ConnectionGUID: AxC4a2NrQ5uJzg/lRGqd0g==
X-CSE-MsgGUID: 6j7Z2NDySla/eCb/pXervg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="79767364"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; 
   d="scan'208";a="79767364"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 06:06:42 -0700
X-CSE-ConnectionGUID: 9Oi/ucFuQyiQsRpkwwm3wA==
X-CSE-MsgGUID: IDLScre0QUC7jwL6AaINSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; 
   d="scan'208";a="180850030"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 08 Oct 2025 06:06:41 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6TsN-0000000082L-1M1d;
	Wed, 08 Oct 2025 13:06:39 +0000
Date: Wed, 8 Oct 2025 15:06:11 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 163/163]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: xs-phy@11e80000
 (mediatek,mt8189-xsphy): usb-phy@11e80000: 'mediatek,pre-emphasis' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202510081553.j9yEq5yi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b1bbdfe5267de0eca21dad5779eae1e1e8923b0a
commit: 2615729fb49c9e27b8ecb5d9a1176ae6bf2098d4 [163/163] CHROMIUM: arm64: dts: mt8189-skywalker-yoda: Adjust USB2 pre-emphasis
config: arm64-randconfig-2051-20251007 (https://download.01.org/0day-ci/archive/20251008/202510081553.j9yEq5yi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c410e88f0f8c0654d7744d6d029009f9cb736143)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251008/202510081553.j9yEq5yi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510081553.j9yEq5yi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): usb-phy@11e80000: 'mediatek,pre-emphasis' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): usb-phy@11ef0000: 'mediatek,pre-emphasis' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku0.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): usb-phy@11e80000: 'mediatek,pre-emphasis' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): usb-phy@11ef0000: 'mediatek,pre-emphasis' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku4.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
   	'mediatek,mt2712-u3phy' was expected
   	'mediatek,mt8173-u3phy' was expected
   	'mediatek,generic-tphy-v1' was expected
   	'mediatek,generic-tphy-v3' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/t-phy@11e50700: failed to match any schema with compatible: ['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): usb-phy@11e80000: 'mediatek,pre-emphasis' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: xs-phy@11e80000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/xs-phy@11e80000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: xs-phy@11e90000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/xs-phy@11e90000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): usb-phy@11ef0000: 'mediatek,pre-emphasis' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: xs-phy@11ef0000 (mediatek,mt8189-xsphy): compatible:0: 'mediatek,mt8189-xsphy' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: /soc/xs-phy@11ef0000: failed to match any schema with compatible: ['mediatek,mt8189-xsphy', 'mediatek,xsphy']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: efuse@11f10000 (mediatek,mt8189-efuse): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8189-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-yoda-sku16.dtb: efuse@11f10000 (mediatek,mt8189-efuse): Unevaluated properties are not allowed ('compatible' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
