Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202E21A295
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 05:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762233619; cv=none; b=TlY1TWgumFSlDCfk8q5EpQWH/mtmAsnkr+gjNQbPxQCj8IgWpZTogpM2L0h1SwiA/SxuMSKTYB0/NW6jFLTIpd5zbivZp2R27zNgITr8/Nwwh4r/19y7/GYXrHq7JiSZZbWKIWk4JTxFmY5hkVE3I4E6J+1acGvXhdP3vrs/VOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762233619; c=relaxed/simple;
	bh=E5LaU3FM2XomnKRbhnLcYvmwdsR44BzJY5aqCQj+RtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SqZ1pcLxO81LLqcHIjNOVlnye98IbbIWliOyDtCevrOYiP4pWMhqgVibLy2EZBd8Yk2/Ae4L/SbgwvsKseqVUO98FCjVrnfEJL56RJEiV9JLL57iBjfixyTPCFMa/aF6zc3HGhHn32EwpQB1eXR+L7ww7ZdsKE65Nm1lnux9n+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLDj8lj7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLDj8lj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762233618; x=1793769618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5LaU3FM2XomnKRbhnLcYvmwdsR44BzJY5aqCQj+RtQ=;
  b=bLDj8lj7t1eJiSQTwbKIa+DRwiibgUJigNqvQwCZxE18+kfReonqXcxt
   gvxcpB9cD7sZiiQ2xzc+pfNqhnfEyy39UTVMa7GvxhBft33ib4r2bR2Wn
   MbISNP3LblPgW2q3+BdL/jU0cF2BdC6ZUX0uN8pLENo3hmK8/Jgh3nzgU
   vbP/CUfHYKDe3eMpMtW3IEZ1n8dRggcluMkxNTUJmOnwrQCG3aeHkUIC+
   w78Xulwg8msXbtVKcFNDx52yh4vYPGQABVbLC5cS8uGHMqEJ1S8f4has2
   FBRM4AKBS17XacFMA6E3J6hHIrrLemJ1tyCjlOGoMytWcNzjzlm3HjbC5
   w==;
X-CSE-ConnectionGUID: C5KiJCfDS1S2/q/RrCKyQg==
X-CSE-MsgGUID: +URH/FUqT9SRh4sQcvaiCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51890863"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="51890863"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 21:20:17 -0800
X-CSE-ConnectionGUID: 8nS0kYSXRmu9aQXReCbZ9g==
X-CSE-MsgGUID: 5YACyjSPQ0601eOxgB7+NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186747475"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2025 21:20:16 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG9So-000Qw0-0J;
	Tue, 04 Nov 2025 05:20:14 +0000
Date: Tue, 4 Nov 2025 13:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3098/3098] kernel/sched/cpuacct.c:412:18:
 warning: no previous prototype for 'bpf_cpuacct_kcpustat_cpu_fetch'
Message-ID: <202511041308.wdMKtoD8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b7e6f8aa58e8c131766ecd2c6eb9bd1dce85ca7
commit: 6ed308fc1d6f486c9e3c171b6b80c1c5f0f57df6 [3098/3098] bpf-rvi: cpuacct: Add bpf_cpuacct_kcpustat_cpu_fetch kfunc
config: x86_64-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041308.wdMKtoD8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041308.wdMKtoD8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041308.wdMKtoD8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:61:
>> kernel/sched/cpuacct.c:412:18: warning: no previous prototype for 'bpf_cpuacct_kcpustat_cpu_fetch' [-Wmissing-prototypes]
     412 | __bpf_kfunc void bpf_cpuacct_kcpustat_cpu_fetch(struct kernel_cpustat *dst,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:73:
   kernel/sched/debug.c:102:12: warning: no previous prototype for 'is_prefer_numa' [-Wmissing-prototypes]
     102 | int __weak is_prefer_numa(void)
         |            ^~~~~~~~~~~~~~


vim +/bpf_cpuacct_kcpustat_cpu_fetch +412 kernel/sched/cpuacct.c

   410	
   411	#ifdef CONFIG_BPF_RVI
 > 412	__bpf_kfunc void bpf_cpuacct_kcpustat_cpu_fetch(struct kernel_cpustat *dst,
   413							struct cpuacct *ca, int cpu)
   414	{
   415		memcpy(dst, per_cpu_ptr(ca->cpustat, cpu), sizeof(struct kernel_cpustat));
   416	}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
