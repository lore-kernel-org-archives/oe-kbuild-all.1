Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261633976AC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772625404; cv=none; b=qD0ahBEA5c9XD80u8VaP9UCc5YXdgAqD/o+EEd7RYijdXNtHiu0IeXLOCdd6XQI052LdRAJoBrmMs4DKHjdlPAk6w5i6cB6KUywXng2FeMpCSHNy1LLygNT0MGNvhFiDbqKNon7Dmk0/25alC7eD8XoVktacEKGZnI+VwtKaw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772625404; c=relaxed/simple;
	bh=JtpKg+qENV034Nrz1sc4aIJOIBhEP0a0kIizUs4Qggo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rxga7l527A2c58sPNsRSRlfxGHLHtf8kt3JN7P8qPR7PBabGEyMP7TrMUeVTDBV0Ai9u3rZhyeFtacDGajQucyTKM3Foi2N1a60kSaUt9b2v1GTtqZQFn66YjNNhjhcfyyoyJy8z5V/yVTo4tYRaYVAPOMQPyopw64plQR/Wbys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF5ckJQW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LF5ckJQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772625391; x=1804161391;
  h=date:from:to:cc:subject:message-id;
  bh=JtpKg+qENV034Nrz1sc4aIJOIBhEP0a0kIizUs4Qggo=;
  b=LF5ckJQW5a+kj3oDuAhb2IGZBjBnMAzDiZCSo/sM3+bdhr2OX/egVL6x
   +8Lz4H77fnmfOVQBHz8Bp4WLJtje93VlUf2xFMJ4QdRwvhCYc28K0MDB+
   Hlo57w2HxijM7NDya7dl08TxY/0ldBCvlF+QenIhc/KpE/bEROvnnPU9L
   g+YHcKpL8uOwVt8MnL3fKr14jUgiIRNMhzNsin5QCBs246HoiTER1ujeK
   n32ATnZES4K+rgQDCTy4L1Ctpz9ioGzwAciTssDiV+x8eTo08q4TGoSEN
   Ga9WbSSVkFOad+fCe80W5qY0menhrzu1xEIon8uemK4o0ctK+NQN0Y52X
   w==;
X-CSE-ConnectionGUID: Ow+1tpH0TfaRF+HzWUIlGg==
X-CSE-MsgGUID: fbZIFXkgQJaPAgPJOhNBmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="72880315"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="72880315"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 03:56:30 -0800
X-CSE-ConnectionGUID: jKvR3/ATQemz5uLDcBMstA==
X-CSE-MsgGUID: vUGigkPWQBWLoXy43/1aiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="215275867"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 04 Mar 2026 03:56:28 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxkq2-000000001gD-0dWe;
	Wed, 04 Mar 2026 11:56:26 +0000
Date: Wed, 04 Mar 2026 12:56:22 +0100
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 1591/3431]
 arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@6af8800
 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
Message-ID: <202603041222.EC2MeSag-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
commit: db24f1fa263fdb473a23af461f82b4bc97af28b1 [1591/3431] arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c
config: arm64-randconfig-2051-20260304 (https://download.01.org/0day-ci/archive/20260304/202603041222.EC2MeSag-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041222.EC2MeSag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041222.EC2MeSag-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@6af8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: usb@76f8800 (qcom,msm8996-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/apq8096sg-db820c.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
