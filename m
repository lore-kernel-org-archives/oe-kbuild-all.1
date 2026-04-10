Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A173822BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775864787; cv=none; b=uWjpqb4/4AooOwZd3gkR1Uf3smLeRcE9rRXsbmMXPx+GVmNfJgqSVHvSsqdCWK57u6BRdewH8CGUzikLvasxt6cjXW8EeowG7DVjHrX3FkCn8hA9dRMawPAf5AbVWsO8Oq2R6shXaZivtv1+FoBDlQCNHhAwIcZc7RigwJQlqdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775864787; c=relaxed/simple;
	bh=mXhqBbgM0hhbDPXFF/cH8/UQJ65Exo0RoUDIYQGQW5U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=epImwCb7j1SPb9e1MIND6DO6yNobrDKBEX02w+Wt1IjZ+mQv1+nJBvIN67RdMAFAYyJCMe9Ysc0YG7jCWujHIb8lYsTtZOMUzu+7ubDC+8JmuulFLKxSpQVXvToSJr+dBLOnGWPWtnko3KVA0Zz3wTKMtWImroTKszDgMksnpd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVAQYTfK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVAQYTfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775864786; x=1807400786;
  h=date:from:to:cc:subject:message-id;
  bh=mXhqBbgM0hhbDPXFF/cH8/UQJ65Exo0RoUDIYQGQW5U=;
  b=OVAQYTfKfzGHROup5BLtt+aolOKLkV7gMiK61jZ2egXlc7VQ0YNY6eBv
   cWI2XZi9iJeFwwmpnmUWrLhSYQxoUcB7bfD2//CTzkyW6Vyj+pb8I4wLR
   cpFhvjJOFZak+sF7HI5t9EWknLhahvarFD//Iorw1yd/caOV6zos6kOIL
   dVivMkkrOBCkkOPqlomRxd1ZGgRoqY+E1Tc/RBq94h/TinBqCuYsZOYNu
   XUjp9lreYE9+W3av1RyTZQU7E96CxsD9x76/jdOQ4OiB1EDlbfBdaKdK7
   QZCp7m4MUDl4S3Y+VWOdgJ7+HRbYvzLsnSsR641lK2hTkzf7Na98RG6Sk
   Q==;
X-CSE-ConnectionGUID: eLGRB/LfQ5iSfwt7aQSalg==
X-CSE-MsgGUID: RUEQjahxRN2a5XWerX16zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="75931844"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="75931844"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 16:46:25 -0700
X-CSE-ConnectionGUID: YS+CuYcyQ7CwrxSREC1RZw==
X-CSE-MsgGUID: 2E8L9KgGQgecE00lnoD1eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="224921982"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2026 16:46:25 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBLYM-000000000Or-1Nem;
	Fri, 10 Apr 2026 23:46:22 +0000
Date: Sat, 11 Apr 2026 07:45:44 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lindholm-alpha:entry 5/6]
 arch/alpha/include/asm/ftrace.h:20:16: error: invalid argument to
 '__builtin_return_address'
Message-ID: <202604110741.iykKycTY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git entry
head:   dd381ec93e43e70caf8dcc4bbad69a43aefb11cb
commit: 19708bb960275d5bbdda1444322df23928485a72 [5/6] alpha: implement lockdep hardirq state tracking
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604110741.iykKycTY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110741.iykKycTY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110741.iykKycTY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ftrace.h:23,
                    from kernel/trace/trace_sched_wakeup.c:16:
   arch/alpha/include/asm/ftrace.h: In function 'alpha_ftrace_return_address':
>> arch/alpha/include/asm/ftrace.h:20:16: error: invalid argument to '__builtin_return_address'
      20 |         return __builtin_return_address(n);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__builtin_return_address +20 arch/alpha/include/asm/ftrace.h

    15	
    16	static void *alpha_ftrace_return_address(unsigned int n)
    17	        __attribute__((__noinline__, __no_instrument_function__));
    18	static void *alpha_ftrace_return_address(unsigned int n)
    19	{
  > 20	        return __builtin_return_address(n);
    21	}
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
