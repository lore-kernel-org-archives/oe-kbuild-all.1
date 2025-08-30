Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C1BC2FB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756542336; cv=none; b=K/J8/Cqzmo/MW6+WDHwPnJYzzJJKo7RI8w3PuLpJzu52HO308pIMhxlh0wAw7O3D3bif8VJ/oCm2W38zTRLwOZGLHpzeb9zSGydXcybQRBkyb/VieQO8S4fuZOPH6MRUaTvuKtQmUMuylX8lXc0fx7Q3+GVRvGxx0rF9bMmfKDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756542336; c=relaxed/simple;
	bh=GXci5abGEkhGLYPJl646wtelvlD2GLlP4vv0mqfMNLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pdD29e7OSNtZF3/c8jeOiuYAxgVnjYKtiJfezveKfIvkMuQ34/L7YIxHZ1p//IslsLW5qBX9wN1Iu0rhv4I/YhWapuXuzVFTN6qJQDeXVVKlL/Hy0aEXQBwSp9vsAQaVym1arP0MxaQROUUu+SaRGl0nSjfypMUijhVl3CNy/Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ogm6ubuA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ogm6ubuA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756542335; x=1788078335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GXci5abGEkhGLYPJl646wtelvlD2GLlP4vv0mqfMNLk=;
  b=Ogm6ubuAKJBzJMjPf7zg4U/keFdZTmnz9uD8Mznv7N88dUEh/oA4U0v1
   IyvZy0/SligY2Q+OPkcwwnsMoGN+HUd7qrj+brANGL5cbuhVhfGxfGxwI
   SAz3cyBFdebhf8Kqj3xp0MIqwgFdkWUhyGm8Ml7kxNBiG8snC4vr49NP3
   E7NUiExx6otS2w89QwFPZrxuW8o8K9xjX+F6hUbUNSBLZvo34WXcXjCIc
   3wm7Awbzsxz8ytcicfzFuLYX3ybDWLap4tSgtISvrb4D3uuHBoAmDPtGp
   25Hs7+OVkYWEExxxQENlL3SxtQBIAb8wkzWF2DKZi2pObjvPV4N/mH34D
   A==;
X-CSE-ConnectionGUID: ab9X9pxGRWGy5M0kY7MN3Q==
X-CSE-MsgGUID: C/yXXRkQR2io98ezWBQ3Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58744376"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58744376"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 01:25:34 -0700
X-CSE-ConnectionGUID: Un6i40duRe+1dKKdb7gTAg==
X-CSE-MsgGUID: 0WrkPXBGSkKbBMxlOO9+Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194224162"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 01:25:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usGtg-000VFf-1K;
	Sat, 30 Aug 2025 08:25:17 +0000
Date: Sat, 30 Aug 2025 16:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 11/14] kismet: WARNING: unmet direct dependencies
 detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
Message-ID: <202508301640.5Abt7QHs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   e542a0eb98d4a7e73f37ff7e0ef696c177e436c0
commit: 85446503d3e2b6e8345ed24531fcaab9748fb7b9 [11/14] m68k: implement a builtin devicetree for nonmmu
config: m68k-kismet-CONFIG_OF_EARLY_FLATTREE-CONFIG_BUILTIN_DTB-0-0 (https://download.01.org/0day-ci/archive/20250830/202508301640.5Abt7QHs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250830/202508301640.5Abt7QHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301640.5Abt7QHs-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE when selected by BUILTIN_DTB
   WARNING: unmet direct dependencies detected for OF_EARLY_FLATTREE
     Depends on [n]: OF [=n]
     Selected by [y]:
     - BUILTIN_DTB [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
