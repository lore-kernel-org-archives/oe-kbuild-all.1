Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD21CAB3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 02:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740450985; cv=none; b=bJw8CiYOSjD99Nla4W6X4h3jvyWe3M2UOe2/+QKejDCe1i+ixwKeLL3hDIT6QSdNuoNatTLKFWCgwKSi+7xRD7xNoBL9XGrmvEpuZeTTmHXu5Tn3erUQApVeXXCdYFoQ+tNc4fU0jKibku2zA+5gzmovtIjElnTZ37Uuw69EDVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740450985; c=relaxed/simple;
	bh=5/DWijSB8/uydcThDPZMlV1URWT1FBCrbdCXnxOaMbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7vpRz1qwPtSaGGRPmNs2yOoafYEIze6ZOKmOsDrtrQBwGQK0zQ0ena8S1mPbfqSFGLSj55EbKoUQOuVLoooShFAzjkft4NR40JmRrQZWzgHv124+BdXkKSB/fo4DU473lZGfN55/8BQo7WeDtpWlvd8cvobfau9aOqhIeAOOGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcqI0ubA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcqI0ubA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740450983; x=1771986983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5/DWijSB8/uydcThDPZMlV1URWT1FBCrbdCXnxOaMbo=;
  b=UcqI0ubANhQSG7PB6n/OUGQOvnvEG+hMgg6cwZd7tKPzQnPuhAJ9BttW
   9K1+NRE4/C1/fl1pUHb9boIhFtRyfJ4eQgw+ZCPsIHqaDCiYuGUptqdNu
   TlAP7/0LfiBn/HqM5eOzW2RKP1eSO/6YYMbPEdlbj4iWGnteLoDZsv9JQ
   EmKGWsWAugFQpEGEYhepnoyATuIeSB0I06WXO1/GI2kEM855HYGYHSCQx
   IkwJQo5K3JCH04G8fBQNQNuwPf3XBKpUGHsrUzcxxqvOGoHt6Rmt/hdM7
   7/8+EStak271rIgyzpa5iEDZypBBBFGDtImi0/KENf5ez7x+M7JEqL6vF
   g==;
X-CSE-ConnectionGUID: RhvJMLjqQlWMcNkW2YLi6w==
X-CSE-MsgGUID: ejYs1eS9TeWKaFH8Kvk9cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40943992"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="40943992"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 18:36:22 -0800
X-CSE-ConnectionGUID: ZWBgpULBQMGbuXg1aVx3wg==
X-CSE-MsgGUID: LAIoHoicTxuyqFTyP/Qg2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147127385"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Feb 2025 18:36:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmknz-0009fH-1L;
	Tue, 25 Feb 2025 02:36:19 +0000
Date: Tue, 25 Feb 2025 10:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4091/5954] kernel/trace/ftrace.c:7057:24: error:
 implicit declaration of function 'kaslr_offset'
