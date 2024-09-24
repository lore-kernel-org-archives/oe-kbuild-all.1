Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAED13D8A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 23:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219992; cv=none; b=SQu6q/FEsHrI6fqq3t+KGYbM87CIfkNpNm90CS8TjytchAVNYxU9LsOl7wLpUujZrt+7v2ICUazK0+2Nu0D3/yzykCDL3fydXyhN0u1ODJgRTb8PLtQdIsQWXacFhQmaEMx5qWxO2znK2MU/VtMfRhT0V5qg5KkYKPiTXSzHpqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219992; c=relaxed/simple;
	bh=j0BCZVONslxxD7LB2g1T5wPFnM6kg3pXrC1jJ+JuaFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifMIXeKXIjrPS5mfzhZ3MJyNuDsRBAibBXD0Kg4LbQmMBmYToatIr73GkqaDuS9EbZDICmMcIx6jvZnAl0oDpIcPfgQXJ9X5KpD/GItNeB0r31vfdr7rDlOhJf5XWO2MvouWMeI98tO686n+bzsgoR+kdVnB5zPurfT1awa0DwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mvk5AaVA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mvk5AaVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727219991; x=1758755991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j0BCZVONslxxD7LB2g1T5wPFnM6kg3pXrC1jJ+JuaFk=;
  b=Mvk5AaVALiCyxrh/HcLpZep6TCj1W4Ur89CuiO5w8ACEztrCNUIPlfzE
   wK0pTT6LECe3DhdgwGL4ro3yHrQ9OEqpPu8q2RtE08EABGuhQyk88IWbZ
   NXPBGd/tsufeyTuatZ//D3CzBU5D5J3QozGfWSM5q+Tzq6wL1f2J0+UQN
   qrzGvAI7Ju8LxJiOXfIO0hyeTfdg23ZFypJi5ZWKb+WV+MFcrZ7EaQ1Mp
   BdIQgLfwrT2LNjtD0jc0K8FLNCeTUEQ3pFs9FuBbPZYzvbwAazhagf1Mz
   rLapVU0eUYoxMRnGqFYO7Vu/FC3FoWw1CsDZ+KbtylPvl3bs5Wzn9yBn6
   Q==;
X-CSE-ConnectionGUID: BhdQxIU+TqyBxrbPPzHYwA==
X-CSE-MsgGUID: ZDktyj1TT7qyAGIRBaGRbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26195435"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="26195435"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 16:19:51 -0700
X-CSE-ConnectionGUID: HBT28l9kQey+TiZi9geumw==
X-CSE-MsgGUID: 7tBovgfbRtKBmeaHbGCJmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="102343378"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Sep 2024 16:19:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stEoq-000Iw1-1I;
	Tue, 24 Sep 2024 23:19:44 +0000
Date: Wed, 25 Sep 2024 07:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2167/2441]
 kernel/tkernel/irqlatency/irqlatency.c:83: warning: Function parameter or
 member 'isirq' not described in 'save_stack'
Message-ID: <202409250757.mVTrlUYt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 22599f9f53faee0e993fc4ae321de5ee3e95299a [2167/2441] irqlatency: add irq latency monitor support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240925/202409250757.mVTrlUYt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250757.mVTrlUYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250757.mVTrlUYt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/tkernel/irqlatency/irqlatency.c:83: warning: Function parameter or member 'isirq' not described in 'save_stack'
>> kernel/tkernel/irqlatency/irqlatency.c:83: warning: Function parameter or member 'latency' not described in 'save_stack'
>> kernel/tkernel/irqlatency/irqlatency.c:83: warning: Function parameter or member 'soft_in_irq' not described in 'save_stack'


vim +83 kernel/tkernel/irqlatency/irqlatency.c

    78	
    79	/**
    80	 * Note: Must be called with irq disabled.
    81	 */
    82	static bool save_stack(u32 isirq, u64 latency, u32 soft_in_irq)
  > 83	{
    84		unsigned long nr_entries, stack_index;
    85		struct per_stack *pstack;
    86		struct latency_data *lat_data;
    87	
    88		lat_data = isirq ? this_cpu_ptr(&detect_data->irq_data) :
    89			      this_cpu_ptr(&detect_data->softirq_data);
    90	
    91		stack_index = lat_data->stack_index;
    92		if (unlikely(stack_index >= MAX_STACK_ENTRIES_INDEX - 1))
    93			return false;
    94	
    95		nr_entries = lat_data->total_entries;
    96		if (unlikely(nr_entries >= MAX_STACK_ENTRIES - 1))
    97			return false;
    98	
    99		strlcpy(lat_data->comms[stack_index], current->comm, TASK_COMM_LEN);
   100		lat_data->pids[stack_index] = current->pid;
   101		lat_data->latency[stack_index].msecs = latency;
   102		lat_data->latency[stack_index].plus = !isirq && soft_in_irq;
   103	
   104		pstack = lat_data->stacks + stack_index;
   105		pstack->perstack = lat_data->entries + nr_entries;
   106		pstack->nr_entries = stack_trace_save(pstack->perstack,
   107					MAX_STACK_ENTRIES - nr_entries, 0);
   108		lat_data->total_entries += pstack->nr_entries;
   109	
   110		/**
   111		 * Ensure that the initialisation of @stacks is complete before we
   112		 * update the @index.
   113		 */
   114		smp_store_release(&lat_data->stack_index, stack_index + 1);
   115	
   116		if (unlikely(lat_data->total_entries >= MAX_STACK_ENTRIES - 1)) {
   117			pr_info("BUG: MAX_STACK_ENTRIES too low!");
   118	
   119			return false;
   120		}
   121	
   122		return true;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
