Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563746;
	b=jRAb1xlAcvzN/KLQIH/kU0G6Uqy8loKQoK/frxBcJRFm6oPESKMKCbHa2FM/TlXySKxJ
	 qqZg/GtHtXd/KCnma3bycaFp9wxvYVN+T1iKzaqks65juV8CY3LgbgdHs4FdRuj6YzRaU
	 G6pPT0749JYUwMG9oC4dM/HC3UBI/wV2T7kVia5UK7m6P6IgbfFrWHu3hI2UacrH6Kr9v
	 yX/uJhtyYVgfPYY3sFawsURsmRDJwN3r/lnhNxBGF+IG1Y5NWJZ/zJaw29AFXnkB6J3x0
	 wOHfe6z1MH5GJJYiUADu/lTZbapHT3Qc04ox0iyuSzrCohJt4DygKKfupDetUnRwayA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563746;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pVvyguOifjWPYgqI5iobljzLgrqb/eofVwUDSvvW1Mw=;
	b=FmoFRX22aRi7+tOSuLYX0L07U/oDc8grMwJq9gzGoNhL2k1MgtlOmO2qxnLYrFvoB4Qr
	 CyGmV69h5YuHd2M8oqITclVtlUYlxch/f0awOpejNPqNNYyLnPpD9bnDngQAgxilBRwtV
	 CRUIvfmB5cbRNpknXBdb17soRBq2v/MBtf4DbWa6d04xkEvc1ZPOaY5iKMvcuGWAVxkOb
	 /xYvQdnBy+JXrWH8N4IPAlmbdaQ5GabPR2leq5v90EYpxSAbYg58Rd/UP4iA1wolx3Cbc
	 h8P+thdIbyFRUGmoNKExHrPJx3Ew8jtz1w3PoKDspAmuS6odS7cCG1owOOc3hwGJNUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LPl2W+wp;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F5E606A33B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 09:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F5E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LPl2W+wp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794563746; x=1826099746;
  h=date:from:to:cc:subject:message-id;
  bh=f5XRhiRPO0oUGtOnQhc8dc9nXZQV+t7dnZdjipefTJ0=;
  b=LPl2W+wpNGrp707Dn3g4Rp/0M9YX2j9BkIL4XcElF13eXTd1oNZQFDH5
   hOuuc6NgKto7zhysahe+5gjN+HwuWOZdo6cg+J9UTd+vhHw+c46BaznnJ
   7Ova1C4Tcvuaex6cVb6tSfTzyJ9dBLePjDpGA+hckHUDJQ6mMgzf4z6yB
   G27rW//MmeMveHmE3RApmdN1SRlQe2qfbDi6bPrhNzqWZvkszaX6nt34d
   wY5JBvcIe0qJ0DFnHBLpWN2G+dUsgJFIMIMYiTBGdTbNfV/G+T1J4S9na
   SV7cqnQpDF38jCJrtceku+OpfNR6a7R041OLGS2jEPgFkVTzvU5UbYQFK
   A==;
X-CSE-ConnectionGUID: wd8CSV0ZS+2d2fcboFz5VA==
X-CSE-MsgGUID: dcAgIggSS8OKStJeX0S60Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3283400"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3283400"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 01:55:44 -0800
X-CSE-ConnectionGUID: LD8KKwmbS/mYkN4DOeHfEQ==
X-CSE-MsgGUID: 9Htuvlj2Q42TtbOX7XCvmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8963988"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 13 Nov 2026 01:55:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRo0S-000000001CZ-3Bc3;
	Fri, 13 Nov 2026 09:55:40 +0000
Date: Fri, 13 Nov 2026 10:55:17 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 54/154]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10080000
 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611131007.zvQDR4TW-lkp@intel.com>
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
commit: c1a0368094ca73231f1a761d2314d399c788b840 [54/154] arm64: dts: add usxgmii pcs and link both pcs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261113/202611131007.zvQDR4TW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131007.zvQDR4TW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131007.zvQDR4TW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
