Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD97D28643D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 06:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771050617; cv=none; b=L7eM0tyF2gSzagTIejIzS8OVJd4H9A/nDexSeyy2WujdDMPMXNbjduLl4jCqognOg5Y4j6Mq6tn2OuR92vdv5akDUSpRjDqGHGVie1p+RA+V4ixGC0KNH9JPkpcXSjoUGw/w5ulpoKuFPGCr5gArHapjkBItLHcUgRBrk+iPhvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771050617; c=relaxed/simple;
	bh=T/ftUp8knjm7J69TVB17Dj8uJCdl6TMjx2dr/PQ1PyQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j0Sy7KvI4Uow9wMdWIl7XjPH4EojWO/icAfsmnt6Qf2lER2+pGuBcJGgJXo9Vpsh3B2z+5SPo2+ajgWlE62leePjYkUYX8wIRS4Fc/91/iqDNZROoRWv9bROkF8ZDg5GBn70jez0tZ9ajx/jRxjvfffehEvZAjlwQ9y7GJn7y8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuJpIg+V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuJpIg+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771050616; x=1802586616;
  h=date:from:to:cc:subject:message-id;
  bh=T/ftUp8knjm7J69TVB17Dj8uJCdl6TMjx2dr/PQ1PyQ=;
  b=PuJpIg+VsarFaKXMqeYv+mE0ZKuutklt5PNPjgcB03hQDQ6fsA9+N9PQ
   md+kaRUa261fJuPKu25gtUXK5bo7ZmC6MVGHr8n1Bpq5FM5N2nmqZkZfV
   f0s4JlEek1GsgSmN6F5T1vZ+W9abjw2gQqPxImS/Z5oDh5U4+NJRrNNT2
   oBdJxhzeUK5PgA/g7RfrtXOWmPxT3iO8UY80YW75kEOPQKzaSeZ5e3sVQ
   p0q8zQdnhY96hQEgS9RwrrHAjP6pwLFrC4fLJpZMKTP5PFaJHrUrY2aDG
   uwEm6K4qZU7kiFt7Z7XIBr4GeRisWIDoj9N06msBz8JidL4ZWMgpY6099
   g==;
X-CSE-ConnectionGUID: ALU1VQSpT3irSd/nrGTUTg==
X-CSE-MsgGUID: hLpqRxRqRGKWDnSUme/c5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="74825445"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="74825445"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 22:30:15 -0800
X-CSE-ConnectionGUID: rgcOrSP2QlCqDHB3Xh09EQ==
X-CSE-MsgGUID: UwaC/9cHSwuT8jlxG2zCpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="236106799"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Feb 2026 22:30:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr9AR-00000000wHY-0pH2;
	Sat, 14 Feb 2026 06:30:11 +0000
Date: Sat, 14 Feb 2026 14:29:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>
Subject: [akpm-mm:mm-nonmm-unstable 30/30]
 drivers/input/misc/pf1550-onkey.c:190:39: error: 'pf1550_onkey_pm_ops'
 undeclared here (not in a function); did you mean 'pf1550_onkey_probe'?
Message-ID: <202602141440.xObtAhOc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   f88534a6e7afcfe6ad5f93b86f6e64d5d4d23709
commit: f88534a6e7afcfe6ad5f93b86f6e64d5d4d23709 [30/30] drivers/input/misc/pf1550-onkey.c: fix build with CONFIG_PM_SLEEP=n
config: arm-randconfig-001-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141440.xObtAhOc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141440.xObtAhOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141440.xObtAhOc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/input/misc/pf1550-onkey.c:179:8: warning: extra tokens at end of #endif directive [-Wendif-labels]
     179 | #endif CONFIG_PM_SLEEP
         |        ^~~~~~~~~~~~~~~
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
>> drivers/input/misc/pf1550-onkey.c:190:39: error: 'pf1550_onkey_pm_ops' undeclared here (not in a function); did you mean 'pf1550_onkey_probe'?
     190 |                 .pm   = pm_sleep_ptr(&pf1550_onkey_pm_ops),
         |                                       ^~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/input/misc/pf1550-onkey.c:190:25: note: in expansion of macro 'pm_sleep_ptr'
     190 |                 .pm   = pm_sleep_ptr(&pf1550_onkey_pm_ops),
         |                         ^~~~~~~~~~~~


vim +190 drivers/input/misc/pf1550-onkey.c

9acb215cbebdce Samuel Kayode 2025-10-01  176  
9acb215cbebdce Samuel Kayode 2025-10-01  177  static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
9acb215cbebdce Samuel Kayode 2025-10-01  178  			 pf1550_onkey_resume);
f88534a6e7afcf Andrew Morton 2026-02-13 @179  #endif CONFIG_PM_SLEEP
9acb215cbebdce Samuel Kayode 2025-10-01  180  
9acb215cbebdce Samuel Kayode 2025-10-01  181  static const struct platform_device_id pf1550_onkey_id[] = {
9acb215cbebdce Samuel Kayode 2025-10-01  182  	{ "pf1550-onkey", },
9acb215cbebdce Samuel Kayode 2025-10-01  183  	{ /* sentinel */ }
9acb215cbebdce Samuel Kayode 2025-10-01  184  };
9acb215cbebdce Samuel Kayode 2025-10-01  185  MODULE_DEVICE_TABLE(platform, pf1550_onkey_id);
9acb215cbebdce Samuel Kayode 2025-10-01  186  
9acb215cbebdce Samuel Kayode 2025-10-01  187  static struct platform_driver pf1550_onkey_driver = {
9acb215cbebdce Samuel Kayode 2025-10-01  188  	.driver = {
9acb215cbebdce Samuel Kayode 2025-10-01  189  		.name = "pf1550-onkey",
9acb215cbebdce Samuel Kayode 2025-10-01 @190  		.pm   = pm_sleep_ptr(&pf1550_onkey_pm_ops),
9acb215cbebdce Samuel Kayode 2025-10-01  191  	},
9acb215cbebdce Samuel Kayode 2025-10-01  192  	.probe = pf1550_onkey_probe,
9acb215cbebdce Samuel Kayode 2025-10-01  193  	.id_table = pf1550_onkey_id,
9acb215cbebdce Samuel Kayode 2025-10-01  194  };
9acb215cbebdce Samuel Kayode 2025-10-01  195  module_platform_driver(pf1550_onkey_driver);
9acb215cbebdce Samuel Kayode 2025-10-01  196  

:::::: The code at line 190 was first introduced by commit
:::::: 9acb215cbebdce721af2219e2859ad17342c9084 Input: pf1550 - add onkey support

:::::: TO: Samuel Kayode <samuel.kayode@savoirfairelinux.com>
:::::: CC: Lee Jones <lee@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
