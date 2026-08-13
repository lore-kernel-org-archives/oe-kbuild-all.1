Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94A13537D0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 04:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786593773; cv=none; b=BYbd1HeWbzmNYmU4dkCToD4BtCeyqOjpalCIF4Mm4cHuRJk+emGXjO79w2rq12W7XvNLBVeGcuUcGgDri7yQmn9UOrHxFkKrfrbzMN4knM6csoIjeGIOwgiSExEDsf7FtTGyV7Oz+GD1m0kuqerUnEZE+2msyqdNtgIiaFtSWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786593773; c=relaxed/simple;
	bh=hW+7kOG14KZpdw0t9x6IVetrxl7ttMBfZDSreug1vMs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PX1jrdw/GoVQX2lrR5fmQmLRIUnON5z1kq5uMgYx0X8KwIMTFvp3Q3dL5CUr95uEsWLPWH8rgfOVPNb9/bz0Cc08QiBUVVsIO/Bju/C0v/aykvf7T0ihPGsdpvYfgd+A7iOC+bARrIn6aGc4J2atISk1XBbbcaycahQFztQvrqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UdVlfwyU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UdVlfwyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786593771; x=1818129771;
  h=date:from:to:cc:subject:message-id;
  bh=hW+7kOG14KZpdw0t9x6IVetrxl7ttMBfZDSreug1vMs=;
  b=UdVlfwyUUoTK7RaYW8GxBdX70zuWcG8QcuNfNSGP8XIVkW6PfAo4lArA
   f3kel+YUKkC3h6oiyxuU3oOEcclNa+mq9w8Rx9sRRXuwLI9/IVPr8Gu9j
   WaqVf87r3YoxPC0+Kk+ooffHCLIekM8e9AS4yTRNOmiT/Jf+4j1DUTJdM
   7GTbGdZ7Gu5lqji7bIO8kiRVlimMqyLuWxGOaTYfqHyttLVD12eHlerH9
   XaJFoN+y0lqGgDuMKUCnZpcE1nEpaUrK/GegPSt5prh8H0jwL3DrG3Hzb
   JMSLGjZtJi768oWRFWOIR+RjORiuuts+Sq0yasvvel+sSSvT/OY1zduLW
   A==;
X-CSE-ConnectionGUID: um6jGzOpQDWoZcLZ/mNUyw==
X-CSE-MsgGUID: aLii0nmbQrucSerIdztjmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104546408"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104546408"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 21:02:51 -0700
X-CSE-ConnectionGUID: pPxibfA/SReNsSI+pDU9gQ==
X-CSE-MsgGUID: F8UrlGJsSQS55X6jGK5V4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="302087774"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Aug 2026 21:02:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuMeV-00000000Skk-02gT;
	Thu, 13 Aug 2026 04:02:47 +0000
Date: Thu, 13 Aug 2026 12:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 1/7]
 arch/xtensa/kernel/hibernate.c:9:57: error: '__nosave_begin' undeclared; did
 you mean 'nosave_begin_pfn'?
Message-ID: <202608131108.nV3V1YcN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   5a75fff46226e59e4c4d87c36f7de79ec4cabdb4
commit: fe4eb6e120822a6de3c06fbe07bc359b78dd3bda [1/7] headers: Remove swap.h from suspend.h
config: xtensa-randconfig-001-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131108.nV3V1YcN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131108.nV3V1YcN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131108.nV3V1YcN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/memory_model.h:5,
                    from arch/xtensa/include/asm/page.h:176,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/xtensa/kernel/hibernate.c:3:
   arch/xtensa/kernel/hibernate.c: In function 'pfn_is_nosave':
>> arch/xtensa/kernel/hibernate.c:9:57: error: '__nosave_begin' undeclared (first use in this function); did you mean 'nosave_begin_pfn'?
       9 |         unsigned long nosave_begin_pfn = PFN_DOWN(__pa(&__nosave_begin));
         |                                                         ^~~~~~~~~~~~~~
   include/linux/pfn.h:11:27: note: in definition of macro 'PFN_DOWN'
      11 | #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT)
         |                           ^
   arch/xtensa/kernel/hibernate.c:9:51: note: in expansion of macro '__pa'
       9 |         unsigned long nosave_begin_pfn = PFN_DOWN(__pa(&__nosave_begin));
         |                                                   ^~~~
   arch/xtensa/kernel/hibernate.c:9:57: note: each undeclared identifier is reported only once for each function it appears in
       9 |         unsigned long nosave_begin_pfn = PFN_DOWN(__pa(&__nosave_begin));
         |                                                         ^~~~~~~~~~~~~~
   include/linux/pfn.h:11:27: note: in definition of macro 'PFN_DOWN'
      11 | #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT)
         |                           ^
   arch/xtensa/kernel/hibernate.c:9:51: note: in expansion of macro '__pa'
       9 |         unsigned long nosave_begin_pfn = PFN_DOWN(__pa(&__nosave_begin));
         |                                                   ^~~~
>> arch/xtensa/kernel/hibernate.c:10:53: error: '__nosave_end' undeclared (first use in this function)
      10 |         unsigned long nosave_end_pfn = PFN_UP(__pa(&__nosave_end));
         |                                                     ^~~~~~~~~~~~
   arch/xtensa/kernel/hibernate.c:10:40: note: in expansion of macro 'PFN_UP'
      10 |         unsigned long nosave_end_pfn = PFN_UP(__pa(&__nosave_end));
         |                                        ^~~~~~
   arch/xtensa/kernel/hibernate.c:10:47: note: in expansion of macro '__pa'
      10 |         unsigned long nosave_end_pfn = PFN_UP(__pa(&__nosave_end));
         |                                               ^~~~


vim +9 arch/xtensa/kernel/hibernate.c

733f5c28e59ef2 Max Filippov 2022-04-20   6  
733f5c28e59ef2 Max Filippov 2022-04-20   7  int pfn_is_nosave(unsigned long pfn)
733f5c28e59ef2 Max Filippov 2022-04-20   8  {
733f5c28e59ef2 Max Filippov 2022-04-20  @9  	unsigned long nosave_begin_pfn = PFN_DOWN(__pa(&__nosave_begin));
733f5c28e59ef2 Max Filippov 2022-04-20 @10  	unsigned long nosave_end_pfn = PFN_UP(__pa(&__nosave_end));
733f5c28e59ef2 Max Filippov 2022-04-20  11  
733f5c28e59ef2 Max Filippov 2022-04-20  12  	return	(pfn >= nosave_begin_pfn) && (pfn < nosave_end_pfn);
733f5c28e59ef2 Max Filippov 2022-04-20  13  }
733f5c28e59ef2 Max Filippov 2022-04-20  14  

:::::: The code at line 9 was first introduced by commit
:::::: 733f5c28e59ef23fef9e0b64d79df24c2a4eed2b xtensa: add hibernation support

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
