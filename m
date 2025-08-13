Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B699285C90
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 20:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755118363; cv=none; b=dkT+Vnx0ZDE5a/iiUJHIlKnIMGezIiTj1PLZFm4yhhUzq48i48QHAZOM6t6+WRJA2fl8cE87I6zr13FBQHFQ0k0MofzER7SdTH3VmunMnDrNhGC5V3hPs3znTMeuQD7tMzdqLM2Q4oeowkLRO5w7iTWlw+Zj38j8AMr/6OUIpT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755118363; c=relaxed/simple;
	bh=H6ncHyIF5v38oLjwMbFKZZ1HUmxAbdm83XzkC4QJMsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lUzn7lSAdpoPYmfOadYjb/hDqO7/2k2Oh5MVJIe4ucvZ8pCElFfKiQGmtXJm9rMPcdB5+jvKkZt4sEBgS8UGd2Bw7T8S7sdEYYwOEISnGySXS2PnqDxnYWfUxOtW4H1EN2pifffteyL4QaV8OtGduNeIVWYEE/Css4T0RVthJ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDvlgLDN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDvlgLDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755118361; x=1786654361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H6ncHyIF5v38oLjwMbFKZZ1HUmxAbdm83XzkC4QJMsA=;
  b=iDvlgLDNSK+4KgDCuWjSuPn1B0qWnjkamjhb7r/rvjNKmBpZsKT5Lobc
   fcc/4NNIcTH+8Q9Y2lHkmJQFuqxkJyfHFIrAIhPl4G8w7HU5yGZJ0Qh2L
   JxPaHc8/AvUjVTBBZ+0gOra1fgWqbLyRkJv7oR8n4NGAYA6f4nspb6qQf
   FUZFRilBrW9jU1Oa7CmCWhagIMlXF1D3+iMjAnG+ix20j0DyEZeNliltT
   i8HWaAzIdYQ+UDld7SLx0Y3XjgSnty+y670ojddi+yKqR65QLjWkEuFX+
   Komx/mrKEOQnnONhwXZJgWfntGRIUI6aeZkec9OLvcOCCtMeMTmdKinCK
   g==;
X-CSE-ConnectionGUID: 8/N4CWyaRd2oiaHXWptCYA==
X-CSE-MsgGUID: CMOTptqzSJSP5Nk6tgwjoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="82862623"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="82862623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 13:52:41 -0700
X-CSE-ConnectionGUID: GAO4dltFT0iQrSJACM/9jQ==
X-CSE-MsgGUID: OciWgKxMROiBsbJ4ICeiPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="166482569"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 13 Aug 2025 13:52:39 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umISb-00006J-2R;
	Wed, 13 Aug 2025 20:52:37 +0000
Date: Wed, 13 Aug 2025 22:52:17 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3112/3112]
 drivers/cpufreq/intel_pstate.c:1473:6: warning: no previous prototype for
 function 'notify_hwp_interrupt'
Message-ID: <202508132203.QmNm6D3S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8a6052b70d77d3f0bda83a13959905e235baa1e5
commit: e217d5958ee378eb304fb0b4eb6fcb551e555842 [3112/3112] cpufreq: intel_pstate: Process HWP Guaranteed change notification
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250813/202508132203.QmNm6D3S-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132203.QmNm6D3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508132203.QmNm6D3S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/intel_pstate.c:1473:6: warning: no previous prototype for function 'notify_hwp_interrupt' [-Wmissing-prototypes]
    1473 | void notify_hwp_interrupt(void)
         |      ^
   drivers/cpufreq/intel_pstate.c:1473:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1473 | void notify_hwp_interrupt(void)
         | ^
         | static 
   drivers/cpufreq/intel_pstate.c:80:23: warning: unused function 'percent_fp' [-Wunused-function]
      80 | static inline int32_t percent_fp(int percent)
         |                       ^~~~~~~~~~
   drivers/cpufreq/intel_pstate.c:95:23: warning: unused function 'percent_ext_fp' [-Wunused-function]
      95 | static inline int32_t percent_ext_fp(int percent)
         |                       ^~~~~~~~~~~~~~
   3 warnings generated.


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
