Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31C93081A2
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Apr 2026 20:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775508269; cv=none; b=LvPKQ4Om4QmYU1HrXXSgxIZEFwQb+ksN7UeXoGd6u93HMp8R21AQMWSrUKTjyY534+cQdVWdLBP25eeodWs9V1bhlQTCfweppS3DMaSt+jzJjkYnh+XkZlRJI8a2th3q2V3A4gH7xLUT5ROCtR+PqrhHOm4hNhEgOz4y/PUgmS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775508269; c=relaxed/simple;
	bh=1IKRYQJLZUlBaHYfO/dCxAlLNVp7AzgKJa+TbMpndxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fWutjyINtboXFCvSyYkn7Kib3GmB51/HB4bw+5DMSRTVmdxahwOZNoyIcjki76UTc1H+tqAc9F/EruX2+YhACvCa9OH95U6eKUxH7rBlM63MPUCJZVaoD13v5uxs5/GlzvzsJEM1iJ1g6DokiAN1X0LgKC7QJXT7Cysghd/ueJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwQPGkgJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwQPGkgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775508268; x=1807044268;
  h=date:from:to:cc:subject:message-id;
  bh=1IKRYQJLZUlBaHYfO/dCxAlLNVp7AzgKJa+TbMpndxE=;
  b=NwQPGkgJo1R64Qng8eIEdBd8l0c4GB0JC5JXMenhPKkBZYEFhWJoqQ/g
   ZhnVguXllSfkKF1W4E7ambE//JiC3xS2g4x7uCOOy1mavClwGZYmDSYmy
   iO53gh+5vmwKa/8zEctXi+Vi9EP0Z31Hf1hre0/fdeBx8UGfX0RkdUYP1
   LkQAwQLiGs2dLmUFR+Sa2KaNboWV11Bez3iDp5NK2+0tBHz784FHfBnD5
   liCvdClZr28mn+HlyK05hdnRtCl62iV+YVR3sgan/xJIrxL2LRYg1P8kT
   zWQcJ6zO3yBCo3v4gXk+yTmOZVwxypQn3DLaX/XC9LBZ+lxv96e8mumJ0
   w==;
X-CSE-ConnectionGUID: 6D5LENltTB6tlfhAvzrXHg==
X-CSE-MsgGUID: 8ov1GSbZSRmCDHApJ4HZXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87849350"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87849350"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 13:44:28 -0700
X-CSE-ConnectionGUID: myY3f9NZSwC5aoI2QXlztA==
X-CSE-MsgGUID: qtfw9YOrSCWTtwJ0yqrJBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="223665603"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 06 Apr 2026 13:44:26 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9qo4-00000000A7N-1AJm;
	Mon, 06 Apr 2026 20:44:24 +0000
Date: Mon, 06 Apr 2026 22:44:03 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 62/101]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb:
 pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202604062240.8Z56WfFg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   ab92b9462fdd3ef70e7c44ab428e9546ab60bc03
commit: fe83952d19ebe0956028f58d4f44fc83a571fd8a [62/101] arm64: dts: mediatek: apply bpi-r4 nopcie2 overlay
config: arm64-randconfig-2052-20260403 (https://download.01.org/0day-ci/archive/20260406/202604062240.8Z56WfFg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604062240.8Z56WfFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604062240.8Z56WfFg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
