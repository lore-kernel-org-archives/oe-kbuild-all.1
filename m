Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049031E82F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 03:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110528; cv=none; b=slz6m8x4f8dpUBrc+bP/bD8rg1/J6nHdsKkzQFvD+9ONSGDDxyt2nLNTrJVwsCB2AivmE5pynVlYQ+Q7t5xP03dK8nZ+K1BF3UeT3sB3jkmzrXXdIc3TpBSCZguqJgQOWmWWtfKZl0U5SzknGLxl4KyYOO0Np/VeU0sECG90zco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110528; c=relaxed/simple;
	bh=z7apzRb2mp0Ia4hWQ5Q+oLDSUl9pA9wwJZg4QU0H9p0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CKNXMi21JqXJ/ilpLYJwXlcBiswz85MER8mnvUdpG1EWwzL88M1Vn9vuoeQZ0ggACNhlsbBO+x4i51PcWheo94HesclYUiFhRoraPAoUnj0zQIW35jwVjLwblUZsQwdfBoAByTtErsZqnNweFbhfwzd/CHzgygqjAAd8WNjiAUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pgg4XqHE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pgg4XqHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780110526; x=1811646526;
  h=date:from:to:cc:subject:message-id;
  bh=z7apzRb2mp0Ia4hWQ5Q+oLDSUl9pA9wwJZg4QU0H9p0=;
  b=Pgg4XqHEbBPch4CmbyqonvgeGj8DE6BxrQiGnd9jRTP7gHywm1QbFkzI
   k5+CxQJ8kqRyKvzfpNP6s7m/G2Y+zWCu+ph7pb7bWUqbyeXsL/5q5xYI8
   bCCuXf6IfO5+p7z+3xLkLxcaaoPB7k/bV3j8aEFshtMj9rlSNwIDJD9Kp
   cNc9EWmok+xDmdz4Tt43wqfwnC4jjlYTlp7KXt78Of5XNhQ7PNcecKjWQ
   rF4zPllQJeiLa9vHT/jwUQZwtIm+MW+epdxJsglSHUAtTZakWQIPULmWc
   W+3ZkO7JL0mduhfzvaFznwxFTMEFFBeNykzYI6HzwOT01QabMK5wa2x17
   A==;
X-CSE-ConnectionGUID: uE+JNIhZQJGpkfGBeQDEbA==
X-CSE-MsgGUID: JFUObGIzTFSUAsYYXHD5dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="83539356"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="83539356"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 20:08:45 -0700
X-CSE-ConnectionGUID: sucSg2k9Q7WWFGFCtCsVWw==
X-CSE-MsgGUID: tlLj1wDUQgqySAcY2V0KAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="242224722"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 29 May 2026 20:08:44 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTA41-0000000012T-3xtP;
	Sat, 30 May 2026 03:08:41 +0000
Date: Sat, 30 May 2026 05:07:57 +0200
From: kernel test robot <lkp@intel.com>
To: Neil Cheng <neilcheng0417@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [linux-next:master 7889/9137]
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dtb:
 /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compatible:
 ['aspeed,ast2600-i3c-global', 'syscon']
Message-ID: <202605300551.ASbve3Ac-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7af91adc230aa99e23330ecf85bc9badd9780ad
commit: 12b7b2bff1d18b72fb965cd5e0a0f8c7787a21b4 [7889/9137] ARM: dts: aspeed: rainiera6: Add Meta Rainiera6 BMC
config: arm-randconfig-2054-20260528 (https://download.01.org/0day-ci/archive/20260530/202605300551.ASbve3Ac-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300551.ASbve3Ac-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300551.ASbve3Ac-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-rainiera6.dtb: /ahb/apb/bus@1e7a0000/syscon@0: failed to match any schema with compatible: ['aspeed,ast2600-i3c-global', 'syscon']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
