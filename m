Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF628C1E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 01:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733793528; cv=none; b=tGcax7nG597zMjMz2NlqCAzwpQq2L4yrtoI8Xmc1FdTkYW7JTMRA3AxE8TgBSrFxwtl8LtUAZfpijymEfaFh8jhmTrtweNiBjIuEZAwdd276+tt45ZS1o9CLjMD69Zn+48FjJN0iK6ASnMEuJ0QzxNImBUBpCI6xQqI78eDeh8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733793528; c=relaxed/simple;
	bh=n4UhF50/145esYl9VJhfVzUhxHxDDx9AMWjbXP+fh0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/WwbC+2ID+3v/+Q2gaqyqRa1p5Z4H3UpZ6lpKfCZiCdp0RLBWlz3GIGYj8Fr9/wd3C4wdeZAHwLadk7ynhpSfVTBKdb2S0SgktLis7to7ZZ3bXrRQ8OKENl1ZAuQ5HTFasNoFbMZb80zu3kzLWbz+/Wm5MOougVxzYhatwnx20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFWinR+f; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFWinR+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733793526; x=1765329526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n4UhF50/145esYl9VJhfVzUhxHxDDx9AMWjbXP+fh0I=;
  b=LFWinR+fnoJtlD1sMSwIJWfCHLZxWgCVliW3UxOgbf/+McgViv/4qe83
   Pb1/Ca/qNdLDO/OohJGnE3tt4qtGUOgCje+zdH8IUHjFFR8g6Enir2W4T
   tZ6QUgMy95+JJR/IQJ2WiRO8y2ozRLXMKSDLCBKMje51eBLJNruHOiguC
   9pY0BinvC+iQ2fidS22WIBlMKwTAq4fizUDqN7iikAzWdCf8PEQtCYctT
   r/A7wz/fd2yiic/VpfXNkRZDVnkK1r4COv2EbqYkj5UMVGDFspHare3xl
   BhAPULNBMjviEzCLtcVJ1+5zKcIwcLSrn2FUvaANFhMZcVx8w1NwUqREd
   A==;
X-CSE-ConnectionGUID: qTBRTiGcQKqI5kwiFQQpCw==
X-CSE-MsgGUID: 0Ifw4hykTPSP43eLPqDmfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="38050723"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="38050723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 17:18:46 -0800
X-CSE-ConnectionGUID: nuCEm8/rSgKAr8StCbFY5w==
X-CSE-MsgGUID: gkHL8E8FSJSvK0Kn9ZXzKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="100059904"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Dec 2024 17:18:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKotf-0004zu-0F;
	Tue, 10 Dec 2024 01:18:43 +0000
Date: Tue, 10 Dec 2024 09:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 1314/2442]
 arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: compatible:0:
 'qcom,qcs8300-qfprom' is not one of ['qcom,apq8064-qfprom',
 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom',
 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq...
Message-ID: <202412100927.8XPXG6vU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d1486dca38afd08ca279ae94eb3a397f10737824
commit: 45d55e2da9bd10d24c4730b452b11a76dc3960b8 [1314/2442] arm64: dts: qcom: qcs8300: add base QCS8300 RIDE board
config: arm64-randconfig-051-20241204 (https://download.01.org/0day-ci/archive/20241210/202412100927.8XPXG6vU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100927.8XPXG6vU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100927.8XPXG6vU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: compatible:0: 'qcom,qcs8300-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/efuse@784000: failed to match any schema with compatible: ['qcom,qcs8300-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible:0: 'qcom,qcs8300-adsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs8300-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs8300-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: compatible:0: 'qcom,qcs8300-gpdsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: compatible: ['qcom,qcs8300-gpdsp-pas', 'qcom,sa8775p-gpdsp0-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@20c00000: failed to match any schema with compatible: ['qcom,qcs8300-gpdsp-pas', 'qcom,sa8775p-gpdsp0-pas']
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: compatible:0: 'qcom,qcs8300-cdsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: compatible: ['qcom,qcs8300-cdsp-pas', 'qcom,sa8775p-cdsp0-pas'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
>> arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@26300000: failed to match any schema with compatible: ['qcom,qcs8300-cdsp-pas', 'qcom,sa8775p-cdsp0-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
