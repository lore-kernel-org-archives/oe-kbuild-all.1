Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB01A8F98
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 18:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733338056; cv=none; b=AhmM5X5DBhwPGE8R6Lpx4KX2pJdVrgLlowpSTvU4h6YBIm2cU9J+VKd+tqztfOSYs5q6yh3gjYGwJu7L1VFBHp6KZaV8jcUGA+/GKAhvo776YMM88FMJj7JzBUHdbwXISUzM7i+sW0OeWEBZK8yHGq3aANDKJXbcjp05JrP2POo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733338056; c=relaxed/simple;
	bh=vLv2vtF53lrxG9jQImD3VlzFPux34KRHmCmOKM487tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMTaKGBFIQz4UaPceq7OQY7ZfTQgea/CBFqtg63K5chD0DRbuqUsOmYy5/S2B3yuSvEMLHn+AL7sTxERX/yNYjQwhjVONe/ET9JwkUrk7e5AhE2xscmB5NfIVcFe4hyc0hkJ8tlWpI3HpOqFDjaLWf0zl7Ymm0s8us0Bezc1SgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XThPwbcF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XThPwbcF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733338055; x=1764874055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vLv2vtF53lrxG9jQImD3VlzFPux34KRHmCmOKM487tA=;
  b=XThPwbcFM09AbgEQX0Wb0VoVDODTTCMY/p14Zn2qbW5xw5kiRXmwX/S+
   VvzcmQJEFvIT0jolzFx94rLuPQDdceLTTpILIULuFu0RJZFWzZaJA6hBF
   GDL9aWRFt4NNPpbe/AS0E2fW8guG7Pm6j05BZQd0J0OCZpm7LHjaFNUJ+
   +xLxc437qEYqrkstprDgOeltUNHM16qe/m0PETV4ngEDcp31x/tGlt8tI
   E1L3juASgK+bgXH00gORUOFGEWX1g73T9rFBHlYyg8KF9rOkkW1kqjl7R
   thwAMEVzCvlsD5zaNE0Il0pQBnoNzb7YDNdbLlsU+repTHB185q2h3Df0
   A==;
X-CSE-ConnectionGUID: L5/ySGFQRI2Avhvq2ZGlbQ==
X-CSE-MsgGUID: WOkX1/bUTO2/LjEv+f/q6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51158792"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="51158792"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 10:47:34 -0800
X-CSE-ConnectionGUID: 1Fo1ITLhQJuQiC6ysuzThg==
X-CSE-MsgGUID: 5596JhRHS0KYuItblrxr/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="98298182"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Dec 2024 10:47:34 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIuPK-0003OX-2c;
	Wed, 04 Dec 2024 18:47:30 +0000
Date: Thu, 5 Dec 2024 02:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 03/15] ARM: rework ARM11 CPU selection logic
Message-ID: <202412050214.8NNHLbvi-lkp@intel.com>
References: <20241204102904.1863796-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204102904.1863796-4-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next linus/master arm/for-next arm/fixes v6.13-rc1 next-20241204]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/ARM-use-CONFIG_AEABI-by-default-everywhere/20241204-185507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241204102904.1863796-4-arnd%40kernel.org
patch subject: [PATCH 03/15] ARM: rework ARM11 CPU selection logic
config: arm-kismet-CONFIG_ARM_ERRATA_411920-CONFIG_ARCH_BCM2835-0-0 (https://download.01.org/0day-ci/archive/20241205/202412050214.8NNHLbvi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241205/202412050214.8NNHLbvi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050214.8NNHLbvi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARM_ERRATA_411920 when selected by ARCH_BCM2835
   WARNING: unmet direct dependencies detected for ARM_ERRATA_411920
     Depends on [n]: CPU_V6 [=n] || CPU_V6K [=n]
     Selected by [y]:
     - ARCH_BCM2835 [=y] && ARCH_BCM [=y] && (ARCH_MULTI_V6 [=y] || ARCH_MULTI_V7 [=n]) && ARCH_MULTI_V6 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
