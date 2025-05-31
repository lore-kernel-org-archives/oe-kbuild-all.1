Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B49D288CC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748702841; cv=none; b=eLh84NnY/ez6PPjWxRzta69g9x5PelE+0FhXQyUOIOsjIEIk4+l5gmx6TSKoaIAa3uF+nw7vU6Jjp1X42U36UercVjlPdQ3NpmsYZFilGFGOtwyN+ejZ5B0fGHxVEh/FF2kFmQ5KhyBhZVaJ3e+f6/A2ct3mUkNECMn6FR2+LDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748702841; c=relaxed/simple;
	bh=ll5zLEb44i6ewt0BuzTYyMd5NmpHXmxco0AGbyaSs4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nn7p/lgKxJfRNJYiQqILNOfTtQ/X+D2U6B0xgWcwUpwPgeQ5RIiVNJm7XZEm6dK8R17xkbhH5hVKtqcJ3EMid5OYsDuUqLj/Ab2GkSDe1RpwV+577B8dwbd6seqoHbBibrHR7Kj9PvyGxSB1IAb0mXsfiiLTPR8e+JI5XQh42Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFxJeiQR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFxJeiQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748702839; x=1780238839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ll5zLEb44i6ewt0BuzTYyMd5NmpHXmxco0AGbyaSs4Y=;
  b=AFxJeiQR3UNst6VRBDVAcfw/6clB8UNEciqk/WyVohOMv5s9/0NcJdJU
   34CWR2d4+Pz9637QfNyKZWg+wRaweDDbmU8pOYHVYRwLQMsBBHCimU1VZ
   Spdm6/OVrheqLlo+s7NdFlkon8/8yYmLRf6A2ZMu5HxbPXpy6aa6/Lvem
   T1Glsx9ChmmMdzqO6v53/Hqwt456RfvLdyl91NBp/EFxyct5McniqaTWq
   mrhC6lZi/kxJD4fhHvDFha/1KRMt30SLDMRoullYskcZhMimMGvdcMxnc
   L6U30R9dTz81Ck2Op5yukMeQGpEycn6IXLi14sK2MNwhKy0si4GVKnBHO
   w==;
X-CSE-ConnectionGUID: wM770TIARwacJJ+CBH8b7Q==
X-CSE-MsgGUID: Dxvz2+S2T2qQcou/kly0MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61401397"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="61401397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 07:47:19 -0700
X-CSE-ConnectionGUID: uGz081TdSF2kU08jvS0RDQ==
X-CSE-MsgGUID: W/fgdbKoS06zHkOirjW66w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="167326726"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 May 2025 07:47:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLNUR-000YSG-2i;
	Sat, 31 May 2025 14:47:15 +0000
Date: Sat, 31 May 2025 22:46:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@800000
 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202505312244.0KUvEhYO-lkp@intel.com>
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
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250531/202505312244.0KUvEhYO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312244.0KUvEhYO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312244.0KUvEhYO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@800000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@900000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@a00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: qcom,gpi-dma@b00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800 (qcom,sa8775p-dwc3): interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
--
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@800000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@900000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@a00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: qcom,gpi-dma@b00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800 (qcom,sa8775p-dwc3): interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000 (qcom,rpmh-rsc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^pinctrl-[0-9]+$', '^queue[0-9]$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
