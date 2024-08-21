Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17DC1B3B28
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724254908; cv=none; b=YIWrca5NIvUJBVh0Q6j9NRqH4KixMSmEGNw/c2pLmiAjB4EUUqM3nDsAVCahy23xd7dya/pW2O3jUQZAzv8u4Yxg1ZI8wO7ftK0qoDnifEtpad9ZpclT8DaLwFBjiQZp3KXHqpfEnlXHDc6In0aZT1RJeUEWdDtkhYS448SW+YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724254908; c=relaxed/simple;
	bh=b7+WM/e7Qk/htl0z5S+zFjrnsX3grP6QABX2rabmtc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jWV35P3MTex363tPEobDy/RYovNeKYC8ONpdMTAg1+fSmW8HIgqDhQzC2NEtTeJAM5nHZDCs7PrdGzID2AAyMDHacpv9e2oelvLeEQRB3M8Qa9uH74gQKpkzihlYVtOPkFcj2Unn+9DZxtmbNqhFiNHNKXj0Gp+GgTEZNJeAsvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krTONw4i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krTONw4i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724254906; x=1755790906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7+WM/e7Qk/htl0z5S+zFjrnsX3grP6QABX2rabmtc4=;
  b=krTONw4inCoVLXgOA6w3jnBsly08qEFvDuet+T8T1Fb8fxIKmr82vP9H
   eFBc2PONHda5N5Igd5Lq52J3fLFyQX5/S/mAyN5swjFBN4rrXst67QsTY
   /KifY6aoAa6fjH01Hs7+2VA83TqEJAlwY8bB1rraa4gZvLLrYz+Au1BM6
   0KbCSR7q3rB9X3fZsIOTXXkK/CFGimP05kJhVgtPBRP9p/XEnhP4l8nDe
   RYwQDk8x/AGfGKHVT8GJVDM56S/zOpCsOWroF1YP660Je5GG4nzM0HwOf
   8kQ5/sFXM4GZ92rpaN31xZtX5vqI7nVEb/yaOIXxd9nDZn4YZLpHCMsCl
   w==;
X-CSE-ConnectionGUID: lkxjOjgbT3q8vblsdaPzzQ==
X-CSE-MsgGUID: KYzeBGU6RqiAtBddJH+7aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22788195"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22788195"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 08:41:43 -0700
X-CSE-ConnectionGUID: 6pGZOfRITwGU9Fg2Iz4LWA==
X-CSE-MsgGUID: A9JvGiOaRaCJF446c0pbLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61657294"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2024 08:41:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgnSt-000Bde-15;
	Wed, 21 Aug 2024 15:41:39 +0000
Date: Wed, 21 Aug 2024 23:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5283/5728]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: can@e6660000:
 Unevaluated properties are not allowed ('compatible' was unexpected)
Message-ID: <202408212339.y4GvwU2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eb8c5ca373cbb018a84eb4db25c863302c9b6314
commit: ab7d885a33a7ef328a97ccae0d1340b68c3db9ad [5283/5728] arm64: dts: renesas: gray-hawk-single: Add CAN-FD support
config: arm64-randconfig-052-20240821 (https://download.01.org/0day-ci/archive/20240821/202408212339.y4GvwU2W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408212339.y4GvwU2W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408212339.y4GvwU2W-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1223.12-1233.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1251.12-1261.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1828.12-1838.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: can@e6660000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,r8a779h0-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r8a779h0-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd']
   	'renesas,r8a779h0-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: can@e6660000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e30000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e31000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e32000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e33000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e34000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
