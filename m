Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D818FDDB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765377985; cv=none; b=Edq58l19WfoXuKpCjSzSTZMSbWznHhMGuQlMUPgXjm3S0Y7EyIC8atCg/HBFcX9g0/0xJbBidrFLXOOMSNBVp3CKpacinrbTdTY5gDp4ZGzYlK3xPsJRhAW1Db8Ts/kldRSNzZ+9B2fa/LZSYbpN0GA8iiMfp5Nht28nZX+7Mco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765377985; c=relaxed/simple;
	bh=GFnU3Eor1b3sWisryNKEhrfZfRf9B5RjRcvvzhamuCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KnHMCFTi27aN25f0zreKPqeOMye3ZpNKr99776IIth23UghaP1/fclvYLn6YPfO9KxDvqFcAk3bA1wYjiMnJIO27JCgS4wB4b6sszRH31aB2EFFSqNd/CRnhf+1qZT2Zmb84+8Nf7oGefV915fJNF/kVJtnCx5ePUje3j8zug3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1dFEX39; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1dFEX39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765377983; x=1796913983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GFnU3Eor1b3sWisryNKEhrfZfRf9B5RjRcvvzhamuCA=;
  b=k1dFEX39urzB3bGCTPNJ+C5L1v6USmENSlcIMdSRdwlVkfhpPlni2e21
   aTsrq0r4/tu4a1d/V9fszf1F8ZUFvDh1BKNJVZmOG/HOB2m5ozEfz3AOF
   //L3w7QtsnAJvum5WRcQI8lqT4uFGUGcA31zLPc6BYJSg0M2QVJi5Han3
   tAO4B7KaA0DNGYKn/KggFekHNM+i+YPjNtveervK5ILuD7fFyGKl+hQIk
   Q9caFYnnv1pp/30UwSBMnHr7xBWoQT3X2CfhBBRUI9laHVjzLEbYvs/WF
   /NJGenBrjHtJpypG7yI0INJ9AZnG4Dju0gN/AFMFaQ/AEdps2WcpcOe3h
   Q==;
X-CSE-ConnectionGUID: d73q4loEQbe4yKx8mhZ5yg==
X-CSE-MsgGUID: sR5y+U5LSVaPi+kadvobOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="66352249"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="66352249"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 06:46:22 -0800
X-CSE-ConnectionGUID: w6kKqYVpTcazdxTMNDgKkA==
X-CSE-MsgGUID: F5qITipSR7KbpEupQusbKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201643707"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 06:46:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTLSN-000000003Hd-062x;
	Wed, 10 Dec 2025 14:46:19 +0000
Date: Wed, 10 Dec 2025 22:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 fs/proc/stat.c:41:5: warning: no previous prototype for 'get_iowait_time'
Message-ID: <202512102237.74hTb60a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: 54008cf1b9e8b58f3f83c35ac48cb5c2b4a263d0 [25/25] anolis: cpuacct: export cpuacct.proc_stat interface
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251210/202512102237.74hTb60a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102237.74hTb60a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102237.74hTb60a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/stat.c:41:5: warning: no previous prototype for 'get_iowait_time' [-Wmissing-prototypes]
      41 | u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
         |     ^~~~~~~~~~~~~~~


vim +/get_iowait_time +41 fs/proc/stat.c

    40	
  > 41	u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
    42	{
    43		u64 iowait, iowait_usecs = -1ULL;
    44	
    45		if (cpu_online(cpu))
    46			iowait_usecs = get_cpu_iowait_time_us(cpu, NULL);
    47	
    48		if (iowait_usecs == -1ULL)
    49			/* !NO_HZ or cpu offline so we can rely on cpustat.iowait */
    50			iowait = kcs->cpustat[CPUTIME_IOWAIT];
    51		else
    52			iowait = iowait_usecs * NSEC_PER_USEC;
    53	
    54		return iowait;
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
