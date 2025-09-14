Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CF118FC97
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853163; cv=none; b=t/bWsw6lOeIG0e0X9BU4DFTfRRhcvVeAg8lK16mb5Mr/Nvey47dSpiz2ZoMDa2cGU6jEO53kkeBxbzGcBZHBm4mQb/XJemcp+7fENFaJyNSPN8bjZmLAyFdXBesSUmbmCcdzWw6Inp7IPOjAN5R4B9oKMNuyJewvxSXUUMe6rvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853163; c=relaxed/simple;
	bh=NlcXlFlP6RMwQUME39g2zfbR/SF0Hy2WARj5hL0MSOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gy/WVIa/rfw624L3W7Kl0ru+ROb8RHHsRIcmZu40tydSpFObXlimHPVZ6G+/2dvu9h/PDs+ZhpF+qxt8+cYPPlxAnPrmYgUUYKeN3ZcFlfP1rm9/E/RP5KLtGa/QFExWggVz6hqtUQcDLIW6BGt+7AWR6+mtd9Tp1n0iQK16gys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUOesFLw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUOesFLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757853161; x=1789389161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NlcXlFlP6RMwQUME39g2zfbR/SF0Hy2WARj5hL0MSOo=;
  b=JUOesFLwpmLSAWkQ4eYhzkww10nfNzbAYctMWM9n6HLuzg1uW+iJVg3c
   0bLSjP2DYNOWRXZcnY9lL9icAkFZLnLDrxHcuhfnhVDgETmmBgknGIjwR
   hxYTI/+WZM7Zc7XWCq1zhzI16MxxEW8UkKZ+E6CVcwXEk/dbBmEBHOoNX
   RxViWitv+NQQyPUnwaQgjYCvbTke0LttmoKV+Rx1u0x3I3IaeXXNxP/5L
   5TlwrBWxItMXB7zii65BruQD9XOBAr+2Pprif20i+T1oyVnLCBbvZitIu
   KmRO+lpY6E/af5eQ0Lq/fXHqFYBVyf9hrix33LnJuZkggQCCrKTh3hx/p
   A==;
X-CSE-ConnectionGUID: 8LpzRXz9Q7KZVCQx/lZe9w==
X-CSE-MsgGUID: EFvmTNLBS6CCOVBaydvDwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="70810977"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="70810977"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 05:32:40 -0700
X-CSE-ConnectionGUID: TBhMaOWETkChElLxTj5A1g==
X-CSE-MsgGUID: pNpQXJsCR2efP8DGwcbeWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="198102648"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2025 05:32:39 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxluH-000000001pJ-2Suo;
	Sun, 14 Sep 2025 12:32:37 +0000
Date: Sun, 14 Sep 2025 14:32:04 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0
 (pci17cb,1107): 'qcom,ath12k-calibration-variant' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202509141449.aQxpdcEY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8e86454f068ad3187350cd9fb81aca87249d02c1
commit: 8bc7cb73df8644423758c79d4504d501c8ef3854 [1/1] arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant
config: arm64-randconfig-2051-20250906 (https://download.01.org/0day-ci/archive/20250914/202509141449.aQxpdcEY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ffbd6162103041697ce7387029f321d3a466ca34)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509141449.aQxpdcEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509141449.aQxpdcEY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:3883.11-3893.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: pci@1bf8000 (qcom,pcie-x1e80100): Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'qcom,ath12k-calibration-variant' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddaon-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfacmn-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: wifi@0 (pci17cb,1107): 'vddrfa0p8-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
