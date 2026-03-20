Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07F368972
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 22:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774046503; cv=none; b=hTuHYGriSUJKHC9v0E6QERcJ89Gf0/ezbxhxTX0Su6iglrazbT38S9De8ZyWmQ/JDUxbPI1Q8RREXiDR94XOkW6hWwnUv5RfVMjs9gAJmNnRbkLMpRbtg3htWoydrDHw74yZFDeaURMdGGd2pVVA6nNcUdKeZIYSM54EXObGVyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774046503; c=relaxed/simple;
	bh=nI1MZm28D+JyR3Xe5MO2IrUyZKW3cey1hLm30eYHOHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u8fVl5JL+uuceheYw5I5rXDHEroJUmeqvCIjjJjBElZ/s+VMY1VyhV+NOL0e4xal+tSUTvG7gMo2NhslBo3NPTjTUw9AWpOkOAIM8OTGA2ZQAPcamDa+HCmvoAwG6112bzkAes4HNycrJDVCLc1sXFE3dEdTj2mUBo8d6tcBUDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPXJmN7X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPXJmN7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774046501; x=1805582501;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nI1MZm28D+JyR3Xe5MO2IrUyZKW3cey1hLm30eYHOHo=;
  b=PPXJmN7Xuyx5m+lVFzpOu/ZdqMiRlP0vDpXWIZ3txSnjAsAFf0Ho/KRp
   nKR+puINp06+ERGV1b5ITI8QPNySS6EMtZi0VEcoKm5fBYsRM1X6V8TwO
   XTz+aW05en4NQeEMTIxtzVMAKkqQtXX/jSU4CFQoamEnrmQIjtaevH/qY
   F4DyMulpulFKq1qP4UHAbbKt7dQOEc27cBzZhiZ3VRBzbzWcekRJnqMwi
   cZ3bfGhtTUfc2h4Qwr2NeQbWKMOPQrVurPpQC/8VTz1iDXjxCU8A+OMDf
   vUw9htkzCG6EJSIhVtH9f6aKdwmeo4zdeMlDAsS6HJQytYUWTp85CqLDV
   Q==;
X-CSE-ConnectionGUID: 2Z2xT+vWS+2+6F0wtYxIIg==
X-CSE-MsgGUID: MwrR2lWGRFi/y/Ae/UMhKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75168497"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75168497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 15:41:40 -0700
X-CSE-ConnectionGUID: XIiqIaM+TlueX6CMvo8vHA==
X-CSE-MsgGUID: f44fhKldQoW6S54cH6gfVA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Mar 2026 15:41:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3iX9-00000000589-2q4y;
	Fri, 20 Mar 2026 22:41:35 +0000
Date: Fri, 20 Mar 2026 23:41:35 +0100
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 6615/7971]
 arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /firmware/scm: failed to match any
 schema with compatible: ['qcom,scm-eliza', 'qcom,scm']
