Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF4D6FC6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 02:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712111183; cv=none; b=mpECAjzlWUjMUvR/aCQtaFDxWxuIOsC7kb41WGpAbCaYva1d1AipFwHy1+gqcw9ARpfZII8VKp+C6lX8DqTaPgT4sfd9LApdInRdFPSBvv+qB5HzPKZggJglE9t6sSNVsaD2FFDbNWjYul3h6g4k8khRVWtiVpkaoKZkf+vEN9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712111183; c=relaxed/simple;
	bh=5QhlXHipCCAMCv6NLqfa6SxyEYywGFr6cmK/9O2JDXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T+rf4LWYFvB3Elq3611BMbq5ifXc15ky67sb6pnm6lXoVVCxXjG2Grbo1Z16NGODFfmtm62Ip56EP9Bd2necAj15Nkt/ZD94+wJrnM35zO1xmlNEler9IxFhNKOa+Pv0GhDMSWEpm9cTr2ELrkcBYwt9fkjFG6mvof+YHq2cpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWkO4WKR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWkO4WKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712111182; x=1743647182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5QhlXHipCCAMCv6NLqfa6SxyEYywGFr6cmK/9O2JDXY=;
  b=YWkO4WKRIWfDZH4yfGkNU5Nkgf2HQVLcYzDW+9GjRdLwdcIK6rnrNCwE
   pYXWKZ06ORzx5DwjaVa3G0X2foNNYPrwVSPFoQ0nKDkN9yYr8lJ3OoqSg
   ORd9U6UWGjEl8C8DXcE/gFmt33PsYSZsg3g8OIYZ/cZKSIPlLNk29e53G
   rpn8NOd7ChYHU7yPr0cO8D5rWbh5xT0NEysGxNXB2sBjiGtqrukCwWNYE
   AcTDnY1Q5dBLnVik7yHqqmWGYEirJ/uZtSANwHn7l2G0dU175a4FjTRCX
   6NTcSSL3Uj8imsctwKC3EmRe0C7Q0qX1UNsiyY2WVqLF1B+haZnm+nW6+
   Q==;
X-CSE-ConnectionGUID: a/c3FOSYQlu20T1a0SaiOA==
X-CSE-MsgGUID: FiBb5uM/Sdm5S75vIYb3qg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="24815306"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="24815306"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 19:26:21 -0700
X-CSE-ConnectionGUID: 2xvJQAeeR1mUg2aqylMp6Q==
X-CSE-MsgGUID: U93Mjeg4Qeu8I/Qzxdu7cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22975275"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Apr 2024 19:26:20 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrqKP-0001lx-2w;
	Wed, 03 Apr 2024 02:26:17 +0000
Date: Wed, 3 Apr 2024 10:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9884/9888] kernel/softirq.c:115:41:
 error: call to undeclared function '__kthread_should_park'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202404031028.mDlGSWj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   da4af44f1c749fa32bf77efa2fb5a6b709ab1647
commit: 6d86e2f02d6d69b1b3a022d8106d5051ebe7c47b [9884/9888] FROMLIST: softirq: defer softirq processing to ksoftirqd if CPU is busy with RT
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240403/202404031028.mDlGSWj5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031028.mDlGSWj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031028.mDlGSWj5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/softirq.c:115:41: error: call to undeclared function '__kthread_should_park'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     115 |         return tsk && task_is_running(tsk) && !__kthread_should_park(tsk);
         |                                                ^
   kernel/softirq.c:115:41: note: did you mean 'kthread_should_park'?
   include/linux/kthread.h:90:6: note: 'kthread_should_park' declared here
      90 | bool kthread_should_park(void);
         |      ^
   1 error generated.


vim +/__kthread_should_park +115 kernel/softirq.c

   101	
   102	#ifndef CONFIG_RT_SOFTIRQ_AWARE_SCHED
   103	/*
   104	 * If ksoftirqd is scheduled, we do not want to process pending softirqs
   105	 * right now. Let ksoftirqd handle this at its own rate, to get fairness,
   106	 * unless we're doing some of the synchronous softirqs.
   107	 */
   108	#define SOFTIRQ_NOW_MASK ((1 << HI_SOFTIRQ) | (1 << TASKLET_SOFTIRQ))
   109	static bool ksoftirqd_running(unsigned long pending)
   110	{
   111		struct task_struct *tsk = __this_cpu_read(ksoftirqd);
   112	
   113		if (pending & SOFTIRQ_NOW_MASK)
   114			return false;
 > 115		return tsk && task_is_running(tsk) && !__kthread_should_park(tsk);
   116	}
   117	#else
   118	#define ksoftirqd_running(pending) (false)
   119	#endif /* CONFIG_RT_SOFTIRQ_AWARE_SCHED */
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
