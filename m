Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315811D12E7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724243253; cv=none; b=jysMYuy9CQicumpKlzj3B3auqHzOPQP5ljq4vwN001U21Du9+LScSQfniQfLjhTmX5ma5qjXW9930G/fjwKpRp85KpDNhsj5/Db5kBZm1yLjpaUuwFL+FvF+vmiPVI8B7tmCFDdedX3XsinwA71IPnViArDXMszAxzY7OhHG/ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724243253; c=relaxed/simple;
	bh=V/gGyfEATnWzMideh8LgCO5TCVklq7XSs1kaCITmh8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lmqvg6EewUr/YkjTYEJY+0B7B7c/cDPu4C+Ioqhyn9PPBauOGRwcNXzgkRC6zUZbYLPs2z0xewoEW4ALaCX+mJKEVGByl0UIoXTeqaCfoxeKt/yfN5isbwvIhUWgbxS5gPa+08uJ7ZWj7nmpvGfXEA1SPCKA7sJCZB9JjTcIA50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZO43iFiU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO43iFiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724243252; x=1755779252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V/gGyfEATnWzMideh8LgCO5TCVklq7XSs1kaCITmh8Q=;
  b=ZO43iFiU6PqvtJxmvYYfTOM6Rn86thE6rb1ESZmXDyHv13VMoutel6xg
   TNoojldimTG4qg/xdAEGvXCYYih6QhdtLXUDngDDfUyP8G5kU5vVZePe1
   BfMrjY4jzQsGPz+gOQvXotXxatWLU+FpmLgz28D4tq40j0pI607+J+bG7
   mSBQ99VuguLP0pBV95J4TQpr80l7VhZ1N/v7oAPtwxrzkRHoLbNEFMl5x
   eLatkMEU+caW4QamBV2oPYFPy5xgltbBUbc+bs2HHGFPs+qIXcCjyRIHU
   jgI+OTotBUVTPfZgiHXEp6gXWfKbimg+L+7vQGKb49eJhZs+fXu+6vbfl
   g==;
X-CSE-ConnectionGUID: /cOm011wRCCYGIl6excRGQ==
X-CSE-MsgGUID: e/r0woC1R9OIDw4RnRQIGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="34018366"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="34018366"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 05:27:32 -0700
X-CSE-ConnectionGUID: 2iDcYbTTQ564htikU011Lg==
X-CSE-MsgGUID: 5LpZ3QuJSKqMPn257errbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="60791984"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2024 05:27:30 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgkQy-000BLC-19;
	Wed, 21 Aug 2024 12:27:28 +0000
Date: Wed, 21 Aug 2024 20:26:54 +0800
From: kernel test robot <lkp@intel.com>
To: Duy Nguyen <duy.nguyen.rh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 5282/5728]
 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: can@e6660000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408212006.6zuTG538-lkp@intel.com>
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
commit: b3749d434ea48cca473afd440771f048d0860a2e [5282/5728] arm64: dts: renesas: r8a779h0: Add CAN-FD node
config: arm64-randconfig-052-20240821 (https://download.01.org/0day-ci/archive/20240821/202408212006.6zuTG538-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408212006.6zuTG538-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408212006.6zuTG538-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1055.12-1065.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1083.12-1093.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1111.12-1121.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1139.12-1149.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1167.12-1177.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1195.12-1205.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1223.12-1233.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1251.12-1261.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1828.12-1838.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: can@e6660000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'renesas,r8a779h0-canfd' is not one of ['renesas,r8a774a1-canfd', 'renesas,r8a774b1-canfd', 'renesas,r8a774c0-canfd', 'renesas,r8a774e1-canfd', 'renesas,r8a7795-canfd', 'renesas,r8a7796-canfd', 'renesas,r8a77961-canfd', 'renesas,r8a77965-canfd', 'renesas,r8a77970-canfd', 'renesas,r8a77980-canfd', 'renesas,r8a77990-canfd', 'renesas,r8a77995-canfd']
   	'renesas,r8a779h0-canfd' is not one of ['renesas,r8a779a0-canfd', 'renesas,r8a779g0-canfd']
   	'renesas,r8a779h0-canfd' is not one of ['renesas,r9a07g043-canfd', 'renesas,r9a07g044-canfd', 'renesas,r9a07g054-canfd']
   	'renesas,rcar-gen3-canfd' was expected
   	'renesas,rzg2l-canfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e30000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
   arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dtb: pwm@e6e31000: compatible:0: 'renesas,pwm-r8a779h0' is not one of ['renesas,pwm-r8a7742', 'renesas,pwm-r8a7743', 'renesas,pwm-r8a7744', 'renesas,pwm-r8a7745', 'renesas,pwm-r8a77470', 'renesas,pwm-r8a774a1', 'renesas,pwm-r8a774b1', 'renesas,pwm-r8a774c0', 'renesas,pwm-r8a774e1', 'renesas,pwm-r8a7778', 'renesas,pwm-r8a7779', 'renesas,pwm-r8a7790', 'renesas,pwm-r8a7791', 'renesas,pwm-r8a7794', 'renesas,pwm-r8a7795', 'renesas,pwm-r8a7796', 'renesas,pwm-r8a77961', 'renesas,pwm-r8a77965', 'renesas,pwm-r8a77970', 'renesas,pwm-r8a77980', 'renesas,pwm-r8a77990', 'renesas,pwm-r8a77995', 'renesas,pwm-r8a779a0', 'renesas,pwm-r8a779g0']
   	from schema $id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
