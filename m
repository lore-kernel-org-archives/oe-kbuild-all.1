Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6CA1F5617
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 00:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765241232; cv=none; b=s2l1vSyo/+HlPPzKtLdck0ynjEWciXHrZkuhi2OG+OaUDSEfYag/n3XdkXSbkKqtlW2C6zpKWxAacgkWpDUwb/thSCO7QFNkDCGhNwELVRDxoO9yczux+PSlsLbq3He77CeLyhxBHXYmSMXtfJ08rjhShHBNMgg6GxgQm7N1O/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765241232; c=relaxed/simple;
	bh=ipuN+75zZ3rurrxR1lceKJ4Kdu5xeHwwhYZGNf2Tq6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jXlg1qtDrhVgrHW8oV21sa8ESR/Kqw4mY8r+HN+GV1EPWf3TfdEAJ5smlnyxkC6fsKo4/O3L1cTNvJ6S+HxJQlDr5jhVAU0avBuVrnjL2/4P9OJ1VqyIqOdWAzPr5fazd24fS+9+EJSDNN6OJ/6Z31BMRp0QrxAQsgIjlb5+WIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqM8qVbg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqM8qVbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765241231; x=1796777231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ipuN+75zZ3rurrxR1lceKJ4Kdu5xeHwwhYZGNf2Tq6s=;
  b=kqM8qVbgacrVbkBNinWBamYCl0dOzBpTNtkcGXHT18szz9WAz1lZkz6J
   Dndd9F6ufWHnGTieXhPiSwM8go7zx4tkydKl/FnpUhV4CLBalB2X4Bkzp
   M4p0VGD15mVBsVucT2u3Prf+/FJDIX6JoJCN/cuI2e5BBQAMpFqp43AgM
   0tvBxLyeJdlWsvkjopEKu2ghDXGALeJg++aCkhDHXGvcshrqY6K7m358l
   dhDkMnboq0a7u4RtdA1ZKQQgAnV9BHFltU5KEtoTuvmu//lx2Lur3zyoV
   1Mnssilvhyihn5+Z35V2EIpVBXNDXbg6uScljJDNvvq6d4e7aNGCdsCvG
   A==;
X-CSE-ConnectionGUID: 9ji7Y5EsROafy6d4I0c8Ow==
X-CSE-MsgGUID: u8ZJGNfYTDe9zL0MEseL3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67240415"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67240415"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 16:47:10 -0800
X-CSE-ConnectionGUID: YQsdmTv7RDa9Iji4IEOKPg==
X-CSE-MsgGUID: D1QhepeOTBOoPGWnx+lDXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195864535"
Received: from igk-lkp-server01.igk.intel.com (HELO a9286e139fc0) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 16:47:09 -0800
Received: from kbuild by a9286e139fc0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSlsg-000000002K5-2JuT;
	Tue, 09 Dec 2025 00:47:06 +0000
Date: Tue, 9 Dec 2025 01:46:20 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3386/3386]
 drivers/cpufreq/intel_pstate.c:1473:6: warning: no previous prototype for
 'notify_hwp_interrupt'
Message-ID: <202512090137.yqEfvu43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Srinivas,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   69d9543977fd7abe8b555406c7a3e5d64d8292f8
commit: e217d5958ee378eb304fb0b4eb6fcb551e555842 [3386/3386] cpufreq: intel_pstate: Process HWP Guaranteed change notification
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251209/202512090137.yqEfvu43-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090137.yqEfvu43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090137.yqEfvu43-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/intel_pstate.c:1473:6: warning: no previous prototype for 'notify_hwp_interrupt' [-Wmissing-prototypes]
    1473 | void notify_hwp_interrupt(void)
         |      ^~~~~~~~~~~~~~~~~~~~


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
