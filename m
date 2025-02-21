Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0475E1FBE8E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740137773; cv=none; b=WSZUR9l3drc/bB/JF4+1NPplIHQoZetY4560DkZs9txzl+PRBqvpFEUxq7rpnkYiSZo13aS1P3LVnM2o8Eeo9/sAFpy01qHJER17Hd0m6vIDxZBXcjOkLg9PCpzg+32EN4/UvHKxu3FWdOmL4ig10IqVQoj12D/KBK/fB0/rQi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740137773; c=relaxed/simple;
	bh=fdaxToFFaHqcAHURT5RxKU1RY8OBnLB2TcVeS5Ncv40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eXb1Gcz8LYXLHHKjsujq5PbgHDGeUvM6EUgu/j8gM8pgrvDa78S52vHgCBB2kskW5AbnINT5ziecZFL8MD9YqqwAF2n2d98MKSz6D+CXER4SYZ+b0oZ+mdmPHNh+i1j4qtxXBLvJKhxg8hVdhYDtrqJQxTAFENhygpbhR6fhDe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsKkTdru; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsKkTdru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740137771; x=1771673771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fdaxToFFaHqcAHURT5RxKU1RY8OBnLB2TcVeS5Ncv40=;
  b=VsKkTdruiOAY0IRuFHWrKiAR3ES7okVib76q7AlaQwF9dTNiGQlvx++d
   H9ydb0t6j/YnVpTrqgUfwoHFWu7Z4wIXCJCl589iO8r0SY6M2pg7n2PM+
   dXCSsnOUa1j4SEMdOp10ow9ulvQg7A41Vu3a3q1n0xqCP/leB0imIgK43
   gBopXoxXbzbehO/6MZK08X2tTrUPjL7pHegqzJcEfXoWlfrIcLBR0m+Wm
   AOoXfb+wDuwkw1kqLLp+ptOX78I3S1UDMAZOTQfRoEv8asLLgTiFyd8Rl
   fGDo0WBahUjb54jrXu175HjJVY0uJhq7sRodgro9IRg8Gv0di0vLkQ0Iu
   w==;
X-CSE-ConnectionGUID: D9BwTk/WREy9Sj0msT8JnQ==
X-CSE-MsgGUID: wFPGhN7QTDqnhTr9b/7BrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44869902"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="44869902"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:36:09 -0800
X-CSE-ConnectionGUID: Va3cWfcJSNyJaPXpof/v2Q==
X-CSE-MsgGUID: 4woC1rnDQ6awS3+mKcgB0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="115349460"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Feb 2025 03:36:09 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlRJu-0005S5-2c;
	Fri, 21 Feb 2025 11:35:55 +0000
Date: Fri, 21 Feb 2025 19:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 1/1] mm/kasan/report.c:104:2: error: call to
 undeclared function 'hw_suppress_tag_checks_start'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202502211934.xrSFy8im-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   2ceb61dcb8306f85332e2a4a0f8d2dda2b30d111
commit: ac77fe0577ca694d7689bb60da939dc8d25fa2dd [1/1] kasan: suppress recursive reports for HW_TAGS
config: arm64-randconfig-001-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211934.xrSFy8im-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211934.xrSFy8im-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211934.xrSFy8im-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/kasan/report.c:104:2: error: call to undeclared function 'hw_suppress_tag_checks_start'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           hw_suppress_tag_checks_start();
           ^
>> mm/kasan/report.c:113:2: error: call to undeclared function 'hw_suppress_tag_checks_stop'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           hw_suppress_tag_checks_stop();
           ^
   2 errors generated.


vim +/hw_suppress_tag_checks_start +104 mm/kasan/report.c

    95	
    96	static void report_suppress_start(void)
    97	{
    98	#ifdef CONFIG_KASAN_HW_TAGS
    99		/*
   100		 * Disable preemption for the duration of printing a KASAN report, as
   101		 * hw_suppress_tag_checks_start() disables checks on the current CPU.
   102		 */
   103		preempt_disable();
 > 104		hw_suppress_tag_checks_start();
   105	#else
   106		kasan_disable_current();
   107	#endif
   108	}
   109	
   110	static void report_suppress_stop(void)
   111	{
   112	#ifdef CONFIG_KASAN_HW_TAGS
 > 113		hw_suppress_tag_checks_stop();
   114		preempt_enable();
   115	#else
   116		kasan_enable_current();
   117	#endif
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
