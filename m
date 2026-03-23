Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB9E3B95F8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279463; cv=none; b=E42NDKwT6zQk89mwUV5xho7CF41me2efpgtbvd95AeDw+d54wXaWG0XkWbv5/KYkxSTN2ZKHZzGhHWWofDwudatzNhhWexwFXpgGle77K/nsPNZkE0NVwoDSkbcNlkFQnfeU7c/NK95DMkKq23KNYToSYmmqGsAUt1fx9fFy03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279463; c=relaxed/simple;
	bh=Q3OXnSNiSIVpROPJh8+cE0EDBATa7Leu0mQwtPyET/M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uZ4rNO2rM+DV5CY7ITOcrf6tbAUb47M7PWwVFJ9dT+iGzXtTBI/FeQyP3338QXEFDPtVi3LF8yaYe9sTqMcmb7w7ntI8ALTHr2GMxzNNCyijDRQ+wwlqYvZEDz//bgFnr8qdQzuLIIj2rA8ds4kM4USugaUmzBZ74/P+JHcZXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMwg0SeU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMwg0SeU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774279461; x=1805815461;
  h=date:from:to:cc:subject:message-id;
  bh=Q3OXnSNiSIVpROPJh8+cE0EDBATa7Leu0mQwtPyET/M=;
  b=ZMwg0SeUNjPZ61exs4pT7J3CoUW7cpFw6ufRLKYUphq6k+v2w0V2zDdC
   421EduXMTK7x/wBIZX+AH7/Dgqhg1iBK7W/eraBorEociFni7spaVb96E
   datikUUorw7sCzO0FPJfBDGKIvvW2gM0h6xzLqDgNABwxy7eSClZ1Sk9z
   ZZ86d+8TltgfxjsJU1HohXRUAlrPSwhea3k1tw3EtZB/zP/+RGacuqGUa
   gjjtokBADYdsZp0s06rSMgbaT7SiUnK3zYvla2dN/i14cRT9iG8hHl1jh
   FCRUbYSEhOs6P6sMau8z0uYK6ArGwlH0BBuPNU+toN+qPCzDoNtDDPRzI
   g==;
X-CSE-ConnectionGUID: i0dfkYRhS+uo1NrnDUf1ig==
X-CSE-MsgGUID: R7SNrl8NSzath8nv1ySEhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75347464"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75347464"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 08:24:20 -0700
X-CSE-ConnectionGUID: X7HJs5M9RuK0DDEgI4ejTQ==
X-CSE-MsgGUID: H+EFPNosTveKmt5zkAPqTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="247088981"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Mar 2026 08:24:19 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4h8a-000000001qt-280n;
	Mon, 23 Mar 2026 15:24:16 +0000
Date: Mon, 23 Mar 2026 23:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 22/95]
 drivers/input/misc/pf1550-onkey.c:179:26: error: 'pf1550_onkey_resume'
 undeclared here (not in a function); did you mean 'pf1550_onkey_probe'?
Message-ID: <202603232357.66WjlzUg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   01c25d61d382657141c2c31e1363a4daf850670a
commit: c798977808ceab61b8de2d2f4ab41f415ae54f42 [22/95] Input: pf1550 - Fix the !CONFIG_PM_SLEEP build
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260323/202603232357.66WjlzUg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603232357.66WjlzUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603232357.66WjlzUg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:35,
                    from include/linux/random.h:7,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/input.h:19,
                    from drivers/input/misc/pf1550-onkey.c:11:
   drivers/input/misc/pf1550-onkey.c:178:54: error: 'pf1550_onkey_suspend' undeclared here (not in a function); did you mean 'pf1550_onkey_probe'?
     178 | static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
         |                                                      ^~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   include/linux/pm.h:315:20: note: in expansion of macro 'pm_sleep_ptr'
     315 |         .suspend = pm_sleep_ptr(suspend_fn), \
         |                    ^~~~~~~~~~~~
   include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
     417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/input/misc/pf1550-onkey.c:178:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
     178 | static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/input/misc/pf1550-onkey.c:179:26: error: 'pf1550_onkey_resume' undeclared here (not in a function); did you mean 'pf1550_onkey_probe'?
     179 |                          pf1550_onkey_resume);
         |                          ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   include/linux/pm.h:316:19: note: in expansion of macro 'pm_sleep_ptr'
     316 |         .resume = pm_sleep_ptr(resume_fn), \
         |                   ^~~~~~~~~~~~
   include/linux/pm.h:375:9: note: in expansion of macro 'SYSTEM_SLEEP_PM_OPS'
     375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:417:9: note: in expansion of macro '_DEFINE_DEV_PM_OPS'
     417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/input/misc/pf1550-onkey.c:178:8: note: in expansion of macro 'DEFINE_SIMPLE_DEV_PM_OPS'
     178 | static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
         |        ^~~~~~~~~~~~~~~~~~~~~~~~


vim +179 drivers/input/misc/pf1550-onkey.c

9acb215cbebdce Samuel Kayode 2025-10-01  177  
673b192dbe174b Vaibhav Gupta 2025-12-10  178  static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
9acb215cbebdce Samuel Kayode 2025-10-01 @179  			 pf1550_onkey_resume);
9acb215cbebdce Samuel Kayode 2025-10-01  180  

:::::: The code at line 179 was first introduced by commit
:::::: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support

:::::: TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
