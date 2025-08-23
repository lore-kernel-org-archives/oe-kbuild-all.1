Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37C24676B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 22:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755989824; cv=none; b=F7lkqPhAlKdfYP1bia5rHFEBfauwzK3uDPLgONA7HxOU5F0ce6LzWtXsg6yNJB741smW+YQf0EQ5ls4qzXe1D12JK1aiyxhtWcoo+RKw7c6b9Dx64XMv7RUwrBRlYkS5RTD9WOCT4X5EHgarcidtShGJlqmyJIaIGeZnPk3cNaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755989824; c=relaxed/simple;
	bh=1gBzaw0YJv0O2DSIMvafVygZ8KvuGwmLqeAIjRh6P4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQxg88DgjrcFt5laf+bIhq8MfAN5hgdQmnY8zCi2DbRa7uhQfIIFdqb9z0HIrozbrIX/gP46625q7GfN14ZjS0WcCEBgzPf+iNq9mXquDFrVdXSv/AASEaFXPPkk5v4Z4gZ2vlLxrekO6PKSR1rVIsT3KO66phziLJHp97Uoaww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbEJTpHM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbEJTpHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755989823; x=1787525823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1gBzaw0YJv0O2DSIMvafVygZ8KvuGwmLqeAIjRh6P4Y=;
  b=DbEJTpHMv8E39dp0JQ5nu97xvWaKCXqPTZTQ3eWPbuu3OF2RMcBGLNCO
   Q1QisVVNWfYegrqltzpmiAAK+uvKB7GjlEiSNtj+n5Wl0ePlGeiKgybJ7
   30tWLXhtoQVfuOlLlWds1z74qKD94GQC9EdhtrYJkL/7uJDlPLXYfNbHL
   BijvzgHy7ALNQWVLdSFhhSo34JpWMEZ11S6Ds+x1VszTQSPFNj+ZT/UFc
   JniH5YPZxQ6bRoulD5pZQjiOKIiZQE2i4/Rfh1Cutnd211cEld5aF+nwN
   Qn3Pk4dU6R2LmA3zegt0sLkDbvSCVm+/F3Qp/UoVamHxnoJs4fMWGffs4
   A==;
X-CSE-ConnectionGUID: S2+rBBcnSu2tzpOgfjG/Jw==
X-CSE-MsgGUID: gF4hIKAkRk6mbovSgX4+xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62082590"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62082590"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 15:57:02 -0700
X-CSE-ConnectionGUID: 5G3EIgnxQLCKrMBzgQ0KZA==
X-CSE-MsgGUID: AF3GAcuDSemefZsXqwdG3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169805251"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Aug 2025 15:57:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upx9u-000Mdj-0v;
	Sat, 23 Aug 2025 22:56:51 +0000
Date: Sun, 24 Aug 2025 06:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 79/99]
 drivers/perf/riscv_pmu.c:227:3: error: implicit declaration of function
 'sse_event_disable_local'; did you mean 'perf_event_disable_local'?
Message-ID: <202508240600.1M1uzaY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   753d28977ce73716ed8f186d94b13af7a08101ff
commit: 6e4de3faf517fe27ddca193cbf437a1cd4cc630e [79/99] perf: RISC-V: add support for SSE event
config: riscv-randconfig-r051-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240600.1M1uzaY7-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240600.1M1uzaY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240600.1M1uzaY7-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/riscv_pmu.c: In function 'riscv_pmu_disable':
>> drivers/perf/riscv_pmu.c:227:3: error: implicit declaration of function 'sse_event_disable_local'; did you mean 'perf_event_disable_local'? [-Werror=implicit-function-declaration]
     227 |   sse_event_disable_local(rvpmu->sse_evt);
         |   ^~~~~~~~~~~~~~~~~~~~~~~
         |   perf_event_disable_local
   drivers/perf/riscv_pmu.c: In function 'riscv_pmu_enable':
>> drivers/perf/riscv_pmu.c:235:3: error: implicit declaration of function 'sse_event_enable_local'; did you mean 'sse_event_enable'? [-Werror=implicit-function-declaration]
     235 |   sse_event_enable_local(rvpmu->sse_evt);
         |   ^~~~~~~~~~~~~~~~~~~~~~
         |   sse_event_enable
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HAVE_MIXED_BREAKPOINTS_REGS
   Depends on [n]: HAVE_HW_BREAKPOINT [=n]
   Selected by [y]:
   - RISCV [=y]


vim +227 drivers/perf/riscv_pmu.c

   221	
   222	static void riscv_pmu_disable(struct pmu *pmu)
   223	{
   224		struct riscv_pmu *rvpmu = to_riscv_pmu(pmu);
   225	
   226		if (rvpmu->sse_evt)
 > 227			sse_event_disable_local(rvpmu->sse_evt);
   228	}
   229	
   230	static void riscv_pmu_enable(struct pmu *pmu)
   231	{
   232		struct riscv_pmu *rvpmu = to_riscv_pmu(pmu);
   233	
   234		if (rvpmu->sse_evt)
 > 235			sse_event_enable_local(rvpmu->sse_evt);
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
