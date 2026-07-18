Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B10305665
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 23:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784418655; cv=none; b=VHZRPVq3Loh/gaQA/pJwFfYc1tTzEw5UtpLJR/oWybFX9EKGSKoibuzbHrOug3ntOInQrK64WJccnPTqCsz2yF94kamYc99gUYj7ImQRIfFx/vG9S7cURrukqlEJea183vFir6qRyDj4BspyHMAtc4/Rj2J0D8/MX7USZfpVgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784418655; c=relaxed/simple;
	bh=Ls/nzvRG4sVSaHVSo+mVr9EyM5r7h2yp3JpbwQ8Oa64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ow0sLfZ7hbEzoPuzBk0GkdSq3jFba3T7qn0hu18pyfYTNNoCxahEVC1qaUw7IKK0UZ1L3k6La4MCGVBVrsP7Ybs9uns7YXNqfID1QMuhMqFfSLjiDrqmEH+Mg1Qss/SoDwSOMPpt5NJGfHYwVzxT6wG7Uy2hbyU78YRsuD4FqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqR6JzlB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqR6JzlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784418653; x=1815954653;
  h=date:from:to:cc:subject:message-id;
  bh=Ls/nzvRG4sVSaHVSo+mVr9EyM5r7h2yp3JpbwQ8Oa64=;
  b=FqR6JzlBAkGwXxaI0IOTZdin9toM492bK9hhQL2sGWsyAK7ceQHDosOC
   O4PNrL5Df0MCAY+vrESRPIS2sfQYHYzWcYLHbzzmSJgdo6WsF2BGdSuJk
   RnATXwyEYpy93ZpPV4TnuAFMtPHyFdDjYPyYHTUi8i5iN0qd//J1lhwYk
   oqnGB3dKQJ165KFSyO0JJRXQ28bDeWapAvIa2I7xbUVpKYc5O9wIghiDK
   /H0nBOd5YyRv9yVsOFEIrinqM9aDTj2NAGouX3ADhD5OjLFx6+AtuVZCZ
   8R+AlFPg+u29KMV53KMSqT6d+YjFRRtIw/NXVgw+SDyomQVFcokv80VAa
   g==;
X-CSE-ConnectionGUID: 7FJv1L7CQCynGA58f+HmPg==
X-CSE-MsgGUID: 8Gxxoq25TLaiGZ0GM8F7LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84032392"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="84032392"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 16:50:52 -0700
X-CSE-ConnectionGUID: ZMhnyseqSTmCFLnpOtHfhw==
X-CSE-MsgGUID: QIl+CxNOTQWEI7nclEMNxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="261386099"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Jul 2026 16:50:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlEnr-00000000VAj-1WTS;
	Sat, 18 Jul 2026 23:50:44 +0000
Date: Sun, 19 Jul 2026 07:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/4]
 include/trace/hooks/topology.h:19:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202607190752.1mThh9F7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   3e53bdbe8bc90023e80d8bdf7a6ab8bf5d13fcc0
commit: 616412c9b51622dbdedbb6641c857f4044430e1d [0/4] ANDROID: topology: Add restricted vendor hook for cpu_capacity_show
config: i386-randconfig-061-20260718 (https://download.01.org/0day-ci/archive/20260719/202607190752.1mThh9F7-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190752.1mThh9F7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190752.1mThh9F7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/base/topology.c: note: in included file:
>> include/trace/hooks/topology.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/topology.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/topology.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +19 include/trace/hooks/topology.h

    13	
    14	DECLARE_HOOK(android_vh_arch_set_freq_scale,
    15		TP_PROTO(const struct cpumask *cpus, unsigned long freq, unsigned long max,
    16			unsigned long *scale),
    17		TP_ARGS(cpus, freq, max, scale));
    18	
  > 19	DECLARE_RESTRICTED_HOOK(android_rvh_cpu_capacity_show,
    20		TP_PROTO(unsigned long *capacity, int cpu),
    21		TP_ARGS(capacity, cpu), 1);
    22	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
