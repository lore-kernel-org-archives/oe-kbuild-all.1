Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B169A434406
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787354059; cv=none; b=RIO5lC9xnspUDPhWMw+9EeCYYRkH3O86nJg5KmBtgwJfRdZLzBOdUtl+WcWdPZhPHLX+eu+epS8tWECvQrZF4j97ctC18TbvJLOlslbIlNgJi0hj9elm62C5SWW5Xu/be0YpXANu67nZZPXF9hN0FlY3dgjCOLrf4yfaDIbmljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787354059; c=relaxed/simple;
	bh=kfVAGds45ceNNu97UkR7OlMCcwzcYjqZDdk3gPfHyuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sJ1LK9fEOecC0t1ZQZSs6sXo5ImGmu4Rduo3lJV3ZcecaIXy3oLEi4JfNA6oa9gDxiypA6WKQoW83O9VoiZmsclXx/eTLBSBeHfxszd8Yn6TA4GURQLIdjo2nkDj4D3maRgF/KKUHgEMBUBETUF62rF3+o0CBqxS8NsM/YKusgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2qTRYHl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2qTRYHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787354056; x=1818890056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kfVAGds45ceNNu97UkR7OlMCcwzcYjqZDdk3gPfHyuM=;
  b=Q2qTRYHlx0btf4scCz4lkceJLHqpLnccg3bOpap6SLJ/48f3yQKPOupl
   smN/p9xWGOSYjBgxXs4g/w3excjFXMqvObJxj821/2l2e9ABGmXv+Mbw0
   D1mBWEeKDUvK4OjVjmoakldUG9ARjOUwuDreDM/U8ZzY2HHCETZbr/M+K
   WCkv/3xechjfFROUMW/snL26ukiw3ZdoDwik4ZxB1ywlacK2/Gy/B/GFO
   jxsfxUt00KQdXzOyn0LOS8qhvOjrbQ4dRGGgyEYwsRgAQgzWkWdg31v/F
   QWfYcGVrqtalfBxbRMAwuAhut4dcXHXpczVoarWJojtsJvoEnjshU3LqG
   g==;
X-CSE-ConnectionGUID: e4G/YLlDTC2mAXsQyA6nRw==
X-CSE-MsgGUID: QaQpfCqFQ/+qgsCEVxFbAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87672973"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="87672973"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 16:14:16 -0700
X-CSE-ConnectionGUID: XXfEocPMTLK+eJd8seuVGQ==
X-CSE-MsgGUID: UJY3cXs+TtyD39FwfVAWCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="264702445"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2026 16:14:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxYRA-00000000qZp-2gKH;
	Fri, 21 Aug 2026 23:14:12 +0000
Date: Sat, 22 Aug 2026 07:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 14/24]
 kernel/locking/lockdep.c:6710:10: error: use of undeclared identifier
 'stack_trace'
Message-ID: <202608220728.EPdgObe8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   a23fc077806416450fbeb0a5a534fd995e465430
commit: 336938fcdc2d4cb4705b1ebcae351ef17abee91e [14/24] locking/lockdep: Route stack trace entries to static bootstrap scratchpad
config: powerpc-randconfig-002-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220728.EPdgObe8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220728.EPdgObe8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220728.EPdgObe8-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/locking/lockdep.c:71:33: error: too many arguments provided to function-like macro invocation
      71 |                                SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
         |                                                      ^
   include/linux/scratchpad.h:360:9: note: macro 'SCRATCHREC_INIT_STATIC' defined here
     360 | #define SCRATCHREC_INIT_STATIC(name, _elem_size, _static_buf, _size_bytes, _min_order, _key) \
         |         ^
   kernel/locking/lockdep.c:69:2: error: use of undeclared identifier 'SCRATCHREC_INIT_STATIC'
      69 |         SCRATCHREC_INIT_STATIC(lockdep_pool, sizeof(struct lock_list),
         |         ^~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:1139:20: warning: unused variable 'e' [-Wunused-variable]
    1139 |         struct lock_list *e;
         |                           ^
>> kernel/locking/lockdep.c:6710:10: error: use of undeclared identifier 'stack_trace'
    6710 |                 sizeof(stack_trace) - lockdep_trace_scratchpad.remaining,
         |                        ^~~~~~~~~~~
>> kernel/locking/lockdep.c:6710:25: error: use of undeclared identifier 'lockdep_trace_scratchpad'
    6710 |                 sizeof(stack_trace) - lockdep_trace_scratchpad.remaining,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/lockdep.c:6711:18: error: use of undeclared identifier 'BOOTSTRAP_STACK_TRACE_ENTRIES'
    6711 |                 (unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 5 errors generated.


vim +/stack_trace +6710 kernel/locking/lockdep.c

  6704	
  6705	static int __init lockdep_boot_report(void)
  6706	{
  6707		pr_info("lockdep: %lu/%lu bootstrap entries, %zu/%lu bootstrap traces used before buddy init, scratchrec active\n",
  6708			min_t(unsigned long, nr_list_entries, BOOTSTRAP_LOCKDEP_ENTRIES),
  6709			BOOTSTRAP_LOCKDEP_ENTRIES,
> 6710			sizeof(stack_trace) - lockdep_trace_scratchpad.remaining,
  6711			(unsigned long)BOOTSTRAP_STACK_TRACE_ENTRIES);
  6712		return 0;
  6713	}
  6714	core_initcall(lockdep_boot_report);
  6715	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
