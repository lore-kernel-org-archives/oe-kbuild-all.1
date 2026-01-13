Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1350D29D27D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 19:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768333003; cv=none; b=vFvyqBvmdCEiltFvzmej+QsESMEKHJ+HQM/BglwxSTwZQUMNpaJsmqzzP5kRu8/Z3QNbj8n52pDtYtrEuE1ZGWeqBg92ds9AMw6Ju+dEawQBbUcWuoCMHHpd7xifgQc7XFQwWzFv4xz7YDncDENSXYyhnVbEVzVxK0c1ZWiGy3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768333003; c=relaxed/simple;
	bh=T1OtZzZsSJjz+Jr7W/UAj5/m4/3wQAvv3k/xzBRy/3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UD41AdWP+p6Yk8g+VrkYGNMcBUESXF+7TPUhpYMZWIr2+LD9Br7JGvfbX5fEpDs81b3HhoC/TDY+eiMB0emEjapelHQrTGwVCUz4VnVEzDJkQXXAwtjy3iD4bF7+jRmFzLNBOyNY1elNJk7JFcFweacEJKWWWn/SDC1g7BBPiLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOX2DTEZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOX2DTEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768333002; x=1799869002;
  h=date:from:to:cc:subject:message-id;
  bh=T1OtZzZsSJjz+Jr7W/UAj5/m4/3wQAvv3k/xzBRy/3o=;
  b=IOX2DTEZF6TFXRK8kk3gr3CPR8B7WKUnLsIgaabbxPcpE4xcojl0d7uU
   GjIIeGqCDzf8nFuOoW4IJfP+tWAMpx7S1fdglQKi/H68ccPvTNaEtHkCt
   3l/MEAxGGgOaQH6HOf1WtlrkwwMtQ2aKkrZGFzVxLEND1hu3tF2OW7SOm
   JBIt1kBdjRtjwh2yM5diuY+AuajM9J9I516CK718gG4K4am5OQAHSv1/m
   5Wn7UekqDMJE/y/KVf3IgrDPy37sOV9aIU5MznlMUPG+E2/4co8fdbwlZ
   BV2hb14prfn0FeUWhPqcxWn//d9DqHnf6AV/rZnzCYgWBVME0auDpfkd3
   Q==;
X-CSE-ConnectionGUID: JjfDp01sRTy9ZpP8gqYVhA==
X-CSE-MsgGUID: qbvaVWFER76k2JJBZZNgUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80274478"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80274478"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 11:36:41 -0800
X-CSE-ConnectionGUID: B6jcBg3ESeeDGaWTzBhhyg==
X-CSE-MsgGUID: Cb1Zn6huRH6sIxtBhd7iEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208931774"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Jan 2026 11:36:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfkBx-00000000FHa-3jLj;
	Tue, 13 Jan 2026 19:36:37 +0000
Date: Wed, 14 Jan 2026 03:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 11/14]
 include/linux/kernel_stat.h:164:2: error: implicit declaration of function
 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'?
Message-ID: <202601140307.rqUDBV7e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   8c562e5c98799c4f2ed88dfc1c3266a4d4e2e7a8
commit: 3f8381521f4337e859f0e9379a4b527d8bd54c64 [11/14] tick/sched: Consolidate fetching idle time
config: arc-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140307.rqUDBV7e-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140307.rqUDBV7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140307.rqUDBV7e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cgroup.h:27,
                    from include/linux/cgroup_api.h:1,
                    from kernel/sched/sched.h:28,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/kernel_stat.h: In function 'kcpustat_cpu_fetch':
>> include/linux/kernel_stat.h:164:2: error: implicit declaration of function 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'? [-Werror=implicit-function-declaration]
     kcpustat_fetch_default(dst, cpu);
     ^~~~~~~~~~~~~~~~~~~~~~
     kcpustat_cpu_fetch_default
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1 shuffle=634779772
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=634779772
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=634779772
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=634779772
   make: Target 'prepare' not remade because of errors.


vim +164 include/linux/kernel_stat.h

   161	
   162	static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   163	{
 > 164		kcpustat_fetch_default(dst, cpu);
   165	}
   166	#endif /* !CONFIG_VIRT_CPU_ACCOUNTING_GEN */
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
