Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3921B3B0AE1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 13:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780147673; cv=none; b=rgTptgqj6xUCJuBWd4/kKkn74a/o1AGrc4I5Z5HdnjNich82NUwPNBbidT+2wCT6XlQtzVAXZgk8G9Nsl/gck6ZkOxgwWGm+038rYn4JXu26WB9wcw4b62vJlgycYs5dBEuXJ54ND2BCDdf0ku7v6E+9RZb7D1agistpmZAeKgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780147673; c=relaxed/simple;
	bh=g3byNTeYhFlfkdOB/wZbtTRgoIhG0Nn8oOPQA/KHEkc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uwK9XqPPk2WjmvUWSitouUER8Iqhn6x85jIrtesfYcEEYmTu+K4bDyHHHM8sScGb1MVY06cDin8eX9HSx2lLZ+Tcgor0s7SyXUS9T+a4cTxt1mEr8s0sf+zrxDztvJ91kvG07hBqt5Now+iq+h7CB7PyCq0xPakBUzNxlcK9eXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bha4Gch+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bha4Gch+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780147671; x=1811683671;
  h=date:from:to:cc:subject:message-id;
  bh=g3byNTeYhFlfkdOB/wZbtTRgoIhG0Nn8oOPQA/KHEkc=;
  b=bha4Gch+0OR5Gedyu7AWz3BcUaeolF4QrQuB2g5ZqlaFuZhR8/7I0jgv
   CvvjIZK63JWEZKdwRVNz0gHSKZSG97CxHsEDPDsYuoX5zcoX91NpTPhk1
   zyDC/Nwigjgohd5ANpPQDNnsBqvL6gbpL6fKcDHK4jJh6mLH4tBtHN2Ox
   H98a7BJM0BZqaqT0u8J/BAFLQbRtIOddIMXHpndmtH9Ds/4F9Uph6eq4n
   TSJDgkEkcPucRKpcHO+hYHXuF6yJWOW667zma31DESm4JeE/W3TqaY1x+
   QQM22XMsZLghnPxlLs9kHGI4gFk1kF0OOUdM6xGCLWNgv60NFQLO4Zd9a
   w==;
X-CSE-ConnectionGUID: QAPDKeH4RUqaFccOnnNIMw==
X-CSE-MsgGUID: 3CevrzQ1QyalGMdtO/5lqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81162686"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="81162686"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 06:27:50 -0700
X-CSE-ConnectionGUID: Zvd867HkS2i6e3ZYFJ837w==
X-CSE-MsgGUID: M/O8QkQYSz2QAEKTzqgNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="266968527"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 May 2026 06:27:48 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTJj8-0000000018H-3woA;
	Sat, 30 May 2026 13:27:46 +0000
Date: Sat, 30 May 2026 15:27:31 +0200
From: kernel test robot <lkp@intel.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [linux-next:master 8563/9870]
 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000
 (renesas,r9a09g077-pinctrl):
 sd0-emmc-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of
 [2500, 5000, 9000, 11800]
Message-ID: <202605301539.lnoPbSt7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 5ce87d70b995ab23ba20fe4590d913d46f730b82 [8563/9870] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
config: arm64-randconfig-2055-20260529 (https://download.01.org/0day-ci/archive/20260530/202605301539.lnoPbSt7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301539.lnoPbSt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301539.lnoPbSt7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:cmd-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:rst-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-uhs-group:clk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-uhs-group:cmd-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-uhs-group:rst-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-uhs-group:clk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-uhs-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-uhs-group:clk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-uhs-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): compatible:0: 'renesas,r9a09g077-mtu3' is not one of ['renesas,r9a07g043-mtu3', 'renesas,r9a07g044-mtu3', 'renesas,r9a07g054-mtu3']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: timer@90001200 (renesas,r9a09g077-mtu3): interrupts: [[0, 420, 1], [0, 421, 1], [0, 422, 1], [0, 423, 1], [0, 424, 1], [0, 425, 1], [0, 426, 1], [0, 427, 1], [0, 428, 1], [0, 429, 1], [0, 430, 1], [0, 431, 1], [0, 432, 1], [0, 433, 1], [0, 434, 1], [0, 435, 1], [0, 436, 1], [0, 437, 1], [0, 438, 1], [0, 439, 1], [0, 440, 1], [0, 441, 1], [0, 442, 1], [0, 443, 1], [0, 444, 1], [0, 445, 1], [0, 446, 1], [0, 447, 1], [0, 448, 1], [0, 449, 1], [0, 450, 1], [0, 451, 1], [0, 452, 1], [0, 453, 1], [0, 454, 1], [0, 455, 1], [0, 456, 1], [0, 457, 1], [0, 458, 1], [0, 459, 1], [0, 460, 1], [0, 461, 1], [0, 462, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:cmd-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:rst-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-uhs-group:clk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-uhs-group:cmd-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-uhs-group:rst-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-uhs-group:clk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-uhs-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-uhs-group:data-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-uhs-group:clk-pins:drive-strength-microamp: [11800] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-uhs-group:ctrl-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: timer@90001200 (renesas,r9a09g087-mtu3): compatible:0: 'renesas,r9a09g087-mtu3' is not one of ['renesas,r9a07g043-mtu3', 'renesas,r9a07g044-mtu3', 'renesas,r9a07g054-mtu3']
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: timer@90001200 (renesas,r9a09g087-mtu3): interrupt-names: ['tgia0', 'tgib0', 'tgic0', 'tgid0', 'tciv0', 'tgie0', 'tgif0', 'tgia1', 'tgib1', 'tciv1', 'tciu1', 'tgia2', 'tgib2', 'tciv2', 'tciu2', 'tgia3', 'tgib3', 'tgic3', 'tgid3', 'tciv3', 'tgia4', 'tgib4', 'tgic4', 'tgid4', 'tciv4', 'tgiu5', 'tgiv5', 'tgiw5', 'tgia6', 'tgib6', 'tgic6', 'tgid6', 'tciv6', 'tgia7', 'tgib7', 'tgic7', 'tgid7', 'tciv7', 'tgia8', 'tgib8', 'tgic8', 'tgid8', 'tciv8'] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml
   arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: timer@90001200 (renesas,r9a09g087-mtu3): interrupts: [[0, 420, 1], [0, 421, 1], [0, 422, 1], [0, 423, 1], [0, 424, 1], [0, 425, 1], [0, 426, 1], [0, 427, 1], [0, 428, 1], [0, 429, 1], [0, 430, 1], [0, 431, 1], [0, 432, 1], [0, 433, 1], [0, 434, 1], [0, 435, 1], [0, 436, 1], [0, 437, 1], [0, 438, 1], [0, 439, 1], [0, 440, 1], [0, 441, 1], [0, 442, 1], [0, 443, 1], [0, 444, 1], [0, 445, 1], [0, 446, 1], [0, 447, 1], [0, 448, 1], [0, 449, 1], [0, 450, 1], [0, 451, 1], [0, 452, 1], [0, 453, 1], [0, 454, 1], [0, 455, 1], [0, 456, 1], [0, 457, 1], [0, 458, 1], [0, 459, 1], [0, 460, 1], [0, 461, 1], [0, 462, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/timer/renesas,rz-mtu3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
