Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8614B092
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 23:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739144276; cv=none; b=fYP1gxhSmJXjs1jBPbkcTIaasA/+fpA9cxJ0QkY7j/pDxhnoi0sS75EK8rmlOuT62VcYnq7t7/hdW7t1R0kzLj0ZWUFrNJgTAssRviVjNZBLXio+9fcBv8z9BcPGmzFdUCHJJVsLYjSAl3sw1cKjwKgnbeDRF7vzEbycd2ei2tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739144276; c=relaxed/simple;
	bh=9a/HxL38d6tP965S8JF0oTOcTzvAPpNlnDb4dUmJxjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l0RPkkTBNiu3F5ycA7iyuOL67946ARiC3XfClthKMT5PP9doVsVhtuBZbMCwd6YrhMW1PhidpC80c2LThM455cwsl3BkXMW7uUjb2Qz3rN2GX+tW6Z0sts86QRho1plEc83K6gj1cJWab/kSptLOm5geeFCakQi9EhUKV7zwSaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbGyQCdH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbGyQCdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739144275; x=1770680275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9a/HxL38d6tP965S8JF0oTOcTzvAPpNlnDb4dUmJxjQ=;
  b=RbGyQCdHZjaFs3wcgT6if8aGycDg7C3rbaTmD0D1WooHHWaopT3UL2FO
   Wrvc9pYYTdkLbuSqMKF+Lj+7RKrkCq1wAh+bo9FU5Qui7Sw62aU8zP2J9
   hUoXEnBUTweKpVUAoJ5CsqmCukj9cxwCJBgtk+1XURUakrJG5qX/zPguO
   BbAZTLBNkv06E9asKMbA+KGJmcpKGByyVJRmqxjuI6Cs4vt5UH5TvUJGO
   91T72PuUYyElla8p4QdPQmn8A80jeN298l5I61Nmhanmocn9TcPesOOOr
   vb1b01ioHqfq/87Mzz9MC9bWYpvUWIXl9evjLTOWxbSidE3Kb6dR0rtYm
   A==;
X-CSE-ConnectionGUID: SpFyCJ4iQkqmNaf7dDIqjQ==
X-CSE-MsgGUID: b6djyijIRFyOOvPrtFqfqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39626373"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="39626373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 15:37:54 -0800
X-CSE-ConnectionGUID: bbtstj0YQX2YiO+zKlMzOA==
X-CSE-MsgGUID: 57jAfjDPTJ6a5U3SYYWpzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="142892623"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Feb 2025 15:37:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thGs2-00121j-0u;
	Sun, 09 Feb 2025 23:37:50 +0000
Date: Mon, 10 Feb 2025 07:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5]
 sound/soc/codecs/cs42l43.c:2446:9: sparse: sparse: Initializer entry defined
 twice
Message-ID: <202502100755.Sniq1ehF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   9be0903cfd88aeb0db211ff96489ee2b414d8fea
commit: 91e698058e91dcaef669afae07e2f23fee6bce9a [0/5] ASoC: cs42l43: Add codec force suspend/resume ops
config: i386-randconfig-062-20250209 (https://download.01.org/0day-ci/archive/20250210/202502100755.Sniq1ehF-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100755.Sniq1ehF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100755.Sniq1ehF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/cs42l43.c:2446:9: sparse: sparse: Initializer entry defined twice
   sound/soc/codecs/cs42l43.c:2449:9: sparse:   also defined here

vim +2446 sound/soc/codecs/cs42l43.c

64353af49fecbd Charles Keepax 2024-02-06  2444  
64353af49fecbd Charles Keepax 2024-02-06  2445  static const struct dev_pm_ops cs42l43_codec_pm_ops = {
64353af49fecbd Charles Keepax 2024-02-06 @2446  	SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend, cs42l43_codec_resume)
64353af49fecbd Charles Keepax 2024-02-06  2447  	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs42l43_codec_suspend_noirq, cs42l43_codec_resume_noirq)
64353af49fecbd Charles Keepax 2024-02-06  2448  	RUNTIME_PM_OPS(NULL, cs42l43_codec_runtime_resume, NULL)
91e698058e91dc Maciej Strozek 2025-01-09  2449  	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
64353af49fecbd Charles Keepax 2024-02-06  2450  };
fc918cbe874eee Charles Keepax 2023-08-04  2451  

:::::: The code at line 2446 was first introduced by commit
:::::: 64353af49fecbdec1de9aadf2369d54fc00f1899 ASoC: cs42l43: Add system suspend ops to disable IRQ

:::::: TO: Charles Keepax <ckeepax@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
