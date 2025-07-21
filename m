Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB2D2E11A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753116271; cv=none; b=TSw+tfHDjSFicY3cW9TVZezLO4I3Xo/Om1GBjQl1k0QmYxwIA+8kymTXyBxi8htPnKj/S9n+TZ3WlfRicK4MPwqAGtIYT1uKNntSEGt3H0jAewQga4UBWEQWigtZUJnodFlyJJ8BsY29yfpIdfAnE1IwFR1gnt8oGOGctadaUus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753116271; c=relaxed/simple;
	bh=LWnxg5jDsGBL9sNaKJVbMiTD8Tg5EMZn7mRHvDlrVDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XD30JljPlBqbg54dGIvIKDEcmrNNXfBFc9AiBYzcKgAmdggfhpZlv5yw31ku0NKNrMr1aJ3O8nJnYHYnjSa67AqJZW8ZUYjaGRCgW2huSEXn+05z5V3iLug6cXA74p5EW+EvCMPuOFauxVFVtDUH2Xg0HLdw9X4tTgYJXAie6dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQYxoPNG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQYxoPNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753116269; x=1784652269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LWnxg5jDsGBL9sNaKJVbMiTD8Tg5EMZn7mRHvDlrVDE=;
  b=gQYxoPNGkAlUJf8kbci25HBsS6fkvkBonxMjc7QrhyuGHZltUZQmuYhu
   IQFfjPQv2OZ+MX58pmv4+UDiTsLP2CqYVZFWXs8u6KnyR35k+LKDt5zLY
   Cn1sNG6AbSqX2Yca5YixktXQiizyEp/pR76UVyVCT5PbLHfp9AjMXC39N
   AqhXpo3vqM1xov9gAUzLu+HWZzUwOK9AijZR3UCtMZOFDlTSXMvGWS7j0
   aoPJTs20RdEoGpeXlO8ECYamI42y/3cA8VnA2xauSbfSoLHa9DV+GaD2W
   ScVVTj+3Z+qDFwanNkfHrAJuZl1gdzQqrwYP30/yrh95lB7/pSOVP4OCA
   A==;
X-CSE-ConnectionGUID: 7OoTjIsJTguqLMExxyuo1g==
X-CSE-MsgGUID: m5OiZxwtTvuZzuTkylJqfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59156158"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="59156158"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 09:44:29 -0700
X-CSE-ConnectionGUID: CNdlClQxR1SqJa3ackrwhQ==
X-CSE-MsgGUID: 6Pd8TBJMQf6EqhAJD2Ugug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="162933930"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2025 09:44:28 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udtcn-0001Pt-1b;
	Mon, 21 Jul 2025 16:44:25 +0000
Date: Mon, 21 Jul 2025 18:43:38 +0200
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 5696/11398]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb:
 pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a
 required property
