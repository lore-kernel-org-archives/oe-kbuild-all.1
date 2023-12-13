Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70CD2E0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNzjkwUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702446885; x=1733982885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXYZ5F69TXcgDFviPzn9yoXB9Dc1YFp05RGuKFPTh6I=;
  b=GNzjkwUpDapPwLH9OpF3ghk5R7mw2QwbR23TYTyBNM9dCTu8tkC3Qb6d
   uleC9oZ2zspmizjX2WCLo2GZ3qYOYfL4yKtVLY8I9qfEfD8p+xdeTl/AQ
   POEYnmGRJxgAdTyzA2gzEoJ4oHZ8pJ7XO3bRLaZ21tDUgrpdZfcLvkQvK
   FmtB56fQFj1mYZgP3sp5BHeztvS+KgN7AqWcDoNImnIEWKA6wG6Y82zN8
   WQDmhxVgXc7Tvv+UyuJjfpVTMCMUZ5ntXY4dhuNmGhwds19yZJzoegM8I
   TM4Ze4dWxDxAKmDa8cYJekrrXvfs7mMq+rmZQN1Aqn2iCsSQg2Gjwg5o5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="8277691"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="8277691"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 21:54:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749990460"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="749990460"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 21:54:42 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDICe-000K87-10;
	Wed, 13 Dec 2023 05:54:40 +0000
Date: Wed, 13 Dec 2023 13:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:ring-buffer-multi-page-subbufers 26/31]
 kernel/trace/trace.c:9612: warning: Excess function parameter 'system'
 description in 'trace_array_get_by_name'
Message-ID: <202312131320.H9dZP8io-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer-multi-page-subbufers
head:   cf9d2732932a8071635166afd4fd282889edc056
commit: aa69252b07c338845a7a3ff2172b0618f215b381 [26/31] tracing: Allow creating instances with specified system events
config: arc-randconfig-001-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131320.H9dZP8io-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131320.H9dZP8io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131320.H9dZP8io-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/trace.c:9612: warning: Function parameter or member 'systems' not described in 'trace_array_get_by_name'
>> kernel/trace/trace.c:9612: warning: Excess function parameter 'system' description in 'trace_array_get_by_name'


vim +9612 kernel/trace/trace.c

277ba04461c274 Steven Rostedt          2012-08-03  9593  
28879787147358 Divya Indi              2019-11-20  9594  /**
28879787147358 Divya Indi              2019-11-20  9595   * trace_array_get_by_name - Create/Lookup a trace array, given its name.
28879787147358 Divya Indi              2019-11-20  9596   * @name: The name of the trace array to be looked up/created.
aa69252b07c338 Steven Rostedt (Google  2023-12-05  9597)  * @system: A list of systems to create event directories for (NULL for all)
28879787147358 Divya Indi              2019-11-20  9598   *
28879787147358 Divya Indi              2019-11-20  9599   * Returns pointer to trace array with given name.
28879787147358 Divya Indi              2019-11-20  9600   * NULL, if it cannot be created.
28879787147358 Divya Indi              2019-11-20  9601   *
28879787147358 Divya Indi              2019-11-20  9602   * NOTE: This function increments the reference counter associated with the
28879787147358 Divya Indi              2019-11-20  9603   * trace array returned. This makes sure it cannot be freed while in use.
28879787147358 Divya Indi              2019-11-20  9604   * Use trace_array_put() once the trace array is no longer needed.
28394da2588816 Steven Rostedt (VMware  2020-01-24  9605)  * If the trace_array is to be freed, trace_array_destroy() needs to
28394da2588816 Steven Rostedt (VMware  2020-01-24  9606)  * be called after the trace_array_put(), or simply let user space delete
28394da2588816 Steven Rostedt (VMware  2020-01-24  9607)  * it from the tracefs instances directory. But until the
28394da2588816 Steven Rostedt (VMware  2020-01-24  9608)  * trace_array_put() is called, user space can not delete it.
28879787147358 Divya Indi              2019-11-20  9609   *
28879787147358 Divya Indi              2019-11-20  9610   */
aa69252b07c338 Steven Rostedt (Google  2023-12-05  9611) struct trace_array *trace_array_get_by_name(const char *name, const char *systems)
f45d1225adb047 Divya Indi              2019-03-20 @9612  {
28879787147358 Divya Indi              2019-11-20  9613  	struct trace_array *tr;
28879787147358 Divya Indi              2019-11-20  9614  
28879787147358 Divya Indi              2019-11-20  9615  	mutex_lock(&event_mutex);
28879787147358 Divya Indi              2019-11-20  9616  	mutex_lock(&trace_types_lock);
28879787147358 Divya Indi              2019-11-20  9617  
28879787147358 Divya Indi              2019-11-20  9618  	list_for_each_entry(tr, &ftrace_trace_arrays, list) {
28879787147358 Divya Indi              2019-11-20  9619  		if (tr->name && strcmp(tr->name, name) == 0)
28879787147358 Divya Indi              2019-11-20  9620  			goto out_unlock;
28879787147358 Divya Indi              2019-11-20  9621  	}
28879787147358 Divya Indi              2019-11-20  9622  
aa69252b07c338 Steven Rostedt (Google  2023-12-05  9623) 	tr = trace_array_create_systems(name, systems);
28879787147358 Divya Indi              2019-11-20  9624  
28879787147358 Divya Indi              2019-11-20  9625  	if (IS_ERR(tr))
28879787147358 Divya Indi              2019-11-20  9626  		tr = NULL;
28879787147358 Divya Indi              2019-11-20  9627  out_unlock:
28879787147358 Divya Indi              2019-11-20  9628  	if (tr)
28879787147358 Divya Indi              2019-11-20  9629  		tr->ref++;
28879787147358 Divya Indi              2019-11-20  9630  
28879787147358 Divya Indi              2019-11-20  9631  	mutex_unlock(&trace_types_lock);
28879787147358 Divya Indi              2019-11-20  9632  	mutex_unlock(&event_mutex);
28879787147358 Divya Indi              2019-11-20  9633  	return tr;
277ba04461c274 Steven Rostedt          2012-08-03  9634  }
28879787147358 Divya Indi              2019-11-20  9635  EXPORT_SYMBOL_GPL(trace_array_get_by_name);
277ba04461c274 Steven Rostedt          2012-08-03  9636  

:::::: The code at line 9612 was first introduced by commit
:::::: f45d1225adb0479478cee989e2ae2d7d2c62b31b tracing: Kernel access to Ftrace instances

:::::: TO: Divya Indi <divya.indi@oracle.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
