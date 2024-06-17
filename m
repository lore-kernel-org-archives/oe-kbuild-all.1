Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AA3181B99
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 06:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604244; cv=none; b=HIqCoLd98XGNq+O/YP+eveDZ6EZAyapwjb5J2fRMJpjlDBHjCiddB8DXIU1Zq7QgEjliLYfCJACo5sPJLGFmVhH/t7B0NKN/6nGskDy5PKl5GXF96Hm4VIMRGK3Ny43DnUf8Cm4EJW44hrbzHbB+oiFAYU4HWWp4efWHNXB+bqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604244; c=relaxed/simple;
	bh=gFQzlfXbPhy3eaJ1CGLmAPB9tW/+ImFN04WdO7CXcu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sOH+NcGVQsz8fv+fqEnjAysXoceE4cSSXP42HQbwx+ExY8hw4LaX6UFRWyjeAaIgbDIHA93knHcaCB0A9ZJlPyFp33nYiIVShaMYdKqn7WiTDUyiLUX/mOVngwbcuFJ9lwRz3T1mJuF+ob87K+jg0cvusGCpStdzFgS7M0XEYxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2L06PaG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2L06PaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718604243; x=1750140243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gFQzlfXbPhy3eaJ1CGLmAPB9tW/+ImFN04WdO7CXcu0=;
  b=a2L06PaG8/cpLH0OiA7raHd32ZAOYIM4ozABqobe76pmm2twVPk1/Ssd
   rF6N65mfYoTSbA2GLLTpuYWGVXKuYRQIEMUuVs8wHdjkeAUgbmHhLpYDp
   tyN5W6H31folRJHUJ7CoXq/c6jyY1IzNgL13J8RcA7SDFIpby9zHwKGP0
   X5iKIhJJNP6XeM65nROFHz267Z50/rOtqpfK1G8nPkPsVrYQvRHgs1onM
   uURLtGrYW49VXmT9UMSjzMvTqOEYWO3SJeMmtBqxspzrRnhyHr2w2Bc/2
   Llbd0Lm+0EHctRM2y98FG+gWOb/XpgYMx5i4BDxGkMR5T2uhjqHgekLAo
   w==;
X-CSE-ConnectionGUID: JWGAoUiaS7qi/MLJfdXyCw==
X-CSE-MsgGUID: RmuZyWSaSxi3y+QqwWLbJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="12103516"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="12103516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 23:03:59 -0700
X-CSE-ConnectionGUID: YW76bUDPR9aoeoud4p5IVA==
X-CSE-MsgGUID: W4U+1g5PReGjPZzogHsV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41805143"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Jun 2024 23:03:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ5T9-0003s6-0T;
	Mon, 17 Jun 2024 06:03:55 +0000
Date: Mon, 17 Jun 2024 14:03:27 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Brnich <b-brnich@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 5/39]
 arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: video-codec@4210000:
 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202406171359.yRNMhBby-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   eeca5715c9a5b742423bd83ed587fac26268771c
commit: 5b0a1aef35118e4e68d811fc40c8789690e981a5 [5/39] arm64: dts: ti: k3-j721s2-main: SRAM Allocation for VPU
config: arm64-randconfig-051-20240616 (https://download.01.org/0day-ci/archive/20240617/202406171359.yRNMhBby-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171359.yRNMhBby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171359.yRNMhBby-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: video-codec@4210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: fixedregulator-dp0-pwr: 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
--
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: pinctrl@11c000: 'dp0-pins-default', 'main-i2c4-pins-default' do not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: video-codec@4210000: 'sram-size' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
