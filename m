Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBEA221730
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414570; cv=none; b=OgpGGnohCIMmTe5M6Ujre5B+O6Sr19PhoNF/hfQJhJlMX5+TkdRoROcR3IyA8/SnGoZShUXsZRWAJtpjPNPlSUmF/LYga9ROgi9h1wAGriHmvSNXio/vruQmizn8ekgGd4S9IgjTl+P4BrM7rpev7d/HnOcGbWXA3jemHxA3mT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414570; c=relaxed/simple;
	bh=WUhsxqKWzwZ9FQyS1b86Zmg2rRjWgJbT9jvoR18yXyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SViuM1TBsCb5WioVQ98151oQ2H5Adq/ZYiuE6dXG41fChsADVr81fQvz/1x0Wfwrpxc2NQlIIDfmjrcZi00RiGAPebJyShD5TmgkO8VQrUN+gyaByK1CR4WSP8LxjElTqsKFRMH791zLdxfekA66UQD0EZbnVAWSs2Z48v2ObXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuFO84BD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuFO84BD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747414568; x=1778950568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WUhsxqKWzwZ9FQyS1b86Zmg2rRjWgJbT9jvoR18yXyA=;
  b=ZuFO84BDCMGuFGb8t6tuVAn/KgctGfXuVZUXefkuQfJvh7/oToomdcdr
   J51myVf6VChuo/RPYK7gg3xHzUQ2xplcCHAgwmNqdauQRtr7yaCFuKKbL
   H/0ScKrR2TA9t3SNBL1IdTr6U5jxUEWB7Dpm9pAM9Nm3aYyRY1vWRQ58d
   1CYxiPaWMfe31SqlHGKvzOwrw/A9Ez+JDsrwmm+VBuAX8sX6vE/JJgWbA
   wonf3d7EEBM7Pdifa08sf0frDkVWfxkz3/Smhc5M+//PCvmdxYlR5YOHR
   kyMwg2ZuNeQYWurEs0vwmEPhOJyRt8pwMb6O31iXiS14qL02n3yZZdcFd
   w==;
X-CSE-ConnectionGUID: y9hUMCxuRsOIKyr6jbwfhA==
X-CSE-MsgGUID: k0FvGyEuTPqxMaFX+XyE1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="59622206"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="59622206"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 09:56:07 -0700
X-CSE-ConnectionGUID: HlBuESsTTrutsxqY06YgxA==
X-CSE-MsgGUID: 7WcDaN2hTkCArqd9nm55Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="142740119"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 May 2025 09:56:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFyLs-000JYG-11;
	Fri, 16 May 2025 16:56:04 +0000
Date: Sat, 17 May 2025 00:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pohsun Su <pohsuns@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Robert Lin <robelin@nvidia.com>
Subject: [linux-next:master 8131/11779]
 drivers/clocksource/timer-tegra186.c:417: undefined reference to `__udivdi3'
Message-ID: <202505170016.oISGP1dO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8566fc3b96539e3235909d6bdda198e1282beaed
commit: 840383cd35851c2379fe908f48cbb2ce18fbf4b0 [8131/11779] clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support
config: xtensa-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250517/202505170016.oISGP1dO-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170016.oISGP1dO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170016.oISGP1dO-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_timer_usec_read':
>> drivers/clocksource/timer-tegra186.c:417: undefined reference to `__udivdi3'
   xtensa-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_timer_remove':
   drivers/clocksource/timer-tegra186.c:243: undefined reference to `__udivdi3'


vim +417 drivers/clocksource/timer-tegra186.c

42cee19a9f839f Thierry Reding 2022-07-04  410  
42cee19a9f839f Thierry Reding 2022-07-04  411  static u64 tegra186_timer_usec_read(struct clocksource *cs)
42cee19a9f839f Thierry Reding 2022-07-04  412  {
42cee19a9f839f Thierry Reding 2022-07-04  413  	struct tegra186_timer *tegra = container_of(cs, struct tegra186_timer,
42cee19a9f839f Thierry Reding 2022-07-04  414  						    usec);
42cee19a9f839f Thierry Reding 2022-07-04  415  
42cee19a9f839f Thierry Reding 2022-07-04  416  	return readl_relaxed(tegra->regs + TKEUSEC);
42cee19a9f839f Thierry Reding 2022-07-04 @417  }
42cee19a9f839f Thierry Reding 2022-07-04  418  

:::::: The code at line 417 was first introduced by commit
:::::: 42cee19a9f839f2d60f1cd237d6905d8649127aa clocksource: Add Tegra186 timers support

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
