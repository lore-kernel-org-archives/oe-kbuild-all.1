Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E11EB5F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766539129; cv=none; b=LjM+W6q7dHSzU4+TnMyOaSkAWwz/AxGWG2SliXJ3/v8XbpdWDg9F264p7cwsNmMs4CTRGGTp1ATqN9h1elLzIJkQ7OpyrAWEGvaE8uYxSjzDuNhrW1ytrHCn/HcWAvIyHYOwWGysnDGQBMGDi0POm5CVFd+AH+cpr27thuJ76rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766539129; c=relaxed/simple;
	bh=vATq63UQmPo6XuYcsjBbXcr7yKJQKCoj2UU0UrhCzTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxpVgpufBREVjJ+SzSaKWpUL8leLiCZRta9HypqgbZIzvQTFwrs07wgAqsJlVV1jD0B3KcSwCzvoh80yoaU8mgfh92aOYbSG9bLtomuoSmp0tdyB1v1V3o1EGxMPMHWoYfQPsgr9LXwohKDBEL9byW2AqUJ94eLZaZO+ntgbX30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSpjd73j; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSpjd73j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766539128; x=1798075128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vATq63UQmPo6XuYcsjBbXcr7yKJQKCoj2UU0UrhCzTQ=;
  b=GSpjd73jndDvJh8WfmEhefJmSpgtKc/EQbQQOSjUnPRgoSH+3JqijXaR
   jPj+Xq4MjjBCskJhDZy8VbgAZp0G13/rrJ3e2XtrEgcK+sVu0zN8a94sa
   Ye5BdPcoQy3uR6220dzDV73JROYeruUp1RJoFzftQ6y+j5noa7Z1wCpMr
   o+SaZ4t+ihrE+6RsrzKBlyy6remYdZrOfTmH20AocJ64Kyhcp6+lc3uQ9
   6zsu7c4D4znIno12zNW98aj2I39GZxbdd2RZ04l3xp60qCRlhNWd4XPf+
   OQ/d7BKc4+84VOIm1hZwlvEooOSTxlJ4ReUHcYmKFyiORw9szHN3icjEO
   g==;
X-CSE-ConnectionGUID: n43kGnCXReCQ362LtrXMmg==
X-CSE-MsgGUID: 8x6mPBQmRVCg+E7Dd5sLFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72237325"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="72237325"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 17:18:47 -0800
X-CSE-ConnectionGUID: g5z4RW/tTVyc4+FuzH82bQ==
X-CSE-MsgGUID: CmrqwK1TSVmx7S5unjn3Xw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 23 Dec 2025 17:18:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYDWV-0000000062y-3YmJ;
	Wed, 24 Dec 2025 01:18:43 +0000
Date: Wed, 24 Dec 2025 02:18:01 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-jumbo 57/113]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10080000
 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202512240232.jeeRG7zd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-jumbo
head:   66904bf768dae3a22817ce7c9d40db68314a4ced
commit: 44d8c66460df75f63fd25146d8b6b69a46c8a41e [57/113] dt-bindings: net: pcs: add bindings for MediaTek USXGMII PCS
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/archive/20251224/202512240232.jeeRG7zd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240232.jeeRG7zd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240232.jeeRG7zd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
