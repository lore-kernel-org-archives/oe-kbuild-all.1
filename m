Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C334D3BF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 23:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566628; cv=none; b=iD9WYjh3ehpcmj3l/SOTMUi1o6kPdGBPtJsUonJ9L6nr8GqM5XhPhrZEAcb3dUn3sIty2Z8jTwwzvDXoL8UBx3StmDLvMOtIF1vED/mR8AFFIbDNz8Cf/ygAZghgtVGa0evyzexYG1YjiU6MsihXn1K5bSdSo2gqQyEGJfeXzhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566628; c=relaxed/simple;
	bh=U6uHve08WapMK1Ga5lLzzSu2D57+ysPCbgeH42HFexY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lRFaED3aPaOxCifgKaOBZwdIVrl28vM8lSjSXZnFdHD84ngGsPS1J0dxbhsQBko8vHJqh4lIrcMTPWmB1MQdPJvk8wgyvbPvk+RG5fJMNmSzvVzw98NC7g3LlO5nL9/KMUZ4jLv9odru7IPamAwBPGC0jl55A3YUWgsKqSA6iZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOROh/N8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOROh/N8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774566626; x=1806102626;
  h=date:from:to:cc:subject:message-id;
  bh=U6uHve08WapMK1Ga5lLzzSu2D57+ysPCbgeH42HFexY=;
  b=bOROh/N8+mZiVWnXawKqPl4YWhwSRnpmWuQ8qen+NDc/5c3NJdOyUMYR
   piXbxhoRTuCQTlTueRLcw4grKney4qkrTIYwphR4wdRRANr0MOhhckNeu
   pmbKQ7EuFKaujCcDWXwI+rCxVZh8lQoCJmC9QLV+QsT1thSJfSETY3f+Z
   LLjxAxKptQpnWhYVj9Hf9pklOHvLkUVckQxBGLaYDU6dn09/vbfBUQb6L
   DQpAQuoM6nvG7DlyIKokSI0MjOEwkHl/6jjjc0lmL0td4lwlZcQxaBW48
   A8wHPCnLkZvSrql8Sh3ArwvC5ab1YRCQxEMriBog8v9m4oMoxLVutozj6
   g==;
X-CSE-ConnectionGUID: mV/zS547QXOk50+eE6H3ng==
X-CSE-MsgGUID: k+7sFeigS7G0HUK/n5BUzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75531861"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75531861"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 16:10:26 -0700
X-CSE-ConnectionGUID: CYXftdF3TlC6+XV+7FcQeQ==
X-CSE-MsgGUID: FR2g0kEHQMuhu33sRhc2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="218530430"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Mar 2026 16:10:24 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5tqH-000000009TR-3RTH;
	Thu, 26 Mar 2026 23:10:21 +0000
Date: Fri, 27 Mar 2026 07:10:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 9/95]
 drivers/input/misc/pf1550-onkey.c:178:54: error: 'pf1550_onkey_suspend'
 undeclared here (not in a function); did you mean 'pf1550_onkey_probe'?
Message-ID: <202603270630.GrcCkWk3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux thread-safety
head:   3725aac930bc010283e98a5bc020c40abc6eaa4b
commit: eb51c55c1283faa39529543e95c30ee1929671d9 [9/95] Input: pf1550 - Fix the !CONFIG_PM build
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260327/202603270630.GrcCkWk3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270630.GrcCkWk3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270630.GrcCkWk3-lkp@intel.com/

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
>> drivers/input/misc/pf1550-onkey.c:178:54: error: 'pf1550_onkey_suspend' undeclared here (not in a function); did you mean 'pf1550_onkey_probe'?
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
   drivers/input/misc/pf1550-onkey.c:179:26: error: 'pf1550_onkey_resume' undeclared here (not in a function); did you mean 'pf1550_onkey_probe'?
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


vim +178 drivers/input/misc/pf1550-onkey.c

9acb215cbebdce Samuel Kayode 2025-10-01  177  
673b192dbe174b Vaibhav Gupta 2025-12-10 @178  static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
9acb215cbebdce Samuel Kayode 2025-10-01  179  			 pf1550_onkey_resume);
9acb215cbebdce Samuel Kayode 2025-10-01  180  

:::::: The code at line 178 was first introduced by commit
:::::: 673b192dbe174b61bdf784d293b5a6e7f2fd20f6 Input: pf1550 - remove "defined but unused" warning

:::::: TO: Vaibhav Gupta <vaibhavgupta40@gmail.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
