Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635E34CDD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749922395; cv=none; b=FY821A1f65O6oKySK7aT+U9Ha1nApW7ekhvw9xYH6TqlV5CEn4K6JkhlguAG88+3FH/4C+WQ4DYyVeRoJXRXczzIW8g8/Jbyn3nSyP+79SRB0w6SRFkuDBSM0nghvJCTgG5nXhnkmuw6rrYsgcfl0ljP5ttsoKDzl3oQKb9nrl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749922395; c=relaxed/simple;
	bh=urG0l7IJyRL7lj7bfQMPrX3GrKJOA9KV8kDl91wiF14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt8+fC6KllKEhLfm5wAjVHHJFrZ5FgyDpH+UDUNVDEuJuT8QxzCDwBIU8e98lqn0rXuJDtKkxw3dYQ/NAviNXSHIzOpf7bQfRZ54uQ6LapzbTbmctHVZaJ6IF6jLxZqho4/r0J76r3Nmbv7eX5JqJ4Be/TDFqO00oTW82BMUdGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+eQ6lJk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+eQ6lJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749922394; x=1781458394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=urG0l7IJyRL7lj7bfQMPrX3GrKJOA9KV8kDl91wiF14=;
  b=U+eQ6lJkVwvs4YK2/hDxGv6WL7iwwvyqfh1fVZDetWRWy9j9MgUd1AQ9
   2T7GfDxaop8N+QQ9DwiAY9VBL9dyKXmkKmlfu5P2Kj8r1Mk6tJD0/8R+T
   dv16vElwu6j9Fov6lyT449ISxDyM874Bto0FAureVqLjgGVXqmxaUWSZo
   0vjvxdFPOvaZdv2s3msSG2q/Mxs/YsCyF+TTIwWeqAnCiOwtOqywxz6IM
   cMCu3T2XwNbrW3NJiZ0aQl04uXUf3H92zIaEmnz+c4P+yONnQnxZiOban
   nxG1ZX035TpSRVNLEKQ2PEU7kK+oiGfF3iXSWHeaiEJGSxfUbToeO+7wn
   Q==;
X-CSE-ConnectionGUID: E0x2MbbHS/WAbkOJyDsBgg==
X-CSE-MsgGUID: s+QMniZHSc6w4UfQVvSk8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="77510497"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="77510497"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 10:33:13 -0700
X-CSE-ConnectionGUID: c/FPvcv3RBeOtgJAwvP++g==
X-CSE-MsgGUID: oKQ51SIHRz2wq67RkIUHKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="147953424"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2025 10:33:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQUkg-000Dj0-1o;
	Sat, 14 Jun 2025 17:33:10 +0000
Date: Sun, 15 Jun 2025 01:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 06/11] perf: Support deferred user callchains
Message-ID: <202506150123.IMpwyw55-lkp@intel.com>
References: <20250614024716.623432389@goodmis.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614024716.623432389@goodmis.org>

Hi Steven,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core linus/master v6.16-rc1 next-20250613]
[cannot apply to perf-tools/perf-tools acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/perf-Remove-get_perf_callchain-init_nr-argument/20250614-104859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20250614024716.623432389%40goodmis.org
patch subject: [PATCH v10 06/11] perf: Support deferred user callchains
config: riscv-randconfig-002-20250614 (https://download.01.org/0day-ci/archive/20250615/202506150123.IMpwyw55-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150123.IMpwyw55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150123.IMpwyw55-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf/riscv_pmu.h:12,
                    from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:23,
                    from arch/riscv/kernel/asm-offsets.c:12:
>> include/linux/perf_event.h:56:10: fatal error: linux/unwind_deferred.h: No such file or directory
    #include <linux/unwind_deferred.h>
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:182: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=1553370283
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2 shuffle=1553370283
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1553370283
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1553370283
   make: Target 'prepare' not remade because of errors.


vim +56 include/linux/perf_event.h

    33	
    34	#include <linux/list.h>
    35	#include <linux/mutex.h>
    36	#include <linux/rculist.h>
    37	#include <linux/rcupdate.h>
    38	#include <linux/spinlock.h>
    39	#include <linux/hrtimer.h>
    40	#include <linux/fs.h>
    41	#include <linux/pid_namespace.h>
    42	#include <linux/workqueue.h>
    43	#include <linux/ftrace.h>
    44	#include <linux/cpu.h>
    45	#include <linux/irq_work.h>
    46	#include <linux/static_key.h>
    47	#include <linux/jump_label_ratelimit.h>
    48	#include <linux/atomic.h>
    49	#include <linux/sysfs.h>
    50	#include <linux/perf_regs.h>
    51	#include <linux/cgroup.h>
    52	#include <linux/refcount.h>
    53	#include <linux/security.h>
    54	#include <linux/static_call.h>
    55	#include <linux/lockdep.h>
  > 56	#include <linux/unwind_deferred.h>
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
