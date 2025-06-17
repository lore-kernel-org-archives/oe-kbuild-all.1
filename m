Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D5F28ECE3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150150; cv=none; b=fQsYDO4pW/LwkKGHhLJ9iaEc5QfNpLzcnxAKpUmGh+JcPtN21Rj2US5KoQbblAzrPi2NNMyZN/CgS6J8P8OeKQh71yKZAKOPRCw4i2079nTC9rXVXkCgki1GRrizjs92buJBiwFTXkQa+fGBd6Zjz5kGNqfwPhaTaLgPLC5VhS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150150; c=relaxed/simple;
	bh=DZlS6npnExfSHeDtOE6JehVZEPWYWl0TNAclVcRZSvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rka4zg87IYzEbBw/soqCzrB647pnlW5M/OKMcwN6GwcqUxn8atUeoWfWwFKQbD9EIeDB/vGuGdMF3Y3I89gjJzzJ4sBe8zK/bBB2YBEiJRq5BEY5lONuCBYCLiJNkuR7YmGhFrgnZkaKXCk3ER2pD0FxARej0qaI0pwccBWjjiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVW5seR/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVW5seR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750150149; x=1781686149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZlS6npnExfSHeDtOE6JehVZEPWYWl0TNAclVcRZSvA=;
  b=lVW5seR/3viDRiEEXcUcGJ87P5H3fORrI+iWwInDZkpSwqEzmJHS/v/c
   CXsa+6/DjibHmRcLs/WKBZNOgHA4QMauBcARLCSfZUkrQW39JiHPK43D3
   d+QHVqCQx/+7eo8kMtlew0pPSjjG6eJwRQlnMbZ0+034npQpsyIih7vQu
   GzUgE/ezO0dLM40T0keMgGGxgVoQvaOtcNEyaqSrlNVxWGXuaUtcTO6uO
   2v5TwIw6xhb7XbCvlkget+FuC6P8nQEX4FsTp2qPTjKGc3xYsskQipLpg
   FYtJoGt+HV8RpERNisrzlL9e2SLfkp8nvk36oNtgVu6ZmUQMkHavw1Qe4
   w==;
X-CSE-ConnectionGUID: WdNzWuV8RtOfbF7phnhbJg==
X-CSE-MsgGUID: PbBZSKiaRPuDOjSgvk07Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51540265"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="51540265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 01:49:08 -0700
X-CSE-ConnectionGUID: mHv/XHMBQSmhWRvleuJ7Cw==
X-CSE-MsgGUID: wZIANNJWRMqcEqsT/eH6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153670410"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2025 01:49:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRS09-000Fn2-0E;
	Tue, 17 Jun 2025 08:49:05 +0000
Date: Tue, 17 Jun 2025 16:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 102/102] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PLAT
Message-ID: <202506171648.BzBQves3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8cbb260f5584b8ea3d3941593c23a2ddc27fe701
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [102/102] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PLAT-0-0 (https://download.01.org/0day-ci/archive/20250617/202506171648.BzBQves3-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171648.BzBQves3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171648.BzBQves3-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
