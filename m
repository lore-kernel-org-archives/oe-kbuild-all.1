Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551BB139B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 00:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736641273; cv=none; b=ADehfkendTKjdedHlxuNTBZStSTC9/YGQfZPp0gSs35FGaIRYnZL4/7EeskF6KcBwV2RTYg09fTTthXVy43at1M5LQxYfMDVCefLNFvsPoDNbWBInL/bl3N8vFFCA4D3uiDLTN7pRCT4JUmFuOKRLC3So9XbsJNr2b4o6EWR0oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736641273; c=relaxed/simple;
	bh=qsBWWXVc+JuUT9lDrRjo9/eo5waaNaelbd/ip6eI9EU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HzFxwvP1LUwUB8XqsehgSUAS31TeBzA/nQ5ylBJohtFgXmwhmqWWJcScjhT9Rx8wqic9wHo1kwF/LP+yN1ULYT5KCtA937Ls1ls5lHARJZxREzAgq7wR1zpCcuGASwaMa/k3LkPXYwjS01VFlVKUY7SWHXumbuXIIb39iaS3U0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8XB6T42; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8XB6T42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736641271; x=1768177271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsBWWXVc+JuUT9lDrRjo9/eo5waaNaelbd/ip6eI9EU=;
  b=Y8XB6T42GbpU0V/4CiSfSjcnOtoOxqELlPoWrHY80f3jEEvC5MuQFxB4
   lK+2asAwTCVJayzXy1WwrllUmngQeMIQY4rTZnH1nji5QmiHBlMuU8Vk/
   UZH5PcGp8AQ3eeqvg4YyOWNG6+K76MbDyS2ZPaJk0fE+eLuFTUU+CABfG
   UlBHBZdv2laEkQA9FOvh3thSLTjORQ1sNAzKSOyjWM4Ny70ZiFkb4J4Ll
   XAG/7n6M5Oo9y6oGwS0nRcDGoEPRPwlrGKeM/28K0/p05mHqFuxCDtbgd
   FiCmi64YiuvWkd6d+Bln696s4S2HLMKVBZa1XhD0lh7px7W6DRe3cx7B1
   A==;
X-CSE-ConnectionGUID: NxI9fOR9R9ax85Mkhu787g==
X-CSE-MsgGUID: MzxVd36WSqKd4Y2o3ZUxug==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37009511"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="37009511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 16:21:10 -0800
X-CSE-ConnectionGUID: eodyHjasTMChDEZF7rpNaw==
X-CSE-MsgGUID: 58598P63S4ulQoXc3C5cHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109182753"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jan 2025 16:21:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWlj1-000LLj-1u;
	Sun, 12 Jan 2025 00:21:07 +0000
Date: Sun, 12 Jan 2025 08:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] /tmp/ccSoE64X.s:1791: Error:
 selected processor does not support requested special purpose register --
 `mrs r2,cpsr'
Message-ID: <202501120827.VeiA2umE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ignat,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f740a3444f6d4e9a1b075e59e7d3eac392ad275c
commit: 37b561d55936d0fcebd199d22180e595bb72b784 [2/2] kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
config: arm-randconfig-r112-20250112 (https://download.01.org/0day-ci/archive/20250112/202501120827.VeiA2umE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501120827.VeiA2umE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120827.VeiA2umE-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccSoE64X.s: Assembler messages:
>> /tmp/ccSoE64X.s:1791: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
