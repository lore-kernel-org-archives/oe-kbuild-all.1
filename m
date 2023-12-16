Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952511705
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoOrHLy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702703890; x=1734239890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCzQ1SMWQaQm32fGGYQUHlQ3yYpfHekyG1bPqNOHJY0=;
  b=HoOrHLy+vcSNUCJXc81HCkLS1pThCtI7UU0pX4Er6y2KDXWalinc5/jO
   YM3lzIacOTAS+hLyBpHBSi8PTpRZjxAj+ig347z5fZFzfWP05gooTmj+V
   8fxHLXoZ8BtHjuoQlFDmzwloxD8XKk0pB8LtR8tWRriVTbNT4f9IhUyOX
   JC4zjOUeShYRaSLWdl0tBQUgUneg3T0WPq2zeQ8ao2GcmSq+gHcRDOs8D
   /lnd8xhRv14VDI4HToAW1ZatBbMG7xvMyx13ZUSxCrLFJpulQE//3xtRx
   CWm6NBiiRSQ1bH5RQ+XWOOe4I/sJpDftP86s4oEJZjzzLglWfFldCWqIW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="2445994"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="2445994"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 21:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="948190424"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="948190424"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2023 21:18:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEN3t-0001Bv-2V;
	Sat, 16 Dec 2023 05:18:05 +0000
Date: Sat, 16 Dec 2023 13:17:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:ring-buffer-multi-page-subbufers 39/55]
 kernel/trace/ring_buffer.c:583:23: error: invalid operands to binary ==
 (have 'u64' {aka 'long long unsigned int'} and 'local64_t')
Message-ID: <202312161325.5yxyVS9a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git ring-buffer-multi-page-subbufers
head:   883548694834c837f1941ae9a22ed3c29a6783bf
commit: 0352b85e3dffe9b17295d3bd790d20b8b14f75c3 [39/55] ring-buffer: Remove 32bit timestamp logic
config: i386-buildonly-randconfig-004-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161325.5yxyVS9a-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161325.5yxyVS9a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161325.5yxyVS9a-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/ring_buffer.c: In function 'rb_time_cmp_and_update':
>> kernel/trace/ring_buffer.c:583:23: error: invalid operands to binary == (have 'u64' {aka 'long long unsigned int'} and 'local64_t')
     583 |         return expect == READ_ONCE(t->time);
         |                       ^~
   kernel/trace/ring_buffer.c:587:1: warning: control reaches end of non-void function [-Wreturn-type]
     587 | }
         | ^


vim +583 kernel/trace/ring_buffer.c

   575	
   576	/*
   577	 * Returns true if t == expect, and if possible will update with set,
   578	 * but t is not guaranteed to be updated even if this returns true
   579	 */
   580	static bool rb_time_cmp_and_update(rb_time_t *t, u64 expect, u64 set)
   581	{
   582	#ifdef RB_TIME_32
 > 583		return expect == READ_ONCE(t->time);
   584	#else
   585		return local64_try_cmpxchg(&t->time, &expect, set);
   586	#endif
   587	}
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
