Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CED2DB79C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Apr 2026 12:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776254704; cv=none; b=YDYUsNq78gzo7UiM2aKUEHFnSdVHuvJBU2RiI9aAvkaFiAydXdVFPZDakQ6mLueGlIZw3JS1wuCl+kC6zz8Nqj1kYRsMIpDpU9dFzHmA3t0Z2oy+MzzuZB6MM1z3o6SeyEfobBd/TFblgYCY7IFawZnwy4J4ZtRrp3kp9vYZ3ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776254704; c=relaxed/simple;
	bh=kuTolAIxBEc6C0T1HMnqUuZ4ytoif97Oqfo00bjXz7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5V/KP89tus2nF4iw3BGJtBRQaUrYLNDluBnsWUXtcbV6KpVg6MuFJqL00cCopra91nK6Bvm4KlF21GspHeLsTgwlqa8vzd5VkFhqq1EClwhaUkb2qFJar0LcK0zjhX0BWt4vzCfaB6JqOb8SrY7+/hkWdVID92vSTI72OiWf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StI0MD9T; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StI0MD9T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776254703; x=1807790703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kuTolAIxBEc6C0T1HMnqUuZ4ytoif97Oqfo00bjXz7w=;
  b=StI0MD9TY+Ep6VCO8ZJR8ZpwMi0290gbW2ACNvfCHIr3o+96mszsL0Uy
   MZqaVAIZ7IlK2dEj6hT028hU1/vNcfLjNTKgoFQsed9Fz/R0CXqvtX9FD
   h0mSf+KMJBb80ctGSZgf62suci4MxUjURKz8m12OPrG9di5OsnaGOiEz3
   WwUu7fmLjZ9G/22Ie1YEJhE7L+CTBIAn6vjBY1M7ObSzeV0/nRxt7XjIR
   VmA946hWHmXmRWFlIv6lycGVkUXmADnZBD1HqGvdPTgYSSKJ/X2i72KJh
   lmtucWvUq2YBm0eZvbOGnceWXGFHjT7rDJyrGvn0V74Qs3XgpaVP1BL+3
   Q==;
X-CSE-ConnectionGUID: u9GD9NkbSZqF7/544PyLgQ==
X-CSE-MsgGUID: nEjJm9vnRL62OtFTVNAVGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="79812204"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="79812204"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 05:05:02 -0700
X-CSE-ConnectionGUID: Z/5x41BDScq0dzJgzjj1Xw==
X-CSE-MsgGUID: uX5KSLwZQSu7raKGmp+e3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="227223643"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2026 05:05:02 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCyzL-000000000Sj-0gin;
	Wed, 15 Apr 2026 12:04:59 +0000
Date: Wed, 15 Apr 2026 20:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Ruley <brian.ruley@gehealthcare.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] test: mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <202604152036.dETGeqQ0-lkp@intel.com>
References: <20260410114336.983057-1-brian.ruley@gehealthcare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410114336.983057-1-brian.ruley@gehealthcare.com>

Hi Brian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm/for-next]
[also build test WARNING on akpm-mm/mm-everything arm-perf/for-next/perf arm64/for-next/core linus/master arm/fixes v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Ruley/test-mm-arm-pgtable-remove-young-bit-check-for-pte_valid_user/20260414-235000
base:   git://git.armlinux.org.uk/~rmk/linux-arm.git for-next
patch link:    https://lore.kernel.org/r/20260410114336.983057-1-brian.ruley%40gehealthcare.com
patch subject: [RFC PATCH] test: mm/arm: pgtable: remove young bit check for pte_valid_user
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260415/202604152036.dETGeqQ0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152036.dETGeqQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152036.dETGeqQ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/migrate.c:64:6: warning: no previous prototype for 'migrate_exec_log_add' [-Wmissing-prototypes]
      64 | void migrate_exec_log_add(unsigned long addr, unsigned long old_pfn,
         |      ^~~~~~~~~~~~~~~~~~~~
>> mm/migrate.c:79:6: warning: no previous prototype for 'migrate_exec_log_dump' [-Wmissing-prototypes]
      79 | void migrate_exec_log_dump(unsigned long fault_addr)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/migrate_exec_log_add +64 mm/migrate.c

    63	
  > 64	void migrate_exec_log_add(unsigned long addr, unsigned long old_pfn,
    65				  unsigned long new_pfn, bool flushed)
    66	{
    67		unsigned int idx = __this_cpu_read(migrate_exec_idx);
    68		struct migrate_exec_entry *log = this_cpu_ptr(migrate_exec_log);
    69		struct migrate_exec_entry *e = &log[idx];
    70	
    71		e->addr = addr;
    72		e->old_pfn = old_pfn;
    73		e->new_pfn = new_pfn;
    74		e->pid = current->pid;
    75		e->flushed = flushed;
    76		__this_cpu_write(migrate_exec_idx, (idx + 1) % MIGRATE_EXEC_LOG_SIZE);
    77	}
    78	
  > 79	void migrate_exec_log_dump(unsigned long fault_addr)
    80	{
    81		int cpu;
    82	
    83		pr_err("SIGILL at %lx pid %d, recent exec migrations:\n",
    84		       fault_addr, current->pid);
    85		for_each_online_cpu(cpu) {
    86			struct migrate_exec_entry *log = per_cpu(migrate_exec_log, cpu);
    87			int i;
    88			for (i = 0; i < MIGRATE_EXEC_LOG_SIZE; i++) {
    89				if (log[i].addr == 0)
    90					continue;
    91				pr_err("  cpu%d: addr=%lx old_pfn=%lx new_pfn=%lx pid=%d flushed=%d%s\n",
    92				       cpu, log[i].addr, log[i].old_pfn, log[i].new_pfn,
    93				       log[i].pid, log[i].flushed,
    94				       (PAGE_ALIGN(fault_addr) == PAGE_ALIGN(log[i].addr)) ?
    95				       " *** MATCH ***" : "");
    96			}
    97		}
    98	}
    99	#include "internal.h"
   100	#include "swap.h"
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
