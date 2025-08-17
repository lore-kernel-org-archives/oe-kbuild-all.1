Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A53186284
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Aug 2025 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755473312; cv=none; b=Qm/etdwzKefJFC2ZpKLKvKzqo5DTBVOzEm5tpfslp9O/IEr9GobT1j/5xorQ1WdNCfuMt3O2nnP/eslqh6Q8hfpItebCdFuSA0Br0yAZ2u/ZhTsuDdo+NvVftXxX+tDKTMJ4oIGmVfJS6QFoV2yLYDkjhCX4WOLsFqoT2mEnAjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755473312; c=relaxed/simple;
	bh=k4LzNj6k5lnCz7VwjWlhHyibBPjasHrbK+0gonuXVZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXE57n5QXIx5mNo1NOKR6zvICy5srmenC448H4o6ktXiXf0sjOrzo3i0/V3ij77LTbVoT0CFZM5INo1tc+KCdfK0rRORFTLzdT5i92xPBtMyDwGphkc+hTbJtp1CtWbLfN755uQt1DD5LiCS2lVSo8kUUm+wZGFMe6RC6SI1PPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0OUx3pX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0OUx3pX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755473310; x=1787009310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4LzNj6k5lnCz7VwjWlhHyibBPjasHrbK+0gonuXVZw=;
  b=Z0OUx3pX0rfYsFoO3vZ7dp8/keTcUiScH36Tsovedsbr6wW3gb+201jz
   lqe6PzuRrT0FW2cwLNxBga85a0rFLhseYETJ1ckN8MzY2yfDT9pQwbTQG
   zpB6xUP4vUcke7io9016b5HiXl85iHUa3T+bafPdP2+Dr/mHKiqbo1wpk
   K9u2QilB7DRgsZLSUh//+Dlpr3iBsHPYhDAYyN/ZNl0FVTLx0FocYq/Ww
   naxwYtvrDJ9Kiaf2POKqpz1zSlmMC6MLgcQqMgR3PYFxo3uKo+MAN6J9w
   ep5BuKlHaLVktfoeZAPfRjk/65hfPUnh89kRKo9Ce+Q9gu+Klt+K4pjjT
   w==;
X-CSE-ConnectionGUID: XnyakVKkQ5OEBTXZ+F1/ZQ==
X-CSE-MsgGUID: RAgu1wzaQjy/kM7Q0upkZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68785225"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68785225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 16:28:30 -0700
X-CSE-ConnectionGUID: YmPl4gWWSpSVW5Tb/HTTfg==
X-CSE-MsgGUID: Ut7tciN8T02X4uk3l7zoxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167354135"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 17 Aug 2025 16:28:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unmna-000DmB-0O;
	Sun, 17 Aug 2025 23:28:26 +0000
Date: Mon, 18 Aug 2025 07:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/wip 22/22] include/linux/rseq_entry.h:173:9: error:
 implicit declaration of function 'rseq_trace_cs_clear'
Message-ID: <202508180748.5r9tEtxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/wip
head:   302da1e6bb83bae8c47388b029ed29811455ddec
commit: 302da1e6bb83bae8c47388b029ed29811455ddec [22/22] rewrite
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250818/202508180748.5r9tEtxr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180748.5r9tEtxr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180748.5r9tEtxr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rseq.c:15:
   include/linux/rseq_entry.h: In function 'rseq_update_user_cs':
>> include/linux/rseq_entry.h:173:9: error: implicit declaration of function 'rseq_trace_cs_clear' [-Wimplicit-function-declaration]
     173 |         rseq_trace_cs_clear(csaddr, ip, start_ip, offset, abort_ip);
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/rseq.c: In function '__rseq_handle_slowpath':
>> kernel/rseq.c:209:9: error: implicit declaration of function 'trace_rseq_exit_to_user'; did you mean 'trace_seq_to_user'? [-Wimplicit-function-declaration]
     209 |         trace_rseq_exit_to_user(current);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         trace_seq_to_user


