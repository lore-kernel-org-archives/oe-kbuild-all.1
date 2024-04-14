Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A7311184
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713057593; cv=none; b=KXq5/t+adnCHAmRHFrxkYeK/sBJvuqRh0GC1Qyc1eXhnCdSGVEXIVQqLRArSNoigor26n6RRxGEcjd2EkEwPNWBPeTdgl6Jj9nS7XqPdKnAdCnuP/O6zvCqvpK0/WNptRYukwngjO49nP+odwmo5g0aCWjGAjOqnqyEZ/fbZqVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713057593; c=relaxed/simple;
	bh=lSDAMKYcy+h93YVR+ETTMjwZJZp5xXPLKmESGMgsmUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rc3uiRTsmHku+c/jgPpJ42i89bywCy/Y+ZVm0bg39bS718M6/RmNTcPCYw24BPsaaRDOrE8TzU5OBkeIYCpBcn7ISLPyYgZFiSSziNOovjaD/dEsYpi3aLdadBUC/Keq3W7kmsOf+hvfsRbfFnGRn9QwpaPi2jfCG4zHN4VVzhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYGYursx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYGYursx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713057591; x=1744593591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lSDAMKYcy+h93YVR+ETTMjwZJZp5xXPLKmESGMgsmUw=;
  b=iYGYursxN/BXh3GvbhRbdfuN/SH3UvsKGgIYdaGQbV0xxjlo4+GtQ0oC
   JfAEJQQQF9C4FbU7YmzTn+Sof95EDW5rsv4+ofV4KbmtaX0wGW73CliDl
   2qXJEHo1QnM0xJBytnrcNGRoW47iN6J1hxyc+2Ub+XZ0mDST3DC//zz+i
   rpBkL/fvUjMKYU3TYt4wb3voSY+h4S0T2kBU2qylNktR+DMnHCOkYbp0X
   VPMDc9HDFYb/6ytdKQPvQftXmKqjRtHPrCNcjXSumaqGO2vE4sInVX+i8
   QlOaSr+9NbsZKJJ9eVOCKZqrbmjdUcnrmUcS0kZOlQZZSnvHXJpmY+GSc
   A==;
X-CSE-ConnectionGUID: sPGPPrJYTGKvtmmz6n8JCQ==
X-CSE-MsgGUID: K9rgTjXDSByK+c374C/pXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="12256449"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="12256449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 18:19:50 -0700
X-CSE-ConnectionGUID: MSeqEMGYQU+bGpkV+fbp1Q==
X-CSE-MsgGUID: RvNBXgGzRk6SXkZ0+DXLCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="26218134"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 13 Apr 2024 18:18:13 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvoVX-00038u-03;
	Sun, 14 Apr 2024 01:18:11 +0000
Date: Sun, 14 Apr 2024 09:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 148/152] kernel/sched/core.c:4125:25:
 error: implicit declaration of function 'stack_trace_save_tsk'
Message-ID: <202404140942.VIUVBW2X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   b13a1b7e90ec8c77d564e388bd22ff2e4a6cf650
commit: 8af2a28a7b6ece6570edecca252194bb460665b2 [148/152] trace_sched_wakeup_backtrace
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240414/202404140942.VIUVBW2X-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404140942.VIUVBW2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404140942.VIUVBW2X-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'do_trace_sched_wakeup_backtrace':
>> kernel/sched/core.c:4125:25: error: implicit declaration of function 'stack_trace_save_tsk' [-Werror=implicit-function-declaration]
    4125 |                 bt_nr = stack_trace_save_tsk(task, bt, ARRAY_SIZE(bt), 0);
         |                         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/stack_trace_save_tsk +4125 kernel/sched/core.c

  4110	
  4111	static noinline void do_trace_sched_wakeup_backtrace(struct task_struct *task, u64 start_time)
  4112	{
  4113		u64 duration = ktime_get_ns() - start_time;
  4114	
  4115		if (duration < 1000 * 1000)
  4116			return;
  4117	
  4118		if (task->__state & TASK_NOLOAD)
  4119			return;
  4120	
  4121		unsigned long bt[10];
  4122		unsigned bt_nr = 0;
  4123	
  4124		if (down_read_trylock(&task->signal->exec_update_lock)) {
> 4125			bt_nr = stack_trace_save_tsk(task, bt, ARRAY_SIZE(bt), 0);
  4126			up_read(&task->signal->exec_update_lock);
  4127		}
  4128	
  4129		trace_sched_wakeup_backtrace(task, duration, bt, bt_nr);
  4130	}
  4131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
