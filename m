Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730C51A841B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737143189; cv=none; b=MkAKijBLmrIwSdregJCMLl9/dn1oSxaUS4jGGBU1aeemxSdAH39edminISEu9rAkeK+WvdT67lxh/mOMpnXklNdTrW4QZ6YCWXy07Ut/Zk5gKjo3mTaxyeY3nHw+FmTm35hubMJS1KPsDRc3P6sDTMiiYvS1Pi0Kbe7pKCr6IVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737143189; c=relaxed/simple;
	bh=N95h5AkIRgEx9AuOKUFOvS0YM3BNGB9QkfedWBHNNSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Db49JlTuWEW1PeO6Qu5tbd+WJzTkChO/U2nRW5j6cq1O1YhR8co5fzuk+r4jRC0MdM644liDkj+E6HHKI+gjsRSHsLiY4dUds9gTLLq58vsCeSCjNlH3ljCX9AXKMOINufDig/xiUhYMSBosVmjZOhuqhywmEC3w0W36U3Z8/fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/mMNRzk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/mMNRzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737143189; x=1768679189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N95h5AkIRgEx9AuOKUFOvS0YM3BNGB9QkfedWBHNNSg=;
  b=I/mMNRzk0Jp7U9VlfVjg/gBQ9/wlrra1sHz0/LKZjfMpxSPQAkUCLjvZ
   GbiPrh8e+50kH/HUioTaj/mV/eQv/lGASsZ5pSMfQJVVckFigMsYJw6K9
   4JqfVtQ/5SoDFWawg1eOogOCFufA5ECjxqZ1J6S1TGKc74cUJGiXodOSc
   P96yEUk7Se7TTqKZXs3u01jJkEp+WIAPjZ9bBgpZHZ0EYFNsobCObiiMg
   7FtFNh5Jg8Mieb+pzPX+ftXSKea0qoTTq/aiJ+0UTbwB9h2tHFGBxn3FH
   ZhT+JmrFKFBJVA8S8nSdtOPURGzzm7ia/KkXcu2KYJKQavofPtkNJcKJE
   A==;
X-CSE-ConnectionGUID: x+0AMANmR2mnXJEI3Vcumw==
X-CSE-MsgGUID: GFkCSDGEQXOZWIoK6W6A7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37610935"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37610935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 11:46:28 -0800
X-CSE-ConnectionGUID: jLqtIZ1ORmOF++TpeVIIOA==
X-CSE-MsgGUID: /licOHxJQJeijAAVwpFbwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109951706"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jan 2025 11:46:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYsIS-000TeL-2B;
	Fri, 17 Jan 2025 19:46:24 +0000
Date: Sat, 18 Jan 2025 03:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: [tj-cgroup:for-next 5/5] kernel/cgroup/cpuset-v1.c:397:18: error:
 implicit declaration of function 'cgroup_path_ns_locked'; did you mean
 'cgroup_path_ns'?
Message-ID: <202501180315.KcDn5BG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
head:   03a12b026323247a320495fed3719d39cffdbe9b
commit: 03a12b026323247a320495fed3719d39cffdbe9b [5/5] cgroup/cpuset: Move procfs cpuset attribute under cgroup-v1.c
config: x86_64-buildonly-randconfig-006-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180315.KcDn5BG5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180315.KcDn5BG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180315.KcDn5BG5-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cpuset-v1.c: In function 'proc_cpuset_show':
>> kernel/cgroup/cpuset-v1.c:397:18: error: implicit declaration of function 'cgroup_path_ns_locked'; did you mean 'cgroup_path_ns'? [-Werror=implicit-function-declaration]
     397 |         retval = cgroup_path_ns_locked(css->cgroup, buf, PATH_MAX,
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  cgroup_path_ns
   cc1: some warnings being treated as errors


vim +397 kernel/cgroup/cpuset-v1.c

   375	
   376	#ifdef CONFIG_PROC_PID_CPUSET
   377	/*
   378	 * proc_cpuset_show()
   379	 *  - Print tasks cpuset path into seq_file.
   380	 *  - Used for /proc/<pid>/cpuset.
   381	 */
   382	int proc_cpuset_show(struct seq_file *m, struct pid_namespace *ns,
   383			     struct pid *pid, struct task_struct *tsk)
   384	{
   385		char *buf;
   386		struct cgroup_subsys_state *css;
   387		int retval;
   388	
   389		retval = -ENOMEM;
   390		buf = kmalloc(PATH_MAX, GFP_KERNEL);
   391		if (!buf)
   392			goto out;
   393	
   394		rcu_read_lock();
   395		spin_lock_irq(&css_set_lock);
   396		css = task_css(tsk, cpuset_cgrp_id);
 > 397		retval = cgroup_path_ns_locked(css->cgroup, buf, PATH_MAX,
   398					       current->nsproxy->cgroup_ns);
   399		spin_unlock_irq(&css_set_lock);
   400		rcu_read_unlock();
   401	
   402		if (retval == -E2BIG)
   403			retval = -ENAMETOOLONG;
   404		if (retval < 0)
   405			goto out_free;
   406		seq_puts(m, buf);
   407		seq_putc(m, '\n');
   408		retval = 0;
   409	out_free:
   410		kfree(buf);
   411	out:
   412		return retval;
   413	}
   414	#endif /* CONFIG_PROC_PID_CPUSET */
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
