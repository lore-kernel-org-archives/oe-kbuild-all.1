Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BAC21B199
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757448033; cv=none; b=ePd2Zd/5j7Xgzd9vNgs8Kne7lsxIJxU3Fkn9kJ75OBIn8t/FwKCjlNdLljMo7oPanpIGTB8cA5oE04R726P3LlJkZBI+mUAk0JCFosrG6S5ZkOJceKiFrRsEhnh45Pmv4jdCZyRHh07ukWTSD1fq4VhG0eJ+E+p7BClt7CYiFz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757448033; c=relaxed/simple;
	bh=uk+EewNrCEpnhmpy/ckV8VMdvx0u+lV769jPCjeZlfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lSe0y/UuiOz+2jJKL+JATR0z2iqyIK/+/GhdLcP3gSUnNwlPRMtoHo7C73VgHH4lMH28FUyPXEJMplNgZLqkbOMQaJhvFKMYjfc1nUMTMoY7PGtmB2kDn1hnRZIZrwC8+1P3QDKfQET2MnX0PnnRTjoSYPXUJQJdF7VsvzR47Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sk7+DW8k; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sk7+DW8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757448031; x=1788984031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uk+EewNrCEpnhmpy/ckV8VMdvx0u+lV769jPCjeZlfw=;
  b=Sk7+DW8kBSff2z2KYbIZ0D3/+EpNs9wCfEFTmE30vf9zQhu+h+6UlUKH
   wgwUFTSKr6+Ns7BbO1z7krywUqdyBtEeOUuyYCAfTsQlmO+/LLxhYdn+R
   YLbUJMAW+lwEQdnC0DxazRtlVOTGk4JnWP5/eQLp7f/4yR6g48KTdHOOE
   ZZaEMbDCRFO1M3cppXHKcJe0fNcmk2U5SlwGE8uEJRxPqJPuj1dr+9CHU
   uu5uAhIFsWDrdqfjfvSkMSvdNsDe31Mg80MpirtRBrTEmIDAxGFui0dxm
   Spo4AqR/5aLVy+LrqDr1ZBnahVu2xREUDzmC/uQEtyvln1mXyFaDZS7+u
   w==;
X-CSE-ConnectionGUID: kk5RD8wQR+SLfS1vv8I7Ng==
X-CSE-MsgGUID: KXLL8BpfQva8D6tlZjiehg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="58787035"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="58787035"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 13:00:30 -0700
X-CSE-ConnectionGUID: gV1ZHavXQ6CaDQs+MPkdgg==
X-CSE-MsgGUID: F17hmhPURxyWbUctPf9YJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="172771876"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2025 13:00:30 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uw4Vv-0005EB-2W;
	Tue, 09 Sep 2025 20:00:27 +0000
Date: Wed, 10 Sep 2025 03:59:54 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-rc 66/69]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb:
 pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509100336.dp1j1hYK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-rc
head:   56755da995381418d4d35b4153f95b5aa4fb11ca
commit: d9a2be26bddbd1b41dccdcc64fafd505d193bddd [66/69] arm64: dts: split r4pro into 4e and 8x variant
config: arm64-randconfig-051-20250909 (https://download.01.org/0day-ci/archive/20250910/202509100336.dp1j1hYK-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100336.dp1j1hYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100336.dp1j1hYK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,tomato-rev3' was expected
   	'google,dojo-sku5' was expected
   	'mediatek,mt8195' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8370' was expected
   	'mediatek,mt8390' was expected
   	'mediatek,mt8395' was expected
   	'mediatek,mt8516' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-pro-8e', 'mediatek,mt7988a']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
--
   	'google,tomato-rev3' was expected
   	'google,dojo-sku5' was expected
   	'mediatek,mt8195' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8370' was expected
   	'mediatek,mt8390' was expected
   	'mediatek,mt8395' was expected
   	'mediatek,mt8516' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /: failed to match any schema with compatible: ['bananapi,bpi-r4-pro-8x', 'mediatek,mt7988a']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
