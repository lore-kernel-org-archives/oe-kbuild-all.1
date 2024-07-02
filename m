Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE521C2DE1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 22:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719958404; cv=none; b=OXkPmqRXjp534ruMCM69Mx7ep6nAowEMpnOvlnwBOBndVVAZcLE40iKX+fw1hMEXvSflt/hYJbA5U/240lO+mLHhXpnj+0pTJhhLkjY3Cz74TAiCUawz/y6u55fDGFEqKCpU52ztKLQwVX0/06BDtjRYLM5iWP0DASU770kLIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719958404; c=relaxed/simple;
	bh=9uRJi1dePOVenBwNoo7H4ISDnwyWuNDqKJelhTa20bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzUYhLFw37CIc2KtU3XgdVSqukLFu+WcPZZds/dFCwdqLj48U4I0D/2W8ur/ylvk4d+6n7pAUXVYDt7l1xFYesBEN8qkRB013rNFqYjjQpyZJLjnhIBIQ7aG3syPxW6L1ERz8JG0FiEurPESvozJ7aSPTxwW7MRaDL/bGGhBUKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JHOTWcQo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHOTWcQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719958403; x=1751494403;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9uRJi1dePOVenBwNoo7H4ISDnwyWuNDqKJelhTa20bg=;
  b=JHOTWcQoEDi6eDhCaG/9bW/L9lDxp2Fj+9RjUp+GPGzoScde0OrlmNJA
   zXGlzoC3lDeSk7zTN2HO1TTdGgTxD6S4QJm/ux+4JsX/OGH8ygTpnzkY8
   E47DC7Dz7JLtXEve6gijwt4QpLG/tV+wpz7lpF5A8LmR6oFy3+P+QaQ7E
   YlGHkR8iM4T+YliUtn5TlAx9xFoTo+amAxzpV3aZBFl/d+4hocrF+Uua7
   0GKYSd1TMBWeDQYf84TI91vHqegKsSetuLQA0B7pdcR1ySE6kvhSD7cly
   GCJyia7fPNJ3fiUYvXFR4lWy3O0/iNocLJQ7igB2KdSxVGN3aLiedTtM+
   w==;
X-CSE-ConnectionGUID: glT/BaZcRpSVkCvzIySzKA==
X-CSE-MsgGUID: eSyYHVC8Q/6Db+NPcWShSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17297557"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17297557"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 15:13:22 -0700
X-CSE-ConnectionGUID: XQrfl8E+QAS+tN2n4QTjFQ==
X-CSE-MsgGUID: ey0NallYTXip8EzDQyIH8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46031038"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2024 15:13:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOlkT-000OkE-1k;
	Tue, 02 Jul 2024 22:13:17 +0000
Date: Wed, 3 Jul 2024 06:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [qcom:arm64-for-6.11 236/264]
 arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c271000:
 failed to match any schema with compatible: ['qcom,x1e80100-tsens',
 'qcom,tsens-v2']
Message-ID: <202407030642.boy144Da-lkp@intel.com>
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
commit: 4e915987ff5b91ea531e716367373ff4442d9614 [236/264] arm64: dts: qcom=
: x1e80100: Enable tsens and thermal zone nodes
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/arch=
ive/20240703/202407030642.boy144Da-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad7=
9a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240703/202407030642.boy144Da-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030642.boy144Da-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c271000=
: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom=
,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: thermal-sensor@c272000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c272000=
: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom=
,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: thermal-sensor@c273000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c273000=
: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom=
,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: thermal-sensor@c274000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/thermal-sensor@c274000=
: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom=
,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pci@1bf8000: Unevaluated prop=
erties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.y=
aml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a2f8800: interrupt-names:=
 ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@3: compatible:0: 'qcom,p=
mc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
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
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pmic@3: gpio@8800:compatible:=
0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm660-gpio'=
, 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,pm6150l=
-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio', 'qcom,=
pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8008-gpio',=
 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,pm8058-g=