Message-ID: <202507211810.cSwGCfMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   97987520025658f30bb787a99ffbd9bbff9ffc9d
commit: 3d6c2bc7629c8b1bfd75416767122096bb75ba7b [5696/11398] arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H and RZ/V2N EVKs
config: arm64-randconfig-2051-20250717 (https://download.01.org/0day-ci/archive/20250721/202507211810.cSwGCfMv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211810.cSwGCfMv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507211810.cSwGCfMv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: serial@11c01400 (renesas,scif-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too long
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too short
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a07g044']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a09g047']
   	'renesas,scif' was expected
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb-phy@15800200 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,usb2-phy-r9a09g056', 'renesas,usb2-phy-r9a09g057'] is too long
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r8a77470', 'renesas,usb2-phy-r9a08g045', 'renesas,usb2-phy-r9a09g057']
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r7s9210', 'renesas,usb2-phy-r8a774a1', 'renesas,usb2-phy-r8a774b1', 'renesas,usb2-phy-r8a774c0', 'renesas,usb2-phy-r8a774e1', 'renesas,usb2-phy-r8a7795', 'renesas,usb2-phy-r8a7796', 'renesas,usb2-phy-r8a77961', 'renesas,usb2-phy-r8a77965', 'renesas,usb2-phy-r8a77990', 'renesas,usb2-phy-r8a77995']
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r9a07g043', 'renesas,usb2-phy-r9a07g044', 'renesas,usb2-phy-r9a07g054']
   	'renesas,rcar-gen3-usb2-phy' was expected
   	'renesas,rzg2l-usb2-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,usb2-phy.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r7s9210']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r9a07g043', 'renesas,usbhs-r9a07g044', 'renesas,usbhs-r9a07g054', 'renesas,usbhs-r9a08g045', 'renesas,usbhs-r9a09g057']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible:0: 'renesas,r9a09g057-usb2phy-reset' was expected
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible: ['renesas,r9a09g056-usb2phy-reset', 'renesas,r9a09g057-usb2phy-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: serial@11c01400 (renesas,scif-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too long
   	['renesas,scif-r9a09g056', 'renesas,scif-r9a09g057'] is too short
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s72100']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r7s9210']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7778', 'renesas,scif-r8a7779']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a7742', 'renesas,scif-r8a7743', 'renesas,scif-r8a7744', 'renesas,scif-r8a7745', 'renesas,scif-r8a77470', 'renesas,scif-r8a7790', 'renesas,scif-r8a7791', 'renesas,scif-r8a7792', 'renesas,scif-r8a7793', 'renesas,scif-r8a7794']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a774a1', 'renesas,scif-r8a774a3', 'renesas,scif-r8a774b1', 'renesas,scif-r8a774c0', 'renesas,scif-r8a774e1', 'renesas,scif-r8a7795', 'renesas,scif-r8a7796', 'renesas,scif-r8a77961', 'renesas,scif-r8a77965', 'renesas,scif-r8a77970', 'renesas,scif-r8a77980', 'renesas,scif-r8a77990', 'renesas,scif-r8a77995']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r8a779a0', 'renesas,scif-r8a779f0', 'renesas,scif-r8a779g0', 'renesas,scif-r8a779h0']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a07g044']
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a07g043', 'renesas,scif-r9a07g054', 'renesas,scif-r9a08g045']
   	'renesas,scif-r9a09g057' was expected
   	'renesas,scif-r9a09g056' is not one of ['renesas,scif-r9a09g047']
   	'renesas,scif' was expected
   	'renesas,rcar-gen1-scif' was expected
   	'renesas,rcar-gen2-scif' was expected
   	'renesas,rcar-gen3-scif' was expected
   	'renesas,rcar-gen4-scif' was expected
   	'renesas,scif-r9a07g044' was expected
   	from schema $id: http://devicetree.org/schemas/serial/renesas,scif.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb-phy@15800200 (renesas,usb2-phy-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,usb2-phy-r9a09g056', 'renesas,usb2-phy-r9a09g057'] is too long
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r8a77470', 'renesas,usb2-phy-r9a08g045', 'renesas,usb2-phy-r9a09g057']
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r7s9210', 'renesas,usb2-phy-r8a774a1', 'renesas,usb2-phy-r8a774b1', 'renesas,usb2-phy-r8a774c0', 'renesas,usb2-phy-r8a774e1', 'renesas,usb2-phy-r8a7795', 'renesas,usb2-phy-r8a7796', 'renesas,usb2-phy-r8a77961', 'renesas,usb2-phy-r8a77965', 'renesas,usb2-phy-r8a77990', 'renesas,usb2-phy-r8a77995']
   	'renesas,usb2-phy-r9a09g056' is not one of ['renesas,usb2-phy-r9a07g043', 'renesas,usb2-phy-r9a07g044', 'renesas,usb2-phy-r9a07g054']
   	'renesas,rcar-gen3-usb2-phy' was expected
   	'renesas,rzg2l-usb2-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,usb2-phy.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb@15820000 (renesas,usbhs-r9a09g056): compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,usbhs-r7s72100' was expected
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r7s9210']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r9a07g043', 'renesas,usbhs-r9a07g044', 'renesas,usbhs-r9a07g054', 'renesas,usbhs-r9a08g045', 'renesas,usbhs-r9a09g057']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r8a7742', 'renesas,usbhs-r8a7743', 'renesas,usbhs-r8a7744', 'renesas,usbhs-r8a7745', 'renesas,usbhs-r8a77470', 'renesas,usbhs-r8a7790', 'renesas,usbhs-r8a7791', 'renesas,usbhs-r8a7792', 'renesas,usbhs-r8a7793', 'renesas,usbhs-r8a7794']
   	'renesas,usbhs-r9a09g056' is not one of ['renesas,usbhs-r8a774a1', 'renesas,usbhs-r8a774b1', 'renesas,usbhs-r8a774c0', 'renesas,usbhs-r8a774e1', 'renesas,usbhs-r8a7795', 'renesas,usbhs-r8a7796', 'renesas,usbhs-r8a77961', 'renesas,usbhs-r8a77965', 'renesas,usbhs-r8a77990', 'renesas,usbhs-r8a77995']
   	'renesas,rza1-usbhs' was expected
   	'renesas,rza2-usbhs' was expected
   	'renesas,rcar-gen2-usbhs' was expected
   	'renesas,rcar-gen3-usbhs' was expected
   	from schema $id: http://devicetree.org/schemas/usb/renesas,usbhs.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible:0: 'renesas,r9a09g057-usb2phy-reset' was expected
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb20phy-reset@15830000 (renesas,r9a09g056-usb2phy-reset): compatible: ['renesas,r9a09g056-usb2phy-reset', 'renesas,r9a09g057-usb2phy-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/renesas,rzv2h-usb2phy-reset.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
