Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D7D8BE6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 21:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694381849; x=1725917849;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=802+mKRUlaFECm3mvQ0aDAf4yFcgr9gSW87FJ5U5pk8=;
  b=A2GtQX76Ua8IRdqssWYAqX8b8rrdKXSEPToA83QAfAjsj1+BwIF1zihg
   oGLHqYrIGB2+E6mzSGrXToiDp7KqH4bfwkn/psRCxA3N24BEMI6w/FEDZ
   MFbLRFymRTvCzhu3t5sOcZZf7if3yyUJnBeX6rvSC60NVAWT4KGc6Lx5g
   nd25aJrtNKSduJoa6+kAyn2EluYwJ4LeXanPSrJ71HXxvpNY5uyS7JtWV
   I66+vF/ltYseYQHNXgXZHg3K4L/IQ3u3V79ui/RYqzLGZWRxP7iksPWSZ
   3UzM5TlgAzN0EPfGq242rMQ0V+fvMxs8q6X3Yn+oFOJfyS8sJn231FVCQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="408902719"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="408902719"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 14:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="746194410"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="746194410"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Sep 2023 14:37:25 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfS7P-0005RU-2J;
	Sun, 10 Sep 2023 21:37:23 +0000
Date: Mon, 11 Sep 2023 05:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: Patricia Alfonso <trishalfonso@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vincent Whitchurch <vincent.whitchurch@axis.com>,
	David Gow <davidgow@google.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works
 in KASAN generic outline mode!
Message-ID: <202309110520.SZfumSJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Patricia,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1548b060d6f32a00a2f7e2c11328205fb66fc4fa
commit: 5b301409e8bc5d7fad2ee138be44c5c529dd0874 UML: add support for KASAN under x86_64
date:   1 year, 2 months ago
config: um-randconfig-r026-20230911 (https://download.01.org/0day-ci/archive/20230911/202309110520.SZfumSJ2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309110520.SZfumSJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309110520.SZfumSJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kasan/quarantine.c:25:
>> mm/kasan/kasan.h:485:2: error: #error kasan_arch_is_ready only works in KASAN generic outline mode!
     485 | #error kasan_arch_is_ready only works in KASAN generic outline mode!
         |  ^~~~~


vim +485 mm/kasan/kasan.h

e2db1a9aa38149 Andrey Konovalov 2021-02-25  481  
af3751f3c2b628 Daniel Axtens    2021-06-28  482  #ifndef kasan_arch_is_ready
af3751f3c2b628 Daniel Axtens    2021-06-28  483  static inline bool kasan_arch_is_ready(void)	{ return true; }
af3751f3c2b628 Daniel Axtens    2021-06-28  484  #elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
af3751f3c2b628 Daniel Axtens    2021-06-28 @485  #error kasan_arch_is_ready only works in KASAN generic outline mode!
af3751f3c2b628 Daniel Axtens    2021-06-28  486  #endif
af3751f3c2b628 Daniel Axtens    2021-06-28  487  

:::::: The code at line 485 was first introduced by commit
:::::: af3751f3c2b6282bebcb56c35bbe4c8b671f80aa kasan: allow architectures to provide an outline readiness check

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
