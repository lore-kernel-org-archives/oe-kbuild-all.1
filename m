Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA99812B85
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694860052; x=1726396052;
  h=date:from:to:cc:subject:message-id;
  bh=JPvIbJLdQB5oHeVLeaVCobLaDBDJNmSPIDN3lxVBg7w=;
  b=LJhyYXVgGrT3+Jgsq9Dpdg+iXgqYzEd5ud0fe3hw6M0j/+1zEzWLvwJX
   vawj98bm14HhLFGSHj9xblRgfT3MwTs4VGHfUNjWTGw7yjh22+zduu+/i
   LWaPBhdahV/DTnD/IAZfr3xvFqqmbB+FFkbMH8IOUK529lYKa+L96sWPD
   TIHiPQvnQEOaioDOM2URE/L8cLmfi1rMo+IOCciEGjLStZCWSB55WOZV9
   F3fDviZ7foBo2QVvdw6JRDPN4StwH+VJRxyA5x452j8xbfdIkOsIdDDfv
   DnUkPjP82iwpWE1YjsppCjNXvJSHS4VGibik+dG56atYdgB/tYb6kxjLN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465761550"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="465761550"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 03:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="918937590"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="918937590"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Sep 2023 03:27:30 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhSWM-0004Bs-0r;
	Sat, 16 Sep 2023 10:27:28 +0000
Date: Sat, 16 Sep 2023 18:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: [lkp] [+115 bytes kernel size regression] [i386-tinyconfig]
 [fa14aa2c23] sched/core: Remove ifdeffery for saved_state
Message-ID: <20230916102651.oRyhH%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>


FYI, we noticed a +115 bytes kernel size regression due to commit:

commit: fa14aa2c23d31eb39bc615feb920f28d32d2a87e (sched/core: Remove ifdeffery for saved_state)
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/maybe


Details as below (size data is obtained by `nm --size-sort vmlinux`):

4ff34ad3: sched/core: Use do-while instead of for loop in set_nr_if_polling()
fa14aa2c: sched/core: Remove ifdeffery for saved_state

+-------------------------+----------+----------+-------+
|         symbol          | 4ff34ad3 | fa14aa2c | delta |
+-------------------------+----------+----------+-------+
| nm.T.wait_task_inactive | 151      | 216      | 65    |
| bzImage                 | 522272   | 522336   | 64    |
| nm.T.try_to_wake_up     | 238      | 269      | 31    |
| nm.T.reweight_task      | 355      | 367      | 12    |
| nm.t.__sched_fork       | 176      | 179      | 3     |
| nm.t.dequeue_task_fair  | 383      | 386      | 3     |
| nm.D.linux_banner       | 155      | 156      | 1     |
+-------------------------+----------+----------+-------+



Thanks