Message-ID: <202502251010.08XcfxGs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ef7aa6a88280d015c6533a210e46efd55bdb57f
commit: ef378c3b8233855497a414b9d67bf22592c928a4 [4091/5954] scripts/sorttable: Zero out weak functions in mcount_loc table
config: sh-randconfig-002-20250223 (https://download.01.org/0day-ci/archive/20250225/202502251010.08XcfxGs-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502251010.08XcfxGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502251010.08XcfxGs-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/ftrace.c: In function 'ftrace_process_locs':
>> kernel/trace/ftrace.c:7057:24: error: implicit declaration of function 'kaslr_offset' [-Wimplicit-function-declaration]
    7057 |         kaslr = !mod ? kaslr_offset() : 0;
         |                        ^~~~~~~~~~~~


vim +/kaslr_offset +7057 kernel/trace/ftrace.c

  6994	
  6995	static int ftrace_process_locs(struct module *mod,
  6996				       unsigned long *start,
  6997				       unsigned long *end)
  6998	{
  6999		struct ftrace_page *pg_unuse = NULL;
  7000		struct ftrace_page *start_pg;
  7001		struct ftrace_page *pg;
  7002		struct dyn_ftrace *rec;
  7003		unsigned long skipped = 0;
  7004		unsigned long count;
  7005		unsigned long *p;
  7006		unsigned long addr;
  7007		unsigned long kaslr;
  7008		unsigned long flags = 0; /* Shut up gcc */
  7009		int ret = -ENOMEM;
  7010	
  7011		count = end - start;
  7012	
  7013		if (!count)
  7014			return 0;
  7015	
  7016		/*
  7017		 * Sorting mcount in vmlinux at build time depend on
  7018		 * CONFIG_BUILDTIME_MCOUNT_SORT, while mcount loc in
  7019		 * modules can not be sorted at build time.
  7020		 */
  7021		if (!IS_ENABLED(CONFIG_BUILDTIME_MCOUNT_SORT) || mod) {
  7022			sort(start, count, sizeof(*start),
  7023			     ftrace_cmp_ips, NULL);
  7024		} else {
  7025			test_is_sorted(start, count);
  7026		}
  7027	
  7028		start_pg = ftrace_allocate_pages(count);
  7029		if (!start_pg)
  7030			return -ENOMEM;
  7031	
  7032		mutex_lock(&ftrace_lock);
  7033	
  7034		/*
  7035		 * Core and each module needs their own pages, as
  7036		 * modules will free them when they are removed.
  7037		 * Force a new page to be allocated for modules.
  7038		 */
  7039		if (!mod) {
  7040			WARN_ON(ftrace_pages || ftrace_pages_start);
  7041			/* First initialization */
  7042			ftrace_pages = ftrace_pages_start = start_pg;
  7043		} else {
  7044			if (!ftrace_pages)
  7045				goto out;
  7046	
  7047			if (WARN_ON(ftrace_pages->next)) {
  7048				/* Hmm, we have free pages? */
  7049				while (ftrace_pages->next)
  7050					ftrace_pages = ftrace_pages->next;
  7051			}
  7052	
  7053			ftrace_pages->next = start_pg;
  7054		}
  7055	
  7056		/* For zeroed locations that were shifted for core kernel */
> 7057		kaslr = !mod ? kaslr_offset() : 0;
  7058	
  7059		p = start;
  7060		pg = start_pg;
  7061		while (p < end) {
  7062			unsigned long end_offset;
  7063			addr = ftrace_call_adjust(*p++);
  7064			/*
  7065			 * Some architecture linkers will pad between
  7066			 * the different mcount_loc sections of different
  7067			 * object files to satisfy alignments.
  7068			 * Skip any NULL pointers.
  7069			 */
  7070			if (!addr || addr == kaslr) {
  7071				skipped++;
  7072				continue;
  7073			}
  7074	
  7075			end_offset = (pg->index+1) * sizeof(pg->records[0]);
  7076			if (end_offset > PAGE_SIZE << pg->order) {
  7077				/* We should have allocated enough */
  7078				if (WARN_ON(!pg->next))
  7079					break;
  7080				pg = pg->next;
  7081			}
  7082	
  7083			rec = &pg->records[pg->index++];
  7084			rec->ip = addr;
  7085		}
  7086	
  7087		if (pg->next) {
  7088			pg_unuse = pg->next;
  7089			pg->next = NULL;
  7090		}
  7091	
  7092		/* Assign the last page to ftrace_pages */
  7093		ftrace_pages = pg;
  7094	
  7095		/*
  7096		 * We only need to disable interrupts on start up
  7097		 * because we are modifying code that an interrupt
  7098		 * may execute, and the modification is not atomic.
  7099		 * But for modules, nothing runs the code we modify
  7100		 * until we are finished with it, and there's no
  7101		 * reason to cause large interrupt latencies while we do it.
  7102		 */
  7103		if (!mod)
  7104			local_irq_save(flags);
  7105		ftrace_update_code(mod, start_pg);
  7106		if (!mod)
  7107			local_irq_restore(flags);
  7108		ret = 0;
  7109	 out:
  7110		mutex_unlock(&ftrace_lock);
  7111	
  7112		/* We should have used all pages unless we skipped some */
  7113		if (pg_unuse) {
  7114			WARN_ON(!skipped);
  7115			/* Need to synchronize with ftrace_location_range() */
  7116			synchronize_rcu();
  7117			ftrace_free_pages(pg_unuse);
  7118		}
  7119		return ret;
  7120	}
  7121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
