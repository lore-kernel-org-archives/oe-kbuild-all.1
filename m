Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157E8252284
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745948081; cv=none; b=SKZzrgoYRy9s0ocKAo1cbCTcd4woQWgDipJszMPPMtCunrY6+nuCb3bT4YzwRMzU/r7epnbmDc5DLTijn+EU6KAmPkgz32e2UKY120kc4pdsKebe4WahoBC7Gf/S5s4ABeeQwV2AGkcNHTN2OqkzbXUy4dT76sM7ajoSlFSOsaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745948081; c=relaxed/simple;
	bh=LD4rYR669vAzv85fVu5NE/1A0wSqPOw9NDWwhrgj8SU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QVAQslm63WyMv5A1LOl5L4xeA92itEfz1En+ZMPArZ42XQTUrUxpN0ceG25V9m8asqoBQMQ0JVF6W70lL4pm57STYbbPVti42uA2BmBXT/279yJL1m6z8EOd/+WSP3tw2fVpJ/UpDdzgIpQV1wFUtdlxNRyegU0shRohLrzazxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irBPijdR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irBPijdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745948080; x=1777484080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LD4rYR669vAzv85fVu5NE/1A0wSqPOw9NDWwhrgj8SU=;
  b=irBPijdRfmtJdzc5RwSZlQihftpT70PvK5vTcWO6fjW2HhP6YPMRE4GS
   ElUaEJH/pkLb495tlinQVBaiHLBVgZXSXQXLBKGxJYZMlIw1IlJuuYKp5
   IHfwK0TbznCtiiF1iR4Jc+fRgML51ROHn8PKQgNosyewWWyJ5SWCskrig
   pJi2BUHfUyZs10/jhTULy5q8/MmYtjXa3Y7ktMEarqRHViQOE7RLdVUZu
   tGobLBrrpEDJe3kkiapmwe5yHX8HmWNAN+joNq5fs7kFFYfr7Dp45AQr7
   rh6eDT4QqEiNoXWohBG7yk0SwLEI3CC8t53euLirgmChvrhArYxQ8cdlc
   g==;
X-CSE-ConnectionGUID: eBlpq31bSVuycCztUCWN9Q==
X-CSE-MsgGUID: KEYAGFiZTGKKLX0McSp57g==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="64998504"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="64998504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:34:38 -0700
X-CSE-ConnectionGUID: dFL8wmQKQzWfRTCUFqFqtQ==
X-CSE-MsgGUID: d6DHhbMjRX6q9toye+ZgWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133786107"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2025 10:34:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9oqj-0001oZ-24;
	Tue, 29 Apr 2025 17:34:29 +0000
Date: Wed, 30 Apr 2025 01:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [linux-next:master 5290/7105]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: isp@fed00000
 (renesas,r8a779h0-isp): 'clock-names', 'interrupt-names', 'reg-names',
 'renesas,vspx', 'reset-names' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202504300143.nxLyJNkY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: 9f78a29caacef6df5d6a43e85d1112e39cfa3b34 [5290/7105] arm64: dts: renesas: r8a779h0: Add ISP core function block
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300143.nxLyJNkY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300143.nxLyJNkY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300143.nxLyJNkY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1129.12-1139.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1158.12-1168.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1187.12-1197.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1216.12-1226.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1245.12-1255.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1274.12-1284.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1303.12-1313.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1332.12-1342.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1955.10-1965.6: Warning (graph_child_address): /soc/display@feb00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1989.12-1999.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: isp@fed00000 (renesas,r8a779h0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'renesas,vspx', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: isp@fed00000 (renesas,r8a779h0-isp): clocks: [[8, 1, 612], [8, 1, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: isp@fed00000 (renesas,r8a779h0-isp): interrupts: [[0, 473, 4], [0, 475, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: isp@fed00000 (renesas,r8a779h0-isp): reg: [[0, 4275044352, 0, 65536], [0, 4273995776, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: isp@fed00000 (renesas,r8a779h0-isp): resets: [[8, 612], [8, 16]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: isp@fed20000 (renesas,r8a779h0-isp): 'clock-names', 'interrupt-names', 'reg-names', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,isp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
