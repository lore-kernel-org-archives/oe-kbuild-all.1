Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83EF139D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 20:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748722547; cv=none; b=A96UlFUZYIYUl2PxobDdxls3kOjYcwHu/QebEHwBQsrbgzAKz9VtmctOFimcJiIcDpJx/Xij/RybHTxhHn912lY6Vyv8kkE2d8wYtOo11eI6HEjdYPsplihT7NeGOhCmapaUZXhhWDncZMx6HRdWDh6ac+MqEnBeVz2geyyBj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748722547; c=relaxed/simple;
	bh=59MndlDnvdNqJ2Uddj/8IJ/ga4t5EDc733MjgBN/BB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ami8xUsmzoR6B5ztVyaj/owqfKpL0RanOihSOWNS13Si5rj7PD9rypWFvX/xFIFZzVujdlR31K/NOVGUaez84LPWdknKLoLL8K4N4Nlz/FyxX9TxZTaLYTdZsHQPZDja9JhRdhKSp53WlmiZFmVOlfGp24aWC9tA6wnnAUxsY5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQFecUWz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQFecUWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748722545; x=1780258545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=59MndlDnvdNqJ2Uddj/8IJ/ga4t5EDc733MjgBN/BB8=;
  b=MQFecUWzaV9vazRTU5F0VIplPSVsHF7Fpam2B1e3vnWsI+TsrDHFdB4B
   nj9GJ+g0R2cc70gNPJlSJUeAz7Thk4oxZ6c4HSvtusre1Wk1adfpTkQJe
   /E7N9+okhJE07gKYbGb2iidGSHSlrQaYFcP0kgU64CmgJLzANXB3mfppR
   kREcffrkSvX3F8VAY9gahZl+q6Lzx9Eez8PrzaVmsjQ5uqgRG+sdaCqJi
   bYg7lZBE3fftq0PQTP0Z0JR2IupzjnoIyCZD8rxEheRI0amx89PDOz8SN
   JNe/DR2H3UwIXcFhb1aEe87mX/YNewpXm1XpIbjWh90cr4A+lBTBeuNh+
   A==;
X-CSE-ConnectionGUID: p599NjXURIysspEfVRa0QA==
X-CSE-MsgGUID: QDYMjjiaSqqxJOLeCBGEUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="49907482"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="49907482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 13:15:44 -0700
X-CSE-ConnectionGUID: bRwDPS+mQ5O4ihEKqOJtDw==
X-CSE-MsgGUID: vlLs0zKVRze5RqQysoZFvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="149217719"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 May 2025 13:15:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLScG-000Yca-2M;
	Sat, 31 May 2025 20:15:40 +0000
Date: Sun, 1 Jun 2025 04:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-rust 2/2]
 arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@a00000
 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202506010427.O4T7IoGj-lkp@intel.com>
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
config: arm64-randconfig-052-20250529 (https://download.01.org/0day-ci/archive/20250601/202506010427.O4T7IoGj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010427.O4T7IoGj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010427.O4T7IoGj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@800000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@900000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@a00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: qcom,gpi-dma@b00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: crypto@1dfa000 (qcom,sa8775p-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-qce', 'qcom,qce'] is too long
   	['qcom,sa8775p-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,sa8775p-qce' is not one of ['qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce']
   	'qcom,ipq4019-qce' was expected
--
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: qcom,gpi-dma@900000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: qcom,gpi-dma@a00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: qcom,gpi-dma@b00000 (qcom,sm6350-gpi-dma): $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: crypto@1dfa000 (qcom,sa8775p-qce): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-qce', 'qcom,qce'] is too long
   	['qcom,sa8775p-qce', 'qcom,qce'] is too short
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,sa8775p-qce' is not one of ['qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce']
   	'qcom,ipq4019-qce' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
