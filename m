Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B10210FB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463844; cv=none; b=sHapN35TroLiSfyvac5rRC2iG9VJyiKN6Evfy99bDcX5r13rTU2hZ+aBH4br+7Iqk2jNoVUVBB7stCBAs4AaPGkr3omPQSqsUeRxLA/NiTG13QU5IYocDlR/nvQwWe1h9x93z/U+pfDdAP6bwuBX8KeRaf9sR7TYWYlA3XjHV4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463844; c=relaxed/simple;
	bh=LLoB0ZPN11l8CxKG4ax9W+cKV/FAOU20E/Msf1i7XBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/UL8Y/SUIL2eLUaBbX5mOrk88RBiXSiG2to1+r6tjpOQzVXAlA3XLY7q9AHnmW0dEZMZ0vSsrIl21B1DC39/FOFSKjv+BKsuF5J37w1A1rDxHY03LSeB0qb6YW6nvyZt42JC7bB3a1DyzEzkc4rypjQQNs7/z0SohIgcIXBuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+ORN2rj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+ORN2rj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751463843; x=1782999843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLoB0ZPN11l8CxKG4ax9W+cKV/FAOU20E/Msf1i7XBo=;
  b=T+ORN2rjWuq1yboJo2k+Su2hU5rWuoxSiZ07htpCi1m9FgZ+4E4aViq4
   QE798IC1q9WkI+ZngTofY2R+qRr/hA4suVcP7O7UqI9hFujQUkje1j+Mn
   W6Nm8XYAQo/mfGY4hfTcjv8YXghbIYtwHTNugKQqpi4/iSQ7cjE/F03ma
   nAkmFkUBKh76qJ55PXLgqq8a9+jDNw83FdpuGXVyAI6nio28hMdghCR3T
   FiJHw/1ZBEHiA8Q/5sOMFBLQaUXqIaeoI+5euq9bTBUs7i417E9JeTLcG
   1jTTr6lexD3SskrVvUmQoVkNmTQovi6BhITcJvPQh305jAUDSuEbfgtRv
   Q==;
X-CSE-ConnectionGUID: iNpsX/dRSpyQbOclQNwiaQ==
X-CSE-MsgGUID: 6NlgUMpsTiaOHdKoazyLoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41386585"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="41386585"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 06:44:02 -0700
X-CSE-ConnectionGUID: 3k+lJLTnTo6KKH9G3Ymz/Q==
X-CSE-MsgGUID: J3JZKSPETwW3NaAnfUHqzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="158459007"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2025 06:44:02 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWxkl-0000ID-09;
	Wed, 02 Jul 2025 13:43:59 +0000
Date: Wed, 2 Jul 2025 15:43:45 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2999/2999]
 drivers/cpufreq/intel_pstate.c:1473:6: warning: no previous prototype for
 'notify_hwp_interrupt'
Message-ID: <202507021524.3Cm8FJyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4755f6a2b98f251edcf63f98f416b5d76425f8c
commit: e217d5958ee378eb304fb0b4eb6fcb551e555842 [2999/2999] cpufreq: intel_pstate: Process HWP Guaranteed change notification
config: x86_64-buildonly-randconfig-2002-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021524.3Cm8FJyF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021524.3Cm8FJyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021524.3Cm8FJyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/intel_pstate.c:1473:6: warning: no previous prototype for 'notify_hwp_interrupt' [-Wmissing-prototypes]
    1473 | void notify_hwp_interrupt(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:2195:32: warning: 'intel_pstate_cpu_oob_ids' defined but not used [-Wunused-const-variable=]
    2195 | static const struct x86_cpu_id intel_pstate_cpu_oob_ids[] __initconst = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~


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
