Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A3730BF52
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 23:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765669075; cv=none; b=XFVlaqfH2XXHkqLzW8oxE07hGU1d7C+6EOAT3mssG28pC3vjlscIpoAemb4oPXb4S8xG3/sVHZ/w5BtSoSG2Wq1htroVOcIqdFhVvAuXg/n01Hv2jIpHrUAEqAFHhChCvvgnPkP7haFhC8XAQMePhfGb6vq2M94SOojosJkVEFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765669075; c=relaxed/simple;
	bh=1SlL0bPy3BgamxohRv3tNfv4ojTV7kAiZYC/TGBepf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Az94qgcH/rFsKuFQCJm9K1vlt+KnXTWmpAcHsQgNOSH7rhZwmJTflK6SvinveUChXkvQ7iZyZbfZrDmQbZv8Zu7aDwgvqwNHvnnOEIVJvSADMSXi2nLEAr18f1StDogudIkzVtzIYFgfNHMsbkkH89RPQAVvC86xnneReWreEYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvPY5WdV; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvPY5WdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765669074; x=1797205074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1SlL0bPy3BgamxohRv3tNfv4ojTV7kAiZYC/TGBepf0=;
  b=AvPY5WdVAbi2aXl55znezaUHhPn548KoztioW/x0kj1z1JZQLLqAqhaP
   07tjn45eaL3ioNbyTduzDj3fZ6m9GNIocVcLHUU0bAB8LBtcic0DWeyUo
   FJe9cXdTGcJcRl1TbENtSu7VA0MNB2DCz0RXdFXdIjVf16HOpYQucMGo8
   KKD0qpSokkRmnIxqhOYOoatESgB2l79iF1dz1GGryCkoD93q/BOf8IRQG
   Ykj4ErTs2uXsZHAmvSvk6QIW+O709aaDfA6GbjKMX+5PpzmV8Xwz2wFS8
   tLahUc55166Z8q7x7wlTXnAQuFai/yCBd1m9ioSIejwmuVZH7q9l359m0
   Q==;
X-CSE-ConnectionGUID: SThuK+fWQcKYnq0G4vU26g==
X-CSE-MsgGUID: /dZl5y1aQ9eF89V9e32BNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79081751"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79081751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:37:53 -0800
X-CSE-ConnectionGUID: e6UlrrB6QOCo+HK3725Rog==
X-CSE-MsgGUID: lXed8iWuRQaAcE+bTW/nrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197157380"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 15:35:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZ93-000000008Jl-33gv;
	Sat, 13 Dec 2025 23:35:25 +0000
Date: Sun, 14 Dec 2025 07:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 sound/soc/codecs/cs42l43.c:2446:9: sparse: sparse: Initializer entry defined
 twice
Message-ID: <202512140729.luUXJGMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17fd67ddf0cddeb7325b49d3ca2f7db7824dfccd
commit: 91e698058e91dcaef669afae07e2f23fee6bce9a [0/3] ASoC: cs42l43: Add codec force suspend/resume ops
config: i386-randconfig-063-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140729.luUXJGMM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140729.luUXJGMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140729.luUXJGMM-lkp@intel.com/

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