pio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', 'qcom,p=
m8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-gpio', =
'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,pm8550ve=
-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio', 'qcom=
,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-gpio', =
'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,pmc8180-=
gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio', 'qcom=
,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih0108-gp=
io', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio', 'qcom=
,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pmr735b-g=
pio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'qcom,pmx=
65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: /soc@0/arbiter@c400000/spmi@c=
42d000/pmic@3: failed to match any schema with compatible: ['qcom,pmc8380',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: gpio@8800: compatible:0: 'qco=
m,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm660-gpio', 'qcom=
,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,pm6150l-gpio',=
 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio', 'qcom,pm7325-=
gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8008-gpio', 'qcom,=
pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,pm8058-gpio', '=
qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', 'qcom,pm8226-g=
pio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-gpio', 'qcom,p=
m8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,pm8550ve-gpio',=
 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio', 'qcom,pm8921=
-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-gpio', 'qcom,p=
m8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,pmc8180-gpio', =
'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio', 'qcom,pmi895=
0-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih0108-gpio', 'q=
com,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio', 'qcom,pmm865=
4au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pmr735b-gpio', '=
qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'qcom,pmx65-gpio=
', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
--
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c271000=
: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom=
,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: thermal-sensor@c272000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c272000=
: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom=
,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: thermal-sensor@c273000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c273000=
: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom=
,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: thermal-sensor@c274000: compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm896=
0-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm822=
6-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens',=
 'qcom,msm8974-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm897=
6-tsens', 'qcom,qcs404-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm899=
6-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens',=
 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc82=
80xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens',=
 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm825=
0-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'q=
com,sm8650-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
   	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
   	'qcom,tsens-v0_1' was expected
   	'qcom,tsens-v1' was expected
   	'qcom,ipq8074-tsens' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/thermal-sensor@c274000=
: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom=
,tsens-v2']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pci@1bf8000: Unevaluated prop=
erties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.y=
aml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a2f8800: interrupt-names:=
 ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@3: compatible:0: 'qcom,p=
mc8380' is not one of ['qcom,pm2250', 'qcom,pm6125', 'qcom,pm6150', 'qcom,p=
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
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pmic@3: gpio@8800:compatible:=
0: 'qcom,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm660-gpio'=
, 'qcom,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,pm6150l=
-gpio', 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio', 'qcom,=
pm7325-gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8008-gpio',=
 'qcom,pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,pm8058-g=
pio', 'qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', 'qcom,p=
m8226-gpio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-gpio', =
'qcom,pm8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,pm8550ve=
-gpio', 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio', 'qcom=
,pm8921-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-gpio', =
'qcom,pm8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,pmc8180-=
gpio', 'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio', 'qcom=
,pmi8950-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih0108-gp=
io', 'qcom,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio', 'qcom=
,pmm8654au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pmr735b-g=
pio', 'qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'qcom,pmx=
65-gpio', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: /soc@0/arbiter@c400000/spmi@c=
42d000/pmic@3: failed to match any schema with compatible: ['qcom,pmc8380',=
 'qcom,spmi-pmic']
   arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: gpio@8800: compatible:0: 'qco=
m,pmc8380-gpio' is not one of ['qcom,pm2250-gpio', 'qcom,pm660-gpio', 'qcom=
,pm660l-gpio', 'qcom,pm6125-gpio', 'qcom,pm6150-gpio', 'qcom,pm6150l-gpio',=
 'qcom,pm6350-gpio', 'qcom,pm6450-gpio', 'qcom,pm7250b-gpio', 'qcom,pm7325-=
gpio', 'qcom,pm7550ba-gpio', 'qcom,pm8005-gpio', 'qcom,pm8008-gpio', 'qcom,=
pm8018-gpio', 'qcom,pm8019-gpio', 'qcom,pm8038-gpio', 'qcom,pm8058-gpio', '=
qcom,pm8150-gpio', 'qcom,pm8150b-gpio', 'qcom,pm8150l-gpio', 'qcom,pm8226-g=
pio', 'qcom,pm8350-gpio', 'qcom,pm8350b-gpio', 'qcom,pm8350c-gpio', 'qcom,p=
m8450-gpio', 'qcom,pm8550-gpio', 'qcom,pm8550b-gpio', 'qcom,pm8550ve-gpio',=
 'qcom,pm8550vs-gpio', 'qcom,pm8916-gpio', 'qcom,pm8917-gpio', 'qcom,pm8921=
-gpio', 'qcom,pm8941-gpio', 'qcom,pm8950-gpio', 'qcom,pm8953-gpio', 'qcom,p=
m8994-gpio', 'qcom,pm8998-gpio', 'qcom,pma8084-gpio', 'qcom,pmc8180-gpio', =
'qcom,pmc8180c-gpio', 'qcom,pmd8028-gpio', 'qcom,pmi632-gpio', 'qcom,pmi895=
0-gpio', 'qcom,pmi8994-gpio', 'qcom,pmi8998-gpio', 'qcom,pmih0108-gpio', 'q=
com,pmk8350-gpio', 'qcom,pmk8550-gpio', 'qcom,pmm8155au-gpio', 'qcom,pmm865=
4au-gpio', 'qcom,pmp8074-gpio', 'qcom,pmr735a-gpio', 'qcom,pmr735b-gpio', '=
qcom,pmr735d-gpio', 'qcom,pms405-gpio', 'qcom,pmx55-gpio', 'qcom,pmx65-gpio=
', 'qcom,pmx75-gpio', 'qcom,pmxr2230-gpio']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
