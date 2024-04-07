Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97A337165
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 13:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712497394; cv=none; b=pj9yV0ja5eDGzm4VNqxWfNIWyEYHzXQHHbr7H7zpJ486r3Qmskpym/UJo8lQ9kADvleKkACbtMDDBC+pEQ7hW//zD7R10fTs+sjqcoOh5F+chjsI2VeloiOjwf888KNQ5pWznXOQevN5sMoF0FPzYv7aK+tpuykyqVQwFqf9SDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712497394; c=relaxed/simple;
	bh=7bn+QF8yJs84ByHLFvXYRJKw7BDiJ1qujy84LWRI/NU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUhVJZ92z7DyHV+Ks0UR28r84ayGhleAferVsvmf5RC1xviQGFje874ihXc4dx6xr9TLN+TNVofonzx6WcGFvYn8igNhw1sKxVGKi1ASobh4cfOzjrtB35Y5RU5qJ0449o0/99Oy6Zw10qv7KNlbb7UWjj22rbDidh6U4zbfL4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cj6BMfKH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cj6BMfKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712497392; x=1744033392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7bn+QF8yJs84ByHLFvXYRJKw7BDiJ1qujy84LWRI/NU=;
  b=Cj6BMfKHDPIA2f6cdrdhyNF1jcZmwkjhg0/23U/UMeCh8ytMIE/uC3lG
   GGjKLwgsciBRCNlRkUiOhG33KK+cBSjuXpoLMwTmxIbthWCHWc7n8Kvy3
   oHyo2M4quOBh6Y4XMYTFx4JCyvMfxgbDX2bbfqC/3gJXllAPF9STyLety
   5RNpNdJ9LaWe0IRl772V5hbK6+v71G526VwvmD9Gg1FmvzI6y9PcPc/6U
   qk7A+p1P7f7zzTX0zkkquMfltlFq/t/T5lFbyRwcmjKeRl6l0IdOfWcjK
   SHbsvjHvJUxQ7YkjL8w4k1vH/eLRKpZEF1Ebfsq29/zvGdzC9XzjB4vID
   A==;
X-CSE-ConnectionGUID: KAhJIGifSkiR2Ku803ttkA==
X-CSE-MsgGUID: raqxlHOrRsu0pZat98h2aQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="30266139"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="30266139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 06:43:11 -0700
X-CSE-ConnectionGUID: T86zIacSS7+n5DG4Zzh1WQ==
X-CSE-MsgGUID: yrUq28HlTIipef9CNcSWIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="19723705"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Apr 2024 06:43:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtSnb-0004O0-2P;
	Sun, 07 Apr 2024 13:43:07 +0000
Date: Sun, 7 Apr 2024 21:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.8.0-net-next-mv88e6xxx-leds-v5 5/9] kismet: WARNING: unmet
 direct dependencies detected for LEDS_GPIO when selected by MERAKI_MX100
Message-ID: <202404072143.vaBrHpCm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.8.0-net-next-mv88e6xxx-leds-v5
head:   db5976dcfcee45b460fc59b10fc29abcfd9adb3d
commit: 9d7e7e8493bc0393f85b88e2b3b49d4b7cd02407 [5/9] net: Add helpers for netdev LEDs
config: i386-kismet-CONFIG_LEDS_GPIO-CONFIG_MERAKI_MX100-0-0 (https://download.01.org/0day-ci/archive/20240407/202404072143.vaBrHpCm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240407/202404072143.vaBrHpCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404072143.vaBrHpCm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_GPIO when selected by MERAKI_MX100
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_GPIO
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y] && (GPIOLIB [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - MERAKI_MX100 [=y] && X86_PLATFORM_DEVICES [=y] && GPIOLIB [=y] && GPIO_ICH [=y] && LEDS_CLASS [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGER_NETDEV
     Depends on [n]: NEW_LEDS [=n] && LEDS_TRIGGERS [=y] && NET [=y]
     Selected by [y]:
     - NETDEV_LEDS [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
