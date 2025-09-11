Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D77A635
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 17:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757613586; cv=none; b=JTUGWuM/+KvgKVjcrsUBTteJnWrU4O8WRpPviMugrXbuHSfB1iG1AmWwTt0EWkFP2hMiohauhzuzETBck+vnZO/D7aaSgTZto6TmKIFYAnv92m+40fa9sbhLolDPY2E6nghbo6YIBqVjKSzasImzlblp3tqSP8gzFG4Ggfa3+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757613586; c=relaxed/simple;
	bh=Iukzt6aNhsR+aY0Aq8R6QT1xq7aEs4qAi4SmRC0oG6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JwGomfD0sZK6q3nYLjirP9uD77FK+By5UW5gMQfT5VZ0iAf7kl0lXjU1CWk06cwLDi559qshz1U2T9XzUAkliEoeyWaT3uc5EY8B7iKvSXhwM8m3SWVpGVjW0vu42jHfsYuFg3OdBHgKDUyYCZdpp9KHzZgMLk3DIkcCxq55TdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAmEl4FE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAmEl4FE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757613585; x=1789149585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iukzt6aNhsR+aY0Aq8R6QT1xq7aEs4qAi4SmRC0oG6M=;
  b=iAmEl4FEBqZqQSkdgHqVpdzhygYoLl6eIGmMWe/dBDydKniTlQZFDcSa
   JnfiHi20mP9t8cvcA9Pua08Qo5Gdy3rM6xHRXYxbv6oGntjmsvbfApcz7
   PfzE5ve71u6GJym4HchYPYzGWx0iq3qsWap84BrESb/DhQ7e8DOW4ceVI
   K4f7qz6rwiW0m51yZgd6vM+RAybdWSVlHN7r/T3TwtTIdvOS1aJmOL8ID
   7GQBXCVwiIbTRPbesMQIffDMAabyC8BjqXoh0JSiGSmRWtzpw6L/rrRJ1
   EYNKPq+6WE77p6I/t3LyV2TIAtXQZwKbRIq2MZASq9xds06YTzkSK4x9C
   Q==;
X-CSE-ConnectionGUID: tFPiZx5ZSNKriZbnG67YRQ==
X-CSE-MsgGUID: RnFdzwuFTfG0+e1UO7pT9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47526643"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="47526643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 10:59:44 -0700
X-CSE-ConnectionGUID: rs4GM2wWRE2bXh3iVcI/JQ==
X-CSE-MsgGUID: h5KEzvAPS82q/CF1iXKFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="174549230"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2025 10:59:44 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwla9-0000Xo-1e;
	Thu, 11 Sep 2025 17:59:41 +0000
Date: Fri, 12 Sep 2025 01:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/slice 29/58] rseq.c:(.text+0x1c2): dangerous
 relocation: unsupported relocation
Message-ID: <202509120155.pFgwfeUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   67e3ae80545f8f9dd42404e0ea3de266dc672942
commit: c99cb5686546c4a8229b00a04d9ff146f71989f3 [29/58] rseq: Provide and use rseq_update_user_cs()
config: arm-randconfig-002-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120155.pFgwfeUD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120155.pFgwfeUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509120155.pFgwfeUD-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/rseq.o: in function `rseq_debug_update_user_cs':
   rseq.c:(.text+0x1c2): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in kernel/rseq.o
>> rseq.c:(.text+0x1c2): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: rseq.c:(.text+0x1fc): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in kernel/rseq.o
   rseq.c:(.text+0x1fc): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: rseq.c:(.text+0x21c): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in kernel/rseq.o
   rseq.c:(.text+0x21c): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: rseq.c:(.text+0x240): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in kernel/rseq.o
   rseq.c:(.text+0x240): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: kernel/rseq.o: in function `__rseq_handle_notify_resume':
   rseq.c:(.text+0x2b8): undefined reference to `__get_user_bad'
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in kernel/rseq.o
   rseq.c:(.text+0x2b8): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: kernel/rseq.o:rseq.c:(.text+0x33e): more undefined references to `__get_user_bad' follow
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in kernel/rseq.o
   kernel/rseq.o: in function `__rseq_handle_notify_resume':
   rseq.c:(.text+0x33e): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in kernel/rseq.o
   rseq.c:(.text+0x344): dangerous relocation: unsupported relocation
   arm-linux-gnueabi-ld: (__get_user_bad): Unknown destination type (ARM/Thumb) in kernel/rseq.o
   rseq.c:(.text+0x34a): dangerous relocation: unsupported relocation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
