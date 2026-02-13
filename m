Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15723741
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 18:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771007685; cv=none; b=C9IGU8QVxYzr/P9aZT+t1e/0zYzJxlBReVH4DGOKTPw6V13ojL2Qg1ER8rN2P28j0i8y7tQedixRo2RtkocynJpkSrDLKwfCUg6R8ZLsYxreZPCXfnVNje2az68MEXx1vTK9VHim23Q33fjOKIU6dazBDNUcP/MU2yOLb4DZg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771007685; c=relaxed/simple;
	bh=mdy4S4voeNhtxcWO6rwt7CwQ7ebR9vsrFVlII0tBZBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nq3sknmODjIErRRBLvgoNHhjLgiJexRUcfnxc9zfNxM71djNYLze4AqHVvo0oRof7P0Js5Q5rmLUK7tZ/bSpNJmgpPUL71AKYrh0vHPPjIWdE7jF2hiO0eEABS2RfDZIszKJstjSbnaqC81MBvaYeHkMacVeiOZPRsMRxhuTXBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9Xl5/pT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9Xl5/pT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771007683; x=1802543683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mdy4S4voeNhtxcWO6rwt7CwQ7ebR9vsrFVlII0tBZBs=;
  b=A9Xl5/pTWR+rcyYYBe01xks8SYh9tFhyqQ22OM0AIPn8W0/l+AG06aGl
   b8Eg6Yrh/VldTYUswrTGYCAxoWqwzw3xBRmXBKRh5VIBoM8iA26Mbp63b
   XBSe7kffmyzdOS0JO1pWk7igTTRTQeIRb6HAJHziIj4xIdg122wMKBvu5
   2q/ZoO8KwHYW4pTDMTAFuEFUUVUV7YDFEe/+P9CKPWy6ufY+TvvTxqkio
   mRW6kNmYodptfvQ3UH5MGAiViWRTEH5DXYWXacpMdDMiFOLQJqBGWlgl6
   aKURPyw6/E6J1eDRxN21p4ng4NlZxHkk7lPPYPO+cQ+SvtnsyD99cWmO5
   w==;
X-CSE-ConnectionGUID: MHlRMilvR2Wjtr5RocTdlA==
X-CSE-MsgGUID: wf2n4L3sRT6tQouGMzE6bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71221981"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="71221981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 10:34:43 -0800
X-CSE-ConnectionGUID: vdue2Io+REKrCHGuqQVwlA==
X-CSE-MsgGUID: Z+IlEoCEQTaIq899i3GzPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212826614"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 10:34:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqxzz-00000000vks-1QtV;
	Fri, 13 Feb 2026 18:34:39 +0000
Date: Sat, 14 Feb 2026 02:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 3/4]
 lib/vdso/gettimeofday.c:343:9: error: implicit declaration of function
 'BUILD_BUG_ON'
Message-ID: <202602140222.t2S0gRge-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat_32bit_time
head:   1a400ee33c91f1c010e4fcbddc3781afdc8ff201
commit: 194ed9d5b6d11d446fde4eaa8724406aa7cd5fe2 [3/4] generic
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260214/202602140222.t2S0gRge-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140222.t2S0gRge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140222.t2S0gRge-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   lib/vdso/gettimeofday.c: In function '__cvdso_clock_gettime32_data':
>> lib/vdso/gettimeofday.c:343:9: error: implicit declaration of function 'BUILD_BUG_ON' [-Wimplicit-function-declaration]
     343 |         BUILD_BUG_ON(!IS_ENABLED(CONFIG_VDSO_COMPAT_32BIT_TIME));
         |         ^~~~~~~~~~~~
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:89: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/BUILD_BUG_ON +343 lib/vdso/gettimeofday.c

   334	
   335	#ifdef BUILD_VDSO32
   336	static __maybe_unused int
   337	__cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
   338				     struct old_timespec32 *res)
   339	{
   340		struct __kernel_timespec ts;
   341		bool ok;
   342	
 > 343		BUILD_BUG_ON(!IS_ENABLED(CONFIG_VDSO_COMPAT_32BIT_TIME));
   344	
   345		ok = __cvdso_clock_gettime_common(vd, clock, &ts);
   346	
   347		if (unlikely(!ok))
   348			return clock_gettime32_fallback(clock, res);
   349	
   350		/* For ok == true */
   351		res->tv_sec = ts.tv_sec;
   352		res->tv_nsec = ts.tv_nsec;
   353	
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
