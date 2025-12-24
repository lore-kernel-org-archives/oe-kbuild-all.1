Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6212630C375
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 12:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766579507; cv=none; b=aNusfeq5N2jvIM6hOFJDmLdI2RVG2+LrHB45KKdenROaGG0KbHES1IwwnbsZm+YXTUtdYRfOGGiQY7KG7aWjTA87WQ1v/capBf2yu8OAw79zWhHvS0+OmfUUvzvDUEwrErzHaGjxCsHnKHZFDD3GyUS693Xp+G62yYp/afiVahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766579507; c=relaxed/simple;
	bh=/cKuFbrGGe8C9FJ6R/hOXwmn2vfViKaYLYWeQ5nPkfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgao9zEVvcQANnuTmg9dRcDbXBXssuoaFBJSxmp75GGCV+Fwd8dZLEkxAxoLNtAsgj8zGUh72hUWNABIRqLvkYZe7bigWnaFFNL1s951ru0CRwBMMEqkFwLj3MkcS08kfi864N5e+L+XJNrldqBCAmldQSUIGSEtwVmaxopZxrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e85xLv8A; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e85xLv8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766579506; x=1798115506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/cKuFbrGGe8C9FJ6R/hOXwmn2vfViKaYLYWeQ5nPkfM=;
  b=e85xLv8AXKVnv2ZtB7F9a5om3ADd1+nqi0RGeGz6ZPYNDGFpjbfRJ1ZP
   CdB6M8qSvdq1qKAB6XmYMFoeUjo39fzzYJKDnMxSoi26Ts8rebCFEpW4c
   WGqz3VBBGlc5jIvwYSLN2iuYt9VKogXTsg2IFa4vWfMFWBchjTi45NLhl
   h6Jt6xPx6d5FkABuInj1W6d0gMGMIL8DAocOMInqke0fYEwD1fom20V5G
   ooNgCFkkPffiTBkQUpFC5O4ow6JfXBc428qG0+9YgcFNs1Rrs0WLKa7u0
   40/AR+YkU9ZAjqC0W3XOs9Knsma/FPiCIbfZxTulashgvD5SSPC0RWpS/
   Q==;
X-CSE-ConnectionGUID: sbe9i4gJQ4maXF4fMVHmhw==
X-CSE-MsgGUID: JGpnBTmvR2CSToC+hZOI+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68574742"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68574742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 04:31:45 -0800
X-CSE-ConnectionGUID: sPzI6F7sSVCJO9RjogRQNA==
X-CSE-MsgGUID: CS1dsfE0TM+7L3UEuh+YiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="230672668"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2025 04:31:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYO14-0000000032r-3pFx;
	Wed, 24 Dec 2025 12:31:12 +0000
Date: Wed, 24 Dec 2025 20:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: Khaled Saleh <khaled.saleh.req@gmail.com>, rostedt@goodmis.org
Cc: oe-kbuild-all@lists.linux.dev, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
	Khaled Saleh <khaled.saleh.req@gmail.com>
Subject: Re: [PATCH] trace: make ftrace likely counters atomic
Message-ID: <202512242037.SviPrpZt-lkp@intel.com>
References: <20251223203715.10954-1-khaled.saleh.req@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223203715.10954-1-khaled.saleh.req@gmail.com>

Hi Khaled,

kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khaled-Saleh/trace-make-ftrace-likely-counters-atomic/20251224-044106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251223203715.10954-1-khaled.saleh.req%40gmail.com
patch subject: [PATCH] trace: make ftrace likely counters atomic
config: i386-randconfig-003-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242037.SviPrpZt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242037.SviPrpZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242037.SviPrpZt-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_branch.c: In function 'ftrace_likely_update':
>> kernel/trace/trace_branch.c:219:33: error: passing argument 1 of 'atomic_long_inc' from incompatible pointer type [-Wincompatible-pointer-types]
     219 |                 atomic_long_inc(&f->data.correct);
         |                                 ^~~~~~~~~~~~~~~~
         |                                 |
         |                                 long unsigned int *
   In file included from include/linux/atomic.h:82,
                    from include/linux/jump_label.h:257,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/kallsyms.h:13,
                    from kernel/trace/trace_branch.c:7:
   include/linux/atomic/atomic-instrumented.h:3589:32: note: expected 'atomic_long_t *' {aka 'atomic_t *'} but argument is of type 'long unsigned int *'
    3589 | atomic_long_inc(atomic_long_t *v)
         |                 ~~~~~~~~~~~~~~~^
   kernel/trace/trace_branch.c:221:25: error: passing argument 1 of 'atomic_long_inc' from incompatible pointer type [-Wincompatible-pointer-types]
     221 |         atomic_long_inc(&f->data.incorrect);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         |
         |                         long unsigned int *
   include/linux/atomic/atomic-instrumented.h:3589:32: note: expected 'atomic_long_t *' {aka 'atomic_t *'} but argument is of type 'long unsigned int *'
    3589 | atomic_long_inc(atomic_long_t *v)
         |                 ~~~~~~~~~~~~~~~^


vim +/atomic_long_inc +219 kernel/trace/trace_branch.c

   198	
   199	void ftrace_likely_update(struct ftrace_likely_data *f, int val,
   200				  int expect, int is_constant)
   201	{
   202		unsigned long flags = user_access_save();
   203	
   204		/* A constant is always correct */
   205		if (is_constant) {
   206			f->constant++;
   207			val = expect;
   208		}
   209		/*
   210		 * I would love to have a trace point here instead, but the
   211		 * trace point code is so inundated with unlikely and likely
   212		 * conditions that the recursive nightmare that exists is too
   213		 * much to try to get working. At least for now.
   214		 */
   215		trace_likely_condition(f, val, expect);
   216	
   217		/* FIXME: Make this atomic! */
   218		if (val == expect) {
 > 219			atomic_long_inc(&f->data.correct);
   220		} else {
   221		atomic_long_inc(&f->data.incorrect);
   222		}
   223	
   224		user_access_restore(flags);
   225	}
   226	EXPORT_SYMBOL(ftrace_likely_update);
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
