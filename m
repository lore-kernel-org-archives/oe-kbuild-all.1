Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2223F39DC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 14:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979745; cv=none; b=cse99D+45ZOmWTcqmKFwWAAPuyQ0/1aLRzQVdjCjrfT3ctzlU08xWNcqBd+zZvOI2YBhAQAarMhNySWzr/uTkYMFCuHnXUI45DOY9dfxfxzCFx90Wllx2F0dFDDYBM7L7opToyDj+NF1bIzxIbRK9CfMyx3HaCEAvIEgpCsXfp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979745; c=relaxed/simple;
	bh=ktrqbzCXIAFX6IOlPY5c8uWBxHCQ42JKBfOKP3L9kWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tZCFrxn/f42dOhcYEDJNCtBjrkCXjEJBzCMZ7Zw5eXxIQ6NQ0T8khebfx/YuIvGBzRxPY6+5mlIgyv0QTmqncsZ6wWmjSKxUP0C1aHi+ZYoIg5xHzirJOXK3rfOUfsRr68+1RS3GQfWkX67+efmh9OPIOLlC2bqth2UZ5yV0wgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTHfaTYH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTHfaTYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779979745; x=1811515745;
  h=date:from:to:cc:subject:message-id;
  bh=ktrqbzCXIAFX6IOlPY5c8uWBxHCQ42JKBfOKP3L9kWw=;
  b=aTHfaTYH7BC86FmpLcdOtLj0qfV8wi/zoBcwxBqMCDiD0IGXNBuO2hmH
   Mf04f5MKXUO78yUNMnbEkapxokm2HzJGu2eY0O4GjGa2CxUeifvqrVsMU
   CccvmxWkIlGiVm664qj5V94rYC74/mo5Au83M1sgCYRNjtXWRog++Elzi
   57SIJjOgeGp9FKdPOSMD+SpXNbrD14aI+HdgBef3N9K2cROx1U0XeBcuM
   j7Hsrdg/uyFMFQdbpTnUwe9EiQ77NzwXGuDwSCrLY/GZPsCJ4Ucckd7Mz
   WUBHpkiNtSamFPOnHwhMF7Al3596V3bay7+zRYYVfW+HEw4psnhRWyu58
   w==;
X-CSE-ConnectionGUID: Z8bgVVadQOm+g7zeUZRcLw==
X-CSE-MsgGUID: L1P5wnKPRjmj1thoLqqM6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80675588"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80675588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 07:47:33 -0700
X-CSE-ConnectionGUID: DQOdhzZHR1ybSkKC6TIAdg==
X-CSE-MsgGUID: n+KofyAwR5ipZK9WcObH0Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2026 07:47:32 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSc1C-0000000063W-05Mm;
	Thu, 28 May 2026 14:47:30 +0000
Date: Thu, 28 May 2026 22:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 14/23] <stdin>:1630:2: warning: syscall
 rootns_create not implemented
Message-ID: <202605282236.wpyCdiVC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   e5a6a778f0cd5584723651f07f5e46f765b4b2f5
commit: 6d82dd5dbc48fda06eeb470f65277f277f9ce0d6 [14/23] rootns: Implement rootns_create()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260528/202605282236.wpyCdiVC-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605282236.wpyCdiVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605282236.wpyCdiVC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1630:2: warning: syscall rootns_create not implemented [-W#warnings]
    1630 | #warning syscall rootns_create not implemented
         |  ^
   1 warning generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
