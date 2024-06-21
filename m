Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3109982D72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 11:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968144; cv=none; b=FU4KSqPgT38K8AQN4OE8+sAA2/rGwQH70TEoriAQkhpnmmSV2mV9pYHEAcHAT04z2gtbzBoVDyrzCAYWMYm/WHgOpdeAAhP51itXqx4T0sYSzaTB/5zr/LTw6fepgno+S1kpKPCTj+uI+Nnmw+W4bvtxqTcG/drdC+UIaMIDWN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968144; c=relaxed/simple;
	bh=yDYlFE01p1NJetOUbhfKrAtq9Jp++NBdF0O5R0O638c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dDX8Yq5nrkwQJDrRbrpbZdDf1A2a8BoHR+bkpcOlF2/XQ/FherKcSZxPKemZSQV/mAiqBSifGtQwa13Rt7gR1yXJRvAzNC0KzTfkTrA+CsuhBoa37AtNhnNhK4z6mNqQ2DFHy7vplrRzm3iAYzDnqL+lbApqLAcJwPfwPBP0IWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YauWFvi+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YauWFvi+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718968142; x=1750504142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDYlFE01p1NJetOUbhfKrAtq9Jp++NBdF0O5R0O638c=;
  b=YauWFvi+BZpoEgXie5NtjNr1wBhfrlpyTyZnUDlOI4Uuz5rgB9zAV18J
   aeV2b7d3cxhlqJ0DpdKHWt6WvnmsM7bsbo07e/MKScEyxblcai6yMOhmV
   kNAKEmkFTwM28qsfNtCQI4NcQp/eYFrnkwE80OFVLjG8BIsM8GdWww0gN
   hiP9XGFcq/FwH6t1O2ZeKp9ZSwgmmyJeJFR4nSzCRTbehiyo/KDKmbmly
   QK9joeM1CDilD2AIbFB6nt+XBb6MuhtpDepMXn1eAGN21JWRRW4cmK+pr
   MXfMs2jIdSuuU57lpPXMISJRkyBOQkOwRn1fm+YImFLuTVktZV7HBurUE
   A==;
X-CSE-ConnectionGUID: V/WKrk77SNmPYNc8AeVqbA==
X-CSE-MsgGUID: 2Xd0v22mSPKzZmheZByC/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="38518580"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="38518580"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 04:09:02 -0700
X-CSE-ConnectionGUID: lOAsTjorQsSlofnMJsJLPQ==
X-CSE-MsgGUID: 27Fw1+9PSK6WsTt5K4U9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="42653619"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Jun 2024 04:08:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKc8X-0008UI-2t;
	Fri, 21 Jun 2024 11:08:57 +0000
Date: Fri, 21 Jun 2024 19:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 5982/9999]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning
 (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has
 single child node 'endpoint@0', #address-cells/#size-cells are not necessary
Message-ID: <202406211935.SB0iWrcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: b43409d51c992069a74741fea9b6b20ab1154b2a [5982/9999] arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240621/202406211935.SB0iWrcw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211935.SB0iWrcw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211935.SB0iWrcw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
