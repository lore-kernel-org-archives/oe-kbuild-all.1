Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7997D202963
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jan 2026 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767342070; cv=none; b=h9k+3omwoJ5yt90atL/KemHNBPuOAScsx/6HIHNBQjm0TO6PruQTwjU3dLBHQHIC3XmXGjUDsR2i+Hfe8QbGBQqqEYO3j8affdB7mTg5JPzAnAOudodpAtO24vRRQTZ0lwkBb03q15y3OwcLZFbf31jLBk2xsLrKqNM0Z9eC5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767342070; c=relaxed/simple;
	bh=NAmcT4/CDAzr3uY/NbfuA10vXTWdQeAK/XZ9EqQeB+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ij0C07mjTLX41WpXcMsnRvWGhxp6RlzNj7owD6cpBJnmEDfT6hZFt/5CU/Qnvty9QvkaBkrwyou/icSZ7JgF73UXW1PuZdXv7Wxe6jpCVxAigl9Gq9ysSO2C9IDhvpioi8k6E0RO8SWUfsfmZqqwSYjCDuOY92aev/97xjW/7rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n61V4f6a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n61V4f6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767342069; x=1798878069;
  h=date:from:to:cc:subject:message-id;
  bh=NAmcT4/CDAzr3uY/NbfuA10vXTWdQeAK/XZ9EqQeB+I=;
  b=n61V4f6axgTll0iuUCN5mMv21VfvTDu/e+m0CVSQnRbsxaKRZeBr7ARl
   Qif+KJOFigqHUe2X8c2g1dK3X7fuGZ2KXN9PJ5wnahf00mKG8RQHiXeEG
   9AqTq+DJK6D9xKAlpFIt/FGozY/ZREq+VTAbh/M7I2YFNoZwRabARieTs
   J7Pd6dZ4XIWlIDyxCmODDQbFe7aHZQXtoJIIbOtcqT2cA5Y7e4WqDUNMW
   tR+cidRUv2dMWI8ZMBJ2Gu3C+yG+E1N5Nalj+JAx+5WGk5Paeb7Css9An
   Ci05E9cG8xfXwjRyvetDDScZZapNtHI3Wzs4EyhOU070HARqxF4n8hbbV
   Q==;
X-CSE-ConnectionGUID: K/j9E0xqS665o83C0B6jlA==
X-CSE-MsgGUID: dIZ8g2PYQm2F84pS1a/EZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68585116"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="68585116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 00:21:08 -0800
X-CSE-ConnectionGUID: 9Bb1A4rWT+K2JkS9LJ/9ug==
X-CSE-MsgGUID: BcZEknaYRX2oGxpYf/klKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="201529982"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 02 Jan 2026 00:21:05 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbaP9-000000000Ph-0kuk;
	Fri, 02 Jan 2026 08:21:03 +0000
Date: Fri, 02 Jan 2026 09:20:41 +0100
From: kernel test robot <lkp@intel.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [linux-next:master 2425/2671]
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: mailbox@1106000
 (qcom,kaanapali-ipcc): compatible:0: 'qcom,kaanapali-ipcc' is not one of
 ['qcom,milos-ipcc', 'qcom,qcs8300-ipcc', 'qcom,qdu1000-ipcc',
 'qcom,sa8255p-ipcc', 'qcom,sa8775p-ipcc', 'qcom,sar2130p-ipc...
Message-ID: <202601020909.vu2pdIfL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 0e31dcfefd21ed76ff1b2d05647cd34336ab9772 [2425/2671] arm64: dts: qcom: kaanapali: Add base QRD board
config: arm64-randconfig-2051-20260101 (https://download.01.org/0day-ci/archive/20260102/202601020909.vu2pdIfL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601020909.vu2pdIfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601020909.vu2pdIfL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: mailbox@1106000 (qcom,kaanapali-ipcc): compatible:0: 'qcom,kaanapali-ipcc' is not one of ['qcom,milos-ipcc', 'qcom,qcs8300-ipcc', 'qcom,qdu1000-ipcc', 'qcom,sa8255p-ipcc', 'qcom,sa8775p-ipcc', 'qcom,sar2130p-ipcc', 'qcom,sc7280-ipcc', 'qcom,sc8280xp-ipcc', 'qcom,sdx75-ipcc', 'qcom,sm6350-ipcc', 'qcom,sm6375-ipcc', 'qcom,sm8250-ipcc', 'qcom,sm8350-ipcc', 'qcom,sm8450-ipcc', 'qcom,sm8550-ipcc', 'qcom,sm8650-ipcc', 'qcom,sm8750-ipcc', 'qcom,x1e80100-ipcc']
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom-ipcc.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: /soc@0/mailbox@1106000: failed to match any schema with compatible: ['qcom,kaanapali-ipcc', 'qcom,ipcc']
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,kaanapali-qmp-gen3x2-pcie-phy']
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: interrupt-controller@b220000 (qcom,kaanapali-pdc): compatible:0: 'qcom,kaanapali-pdc' is not one of ['qcom,glymur-pdc', 'qcom,qcs615-pdc', 'qcom,qcs8300-pdc', 'qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,sm8750-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,kaanapali-pdc', 'qcom,pdc']
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: sram@14680000 (qcom,kaanapali-imem): pil-sram@94c:compatible: ['qcom,pil-reloc-info'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: /soc@0/sram@14680000: failed to match any schema with compatible: ['qcom,kaanapali-imem', 'mmio-sram']
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: mailbox@17610000 (qcom,kaanapali-cpucp-mbox): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,kaanapali-cpucp-mbox', 'qcom,x1e80100-cpucp-mbox'] is too long
   	'qcom,kaanapali-cpucp-mbox' is not one of ['qcom,glymur-cpucp-mbox']
   	'qcom,kaanapali-cpucp-mbox' is not one of ['qcom,x1e80100-cpucp-mbox']
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,cpucp-mbox.yaml
>> arch/arm64/boot/dts/qcom/kaanapali-qrd.dtb: /soc@0/mailbox@17610000: failed to match any schema with compatible: ['qcom,kaanapali-cpucp-mbox', 'qcom,x1e80100-cpucp-mbox']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
