Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACCD227EB9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754550241; cv=none; b=d4gedRzDCqy4TyBdFBrFfWoApvBwLcRLT5QgQj3xc1T91KD6E8miTzyU7mcNVzl1NWCvJb7wy0KTOh7EfNI3DGFK7jowj85VQS4cZC6fdmXnlJnzOL2zELjYsP6sE8MIPBGVNF6JlIIE5q6XRpP7gbFoNAKpVeP8aA/yIa7B5+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754550241; c=relaxed/simple;
	bh=krPkD2i27IJmpIMoYdZTg+2zO9i4j/JhbmiYfPiT/uY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TzOSB7sRGu6+myeBIdItgNsQeht7X9uHYUAJatDhkSYElZwd5WiQJITOvItgcHjpEd6WMpj8SDGwULaQmhd9rZ8fGfpKjily+yausPP7p0uyjo/KBFAhnfhV3y2HrrQ/ocvxd/w85bT7sfFz3YiEZlYUmxRhrWwnoOytfBdaJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nxz8LdZY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nxz8LdZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754550240; x=1786086240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krPkD2i27IJmpIMoYdZTg+2zO9i4j/JhbmiYfPiT/uY=;
  b=Nxz8LdZYFwl4xiKX1dEds5zdBjK6JEXjipJZBVuAapc1yIeRoXuzHCYe
   kKGnU/aGX15vR8ISEMZEnTs7OCzfZhGccoxNkyvVTmLBa9za9WtmZTjm2
   4Ph37GK4cm7iq2U81lOosOubK0oDJs3cSvVJ9myVDObrB8/gmYJ5DF4HN
   mAl6HJo+WU11WimSO2Q6u5ccK2OM8qIxoNGi7eWV/R+DkDeKl+EbZf8Ap
   xAogkKJ8sV02GMJD6R45K6k7s0SoMMWB1I38YW8XCKPEMwd4SXhCP+ziD
   SsB2rUKJUyWiuGOmXh09Pog2n6Y48rSCd/TD0trtC10cHh7rEBwzSVbAp
   w==;
X-CSE-ConnectionGUID: 76Sk+UHbTSiCHc+T2YUKlg==
X-CSE-MsgGUID: GbGc+ecKQ36jdLCh3pvQMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60717094"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60717094"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 00:03:58 -0700
X-CSE-ConnectionGUID: UC6o7feXTdGl37AkB/z7lA==
X-CSE-MsgGUID: 2gP9jC3kTgmi7wTzFd1mNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202157230"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2025 00:03:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujuek-0002UY-1o;
	Thu, 07 Aug 2025 07:03:41 +0000
Date: Thu, 7 Aug 2025 15:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt-convert 110/801] Warning: Duplicate compatible
 "fsl,vf610-dcu" found in schemas matching "$id":
Message-ID: <202508071414.z6UIO9MM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 96ca512497b9e31aa9a38e7d4907cf865df943b7 [110/801] dt-bindings: display: Convert fsl,dcu to DT schema
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071414.z6UIO9MM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071414.z6UIO9MM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071414.z6UIO9MM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-nb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-nb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "marvell,armada-3700-periph-clock-sb" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock-sb.yaml#
   	http://devicetree.org/schemas/clock/marvell,armada-3700-periph-clock.yaml#
   Warning: Duplicate compatible "fsl,vf610-mscm-ir" found in schemas matching "$id":
   	http://devicetree.org/schemas/interrupt-controller/fsl,vf610-mscm-ir.yaml#
   	http://devicetree.org/schemas/arm/freescale/fsl,vf610-mscm-ir.yaml#
>> Warning: Duplicate compatible "fsl,vf610-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#
>> Warning: Duplicate compatible "fsl,ls1021a-dcu" found in schemas matching "$id":
   	http://devicetree.org/schemas/display/fsl,ls1021a-dcu.yaml#
   	http://devicetree.org/schemas/display/fsl,dcu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
