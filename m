Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64413143866
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 09:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723627433; cv=none; b=jPxp7NxwQbEBWs+V5JSqCPsZg/51yh5kdOCvXrdrzv9w1xyAqiHbxfI6R2mNgaCvAv5KBBpFxCnSr5sQa61CpjBwH+E0SD5/t8lBoQaLn/8TSs6B6lCo8tO670DaP7Tncy/MBp30b+NvGRe/j2tmaqAIK36bdyD5UApbQ4W1NUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723627433; c=relaxed/simple;
	bh=fQAjtXfSQkCue3j5gTViOZDZ3G6fLQoWL7CkcssHiPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gyeOPoTUhOygUahZDvL6JfnR/C/qku2c+frJOERQJ9UXr6MQ6XRgs8bhCRiUkMPGNSk14n2WveY7mrL38oFEs8E7Pc6ErqFZtp2IA5OjsJ3+LmQwC7C7c1y9GRbyfJ/fGcOhLpPmH9J+1N9PXLThgsdAyoFDe4si1NCPZMHKj/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVy1OHOh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVy1OHOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723627431; x=1755163431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fQAjtXfSQkCue3j5gTViOZDZ3G6fLQoWL7CkcssHiPo=;
  b=LVy1OHOhy1JAHVK+ik2xRhsvm/dEA4PS/YvnfkNqlK+P+KOk1+n7dssj
   siOeSiDSJmZfKeEYcyfZkAsUMLvchgkI6RCI5NmQ2AafwJkpWsuVZlVdg
   CY/rTapI++YzEtK2bDvjN9GGNyafgBcHvQsEPgTjM2dUumfREg9doJQIH
   L0P067pzWv8by16YVWqdjtWBhkEtDs4LzPBhbQ5NgnjgHB2H5KZTbbDiz
   eT7lIZU2y364nHegitJ2cV5pDRvomR60wF1G8R24kp8v8VugJ71B9UT3E
   T9WQPfMrHP7OfpImSHn8dnKRCAGmHDtrypihluxhkLFcUofk+kRQqz6fP
   Q==;
X-CSE-ConnectionGUID: 3ntAfmZsT7C0B2D1v6xaaA==
X-CSE-MsgGUID: EC2jNpnvSsCk3eVcjjecLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="25695206"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="25695206"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 02:23:44 -0700
X-CSE-ConnectionGUID: HISNR+H8RFaQfu0gzFdjGA==
X-CSE-MsgGUID: L/QebypXQLu03UJWnlq+GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="58590170"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Aug 2024 02:23:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seAEF-0001XG-1l;
	Wed, 14 Aug 2024 09:23:39 +0000
Date: Wed, 14 Aug 2024 17:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Fabio Estevam <festevam@denx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [linux-next:master 4168/4667]
 arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: dma-controller@209000:
 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202408141718.3OlQiZ6Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
commit: ebfaa1a900c4e5cacb553eff60bb8aa15675e3f3 [4168/4667] ARM: dts: imx1/imx27: Use dma-controller as node name
config: arm-randconfig-052-20240814 (https://download.01.org/0day-ci/archive/20240814/202408141718.3OlQiZ6Q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141718.3OlQiZ6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141718.3OlQiZ6Q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: /aitc-interrupt-controller@223000: failed to match any schema with compatible: ['fsl,imx1-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: /aitc-interrupt-controller@223000: failed to match any schema with compatible: ['fsl,imx1-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: /soc/bus@200000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: dma-controller@209000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
   arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: /soc/bus@210000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: /soc/bus@210000/iomuxc@21c000: failed to match any schema with compatible: ['fsl,imx1-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: memory-controller@220000: flash@0,0:fsl,weim-cs-timing:0: 15872 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,imx-weim.yaml#
   arch/arm/boot/dts/nxp/imx/imx1-ads.dtb: memory-controller@220000: flash@0,0:fsl,weim-cs-timing:1: 2049 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,imx-weim.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: /aitc-interrupt-controller@223000: failed to match any schema with compatible: ['fsl,imx1-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: /aitc-interrupt-controller@223000: failed to match any schema with compatible: ['fsl,imx1-aitc', 'fsl,avic']
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: /soc/bus@200000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
>> arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: dma-controller@209000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,imx-dma.yaml#
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: /soc/bus@210000: failed to match any schema with compatible: ['fsl,aipi-bus', 'simple-bus']
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: /soc/bus@210000/iomuxc@21c000: failed to match any schema with compatible: ['fsl,imx1-iomuxc']
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: memory-controller@220000: flash@0,0:fsl,weim-cs-timing:0: 3345924 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,imx-weim.yaml#
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: memory-controller@220000: flash@0,0:fsl,weim-cs-timing:1: 3329 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,imx-weim.yaml#
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: memory-controller@220000: ethernet@4,c00000:fsl,weim-cs-timing:0: 50944 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,imx-weim.yaml#
   arch/arm/boot/dts/nxp/imx/imx1-apf9328.dtb: memory-controller@220000: ethernet@4,c00000:fsl,weim-cs-timing:1: 421072129 is not of type 'array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
