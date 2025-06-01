Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687842DCBEC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 01:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748739907; cv=none; b=o2iakTfU8QHHSb/st7C/bwNt7p1EBd4m2nYH0RSwrzfy/aZIe2XMHhnH2gnPKFODZl12hM7Zt2fgoTRmLFft4X/r2c1FUVBeVd975Zl4kw8W9ELjYRNpk+nn7e1nBXCb81BdkztgY7YDxWh4PmAw/ulpjkQJQelVT845vjp2P50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748739907; c=relaxed/simple;
	bh=0mwP9WmLpO/0It75jNqeYLUuk8+DNvK418jF40ZpBoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JIxY3loQHe9cAuXoVRk1ETZEvX2RbnogxfEkJ5Qs0XEs1mfwRCJ4ZaWUBq320OQBbwJabi2cUCPYnc6zBIHUDsJCSLSqEqN02pPe3T1i8KSgpmcF/yDcJ7DzUZoe+sOPTmShSd5tZnpQbKZ7G/ym52IEkGapGbgGelepoj01lfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bs7c5Oms; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bs7c5Oms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748739905; x=1780275905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mwP9WmLpO/0It75jNqeYLUuk8+DNvK418jF40ZpBoU=;
  b=Bs7c5Oms8phHoXsv1ARP9OZHDaZdK7/jAm0UTz9QQvT1hHG6BpoW9M8h
   bpvrHF6KkHiKjE+/r7/Ifv/vhE5hOikKQDO1mojpNaW3q7A9Dh4y9Ccap
   2BpkpU/YQ+3D/4RhAzMGHFNLYRdbm7cNg91cNVZLj+05fdpdG0r9koMqM
   oMyydU5za+hjj2N2H+yAt02YuzyhSdizDrWkkTGYHRr51AX/fpbloBxza
   uKzHUxJEgE3foUNE8B0Dq8vqw+1fecbyXlj02VlI2KRNXOCcEY73kyNVG
   NUAz44NR/9PJC1qeToYFl0sxjw95r6sC3g1yRR/E6JXU8aSTRX1W9HYuT
   A==;
X-CSE-ConnectionGUID: sgTq6BIJQv68yEFj3Ukq6w==
X-CSE-MsgGUID: OoeetYarRbun8BOtkIAZsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50714248"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="50714248"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 18:05:05 -0700
X-CSE-ConnectionGUID: Ejra+VjRRmq7VqR9VEWorQ==
X-CSE-MsgGUID: lmsgtkBcRt+kT4RWHFB0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="144678084"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 May 2025 18:05:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLX8I-000Yiy-0I;
	Sun, 01 Jun 2025 01:05:02 +0000
Date: Sun, 1 Jun 2025 09:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@800000
 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202506010819.nevq7iBr-lkp@intel.com>
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
commit: 7dcc1dfaa3d1cd3aafed2beb7086ed34fdb22303 [2/2] arm64: dts: qcom: qcs9100: Add support for the QCS9100 Ride and Ride Rev3 boards
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250601/202506010819.nevq7iBr-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010819.nevq7iBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010819.nevq7iBr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@800000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@900000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@a00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: qcom,gpi-dma@800000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: qcom,gpi-dma@900000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: qcom,gpi-dma@a00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: qcom,gpi-dma@b00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: crypto@1dfa000 (qcom,sa8775p-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-qce', 'qcom,qce'] is too long
   	['qcom,sa8775p-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
