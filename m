Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997101991A4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737408234; cv=none; b=A41i/p348BzojdHo3BMaFArKNXU+9qqSxSiDZmsuT+aHqXsPsRmEPrfOLhmaP+IjGu7jHQeazkW0hrMss8LPbUubWstyMy+gDG+BjznsGR6gm9zbILbjbOaz+n067PXhLctZQyZIqCvTBKy+Mz6vdhFybfdhbrx5wmMpGtnQGMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737408234; c=relaxed/simple;
	bh=wx6B7gpI5rQSiMAgWxjltfEiJsre3vQhi8a9Vv4cgUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tSwdONjnMYvgnZjbdikJkb5rbp2OeclN1bjX2nA4phuOLOZ3cfP7QRxgRpg0DKstM8NKBAPrr1arUmB7OO1cFkgyDLNrO4eFwz51CFh4pbiIgxleX969rRbqNZ9PyBTmCzTjcsm0k7OT10cPAKkmwKenrwAwFRSvNeRAAo81JEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jyhFdKpa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jyhFdKpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737408233; x=1768944233;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wx6B7gpI5rQSiMAgWxjltfEiJsre3vQhi8a9Vv4cgUk=;
  b=jyhFdKpaE4Ci1dlsh46x9WIOpbbjCQVKZP7faKVoGChZIII4qxjA5KV9
   s+r1cwpYCTUQANAYHS9FXj1mFHXIY+TESMN2zoR1xJ4/iUQu6DBAv0Yus
   eKPXhZSGGHroXfpFNB++yB5EDCfo8z7mB5kJFg8aiL0weG3KVhtnOn1mW
   kcfTv7jRvgB92dZJPNCFntiBj5FguMjOGHUSSfG8KJ3EKiua3TK7ODFlQ
   jWubuoB/niWJCuAE5MOMZReDZWgyseg0+SYtOvHXV5hZQ2nmq0Fcv//EY
   foksaQhRBXVkGsFDvyHSugzrqvR94RY+sq8MD4EZV3AauGh1hDvtWtnhS
   g==;
X-CSE-ConnectionGUID: vGg9PpSTS/ui8Q8Ca5g0tQ==
X-CSE-MsgGUID: ajC5vp18QhGjB6xu8vCy+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48475916"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="48475916"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 13:23:52 -0800
X-CSE-ConnectionGUID: z2jSh9QISEe/3JY2VreK3w==
X-CSE-MsgGUID: X28NuynZQf+jfVG7tuXKcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106434223"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2025 13:23:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZzFN-000Wz7-0P;
	Mon, 20 Jan 2025 21:23:49 +0000
Date: Tue, 21 Jan 2025 05:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9959/10024]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:4:
 'ref_clk' was expected
Message-ID: <202501210517.hTGOKm0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: 8903f94edcd028353e548ad7a1fbf1956700dc6c [9959/10024] Merge branch =
'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
config: arm64-randconfig-051-20250120 (https://download.01.org/0day-ci/arch=
ive/20250121/202501210517.hTGOKm0H-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc=
7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250121/202501210517.hTGOKm0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210517.hTGOKm0H-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/dma-controller@800000: =
failed to match any schema with compatible: ['qcom,qcs615-gpi-dma', 'qcom,s=
dm845-gpi-dma']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: dma-controller@a00000: compati=
ble: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-gpi-dma', 'qcom,sdm845-gpi-dma'] is too long
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm845-gpi-dma', 'qcom,sm635=
0-gpi-dma']
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,qcm2290-gpi-dma', 'qcom,qdu1=
000-gpi-dma', 'qcom,sar2130p-gpi-dma', 'qcom,sc7280-gpi-dma', 'qcom,sdx75-g=
pi-dma', 'qcom,sm6115-gpi-dma', 'qcom,sm6375-gpi-dma', 'qcom,sm8350-gpi-dma=
', 'qcom,sm8450-gpi-dma', 'qcom,sm8550-gpi-dma', 'qcom,sm8650-gpi-dma', 'qc=
om,x1e80100-gpi-dma']
   	'qcom,qcs615-gpi-dma' is not one of ['qcom,sdm670-gpi-dma', 'qcom,sm612=
5-gpi-dma', 'qcom,sm8150-gpi-dma', 'qcom,sm8250-gpi-dma']
   	'qcom,sm6350-gpi-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/dma-controller@a00000: =
failed to match any schema with compatible: ['qcom,qcs615-gpi-dma', 'qcom,s=
dm845-gpi-dma']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:4: =
'ref_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:5: =
'tx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:6: =
'rx_lane0_sync_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000: clock-names:7: =
'ice_core_clk' was expected
   	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: '#po=
wer-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$', 'pinc=
trl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.y=
aml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: spmi@c440000: Unevaluated prop=
erties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.=
yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: usb@a6f8800: compatible:0: 'qc=
om,qcs615-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'q=
com,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-=
dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom=
,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc=
3', 'qcom,qcs404-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8=
775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', '=
qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8=
280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3',=
 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3=
', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375=
-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,s=
m8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', =
'qcom,x1e80100-dwc3-mp']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/usb@a6f8800: failed to =
match any schema with compatible: ['qcom,qcs615-dwc3', 'qcom,dwc3']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: usb@a8f8800: compatible:0: 'qc=
om,qcs615-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'q=
com,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-=
dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,msm8953-dwc3', 'qcom=
,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc=
3', 'qcom,qcs404-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8=
775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', '=
qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8=
280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3',=
 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3=
', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375=
-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,s=
m8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3', =
'qcom,x1e80100-dwc3-mp']
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
