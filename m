Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF6216631C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 04:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729225569; cv=none; b=bZ2W5WdbLjC3RylH+pS1H0RaIuo93v/o+76ScOpKuEU+FQWLrSaq9bzg1RvDw3HE+TAY7RwaSvije+uRuRZK7F8Ij4sruEr6sbB6Um5KcVkHIUnzKGpO3dVkN6DKno+zvfTtt/ZWws0aQD0ee8+/5hSBkRDZcsAZFn8fkMH/Rjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729225569; c=relaxed/simple;
	bh=JkSawUSAWH2IxbDH7ldl9eO2QTktaeaVqc/aUsXEYm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UXNwWumUiv6RviNm/07GzD1x/BlFh5s3zNbhjE4LtI6DYsDwE1PWuUb88LNmlmsR22c8MjzTe42jIdP4UDdTcfXvrg/P/En/QcrFhSWoPpdzGxLlHi5OxMioOCwAVRGaXsjhhMysOiHMB9DsvWkg/Fw7OC9iCAQ+r6lMp2k7PVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzITKy1S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzITKy1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729225567; x=1760761567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkSawUSAWH2IxbDH7ldl9eO2QTktaeaVqc/aUsXEYm8=;
  b=fzITKy1Su/6OHrAhWRICWrr5V+Wl6Y0nklLTLo5iDYSfBx+r0r865eGr
   jwO00HEyYUR5uHrLawyRSJ+nl1CM3kb97WbKhLw2P408RRzERK5Bk4J6q
   itqndGcsa7BHJE/bnlodVmEukfq9QXCLwqnWyt9xeDxCf+N2pUR/nbmhu
   PoMfWzh96YaBuAQI14p6mchj7Jk4bNFMFZ/1rr6lpzkL7A26J8pjUZsnG
   bZEJjRliD+7qpWLcTJpVkpcw1nNXYrB0mPpauV+a2slzsqso9PIQXy/i7
   F0IuAS0rRpQuJd6q8+2d7lGuGBx39z1KueRF/SIQhV846gU6zugMPiri6
   A==;
X-CSE-ConnectionGUID: J4G2zDHdRu+9I9ZaV66dNg==
X-CSE-MsgGUID: sUqWEA+1QKOK88IsEXWv4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="46240432"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="46240432"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 21:26:06 -0700
X-CSE-ConnectionGUID: eKZJ/0nBQ76S9B75M5l5eg==
X-CSE-MsgGUID: Saw5ZdIzQV+qTM8+SfyGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="78901937"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2024 21:26:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1eYs-000NG9-0N;
	Fri, 18 Oct 2024 04:26:02 +0000
Date: Fri, 18 Oct 2024 12:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 3996/5321]
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb:
 system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0,
 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0,
 2097152], [0, 629145600, 0, 2097152], [0, 631242752, ...
Message-ID: <202410181235.L7MF7z48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: 80fe25fcc605209b707583e3337e3cd40b7ed0bf [3996/5321] arm64: dts: qcom: x1e80100: Add Broadcast_AND region in LLCC block
config: arm64-randconfig-051-20241017 (https://download.01.org/0day-ci/archive/20241018/202410181235.L7MF7z48-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181235.L7MF7z48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181235.L7MF7z48-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c06000: clocks: [[52, 107], [52, 109], [139, 1], [52, 111], [52, 113], [52, 115]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c06000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [139, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1c06000: clocks: [[52, 107], [52, 109], [138, 1], [52, 111], [52, 113], [52, 115]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1c06000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [138, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1c06000: clocks: [[52, 107], [52, 109], [139, 1], [52, 111], [52, 113], [52, 115]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1c06000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [139, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [139, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1c06000: clocks: [[52, 107], [52, 109], [137, 1], [52, 111], [52, 113], [52, 115]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1c06000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [137, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1c06000: clocks: [[52, 107], [52, 109], [137, 1], [52, 111], [52, 113], [52, 115]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1c06000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [137, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1c06000: clocks: [[52, 107], [52, 109], [135, 1], [52, 111], [52, 113], [52, 115]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1c06000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1c0e000: clocks: [[52, 96], [52, 98], [135, 0], [52, 100], [52, 102], [52, 104]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: phy@1c0e000: clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152], [0, 631242752, 0, 2097152], [0, 633339904, 0, 2097152], [0, 635437056, 0, 2097152], [0, 637534208, 0, 2097152], [0, 639631360, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc4_base', 'llcc5_base', 'llcc6_base', 'llcc7_base', 'llcc_broadcast_base', 'llcc_broadcast_and_base'] is too long
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
