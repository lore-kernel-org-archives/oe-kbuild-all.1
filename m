Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0413AD5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMqTKoLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697300025; x=1728836025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xLfeTQCQ7ajxjNnSRfaer1IfCFto5evvHy3co4Bzopo=;
  b=DMqTKoLtC8nXf+ztctiQsrw0ZSRmUk4nEtKqReSvfkZ/BYT1FZX56U5l
   Nhy7cCVE8R1t+k4H93/aYb8w3rL93XcnvyT1fZigDBPKlYT/oQ8mJ2u/2
   vUzNlu4yj55l+Fh6nQcH05EtHspiYrvyrj/YeWRm2ScT7H8ujLq3QRPjz
   exJVhIGFGiWjRmeWy/vQ/iiGRhQfdW43SqwmDW1ZxYc3HYVWWDuPeckOC
   LEk8SCeaJJOlGB72Pm/fVSiCRQ/HEbuHccav7ikYvQfy0ymaYMCpGUGyX
   kISMn67a856J9JbCRKTkasyd7wgu/mTCdXQRxG6SnVUv4Dz/GzQsXe7fm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389193956"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389193956"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 09:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="758833720"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="758833720"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 09:13:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrhGg-0006M0-1l;
	Sat, 14 Oct 2023 16:13:34 +0000
Date: Sun, 15 Oct 2023 00:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: kernel/stacktrace.c:138: warning: Function parameter or member 'tsk'
 not described in 'stack_trace_save_tsk'
Message-ID: <202310150022.FUVBk7ng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   727fb83765049981e342db4c5a8b51aca72201d8
commit: 214d8ca6ee854f696f75e75511fe66b409e656db stacktrace: Provide common infrastructure
date:   4 years, 6 months ago
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231015/202310150022.FUVBk7ng-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150022.FUVBk7ng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150022.FUVBk7ng-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/stacktrace.c:138: warning: Function parameter or member 'tsk' not described in 'stack_trace_save_tsk'
>> kernel/stacktrace.c:138: warning: Excess function parameter 'task' description in 'stack_trace_save_tsk'


vim +138 kernel/stacktrace.c

   126	
   127	/**
   128	 * stack_trace_save_tsk - Save a task stack trace into a storage array
   129	 * @task:	The task to examine
   130	 * @store:	Pointer to storage array
   131	 * @size:	Size of the storage array
   132	 * @skipnr:	Number of entries to skip at the start of the stack trace
   133	 *
   134	 * Return: Number of trace entries stored.
   135	 */
   136	unsigned int stack_trace_save_tsk(struct task_struct *tsk, unsigned long *store,
   137					  unsigned int size, unsigned int skipnr)
 > 138	{
   139		stack_trace_consume_fn consume_entry = stack_trace_consume_entry_nosched;
   140		struct stacktrace_cookie c = {
   141			.store	= store,
   142			.size	= size,
   143			.skip	= skipnr + 1,
   144		};
   145	
   146		if (!try_get_task_stack(tsk))
   147			return 0;
   148	
   149		arch_stack_walk(consume_entry, &c, tsk, NULL);
   150		put_task_stack(tsk);
   151		return c.len;
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
