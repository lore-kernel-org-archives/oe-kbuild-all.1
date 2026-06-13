Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376151DF26E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781357647; cv=none; b=RzfUZnS+lhvVuFBld4UYiyuFbLrs4it7WYfOBIBBh+j5WMr1qWZa4tGRmA7CzAxPTGJ6yT3CbkHhuvM+J2+M/FRFfVl3/6tHebZn4t2I5c7Mr0ItD9Qd7WaVNtOf8PvKJEVWlSCX6ARAy01ET/NqO5c4gwl2/2gAUBBbaihkVI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781357647; c=relaxed/simple;
	bh=E4UZoP6+j0oSr17LsPhGh4dhikYu9s2fACbDS4iOdSI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IVkdbs4AAkWI/A4fOz+H5NPhBHIB//iGUC8xfEf+YuxLIhGJ9tAaiEMbkGQMRrARJYjGWEOUWjyfTfaputBc3lBPzBhEabT4tEThsJfq1tpLccvBFzB8YU7RZCGWnSstOJ+1xtHOV1K72ZguHDhdA9334WfCzs+CVg+D0A49zCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpGAAQUm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpGAAQUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781357646; x=1812893646;
  h=date:from:to:cc:subject:message-id;
  bh=E4UZoP6+j0oSr17LsPhGh4dhikYu9s2fACbDS4iOdSI=;
  b=UpGAAQUmn/AqfeVMpyzi77BA4BZbpkdgEsWr2siviex0hHnOc29lcdDc
   PW3ZoDTDLMXEG7I0cC7p1si5FM/Rcx1I+X7jQr30Mdc5UcXEzguiJE2aC
   MT1uS9K6xjQ6fTtlRCgymIfxtq9eU72vE18mFDNYtlB2lLw2hWB8SDPFy
   Vyg2MvhR1aul9HZKOJCgS7RkiV0hUw9+7BW+bgaEeZaBDpEmc23bypwhU
   boHoQOVOtyvN+DBjLbaw58kcMDa2l2VPOV0r52AlLMPvk2lIoEwVgwJHU
   BkV4hr2UaICfnc6YypF3IDpRvF/tM5H3OpiiqhKBN2EHTMoBEgFil3M4x
   Q==;
X-CSE-ConnectionGUID: CY5kbfW4T1K+IJumomlkYw==
X-CSE-MsgGUID: KzaBCmwuQpeG8oPQZeLIig==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81182373"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="81182373"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 06:34:05 -0700
X-CSE-ConnectionGUID: ERzYyK25SF+6oDvahxWnPg==
X-CSE-MsgGUID: 2idmieuwSd+EOkNxSPqMEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="251994304"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jun 2026 06:34:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYOUr-00000000PwQ-293f;
	Sat, 13 Jun 2026 13:34:01 +0000
Date: Sat, 13 Jun 2026 21:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.2 21/21]
 include/linux/gpio/consumer.h:177:27: error: invalid use of undefined type
 'const struct gpio_desc'
Message-ID: <202606132134.PUwuexzI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.2
head:   24fae1df029804f4339484870fcdc70fe15fab97
commit: 24fae1df029804f4339484870fcdc70fe15fab97 [21/21] gpiolib: introduce gpio_name() helper
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260613/202606132134.PUwuexzI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132134.PUwuexzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132134.PUwuexzI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/nvmem-provider.h:16,
                    from include/linux/rtc.h:18,
                    from arch/m68k/kernel/setup_no.c:34,
                    from arch/m68k/kernel/setup.c:5:
   include/linux/gpio/consumer.h: In function 'gpiod_name':
>> include/linux/gpio/consumer.h:177:27: error: invalid use of undefined type 'const struct gpio_desc'
     177 |         return desc ? desc->name : "(no gpio)";
         |                           ^~


vim +177 include/linux/gpio/consumer.h

   174	
   175	static inline const char *gpiod_name(const struct gpio_desc *desc)
   176	{
 > 177		return desc ? desc->name : "(no gpio)";
   178	}
   179	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
