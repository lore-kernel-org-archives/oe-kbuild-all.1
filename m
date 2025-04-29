Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05C1876
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 03:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898067; cv=none; b=V2GeB6ncDmnD390Esv8EyjWOSmNFgzgZSBykeXo5tHdrjPmxGvIy7dngPtnKBmVK/imvRjQWMbeknRWLCbOZ5Jz+U9KTHhhqeWOjhehGH1EwcTW5/Oy6QAkKMMpkp7OUwAkc+Sc1zmx2sdBaesvOjuaq3b0pDPfUxm6HVEpOt2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898067; c=relaxed/simple;
	bh=PRlBfvU2kS0O9uO3ytsquYCyGtMg2R7kIW7J5gfVU1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYskGgw3oallQLaQD1lFRXK8emskj/dNG4gJQyej1m2ge70cueBon6CwFVcRJ1sDlMRF7CQsT3b54JsUcHBZOdjEJCpqDSAXLK6la/WdK+cIeGBQKk8FCGXGjCwW3VgfWMFJ7BLzNV2XByDkbIi+lSAduyTUj48nRPXUa480jjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ieCCqcFu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ieCCqcFu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745898065; x=1777434065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PRlBfvU2kS0O9uO3ytsquYCyGtMg2R7kIW7J5gfVU1c=;
  b=ieCCqcFuHR7ECp02QDB2IUQflbq9PrRGy9bs34N+KDIc2PWCSmltM00W
   oCDv7Zozmaa3A57AN8v33BfBKBGy5SXxzg1QemmCQbibOmW/2Wpg4BUb1
   IYi45GzIHdzAXiQsyQnMnip1xMPpRW63uZQ8Mdmg1vfc0v2RSBWkqW5eU
   xrwJ+tFvmqT3yvUrSmyg6BCK5l29thHx6oHqEqZQX8Bhiq9rrphzg7vb2
   0njBqTHU9ASdv3uGBqvY4qqayJI1xNB9MVR5RtLJ9l3F/Y3+hwpOud5PM
   5K/4HbQ1OD2L9SB3zZUqpjdCVprvF6FhhRPH9xLVBTKHrPOfQVtKg/icT
   A==;
X-CSE-ConnectionGUID: j7neNKK+TG+c7Ah6TzANOQ==
X-CSE-MsgGUID: rq8EvGXuQgqCe4mSg/rrsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51324788"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="51324788"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 20:41:05 -0700
X-CSE-ConnectionGUID: egW1PkoVQTedEqjKcpaZ4Q==
X-CSE-MsgGUID: STydAm99Qbe6JFTc1LVbXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134220261"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Apr 2025 20:41:03 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9bq8-0000Rv-1Z;
	Tue, 29 Apr 2025 03:41:00 +0000
Date: Tue, 29 Apr 2025 11:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [linux-next:master 5286/6719]
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed00000
 (renesas,r8a779a0-isp): 'clock-names', 'interrupt-names', 'reg-names',
 'renesas,vspx', 'reset-names' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202504291136.txT8UKg3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33035b665157558254b3c21c3f049fd728e72368
commit: 02e95521f337f98dd344f1e79a962b43a2e9dd5a [5286/6719] arm64: dts: renesas: r8a779a0: Add ISP core function block
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291136.txT8UKg3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291136.txT8UKg3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291136.txT8UKg3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1196.12-1206.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1225.12-1235.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1254.12-1264.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1283.12-1293.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1312.12-1322.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1341.12-1351.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1370.12-1380.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:1399.12-1409.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2609.12-2619.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779a0.dtsi:2791.12-2801.7: Warning (graph_child_address): /soc/isp@fed30000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed00000 (renesas,r8a779a0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed00000 (renesas,r8a779a0-isp): clocks: [[3, 1, 612], [3, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed00000 (renesas,r8a779a0-isp): interrupts: [[0, 152, 4], [0, 153, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed00000 (renesas,r8a779a0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed00000 (renesas,r8a779a0-isp): resets: [[3, 612], [3, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed20000 (renesas,r8a779a0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed20000 (renesas,r8a779a0-isp): clocks: [[3, 1, 613], [3, 1, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed20000 (renesas,r8a779a0-isp): interrupts: [[0, 154, 4], [0, 155, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed20000 (renesas,r8a779a0-isp): reg: [[0, 4275175424, 0, 65536], [0, 4276092928, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed20000 (renesas,r8a779a0-isp): resets: [[3, 613], [3, 17]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed30000 (renesas,r8a779a0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed30000 (renesas,r8a779a0-isp): clocks: [[3, 1, 614], [3, 1, 18]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed30000 (renesas,r8a779a0-isp): interrupts: [[0, 156, 4], [0, 157, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed30000 (renesas,r8a779a0-isp): reg: [[0, 4275240960, 0, 65536], [0, 4277141504, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed30000 (renesas,r8a779a0-isp): resets: [[3, 614], [3, 18]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed40000 (renesas,r8a779a0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed40000 (renesas,r8a779a0-isp): clocks: [[3, 1, 615], [3, 1, 19]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed40000 (renesas,r8a779a0-isp): interrupts: [[0, 158, 4], [0, 159, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed40000 (renesas,r8a779a0-isp): reg: [[0, 4275306496, 0, 65536], [0, 4265607168, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: isp@fed40000 (renesas,r8a779a0-isp): resets: [[3, 615], [3, 19]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
