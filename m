Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9182F99A3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 10:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328088; cv=none; b=AwE9Tl2ZsN01ofF5YoJwhAq9vzl0XYMraHROsf1M/tP5/yTlUjClz0SImyEzYzmWJJ5I+kSGzikU/1h+ZK+/SxW/YE1/ahWuC/kqgpEseIyDF5SyoxKVqe4jmHFJbQwch0NpUPk0TmxW2Wz+vu14gjf63NVAQMFK5AcErR+6yqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328088; c=relaxed/simple;
	bh=m1X5N/BZqc111JWYV6xdoAQBxqdiBdk9lUy6xVY6aDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBrFObe5kzNWi1iSGpBMhfH+Q5MN1WyFIGeHHKA+AygyNylCPkm0iEiTJG6ZqV93M5by0UAaWvfNPgFokAxBKuNsKfingCxsQJujNtAOPDnwSs0PBOZwGZEqFFGXjG4k8YHTpavCXeEcqtVTYZPK5f6pP1/Np0ZjxoWMza3qeBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVJyHb7K; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVJyHb7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757328086; x=1788864086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1X5N/BZqc111JWYV6xdoAQBxqdiBdk9lUy6xVY6aDw=;
  b=YVJyHb7KNNwkr0HUYpe/3yQ6L9GWScd1XPPN34b2eeKP7nC0bmsDiFJh
   fzPcoOwGJ90eDVjOIKCxPGe5kRTTMFQJH6IocVGhjBnTF+DNcSCBL1q35
   sWd4j2MtMDwIQ8rEcwNiqqhf9hCyJ0kG5MB1Sl2yxOXBhLMY3XwGSvwoR
   fxwD31/AqVu6tv0FAVGDHmfPmG3kTlIvT/olIhdSnsG0zMS7xevc8RIEn
   YwTOqjanzqS2negufMfElCU5fZ13MmRtn9sGqyTVu+FGbY6/ZSR+oFNdO
   R6SlisAV+28Hxvmiys6D0CjJ3vOaWnNHdek1g8dNUHCScxmppIDomsOcJ
   g==;
X-CSE-ConnectionGUID: EgvY9LdbS8Wi+UZ9PGOYfw==
X-CSE-MsgGUID: +4Xu3OchR3KKgNktIFqGlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="63220772"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="63220772"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:41:25 -0700
X-CSE-ConnectionGUID: GfjKTNpVQuGt+WZ8Tue61g==
X-CSE-MsgGUID: 4pdwswjvRzGibSYsGbpBGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="176814630"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Sep 2025 03:41:25 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvZJK-0003jt-24;
	Mon, 08 Sep 2025 10:41:22 +0000
Date: Mon, 8 Sep 2025 18:40:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-timens-sparc 2/2]
 include/vdso/processor.h:10:10: fatal error: asm/vdso/processor.h: No such
 file or directory
Message-ID: <202509081824.ANbUMoic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-timens-sparc
head:   5bb28391ccf10c9818cd5251f103f74271c9a3f0
commit: 5bb28391ccf10c9818cd5251f103f74271c9a3f0 [2/2] timens: Remove hard dependency on vDSO
config: csky-randconfig-002-20250908 (https://download.01.org/0day-ci/archive/20250908/202509081824.ANbUMoic-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250908/202509081824.ANbUMoic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509081824.ANbUMoic-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/datapage.h:21,
                    from kernel/time/namespace.c:21:
>> include/vdso/processor.h:10:10: fatal error: asm/vdso/processor.h: No such file or directory
      10 | #include <asm/vdso/processor.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +10 include/vdso/processor.h

d8bb6993d871f5 Vincenzo Frascino 2020-03-20   9  
d8bb6993d871f5 Vincenzo Frascino 2020-03-20 @10  #include <asm/vdso/processor.h>
d8bb6993d871f5 Vincenzo Frascino 2020-03-20  11  

:::::: The code at line 10 was first introduced by commit
:::::: d8bb6993d871f5d3cd6d65d3772e4b1f4ef17380 common: Introduce processor.h

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
