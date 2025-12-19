Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1D2D8360
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766129950; cv=none; b=ccA+SaesB6szO+Mq/FwI3Zoi8ZxK+yDkbCx17m9m/Qg98Vly1bhT80NxiNRF7/lPzUHjNblxoN5K9k+2HCDsGC8LSS5DIrhz6cCG15GLKReUW4kwM8TvhujPR4d9Gyq79TOY+r1EpXhfRixMLzB1HUpW51ZQuv8M6oqtKsP5FBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766129950; c=relaxed/simple;
	bh=CCQFlGHX/1tu3PoBx1hcdHQu/Xcw3Ga5MIIjYeNbdEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jH+RYeVY8OTLd8LJv8n92PBwYhNjiT4PhSfDQNHMfN3fTiuanyMyo+x9NY+iWMjtjv/dKismBOBH6QOFBpYb9MUDBf+ZKzislFCRdVSSUvsmp10vj3wTn2sqmO4Hz0OqN2I2McckeFayB7y5FI0fQRNmlFPZ8cGnpqumf+9fVf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vipxcj1G; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vipxcj1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766129949; x=1797665949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CCQFlGHX/1tu3PoBx1hcdHQu/Xcw3Ga5MIIjYeNbdEE=;
  b=Vipxcj1GQlKoXJYBTRSAWxd7PXnPg2pKmw1oZjwS3mhIQ7NFZW/kdPXL
   5e+stRXSqqR8DEtzfyKeGH7YezFOflYIA4KxUADPKOv0qUTFO5d1a2OD7
   9imLH//9b3FwjWqTTkE2BWMHMEcefJxh323Saj5EMw+boLDxZj3QZXXwc
   YPAuf3Ar6VIpgnAOzjodJSXH8YU4mNQG6NyPYbdXkJNUlpSXnSeL8ti3M
   hs47VEdU7IfYrFrecXFu1hIFnnk+E06y5LsnpBuiggjLwmaAFip397/Va
   jLnfad80IgQckNaa04ramzuWQdTReKSqL+CskVL3hDXdginD+JGrhqlRk
   Q==;
X-CSE-ConnectionGUID: goYlJZuSQcu+K4dawfCgzQ==
X-CSE-MsgGUID: yBhKzQERRN2qqP+blRl0BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67983767"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67983767"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 23:39:04 -0800
X-CSE-ConnectionGUID: AvSzdUCbRAGMfrbtTrucWA==
X-CSE-MsgGUID: MitJsm9bTP6lx6MkjcWVvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203186698"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 23:39:02 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWV4m-000000003Dt-06XS;
	Fri, 19 Dec 2025 07:39:00 +0000
Date: Fri, 19 Dec 2025 15:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: arch/xtensa/boot/boot-elf/bootstrap.S:68: Warning: value 0x1a0003000
 truncated to 0xa0003000
Message-ID: <202512191554.m2cac6Jp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 916aa36042db8ee230543ffe0d192f900e8b8c9f clocksource/drivers/timer-tegra186: Avoid 64-bit divide operation
date:   3 months ago
config: xtensa-randconfig-r111-20251215 (https://download.01.org/0day-ci/archive/20251219/202512191554.m2cac6Jp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191554.m2cac6Jp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191554.m2cac6Jp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/xtensa/boot/boot-elf/bootstrap.S: Assembler messages:
   arch/xtensa/boot/boot-elf/bootstrap.S:58: Error: invalid register 'atomctl' for 'wsr' instruction
>> arch/xtensa/boot/boot-elf/bootstrap.S:68: Warning: value 0x1a0003000 truncated to 0xa0003000


vim +68 arch/xtensa/boot/boot-elf/bootstrap.S

e85e335f8ff615 Max Filippov 2012-12-03  60  
e85e335f8ff615 Max Filippov 2012-12-03  61  	rsil    a0, XCHAL_DEBUGLEVEL-1
e85e335f8ff615 Max Filippov 2012-12-03  62  	rsync
4bedea94545165 Chris Zankel 2005-06-23  63  reset:
037602705109ec Max Filippov 2018-12-05  64  #if defined(CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX) && \
037602705109ec Max Filippov 2018-12-05  65  	XCHAL_HAVE_PTP_MMU && XCHAL_HAVE_SPANNING_WAY
037602705109ec Max Filippov 2018-12-05  66  	movi	a0, CONFIG_KERNEL_LOAD_ADDRESS
037602705109ec Max Filippov 2018-12-05  67  #else
037602705109ec Max Filippov 2018-12-05 @68  	movi	a0, KERNELOFFSET

:::::: The code at line 68 was first introduced by commit
:::::: 037602705109ec2ab96340bea93ad87daa3ac046 xtensa: don't use l32r opcode directly

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
