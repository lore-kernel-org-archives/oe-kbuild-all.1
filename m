Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F7935DA79
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217425; cv=none; b=VJTct1eosZQoi/crUAVeinZsN5o94nfD1b6W8TtRaQQnnImg2/q5qpneFsypDsuR5O+roydMfc7Pmplmlm5hqdvz8p7Usc5DU+32TNCTHdslOPEuDKq/LyHLjAyEMlSjaUtIqhwkRmE+kqHrkMQy34xVT8w+ydZSnp0REM8lBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217425; c=relaxed/simple;
	bh=Ho5MMpYvIk/mHiFNQRZcWALGOTEKTsgF1wJdywy8fZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=USZPFAwfKT+nKiF7aI6LZtCo8uLOJohWf66Xf350BSHxueByPjL+wkVnmlPVzAcl+vnEfkzSxkIQgW9BUsq+xBC/jP63s03pyS2ehEL94qPCyoG4hqlA/MMKnw7Y/zbGST5CdUJlqbk1J1U9F4d2vz7ba3RUsU4MZ5TWFqzWWz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6v8874k; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6v8874k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773217424; x=1804753424;
  h=date:from:to:cc:subject:message-id;
  bh=Ho5MMpYvIk/mHiFNQRZcWALGOTEKTsgF1wJdywy8fZw=;
  b=O6v8874kUkOJnvhsx7mN1aGF17iIoZWuP79uaUBNokrVNTcUqO2NLNr5
   V8JQZaooBjuIARHhABYr8tw4PUO3l/b/avj4waIO/SaRkirKBIJYqYzZy
   q7Rizd7PwjMB5DhRu5gkKEAgR3t6VwgKHGp7lYBR8YvDGvi8mJJb1MnPv
   3uJFiRbOlla38Qk6VOGul/B/Te5+LlKYT/VpussSV1+KqbY32L2iJYRKw
   UYuVVciK5MgPCuFs901BCRG63PhX90JCxo/YiP5WcfLD+UQ+/uSNtSOjA
   qAxC4Gz7klrcBd0kGnQMCf4zqJh0uNqXhTqRKti+vkR514PeSrgGQkSE0
   A==;
X-CSE-ConnectionGUID: MlZveQbFQ+OhV4XiBeyRQw==
X-CSE-MsgGUID: rV5sCZuJTOiQyq1zQfIruA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91848336"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="91848336"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 01:23:43 -0700
X-CSE-ConnectionGUID: 2heM7dCsRA2MvII2ZtCQAw==
X-CSE-MsgGUID: eiCvDHI0SHqWRAyexRcRjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219639541"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Mar 2026 01:23:42 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Eqw-000000000tF-3Gkw;
	Wed, 11 Mar 2026 08:23:38 +0000
Date: Wed, 11 Mar 2026 16:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>
Subject: [linux-next:master 3603/5327] kernel/sched/ext.c:5884
 scx_enable() warn: inconsistent indenting
Message-ID: <202603111617.MkdRE7g9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7109a2155340cc7b21f27e832ece6df03592f2e8
commit: ebeca1f930eac8f11f815d58eb38fa5d07e7c16e [3603/5327] sched_ext: Introduce cgroup sub-sched support
config: sparc64-randconfig-r071-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111617.MkdRE7g9-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111617.MkdRE7g9-lkp@intel.com/

smatch warnings:
kernel/sched/ext.c:5884 scx_enable() warn: inconsistent indenting

vim +5884 kernel/sched/ext.c

