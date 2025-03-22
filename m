Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757D93FFD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 01:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742605771; cv=none; b=dzQCv18I1zR5xbMw0+w3wO9npM5RObFohe7KfI1udXMpw2wa2QJvIcS7A/7GPxskQRQ1cIUq8rDHYu187spbllralv7MZB/gFNj9ONJsVeaB2+iiRAkv6Driwa+zTliICB7mcxv3Au02ahFR2Jffl7qgTfSyBCH3XiOaZgtwCyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742605771; c=relaxed/simple;
	bh=wnQRItw8FrA7Vp2rfPJQvMDt65ZWXmLCpLNrpGAqn8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ubEzAI+lsgxNWp73fEr80rftxwAaL5uy5RgYQ/qeyaCQChw9sntaMgNiWSjmV29fiG3AAl563EO/sYcwXxtk6ZnglX0mAL2ao50Z1tjuoospBwpw2heyqtGtcTI2zaNd6KygOnETh9nmDJbQ5RyPcvjlBzO6OffwvgTuBf97f7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYSd4XNP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYSd4XNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742605769; x=1774141769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wnQRItw8FrA7Vp2rfPJQvMDt65ZWXmLCpLNrpGAqn8E=;
  b=NYSd4XNP3P3fJNQanCMAoSGKSrMeXOvMy+lo921e1TF4H6gXakgYDJWW
   Llpt2ruLJOcit+gbTamV2JIj8snaLsP8187G+JXuE59nxOpS0HYaWeaWh
   FaaZA2EnEGRnDNmJ2sxGZRdKati9Ki/yi5tugmmK+9fa7iHVpOR786UYe
   LnLFF4IrbNH6Zc0uCCmSBbVuMLICkv7wjuKp10EuSV0rKAGVfcGHWZa9x
   3AkN+vd7hQKbn7RFgHkWIrkk+aWazPXldi2RF9ciQ+yvsoHn7A10JVQhW
   hmGnpkhWHffIcFLc294mWvUt+u/yPQEDaKNjQ00gt10KUZCCDherNim+Z
   Q==;
X-CSE-ConnectionGUID: JUS82LvDRFuPoXtbDHT3Mw==
X-CSE-MsgGUID: /wDYt+v3RPa4TM7EfXvT7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43048002"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="43048002"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 18:09:28 -0700
X-CSE-ConnectionGUID: FCqdfeTwRa6SHijnEfNKbA==
X-CSE-MsgGUID: YxsOgtRtR4WVm/38aBUxRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="124322588"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 21 Mar 2025 18:09:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvnLR-0001pD-1I;
	Sat, 22 Mar 2025 01:08:23 +0000
Date: Sat, 22 Mar 2025 09:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishusen <lishusen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2050/2050] kismet: WARNING: unmet direct
 dependencies detected for HALTPOLL_CPUIDLE when selected by ARM64
Message-ID: <202503220924.Uw2cwpZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f91bc9d0ae15025f6b0758053fb66480c3fec2ec
commit: 6df2e969a6de3481167ace4fe42f69812a6c7fc8 [2050/2050] arm64: add config for cpuidle-haltpoll
config: arm64-kismet-CONFIG_HALTPOLL_CPUIDLE-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20250322/202503220924.Uw2cwpZV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250322/202503220924.Uw2cwpZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220924.Uw2cwpZV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE when selected by ARM64
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
     Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
     Selected by [y]:
     - ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
