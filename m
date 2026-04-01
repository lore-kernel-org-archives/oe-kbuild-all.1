Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D682E92B7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 05:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775022903; cv=none; b=C86DfkBLrnoBxoeDjL2kOeLiM3bOGX5IR93q1VtYby3CZ34tBwV6mSf0c72O0jnEawEzYxtAJRvKyyxwqoRZb4nNCGKY6XUt0wK/ppGrblWtAAqoPkHN4YVV0k4PqDCIn76kRvA9EpS2hLnDMgOBIAI78mNF8jYMNVfkY831AG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775022903; c=relaxed/simple;
	bh=Al5FPDhqLF8+ncQnTKoCWaKxL4EhclZI9UfjSab4HXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L3888tMQvixjDLgkCxwgOiOrXVtx59v/Tqs1FpFJLxgAKAWVo3cgQUQdA+8Xmp/3iWWCwSooGwE20880cu89z6XdC5vj87K13SwMv1mXUwfRiunaWCwmXjFkLXKZs9e1IINiSLofnnCDjYOkR0zNFp3pGdOphRPI2iLkgCF7X8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg8p9eKl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg8p9eKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775022901; x=1806558901;
  h=date:from:to:cc:subject:message-id;
  bh=Al5FPDhqLF8+ncQnTKoCWaKxL4EhclZI9UfjSab4HXI=;
  b=Dg8p9eKlZJ74TJ3d7NPZfEC3CrT5qpZvuRSQo3XwexsFfQfAek0kpC6y
   +AYwLxteeigwC//ma9FHc90ktQCJKAuPMsNh0vNlIfC0nwYOh5Ohmz2Hl
   pkEURJg9AqHbG3IThDRGTNKSctQ/9QPLc5uY+3sPtJvkLFOzXPyDUWXD1
   FWj5MzWsGUXcqfvckmrsh3NNxycBluCEzWViXqTMNemdl8lYApRmU4a6a
   6JktpYO1b3TcJuyTO1RIlXOxaBAGlpmr3+AbYxHKMB/lmcBu2Jixm6FqX
   72A90jNcMmsuUJOYmXGaUFSOuxjv+ct9eM0ppIq1YlK19iGthm8KlwPOF
   A==;
X-CSE-ConnectionGUID: wEee8/2kTmG9qR1JeCrQOw==
X-CSE-MsgGUID: fTvyIuneQCWj0Ns9kq1pow==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76165064"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76165064"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 22:55:00 -0700
X-CSE-ConnectionGUID: TPLJ79lTTm+4sjs5mwr5lw==
X-CSE-MsgGUID: Yy9PDX6nSIG5ujxk+oyeyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="264513602"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Mar 2026 22:54:58 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7oXX-000000008eP-2alr;
	Wed, 01 Apr 2026 05:54:55 +0000
Date: Wed, 01 Apr 2026 07:53:58 +0200
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 9844/10705]
 arch/arm64/boot/dts/qcom/eliza-mtp.dtb: thermal-sensor@c228000
 (qcom,eliza-tsens): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202604010757.nutP4ipW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 7f390d6ccbaa3313758b172fd8cbadc6c652c48a [9844/10705] arm64: dts: qcom: eliza: Add thermal sensors
config: arm64-randconfig-2052-20260330 (https://download.01.org/0day-ci/archive/20260401/202604010757.nutP4ipW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010757.nutP4ipW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010757.nutP4ipW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,sm8750-qmp-ufs-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/phy@1d80000: failed to match any schema with compatible: ['qcom,eliza-qmp-ufs-phy', 'qcom,sm8650-qmp-ufs-phy']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/ufshc@1d84000: failed to match any schema with compatible: ['qcom,eliza-ufshc', 'qcom,ufshc', 'jedec,ufs-2.0']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000 (qcom,eliza-inline-crypto-engine): compatible:0: 'qcom,eliza-inline-crypto-engine' is not one of ['qcom,kaanapali-inline-crypto-engine', 'qcom,milos-inline-crypto-engine', 'qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engine', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine', 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'qcom,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/crypto@1d88000: failed to match any schema with compatible: ['qcom,eliza-inline-crypto-engine', 'qcom,inline-crypto-engine']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: interrupt-controller@b220000 (qcom,eliza-pdc): compatible:0: 'qcom,eliza-pdc' is not one of ['qcom,glymur-pdc', 'qcom,kaanapali-pdc', 'qcom,milos-pdc', 'qcom,qcs615-pdc', 'qcom,qcs8300-pdc', 'qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,sm8750-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,eliza-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: thermal-sensor@c228000 (qcom,eliza-tsens): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,eliza-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5018-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,msm8937-tsens', 'qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,glymur-tsens', 'qcom,kaanapali-tsens', 'qcom,milos-tsens', 'qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,qcs8300-tsens', 'qcom,qcs615-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qcom,sar2130p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,x1e80100-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-tsens', 'qcom,ipq8074-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/thermal-sensor@c228000: failed to match any schema with compatible: ['qcom,eliza-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: thermal-sensor@c229000 (qcom,eliza-tsens): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,eliza-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5018-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,msm8937-tsens', 'qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,glymur-tsens', 'qcom,kaanapali-tsens', 'qcom,milos-tsens', 'qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,qcs8300-tsens', 'qcom,qcs615-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qcom,sar2130p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,x1e80100-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-tsens', 'qcom,ipq8074-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/thermal-sensor@c229000: failed to match any schema with compatible: ['qcom,eliza-tsens', 'qcom,tsens-v2']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: thermal-sensor@c22a000 (qcom,eliza-tsens): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,eliza-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5018-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,msm8937-tsens', 'qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,glymur-tsens', 'qcom,kaanapali-tsens', 'qcom,milos-tsens', 'qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,qcs8300-tsens', 'qcom,qcs615-tsens', 'qcom,sa8255p-tsens', 'qcom,sa8775p-tsens', 'qcom,sar2130p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens', 'qcom,x1e80100-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq5332-tsens', 'qcom,ipq5424-tsens', 'qcom,ipq8074-tsens']
   	'qcom,eliza-tsens' is not one of ['qcom,ipq6018-tsens', 'qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/thermal-sensor@c22a000: failed to match any schema with compatible: ['qcom,eliza-tsens', 'qcom,tsens-v2']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: arbiter@c400000 (qcom,eliza-spmi-pmic-arb): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-spmi-pmic-arb', 'qcom,x1e80100-spmi-pmic-arb'] is too long
   	'qcom,sar2130p-spmi-pmic-arb' was expected
   	'qcom,x1e80100-spmi-pmic-arb' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,x1e80100-spmi-pmic-arb.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/arbiter@c400000: failed to match any schema with compatible: ['qcom,eliza-spmi-pmic-arb', 'qcom,x1e80100-spmi-pmic-arb']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: iommu@15000000 (qcom,eliza-smmu-500): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	['qcom,eliza-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too short
   	'qcom,eliza-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
