Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D31BC59
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712113824; cv=none; b=HJ1UhT7IGSyzeEmw/lRrN9H2lNjgrBNKEl9cWUKgSKmJo/Q9UvoLq/wo7gIkp0dokFeGqe3F63r9Fo8F/U2DLz06SV7VSwt9qvLcgtqacr5zV0/5Sn9v6T9w5sVjM/ILLwEfNo6scd5ZtrmaHnHlgKWz/mTSNnfqU9sutBIOYmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712113824; c=relaxed/simple;
	bh=BHBA0LxvDzjp35wCtebLafCmKLQ6bA9qiLF744TaRq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NL/lsEC2uGoEmBmcQu/EiVTB/JVyi59i30K/zMmg+KDbQ5KFjTRgw8KLs4Z8yOqFODZ8OlV/9a7uKil51CSn5AxWFITaekRL03EF6d/rSmMAUUtCUe2gMP7JPy/mAQBGOzSwndlediw6jE9dLJcFIMc03/mnDDfPmAmvUOjsb3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDLcU8AW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDLcU8AW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712113823; x=1743649823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BHBA0LxvDzjp35wCtebLafCmKLQ6bA9qiLF744TaRq4=;
  b=UDLcU8AWNm43vg4VhvB6KOhMs0UunppxzSW4cqyQZSXsip+gRc4lG+fN
   wQmPNCZpqwIckr5kIU7gD43z87RYzTLlhdHDP2Qo9XYcOGUQm3GCPlAuT
   urodST26VB69Lvy+f2usgnblQ4+3rA8RHSzI2K3BeUq3ONEePehH87siI
   7QVNLRchryN4Qt98NlLgwoBZtLDiM5I/T5jSDJPq+gdkH1ZyrX5ziOVQr
   TKsjf9lP9LN28zxGQ+E/xPW7bAP4T1t7Gi3LaKI5S1AazWegbmpUxaNuH
   +wgX+OrsdBVRWl/HBySQ6PVlkoDnNooQX24P1xlz/aXqhZgZ5SbFR26b5
   A==;
X-CSE-ConnectionGUID: /PWt7zelTcygrrDUxzFybw==
X-CSE-MsgGUID: ISnFd6dqSw2TeE+0ACe6lA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29798535"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="29798535"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 20:10:22 -0700
X-CSE-ConnectionGUID: sujJcZP+QHiEkx3NncS9yw==
X-CSE-MsgGUID: d1vqKUssTtCqS7TMAZFORw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="22765860"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Apr 2024 20:10:21 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrr10-0001nn-2x;
	Wed, 03 Apr 2024 03:10:18 +0000
Date: Wed, 3 Apr 2024 11:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9884/9898] kernel/softirq.c:115:48:
 error: implicit declaration of function '__kthread_should_park'; did you
 mean 'kthread_should_park'?
Message-ID: <202404031124.ZFCg8c5q-lkp@intel.com>
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
commit: 6d86e2f02d6d69b1b3a022d8106d5051ebe7c47b [9884/9898] FROMLIST: softirq: defer softirq processing to ksoftirqd if CPU is busy with RT
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240403/202404031124.ZFCg8c5q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031124.ZFCg8c5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031124.ZFCg8c5q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/softirq.c: In function 'ksoftirqd_running':
>> kernel/softirq.c:115:48: error: implicit declaration of function '__kthread_should_park'; did you mean 'kthread_should_park'? [-Werror=implicit-function-declaration]
     115 |         return tsk && task_is_running(tsk) && !__kthread_should_park(tsk);
         |                                                ^~~~~~~~~~~~~~~~~~~~~
         |                                                kthread_should_park
   kernel/softirq.c: At top level:
>> kernel/softirq.c:109:13: warning: 'ksoftirqd_running' defined but not used [-Wunused-function]
     109 | static bool ksoftirqd_running(unsigned long pending)
         |             ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +115 kernel/softirq.c

   101	
   102	#ifndef CONFIG_RT_SOFTIRQ_AWARE_SCHED
   103	/*
   104	 * If ksoftirqd is scheduled, we do not want to process pending softirqs
   105	 * right now. Let ksoftirqd handle this at its own rate, to get fairness,
   106	 * unless we're doing some of the synchronous softirqs.
   107	 */
   108	#define SOFTIRQ_NOW_MASK ((1 << HI_SOFTIRQ) | (1 << TASKLET_SOFTIRQ))
 > 109	static bool ksoftirqd_running(unsigned long pending)
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