Message-ID: <202603202328.DZFh8lgt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: 5d5c76d5e6b3822b292da5d20bc3272f6b74547b [6615/7971] arm64: dts: qc=
om: eliza: Enable Eliza MTP board support
config: arm64-randconfig-2051-20260319 (https://download.01.org/0day-ci/arc=
hive/20260320/202603202328.DZFh8lgt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260320/202603202328.DZFh8lgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202328.DZFh8lgt-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: scm (qcom,scm-eliza): compatible=
:0: 'qcom,scm-eliza' is not one of ['qcom,scm-apq8064', 'qcom,scm-apq8084',=
 'qcom,scm-glymur', 'qcom,scm-ipq4019', 'qcom,scm-ipq5018', 'qcom,scm-ipq53=
32', 'qcom,scm-ipq5424', 'qcom,scm-ipq6018', 'qcom,scm-ipq806x', 'qcom,scm-=
ipq8074', 'qcom,scm-ipq9574', 'qcom,scm-kaanapali', 'qcom,scm-mdm9607', 'qc=
om,scm-milos', 'qcom,scm-msm8226', 'qcom,scm-msm8660', 'qcom,scm-msm8916', =
'qcom,scm-msm8937', 'qcom,scm-msm8953', 'qcom,scm-msm8960', 'qcom,scm-msm89=
74', 'qcom,scm-msm8976', 'qcom,scm-msm8994', 'qcom,scm-msm8996', 'qcom,scm-=
msm8998', 'qcom,scm-qcm2290', 'qcom,scm-qcs615', 'qcom,scm-qcs8300', 'qcom,=
scm-qdu1000', 'qcom,scm-sa8255p', 'qcom,scm-sa8775p', 'qcom,scm-sar2130p', =
'qcom,scm-sc7180', 'qcom,scm-sc7280', 'qcom,scm-sc8180x', 'qcom,scm-sc8280x=
p', 'qcom,scm-sdm670', 'qcom,scm-sdm845', 'qcom,scm-sdx55', 'qcom,scm-sdx65=
', 'qcom,scm-sdx75', 'qcom,scm-sm6115', 'qcom,scm-sm6125', 'qcom,scm-sm6350=
', 'qcom,scm-sm6375', 'qcom,scm-sm7150', 'qcom,scm-sm8150', 'qcom,scm-sm825=
0', 'qcom,scm-sm8350', 'qcom,scm-sm8450', 'qcom,scm-sm8550', 'qcom,scm-sm86=
50', 'qcom,scm-sm8750', 'qcom,scm-qcs404', 'qcom,scm-x1e80100']
   	from schema $id: http://devicetree.org/schemas/firmware/qcom,scm.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /firmware/scm: failed to match a=
ny schema with compatible: ['qcom,scm-eliza', 'qcom,scm']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: phy@1d80000 (qcom,eliza-qmp-ufs-=
phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-qmp-ufs-phy', 'qcom,sm8650-qmp-ufs-phy'] is too long
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,qcs615-qmp-ufs-phy']
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,x1e80100-qmp-ufs-phy']
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,qcs8300-qmp-ufs-phy']
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,kaanapali-qmp-ufs-phy']
   	'qcom,eliza-qmp-ufs-phy' is not one of ['qcom,milos-qmp-ufs-phy', 'qcom=
,msm8996-qmp-ufs-phy', 'qcom,msm8998-qmp-ufs-phy', 'qcom,sa8775p-qmp-ufs-ph=
y', 'qcom,sc7180-qmp-ufs-phy', 'qcom,sc7280-qmp-ufs-phy', 'qcom,sc8180x-qmp=
-ufs-phy', 'qcom,sc8280xp-qmp-ufs-phy', 'qcom,sdm845-qmp-ufs-phy', 'qcom,sm=
6115-qmp-ufs-phy', 'qcom,sm6125-qmp-ufs-phy', 'qcom,sm6350-qmp-ufs-phy', 'q=
com,sm7150-qmp-ufs-phy', 'qcom,sm8150-qmp-ufs-phy', 'qcom,sm8250-qmp-ufs-ph=
y', 'qcom,sm8350-qmp-ufs-phy', 'qcom,sm8450-qmp-ufs-phy', 'qcom,sm8475-qmp-=
ufs-phy', 'qcom,sm8550-qmp-ufs-phy', 'qcom,sm8650-qmp-ufs-phy', 'qcom,sm875=
0-qmp-ufs-phy']
   	'qcom,sm6115-qmp-ufs-phy' was expected
   	'qcom,sm8550-qmp-ufs-phy' was expected
   	'qcom,sa8775p-qmp-ufs-phy' was expected
   	'qcom,sm8750-qmp-ufs-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-uf=
s-phy.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/phy@1d80000: failed to ma=
tch any schema with compatible: ['qcom,eliza-qmp-ufs-phy', 'qcom,sm8650-qmp=
-ufs-phy']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/ufshc@1d84000: failed to =
match any schema with compatible: ['qcom,eliza-ufshc', 'qcom,ufshc', 'jedec=
,ufs-2.0']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: crypto@1d88000 (qcom,eliza-inlin=
e-crypto-engine): compatible:0: 'qcom,eliza-inline-crypto-engine' is not on=
e of ['qcom,kaanapali-inline-crypto-engine', 'qcom,milos-inline-crypto-engi=
ne', 'qcom,qcs8300-inline-crypto-engine', 'qcom,sa8775p-inline-crypto-engin=
e', 'qcom,sc7180-inline-crypto-engine', 'qcom,sc7280-inline-crypto-engine',=
 'qcom,sm8450-inline-crypto-engine', 'qcom,sm8550-inline-crypto-engine', 'q=
com,sm8650-inline-crypto-engine', 'qcom,sm8750-inline-crypto-engine']
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypt=
o-engine.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/crypto@1d88000: failed to=
 match any schema with compatible: ['qcom,eliza-inline-crypto-engine', 'qco=
m,inline-crypto-engine']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: interrupt-controller@b220000 (qc=
om,eliza-pdc): compatible:0: 'qcom,eliza-pdc' is not one of ['qcom,glymur-p=
dc', 'qcom,kaanapali-pdc', 'qcom,milos-pdc', 'qcom,qcs615-pdc', 'qcom,qcs83=
00-pdc', 'qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,=
sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'q=
com,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', =
'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', '=
qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', =
'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,sm8750-pdc', 'qcom,x1e80100-pdc=
']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qco=
m,pdc.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/interrupt-controller@b220=
000: failed to match any schema with compatible: ['qcom,eliza-pdc', 'qcom,p=
dc']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: arbiter@c400000 (qcom,eliza-spmi=
-pmic-arb): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-spmi-pmic-arb', 'qcom,x1e80100-spmi-pmic-arb'] is too long
   	'qcom,sar2130p-spmi-pmic-arb' was expected
   	'qcom,x1e80100-spmi-pmic-arb' was expected
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,x1e80100-spmi-=
pmic-arb.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/arbiter@c400000: failed t=
o match any schema with compatible: ['qcom,eliza-spmi-pmic-arb', 'qcom,x1e8=
0100-spmi-pmic-arb']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: iommu@15000000 (qcom,eliza-smmu-=
500): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too long
   	['qcom,eliza-smmu-500', 'qcom,smmu-500', 'arm,mmu-500'] is too short
   	'qcom,eliza-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8=
998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
   	'qcom,eliza-smmu-500' is not one of ['qcom,glymur-smmu-500', 'qcom,kaan=
apali-smmu-500', 'qcom,milos-smmu-500', 'qcom,qcm2290-smmu-500', 'qcom,qcs6=
15-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa825=
5p-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc71=
80-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280=
xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-s=
mmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-5=
00', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500'=
, 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', '=
qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qco=
m,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,eliza-smmu-500' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7=
180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc828=
0xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350=
-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-sm=
mu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
   	'qcom,eliza-smmu-500' is not one of ['qcom,glymur-smmu-500', 'qcom,kaan=
apali-smmu-500', 'qcom,milos-smmu-500', 'qcom,qcm2290-smmu-500', 'qcom,qcs6=
15-smmu-500', 'qcom,qcs8300-smmu-500', 'qcom,sa8255p-smmu-500', 'qcom,sa877=
5p-smmu-500', 'qcom,sar2130p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc818=
0x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm612=
5-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-s=
mmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu=
-500', 'qcom,sm8750-smmu-500', 'qcom,x1e80100-smmu-500']
   	'qcom,eliza-smmu-500' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm81=
50-smmu-500', 'qcom,sm8250-smmu-500']
   	'qcom,eliza-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc71=
80-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm670-smmu-v2', 'qcom,sdm845-smm=
u-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
   	'marvell,ap806-smmu-500' was expected
   	'qcom,eliza-smmu-500' is not one of ['nvidia,tegra186-smmu', 'nvidia,te=
gra194-smmu', 'nvidia,tegra234-smmu']
   	'arm,mmu-500' was expected
   	'qcom,eliza-smmu-500' is not one of ['arm,mmu-400', 'arm,mmu-401']
   	'qcom,eliza-smmu-500' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm=
,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
   	'qcom,smmu-v2' was expected
   	'qcom,adreno-smmu' was expected
   	'nvidia,smmu-500' was expected
   	'arm,smmu-v2' was expected
   	'arm,smmu-v1' was expected
   	'qcom,smmu-500' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/iommu@15000000: failed to=
 match any schema with compatible: ['qcom,eliza-smmu-500', 'qcom,smmu-500',=
 'arm,mmu-500']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: rsc@17a00000 (qcom,rpmh-rsc): po=
wer-controller:compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-rpmhpd'] is too short
   	'qcom,eliza-rpmhpd' is not one of ['qcom,glymur-rpmhpd', 'qcom,kaanapal=
i-rpmhpd', 'qcom,mdm9607-rpmpd', 'qcom,milos-rpmhpd', 'qcom,msm8226-rpmpd',=
 'qcom,msm8909-rpmpd', 'qcom,msm8916-rpmpd', 'qcom,msm8917-rpmpd', 'qcom,ms=
m8939-rpmpd', 'qcom,msm8953-rpmpd', 'qcom,msm8974-rpmpd', 'qcom,msm8974pro-=
pma8084-rpmpd', 'qcom,msm8976-rpmpd', 'qcom,msm8994-rpmpd', 'qcom,msm8996-r=
pmpd', 'qcom,msm8998-rpmpd', 'qcom,qcm2290-rpmpd', 'qcom,qcs404-rpmpd', 'qc=
om,qcs615-rpmhpd', 'qcom,qcs8300-rpmhpd', 'qcom,qdu1000-rpmhpd', 'qcom,qm21=
5-rpmpd', 'qcom,sa8155p-rpmhpd', 'qcom,sa8540p-rpmhpd', 'qcom,sa8775p-rpmhp=
d', 'qcom,sar2130p-rpmhpd', 'qcom,sc7180-rpmhpd', 'qcom,sc7280-rpmhpd', 'qc=
om,sc8180x-rpmhpd', 'qcom,sc8280xp-rpmhpd', 'qcom,sdm660-rpmpd', 'qcom,sdm6=
70-rpmhpd', 'qcom,sdm845-rpmhpd', 'qcom,sdx55-rpmhpd', 'qcom,sdx65-rpmhpd',=
 'qcom,sdx75-rpmhpd', 'qcom,sm4450-rpmhpd', 'qcom,sm6115-rpmpd', 'qcom,sm61=
25-rpmpd', 'qcom,sm6350-rpmhpd', 'qcom,sm6375-rpmpd', 'qcom,sm7150-rpmhpd',=
 'qcom,sm8150-rpmhpd', 'qcom,sm8250-rpmhpd', 'qcom,sm8350-rpmhpd', 'qcom,sm=
8450-rpmhpd', 'qcom,sm8550-rpmhpd', 'qcom,sm8650-rpmhpd', 'qcom,sm8750-rpmh=
pd', 'qcom,x1e80100-rpmhpd']
   	'qcom,eliza-rpmhpd' is not one of ['qcom,msm8937-rpmpd']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.y=
aml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/rsc@17a00000/power-contro=
ller: failed to match any schema with compatible: ['qcom,eliza-rpmhpd']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: cpufreq@17d91000 (qcom,eliza-cpu=
freq-epss): compatible: 'oneOf' conditional failed, one must be fixed:
   	'qcom,eliza-cpufreq-epss' is not one of ['qcom,qcm2290-cpufreq-hw', 'qc=
om,qcs615-cpufreq-hw', 'qcom,sc7180-cpufreq-hw', 'qcom,sc8180x-cpufreq-hw',=
 'qcom,sdm670-cpufreq-hw', 'qcom,sdm845-cpufreq-hw', 'qcom,sm6115-cpufreq-h=
w', 'qcom,sm6350-cpufreq-hw', 'qcom,sm8150-cpufreq-hw']
   	'qcom,eliza-cpufreq-epss' is not one of ['qcom,milos-cpufreq-epss', 'qc=
om,qcs8300-cpufreq-epss', 'qcom,qdu1000-cpufreq-epss', 'qcom,sa8255p-cpufre=
q-epss', 'qcom,sa8775p-cpufreq-epss', 'qcom,sar2130p-cpufreq-epss', 'qcom,s=
c7280-cpufreq-epss', 'qcom,sc8280xp-cpufreq-epss', 'qcom,sdx75-cpufreq-epss=
', 'qcom,sm4450-cpufreq-epss', 'qcom,sm6375-cpufreq-epss', 'qcom,sm8250-cpu=
freq-epss', 'qcom,sm8350-cpufreq-epss', 'qcom,sm8450-cpufreq-epss', 'qcom,s=
m8550-cpufreq-epss', 'qcom,sm8650-cpufreq-epss']
   	'qcom,cpufreq-hw' was expected
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-qcom-hw.=
yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/cpufreq@17d91000: failed =
to match any schema with compatible: ['qcom,eliza-cpufreq-epss', 'qcom,cpuf=
req-epss']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/pinctrl@f100000: failed t=
o match any schema with compatible: ['qcom,eliza-tlmm']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
