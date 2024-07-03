Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602F3BBEA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 04:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719981768; cv=none; b=ssBEU8uWi2Q2rphOK2lte9Alh2NqHlk7OHwiAI4BrVXVxHDWkjf8bQT/9JpLwrUkniFW4/yCWFi799HnRM0Au3Z1CR2FVc3wtnRcsSEGKKkbiJfUuTfUV9Immoa8fPVg/CEAKkUCcDcJt4zjT9IZwuzupIGJbiqd8JFUbnnSxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719981768; c=relaxed/simple;
	bh=4BKrtR0z2HFCqIr5yL9cdZHsox0Vyfz04skrAqcY0Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=phqvfj5ptiqDQUlQIXkIQOxFT6Xch06BF7A/dZpsO0Br+fIIDNsDR2kckPJ+YPPHM8YescyjQTFV5U34lcUMiWMcnWnJq3/ChxzBdFhMbF3Wy5aPIFXyAA6tfF6GrNFizHbCNepSnbRaP0AlewiVELac4oUGfNdb3Er8ENyA6IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhfvgpRB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhfvgpRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719981763; x=1751517763;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4BKrtR0z2HFCqIr5yL9cdZHsox0Vyfz04skrAqcY0Ik=;
  b=DhfvgpRBxUV3whFXPT4CI822PGUN3UaqcVpLLGeGnlLv9mlh08/r0Mi4
   Eqw7Hr+LWAZF49Kyzp9yHesB80fkqviYSE8EQ3lQ4mSr4kPEJtts+I6Sc
   X4Ix/+0vmC4ZaeqCAg13g3LmoYBJatwAKrF41NQ7apkPU0A2IglkXGJwx
   tU4m0hrLv3IhBsuI6XJ9wzRsmhh8gdbnFSCS4leawXnVE5RvhZ0BMPj+G
   pb7MCq+lV/JsuKrcMZhs6J4jLPwS1LH9M14yDEVr+TnhXYMw0L/+EI2Co
   rT3CypSAICi28JSEk+K55WvzE1R4p1BbULTJQHHLc0Q5nRZ3KcuiOMK3R
   w==;
X-CSE-ConnectionGUID: zRVOHUtJR4OHHsK1KfyDnA==
X-CSE-MsgGUID: L03OCn3fS+W5i4xIy0YtHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27804742"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="27804742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 21:42:42 -0700
X-CSE-ConnectionGUID: nWtHevx9RYu1LhT6EY6VXQ==
X-CSE-MsgGUID: UBE6QkXmTCyS/3CwCagOKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="46033163"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Jul 2024 21:42:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOrpF-000PHK-2c;
	Wed, 03 Jul 2024 04:42:37 +0000
Date: Wed, 3 Jul 2024 12:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [qcom:arm64-for-6.11 248/264]
 arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@24091000: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202407031201.vVUrUYZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-fo=
r-6.11
head:   818c2676e5816dad5a77df5a1c0d99d0e160d0b1
commit: 740bc66960527754d4980e649953fb8ccecf67e5 [248/264] arm64: dts: qcom=
: x1e80100: Add BWMONs
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/arch=
ive/20240703/202407031201.vVUrUYZJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326=
ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240703/202407031201.vVUrUYZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031201.vVUrUYZJ-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@a: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@b: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@b: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@c: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@c: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@24091000: compatible: 'on=
eOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qc=
om,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', '=
qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', =
'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qc=
om,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon',=
 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@24091000: failed t=
o match any schema with compatible: ['qcom,x1e80100-llcc-bwmon', 'qcom,sc72=
80-llcc-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b3400: compatible: 'on=
eOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@240b3400: failed t=
o match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm84=
5-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b5400: compatible: 'on=
eOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b5400: 'opp-table' is =
a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@240b5400: failed t=
o match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm84=
5-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b6400: compatible: 'on=
eOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmu@240b6400: 'opp-table' is =
a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/pmu@240b6400: failed t=
o match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm84=
5-bwmon']
--
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@7: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@a: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@a: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@b: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@b: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@c: compatible:0: 'qcom,s=
mb2360' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
m6150l', 'qcom,pm6350', 'qcom,pm660', 'qcom,pm660l', 'qcom,pm7250b', 'qcom,=
pm7550ba', 'qcom,pm7325', 'qcom,pm8004', 'qcom,pm8005', 'qcom,pm8009', 'qco=
m,pm8010', 'qcom,pm8019', 'qcom,pm8028', 'qcom,pm8110', 'qcom,pm8150', 'qco=
m,pm8150b', 'qcom,pm8150c', 'qcom,pm8150l', 'qcom,pm8226', 'qcom,pm8350', '=
qcom,pm8350b', 'qcom,pm8350c', 'qcom,pm8450', 'qcom,pm8550', 'qcom,pm8550b'=
, 'qcom,pm8550ve', 'qcom,pm8550vs', 'qcom,pm8841', 'qcom,pm8909', 'qcom,pm8=
916', 'qcom,pm8937', 'qcom,pm8941', 'qcom,pm8950', 'qcom,pm8953', 'qcom,pm8=
994', 'qcom,pm8998', 'qcom,pma8084', 'qcom,pmc8180', 'qcom,pmc8180c', 'qcom=
,pmd9635', 'qcom,pmi632', 'qcom,pmi8950', 'qcom,pmi8962', 'qcom,pmi8994', '=
qcom,pmi8998', 'qcom,pmk8002', 'qcom,pmk8350', 'qcom,pmk8550', 'qcom,pmm815=
5au', 'qcom,pmm8654au', 'qcom,pmp8074', 'qcom,pmr735a', 'qcom,pmr735b', 'qc=
om,pmr735d', 'qcom,pms405', 'qcom,pmx55', 'qcom,pmx65', 'qcom,pmx75', 'qcom=
,smb2351']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
432000/pmic@c: failed to match any schema with compatible: ['qcom,smb2360',=
 'qcom,spmi-pmic']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@24091000: compatible: 'on=
eOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qc=
om,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', '=
qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', =
'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-llcc-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qc=
om,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon',=
 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/pmu@24091000: failed t=
o match any schema with compatible: ['qcom,x1e80100-llcc-bwmon', 'qcom,sc72=
80-llcc-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b3400: compatible: 'on=
eOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/pmu@240b3400: failed t=
o match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm84=
5-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b5400: compatible: 'on=
eOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b5400: 'opp-table' is =
a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/pmu@240b5400: failed t=
o match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm84=
5-bwmon']
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b6400: compatible: 'on=
eOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qco=
m,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'q=
com,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', '=
qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon']
   	'qcom,x1e80100-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qco=
m,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', =
'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmu@240b6400: 'opp-table' is =
a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm899=
8-bwmon.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/pmu@240b6400: failed t=
o match any schema with compatible: ['qcom,x1e80100-cpu-bwmon', 'qcom,sdm84=
5-bwmon']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
