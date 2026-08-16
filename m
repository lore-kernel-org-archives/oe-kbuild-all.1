Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A293921DD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786899748; cv=none; b=ku2UNayRnAOQ14aO8oTGTd9xtDMRLugwtI3oqjslMIQrai1EzJxZbunmlMxJ05UufV3bmQRGLKmgsXeqgpu15DzSEAykZJPQBbUvW7F+GHpCEPgrhKjel+UeOcd0X2meM3ghqJC816U2RoiS74PdtzpFazl42V4I615fAkJRWys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786899748; c=relaxed/simple;
	bh=Fv744qg467usu3EsP/skg1tkSMkRZ5bb4ViQfeDEiIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pg/I82+ozad370gOl5Tvwu1mYprWhSvGjOJ6ZhrIaPF6upuGNueK3bGE545NjlU8rGMz0xRnkFMVXFQlMK77tCfYt92PD3dtOa7ch+CmwnH4YSGSCwLIQ9HUpGJFp3d0WZnfOxb4L39xponkhL4SiVrp10PD1QXULznqZ3bWQe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECwx109V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECwx109V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786899746; x=1818435746;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Fv744qg467usu3EsP/skg1tkSMkRZ5bb4ViQfeDEiIQ=;
  b=ECwx109V/oiNCIBVpuKymGjIrKbsp+dVbsX2A05TCqfX1+vB+73IH2LZ
   nuQo6Ujjz68djOT+d6Pm1o4iMJRQkwiJcmAPRS0eWMqv0cQTljjTykxre
   GH+mT6tc67MotoN4wX5euR9h4pTWsw1oq4D2FBonW4JEwfL5hs+nRNSrq
   Za9IdiSCAz4X2LQMtubDYTZYA391DM+MwuQOvZiQzNQchsoe4gmtUWsKA
   zCPTkjFRYeAB5jkPjLOf+MvHIo0PmtgmperxNIXiujm050bqJv6TzeIB3
   ZCjrOdxFsTFhHNzGrsrq/b4fUgQs2iRrnABVDkGB75+dC1pfslXUn4GAR
   g==;
X-CSE-ConnectionGUID: tj8aICFITvyRVhtx8qwNzA==
X-CSE-MsgGUID: 8pfJ9tXsRvOkYqyR5RsCUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="97734891"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="97734891"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 10:02:23 -0700
X-CSE-ConnectionGUID: 9tdzlkTiQ/Ct8kEzlQs3Iw==
X-CSE-MsgGUID: nBP5wMAyQrahUk4JoN2c7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="268196331"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2026 10:02:21 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wveFX-000000006c9-0M47;
	Sun, 16 Aug 2026 17:02:19 +0000
Date: Sun, 16 Aug 2026 19:02:00 +0200
From: kernel test robot <lkp@intel.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 13778/15435]
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: clock-controller@aaf0000
 (qcom,milos-videocc): 'power-domains' is a required property
Message-ID: <202608161837.VAe3uPIx-lkp@intel.com>
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
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: 87a346905e8f86b71e3a6550f91487c08bbbf8f2 [13778/15435] dt-bindings:=
 clock: qcom,milos-videocc: Add missing power-domains support
config: arm64-randconfig-2053-20260815 (https://download.01.org/0day-ci/arc=
hive/20260816/202608161837.VAe3uPIx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa=
9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260816/202608161837.VAe3uPIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161837.VAe3uPIx-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/milos.dtsi:391.11-395.4: Warning (unique_unit_a=
ddress_if_enabled): /memory@0: duplicate unit-address (also used in node /s=
oc@0)
   arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: efuse@221c8000 (qcom,m=
ilos-qfprom): compatible:0: 'qcom,milos-qfprom' is not one of ['qcom,apq806=
4-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-qfpr=
om', 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', '=
qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', 'qcom=
,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,msm89=
37-qfprom', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfp=
rom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', =
'qcom,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qcom,sa=
8775p-qfprom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-q=
fprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom',=
 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm=
6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfpr=
om', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', 'qco=
m,x1e80100-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
   arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: /soc@0/efuse@221c8000:=
 failed to match any schema with compatible: ['qcom,milos-qfprom', 'qcom,qf=
prom']
>> arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: clock-controller@aaf00=
00 (qcom,milos-videocc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-videocc=
.yaml
>> arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: clock-controller@aaf00=
00 (qcom,milos-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-videocc=
.yaml
   arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: clock-controller@adb00=
00 (qcom,milos-camcc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-camcc.y=
aml
   arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dtb: clock-controller@adb00=
00 (qcom,milos-camcc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-camcc.y=
aml
--
   arch/arm64/boot/dts/qcom/milos.dtsi:391.11-395.4: Warning (unique_unit_a=
ddress_if_enabled): /memory@0: duplicate unit-address (also used in node /s=
oc@0)
   arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: framebuffer@e39400=
00 (simple-framebuffer): 'dummy-panel', 'interconnects' do not match any of=
 the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/simple-framebuff=
er.yaml
   arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: /chosen/framebuffe=
r@e3940000/dummy-panel: failed to match any schema with compatible: ['boe,b=
f068mwm-td0']
   arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: efuse@221c8000 (qc=
om,milos-qfprom): compatible:0: 'qcom,milos-qfprom' is not one of ['qcom,ap=
q8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5018-qfprom', 'qcom,ipq5332-=
qfprom', 'qcom,ipq5424-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom=
', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,kaanapali-qfprom', '=
qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8917-qfprom', 'qcom,m=
sm8937-qfprom', 'qcom,msm8960-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976=
-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfpro=
m', 'qcom,qcs404-qfprom', 'qcom,qcs615-qfprom', 'qcom,qcs8300-qfprom', 'qco=
m,sa8775p-qfprom', 'qcom,sar2130p-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc72=
80-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfpr=
om', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qco=
m,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-=
qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom', 'qcom,sm8750-qfprom', =
'qcom,x1e80100-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml
   arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: /soc@0/efuse@221c8=
000: failed to match any schema with compatible: ['qcom,milos-qfprom', 'qco=
m,qfprom']
>> arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: clock-controller@a=
af0000 (qcom,milos-videocc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-videocc=
.yaml
>> arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: clock-controller@a=
af0000 (qcom,milos-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-videocc=
.yaml
   arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: clock-controller@a=
db0000 (qcom,milos-camcc): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-camcc.y=
aml
   arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dtb: clock-controller@a=
db0000 (qcom,milos-camcc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,milos-camcc.y=
aml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
