Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74B10A23
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 06:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709360100; cv=none; b=SSoRJPu/q7rHaiQC07M6Ms9kCIodFlk4K/EjjWpnbZIHvK3xRYeDm56eBagki8w6I1hNMq6JC7r/xo1YHA2xKC8Zg9oFp6FoZgTB3C6yM1dadbK/4II2ZAspsd5sw823c/W8PKYsDU3QbKU7/2Mnylk57yE+cB0DeP9bUv6131o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709360100; c=relaxed/simple;
	bh=XQP4gxlG7ZA79otB50nyQTKEFo/oK6cS4qQwD6yHwUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LviEQ4fgXbsBadcYKijIPHBqfYQtqNFxgR6aYz+JPP5z0Gu26mUEZhuvM2AF5K12yu9iAtAURq/EHkENs79nLFxi7JFRCyZrg8hM2GvQpjGm9Gzw3GA2b3NWZriAb/GQJT++HDNtDvjCAHdtWflJZt5HScrl86rpbwWnYws7sbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrtSuBn8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrtSuBn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709360098; x=1740896098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XQP4gxlG7ZA79otB50nyQTKEFo/oK6cS4qQwD6yHwUE=;
  b=KrtSuBn8Yb9qIjUS1g0OjBxesW5wcvMfKzz8qGseeXTgWWMeAhycNtF/
   ZXx3Xgpd55tgMpfpuLd8arR8xVw5GAAIbnf/atS3oLtztRbwVu46y2moW
   snuDWBA27CmwWTUzXla/cToqptyddFKGEuHBszcKwD0vFIhcNb9kPU9XK
   POYzT4SLI9cIJ5Oeg2AhnjcnEm8i4v9J847MAYwdjxmlIDXv4vwaaOj5I
   L42iB2PksW+6MjlnNv5/3wsDbgwWq/RUVKsMapnL4qQfOWZxLBOkfHPb/
   6Bgg90TeqMZ7mJw1GCuHcNLmjBwFVQtuoOTGv3pIQkoP4kKXiQHMB4ye2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="15320476"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="15320476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 22:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="39245048"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2024 22:14:56 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgIe6-000EN1-07;
	Sat, 02 Mar 2024 06:14:54 +0000
Date: Sat, 2 Mar 2024 14:14:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhoukaiqi <zhoukaiqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3630/3767] include/linux/ras.h:45:1: error: type
 specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <202403021409.FLAeOOj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   236cb940335e3542c9d5ac16b5d8546a0cbbdfc1
commit: fa75636857993e25030c3db31444d2aa01d5d9de [3630/3767] RAS: Report ARM processor information to userspace
config: x86_64-randconfig-003-20240301 (https://download.01.org/0day-ci/archive/20240302/202403021409.FLAeOOj5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021409.FLAeOOj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021409.FLAeOOj5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/mce/core.c:36:
>> include/linux/ras.h:45:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         | ^
         | int
>> include/linux/ras.h:45:51: warning: non-void function 'log_arm_hw_error' should return a value [-Wreturn-type]
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         |                                                   ^
>> include/linux/ras.h:45:1: warning: no previous prototype for function 'log_arm_hw_error' [-Wmissing-prototypes]
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         | ^
   include/linux/ras.h:45:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
      45 | log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
         |                 ^
         |                 static 
   2 warnings and 1 error generated.


vim +/int +45 include/linux/ras.h

fa75636857993e Shengwei Luo  2022-02-23  40  
fa75636857993e Shengwei Luo  2022-02-23  41  #ifdef CONFIG_RAS_ARM_EVENT_INFO
0607512d0a8d7f Arnd Bergmann 2017-06-27  42  static inline void
fa75636857993e Shengwei Luo  2022-02-23  43  log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev) { return; }
fa75636857993e Shengwei Luo  2022-02-23  44  #else
0607512d0a8d7f Arnd Bergmann 2017-06-27 @45  log_arm_hw_error(struct cper_sec_proc_arm *err) { return; }
297b64c74385fc Tyler Baicar  2017-06-21  46  #endif
297b64c74385fc Tyler Baicar  2017-06-21  47  

:::::: The code at line 45 was first introduced by commit
:::::: 0607512d0a8d7fac86667466b884095e04b10a59 ras: mark stub functions as 'inline'

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
