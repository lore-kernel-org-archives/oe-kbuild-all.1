Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA3200CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717574045; cv=none; b=oEFDOpgH7vovFGgb+6wL7NKt2t3T/HST0114iC5+86unvgx9/nLv/jmdUHiwaWOy5gPA4hurpRT5EaaGFiayGRWjvwHKq1zuW/49Hc1V1DzmJxMdKDeJqXuRC9IyQ0XMCNddksTUmkjymFaoekQ86quPrwXK7TsJaam7rNngmyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717574045; c=relaxed/simple;
	bh=CinDnmcPjU47z2uaEbwGGF4CZxR7Pnh585fNqW6O4bM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmLOcRyT7WPly45lukTOsKooje4AiabNqnx89ZPmSdN6Z4KUUfQe47S+m86VE9stcDEn742+0yGpZPDSObU9OnllYNjPCYmRm1QiqLkdcPviA3QcEHuZRBhOlGCu0hmDi6EW004h7O2HaPeemx2ELViDQzKa679HC7hcacGHxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSVZEJPm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSVZEJPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717574043; x=1749110043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CinDnmcPjU47z2uaEbwGGF4CZxR7Pnh585fNqW6O4bM=;
  b=PSVZEJPmye9tj2+MxwB3TwGiOoky4W7uQopi/tLHzDtCcSY2pFEZkmTW
   Z2f85FvfZmo7PgsVFjfsoZmDYkw3TEqfL1FO+7l4jzrX5pUEMz0ilyge3
   B2VW6y1CR0XemFJx0RJ7AVcIjlRknMnzD2klaoioi+NIuvRnE2pHgpxsd
   rYfbv03QpLbFLwpri7LUQAyJDCeX8wkY2t3xOwaum0viufSK5AonXOIeg
   BuLYYkvP3eAWGTaQzEohHihjDxEFPvgsu4RfiI+buafBnT5BSoXuRMWBU
   /zxmRIQWmHtunD4DwV3+Fu6cuyF9LbxbWquoWi7jV9wt9Lu8vf8D4p2Y3
   g==;
X-CSE-ConnectionGUID: Z+RRYG7yQz6mNVp6O2XAFA==
X-CSE-MsgGUID: VR4QB9BZTSuuxQid2Y+5Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="24791789"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="24791789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 00:54:03 -0700
X-CSE-ConnectionGUID: Ga1SjZhoTYmrV7EcNORZbg==
X-CSE-MsgGUID: 5IFOwSs3QniIdRwvSs7oqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="42460741"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Jun 2024 00:54:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sElSs-00015N-1V;
	Wed, 05 Jun 2024 07:53:57 +0000
Date: Wed, 5 Jun 2024 15:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 3312/3594] kernel/trace/fgraph.c:934:15: error:
 implicit declaration of function 'ftrace_startup_subops'; did you mean
 'ftrace_startup'?
Message-ID: <202406051524.a12JqLqx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   234cb065ad82915ff8d06ce01e01c3e640b674d2
commit: c132be2c4fcc1150ad0791c2a85dd4c9ad0bd0c8 [3312/3594] function_graph: Have the instances use their own ftrace_ops for filtering
config: riscv-randconfig-001-20240605 (https://download.01.org/0day-ci/archive/20240605/202406051524.a12JqLqx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051524.a12JqLqx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051524.a12JqLqx-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/fgraph.c: In function 'register_ftrace_graph':
>> kernel/trace/fgraph.c:934:15: error: implicit declaration of function 'ftrace_startup_subops'; did you mean 'ftrace_startup'? [-Werror=implicit-function-declaration]
     934 |         ret = ftrace_startup_subops(&graph_ops, &gops->ops, command);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               ftrace_startup
   kernel/trace/fgraph.c: In function 'unregister_ftrace_graph':
>> kernel/trace/fgraph.c:973:9: error: implicit declaration of function 'ftrace_shutdown_subops'; did you mean 'ftrace_shutdown'? [-Werror=implicit-function-declaration]
     973 |         ftrace_shutdown_subops(&graph_ops, &gops->ops, command);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         ftrace_shutdown
   cc1: some warnings being treated as errors


vim +934 kernel/trace/fgraph.c

   888	
   889	int register_ftrace_graph(struct fgraph_ops *gops)
   890	{
   891		int command = 0;
   892		int ret = 0;
   893		int i;
   894	
   895		mutex_lock(&ftrace_lock);
   896	
   897		if (!fgraph_array[0]) {
   898			/* The array must always have real data on it */
   899			for (i = 0; i < FGRAPH_ARRAY_SIZE; i++)
   900				fgraph_array[i] = &fgraph_stub;
   901		}
   902	
   903		/* Look for an available spot */
   904		for (i = 0; i < FGRAPH_ARRAY_SIZE; i++) {
   905			if (fgraph_array[i] == &fgraph_stub)
   906				break;
   907		}
   908		if (i >= FGRAPH_ARRAY_SIZE) {
   909			ret = -ENOSPC;
   910			goto out;
   911		}
   912	
   913		fgraph_array[i] = gops;
   914		if (i + 1 > fgraph_array_cnt)
   915			fgraph_array_cnt = i + 1;
   916		gops->idx = i;
   917	
   918		ftrace_graph_active++;
   919	
   920		if (ftrace_graph_active == 1) {
   921			register_pm_notifier(&ftrace_suspend_notifier);
   922			ret = start_graph_tracing();
   923			if (ret)
   924				goto error;
   925			/*
   926			 * Some archs just test to see if these are not
   927			 * the default function
   928			 */
   929			ftrace_graph_return = return_run;
   930			ftrace_graph_entry = entry_run;
   931			command = FTRACE_START_FUNC_RET;
   932		}
   933	
 > 934		ret = ftrace_startup_subops(&graph_ops, &gops->ops, command);
   935	error:
   936		if (ret) {
   937			fgraph_array[i] = &fgraph_stub;
   938			ftrace_graph_active--;
   939		}
   940	out:
   941		mutex_unlock(&ftrace_lock);
   942		return ret;
   943	}
   944	
   945	void unregister_ftrace_graph(struct fgraph_ops *gops)
   946	{
   947		int command = 0;
   948		int i;
   949	
   950		mutex_lock(&ftrace_lock);
   951	
   952		if (unlikely(!ftrace_graph_active))
   953			goto out;
   954	
   955		if (unlikely(gops->idx < 0 || gops->idx >= fgraph_array_cnt))
   956			goto out;
   957	
   958		WARN_ON_ONCE(fgraph_array[gops->idx] != gops);
   959	
   960		fgraph_array[gops->idx] = &fgraph_stub;
   961		if (gops->idx + 1 == fgraph_array_cnt) {
   962			i = gops->idx;
   963			while (i >= 0 && fgraph_array[i] == &fgraph_stub)
   964				i--;
   965			fgraph_array_cnt = i + 1;
   966		}
   967	
   968		ftrace_graph_active--;
   969	
   970		if (!ftrace_graph_active)
   971			command = FTRACE_STOP_FUNC_RET;
   972	
 > 973		ftrace_shutdown_subops(&graph_ops, &gops->ops, command);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
