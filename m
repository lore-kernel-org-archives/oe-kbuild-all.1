Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD467156861
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717651; cv=none; b=WQmkd3/3t66IKzjpev1VMPVjrRbWzQxcalTgdQ7JQTYyTYBfIGNXt+cAgUe95jaGBg9ZhujLkV5w2MxdOinMUvfNZfVHoVHS6PxbbEevarIVso+/DXHFGd7sY5uK3s1N8fdyzX7h4Uz59cjwysLy6yknsSX4ALh3kPJ5PA8gKb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717651; c=relaxed/simple;
	bh=a/qKYmIeDQCd8O4dWhg/UTtzkHlrx1/pm4fM1Ttm7ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRiHNLhFvezaK6VUh7/DIUtk0PQ4ajmBbkgwK5A6QmrzXi1OEsZGmqSAu8aDmX+en387/TtCqLfmTFKeSWpRbASypkoQfYxq8NAnC0bMjlKgp7q6ToZcihzZuwpRYAt4e+LHHjswGRPSRBYYVXCUeQFF+K2sQyYDKq7zvhjxAD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NburoyCB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NburoyCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717650; x=1765253650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/qKYmIeDQCd8O4dWhg/UTtzkHlrx1/pm4fM1Ttm7ys=;
  b=NburoyCBJJQwTrdZiT5dkLVR8GmjlXKON+AvygHkbxaPTTHtcUlSNNrC
   8xFRVYCmN+zttVlR41DDTUGniCgVWSr3fkj3q4eYgV94G1uapsTXUmpZp
   3pRaGdSCs12ZEf1NU7uEKQ9PeHOWwKuUj34b1FvX5KrNDMK/DTb5NdD5o
   Jkt+O2zRoO1cFffWDGWIe847DGvBwrzWu5xcfNP0bmnGVrlwEGb/wY7Vt
   f3pWu4PfsXrhz2Hz+fx05bwbpZohFZY2sMmAjyGdUyp4E5mR8fiut1fOH
   UeGoO7XQYLaUuV+4bGoW4NHsyQDtJMtqnsbgL0CdTVJIXY0ltvJ9Jfk27
   A==;
X-CSE-ConnectionGUID: OrgwZXNqS/C9oYROEObvnA==
X-CSE-MsgGUID: mL/ZrktVRH+zORDcTcW2fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51414332"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51414332"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:14:09 -0800
X-CSE-ConnectionGUID: sd5zlvQTRjeFyH2IB3/XNg==
X-CSE-MsgGUID: v33mCQ9BT4WA78vJOFSVSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94648612"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Dec 2024 20:14:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV9p-0003od-39;
	Mon, 09 Dec 2024 04:14:05 +0000
Date: Mon, 9 Dec 2024 12:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 53/81]
 Documentation/devicetree/bindings/iommu/pkvm,pviommu.yaml: ignoring, error
 parsing file
Message-ID: <202412071747.lQCQNv9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   189fb017ecf5ae2222e37e4461dc2369022a9b99
commit: 763fac409fa0424d3a5082112e1a308cc50d62cb [53/81] ANDROID: drivers: iommu: pviommu: Add basic driver structure
config: arm-randconfig-052-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071747.lQCQNv9m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071747.lQCQNv9m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071747.lQCQNv9m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iommu/pkvm,pviommu.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Warning: Duplicate compatible "nvidia,tegra186-ccplex-cluster" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
