Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656E23546D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136069; cv=none; b=UxUHoOI5NMtAat15vipUEvoDIMDUedhJe2WQse5yCMYSAYnVFRuVztlKSPNE0QVzx0GEIa68X/rOsFZsqYyJcrEoFWPYUadzExPpgIUGoWqW7WdhJF9uVY9wy1lPdk8yySpsTPf7Xs8LJAOxto4m6PaMMtROaErJgXHDrbA0zug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136069; c=relaxed/simple;
	bh=IzVFBz2ouinBgxQKOFDaebe4iVmMu6/JxigZLaZVRSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q8ggcxgIlZrW+Sv8ZzVpCUpgNeD93LMgUbbN1g1z04uPJ5GZjXQctS4y+AnVMeqAxJ84CKZaHOSqsozD7Sq6nXoNNaOHQSR0OxM/yBQnd0UFA/w/5jtyM5wg9C8hJNmZRN8paw7a5ZSIzf8phHDWZwqFMAfTHq4WybwHYYxDyoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8R8IB7P; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8R8IB7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785136068; x=1816672068;
  h=date:from:to:cc:subject:message-id;
  bh=IzVFBz2ouinBgxQKOFDaebe4iVmMu6/JxigZLaZVRSc=;
  b=E8R8IB7P+7qMQRfzgFO9Wsyx5s9k4OYbiMG/6albvf6nguiLqDXhXpgi
   xI6/9nlbsfkUur4lhusrFw7GCHmWmQdbvC2i1qLaxAssce3VwpDJPS6vj
   0o/Q7BypV6JnTcvUz2ylAXLCO+05yXr00My7mBA8v+IO7exALobHmYCzs
   I0JnM3JPN3eeEpHKcYpMqHqQ4i0eJ4Q3a9TeBBkYS+oXySOPOMiwJcotS
   VBeV77rze22lPiBvYdzevYT83b8qe/bZkDF28Ls/c+4UjoYz8Slk73RN4
   QDyxAjsNSV8QioGtu9rU72K/uV1JPsfV1BbS6O7lAj4IjQzrqS21lIv+L
   w==;
X-CSE-ConnectionGUID: 8ndI++7lRouX/nM6P2PHyA==
X-CSE-MsgGUID: xAzL10cxRfiZY0LnY19Y6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="84821224"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="84821224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 00:07:47 -0700
X-CSE-ConnectionGUID: POO6o9d/QqOcrdekChJwFg==
X-CSE-MsgGUID: PYSsKsKTQ0qkQ4jfv/E3xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="259400272"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Jul 2026 00:07:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woFR5-00000000d22-0Ol8;
	Mon, 27 Jul 2026 07:07:42 +0000
Date: Mon, 27 Jul 2026 15:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext/ext.c:7890 scx_enable() warn: inconsistent
 indenting
Message-ID: <202607271419.z9wpaqdd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tejun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: bba2c3615bd6cfee7456d1130f2e6b01b3f4e9ba sched_ext: Move sources under kernel/sched/ext/
date:   5 weeks ago
config: parisc-randconfig-r073-20260727 (https://download.01.org/0day-ci/archive/20260727/202607271419.z9wpaqdd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bba2c3615bd6 ("sched_ext: Move sources under kernel/sched/ext/")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607271419.z9wpaqdd-lkp@intel.com/

smatch warnings:
kernel/sched/ext/ext.c:7890 scx_enable() warn: inconsistent indenting

vim +7890 kernel/sched/ext/ext.c

ebeca1f930eac8f kernel/sched/ext.c Tejun Heo    2026-03-06  7859  
c97ce728bcc43ad kernel/sched/ext.c Tejun Heo    2026-04-29  7860  static s32 scx_enable(struct scx_enable_cmd *cmd, struct bpf_link *link)
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7861  {
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7862  	static struct kthread_worker *helper;
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7863  	static DEFINE_MUTEX(helper_mutex);
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7864  
6ae315d37924435 kernel/sched/ext.c Andrea Righi 2026-05-13  7865  	if (housekeeping_enabled(HK_TYPE_DOMAIN_BOOT)) {
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7866  		pr_err("sched_ext: Not compatible with \"isolcpus=\" domain isolation\n");
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7867  		return -EINVAL;
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7868  	}
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7869  
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7870  	if (!READ_ONCE(helper)) {
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7871  		mutex_lock(&helper_mutex);
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7872  		if (!helper) {
2fcfe5951eb2e84 kernel/sched/ext.c zhidao su    2026-03-09  7873  			struct kthread_worker *w =
2fcfe5951eb2e84 kernel/sched/ext.c zhidao su    2026-03-09  7874  				kthread_run_worker(0, "scx_enable_helper");
2fcfe5951eb2e84 kernel/sched/ext.c zhidao su    2026-03-09  7875  			if (IS_ERR_OR_NULL(w)) {
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7876  				mutex_unlock(&helper_mutex);
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7877  				return -ENOMEM;
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7878  			}
2fcfe5951eb2e84 kernel/sched/ext.c zhidao su    2026-03-09  7879  			sched_set_fifo(w->task);
2fcfe5951eb2e84 kernel/sched/ext.c zhidao su    2026-03-09  7880  			WRITE_ONCE(helper, w);
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7881  		}
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7882  		mutex_unlock(&helper_mutex);
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7883  	}
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7884  
ebeca1f930eac8f kernel/sched/ext.c Tejun Heo    2026-03-06  7885  #ifdef CONFIG_EXT_SUB_SCHED
c97ce728bcc43ad kernel/sched/ext.c Tejun Heo    2026-04-29  7886  	if (cmd->ops->sub_cgroup_id > 1)
c97ce728bcc43ad kernel/sched/ext.c Tejun Heo    2026-04-29  7887  		kthread_init_work(&cmd->work, scx_sub_enable_workfn);
ebeca1f930eac8f kernel/sched/ext.c Tejun Heo    2026-03-06  7888  	else
ebeca1f930eac8f kernel/sched/ext.c Tejun Heo    2026-03-06  7889  #endif	/* CONFIG_EXT_SUB_SCHED */
c97ce728bcc43ad kernel/sched/ext.c Tejun Heo    2026-04-29 @7890  		kthread_init_work(&cmd->work, scx_root_enable_workfn);
b06ccbabe2506fd kernel/sched/ext.c Tejun Heo    2026-03-03  7891  
c97ce728bcc43ad kernel/sched/ext.c Tejun Heo    2026-04-29  7892  	kthread_queue_work(READ_ONCE(helper), &cmd->work);
c97ce728bcc43ad kernel/sched/ext.c Tejun Heo    2026-04-29  7893  	kthread_flush_work(&cmd->work);
c97ce728bcc43ad kernel/sched/ext.c Tejun Heo    2026-04-29  7894  	return cmd->ret;
f0e1a0643a59bf1 kernel/sched/ext.c Tejun Heo    2024-06-18  7895  }
f0e1a0643a59bf1 kernel/sched/ext.c Tejun Heo    2024-06-18  7896  

:::::: The code at line 7890 was first introduced by commit
:::::: c97ce728bcc43adcc861375f48433ac7adfd4e2e sched_ext: Make scx_enable() take scx_enable_cmd

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
