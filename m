Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9348EAE7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 05:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765000424; cv=none; b=fOQXaphpkqZl1rAUTfEPhs47mBFd10rs7/4pBzSnrUtpC6Qd2dnE8H+s/MNqQQuMm81x01e9eSFuN/UPmFufOXJh2g02/nO+PG86tl2q0twdHLaMBM0my6KH/jNDrkaRMZCPDDTwHbE70lxySqkwX8iVlj2Pq5WNbrG8CIwc5DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765000424; c=relaxed/simple;
	bh=e63aDAxvciBgVnbkjmKEq4Dcfe2+H6DVO1rVifSuF9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsQ7JN/j/rBJ2Ir6c9dC9qxTMnV45XouLJ8b5Sp6RZQccdnGH4eUHm7AMKrphKSZjnRYZYVk0rtfMlleQ3RlN8CK1j5nYl5bgF2QqW5Upbq/eEcy2aDJKmq/mxHyxzJNRIvN6CxC02lVjFI2LQsfbFNVT4ZYFMuvau5AGM/g8vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpLPSFqN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpLPSFqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765000423; x=1796536423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e63aDAxvciBgVnbkjmKEq4Dcfe2+H6DVO1rVifSuF9E=;
  b=DpLPSFqNsvP2uK1UZjsvmHiGX+fBRqkLp4pA3LEerg9AonScUiddzEFX
   vereaHYk/EuVH8HXb8gN8KoqMkZcznrCtX4uNS/i46HqaIf7OfJc/cNGG
   QRIJLayTduukrtyVqyKogAIHFiBVNP98KWdPmXqJr8PmwZ2I9f7A/TkDi
   wO6BiLl65wHX3u2xrOBGRWzxIT4N3o2VWQkYHWqK4oJMAY2E/1QBub/WX
   bWc7Lcf9wU4I2bV3ULbOHV0W3PFEwq8yZ7xqhsU06RPp9dr2HPtFACwIl
   t5p7fHuCr6rZ4iaKYGSTDuiDElgVdaGt4Z0rInlIjAAUwtBIk2yQtVgzd
   w==;
X-CSE-ConnectionGUID: eCheGMEcQFu5AaZOnDo2nA==
X-CSE-MsgGUID: y7uOW/9TQN29xbWC7jHA8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67069736"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="67069736"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:53:42 -0800
X-CSE-ConnectionGUID: DBp3VHqkSZm5M2+Xa3FNqg==
X-CSE-MsgGUID: XTPZqAuoRWacYFR6oo/daA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="232842249"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2025 21:53:41 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRlEg-00000000Fu9-2ydw;
	Sat, 06 Dec 2025 05:53:38 +0000
Date: Sat, 6 Dec 2025 13:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 21/21]
 kernel/trace/rv/monitors/boost/boost.c:232:3: error: call to undeclared
 function 'check_trace_callback_type_sys_enter'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202512061325.5tVu2Kql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   b0f3d844e192c90aac9dc773e82b8ee2b00e431b
commit: b0f3d844e192c90aac9dc773e82b8ee2b00e431b [21/21] rv: Add dl_server specific monitors
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251206/202512061325.5tVu2Kql-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061325.5tVu2Kql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061325.5tVu2Kql-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/rv/monitors/boost/boost.c:232:3: error: call to undeclared function 'check_trace_callback_type_sys_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     232 |                 rv_attach_trace_probe("boost", sys_enter, handle_syscall);
         |                 ^
   include/rv/instrumentation.h:18:3: note: expanded from macro 'rv_attach_trace_probe'
      18 |                 check_trace_callback_type_##tp(rv_handler);                             \
         |                 ^
   <scratch space>:65:1: note: expanded from here
      65 | check_trace_callback_type_sys_enter
         | ^
>> kernel/trace/rv/monitors/boost/boost.c:232:3: error: call to undeclared function 'register_trace_sys_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/rv/instrumentation.h:19:13: note: expanded from macro 'rv_attach_trace_probe'
      19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
         |                           ^
   <scratch space>:66:1: note: expanded from here
      66 | register_trace_sys_enter
         | ^
>> kernel/trace/rv/monitors/boost/boost.c:250:3: error: call to undeclared function 'unregister_trace_sys_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     250 |                 rv_detach_trace_probe("boost", sys_enter, handle_syscall);
         |                 ^
   include/rv/instrumentation.h:28:3: note: expanded from macro 'rv_detach_trace_probe'
      28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
         |                 ^
   <scratch space>:77:1: note: expanded from here
      77 | unregister_trace_sys_enter
         | ^
   3 errors generated.


vim +/check_trace_callback_type_sys_enter +232 kernel/trace/rv/monitors/boost/boost.c

   211	
   212	static int enable_boost(void)
   213	{
   214		int retval;
   215	
   216		retval = da_monitor_init();
   217		if (retval)
   218			return retval;
   219	
   220		retval = init_storage(true);
   221		if (retval)
   222			return retval;
   223		rv_attach_trace_probe("boost", sched_dl_replenish_tp, handle_dl_replenish);
   224		rv_attach_trace_probe("boost", sched_dl_server_start_tp, handle_dl_server_start);
   225		rv_attach_trace_probe("boost", sched_dl_server_stop_tp, handle_dl_server_stop);
   226		rv_attach_trace_probe("boost", sched_dl_throttle_tp, handle_dl_throttle);
   227		rv_attach_trace_probe("boost", sched_wakeup, handle_sched_wakeup);
   228		rv_attach_trace_probe("boost", sched_wakeup_new, handle_sched_wakeup);
   229		rv_attach_trace_probe("boost", sched_migrate_task, handle_sched_migrate);
   230		rv_attach_trace_probe("boost", sched_switch, handle_sched_switch);
   231		if (!should_skip_syscall_handle())
 > 232			rv_attach_trace_probe("boost", sys_enter, handle_syscall);
   233	
   234		return 0;
   235	}
   236	
   237	static void disable_boost(void)
   238	{
   239		rv_this.enabled = 0;
   240	
   241		rv_detach_trace_probe("boost", sched_dl_replenish_tp, handle_dl_replenish);
   242		rv_detach_trace_probe("boost", sched_dl_server_start_tp, handle_dl_server_start);
   243		rv_detach_trace_probe("boost", sched_dl_server_stop_tp, handle_dl_server_stop);
   244		rv_detach_trace_probe("boost", sched_dl_throttle_tp, handle_dl_throttle);
   245		rv_detach_trace_probe("boost", sched_wakeup, handle_sched_wakeup);
   246		rv_detach_trace_probe("boost", sched_wakeup_new, handle_sched_wakeup);
   247		rv_detach_trace_probe("boost", sched_migrate_task, handle_sched_migrate);
   248		rv_detach_trace_probe("boost", sched_switch, handle_sched_switch);
   249		if (!should_skip_syscall_handle())
 > 250			rv_detach_trace_probe("boost", sys_enter, handle_syscall);
   251	
   252		da_monitor_destroy();
   253	}
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
