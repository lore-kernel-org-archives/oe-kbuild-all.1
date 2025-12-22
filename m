Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122BA945
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 00:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766363850; cv=none; b=j47kzBoCTvGQvDagMxwNKwU6ZlzCgxhXqpsW515p6X642nQNpGL7etFylznSVHlCKtwLknBccgqm5MfhjBFeJNiV9riRLCYwVGgCXsiB2dsfiHhpJK4NszoHyz2hF854EOte/prE45fhVU5oTwbQ3Jbv26ReTk1gLi75VEMLgx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766363850; c=relaxed/simple;
	bh=LYcoL09sO1D0V2ukGFABCPPP/l+pkatizmzVzdw5tow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hMo/Ch37fcTQDhwwe8men9V3JmbJ2kGamzlL0xAFz/oQnHW2FiARc8JxCKhMYE1vU/pMxcgt1Isi2Hclonda9mDqsoxdC1LzJ1XX26/Yf7rr7lqTTEsHSbSBWofOFhzqBW2vD786cEsuQNBk/lpjpDv3XuUdd7/AIyhBgIPMmUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrnvs5mR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrnvs5mR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766363848; x=1797899848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LYcoL09sO1D0V2ukGFABCPPP/l+pkatizmzVzdw5tow=;
  b=jrnvs5mRt73szpIiUh/5xtmA3LVkXO7Z9FkmrWikvoJxmYD439tmtWQm
   Fb8PihIssmGzH8ClE+A2xY36MovnsOyzvI0BAqZiF4QTSqUDLRZQ+Acrk
   xRMw4zST0czPQSbqWp4Wib5Yrdgaw+Mh1/kYw9h9cI8OLaErAdgPqg4c5
   v1Qr5rudtvfpGDVOXr0IJ19c5k8vJrLaVN+PxFnWE4K6HOPNBir/g9GvB
   NsirkqS1iPMxnsRVjmPMvvNA73pUtNDTBNc2Gihb9O7KuQP3Yn6G/4pHd
   u3n8TMIYdGdVhxopFIth2EYQbm+6dfIjP+L/NICuIz7F5ix3E0lWTbO3I
   A==;
X-CSE-ConnectionGUID: 4OGFP03lRGC0Zwd4bnNd/g==
X-CSE-MsgGUID: 3EhqEM7YSdWhVuCkHEsr3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="67977550"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="67977550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 16:37:28 -0800
X-CSE-ConnectionGUID: /LryOlOyTs+55SIAvpY44A==
X-CSE-MsgGUID: SLXVYYH+T0GJWPLNy9AkvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203918738"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2025 16:37:27 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXTvQ-000000000LR-3KzI;
	Mon, 22 Dec 2025 00:37:24 +0000
Date: Mon, 22 Dec 2025 08:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3420/3420]
 drivers/cpufreq/intel_pstate.c:1473:6: sparse: sparse: symbol
 'notify_hwp_interrupt' was not declared. Should it be static?
Message-ID: <202512220826.pYRgbdJv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: e217d5958ee378eb304fb0b4eb6fcb551e555842 [3420/3420] cpufreq: intel_pstate: Process HWP Guaranteed change notification
config: x86_64-randconfig-123-20251218 (https://download.01.org/0day-ci/archive/20251222/202512220826.pYRgbdJv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220826.pYRgbdJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220826.pYRgbdJv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpufreq/intel_pstate.c:1473:6: sparse: sparse: symbol 'notify_hwp_interrupt' was not declared. Should it be static?

vim +/notify_hwp_interrupt +1473 drivers/cpufreq/intel_pstate.c

  1472	
> 1473	void notify_hwp_interrupt(void)
  1474	{
  1475		unsigned int this_cpu = smp_processor_id();
  1476		struct cpudata *cpudata;
  1477		unsigned long flags;
  1478		u64 value;
  1479	
  1480		if (!READ_ONCE(hwp_active) || !boot_cpu_has(X86_FEATURE_HWP_NOTIFY))
  1481			return;
  1482	
  1483		rdmsrl_safe(MSR_HWP_STATUS, &value);
  1484		if (!(value & 0x01))
  1485			return;
  1486	
  1487		spin_lock_irqsave(&hwp_notify_lock, flags);
  1488	
  1489		if (!cpumask_test_cpu(this_cpu, &hwp_intr_enable_mask))
  1490			goto ack_intr;
  1491	
  1492		/*
  1493		 * Currently we never free all_cpu_data. And we can't reach here
  1494		 * without this allocated. But for safety for future changes, added
  1495		 * check.
  1496		 */
  1497		if (unlikely(!READ_ONCE(all_cpu_data)))
  1498			goto ack_intr;
  1499	
  1500		/*
  1501		 * The free is done during cleanup, when cpufreq registry is failed.
  1502		 * We wouldn't be here if it fails on init or switch status. But for
  1503		 * future changes, added check.
  1504		 */
  1505		cpudata = READ_ONCE(all_cpu_data[this_cpu]);
  1506		if (unlikely(!cpudata))
  1507			goto ack_intr;
  1508	
  1509		schedule_delayed_work(&cpudata->hwp_notify_work, msecs_to_jiffies(10));
  1510	
  1511		spin_unlock_irqrestore(&hwp_notify_lock, flags);
  1512	
  1513		return;
  1514	
  1515	ack_intr:
  1516		wrmsrl_safe(MSR_HWP_STATUS, 0);
  1517		spin_unlock_irqrestore(&hwp_notify_lock, flags);
  1518	}
  1519	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
