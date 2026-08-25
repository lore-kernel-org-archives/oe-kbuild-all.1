Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E38C3101A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 04:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632641; cv=none; b=Fw6QurrbZDSqui/D+9+L8oPu4dsYACHMshRxB8RdVUJ+lkemk+a1ne0MnLgGK77zf2OZO4ceNUpwICnhwrQRWeIpL9JJYEZ/nAg4QeBTpMtcbyqPTlCe9Q9rLcojDCgr6PhUvCDzr8IbQzAM2ElCvbpHgkZOs+tjCOkQ9o7/LM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632641; c=relaxed/simple;
	bh=X2sAEbO1EUhCyIzKAN7gBd6BayP4xD3l6uZLmLW/EOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hsShPXabvWATxOgi5DqkTKCCgJA0j1ayZIeQ8uvm3mpiSkdCGR8HdUxCq8fXbNKctPYyPKi4fnzlC8ZUybxoDmiCcH4m7nWQS809jCfPDKa76aPc8XtwdLcqa7rwjk9tmULwCBZMt6QPdduYZGL8EwiYNde6eDGJUeSszyBDpt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caXzJAGD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caXzJAGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787632640; x=1819168640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X2sAEbO1EUhCyIzKAN7gBd6BayP4xD3l6uZLmLW/EOU=;
  b=caXzJAGDIpL7yOq5EAlCZ+XU4ePsX+9mfIs+eNorCcI3PIaan5CkcOyv
   sG90P2lS2KYbIoTwaLV8H0YLcG+AV0FPIRTmw+POWvOFxR6zd5b/DO6fS
   hRbUofBrdV8B4+Mbwxw/rOYis0lVR+e3GmtVJyf7Ahx7xzSSAa3ujBSoQ
   PuJZe4kuixL57XEsdIcSVC1UgecNotmRRua0dQWFjaBDDUfBiFA8TDABQ
   sz1HeS86UtvL7MgtWxxKAiXRE/gwvTRNABNoxmALSMtP+1x/EH3UMsmTX
   GSQXfNoSKtwYkncIhNNp7JnhBU28DxchWEaZn8w33hdY+Qn+8yBROqYvi
   g==;
X-CSE-ConnectionGUID: 3m6XTm2bQbGvJ9l4jSh6Nw==
X-CSE-MsgGUID: LO6y8U5lRAKNWz/pR3UX8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99440886"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="99440886"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 21:37:19 -0700
X-CSE-ConnectionGUID: 78ecXu3PQ1auR7wOP+kgaw==
X-CSE-MsgGUID: ANlnoW+jQ5aA+Pc2C7F1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="292032905"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Aug 2026 21:37:17 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyiuR-000000004z5-2EAd;
	Tue, 25 Aug 2026 04:37:15 +0000
Date: Tue, 25 Aug 2026 12:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 6/14] kernel/locking/lockdep.c:6754:25:
 error: use of undeclared identifier 'lockdep_trace_pool'
Message-ID: <202608251233.EWujjA0A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   45e5e0071e4ad7afee159e8cbe6cbe50c8db61d0
commit: 4e4680605a52c4e4bf0f7c6b0cf1455d0b26f4ed [6/14] locking/lockdep: Convert lock graph and radix tables to dynamic pools
config: hexagon-randconfig-001-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251233.EWujjA0A-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251233.EWujjA0A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251233.EWujjA0A-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.c:6754:10: error: use of undeclared identifier 'stack_trace'; did you mean 'skip_trace'?
    6754 |                 sizeof(stack_trace) - lockdep_trace_pool.remaining,
         |                        ^~~~~~~~~~~
         |                        skip_trace
   include/linux/printk.h:584:34: note: expanded from macro 'pr_info'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                         ^
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^
   include/linux/ftrace.h:1062:19: note: 'skip_trace' declared here
    1062 | static inline int skip_trace(unsigned long ip) { return 0; }
         |                   ^
   kernel/locking/lockdep.c:6755:18: error: use of undeclared identifier 'BOOTSTRAP_STACK_TRACE_ENTRIES'
    6755 |                 (unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
         |                                ^
>> kernel/locking/lockdep.c:6754:25: error: use of undeclared identifier 'lockdep_trace_pool'
    6754 |                 sizeof(stack_trace) - lockdep_trace_pool.remaining,
         |                                       ^
   3 errors generated.


vim +/lockdep_trace_pool +6754 kernel/locking/lockdep.c

  6748	
  6749	static int __init lockdep_boot_report(void)
  6750	{
  6751		pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
  6752			min_t(unsigned long, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES),
  6753			BOOTSTRAP_LOCKDEP_ENTRIES,
> 6754			sizeof(stack_trace) - lockdep_trace_pool.remaining,
  6755			(unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
  6756		return 0;
  6757	}
  6758	core_initcall(lockdep_boot_report);
  6759	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
