Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01506313557
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 03:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769485715; cv=none; b=BPzUcLCooOtFOC2CKQj3FU9yXPbXd0Q6WqWsU1cUtiH91lFw5qCcIlM8JbNzycp9PeER/NigwX+Osf72BYYjnu7aUHZSDf28csNsBp6tAf1i1X8ZEawMaGA+sALSPAEhnKLR4dEKJKgSOoMmtbbWvI3XXJdQfLVkircd8wW4INM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769485715; c=relaxed/simple;
	bh=QC2+Q5LnK7ZvzUOpy6uWn+aXI3Ejjxd9vJjaf6a2Yvs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MlY6DjjuES9AYSt7+8UbmP3iCa4B1V0Ov56gSm6JQcmglEh8q8pwazn7NrL1Kv9h82dRo6KraIx3qAKX1KUxLkmLULANcBxUDrrk22VTcVMQUMZcg5wjQJoWNcvCvPL+nbdZpSj/kf2oKH77yM3YS0lJMuP99mlbFZC66JQd5iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYEBrqH3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYEBrqH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769485714; x=1801021714;
  h=date:from:to:cc:subject:message-id;
  bh=QC2+Q5LnK7ZvzUOpy6uWn+aXI3Ejjxd9vJjaf6a2Yvs=;
  b=mYEBrqH3BahrsXrS+iLOKFfgwj3VuwfPgn+9ydxs58Us9YVA5XRT8VsC
   7iWULizz2grLlQPDz4Y8qfzUoL7VKyaxY3D/Z/XC56PshGnS2ZTGiN/Q4
   JM6m0DfW61C3J6dgfTmyeXSW17ftAiDdgqCDkiFfk7Dfo5DnrdXa7Xef0
   s0VLJZhivbofYLhY4O5j2laKABtnVcEBeqp581QDBRTKD/Z/r6BQgxIEl
   8/NG8cTklxmIi61luThsQUPbxAIUkCl2QG0GtZQTbYOr9+ImmmSy4GaXm
   z0VAm2i+P8t6grukMkoiG3RPV/c6Em02S1C/U4QqcvkgKFAItKr+s940U
   g==;
X-CSE-ConnectionGUID: es8LbsAHQD2AiNvF2NF1Yg==
X-CSE-MsgGUID: ZDH4AGtfQtG9GnmUZWiwpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="69871404"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="69871404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 19:48:31 -0800
X-CSE-ConnectionGUID: bhztGesiTau4kh0KmfDZDA==
X-CSE-MsgGUID: RYW4YLp+SBaLrLpq/yzAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="245464177"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2026 19:48:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vka43-000000001iV-0G8z;
	Tue, 27 Jan 2026 03:48:27 +0000
Date: Tue, 27 Jan 2026 04:48:20 +0100
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 5946/9596]
 arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt):
 'vddwlcx-supply' is a required property
Message-ID: <202601270401.ghqWh5lL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   615aad0f61e0c7a898184a394dc895c610100d4f
commit: d27267558fd25acb07d7ff28a7ff44eacf799eaf [5946/9596] arm64: dts: qcom: lemans; Add EL2 overlay
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260127/202601270401.ghqWh5lL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270401.ghqWh5lL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270401.ghqWh5lL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@26300000 (qcom,sa8775p-cdsp0-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@2a300000 (qcom,sa8775p-cdsp1-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@26300000 (qcom,sa8775p-cdsp0-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@2a300000 (qcom,sa8775p-cdsp1-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: remoteproc@30000000 (qcom,sa8775p-adsp-pas): Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3-el2.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