ebeca1f930eac8 Tejun Heo 2026-03-06  5852  
dbd542a8fac7bc Tejun Heo 2026-03-06  5853  static s32 scx_enable(struct sched_ext_ops *ops, struct bpf_link *link)
b06ccbabe2506f Tejun Heo 2026-03-03  5854  {
b06ccbabe2506f Tejun Heo 2026-03-03  5855  	static struct kthread_worker *helper;
b06ccbabe2506f Tejun Heo 2026-03-03  5856  	static DEFINE_MUTEX(helper_mutex);
b06ccbabe2506f Tejun Heo 2026-03-03  5857  	struct scx_enable_cmd cmd;
b06ccbabe2506f Tejun Heo 2026-03-03  5858  
b06ccbabe2506f Tejun Heo 2026-03-03  5859  	if (!cpumask_equal(housekeeping_cpumask(HK_TYPE_DOMAIN),
b06ccbabe2506f Tejun Heo 2026-03-03  5860  			   cpu_possible_mask)) {
b06ccbabe2506f Tejun Heo 2026-03-03  5861  		pr_err("sched_ext: Not compatible with \"isolcpus=\" domain isolation\n");
b06ccbabe2506f Tejun Heo 2026-03-03  5862  		return -EINVAL;
b06ccbabe2506f Tejun Heo 2026-03-03  5863  	}
b06ccbabe2506f Tejun Heo 2026-03-03  5864  
b06ccbabe2506f Tejun Heo 2026-03-03  5865  	if (!READ_ONCE(helper)) {
b06ccbabe2506f Tejun Heo 2026-03-03  5866  		mutex_lock(&helper_mutex);
b06ccbabe2506f Tejun Heo 2026-03-03  5867  		if (!helper) {
b06ccbabe2506f Tejun Heo 2026-03-03  5868  			helper = kthread_run_worker(0, "scx_enable_helper");
b06ccbabe2506f Tejun Heo 2026-03-03  5869  			if (IS_ERR_OR_NULL(helper)) {
b06ccbabe2506f Tejun Heo 2026-03-03  5870  				helper = NULL;
b06ccbabe2506f Tejun Heo 2026-03-03  5871  				mutex_unlock(&helper_mutex);
b06ccbabe2506f Tejun Heo 2026-03-03  5872  				return -ENOMEM;
b06ccbabe2506f Tejun Heo 2026-03-03  5873  			}
b06ccbabe2506f Tejun Heo 2026-03-03  5874  			sched_set_fifo(helper->task);
b06ccbabe2506f Tejun Heo 2026-03-03  5875  		}
b06ccbabe2506f Tejun Heo 2026-03-03  5876  		mutex_unlock(&helper_mutex);
b06ccbabe2506f Tejun Heo 2026-03-03  5877  	}
b06ccbabe2506f Tejun Heo 2026-03-03  5878  
ebeca1f930eac8 Tejun Heo 2026-03-06  5879  #ifdef CONFIG_EXT_SUB_SCHED
ebeca1f930eac8 Tejun Heo 2026-03-06  5880  	if (ops->sub_cgroup_id > 1)
ebeca1f930eac8 Tejun Heo 2026-03-06  5881  		kthread_init_work(&cmd.work, scx_sub_enable_workfn);
ebeca1f930eac8 Tejun Heo 2026-03-06  5882  	else
ebeca1f930eac8 Tejun Heo 2026-03-06  5883  #endif	/* CONFIG_EXT_SUB_SCHED */
dbd542a8fac7bc Tejun Heo 2026-03-06 @5884  		kthread_init_work(&cmd.work, scx_root_enable_workfn);
b06ccbabe2506f Tejun Heo 2026-03-03  5885  	cmd.ops = ops;
b06ccbabe2506f Tejun Heo 2026-03-03  5886  
b06ccbabe2506f Tejun Heo 2026-03-03  5887  	kthread_queue_work(READ_ONCE(helper), &cmd.work);
b06ccbabe2506f Tejun Heo 2026-03-03  5888  	kthread_flush_work(&cmd.work);
b06ccbabe2506f Tejun Heo 2026-03-03  5889  	return cmd.ret;
f0e1a0643a59bf Tejun Heo 2024-06-18  5890  }
f0e1a0643a59bf Tejun Heo 2024-06-18  5891  

:::::: The code at line 5884 was first introduced by commit
:::::: dbd542a8fac7bcfba91e353f2a522e1bf2fbee27 sched_ext: Reorganize enable/disable path for multi-scheduler support

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
