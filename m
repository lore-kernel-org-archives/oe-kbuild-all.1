Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE262C11E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509677; cv=none; b=QFS4Dx4OpHa71JClRhdpVayWYOIoe9Jj4MB3frPKY9OyiszdEw8RFnKJ/1//37L/VU4QRRO8m6CQoD5vYcXny4YnP90a4UTCQ/+cnUpQcBzdpbywTuGuPtTDTXEZHI04y9fLn8aWGaRAv0TK4eDAi9doAfpY475tUlwm5ry5WJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509677; c=relaxed/simple;
	bh=JZVJhmwyr/V4I4Pt2hNy6XPbnvJz9jJJg7SkVrCuIl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GMF2IJZD/U1iaWIAuBUzN02Ge/uX5V2Y7tZ8XDD89oFgkN+TvOsZgHYkZ290G+Gh8TtrH6bi1NHfmsgAfZaUwl9a9GeeATnJeC/CgO948HFmQcLGl+idXouvXGz51aBMxx37TKwVWviFBiX/Woc+Zm1aNr6OjPSDuJkRPYClsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQmlJ/Pz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQmlJ/Pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768509676; x=1800045676;
  h=date:from:to:cc:subject:message-id;
  bh=JZVJhmwyr/V4I4Pt2hNy6XPbnvJz9jJJg7SkVrCuIl0=;
  b=nQmlJ/Pzr+L1fNn/JCuv9nUyUrDLV1xbgxmcC8bB1YkAiyZGyysZKo8U
   LVjJytn5v40KMYxwB98++XlYZNixqCf/2xBMHQUs75BVGYmqjQ8YJJTcW
   lavlf+xUtvL8nVkyHcJiLyXawh+TlNWubx7mL7G5WE+vCMr8sE5AusDCX
   cjgxqtxDSci+eKw7ploqV62fJOBQbkUJebdbM5wNg778X39LKw3AyCy8r
   3pHdq61/uNbDVipskjQ3xI/r9uMJbpaJmaqfnaPmCAxxHl70SRWT3pS/E
   0w3vF0Tsm2UnCOjyUt2IuUUsAlXUrbfS3X1dKqrF7QL5x2hq+0vR6xMCw
   A==;
X-CSE-ConnectionGUID: 80Gkk+YSTcCV7/VNV2P22g==
X-CSE-MsgGUID: waUNdbI3TgyhiBzSKIxyGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69991382"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="69991382"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 12:41:16 -0800
X-CSE-ConnectionGUID: 1HrN+JexS4OqVlWvC4c3XQ==
X-CSE-MsgGUID: dHAqMIGFQaSdeAk3SfsrGw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jan 2026 12:41:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgU9X-00000000Jy4-2kqq;
	Thu, 15 Jan 2026 20:41:11 +0000
Date: Fri, 16 Jan 2026 04:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 5/15]
 arch/s390/kernel/vtime.c:293:9: error: too few arguments to function
 'vtime_flush'
Message-ID: <202601160405.1o8vTlrW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   84b34118e17dd1a7d0d4a03bf9964b32be61d0d8
commit: adb59e8a961b41f99ced39e71ed1d626ee88f0cb [5/15] s390/time: Prepare to stop elapsing in dynticks-idle
config: s390-randconfig-r073-20260116 (https://download.01.org/0day-ci/archive/20260116/202601160405.1o8vTlrW-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160405.1o8vTlrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160405.1o8vTlrW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:9,
                    from arch/s390/include/asm/percpu.h:175,
                    from include/linux/irqflags.h:19,
                    from arch/s390/include/asm/processor.h:33,
                    from arch/s390/include/asm/smp.h:10,
                    from include/linux/smp.h:119,
                    from include/linux/kernel_stat.h:5,
                    from arch/s390/kernel/vtime.c:9:
   arch/s390/kernel/vtime.c: In function 'vtime_dyntick_start':
   arch/s390/kernel/vtime.c:292:26: error: 's390_idle' undeclared (first use in this function)
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |                          ^~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:413:41: note: in expansion of macro '__pcpu_size_call'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:443:9: note: in expansion of macro 'raw_cpu_write'
     443 |         raw_cpu_write(pcp, val);                                        \
         |         ^~~~~~~~~~~~~
   arch/s390/kernel/vtime.c:292:9: note: in expansion of macro '__this_cpu_write'
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |         ^~~~~~~~~~~~~~~~
   arch/s390/kernel/vtime.c:292:26: note: each undeclared identifier is reported only once for each function it appears in
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |                          ^~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:413:41: note: in expansion of macro '__pcpu_size_call'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:443:9: note: in expansion of macro 'raw_cpu_write'
     443 |         raw_cpu_write(pcp, val);                                        \
         |         ^~~~~~~~~~~~~
   arch/s390/kernel/vtime.c:292:9: note: in expansion of macro '__this_cpu_write'
     292 |         __this_cpu_write(s390_idle.idle_dyntick, true);
         |         ^~~~~~~~~~~~~~~~
>> arch/s390/kernel/vtime.c:293:9: error: too few arguments to function 'vtime_flush'
     293 |         vtime_flush();
         |         ^~~~~~~~~~~
   arch/s390/kernel/vtime.c:209:6: note: declared here
     209 | void vtime_flush(struct task_struct *tsk)
         |      ^~~~~~~~~~~
   arch/s390/kernel/vtime.c: In function 'vtime_dyntick_stop':
   arch/s390/kernel/vtime.c:305:26: error: 's390_idle' undeclared (first use in this function)
     305 |         __this_cpu_write(s390_idle.idle_dyntick, false);
         |                          ^~~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   include/linux/percpu-defs.h:413:41: note: in expansion of macro '__pcpu_size_call'
     413 | #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:443:9: note: in expansion of macro 'raw_cpu_write'
     443 |         raw_cpu_write(pcp, val);                                        \
         |         ^~~~~~~~~~~~~
   arch/s390/kernel/vtime.c:305:9: note: in expansion of macro '__this_cpu_write'
     305 |         __this_cpu_write(s390_idle.idle_dyntick, false);
         |         ^~~~~~~~~~~~~~~~


vim +/vtime_flush +293 arch/s390/kernel/vtime.c

   283	
   284	/**
   285	 * vtime_dyntick_start - Inform vtime about entry to idle-dynticks
   286	 *
   287	 * Called when idle enters in dyntick mode. The idle cputime that elapsed so far
   288	 * is flushed and the tick subsystem takes over the idle cputime accounting.
   289	 */
   290	void vtime_dyntick_start(void)
   291	{
 > 292		__this_cpu_write(s390_idle.idle_dyntick, true);
 > 293		vtime_flush();
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