vim +/rseq_trace_cs_clear +173 include/linux/rseq_entry.h

    85	
    86	static __always_inline bool
    87	rseq_update_user_cs(struct task_struct *t, struct pt_regs *regs, unsigned long csaddr)
    88	{
    89		struct rseq_cs __user *ucs = (struct rseq_cs __user *)(unsigned long)csaddr;
    90		u64 start_ip, abort_ip = 0, offset = 0, cs_end = 0;
    91		unsigned long ip = instruction_pointer(regs);
    92		u64 __user *uc_head = (u64 __user *) ucs;
    93		u64 head, tasksize = TASK_SIZE;
    94		u32 __user *uc_sig;
    95		u32 uval;
    96	
    97		rseq_stat_inc(rseq_stats.cs);
    98	
    99		if (unlikely(csaddr >= tasksize)) {
   100			t->rseq_die = true;
   101			return false;
   102		}
   103	
   104		if (!user_rw_masked_begin(ucs))
   105			return false;
   106	
   107		if (IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
   108			unsafe_get_user(uval, &t->rseq->flags, fail);
   109			if (unlikely(uval))
   110				goto die;
   111		}
   112	
   113		/*
   114		 * Evaluate the user pile and exit if one of the conditions is not
   115		 * fulfilled.
   116		 */
   117		unsafe_get_user(start_ip, &ucs->start_ip, fail);
   118		if (unlikely(start_ip >= tasksize))
   119			goto die;
   120		/* If outside, just clear the critical section. */
   121		if (ip < start_ip)
   122			goto clear;
   123	
   124		unsafe_get_user(offset, &ucs->post_commit_offset, fail);
   125		cs_end = start_ip + offset;
   126		/* Check for overflow and wraparound */
   127		if (unlikely(cs_end >= tasksize || cs_end < start_ip))
   128			goto die;
   129	
   130		/* If not inside, clear it. */
   131		if (ip >= cs_end)
   132			goto clear;
   133	
   134		unsafe_get_user(abort_ip, &ucs->abort_ip, fail);
   135		/* Ensure it's "valid" */
   136		if (unlikely(abort_ip >= tasksize || abort_ip < sizeof(*uc_sig)))
   137			goto die;
   138		/* Validate that the abort IP is not in the critical section */
   139		if (unlikely(abort_ip - start_ip < offset))
   140			goto die;
   141	
   142		/*
   143		 * Check version and flags for 0. No point in emitting deprecated
   144		 * warnings before dying. That could be done in the slow path
   145		 * eventually, but *shrug*.
   146		 */
   147		unsafe_get_user(head, uc_head, fail);
   148		if (unlikely(head))
   149			goto die;
   150	
   151		/* abort_ip - 4 is >= 0. See abort_ip check above */
   152		uc_sig = (u32 __user *)(unsigned long)(abort_ip - sizeof(*uc_sig));
   153		unsafe_get_user(uval, uc_sig, fail);
   154		if (unlikely(uval != t->rseq_sig))
   155			goto die;
   156	
   157		/* If not in interrupt from user context, let it die */
   158		if (unlikely(!t->rseq_event.user_irq))
   159			goto die;
   160	
   161		instruction_pointer_set(regs, (unsigned long)abort_ip);
   162		unsafe_put_user(0ULL, &t->rseq->rseq_cs, fail);
   163		user_access_end();
   164	
   165		rseq_stat_inc(rseq_stats.fixup);
   166		/* Must be outside of the user_access region */
   167		rseq_trace_ip_fixup(ip, start_ip, offset, abort_ip);
   168		return true;
   169	clear:
   170		unsafe_put_user(0ULL, &t->rseq->rseq_cs, fail);
   171		user_access_end();
   172		rseq_stat_inc(rseq_stats.clear);
 > 173		rseq_trace_cs_clear(csaddr, ip, start_ip, offset, abort_ip);
   174		return true;
   175	die:
   176		t->rseq_event.fatal = true;
   177	fail:
   178		user_access_end();
   179		return false;
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
