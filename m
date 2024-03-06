Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCFC8C05
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 00:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709683930; cv=none; b=R+SA94mRlBlQrN8K1uPdx0+L04Z4KpU2ApJA8yDeeABgzgmiYputsrarSwXD3FWOyOs9rYaHvyRbPUAfWo7nr0lDB8bEExWJfsqgoicnvUVv1NLcI7O2+P0eu1kzjsDCwQBMt/HCkuX/WmQBGKjB0Whuc7qFkZ2SZ3s6OOzRrA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709683930; c=relaxed/simple;
	bh=GBlDp2PRMRTEWgQHBR4I6BSMBp9G+lUUWWoi3czFS4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPgBVkJkgVMLztY9lkUoM7dejSwzRDkuHZ+GbThERHHnXU6FO8Hun7zZYf0Dms2vHnRuwhfijq6jTS43c+GXiC6RPEasBph4zAo2RCZJOWTOcgpXKCSkONTub2vSgABQpBqM9YgXBHpAtGYS6EVCVg0KKYXtvZ6aCOpPKSBwN4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVGt9IFJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVGt9IFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709683929; x=1741219929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GBlDp2PRMRTEWgQHBR4I6BSMBp9G+lUUWWoi3czFS4w=;
  b=BVGt9IFJKZ1syOhX4KcvOYqA3nTaf7M9zFd8kI/6WTCbw7APuebUj8jq
   5mR0pUtj5CBFdAtBQeEh472/sMYP++tRw2arh+q7/AhinNALjBH+d/vEJ
   CnRndOcgQCPls67fAC/J8x2rYYwGBEssys9G3VozXTTsN4VFcLqypT0tM
   vOu+YUrTIYSAd+J3qF+8LQCxxBBCu9nNpDlxz8ImC5fuZ77efqneCb3ZQ
   Tb0UdU/IG9P8oDbBy/8yC3Ih5WflfnDbL3cmE97cr6938kOCS0849YHIf
   qZloVL9NusD6crTwgA9CgmEd7PR3YfzseqLGIl2CEHK1IKjChuh9tP/H6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8092130"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="8092130"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 16:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="40554578"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Mar 2024 16:12:04 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhet7-0003lp-2W;
	Wed, 06 Mar 2024 00:12:01 +0000
Date: Wed, 6 Mar 2024 08:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25542/27434] mm/unevictable.c:283:15:
 error: implicit declaration of function 'vzalloc'; did you mean 'kzalloc'?
Message-ID: <202403060824.FOTE1l0u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 953e4dfde8008b8a93118cfdf32412a8661b276e [25542/27434] anolis: mm: use seq_file to show add_pid file
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240306/202403060824.FOTE1l0u-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060824.FOTE1l0u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060824.FOTE1l0u-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/unevictable.c: In function 'add_pid_start':
>> mm/unevictable.c:283:15: error: implicit declaration of function 'vzalloc'; did you mean 'kzalloc'? [-Werror=implicit-function-declaration]
     283 |         ctx = vzalloc(sizeof(*ctx) + proc_pids_count * sizeof(int));
         |               ^~~~~~~
         |               kzalloc
>> mm/unevictable.c:283:13: warning: assignment to 'struct add_pid_seq_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     283 |         ctx = vzalloc(sizeof(*ctx) + proc_pids_count * sizeof(int));
         |             ^
>> mm/unevictable.c:319:9: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
     319 |         vfree(ctx);
         |         ^~~~~
         |         kfree
   mm/unevictable.c: At top level:
   mm/unevictable.c:502:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     502 | const static struct proc_ops add_proc_fops = {
         | ^~~~~
   mm/unevictable.c:510:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     510 | const static struct proc_ops del_proc_fops = {
         | ^~~~~
   mm/unevictable.c:510:30: warning: 'del_proc_fops' defined but not used [-Wunused-const-variable=]
     510 | const static struct proc_ops del_proc_fops = {
         |                              ^~~~~~~~~~~~~
   mm/unevictable.c:502:30: warning: 'add_proc_fops' defined but not used [-Wunused-const-variable=]
     502 | const static struct proc_ops add_proc_fops = {
         |                              ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +283 mm/unevictable.c

   265	
   266	/*
   267	 * Note there exists a race condition that we may get inconsistent snapshots
   268	 * of pid array if call add_pid_start() more than one round due to users add
   269	 * or delete the pid. However, I think it's acceptable because the pid may
   270	 * still change even we get a consistent snapshot to show.
   271	 */
   272	static void *add_pid_start(struct seq_file *m, loff_t *pos)
   273	{
   274		struct add_pid_seq_context *ctx = NULL;
   275		struct evict_pid_entry *pid_entry;
   276		struct task_struct *tsk;
   277		struct evict_pid_entry *tmp;
   278		pid_t pid;
   279	
   280		mutex_lock(&pid_mutex);
   281		if (*pos >= proc_pids_count)
   282			goto done;
 > 283		ctx = vzalloc(sizeof(*ctx) + proc_pids_count * sizeof(int));
   284		if (unlikely(!ctx))
   285			goto done;
   286	
   287		if (proc_pids_count > 0) {
   288			list_for_each_entry_safe(pid_entry, tmp, &pid_list, list) {
   289				rcu_read_lock();
   290				tsk = find_task_by_pid_ns(pid_entry->rootpid,
   291						&init_pid_ns);
   292				if (tsk) {
   293					get_task_struct(tsk);
   294					pid = __task_pid_nr_ns(tsk, PIDTYPE_PID,
   295							task_active_pid_ns(current));
   296					put_task_struct(tsk);
   297				} else {
   298					pid = -1;
   299				}
   300				rcu_read_unlock();
   301	
   302				if (pid != -1) {
   303					ctx->pids[ctx->count++] = pid;
   304				} else {
   305					list_del(&pid_entry->list);
   306					__remove_entry(pid_entry);
   307					kfree(pid_entry);
   308				}
   309			}
   310		}
   311		if (*pos >= ctx->count)
   312			goto done;
   313		mutex_unlock(&pid_mutex);
   314		ctx->idx = *pos;
   315		m->private = ctx;
   316		return ctx;
   317	done:
   318		mutex_unlock(&pid_mutex);
 > 319		vfree(ctx);
   320		return NULL;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
