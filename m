Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A00171B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695365970; x=1726901970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=auetQJNJSdgy1cpJ/7l9/uPBAnH3u6TY6eocg0SgsUw=;
  b=Zi5W+RoGKyWH1yzuOf+KpxRQl2gvt78A6yggtniQu3THEfZ6cucRTxnt
   U5wRuX2lwVIYe7BZNlhDUh/7XgVY2PEev0eiRJ7Js908BniOoA6P1+Iq2
   mGjYR/qEN+6tGpPFYNoDM++o8PK05tpJeFRI6B8FqX4pIcpHV7/R7Epf4
   VEBBX3TY2ZrNGN/ICEC4DAGxqAvJ5Y4zWCw/ziDdrQhznfnjW7vf1K0R0
   2EN7657iIyVl/WU+y7x86Q1f3udUsLGza4+fCyzi6Qy7YecBMRlL217ib
   c9ffViw5caJkJ4u9BCX7gq8A4tKR2JzYazCJ/Fcljo9/RLWVuNgOMZgZs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="411698547"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="411698547"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 23:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="1078261980"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="1078261980"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2023 23:59:26 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qja8K-0000FD-1e;
	Fri, 22 Sep 2023 06:59:24 +0000
Date: Fri, 22 Sep 2023 14:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>
Subject: [rt-devel:linux-6.4.y-rt-rebase 33/79]
 kernel/printk/printk_nobkl.c:1029: warning: Function parameter or member
 'unsafe' not described in '__console_update_unsafe'
Message-ID: <202309221409.ffZRjmwb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.4.y-rt-rebase
head:   fb7828286d1ee12dc132500e9fc84085ceadabc3
commit: d523dabca7de4c0c516c0fc3eb595ccc13756145 [33/79] printk: nobkl: Add print state functions
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20230922/202309221409.ffZRjmwb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309221409.ffZRjmwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221409.ffZRjmwb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk_nobkl.c:1029: warning: Function parameter or member 'unsafe' not described in '__console_update_unsafe'


vim +1029 kernel/printk/printk_nobkl.c

  1010	
  1011	/**
  1012	 * __console_update_unsafe - Update the unsafe bit in @con->atomic_state
  1013	 * @wctxt:	The write context that was handed to the write function
  1014	 *
  1015	 * Returns:	True if the state is correct. False if a handover
  1016	 *		has been requested or if the console was taken
  1017	 *		over.
  1018	 *
  1019	 * Must be invoked before an unsafe driver section is entered.
  1020	 *
  1021	 * When this function returns false then the calling context is not allowed
  1022	 * to go forward and has to back out immediately and carefully. The buffer
  1023	 * content is no longer trusted either and the console lock is no longer
  1024	 * held.
  1025	 *
  1026	 * Internal helper to avoid duplicated code
  1027	 */
  1028	static bool __console_update_unsafe(struct cons_write_context *wctxt, bool unsafe)
> 1029	{
  1030		struct cons_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
  1031		struct console *con = ctxt->console;
  1032		struct cons_state new;
  1033	
  1034		do  {
  1035			if (!console_can_proceed(wctxt))
  1036				return false;
  1037			/*
  1038			 * console_can_proceed() saved the real state in
  1039			 * ctxt->old_state
  1040			 */
  1041			copy_full_state(new, ctxt->old_state);
  1042			new.unsafe = unsafe;
  1043	
  1044		} while (!cons_state_try_cmpxchg(con, CON_STATE_CUR, &ctxt->old_state, &new));
  1045	
  1046		copy_full_state(ctxt->state, new);
  1047		return true;
  1048	}
  1049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
