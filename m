Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599773C9EDB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 15:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934344; cv=none; b=ss8IPULmV8u4LrwZ8aFfmInLVwqFshvPWGtTN1ZuNtxzCEWyBX1f3Kpq6l61QYQxijnAxcuo6O7QmgsTa2M2C0bBAlFn9nuUQBoumcZ1P1Cp0MCfkFgmlF0hyxjEQYwXzjn+w+IBfy28vykiJAMchIQ1d6tDNPnaOC4FLHrdOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934344; c=relaxed/simple;
	bh=k9O5osfoxEO3/ZTOThv+eWvMnROtNC9yPnyp0MMMwp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZV8xr9LHD6EeUjdHMiF72bHAFyS837mGbWLpyP4/q/SUi301+5/O7AZge2nxPyIFE9lPqNoO6EtD5XdDcCcdGN1nV1WGmZFniCHWZnr0ZXjyK1Iab61D9qiEu7OvL3xvh3EbwDIRXzSAJ6YZX3DP+LyeKb4uJDpAO23o11KhRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuLVKkyy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuLVKkyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773934343; x=1805470343;
  h=date:from:to:cc:subject:message-id;
  bh=k9O5osfoxEO3/ZTOThv+eWvMnROtNC9yPnyp0MMMwp4=;
  b=DuLVKkyy7qZxql1hZkQdncsrdGAm3IHGqQW93NFnPBNp7uKjKYw7Xnf7
   T88JhpR4/6bWIlQjr3nVhmgAR7Syw/NcyZh/yyb4zWu+Ogsemm2nryEwx
   1VIe3nS7Tp7RjDTrfQNGCxp8j0hVWD/J65wM2gO1YIcOF5P8fFci3Nqwy
   BaIanOH2PdCYiEM8Pv2Tnx7ORpeBEdmoM5/BgwQyw3jLaUgwVupt96lOE
   PXKojLQFoHB1P2tu/GzJxY3L1WkxikZBiQnCa9/yscuCaROvhVqqS7Ad7
   j7tLWUf1DGxukt+zl+5eZw/vB8ojcLQNyfChHTnVmjsQRSGNE2Z/SZbCT
   g==;
X-CSE-ConnectionGUID: 8UKtoWRuQq2/ZHv8yXWH/Q==
X-CSE-MsgGUID: oFb20ivIQAmfqP4we3TiKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="78867859"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78867859"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 08:32:23 -0700
X-CSE-ConnectionGUID: FTEobVfBTz286YIEztNhhQ==
X-CSE-MsgGUID: TdA+RalMQ/2ZdvtWcx3AdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223211632"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 08:32:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3FMB-000000004rZ-0g7a;
	Thu, 19 Mar 2026 15:32:19 +0000
Date: Thu, 19 Mar 2026 16:32:01 +0100
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: oe-kbuild-all@lists.linux.dev, Drew Fustini <fustini@kernel.org>
Subject: [linux-next:master 7426/7683]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pvt@fffff4e000
 (moortec,mr75203): moortec,ts-coeff-g: 42740 is not a multiple of 100
Message-ID: <202603191622.FRTG85X4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b5d083a3ed1e2798396d5e491432e887da8d4a06
commit: 024102069a8068efdc28d4ee865c66fc631bafed [7426/7683] riscv: dts: thead: th1520: add coefficients to the PVT node
config: riscv-randconfig-2051-20260319 (https://download.01.org/0day-ci/archive/20260319/202603191622.FRTG85X4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603191622.FRTG85X4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191622.FRTG85X4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/hdmi@ffef540000: failed to match any schema with compatible: ['thead,th1520-dw-hdmi']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/display@ffef600000: failed to match any schema with compatible: ['thead,th1520-dc8200', 'verisilicon,dc']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/display@ffef600000: failed to match any schema with compatible: ['thead,th1520-dc8200', 'verisilicon,dc']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-g: 42740 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-j: -160 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml
--
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/hdmi@ffef540000: failed to match any schema with compatible: ['thead,th1520-dw-hdmi']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/display@ffef600000: failed to match any schema with compatible: ['thead,th1520-dc8200', 'verisilicon,dc']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/display@ffef600000: failed to match any schema with compatible: ['thead,th1520-dc8200', 'verisilicon,dc']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-g: 42740 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: pvt@fffff4e000 (moortec,mr75203): moortec,ts-coeff-j: -160 is not a multiple of 100
   	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
