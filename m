Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C571A70C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Dec 2023 23:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWvCED/1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703374148; x=1734910148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0JMTx0pnRlZG3/H0Mhhv6U5McHTECCZbQZwfLa7asOk=;
  b=OWvCED/1GAqtc2xlJ7f4LrQ9XOs7V3IlFNJveQdhkf1tQZoFEyOaEwW/
   dBJnX8/Kp9D3u8vuIUDcfy3z49P3OOakbC95gF3Psao5dTkFtsahW4Hbe
   68dW4U0XRrZSx3JgaznnvOnmutllOL5IzFCRCXsQeHbRvNPT7cO1B+1Uf
   UZp24dMwAy4qkXB2kEHYTkcPpU1oKIYfWy0SpS18ZQxbjHC1v1qHRUl6A
   /0J+Wig+UHR6jakS1cY2o2myAy8rDL+aFb6anHWVIR0dHxEw8RIleOULz
   dHrJKW6RuoHLuxm786v1waGEzTftTgUrTBQptL21/sladpl9PG0PQ6q7m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="3467748"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="3467748"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2023 15:29:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="868053020"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="868053020"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Dec 2023 15:29:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHBQU-000Bcx-1E;
	Sat, 23 Dec 2023 23:29:03 +0000
Date: Sun, 24 Dec 2023 07:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 359/412] mm/kasan/kasan.h:313:32: error:
 'KASAN_SHADOW_END' undeclared; did you mean 'KASAN_SHADOW_INIT'?
Message-ID: <202312240755.MqsWuTno-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   236f2fb63c10e919d7220c5f5f1fa8e97ed68c42
commit: 6a0dc1126fa6b65ba9b92f0c0a831baa57c827bf [359/412] kasan: improve kasan_non_canonical_hook
config: xtensa-randconfig-002-20231223 (https://download.01.org/0day-ci/archive/20231224/202312240755.MqsWuTno-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312240755.MqsWuTno-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312240755.MqsWuTno-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/kasan/init.c:20:
   mm/kasan/kasan.h: In function 'addr_in_shadow':
>> mm/kasan/kasan.h:313:32: error: 'KASAN_SHADOW_END' undeclared (first use in this function); did you mean 'KASAN_SHADOW_INIT'?
     313 |                 addr < (void *)KASAN_SHADOW_END;
         |                                ^~~~~~~~~~~~~~~~
         |                                KASAN_SHADOW_INIT
   mm/kasan/kasan.h:313:32: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from mm/kasan/report.c:34:
   mm/kasan/kasan.h: In function 'addr_in_shadow':
>> mm/kasan/kasan.h:313:32: error: 'KASAN_SHADOW_END' undeclared (first use in this function); did you mean 'KASAN_SHADOW_INIT'?
     313 |                 addr < (void *)KASAN_SHADOW_END;
         |                                ^~~~~~~~~~~~~~~~
         |                                KASAN_SHADOW_INIT
   mm/kasan/kasan.h:313:32: note: each undeclared identifier is reported only once for each function it appears in
>> mm/kasan/kasan.h:314:1: warning: control reaches end of non-void function [-Wreturn-type]
     314 | }
         | ^


vim +313 mm/kasan/kasan.h

   309	
   310	static __always_inline bool addr_in_shadow(const void *addr)
   311	{
   312		return addr >= (void *)KASAN_SHADOW_START &&
 > 313			addr < (void *)KASAN_SHADOW_END;
 > 314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
