Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3994C3207
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718949212; cv=none; b=DcYD6Fw3cdzkjqXemgNTL4qOHvVxmgmtlkC0FK8T0VuLeI1yQb/QaJtfzAHZ985L/iLAs5dFOhlqzqCIW6ZiU+GHZrDIhgjW7w9qNOfyGd5N2ZujzN2QxU53DVPBFosGEH903yCvyY7XYQUGRcDJLTgxdYHOZ5R7P2tOL5WYs58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718949212; c=relaxed/simple;
	bh=M0ZRTR8SJLsrduh270WbDIYmq7tkRVuHWDNkZAOd/Go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAupYihBxME+MFM73yDDA6sgrafPRW8v0qrcdcPOUvT850DzADhHRuprWLm721CuEk+ZpAlZTPcitZoHI4fBTf7Pzpm+EcTVnUsSNTf3VMmEhuYTNC1O38qa2CCTI46/j4C/ysx2n3hnkhAe2lVE65tatGVce2yl1ma/Lhnj4Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVGwk/6l; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVGwk/6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718949210; x=1750485210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M0ZRTR8SJLsrduh270WbDIYmq7tkRVuHWDNkZAOd/Go=;
  b=dVGwk/6lBJcWepyLcICL5wtAltcJFQyNTeJd3Kso/gsD07CbzFsZMpSL
   W9UWKAzukI1cSzQxcmdr1DDTkbF7Jf99P/6mZ+B631ngUjso4tUhT9uiX
   Qp/KxdCPdsm1rZKoacrnrELPp5nrJxUAt2SWu4tDDW70wb9l0CcYJ8iCU
   2AbfvCV5IuYfI5JQlpHr3ygmtp8hxWFniKouRzygJ0quJtbY0yu7/Fo0V
   HhC6Vfr5KyRP5gtMlPXcQiXMxZkrcLrccCEYsuUaA7G69+5GNpYvsBIQz
   kxQgOPNIMq8MfXQaTy9ijzkLZd0hVATlehDdJdQVomS0fZyBlIFA1BBGl
   w==;
X-CSE-ConnectionGUID: TL3QZ8ayTgq2BSCNkc2/iw==
X-CSE-MsgGUID: mzBo2kCgSQOw+RrmvRfERA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="18876568"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="18876568"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 22:53:29 -0700
X-CSE-ConnectionGUID: OcOQDqRwQWCd2Gks1YnHDQ==
X-CSE-MsgGUID: 8TUQR6GOTICR8CjGSvKALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="43179734"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jun 2024 22:53:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKXDC-0008HG-1I;
	Fri, 21 Jun 2024 05:53:26 +0000
Date: Fri, 21 Jun 2024 13:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jmondi:imx8mp/iob-gitlab/v6.9/extensible-format-v2 63/74]
 arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb:
 interrupt-controller@32fc2000: 'power-domains' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202406211300.Ab5nSw6A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git imx8mp/iob-gitlab/v6.9/extensible-format-v2
head:   f62f073fd1bb1d244dc912e45fd8935dc8553e0b
commit: 8a7506f3be2ab7cbdae9ebe332e819f2be34f8d1 [63/74] Merge branch 'nxp/v6.9/hdmi' into nxp/v6.9/merge
config: arm64-randconfig-051-20240621 (https://download.01.org/0day-ci/archive/20240621/202406211300.Ab5nSw6A-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211300.Ab5nSw6A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211300.Ab5nSw6A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp.dtsi:1784.11-1795.7: Warning (graph_child_address): /soc@0/bus@32c00000/dsi@32e60000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx8mp-maivin.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,debounce-tol: b'\x00\x03' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,debounce-rep: b'\x00\x01' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: touch@0: ti,x-plate-ohms: size is 16, expected 32
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: /soc@0/bus@30800000/spba-bus@30800000/spi@30820000/touch@0: failed to match any schema with compatible: ['ti,tsc2046']
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: interrupt-controller@32fc2000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,irqsteer.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-dt8mcustomboard-v2.dtb: /extcon: failed to match any schema with compatible: ['linux,extcon-usb-gpio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
