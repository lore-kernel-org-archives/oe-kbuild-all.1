Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD11225A2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736534551; cv=none; b=IeAWCG/kH1otOMvkWgrTzyoykafFDQ5fw61LQWUDwhTUbAKX68HQuCOyV3AtCbHFBDxiuF1eF1bQBj74jW8x5HXXW+em2PVpGkm76uzr2ePdKN8vKwTasdil7i5JrBjLGhLaD7ru1X5g0liSh8MAPwUgPMOxQobFmLCLG66BjCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736534551; c=relaxed/simple;
	bh=XMOD17pXFsvsqzpSXMAz4K6k6Y0kAJcXELHYsMo8zAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CyOBXnsqUAtVaTWCYyc0LEfy/u6hVDHGsin02Sg2rknvHomnHTRDH0s1UOdqtxxBHwgayrbhqmtyNNfquPyozEnvfCTNdG4vIyt8MxKxVNHgfzi1sfuJtVmvx8sIMazJIQVQdGwiPldx+wUiQ25Jfj+6A+7m2IisWbHpzMuhfGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cet1CtHk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cet1CtHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736534547; x=1768070547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XMOD17pXFsvsqzpSXMAz4K6k6Y0kAJcXELHYsMo8zAE=;
  b=cet1CtHkpL6pP0ikbIaAbWpzfexDSpBCQ/mHbkdOALIqm7K0M+iWLEyF
   piE0p75ksofiodqrobY5fwQymQKwkvYY4Q9HqEknwge/zw0UO5hJ9yw3s
   8ukytwzJPvut6eq/MN3vd/qDXWs9hShGNezV+qMk9SVoI+Uwmx+yHWPWM
   wDh0cDDGgSD0iZikZsChRDl2h38Nh2mLeBPKrbPii/QlGp53z2wFCD6aE
   6eTkwSaXtI3/jb2Aev4NzRUPWiLEyHOYaJKngjKS9XuIXI8VkjgyWXL+M
   3DflBnYCwn4DJOUDqfUDQ+AhB1M6tEDF8T2Bpoz1I3ikWSeC/EnT2NteH
   A==;
X-CSE-ConnectionGUID: JGMlXRwdQ7aovUDyR0uoyw==
X-CSE-MsgGUID: jzqmHYxxTYCJY1ZBzIpGpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36122858"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="36122858"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 10:42:26 -0800
X-CSE-ConnectionGUID: /ji1CL1HRuWfyXu9YFYu2w==
X-CSE-MsgGUID: BvwpQcO3Q5qYan2rFqQbnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="103735665"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 10:42:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWJxe-000Jda-2i;
	Fri, 10 Jan 2025 18:42:22 +0000
Date: Sat, 11 Jan 2025 02:41:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Xin Liu <quic_liuxin@quicinc.com>
Subject: [linux-next:master 6465/7860]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: Unevaluated
 properties are not allowed ('compatible' was unexpected)
Message-ID: <202501110205.ajKauAd7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
commit: 4b120ef62ed653f4bc05e5f68832d2d2ac548b60 [6465/7860] arm64: dts: qcom: qcs615-ride: Enable UFS node
config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250111/202501110205.ajKauAd7-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110205.ajKauAd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110205.ajKauAd7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: dma-controller@a00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma'] is too long
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm6350-gpi-dma']
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-gpi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qcom,x1e80100-gpi-dma']
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm6125-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sm6350-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/dma-controller@a00000: failed to match any schema with compatible: ['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: compatible:0: 'qcom,qcs615-ufshc' is not one of ['qcom,msm8994-ufshc', 'qcom,msm8996-ufshc', 'qcom,msm8998-ufshc', 'qcom,qcs8300-ufshc', 'qcom,sa8775p-ufshc', 'qcom,sc7180-ufshc', 'qcom,sc7280-ufshc', 'qcom,sc8180x-ufshc', 'qcom,sc8280xp-ufshc', 'qcom,sdm845-ufshc', 'qcom,sm6115-ufshc', 'qcom,sm6125-ufshc', 'qcom,sm6350-ufshc', 'qcom,sm8150-ufshc', 'qcom,sm8250-ufshc', 'qcom,sm8350-ufshc', 'qcom,sm8450-ufshc', 'qcom,sm8550-ufshc', 'qcom,sm8650-ufshc']
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/ufshc@1d84000: failed to match any schema with compatible: ['qcom,qcs615-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: pmu@90b6300: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,qcs615-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,qcs615-cpu-bwmon' is not one of ['qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
