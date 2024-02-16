Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A2B182AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708117682; cv=none; b=Pb+mq2emlRRecB7dFIUjm4RO9HWWuqN5o6zoCKVIRJ6n5f+mIVdBGyS+5CfCy3amETMZhuMb2QLy4ldAO90kBr7dmvjE2FaEp0hqej1Z84OaogC3+nqawRKnr3FwnFXuSEfTvGDDiQm4dXgUizBOO6YLqfOv/+tAZCWNup7H2ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708117682; c=relaxed/simple;
	bh=4ez7D6iFJ7DLibVq7aKdkhtpDWkXwFrfCRiGPbgR1lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVK3L3vmhyQs7NnPreQhuq5KLpt7SR5+ghhF/Au18rofDKty97ihKfQl2ieMnRz7+3KzL0oE5Wo9dDQkbNNNIPFbuJg1RChAa9vR10Ug82QUAFvBBJorh1QXdJRGwkdPHNMIPiBLANWWVOdPPIVW5pQgnSalWJ9jf2Dn8YApzqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXNIJWgv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXNIJWgv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708117680; x=1739653680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ez7D6iFJ7DLibVq7aKdkhtpDWkXwFrfCRiGPbgR1lE=;
  b=cXNIJWgvbBs1JM+yZXMqMyAuYcBPBkPYx/DoNPr6OcSL3Kvfo39t9AYZ
   F9JQQFtmZPvGr6+uDD+LOGT1Z4VXUbc1oRIU0tAaS4qMbY1U5CGqUS9kK
   haTY8EirY6RhiOL5YaOvjDbpmwdezKW/nEvapRmxe8cCXNGnd5ylrBOPs
   rKVQWGBzFsDpO4toHPpKrXEjq88ugGiPRdE+MzHkqfQ3BqQEJ+hdgD9qi
   8nfpgMU/Wp4N454CP6+6nJX1hkdUTx6ztnaSuu9av96mtIYmqydcqu34S
   yw03lBxUb9QUyyadYP1H8RYCwUUypTNjBl04lg9mQAWggAOHGF+Z0n+wm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="13365224"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="13365224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 13:07:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="8614361"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 16 Feb 2024 13:07:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rb5R5-0001c0-1I;
	Fri, 16 Feb 2024 21:07:55 +0000
Date: Sat, 17 Feb 2024 05:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-wq:disable_work-v1 49/58] kernel/workqueue.c:2179: warning:
 Function parameter or struct member 'irq_flags' not described in
 'work_grab_pending'
Message-ID: <202402170556.urV1F4Ou-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git disable_work-v1
head:   87c101f9516935a88f4c3f01c743d206bfb3bf65
commit: 8f991cee12e0fcd53fee55d3c9d2746d5ef9f4a1 [49/58] workqueue: Factor out work_grab_pending() from __cancel_work_sync()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240217/202402170556.urV1F4Ou-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402170556.urV1F4Ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402170556.urV1F4Ou-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/workqueue.c:2179: warning: Function parameter or struct member 'irq_flags' not described in 'work_grab_pending'


vim +2179 kernel/workqueue.c

  2163	
  2164	/**
  2165	 * work_grab_pending - steal work item from worklist and disable irq
  2166	 * @work: work item to steal
  2167	 * @cflags: %WORK_CANCEL_ flags
  2168	 *
  2169	 * Grab PENDING bit of @work. @work can be in any stable state - idle, on timer
  2170	 * or on worklist.
  2171	 *
  2172	 * Must be called in process context. IRQ is disabled on return. The caller is
  2173	 * responsible for re-enabling it using local_irq_enable().
  2174	 *
  2175	 * Returns %true if @work was pending. %false if idle.
  2176	 */
  2177	static bool work_grab_pending(struct work_struct *work, u32 cflags,
  2178				      unsigned long *irq_flags)
> 2179	{
  2180		struct cwt_wait cwait;
  2181		int ret;
  2182	
  2183		might_sleep();
  2184	repeat:
  2185		ret = try_to_grab_pending(work, cflags, irq_flags);
  2186		if (likely(ret >= 0))
  2187			return ret;
  2188		if (ret != -ENOENT)
  2189			goto repeat;
  2190	
  2191		/*
  2192		 * Someone is already canceling. Wait for it to finish. flush_work()
  2193		 * doesn't work for PREEMPT_NONE because we may get woken up between
  2194		 * @work's completion and the other canceling task resuming and clearing
  2195		 * CANCELING - flush_work() will return false immediately as @work is no
  2196		 * longer busy, try_to_grab_pending() will return -ENOENT as @work is
  2197		 * still being canceled and the other canceling task won't be able to
  2198		 * clear CANCELING as we're hogging the CPU.
  2199		 *
  2200		 * Let's wait for completion using a waitqueue. As this may lead to the
  2201		 * thundering herd problem, use a custom wake function which matches
  2202		 * @work along with exclusive wait and wakeup.
  2203		 */
  2204		init_wait(&cwait.wait);
  2205		cwait.wait.func = cwt_wakefn;
  2206		cwait.work = work;
  2207	
  2208		prepare_to_wait_exclusive(&wq_cancel_waitq, &cwait.wait,
  2209					  TASK_UNINTERRUPTIBLE);
  2210		if (work_is_canceling(work))
  2211			schedule();
  2212		finish_wait(&wq_cancel_waitq, &cwait.wait);
  2213	
  2214		goto repeat;
  2215	}
  2216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
