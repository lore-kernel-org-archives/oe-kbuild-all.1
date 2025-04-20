Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F0E15CD74
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745140468; cv=none; b=t7g1L7Eb89Ejraloh8UuIBNPfLuOfVmdlNEl58LQVaoyoXR+DpQu2iqKQOzc34bL1Jqg2/+4RbGznnWL1MHk24ZL0txS/ayn/ar8DM6xJHSgoYYJzr1IIyZ8trfeHTps10jxXcNB3WXkR9fOZh9YdTm+iYlT7VH7CQfFvA9kKEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745140468; c=relaxed/simple;
	bh=zULsQ6DBsd5WkhsfH3s4CR2aOnaViC06H+IRVYzIrsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fqzwIx0G10qp0anpheelG2S6u/PBD49qMWB7+O1wRGbyBprFHOqJxZqIWjUNwYErdJFpPrXG12cfAWUxfCWv17AIgEWYtx60OM3CpCklt9w67AEw6XvJM+K+apNkmdBhZzJ6sciSBezRnDpH4EL8UxJh1hSFWANfbWHFeBg15W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+57/TS8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+57/TS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745140467; x=1776676467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zULsQ6DBsd5WkhsfH3s4CR2aOnaViC06H+IRVYzIrsg=;
  b=N+57/TS8zHWoLAeoCiaiDn5AsNA9PPJDSK211yp+M8lZNmfw7JE6tShm
   IXxtLeadNinPxmJnDDs/BgSXhCmZtaJwDDmt9J9RlnFlgfgIh1NmtJ4cD
   Qxbgcpo698INkv7/ZJJit5f3IeCeW2vhb9viKHobQLXwZKzNQPkdGze0Z
   GvM83guoEFE6S46Di3K02ozLahqWNNaxdiQKohXgBxrzv7+6xXDKxsNRw
   Mfr/mq1QUvRSt7NE+1Xu/A1r5NCAQbXMXBBKJlA3BogVxLSLcToWIjqjd
   8/U4rOGnNop83cDgkz6GjY+Tl97VWFR950AV9mI/e9q9Uafq2+Y1xl4/P
   g==;
X-CSE-ConnectionGUID: 5R80bjvcRwa7hTMqtQnX8g==
X-CSE-MsgGUID: HXRMM5TdTP2igbHJTo17zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="34322039"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="34322039"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 02:14:27 -0700
X-CSE-ConnectionGUID: 0XDWh7l8RxSkKN7kBNPQcw==
X-CSE-MsgGUID: WVlHYTW0QY+bRRb5hnC+Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131772444"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Apr 2025 02:14:26 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6Qkp-0004YU-2a;
	Sun, 20 Apr 2025 09:14:23 +0000
Date: Sun, 20 Apr 2025 17:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 1/6]
 drivers/hwmon/hwmon-vid.c:18:10: fatal error: 'asm/msr.h' file not found
Message-ID: <202504201741.RQzWWTgi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git rdpmc_cleanup
head:   ef950ee41d42e00ff671e4022ddc8faac83ffeb2
commit: dba1f6081fb02af0af96937b167d27555e293ff3 [1/6] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
config: arm-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504201741.RQzWWTgi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504201741.RQzWWTgi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504201741.RQzWWTgi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/hwmon-vid.c:18:10: fatal error: 'asm/msr.h' file not found
      18 | #include <asm/msr.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +18 drivers/hwmon/hwmon-vid.c

    17	
  > 18	#include <asm/msr.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
