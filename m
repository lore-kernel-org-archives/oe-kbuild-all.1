Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0871A288
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748719423; cv=none; b=WfDNrd1Vaw3rbXhXxz8hA60xx+eUSIMPnNL8PjGJmKTwAjG/JhBVU982Oeb99q2NuVi5dmtGAAbJBQrOR27YaRM6o2t+gXYEh7EsGaGCUiEeNp75ClSl28iG5O9b3CM6SN+Xlr9QlU/FXcmPFD0RVw2Jt/8q8N7IpFRWtD35qeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748719423; c=relaxed/simple;
	bh=tx3WkSsuvvQd+busuo0isWui0cFTI+Jvy9XPZPaYDYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m54GPKYbULz8POwsZ+ENTxavLnfH9KpQZyZxXLkmtbJVuJ38y95zRE/cHLelxAG1aPLvYnUFyw5PWw1EGEo5uCkgRfuNaw2veS6alKtywYRGIMoBv+UwpvaJ1h2vP5r7FI7ksSITPyzKAq2OGz2+CB7nmJp2ZZPXw5Per3K28j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJ6wKMl5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJ6wKMl5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748719421; x=1780255421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tx3WkSsuvvQd+busuo0isWui0cFTI+Jvy9XPZPaYDYc=;
  b=aJ6wKMl5nf4pE4xs+w3Ir6eeeXLI1V2fMG7xmSSAYYL3DyInJqIOX1id
   Z9Gf9+m/ybmI1TXrEi0VF4Tm+UUzZ8TzkvckUhwaFo/s7290h6QoNBsjZ
   ulkOfntq4RKskxKJYUGZL1BJRyvv34n2IVvJ4i7s85XsRGFTMhk1RjAvq
   ZvfKKbz5Ve2U6z66pa05lG74fNcEXUjKmI9Ylz450lxQG7iz7fLbTsLg8
   xcOK2fdbAsXsgE0697kakHOZIrzXcA9HVsLDWVnE7Bkg0Y3hUbvx2pa35
   MScY3Zcu1vTH+uy97YlE9dCAYO/RHqvFPnaA8/xvauxIEMm7pCgYv/TIv
   w==;
X-CSE-ConnectionGUID: 0qyGZVrPRxe2rB1rB8nxyw==
X-CSE-MsgGUID: 39Y9L9rASV2TqTySjn0NIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50479880"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50479880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 12:23:41 -0700
X-CSE-ConnectionGUID: CfMAsCDdTryGtOuTltt2Qg==
X-CSE-MsgGUID: 8ph0poT/Qv6Zxnhczgk20A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="149451494"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 May 2025 12:23:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLRnt-000YbI-1F;
	Sat, 31 May 2025 19:23:37 +0000
Date: Sun, 1 Jun 2025 03:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@b00000
 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@b00000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202506010308.z8bUIiKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-rust
head:   e8191d4b0877b5e3025a126ac1d08756a322d055
commit: 34d17ccb5db804ad38d63cbb997a7f98f1e94ee1 [2/2] arm64: dts: qcom: sa8775p: Add GPI configuration
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250601/202506010308.z8bUIiKS-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010308.z8bUIiKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010308.z8bUIiKS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@800000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@900000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@a00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@b00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800 (qcom,sa8775p-dwc3): interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@800000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@900000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@a00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@b00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800 (qcom,sa8775p-dwc3): interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
