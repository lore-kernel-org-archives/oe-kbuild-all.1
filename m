Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11118C2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695369091; x=1726905091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68TIx116YzDFPMEe8kAbPJXicHYG0ofTUO9IKNbP77Y=;
  b=Zs3MIC0kno3PjuodcBbjFoeILjNr+WiCb0wc1V65HgdC3z4AZILQXqms
   Ilxr5pb5gY5LtJc/+++EbyppqSLblidRYKJwHCn2gwajx65iAvHRR27fq
   PGqbVoMDgO+wxzTbTpphU0fGX103PSbs86MzMQ8GCm5xaoq3SFA0U0k9a
   MN2qZrRB8btdVZkz6LdpGErsYt50JiFPP23XZpLxSBLW3hBDpEysiEr7I
   sAYl3JC3kW8i1Vf6F10/4xuTr7cqali8KyJYDj/5cq6qVw36Vp12X0CHn
   LSnkT/9kobiwvlkc66ovPIYpekAa0Budhv8/N0pjkBoZOPm27ZMJbDKjN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384604344"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="384604344"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 00:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837639647"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="837639647"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2023 00:51:29 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjawh-0000KN-2b;
	Fri, 22 Sep 2023 07:51:27 +0000
Date: Fri, 22 Sep 2023 15:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>
Subject: [rt-devel:linux-6.4.y-rt-rebase 38/79]
 kernel/printk/printk_nobkl.c:1457: warning: Function parameter or member
 'skip_unsafe' not described in 'cons_atomic_try_acquire'
Message-ID: <202309221553.m6a17u9D-lkp@intel.com>
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
commit: b8f97964bcf3c87323ce9a4601cfbd89521e9b64 [38/79] printk: nobkl: Provide functions for atomic write enforcement
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20230922/202309221553.m6a17u9D-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309221553.m6a17u9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221553.m6a17u9D-lkp@intel.com/

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
