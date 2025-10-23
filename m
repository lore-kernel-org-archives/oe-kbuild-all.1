Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D2330649B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227127; cv=none; b=PK7tIPHvYw0+rL1PqQ5xfbReQ7ZAj1pQ3pIOFJCQO6QOmrzOiO38B5Q4g1ObaXeQtuh9D8Ko6hsNtgNLO1suareqDlvD4ITWcO1JX3wUj4aPtRVWojuHjv+jDvFw30pFqI2k0QWCRkMQ0w7L8vtRK+H9wfELgy+EqyJLNdgyVsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227127; c=relaxed/simple;
	bh=YA7Kt8pC5KOUrSoBA+48+jFN6n0v2qJqLQXzjCFRm8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPK3KnGPUUY53V9myZK/fuUvsgxwoRp28kZZlQ1gbXlfOMW/YR2ySy6T3PZIP8H4KwVOznvycrQAaaX2hnOctYIvWuxgWFJpg0X8AI6w67R9JyLIGnsqXW0CU1JORAkU0r5Mgu6UohNEuU4cHFNZXtWFAPlJE+IOfrxQ7I2arkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzGN5zkt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzGN5zkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761227126; x=1792763126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YA7Kt8pC5KOUrSoBA+48+jFN6n0v2qJqLQXzjCFRm8U=;
  b=lzGN5zktL/BmJAoXVrSnXekLHO594QeL7IAcDxwtNw3O5rH+q5ZLm3YL
   N9LXZMqD5XJ0i6O6wbCv6eQJbStF5ZTzzAZMkm73oORKw+15GGTLMW3O1
   R2m6SF1/VGwhbEPbLULpy118L9UTq1a6RM+gH+gHAttQu6ZOxnDIi3ZxZ
   TKUxySUkSCSp4elQ2NYfir5/Vclfq4m9EY0vx79Yb4PDLFvRlV1zspvVP
   3UrtQbCKhpnKj/LvIpQOtiTrTbJKF4glfhuuIu1mVXMBL96QaYJHXZjMm
   +fyppOGs3z5Nr5/+cTYD3/HBReJG8SKqshBE0zTC4prOzx76epsQb5GGG
   Q==;
X-CSE-ConnectionGUID: Tr5L91rtQZqNIYoO7QC/5g==
X-CSE-MsgGUID: XI264Bm8S7ewVzvULZogfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62425279"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="62425279"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 06:45:07 -0700
X-CSE-ConnectionGUID: /7Ka4OjqQWqju0M3M2qCKw==
X-CSE-MsgGUID: czAKOD8WQRChP2mR75BpbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="189422051"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Oct 2025 06:45:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBvcf-000DXd-0H;
	Thu, 23 Oct 2025 13:44:58 +0000
Date: Thu, 23 Oct 2025 21:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/single_direct_ops 6/9]
 samples/ftrace/ftrace-direct-multi.c:228:16: error: too few arguments to
 function 'register_ftrace_direct'
Message-ID: <202510232105.FcQpUN0T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/single_direct_ops
head:   3d31a310468694e4395d61e15c65edaa618fbb5c
commit: 1e0ad55e88bddb17e85b4b7c4ba933f3b98ecca0 [6/9] ftrace: Use direct hash interface in direct functions
config: x86_64-randconfig-121-20251023 (https://download.01.org/0day-ci/archive/20251023/202510232105.FcQpUN0T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510232105.FcQpUN0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510232105.FcQpUN0T-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   samples/ftrace/ftrace-direct-multi.c: In function 'ftrace_direct_multi_init':
>> samples/ftrace/ftrace-direct-multi.c:228:16: error: too few arguments to function 'register_ftrace_direct'
     228 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from samples/ftrace/ftrace-direct-multi.c:5:
   include/linux/ftrace.h:539:5: note: declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi.c: In function 'ftrace_direct_multi_exit':
>> samples/ftrace/ftrace-direct-multi.c:233:9: error: too few arguments to function 'unregister_ftrace_direct'
     233 |         unregister_ftrace_direct(&direct, (unsigned long) my_tramp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:540:5: note: declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi.c: In function 'ftrace_direct_multi_init':
>> samples/ftrace/ftrace-direct-multi.c:229:1: warning: control reaches end of non-void function [-Wreturn-type]
     229 | }
         | ^
--
   samples/ftrace/ftrace-direct-multi-modify.c: In function 'simple_thread':
>> samples/ftrace/ftrace-direct-multi-modify.c:347:23: error: too few arguments to function 'modify_ftrace_direct'
     347 |                 ret = modify_ftrace_direct(&direct, tramps[t]);
         |                       ^~~~~~~~~~~~~~~~~~~~
   In file included from samples/ftrace/ftrace-direct-multi-modify.c:4:
   include/linux/ftrace.h:542:5: note: declared here
     542 | int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr, bool lock_direct_mutex);
         |     ^~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi-modify.c: In function 'ftrace_direct_multi_init':
>> samples/ftrace/ftrace-direct-multi-modify.c:365:15: error: too few arguments to function 'register_ftrace_direct'
     365 |         ret = register_ftrace_direct(&direct, my_tramp);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:539:5: note: declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi-modify.c: In function 'ftrace_direct_multi_exit':
>> samples/ftrace/ftrace-direct-multi-modify.c:375:9: error: too few arguments to function 'unregister_ftrace_direct'
     375 |         unregister_ftrace_direct(&direct, my_tramp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:540:5: note: declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_ftrace_direct +228 samples/ftrace/ftrace-direct-multi.c

5fae941b9a6f95 Jiri Olsa      2021-10-08  222  
5fae941b9a6f95 Jiri Olsa      2021-10-08  223  static int __init ftrace_direct_multi_init(void)
5fae941b9a6f95 Jiri Olsa      2021-10-08  224  {
5fae941b9a6f95 Jiri Olsa      2021-10-08  225  	ftrace_set_filter_ip(&direct, (unsigned long) wake_up_process, 0, 0);
5fae941b9a6f95 Jiri Olsa      2021-10-08  226  	ftrace_set_filter_ip(&direct, (unsigned long) schedule, 0, 0);
5fae941b9a6f95 Jiri Olsa      2021-10-08  227  
da8bdfbd422333 Florent Revest 2023-03-21 @228  	return register_ftrace_direct(&direct, (unsigned long) my_tramp);
5fae941b9a6f95 Jiri Olsa      2021-10-08 @229  }
5fae941b9a6f95 Jiri Olsa      2021-10-08  230  
5fae941b9a6f95 Jiri Olsa      2021-10-08  231  static void __exit ftrace_direct_multi_exit(void)
5fae941b9a6f95 Jiri Olsa      2021-10-08  232  {
da8bdfbd422333 Florent Revest 2023-03-21 @233  	unregister_ftrace_direct(&direct, (unsigned long) my_tramp, true);
5fae941b9a6f95 Jiri Olsa      2021-10-08  234  }
5fae941b9a6f95 Jiri Olsa      2021-10-08  235  

:::::: The code at line 228 was first introduced by commit
:::::: da8bdfbd422333fbb7c85ac1d7f18592d17d6665 ftrace: Rename _ftrace_direct_multi APIs to _ftrace_direct APIs

:::::: TO: Florent Revest <revest@chromium.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
