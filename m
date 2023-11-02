Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF2821A06
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+cJI1yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698962340; x=1730498340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pTweSs+CtYSdFVIrWwDAcAIizDXQHaAHL19W7wedEmI=;
  b=P+cJI1yb8XBK1fOyEDAUbOzKP7q+kEbJPb9z88Lxce+fcefo7etdiSBK
   Wg0tcWEq+bO8h7B2+ts5Gfaf49bm3VLH7a1y1utbaMJ08RJLaSKCx1LQ9
   6CdCiPkN1BcpzMtVryArrKxCjVdk/mfeqzXq1NTddHqL7SgJF1jXRBcw1
   ta4ufev0bl5BxL5CgNOb6h19sk9IpF9SSWcg+wPflZehWG7OaHHWmV7+T
   P1qssFooMidkmSlZgmyKV3iIyuhKazVgkDO5yWKuArjT4v3/Jmb+970Ss
   l+EN1XloIHy2tTCWPPxV2UTknmWcwfFjGB5Egv6Z8hInxGGkblNk6qPIW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="475067719"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="475067719"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 14:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1008609511"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="1008609511"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 14:58:58 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyfiJ-0001to-2p;
	Thu, 02 Nov 2023 21:58:55 +0000
Date: Fri, 3 Nov 2023 05:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Florent Revest <revest@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/ftrace.c:5417: warning: Function parameter or member
 'addr' not described in 'unregister_ftrace_direct'
Message-ID: <202311030542.ii73MaGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: da8bdfbd422333fbb7c85ac1d7f18592d17d6665 ftrace: Rename _ftrace_direct_multi APIs to _ftrace_direct APIs
date:   8 months ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20231103/202311030542.ii73MaGe-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030542.ii73MaGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030542.ii73MaGe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ftrace.c:1283: warning: Function parameter or member 'ops' not described in 'ftrace_free_filter'
>> kernel/trace/ftrace.c:5417: warning: Function parameter or member 'addr' not described in 'unregister_ftrace_direct'
>> kernel/trace/ftrace.c:5417: warning: Function parameter or member 'free_filters' not described in 'unregister_ftrace_direct'
   kernel/trace/ftrace.c:5565: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:5565: warning: Function parameter or member 'ip' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:5565: warning: Function parameter or member 'remove' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:5565: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter_ip'
   kernel/trace/ftrace.c:5588: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter_ips'
   kernel/trace/ftrace.c:5588: warning: Function parameter or member 'ips' not described in 'ftrace_set_filter_ips'
   kernel/trace/ftrace.c:5588: warning: Function parameter or member 'cnt' not described in 'ftrace_set_filter_ips'
   kernel/trace/ftrace.c:5588: warning: Function parameter or member 'remove' not described in 'ftrace_set_filter_ips'
   kernel/trace/ftrace.c:5588: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter_ips'
   kernel/trace/ftrace.c:5602: warning: Function parameter or member 'ops' not described in 'ftrace_ops_set_global_filter'
   kernel/trace/ftrace.c:5634: warning: Function parameter or member 'ops' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:5634: warning: Function parameter or member 'buf' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:5634: warning: Function parameter or member 'len' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:5634: warning: Function parameter or member 'reset' not described in 'ftrace_set_filter'
   kernel/trace/ftrace.c:5657: warning: Function parameter or member 'ops' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:5657: warning: Function parameter or member 'buf' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:5657: warning: Function parameter or member 'len' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:5657: warning: Function parameter or member 'reset' not described in 'ftrace_set_notrace'
   kernel/trace/ftrace.c:5672: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:5672: warning: Function parameter or member 'len' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:5672: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_filter'
   kernel/trace/ftrace.c:5688: warning: Function parameter or member 'buf' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:5688: warning: Function parameter or member 'len' not described in 'ftrace_set_global_notrace'
   kernel/trace/ftrace.c:5688: warning: Function parameter or member 'reset' not described in 'ftrace_set_global_notrace'


vim +5417 kernel/trace/ftrace.c

