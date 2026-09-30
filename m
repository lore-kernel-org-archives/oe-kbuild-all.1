Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA7B491582
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 23:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810340; cv=none; b=W4H49qd6DCkurLiVc8N52gNVZ7Y9zYeGbk1tEiF0io4Xv1Aaz/vPpEbsiMsD1jzY2wF5/XmkK5rtMMEXEFdOSEUmJrl58ibN5JRZ5RN9brZ+3phUFuShO0udcCY/Hvy++ZRILIKcEVRQh6TUtnzyN/MZeznG3zB6WUXgEmNJFqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810340; c=relaxed/simple;
	bh=VYSm/s2055rr76QXOk0v3Ikf0/dKg+T+xREyiwXFkbg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UHFodeAO701EMKaUrgvN5PVFFbyYvyDxp8/Qjwb4gFfK0BeQCjKjeKUT5L0sOZuCEDj9cgl37+3B8wtpoGF4VYgVWFjh+cs3RkfuSTx0AcoZsJJD8OD8nuKSQSIvK5TYJBW/7YwDRNuU4WqPWxWCRgaQT7VbBMfKagsbiA3XT8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMHEC9nD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMHEC9nD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790810339; x=1822346339;
  h=date:from:to:cc:subject:message-id;
  bh=VYSm/s2055rr76QXOk0v3Ikf0/dKg+T+xREyiwXFkbg=;
  b=VMHEC9nD8Beo4h7a7ojcBJDLLosN/hXZ+SXAj/E+T0KVhpz0QWOPSz1w
   XFXSKfqsgNKzPtbFe6zeFnvJhoT0sPjcYoQ689pnWKRxdOpZN2x0lEbiE
   2Vp05nfmMqiKh1xTRf/kAGZ4Lhrv27mPi4xm9VAGH1dVcYzMnEL0OkBQO
   QK3NTslpHM/0hQRZDEmFtPcjAt3iEuR++9wLoyb5r1u4QyoEUY6uQJCiX
   JVyEvIR0ALVny9TYgysxxgX9OmrT65L9Wh4HcwfIz6SkaLbviG2OcFyg2
   ifEguWKfD2qZpM+5do7ao2b5HEaz7ZMoTbIVneHD5NvauRuh86C4XIaVB
   w==;
X-CSE-ConnectionGUID: Iyif7eeaQ5OB3oaBUzvXoA==
X-CSE-MsgGUID: XlzL8O9LSruXKSMtH1sjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90513184"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90513184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 16:18:56 -0700
X-CSE-ConnectionGUID: IZeHT7p8RnWfvZ+VvzzAWQ==
X-CSE-MsgGUID: e+PfqR20Q0upHppHp+eJFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="313768573"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2026 16:18:55 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xC3Zc-0000000025L-0zye;
	Wed, 30 Sep 2026 23:18:52 +0000
Date: Thu, 01 Oct 2026 01:18:36 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Masney <bmasney@redhat.com>
Subject: [linux-next:master 11187/12559] include/linux/stddef.h:8:14:
 error: called object is not a function or function pointer
Message-ID: <202610010151.2W0MrmxE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c2cb8b8b843d216ab549b678a0d8831c43153e0
commit: d0b72c88671b3c46342bbebc9b90280890436c98 [11187/12559] clk: mmp: allow COMPILE_TEST builds
config: m68k-randconfig-r2308-20260930 (https://download.01.org/0day-ci/archive/20261001/202610010151.2W0MrmxE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010151.2W0MrmxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610010151.2W0MrmxE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/of.h:14,
                    from include/linux/clk-provider.h:10,
                    from drivers/clk/mmp/clk-audio.c:8:
   drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_suspend':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
    #define NULL ((void *)0)
                 ^
   include/linux/pm_clock.h:77:24: note: in expansion of macro 'NULL'
    #define pm_clk_suspend NULL
                           ^~~~
   drivers/clk/mmp/clk-audio.c:405:2: note: in expansion of macro 'pm_clk_suspend'
     pm_clk_suspend(dev);
     ^~~~~~~~~~~~~~
   drivers/clk/mmp/clk-audio.c: In function 'mmp2_audio_clk_resume':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
    #define NULL ((void *)0)
                 ^
   include/linux/pm_clock.h:78:23: note: in expansion of macro 'NULL'
    #define pm_clk_resume NULL
                          ^~~~
   drivers/clk/mmp/clk-audio.c:414:2: note: in expansion of macro 'pm_clk_resume'
     pm_clk_resume(dev);
     ^~~~~~~~~~~~~


vim +8 include/linux/stddef.h

^1da177e4c3f41 Linus Torvalds   2005-04-16  6  
^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e218287432472 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
