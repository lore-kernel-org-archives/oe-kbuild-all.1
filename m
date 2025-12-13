Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA37E792
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765597618; cv=none; b=bvBvOUsf7fYzEDxWPcE5i+cF5uaG3HSB5ojC1cpnZdZ5uovv9w8+2nqXiDPobo/pCaMtGB5340liW5jBBbT6tlovGJUuQv0b91CCyUvMhekNhbrIZmcKvV5zQcp7jvNiOpIJwovHjZtDV04+ng4vA9uxkwVcHggsln3QDqGtcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765597618; c=relaxed/simple;
	bh=3TkKET5Uap4hsAWfhs7rv2AnKgsFANS8m+4H6yC+wk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gTuU6UfITSs3yrpo/4TgkIb2LJid646miB1VGXgJHYMq7z84rSaT6mZgI/XisPWJPgUY93QObl9VTDNE65y3jKO5FYxAp9i1rbnfr3r/hYC3aXvtE27fsvCZPIfD7XSxnbbfdDatVhYtsU+LCIPM45KMSGkAB0FsBJ0eK74alVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhnDOtYX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhnDOtYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765597617; x=1797133617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TkKET5Uap4hsAWfhs7rv2AnKgsFANS8m+4H6yC+wk0=;
  b=mhnDOtYX25Y9Xd2nDBXSB3BtlG4OApEyJtgF8lkRTzX7+bgSdpOL97A+
   MRngQ5pgTRZIHGAqxPDf22ekt6MQZpYdAG8R/1gx1dBanJpca1CuVlzlE
   +WPpO8OUdmRL1gGnO3IJDAUX68dGjGOI1SHZJlp/ACZ/eUmd0XdxbQ22F
   7ScN0G9aZoYDVNegPLP4bNV7l7m4uTSxFrJCM0+xtkxEgQpPLbBEybwbF
   ZquvKkRCdBfC1eqM1LQNg8nBRkNE15DcdMGJ+eHIcKEKkNxyJMBJg1S0a
   Gf2jZJWUbZWCw8ZL/6QxEILC+DbMUfZxCQCfVW7bQjgMTjZKlGcsYMXgl
   g==;
X-CSE-ConnectionGUID: FD92SlcARvalLUD7uN5ytg==
X-CSE-MsgGUID: +JDK9oYgRWeMWW4Xn2blsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67473746"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67473746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:46:57 -0800
X-CSE-ConnectionGUID: xOZVitwkQNiJIfg9b8N6nw==
X-CSE-MsgGUID: 5hDjH/1rRD+QqpkDjHmeyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201660972"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 19:46:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGar-0000000070Z-1EsM;
	Sat, 13 Dec 2025 03:46:53 +0000
Date: Sat, 13 Dec 2025 11:46:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/18]
 drivers/usb/gadget/android_configfs_uevent.c:231:6: warning: no previous
 prototype for function '__android_set_connected'
Message-ID: <202512131117.eYK9cq9G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [0/18] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131117.eYK9cq9G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131117.eYK9cq9G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131117.eYK9cq9G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/android_configfs_uevent.c:231:6: warning: no previous prototype for function '__android_set_connected' [-Wmissing-prototypes]
     231 | void __android_set_connected(struct android_uevent_opts *opts,
         |      ^
   drivers/usb/gadget/android_configfs_uevent.c:231:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     231 | void __android_set_connected(struct android_uevent_opts *opts,
         | ^
         | static 
>> drivers/usb/gadget/android_configfs_uevent.c:245:6: warning: no previous prototype for function '__android_set_configured' [-Wmissing-prototypes]
     245 | void __android_set_configured(struct android_uevent_opts *opts,
         |      ^
   drivers/usb/gadget/android_configfs_uevent.c:245:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     245 | void __android_set_configured(struct android_uevent_opts *opts,
         | ^
         | static 
   2 warnings generated.


vim +/__android_set_connected +231 drivers/usb/gadget/android_configfs_uevent.c

   230	
 > 231	void __android_set_connected(struct android_uevent_opts *opts,
   232			bool connected)
   233	{
   234		unsigned long flags;
   235	
   236		spin_lock_irqsave(&opts_lock, flags);
   237		// Don't send the uevent if connected state is not changed
   238		if (opts->connected != connected) {
   239			opts->connected = connected;
   240			schedule_work(&opts->work);
   241		}
   242		spin_unlock_irqrestore(&opts_lock, flags);
   243	}
   244	
 > 245	void __android_set_configured(struct android_uevent_opts *opts,
   246			bool configured)
   247	{
   248		unsigned long flags;
   249	
   250		spin_lock_irqsave(&opts_lock, flags);
   251		// Don't send the uevent if configure state is not changed
   252		if (opts->configured != configured) {
   253			opts->configured = configured;
   254			schedule_work(&opts->work);
   255		}
   256		spin_unlock_irqrestore(&opts_lock, flags);
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
