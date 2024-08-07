Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0964F22334
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723020018; cv=none; b=rSNyxe8iq33qYMjiBixxeeXGfxd3caPSiisZWnqALCKeUEyt0DsHkK9MuPL9XlWN8rW1FtC6XeqX4x7znZUbzbRMjuNOPnwGjnDXeVfIk0U0iC5UISJntDvYr7R58NIfEsGSeMdzTiDerQxqyGK4MnYYqTkJ8lSKII1waqjf8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723020018; c=relaxed/simple;
	bh=eGxqFOheFEDBZRT+ryYAWAHXRFo2vDZErhpOUSa37sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTM2l/+yNEaqP+XtqGresq4uyOLOqPSIy3GldwTXLYy3+spsW4pOywNYy/mCd58MYuK/I4k8uUt5giZZccaO08fv0/fC1fdwqpKe6tTupwD38VjYegNSx2nV37OfAUlXaxtzIp1Rt+S+LY40b34U8gBT6uByTu77D0Zyj6C5AHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaKtO+O7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaKtO+O7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723020015; x=1754556015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eGxqFOheFEDBZRT+ryYAWAHXRFo2vDZErhpOUSa37sw=;
  b=CaKtO+O7Q9e0h+VS0UBw+ul8L+f/bOS3aM4ytTW4OWuOpZOcGHBcOqLP
   okkmkcp6iHaML4kI/DgZfnGGR1gZQS1CixJ6regUuHlfYqgZBh2IC6e0N
   /0qIehS1aVSXvdAU/Z87xAuKaM17wfkkHwpGti8cpnu6EpUW5G2TR98kM
   /wPH0t8SKc7N7nWEchhyQqLdVKYIEwlCn6qu8DabG0S06fml5sPh14F/B
   qnUK3UJbvfgLsAgkeRw/bweLVp7zuQt24JpDwvpl6inmD5s78vhYesmVu
   QuOi+k4wmYsLoul6fgDtM3v9Hvsd+mVdlwYVlD+4IW6K0EnRULJ1f4a6/
   g==;
X-CSE-ConnectionGUID: MMHdwS2tQWaxTfZtsH7b/w==
X-CSE-MsgGUID: A/QaY15wS7GtEM/e/Cchlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21049553"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="21049553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 01:39:57 -0700
X-CSE-ConnectionGUID: YocajDd5R6uVSURNJoILLA==
X-CSE-MsgGUID: BxZCDZUWRPWM9gwnRteiiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56717228"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Aug 2024 01:39:55 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbcD3-0005Ey-1E;
	Wed, 07 Aug 2024 08:39:53 +0000
Date: Wed, 7 Aug 2024 16:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 3357/3555]
 arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: global-utilities@e2000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408071644.pf24FNtG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eec5d86d5bac6b3e972eb9c1898af3c08303c52d
commit: ad21e3840a88bc781572a82cb54473b54726d185 [3357/3555] dt-bindings: soc: fsl: Convert rcpm to yaml format
config: powerpc-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071644.pf24FNtG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071644.pf24FNtG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071644.pf24FNtG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: global-utilities@e2000: '#sleep-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5020-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5020-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p5020-serdes']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,eloplus-dma']
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: global-utilities@e2000: '#sleep-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p2041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p2041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p2041-serdes']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,eloplus-dma']
--
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: global-utilities@e2000: '#sleep-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p4080-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p4080-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p4080-serdes']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,eloplus-dma']
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000: '#sleep-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p2041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p2041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p2041-serdes']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,eloplus-dma']
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000: '#sleep-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p3041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p3041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p3041-serdes']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,eloplus-dma']
--
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: global-utilities@e2000: '#sleep-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p4080-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p4080-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p4080-serdes']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,eloplus-dma']
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000: '#sleep-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5020-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5020-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p5020-serdes']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,eloplus-dma']
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e2000: '#sleep-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5040-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5040-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p5040-serdes']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/dma@100300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/dma@100300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/dma@100300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/dma@100300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/dma@100300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/dma@101300: failed to match any schema with compatible: ['fsl,eloplus-dma']
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic', 'chrp,open-pic']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t2080-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t2080-sfp']
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t2080-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t2080-sfp']
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41800: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41a00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/msi@41c00: failed to match any schema with compatible: ['fsl,mpic-msi-v4.3']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t2080-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t2080-sfp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
