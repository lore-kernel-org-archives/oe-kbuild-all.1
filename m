Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEB44EB2B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223753; cv=none; b=i14xhrXFkHfO0iILHEeNKg1QkUaKat6E816dZes5q9UTyGWlN/YlvgaXcjQNTWSP1LPLPyIqugf9dUveYP58HoYUdTAoJ+7NlLekm/uwGcz+RCLI65eCNe6hVTyzdVUAg95ViiSXaAUiKDPfziy2Mfay06uZr4HubLS+6oJLlwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223753; c=relaxed/simple;
	bh=05K/TvX6f6k63GOg2jznHKlDO+JR1otC5JYP/Ps5xEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhcLtAcW6b5phme2GVa/A6cukG6RAKg2vM8sz9dOFB9n+rgDtuh+I9t3xvITzVI4gzrdm2v77/ZP9bQZJCPXol+bUZmNfyAy0/82QjmwNoVPGfdZrvjJJZWBYQykhU5fOBpS2nTn7G/1+HyKZKauAd3dY11zfXATa1KVxZbfU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1VOwsZj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1VOwsZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726223751; x=1757759751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=05K/TvX6f6k63GOg2jznHKlDO+JR1otC5JYP/Ps5xEI=;
  b=e1VOwsZjpshS7Px29lnnqPEmNsljj7tEQyl3CbNe2sql3scs/9C1UGKW
   Acqb3nCVYX2ATB/JYkiRWgi2iwWIaaUJcpTJy5wSWmlmduEQsh0aMWe5O
   HLB7vKDEoJgqUMP6TQRKCzEKkelxAwwpL0SDr6SxgdDitPSuoB7THS1oM
   Td3+vMUlX+NXRIVuvHFnIuitUbfdcB8HpMitXltonVkJPbTWAWHaJ9QSU
   ZVYTwIvg5Ad95h4EE7tB/eJ4BSiWtuEH71FpIod3rmv6tAMazcGOPJkCr
   PSGPiLmO9SYdVUUMgsB65kiSdbiVuS70n+aIQe+Wa6zSCd6JHVWWO6K/8
   A==;
X-CSE-ConnectionGUID: Iiev+hgaQ0GHZ81AVBDBYA==
X-CSE-MsgGUID: ghf9w9CIQLaGUuGl3Ie7uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24988027"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="24988027"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 03:35:51 -0700
X-CSE-ConnectionGUID: WfKWVEZNRq2pyeWGWPHp8g==
X-CSE-MsgGUID: wc6HoEU2RLWuaJ4MupUGCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67979692"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Sep 2024 03:35:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp3eV-0006MI-2s;
	Fri, 13 Sep 2024 10:35:47 +0000
Date: Fri, 13 Sep 2024 18:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/7] hid-playstation.c:undefined
 reference to `devm_led_classdev_multicolor_register_ext'
Message-ID: <202409131816.FM5nXboc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ad991276148d233c117e22cb096ec335e5ffab82
commit: 19cbe316423133e087dbe89b6d3fac2858d683e6 [1/7] UPSTREAM: HID: playstation: expose DualSense lightbar through a multi-color LED.
config: arm64-randconfig-r111-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131816.FM5nXboc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240913/202409131816.FM5nXboc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131816.FM5nXboc-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/hid/hid-playstation.o: in function `dualsense_create':
>> hid-playstation.c:(.text+0x1064): undefined reference to `devm_led_classdev_multicolor_register_ext'
   aarch64-linux-ld: drivers/hid/hid-playstation.o: in function `dualsense_lightbar_set_brightness':
>> hid-playstation.c:(.text+0x1c94): undefined reference to `led_mc_calc_color_components'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
