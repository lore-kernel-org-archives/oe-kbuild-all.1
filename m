Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1206C635
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757793944; cv=none; b=Ucjvn7fB7YRVkSX0NOyBB1MmqXdV2ftz2W9KIPACx1oTQklLybgbZhPFGM1vDTA4G5keNwxyOaWqxvu90ZiY2EErLQymxXdnn+amN+MWuTGbkTAtyGmDxqH56gRZJZWImODz/FwAlXSVgTX+RCkdfVZRUVaD20dS9Omt4yBOxdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757793944; c=relaxed/simple;
	bh=/UzPRFVXWbIMzY3M92op5YprIO11L+Rnv7KJyB9sQMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M9RsDh5GI7tjneADpa9bVYzuGHTX67F9QB10uv9i8hSnSSpB6uMGTMdVMub2kRTHlygZEGzLJoZI7ATX0pxCdR1Br52us2QZeEtLEyXSwyZNZnLFdlwshzJ6vRJPVOtgHROYVqvQu9rORr1BlCmVRCQ1r1D+CUELc8sw66TZNrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcgJH+ms; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcgJH+ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757793942; x=1789329942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UzPRFVXWbIMzY3M92op5YprIO11L+Rnv7KJyB9sQMk=;
  b=gcgJH+msO3WrQlQ7b6boP/jK2CaJamkKvhmHXN4r9uakkBI7HpEmWA19
   Rm8P081n7uCrnBdaClukvvg9QS9c1guyh5zDLzEQf7QEvLFS82kW8imcW
   uofjJKCV5J4P6ppjZSLtoIeULywhKjjK1barOEnpi/Gufcpuj8AuY98Xw
   E0x6c6osXKBoUVGp4XVGKIVlwvZqgn27caXDPBpOShNtfN1WqoUlQ9QGk
   VhKCwNAtMTXEAufWyi5jJZqXon5Al0KRvbVRzSgppp2IxtRNhQLVpu0Zx
   hqlIIanWCOZSzBv8d/tyERXRhdrXS1X6gU+GHku6f7Zdt2pjkh4MC5hdO
   g==;
X-CSE-ConnectionGUID: Hw+eWr1IQD6J0WSXaq6kdg==
X-CSE-MsgGUID: XhbZTyAGSaqQ0rZ4+6wuAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="71473251"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="71473251"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 13:05:42 -0700
X-CSE-ConnectionGUID: gmiPmKDsQluuLo8lC+r3Kg==
X-CSE-MsgGUID: GeX27iRfR7mEVlcaBoHD4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="197981062"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Sep 2025 13:05:40 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxWV8-0001pI-1M;
	Sat, 13 Sep 2025 20:05:38 +0000
Date: Sun, 14 Sep 2025 04:04:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3]
 include/linux/minmax.h:93:30: warning: large integer implicitly truncated to
 unsigned type
Message-ID: <202509140439.6WqXQvAK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Huang,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2a596b3e63caa79c42eb06d6824fe7d25586e8c1
commit: 99185c10d5d9214d0d0c8b7866660203e344ee3b [3/3] resource, kunit: add test case for region_intersects()
config: arm-randconfig-r132-20250914 (https://download.01.org/0day-ci/archive/20250914/202509140439.6WqXQvAK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140439.6WqXQvAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509140439.6WqXQvAK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ioport.h:15:0,
                    from kernel/resource.c:15:
   kernel/resource.c: In function 'gfr_start':
>> include/linux/minmax.h:93:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
     ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
                                 ^
   include/linux/minmax.h:96:2: note: in expansion of macro '__cmp_once_unique'
     __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
    #define min_t(type, x, y) __cmp_once(min, type, x, y)
                              ^~~~~~~~~~
   kernel/resource.c:1838:9: note: in expansion of macro 'min_t'
      end = min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
            ^~~~~
   kernel/resource.c: In function 'gfr_continue':
>> include/linux/minmax.h:93:30: warning: large integer implicitly truncated to unsigned type [-Woverflow]
     ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
                                 ^
   include/linux/minmax.h:96:2: note: in expansion of macro '__cmp_once_unique'
     __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:213:27: note: in expansion of macro '__cmp_once'
    #define min_t(type, x, y) __cmp_once(min, type, x, y)
                              ^~~~~~~~~~
   kernel/resource.c:1855:11: note: in expansion of macro 'min_t'
      addr <= min_t(resource_size_t, base->end, MAX_PHYS_ADDR);
              ^~~~~


vim +93 include/linux/minmax.h

d03eba99f5bf7c David Laight   2023-09-18  91  
017fa3e8918784 Linus Torvalds 2024-07-28  92  #define __cmp_once_unique(op, type, x, y, ux, uy) \
017fa3e8918784 Linus Torvalds 2024-07-28 @93  	({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
017fa3e8918784 Linus Torvalds 2024-07-28  94  

:::::: The code at line 93 was first introduced by commit
:::::: 017fa3e89187848fd056af757769c9e66ac3e93d minmax: simplify and clarify min_t()/max_t() implementation

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
