Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A7649E133
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 05:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105230; cv=none; b=J4j6IIlha7yme+Uq4HXnhbsPwH1+yUxshVQS2RPjjn6QrBdawZAp3RE1D6ROqdzj4eOcm+GOYUrH/lDzktyciwWLkvo0LJULI5XXguPrE1fJIVnldV+FbtMwt5rfSnAOl29R86i8RYN0PYwesv5BgHkRG8kRVCHSINHCQvdGK0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105230; c=relaxed/simple;
	bh=cOatsfusDvMfbaHLf+Q2iwt6dX01VnD7fOygDlxTgvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=As8l5Xii6UXDpCW+JkvMwX+GdRfQWBct9hc4GAQP7B/3WzheFYj8wCvCYNw62ZxgF9jjVWHvA2YZLtyTFvy9a3PbcR44tp72Cly7J3e/c6tXwxbvkkOQ/W492ow+w/UfOCljagt4Tc1kNPiMVpnKtasjjhwCwb+cwW+PEBgCPII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7o3ZJ3/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7o3ZJ3/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789105228; x=1820641228;
  h=date:from:to:cc:subject:message-id;
  bh=cOatsfusDvMfbaHLf+Q2iwt6dX01VnD7fOygDlxTgvo=;
  b=c7o3ZJ3/nesp8SjcMLQO9DKOFrKcZ8E9nLrGyK5UfaSii1gDTtvO1PDI
   QRDoGldxmvHrHFnWU6g5KXXyNu4cyIqqtlq91olo2KE3RxQTOl20EF45H
   ryvF+2MQKOpd2bawhrFFAXUC3wzNI3qeBJPlNOfy5X+6BABB0TGzNZhnQ
   VfP0CJSYMcjF0FIfAAn45DghQXVgOvQ3vnLHIot2jBfQgUTzQekZ+L5vT
   RNSaaMEhu4LbqcCJ0VejJJVPWrIkgUwrucZbzSYBPCOgLle3KpPK/gKRJ
   TxW8xp9yaUWGLVfo0Fjx0f6X8AP814OUWbnDOrSE/VEYpluK5uUEtP8tD
   w==;
X-CSE-ConnectionGUID: AXUBVmaoQkyb73Q49TwZ4Q==
X-CSE-MsgGUID: AASyz20nSqmZMgwvnz8p8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92077614"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="92077614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 22:40:27 -0700
X-CSE-ConnectionGUID: 3BpQB0iGQr2HX+EvQINY+g==
X-CSE-MsgGUID: hvncLZ/ORYWSjINYw3Pvsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="310088358"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 22:40:26 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4tzr-000000000eJ-3sKp;
	Fri, 11 Sep 2026 05:40:23 +0000
Date: Fri, 11 Sep 2026 07:40:09 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 7/7]
 arch/arm64/boot/dts/qcom/eliza-mtp.dtb: phy@88e3000
 (qcom,eliza-snps-eusb2-phy): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202609110706.oph4epRA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   121ea1ece9487e8deae20bc5a48794afa81424c3
commit: 88ddafb01ec05bb3cd1ffb51b740bfbc989ab955 [7/7] arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
config: arm64-randconfig-2054-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110706.oph4epRA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110706.oph4epRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110706.oph4epRA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['qcom,eliza-qce', 'qcom,sm8150-qce', 'qcom,qce'] is too long
   	'qcom,crypto-v5.1' was expected
   	'qcom,crypto-v5.4' was expected
   	'qcom,eliza-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
   	'qcom,eliza-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
   	'qcom,eliza-qce' is not one of ['qcom,kaanapali-qce', 'qcom,qcs615-qce', 'qcom,qcs8300-qce', 'qcom,sa8775p-qce', 'qcom,sc7280-qce', 'qcom,sm6350-qce', 'qcom,sm8250-qce', 'qcom,sm8350-qce', 'qcom,sm8450-qce', 'qcom,sm8550-qce', 'qcom,sm8650-qce', 'qcom,sm8750-qce', 'qcom,x1e80100-qce']
   	'qcom,qce' was expected
   	'qcom,ipq4019-qce' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/crypto@1dfa000: failed to match any schema with compatible: ['qcom,eliza-qce', 'qcom,sm8150-qce', 'qcom,qce']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: phy@88e3000 (qcom,eliza-snps-eusb2-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-snps-eusb2-phy', 'qcom,sm8550-snps-eusb2-phy'] is too long
   	'qcom,eliza-snps-eusb2-phy' is not one of ['qcom,milos-snps-eusb2-phy', 'qcom,sar2130p-snps-eusb2-phy', 'qcom,sdx75-snps-eusb2-phy', 'qcom,sm8650-snps-eusb2-phy', 'qcom,x1e80100-snps-eusb2-phy']
   	'qcom,sm8550-snps-eusb2-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,snps-eusb2-phy.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/phy@88e3000: failed to match any schema with compatible: ['qcom,eliza-snps-eusb2-phy', 'qcom,sm8550-snps-eusb2-phy']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: phy@88e8000 (qcom,eliza-qmp-usb3-dp-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-qmp-usb3-dp-phy', 'qcom,sm8650-qmp-usb3-dp-phy'] is too long
   	'qcom,eliza-qmp-usb3-dp-phy' is not one of ['qcom,kaanapali-qmp-usb3-dp-phy']
   	'qcom,eliza-qmp-usb3-dp-phy' is not one of ['qcom,glymur-qmp-usb3-dp-phy', 'qcom,sar2130p-qmp-usb3-dp-phy', 'qcom,sc7180-qmp-usb3-dp-phy', 'qcom,sc7280-qmp-usb3-dp-phy', 'qcom,sc8180x-qmp-usb3-dp-phy', 'qcom,sc8280xp-qmp-usb43dp-phy', 'qcom,sdm845-qmp-usb3-dp-phy', 'qcom,sm6350-qmp-usb3-dp-phy', 'qcom,sm8150-qmp-usb3-dp-phy', 'qcom,sm8250-qmp-usb3-dp-phy', 'qcom,sm8350-qmp-usb3-dp-phy', 'qcom,sm8450-qmp-usb3-dp-phy', 'qcom,sm8550-qmp-usb3-dp-phy', 'qcom,sm8650-qmp-usb3-dp-phy', 'qcom,sm8750-qmp-usb3-dp-phy', 'qcom,x1e80100-qmp-usb3-dp-phy']
   	'qcom,sm8750-qmp-usb3-dp-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/phy@88e8000: failed to match any schema with compatible: ['qcom,eliza-qmp-usb3-dp-phy', 'qcom,sm8650-qmp-usb3-dp-phy']
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: power-management@c300000 (qcom,eliza-aoss-qmp): compatible:0: 'qcom,eliza-aoss-qmp' is not one of ['qcom,glymur-aoss-qmp', 'qcom,kaanapali-aoss-qmp', 'qcom,milos-aoss-qmp', 'qcom,qcs615-aoss-qmp', 'qcom,qcs8300-aoss-qmp', 'qcom,qdu1000-aoss-qmp', 'qcom,sa8255p-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sar2130p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdx75-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm7150-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,sm8750-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml
   arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/power-management@c300000: failed to match any schema with compatible: ['qcom,eliza-aoss-qmp', 'qcom,aoss-qmp']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
