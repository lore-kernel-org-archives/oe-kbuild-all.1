Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75525F794
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 23:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969555; cv=none; b=j8gisuNDuGrOUmzofoq/Xk7qJW7x2yzvkbFpGt2b9y007SvFkRymlmng7ltQF9AKvElOlYbWHE0RbsajeOQDcF2+o09VMk0+ZL0vTRYqELj3vvigt+Nc9BBTqIeCSB44NtlEoAtsgolZEz9LD9fjubPeBNFBPEvkjaZrpHGPEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969555; c=relaxed/simple;
	bh=ojDKSsjlsY0y8446jZP0g3cH2J0fJ8e3F8U3BSuBKyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqBv2EodOXioeRKa8IiHUFk+I2EFnVsHp4nHd/z87R1WtqxgT+8h2DW7U0w61z1M/MpksPvrwSq1o8cGqOm0x9b0BC0ts472+1QZHGihLcxA/bFOrEhJfsK0C2KEZdb8ZdvQdreVRe4YR9hdnrtRQXaauOPUUQWA8a/+rtTREDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAV1j2bE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAV1j2bE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745969552; x=1777505552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojDKSsjlsY0y8446jZP0g3cH2J0fJ8e3F8U3BSuBKyU=;
  b=JAV1j2bErpRvImM+2tcpft9r6Jk5D5k62OpkHvJ3b5OHqaIh4wKL/caj
   MeUd4FSY+Nz9IbLy+8dYZVGQPJFAG9p1LQfsMA2qrsnrb8bhGSyIxJF2y
   8cwXMIiUxyPfJL1o8qHR5p44U6wN67c1HmslgimZ4GTiauTOExFnhWx0B
   PDopQtD0JxkSmSmnMTdT7wK9etcaHcz5xfA+m1AwE55PK3ptnttqGfYNt
   PJawje32ti1EyiCO6mnTCE+fckImXJ9kH+qY4TEsiscb1CwJUf4/wyTlJ
   Jg6Ox4RebPpwbZeuk325Qo0cFi0HM2t5Ur4nmePhMiCZVf/r9i8cFKfLi
   Q==;
X-CSE-ConnectionGUID: u1WNg/zGRf+MdXHH9D4wDQ==
X-CSE-MsgGUID: +fWs81c/SjCG5BsHNF1VIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51276618"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51276618"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 16:32:29 -0700
X-CSE-ConnectionGUID: w9mbvhU/Tyuo5uoDkxIxWw==
X-CSE-MsgGUID: ZSaSdh5rTpGYfv9AwDc6uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133671296"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2025 16:32:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9uR7-00031R-2T;
	Tue, 29 Apr 2025 23:32:25 +0000
Date: Wed, 30 Apr 2025 07:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6614/6719]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: edp@fded0000
 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
Message-ID: <202504300742.TYjMQRj1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: f41cc1f4b7160fad7409012bdaa8f4d3d1fa72fb [6614/6719] Merge branch 'for-linux-next' of https://gitlab.freedesktop.org/drm/misc/kernel.git
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300742.TYjMQRj1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300742.TYjMQRj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300742.TYjMQRj1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1393.7-1401.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1110.7-1117.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1125.7-1132.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1110.7-1117.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1125.7-1132.4: Warning (graph_child_address): /usb@fc400000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: phy@fed90000 (rockchip,rk3588-usbdp-phy): 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: phy@fed90000 (rockchip,rk3588-usbdp-phy): 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-usbdp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1186.7-1194.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names:2: 'grf' was expected
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
