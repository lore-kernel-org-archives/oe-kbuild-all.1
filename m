Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDE7138D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 07:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692258283; x=1723794283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekkzRZa/q8tTUp9IbynWhS81KKUJdGr5XhehBreEqyE=;
  b=IoV9ZyWr3VpZzhC+4TQDA704xgPDbPyFRhSXcQQNrAJpQk4V5du74nBM
   cPZ9uLTlXeJ0CAsnb3v/9Q2sRbKPk/z+DZ550xldx6NM8tfUl9WivceuA
   eJ+8N6KdxKuRD/Vk4BsWJRZKjX0vukqQuLxPid+qfu+cSOCVaj8GVTyxh
   Eiw8I94/V5JiLWbHn6SgfxnQCER0TgyT/8+XxhJWKWUYY6YApHxCaqJwo
   VPHy3X7IdY4UZVDaIQL//3/2RYMgIE+FCApwPmOa69MHfqjrofDGaqsv/
   vzCr3udo18OkHRmldNDHi5UQtcLTYz/Yzwz7YDRLiTqEP0QTsGM/VbZBR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403720780"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403720780"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1065149556"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="1065149556"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2023 00:44:39 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWXgM-0000ur-2s;
	Thu, 17 Aug 2023 07:44:38 +0000
Date: Thu, 17 Aug 2023 15:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>
Subject: [rt-devel:linux-6.5.y-rt 36/87] kernel/printk/printk_nobkl.c:1457:
 warning: Function parameter or member 'skip_unsafe' not described in
 'cons_atomic_try_acquire'
Message-ID: <202308171516.J0xzKEbc-lkp@intel.com>
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
commit: 659bbd8c02d7c75f1feb0da389c3da6d63b196ca [36/87] printk: nobkl: Provide functions for atomic write enforcement
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230817/202308171516.J0xzKEbc-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171516.J0xzKEbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171516.J0xzKEbc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/printk/printk_nobkl.c:1043: warning: Function parameter or member 'unsafe' not described in '__console_update_unsafe'
>> kernel/printk/printk_nobkl.c:1457: warning: Function parameter or member 'skip_unsafe' not described in 'cons_atomic_try_acquire'


vim +1457 kernel/printk/printk_nobkl.c

  1448	
  1449	/**
  1450	 * cons_atomic_try_acquire - Try to acquire the console for atomic printing
  1451	 * @con:	The console to acquire
  1452	 * @ctxt:	The console context instance to work on
  1453	 * @prio:	The priority of the current context
  1454	 */
  1455	static bool cons_atomic_try_acquire(struct console *con, struct cons_context *ctxt,
  1456					    enum cons_prio prio, bool skip_unsafe)
> 1457	{
  1458		memset(ctxt, 0, sizeof(*ctxt));
  1459		ctxt->console		= con;
  1460		ctxt->spinwait_max_us	= 2000;
  1461		ctxt->prio		= prio;
  1462		ctxt->spinwait		= 1;
  1463	
  1464		/* Try to acquire it directly or via a friendly handover */
  1465		if (cons_try_acquire(ctxt))
  1466			return true;
  1467	
  1468		/* Investigate whether a hostile takeover is due */
  1469		if (ctxt->old_state.cur_prio >= prio)
  1470			return false;
  1471	
  1472		if (!ctxt->old_state.unsafe || !skip_unsafe)
  1473			ctxt->hostile = 1;
  1474		return cons_try_acquire(ctxt);
  1475	}
  1476	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
