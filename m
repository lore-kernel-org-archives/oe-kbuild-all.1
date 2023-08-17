Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705FA20
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 06:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692252433; x=1723788433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2TK/ydusAw5FqhuivmBBFDVDDRo67z3doaZUynMBbE=;
  b=cD881mHjNvJZjbppxzS7XKR28hTGhXH84XfLET4UDkHJz2D7ks9lUhdh
   WaEHJ1GwbUNmBHol7xNhr2/oJHIQ38Kf0TFdFKc2kMsiQrjPLh7RgbO2Q
   a5UxbAx6SkF3CrlizjTgxqCe5/u7h5vl5twhnoHcIDXpMkoKAqFjdMiCf
   UAWF5XUtpZ6BFooFoqvssuMqE8jdHX9JXH3HtdfO+9eBB4R5u/8ksL+4w
   n7LcF9sxlOyJLMgQHnD5TEwbcDvJjXwVwwja+4x7i/HWT+aGy6FkG+c66
   vulv5o8EFQxJvOsmBmUzSYj/zaxMkyBMF3OYdOOs5C3vpiodXhupFqBpx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="459078447"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="459078447"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 23:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="858097048"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="858097048"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 23:07:09 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWWA0-0000px-0d;
	Thu, 17 Aug 2023 06:07:08 +0000
Date: Thu, 17 Aug 2023 14:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>
Subject: [rt-devel:linux-6.5.y-rt 31/87] kernel/printk/printk_nobkl.c:1029:
 warning: Function parameter or member 'unsafe' not described in
 '__console_update_unsafe'
Message-ID: <202308171313.el16bGIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.5.y-rt
head:   16ae0de52ef9f7e5c2cd7e8443f5195c176353ea
commit: aa998c7010a5fb980abe598fc1e34ad69da6dd44 [31/87] printk: nobkl: Add print state functions
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230817/202308171313.el16bGIc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171313.el16bGIc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171313.el16bGIc-lkp@intel.com/

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
