Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561993;
	b=yk66PjNXWSm2UTphzzyLPFc6y3E1AGXDjxjWdDO3iRDjaC/H73iOos65KYiWARi6zPxI
	 aI2BgB0mdgMMWECEm+R5v4dx+bbrLmqxZNrDYVMbr2Q6hTnxkslM6c7eSXRzliZ6NVLA5
	 rVt0q98IvouAA4qJZFB4AlSacA/f/6+aJd4Ru18c3ZtpsxJX7TW/PmudJHFPoIkEIdoqN
	 L1mw+bN5IWphBpAYQdeAHrGnveq08LIwTMVW5dIq+4TG3Meq05Mn6ttQHbpKXBMQvmkYo
	 kjy9NLKRWtF4mo03ewQA1tdSbNjXm4/kX851JfqIDPTKtOhztZxe9bac/DIy1I8ZqQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2ZDidTnYCZQejwjRe/FfehGJrsblBmI8UZcxFatatmI=;
	b=0j90Ht5W1oOoHR+rfODUu3L6ptw3ggN08RfW6lT7XyGkimpCNea8OTkcXQ1+f7wozSO8
	 ql/vwZY20FM034pPiRohSAfia96/iFWhKLarCgbpsPOyhPdPQJQGpQvPrDcqhfc8OxJ1e
	 WeJ4WNnEc+EkOG/p3Auuv/4y5V1lgE2HJecAZ84C1fwMjUGW3VX+XZw5R5ote/LVIOFnf
	 aqJSFe3+fZImiRnJZv1GJV20hK6c7Eyw4EyGC/hgifRPblx89/zUNKrViJZWauCSEFHCp
	 g9zKzWfaUgBfTJd5ubGnoNdK/PPWTRpA5ucVJOAeerfHGfXmk+G1lKSuyPaVfjE1C7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S4RyTHxK;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4490B606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 23:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4490B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S4RyTHxK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795561993; x=1827097993;
  h=date:from:to:cc:subject:message-id;
  bh=dq2qt2Ja7tIxsf7eBr+kUpWZ2VWh6a/6pzPHeqwjhmM=;
  b=S4RyTHxKWXLYdCFHaToTC6ntazJ+WPYWVn7O8B55uPp21Br23mRaSlzN
   jh/R+gBE3OvqEi3d/i8FMXCx4vQ/zsUvanRpO+VHquej96HyAZ5GIteqT
   zzm0cgeJYXgSZ4YIW00EJi2C0qxm9T6NlifTIxRO14kuaMcpGfnPK4ZLD
   KCGytszeVXXphjQNZmmJeU/quws+lqtxQ2Iz1b367X76N5F5aQb0QO7Y8
   o69u44BsGhn9pYXctpFyWtZgTgjiFQLLOBCnnzIc4KEIxMsEkHq+mb874
   c0MPDMGmA00CFPv8DX0VcIN1ygxFOZeRtG29zBawapumPgv6itlf/WlUN
   A==;
X-CSE-ConnectionGUID: 329mVVkOSmSdl9b4KpwAnw==
X-CSE-MsgGUID: jvPPE3/gRD2BA66HwqXC5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4315055"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4315055"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 15:13:12 -0800
X-CSE-ConnectionGUID: 75f+AxYUSciRkv0FyKhF7g==
X-CSE-MsgGUID: FcNo1ypbSOeAamV4K++6iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12041131"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2026 15:13:10 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVzhE-000000005LB-1whs;
	Tue, 24 Nov 2026 23:13:08 +0000
Date: Wed, 25 Nov 2026 00:12:37 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152]
 arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@7678800 (qcom,qcs404-dwc3):
 interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
Message-ID: <20261125000735.mgw3Cqv1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Krishna,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   58f2449a557a99270b15eb9841152be2ead76472
commit: 19adfad8eb49cb77225f9208124cd0e9d134cb47 [152/152] arm64: dts: qcom: qcs404: Fix DTBS Check errors in usb controller nodes
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261125/20261125000735.mgw3Cqv1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125000735.mgw3Cqv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125000735.mgw3Cqv1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:421.27-424.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@1fe: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@1fe)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:431.27-434.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s5-p1@200: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s5-p2@200)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:451.27-454.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s7-p1@203: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s7-p2@203)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:471.27-474.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s9-p1@206: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p2@206)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:481.25-484.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@208: duplicate unit-address (also used in node /soc@0/qfprom@a4000/base1@208)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:481.25-484.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@208: duplicate unit-address (also used in node /soc@0/qfprom@a4000/base2@208)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:486.27-489.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/base1@208: duplicate unit-address (also used in node /soc@0/qfprom@a4000/base2@208)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:516.43-519.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/ivoltage3@22b: duplicate unit-address (also used in node /soc@0/qfprom@a4000/quot1@22b)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:532.31-535.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/ring1@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/ring2@228)
   arch/arm64/boot/dts/qcom/qcs404.dtsi:508.43-511.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/ivoltage1@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/ring3@229)
>> arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@7678800 (qcom,qcs404-dwc3): interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml
>> arch/arm64/boot/dts/qcom/qcs404-evb-1000.dtb: usb@79b8800 (qcom,qcs404-dwc3): interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
