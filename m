Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397E28370
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 16:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736613076; cv=none; b=LLCOmMfFDlqW+hOr/VSNeqLJ/roADWUMXIzHpoEtc4VCILdnengLKNs25M7D5154a5ou/fUWG6Al2NH8jX17h2hjMeB2EqF7jrrDBi/hZ5SV6P08sCqGMOYE1SXjgj1FwVIVmib/Za4n5HA8MLMuR6fxBDeTRqYrDC8BcN3a5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736613076; c=relaxed/simple;
	bh=Ya2yq985c5694d6ZwIELjjWrsELbYs1heJ9zvIPc6WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLsVK+UvOemhb+HM6740OZ23Ezr1B5bxRSvxQ6v+0Bd6TBP50dbBMuCy9Pgw9x2f8ThZg2CBE79vO8khuZzDQCGcygZThTt9AjLv84YDf7P/DCDK1yrhYUnGGV4RhWxwqjFPpCIQCQM7BkvVFXpBrIaM+0dhG41Qa7hA/Mw1fDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lahKcJgt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lahKcJgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736613074; x=1768149074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ya2yq985c5694d6ZwIELjjWrsELbYs1heJ9zvIPc6WQ=;
  b=lahKcJgtRwDwbmd6aUwP7qzK13D6bT21ZlioEAuh9x5OamnnvsifC0ln
   SIvtoqUuq0z225B/VbZB2damhRkN7AZxK07uKQYIamethqxmOJ2q5VUkI
   1jJlkpf4+ZxJYY1PWtLcDnQLdkaS5KL+wA+19SRlCJEn7I4Jhj3rAQrbp
   /SY7liMnUy2aJrRnJKqW2M+f9ag7MnQYbhSr3d8VNqtIJrivcd5eBmyXF
   mDt//nb+eHjdZqTGzhh7+1k9r4CSYdJJh4pNkEVrrCw7BuY6KVbgVyifz
   gyX4YfgX/KInNrUauBKxFjZHhaDbgTgn9Vd9p0sH5Wad+Q2RKpXY2G84X
   g==;
X-CSE-ConnectionGUID: gdFsV8qnRs6S9X/sp5XZMQ==
X-CSE-MsgGUID: Npjd/2PnQneuO1yOSasRtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47551446"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47551446"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 08:31:13 -0800
X-CSE-ConnectionGUID: j+dZBbs/RsyzhQnPJIGL/g==
X-CSE-MsgGUID: RrxpL27rSDurLK9oRZ8JIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104527112"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jan 2025 08:31:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWeOD-000Kwt-1u;
	Sat, 11 Jan 2025 16:31:09 +0000
Date: Sun, 12 Jan 2025 00:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 6498/7860]
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/clock-controller@3d90000:
 failed to match any schema with compatible: ['qcom,qcs8300-gpucc']
Message-ID: <202501120049.KPbtWhvh-lkp@intel.com>
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
commit: 795255cb4cd4388cac930e3bb3524e1ca84dd0bf [6498/7860] arm64: dts: qcom: qcs8300: Add support for clock controllers
config: arm64-randconfig-052-20250109 (https://download.01.org/0day-ci/archive/20250112/202501120049.KPbtWhvh-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120049.KPbtWhvh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120049.KPbtWhvh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: crypto@1d88000: compatible:0: 'qcom,qcs8300-inline-crypto-engine' is not one of ['qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/crypto@1d88000: failed to match any schema with compatible: ['qcom,qcs8300-inline-crypto-engine', 'qcom,inline-crypto-engine']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible:0: 'qcom,qcs8300-adsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/clock-controller@3d90000: failed to match any schema with compatible: ['qcom,qcs8300-gpucc']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/clock-controller@abf0000: failed to match any schema with compatible: ['qcom,qcs8300-videocc']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/clock-controller@ade0000: failed to match any schema with compatible: ['qcom,qcs8300-camcc']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs8300-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs8300-pdc', 'qcom,pdc']
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-qcs8300', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-qcs8300', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-qcs8300' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-qcs8300' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
