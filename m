Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57BE3905F0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 19:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735087; cv=none; b=Q4DJsCRBhFmdXYe5y/8pOEP9HZUZOHiQDG1d33Hp+HU1gGNKb5rKYlXUiyWyN9q3pKda6edRc2rQlYTsrm3KWoVdnR3B/aoSpQKHv/pzdbJDNPdmWPQr6UKBgJ1iemTQ0EN4/rzMWRPomJqAwJzQXnXJREGvyXQHAe6ypJw2JiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735087; c=relaxed/simple;
	bh=aIy6AHu4mu2ezMCSPBSytPfjGUv570iE05jtc+f2OvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONQCDZ/lfZsYFpnB0vieb+CEoP2AM7tmIWRzgnn1HP6dQqPr1iQ4rBerqt71FWWaS9Im6HTEGYwCYnlT0Vb9bW3gFnGdltiQy/bOrZnZz29H3s8hMVgIOT4VKPeuiYooiChqqlyWX1N2sBEkduIvRoGcGVThGNy3UZpF5P5qRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQGIEANQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQGIEANQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786735084; x=1818271084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aIy6AHu4mu2ezMCSPBSytPfjGUv570iE05jtc+f2OvY=;
  b=IQGIEANQTRZOSarvgdQsRZ54LNPVNrsVoCIHkYHzo1qZIqt+eXUOeMMD
   wTfr+72xq5xI5VEH+L8LNJBp17FzA1yJiHC/lZythLagHUHQrMHqRuI8k
   UPhrOp7cTuM/TLv/hLRsk98wd/74oB2qWCOy6bh//LtOZ0kj25bFKRfeH
   DyvUIBfqLD1lbm4Z9576EpDIa7SVxryT9vVjTRGMfkWDYU5H4gU4DboyA
   do+AkK8M3B6Jl0V10wPJ2XKYdgKEtUo3BbrCDLMvFZG82yry1nB2STWzW
   YxCvrSsITK+SxzuyrQ+hFEpYKlI47kDTAsBAVQf0YHR57kpn0Zox3SMpc
   w==;
X-CSE-ConnectionGUID: 3wTQWmbmQaqAHxT6H9QPNA==
X-CSE-MsgGUID: i8sia3KaRPiv4+QdaC8yjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87241407"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87241407"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 12:17:58 -0700
X-CSE-ConnectionGUID: xAUh4cfPRsmoli1n/MyUHA==
X-CSE-MsgGUID: x4cVu1NaQRmLhQGA6npvtg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2026 12:17:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuxPc-00000000Zuu-2LnO;
	Fri, 14 Aug 2026 19:17:52 +0000
Date: Sat, 15 Aug 2026 03:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, akpm@linux-foundation.org,
	lance.yang@linux.dev, mhiramat@kernel.org, pmladek@suse.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com, atomlin@atomlin.com, neelx@suse.com,
	sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com,
	nick.lange@gmail.com
Subject: Re: [PATCH v2] hung_task: Add per-round stack trace deduplication
Message-ID: <202608150327.OJ0wc1wA-lkp@intel.com>
References: <20260620013559.1537893-1-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620013559.1537893-1-atomlin@atomlin.com>

Hi Aaron,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v7.2-rc7 next-20260813]
[cannot apply to linux-review/Aaron-Tomlin/hung_task-Add-per-round-stack-trace-deduplication/20260618-025656]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Tomlin/hung_task-Add-per-round-stack-trace-deduplication/20260814-211006
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260620013559.1537893-1-atomlin%40atomlin.com
patch subject: [PATCH v2] hung_task: Add per-round stack trace deduplication
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260815/202608150327.OJ0wc1wA-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150327.OJ0wc1wA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150327.OJ0wc1wA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   kernel/hung_task.c: In function 'check_hung_uninterruptible_tasks':
>> kernel/hung_task.c:388:72: error: 'sysctl_hung_task_dedup' undeclared (first use in this function); did you mean 'sysctl_hung_task_panic'?
     388 |         bool dedup_enabled = IS_ENABLED(CONFIG_STACKTRACE) ? READ_ONCE(sysctl_hung_task_dedup) : 0;
         |                                                                        ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/hung_task.c:388:62: note: in expansion of macro 'READ_ONCE'
     388 |         bool dedup_enabled = IS_ENABLED(CONFIG_STACKTRACE) ? READ_ONCE(sysctl_hung_task_dedup) : 0;
         |                                                              ^~~~~~~~~
   kernel/hung_task.c:388:72: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/hung_task.c:388:62: note: in expansion of macro 'READ_ONCE'
     388 |         bool dedup_enabled = IS_ENABLED(CONFIG_STACKTRACE) ? READ_ONCE(sysctl_hung_task_dedup) : 0;
         |                                                              ^~~~~~~~~


vim +388 kernel/hung_task.c

   375	
   376	/*
   377	 * Check whether a TASK_UNINTERRUPTIBLE does not get woken up for
   378	 * a really long time. If that happens, print out a warning.
   379	 */
   380	static void check_hung_uninterruptible_tasks(unsigned long timeout)
   381	{
   382		int max_count = sysctl_hung_task_check_count;
   383		unsigned long last_break = jiffies;
   384		struct task_struct *g, *t;
   385		unsigned long this_round_count;
   386		int need_warning = sysctl_hung_task_warnings;
   387		unsigned long si_mask = hung_task_si_mask;
 > 388		bool dedup_enabled = IS_ENABLED(CONFIG_STACKTRACE) ? READ_ONCE(sysctl_hung_task_dedup) : 0;
   389	
   390		/*
   391		 * If the system crashed already then all bets are off,
   392		 * do not report extra hung tasks:
   393		 */
   394		if (test_taint(TAINT_DIE) || did_panic)
   395			return;
   396	
   397		/*
   398		 * Reset the de-duplicator hash table for this new detection round.
   399		 * This prevents stale hashes from permanently suppressing.
   400		 */
   401		if (dedup_enabled)
   402			hung_task_dedup_flush();
   403	
   404		this_round_count = 0;
   405		rcu_read_lock();
   406		for_each_process_thread(g, t) {
   407			if (!max_count--)
   408				goto unlock;
   409			if (time_after(jiffies, last_break + HUNG_TASK_LOCK_BREAK)) {
   410				if (!rcu_lock_break(g, t))
   411					goto unlock;
   412				last_break = jiffies;
   413			}
   414	
   415			if (task_is_hung(t, timeout)) {
   416				/*
   417				 * Increment the global counter so that userspace could
   418				 * start migrating tasks ASAP. But count the current
   419				 * round separately because userspace could reset
   420				 * the global counter at any time.
   421				 */
   422				atomic_long_inc(&sysctl_hung_task_detect_count);
   423				this_round_count++;
   424				hung_task_info(t, timeout, this_round_count, dedup_enabled);
   425			}
   426		}
   427	 unlock:
   428		rcu_read_unlock();
   429	
   430		if (!this_round_count)
   431			return;
   432	
   433		if (need_warning || hung_task_call_panic) {
   434			si_mask |= SYS_INFO_LOCKS;
   435	
   436			if (sysctl_hung_task_all_cpu_backtrace)
   437				si_mask |= SYS_INFO_ALL_BT;
   438		}
   439	
   440		sys_info(si_mask);
   441	
   442		if (hung_task_call_panic)
   443			panic("hung_task: blocked tasks");
   444	}
   445	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
