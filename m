Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295294;
	b=V5WhLBdOyJOaO2g6NyAlfWRK8NoXQBfeZMSsm5aKiHpEOMB5l4w9dxM259JnJUvJnYC9
	 9OKgaPDyeklkuCm6Zm4oFsfBlgBna/j369+1fPI2syCXa6UEpDbfvRqjH6LPYTO6immEg
	 Ouo+ln+GclLu5MwagCJAwh7Bhl6+sRQxAr7SigDdXdBZPD4LQOrVQSquY7dQtDwuO1icl
	 cg+Paaioag4cfWbAO9EnNNEd09U70I+uCIRIq0qOHjqvhRf5PsyM9ZfF8yrO5fmZ8Q9t2
	 4DYiSMv7JgAqiUJEgQQj583eNTcS/Qth2lE3VO4OFcvV5F5aXhist/9QPGNXYd4+6Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZD4AXvA2QfhuF6zWRzkeOJwZZQ3iQj30yq8PqbCuK/Y=;
	b=ZI23K5Oyzu8cC1paUCmSRb8mE3iBJlnONrfvydS3qCABQy2u2Ei+YQLeTXSa5EJLUCq+
	 pH92ChhqI9+fHmtF8hLMxU6XqYB916XMisuC6MkeMMSXHgYeLO6b3C9pyH3t16mo8AtTv
	 etdQcqshYkpnEaZYJV1y7W+27bUpv+WRe4I4SPFC8BNGz6/NFhKEl+cUxZGq1+uDZTGT8
	 qlHxQWkB2I4V3MzM/qta1HWuJjJ7o75kaxLwL11eibYzkXJlSapH/d5F1cxR26Ev+SVrO
	 fHv4kTBlr0TDT1vdUXP3RnBn9kfLZlveppCADcWQPN3zsjr5obg8Zv6Xaf2/k8tvChA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FdD3FlJP;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236A3606A320
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 21:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FdD3FlJP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795295292; x=1826831292;
  h=date:from:to:cc:subject:message-id;
  bh=LZjEdOW7rLJ/creouhrLOQwF9A4AlGm+8BjLIx7vsLY=;
  b=FdD3FlJPBYF1r/NWigCANiSFOroUdwA2fSfopb9kl2bV49i5Y80SZu8H
   s3HmEyws8tQo+rHG+xSDS8aaQ2+NmUcqqKLRF9whflDWHH3luhjBM4MYN
   QTjzr7pTYt8rGAeyNvUTAGGGq6MiQnJcGBKHw+hUA3f5o6H6tXpkSjYsf
   htObW5XJs6wfsaoUCdaxTu1QXsmh4tHoEdSNoE6sYKBjrKWfYzoxcwqnu
   IiCKTBvQIrjZ9DVaysWVe0Tyzw4XhT8eLxMJ63ffrn71j08aSfLUzgQ2X
   Mhw8f/K9F87j6kFvRva/+hOLQ8geKU2vaz/QOfbrFuyERbHjyAp+g5iHz
   g==;
X-CSE-ConnectionGUID: hqPfuPsrQKK5BIYAR6kb+A==
X-CSE-MsgGUID: YyN5hlMLTdiJtBAjZXofEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4151159"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4151159"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 13:08:11 -0800
X-CSE-ConnectionGUID: iiRZdUvrSemFdriS29tE1w==
X-CSE-MsgGUID: 7tfcWbRPRv+WLF8x+ZovXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10753959"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Nov 2026 13:08:10 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUsJc-000000004NV-1FWc;
	Sat, 21 Nov 2026 21:08:08 +0000
Date: Sat, 21 Nov 2026 22:08:05 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 318/318]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000
 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71,
 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4],
 [0, 85, 4], [0, 140, 4]] is ...
Message-ID: <20261121220110.BTmqgYsm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   c29a11a6da74fe6ffbc7bc4bbcb21f2e579e814d
commit: c83255f3cf22d13c5b9736668cbe38a098fd6d5a [318/318] arm64: dts: allwinner: a523: Add missing GPIO interrupt
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121220110.BTmqgYsm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121220110.BTmqgYsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261121220110.BTmqgYsm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
