Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449578F3E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 05:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771305858; cv=none; b=dVf5x4RCIrrATH23bO+/8rV2pJxg3W3GpOWijYDOPkTzEAvlmGsZHNeM7N4b7NRQptwF/UnI0iSVTC33QFXMFWvZHz5dr+abahmFEcDedc6t/iVVhtPqgbEVgD/rwdyoCuSzvKc4lyyL2TeZi6bDUhZbYACcyBA6qo7psNnLFcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771305858; c=relaxed/simple;
	bh=NCfUeMwH0NPx6IRpYng8HMsWo91XgevavpaigaXegnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dftnYBbnju/In0uAb0R5gRGpo4gbZ9BFVOBS3p1EjOPDB78Va+DE/aeS/Omri0Ey/V6SIrAHdbW+VcmjVYAhTqXsg9weT6JllTMYIDYmJDragJBLPhZ0gdTlVXrCYP2Njj9qLS9B75KIngj5wR621U4Ji5a3+yF43apZlYjUbMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EE4WDFWm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EE4WDFWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771305857; x=1802841857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NCfUeMwH0NPx6IRpYng8HMsWo91XgevavpaigaXegnM=;
  b=EE4WDFWmy2LfWkWqi3UsWts0j+FnTO2V6yNYLyKaiQByrwwgtOfRa6l/
   QiiFPOu/SCulHoPTFC4tDAbYoTPmJIAVtHMFyLDZjQIHbBWZVCbGY+xsH
   boThkIMqRvX2fcD+CAj3XYY81WzjoiZx9QaYotElOPFi3FhvpA5Ay3N/c
   UKxCxGxsaMbskccrIV0qtYVBUoGr1i1koaDD3tXZstqPXQUHwjXc0e+Vj
   Snhl1REqY7ZywDtU+5OZZLRb8691RlTwRgMu11/o90/PHMz1Uzfn/QKvs
   wniDhKFhP6uuzQUWboy7oNnufBCIbzZ9qTpko/cXJtIukePUgBTkw0pZf
   g==;
X-CSE-ConnectionGUID: xEujZ77RTVqlTvaj31FRjA==
X-CSE-MsgGUID: UXPLjPUTSIKsKZzctQNKHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72279696"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72279696"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:24:16 -0800
X-CSE-ConnectionGUID: 2Hs2ufHxSGilsrAOuIuNWw==
X-CSE-MsgGUID: dXV3Ikw+TJiQP9EpXqEC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212869108"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Feb 2026 21:24:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsDZE-000000010dq-3fn9;
	Tue, 17 Feb 2026 05:24:12 +0000
Date: Tue, 17 Feb 2026 13:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 7/9] ld.lld:
 error: version script assignment of 'LINUX_2.6.15' to symbol
 '__kernel_gettimeofday' failed: symbol not defined
Message-ID: <202602171341.Z9K0NZAA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat_32bit_time
head:   b08c091b9f1d126d4ec8f7e985f468fed0359793
commit: cb6f40f194273a9f9ccc76e6a81edca2dd429ec2 [7/9] powerpc
config: powerpc64-randconfig-r071-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171341.Z9K0NZAA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171341.Z9K0NZAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171341.Z9K0NZAA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: version script assignment of 'LINUX_2.6.15' to symbol '__kernel_gettimeofday' failed: symbol not defined
>> ld.lld: error: version script assignment of 'LINUX_2.6.15' to symbol '__kernel_clock_gettime' failed: symbol not defined
>> ld.lld: error: version script assignment of 'LINUX_2.6.15' to symbol '__kernel_clock_getres' failed: symbol not defined
>> ld.lld: error: version script assignment of 'LINUX_2.6.15' to symbol '__kernel_time' failed: symbol not defined
   clang: error: linker command failed with exit code 1 (use -v to see invocation)
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
