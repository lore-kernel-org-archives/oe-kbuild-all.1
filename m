Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAACF274B53
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767772531; cv=none; b=YhjHb6ag6gxznhFujdKHa3Gbzr9/nruXtRNs7aUqwuGTftdOT3IZbRFNQAxxDIuPojoQSlrHys1bOu6i5M/y+vlrZoxvPWZpd592ZR80PNt0F4zlNhUCTmHzthocdsu87flcQ/Cxdry61EJRU98ZMBVksFYkIsyAUvrblx/rLyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767772531; c=relaxed/simple;
	bh=ddN30MtwIF0kd5DM9jERgZDabQ7laa3OaZv7ffhxINQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fYnFnNguufqJChV0v2e72mh1dhI4qJO/FCilMSD3rqfpHY0njCd0fVQRHV0I4xgu5K1I0T1Y37J6lNAHGIfTP9yRjL4FPM7uM08o11yqnnx9UvwNb0ZhrZsWTwdRWXJT4QrkKgi+yygiRZtPfvvsGDMfqAk1qhR4XrFD+RvLfEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgafG5kP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgafG5kP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767772530; x=1799308530;
  h=date:from:to:cc:subject:message-id;
  bh=ddN30MtwIF0kd5DM9jERgZDabQ7laa3OaZv7ffhxINQ=;
  b=DgafG5kPd3m9nrP693AE2djDuq1BEu4o37Q1EpqAUKralfAflz8trXZE
   BdOEhO4r7YVJYYIJzkWZBgAtbPUX3HCNEm/WaYQox6YIqRnW4SYtWk9Oo
   xhBCeZA98jK4ghwBh2W2ZmwS0ZGi27t6spSv0F2lUw72oSEtGskphvAUu
   Ug/MUrHiFoAQTaDFSuWGlajxWsPgrcKYYE7yIjjOKpnFyCMguP8zzawR8
   asO6Uj5Z9SeTm1ezuAZL7hp3HamAVN0Sxh7s1wTXJrWPuIWs0TlIMAnv3
   oBCFyhIKSRqidvzw+ELRKxD6T8WgGONyHrZUzOaqLZabW/6pa0ogMSHSy
   g==;
X-CSE-ConnectionGUID: Xu0viP8nRWCVRoLu9u9SoQ==
X-CSE-MsgGUID: kUorVWzQRmyipsHEuFx3PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69296901"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="69296901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 23:55:29 -0800
X-CSE-ConnectionGUID: bmIQoJu4QoKSUg583ukGOg==
X-CSE-MsgGUID: +n66Ja63RKS9SIPo8FO5nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="203775515"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2026 23:55:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdOO6-000000003Zx-0Rja;
	Wed, 07 Jan 2026 07:55:26 +0000
Date: Wed, 07 Jan 2026 15:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 190/190]
 mm/swap_slots.c:95:6: warning: no previous prototype for
 'is_swap_slot_cache_enabled'
Message-ID: <202601071539.zDiP7Aci-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d85d8be2b179c3b236531ede2d3273facf436d8a
commit: e064059673798b931f95f724c7e377fa8cd15df7 [190/190] ANDROID: create and export is_swap_slot_cache_enabled
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260107/202601071539.zDiP7Aci-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601071539.zDiP7Aci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601071539.zDiP7Aci-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_slots.c:95:6: warning: no previous prototype for 'is_swap_slot_cache_enabled' [-Wmissing-prototypes]
      95 | bool is_swap_slot_cache_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_slots.c:101:6: warning: no previous prototype for 'check_cache_active' [-Wmissing-prototypes]
     101 | bool check_cache_active(void)
         |      ^~~~~~~~~~~~~~~~~~


vim +/is_swap_slot_cache_enabled +95 mm/swap_slots.c

    94	
  > 95	bool is_swap_slot_cache_enabled(void)
    96	{
    97		return swap_slot_cache_enabled;
    98	}
    99	EXPORT_SYMBOL_GPL(is_swap_slot_cache_enabled);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