f64dd4627ec6edc Jiri Olsa      2021-10-08  5401  
f64dd4627ec6edc Jiri Olsa      2021-10-08  5402  /**
da8bdfbd422333f Florent Revest 2023-03-21  5403   * unregister_ftrace_direct - Remove calls to custom trampoline
da8bdfbd422333f Florent Revest 2023-03-21  5404   * previously registered by register_ftrace_direct for @ops object.
f64dd4627ec6edc Jiri Olsa      2021-10-08  5405   * @ops: The address of the struct ftrace_ops object
f64dd4627ec6edc Jiri Olsa      2021-10-08  5406   *
f64dd4627ec6edc Jiri Olsa      2021-10-08  5407   * This is used to remove a direct calls to @addr from the nop locations
f64dd4627ec6edc Jiri Olsa      2021-10-08  5408   * of the functions registered in @ops (with by ftrace_set_filter_ip
f64dd4627ec6edc Jiri Olsa      2021-10-08  5409   * function).
f64dd4627ec6edc Jiri Olsa      2021-10-08  5410   *
f64dd4627ec6edc Jiri Olsa      2021-10-08  5411   * Returns:
f64dd4627ec6edc Jiri Olsa      2021-10-08  5412   *  0 on success
f64dd4627ec6edc Jiri Olsa      2021-10-08  5413   *  -EINVAL - The @ops object was not properly registered.
f64dd4627ec6edc Jiri Olsa      2021-10-08  5414   */
da8bdfbd422333f Florent Revest 2023-03-21  5415  int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long addr,
59495740f79524b Florent Revest 2023-03-21  5416  			     bool free_filters)
f64dd4627ec6edc Jiri Olsa      2021-10-08 @5417  {
f64dd4627ec6edc Jiri Olsa      2021-10-08  5418  	struct ftrace_hash *hash = ops->func_hash->filter_hash;
f64dd4627ec6edc Jiri Olsa      2021-10-08  5419  	int err;
f64dd4627ec6edc Jiri Olsa      2021-10-08  5420  
f64dd4627ec6edc Jiri Olsa      2021-10-08  5421  	if (check_direct_multi(ops))
f64dd4627ec6edc Jiri Olsa      2021-10-08  5422  		return -EINVAL;
f64dd4627ec6edc Jiri Olsa      2021-10-08  5423  	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
f64dd4627ec6edc Jiri Olsa      2021-10-08  5424  		return -EINVAL;
f64dd4627ec6edc Jiri Olsa      2021-10-08  5425  
f64dd4627ec6edc Jiri Olsa      2021-10-08  5426  	mutex_lock(&direct_mutex);
f64dd4627ec6edc Jiri Olsa      2021-10-08  5427  	err = unregister_ftrace_function(ops);
f64dd4627ec6edc Jiri Olsa      2021-10-08  5428  	remove_direct_functions_hash(hash, addr);
f64dd4627ec6edc Jiri Olsa      2021-10-08  5429  	mutex_unlock(&direct_mutex);
fea3ffa48c6d42a Jiri Olsa      2021-12-06  5430  
fea3ffa48c6d42a Jiri Olsa      2021-12-06  5431  	/* cleanup for possible another register call */
fea3ffa48c6d42a Jiri Olsa      2021-12-06  5432  	ops->func = NULL;
fea3ffa48c6d42a Jiri Olsa      2021-12-06  5433  	ops->trampoline = 0;
59495740f79524b Florent Revest 2023-03-21  5434  
59495740f79524b Florent Revest 2023-03-21  5435  	if (free_filters)
59495740f79524b Florent Revest 2023-03-21  5436  		ftrace_free_filter(ops);
f64dd4627ec6edc Jiri Olsa      2021-10-08  5437  	return err;
f64dd4627ec6edc Jiri Olsa      2021-10-08  5438  }
da8bdfbd422333f Florent Revest 2023-03-21  5439  EXPORT_SYMBOL_GPL(unregister_ftrace_direct);
ccf5a89efd6f0a9 Jiri Olsa      2021-10-08  5440  

:::::: The code at line 5417 was first introduced by commit
:::::: f64dd4627ec6edc39bf1430fe6dbc923d2300a88 ftrace: Add multi direct register/unregister interface

:::::: TO: Jiri Olsa <jolsa@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
