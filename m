Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4E7AD5E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 05:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709616698; cv=none; b=RDXaltWYNkYt+PUcPzNE97HIcsGkSSWcW0s3+t8uwxKcwu6lS7tCtIGc3TZtvTh3b0jRE5wDsXfBSkE2/Oimj96oq1PDJ1sn50q/NQgOS+JDDOoNYdJlHP9f7soQKe9VP2bI2F3HjKgMpn/QsV+C60ao6bLmSDxhiRyauI8Z02w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709616698; c=relaxed/simple;
	bh=PfWzanwp9eKjtNwyVqmqFNxkMMzHDEHgnSAMV6tyzJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=InRkuedDDNa+HrcsCivpxjUmIRkzCC99/ugrr8plMNsXzk096SU/qx+HqpFCsJKdffldB7HmhFjj2quu5bWkYBrm+trMTbUq64ElAZC+W2YNOjjiGH7TxQL5cPZNIJeTh9uZCevHK86U0RB4Olk36wPsmDUMmkOyfB6LK4UaXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mah69z+X; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mah69z+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709616696; x=1741152696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PfWzanwp9eKjtNwyVqmqFNxkMMzHDEHgnSAMV6tyzJ0=;
  b=mah69z+XSc9r68Q9SlzOSJGs2Upm424YoEzeCDbIAIz0tVzMQt/uAqC5
   7W5Lu+kYsBwYCpREEE6Izs36yUwxqyHuybbJhe2hFpyO/xEWlllKj/N/L
   T7bu+iyRqtIlfTGtay2Tz60Yq9RTeodZlt3gd6Lo2tG0Lqx6cmdXMtnNq
   pco/cTuGn2mvhGdKfYWB/L/kyqSnEnW7nKGGCEJ6PXSi1f0WnzvllDuF3
   d3wZzVjngUpWLEpnAl0zTF/ltiCh9MOfyBNlPtSe5IH873SXEcnQDsGiU
   BnbkS2SPbXmnian2msZ6qmrbmHvHQAJNzfsq371oTIXtmNSVrIzqSncoD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15547983"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="15547983"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 21:31:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9352246"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2024 21:31:34 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhNOl-00034L-2d;
	Tue, 05 Mar 2024 05:31:31 +0000
Date: Tue, 5 Mar 2024 13:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>
Subject: [arm-perf:for-next/perf 34/37]
 drivers/perf/starfive_starlink_pmu.c:169:17: error: implicit declaration of
 function 'writeq'; did you mean 'writel'?
Message-ID: <202403051305.36cANAVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   b9f71ab2152e5b344c02eb3ff43637162aaf29e6
commit: c2b24812f7bc5fbd6f2f92af070856fbe4c37b40 [34/37] perf: starfive: Add StarLink PMU support
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240305/202403051305.36cANAVm-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403051305.36cANAVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051305.36cANAVm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/starfive_starlink_pmu.c: In function 'starlink_pmu_set_event_period':
>> drivers/perf/starfive_starlink_pmu.c:169:17: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
     169 |                 writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_CYCLE_COUNTER);
         |                 ^~~~~~
         |                 writel
   drivers/perf/starfive_starlink_pmu.c: In function 'starlink_pmu_counter_start':
>> drivers/perf/starfive_starlink_pmu.c:191:15: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     191 |         val = readq(starlink_pmu->pmu_base + STARLINK_PMU_INTERRUPT_ENABLE);
         |               ^~~~~
         |               readl
   cc1: some warnings being treated as errors


vim +169 drivers/perf/starfive_starlink_pmu.c

   154	
   155	static void starlink_pmu_set_event_period(struct perf_event *event)
   156	{
   157		struct starlink_pmu *starlink_pmu = to_starlink_pmu(event->pmu);
   158		struct hw_perf_event *hwc = &event->hw;
   159		int idx = event->hw.idx;
   160	
   161		/*
   162		 * Program counter to half of it's max count to handle
   163		 * cases of extreme interrupt latency.
   164		 */
   165		u64 val = STARLINK_PMU_COUNTER_MASK >> 1;
   166	
   167		local64_set(&hwc->prev_count, val);
   168		if (hwc->config == STARLINK_CYCLES)
 > 169			writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_CYCLE_COUNTER);
   170		else
   171			writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_EVENT_COUNTER +
   172			       idx * sizeof(u64));
   173	}
   174	
   175	static void starlink_pmu_counter_start(struct perf_event *event,
   176					       struct starlink_pmu *starlink_pmu)
   177	{
   178		struct hw_perf_event *hwc = &event->hw;
   179		int idx = event->hw.idx;
   180		u64 val;
   181	
   182		/*
   183		 * Enable counter overflow interrupt[63:0],
   184		 * which is mapped as follow:
   185		 *
   186		 * event counter 0	- Bit [0]
   187		 * event counter 1	- Bit [1]
   188		 * ...
   189		 * cycle counter	- Bit [63]
   190		 */
 > 191		val = readq(starlink_pmu->pmu_base + STARLINK_PMU_INTERRUPT_ENABLE);
   192	
   193		if (hwc->config == STARLINK_CYCLES) {
   194			/*
   195			 * Cycle count has its dedicated register, and it starts
   196			 * counting as soon as STARLINK_PMU_GLOBAL_ENABLE is set.
   197			 */
   198			val |= STARLINK_PMU_CYCLE_OVERFLOW_MASK;
   199		} else {
   200			writeq(event->hw.config, starlink_pmu->pmu_base +
   201			       STARLINK_PMU_EVENT_SELECT + idx * sizeof(u64));
   202	
   203			val |= BIT_ULL(idx);
   204		}
   205	
   206		writeq(val, starlink_pmu->pmu_base + STARLINK_PMU_INTERRUPT_ENABLE);
   207	
   208		writeq(STARLINK_PMU_GLOBAL_ENABLE, starlink_pmu->pmu_base +
   209		       STARLINK_PMU_CONTROL);
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
