Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565B1EEE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 20:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764104299; cv=none; b=Rhv0l/0NqOr/pygyCBxL2rV7K8DWu5KqiVX0TckssQ9n1eIGwxOPNJSrjub1iGrpvvWjpqpEPa6S/BYnnIdnd4HLs9BpyiJLMQ6kPzAaW73HevkAkL6eB1T5lXdLBkPfCwaOrzoAB9pjKc6gfO6SeDF1rERuro/yt0+dz6sW7MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764104299; c=relaxed/simple;
	bh=3NWmkx1+T3fUDodK+Wf9qEVKdpsti1i4GWOmzk2eDnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/EuVMxccIALi3b+1500XKChQqbAtZoOWKu8jrf8rTxlTRoRJdfqSXdHyHwH+czvDS+6h6RUnPOAEvMetHJk0hJjM33a/CX2HdBmz0PVXJQoTArceRTW5laS+NCBGUAI3WjzkmJgXsj6MIZn3z0MNUPrZX4kiDyq1SEN4hy+rb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ou2upIQ/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ou2upIQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764104297; x=1795640297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3NWmkx1+T3fUDodK+Wf9qEVKdpsti1i4GWOmzk2eDnk=;
  b=Ou2upIQ/WFFjA/1UqcOYoh/koKWHwDAnnPnIWAkz9s9+UpiPLHkgyKXq
   i97ASJZUGae1au0PGGxE0pTNlcfAvoNUGMnQKRELtgVCxxWlOHpww6pHU
   CNPre1n6FqMVtRf/W3TUGKF9K+xRDWx/qe6NPsfu+Xv6ZZmaEb3j3Jk7l
   ++O+RV45ExyBeSCwVfIkRhm/fReyPAXw9ISfRCEab6YEowqnbWJ0egmi8
   8n4D6jxHu8CYK01IwAW/EqnnpXHUm3NyTHp6NDHg+z6TymN8OqpNojvzg
   MkWrFtx0NWbmH12Axakfg45ecmFlY7hgw3/NEKISGc1KKvH8+uYqb2WwH
   Q==;
X-CSE-ConnectionGUID: 8JrS9WG7Tpa96YFaEokadQ==
X-CSE-MsgGUID: +GUGbvbuTrOp09A7L56DuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83524431"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="83524431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 12:58:17 -0800
X-CSE-ConnectionGUID: Nun3fBI7SsSOy0dKqcQNXg==
X-CSE-MsgGUID: EyK591yQTR2NAiHmhUpGag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="216103518"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2025 12:58:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO073-000000002Fv-13Vx;
	Tue, 25 Nov 2025 20:58:13 +0000
Date: Wed, 26 Nov 2025 04:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3316/3316] kernel/xsched/cgroup.c:368:6: warning:
 no previous prototype for 'xcu_move_task'
Message-ID: <202511260440.XtGIX1Qz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0fa9557473e665984ed5e97515969035324b2ec5
commit: 43bbefc53356009d3603faa2c6e6a2858f724e4d [3316/3316] xsched: Add XCU control group implementation and its backend in xsched CFS
config: x86_64-buildonly-randconfig-002-20251125 (https://download.01.org/0day-ci/archive/20251126/202511260440.XtGIX1Qz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260440.XtGIX1Qz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260440.XtGIX1Qz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/xsched/cgroup.c:368:6: warning: no previous prototype for 'xcu_move_task' [-Wmissing-prototypes]
     368 | void xcu_move_task(struct task_struct *task, struct xsched_group *old_xcg,
         |      ^~~~~~~~~~~~~
--
   kernel/xsched/cfs.c:56: warning: Function parameter or member 'xse_cfs' not described in 'xs_cfs_rq_update'
   kernel/xsched/cfs.c:56: warning: Function parameter or member 'new_xrt' not described in 'xs_cfs_rq_update'
>> kernel/xsched/cfs.c:103: warning: Function parameter or member 'xg' not described in 'xg_update'
>> kernel/xsched/cfs.c:103: warning: Function parameter or member 'task_delta' not described in 'xg_update'
>> kernel/xsched/cfs.c:103: warning: Excess function parameter 'gxcu' description in 'xg_update'
--
>> kernel/xsched/cgroup.c:46: warning: Cannot understand  * @brief Initialize the core components of an xsched_group.
    on line 46 - I thought it was a doc line


vim +/xcu_move_task +368 kernel/xsched/cgroup.c

   367	
 > 368	void xcu_move_task(struct task_struct *task, struct xsched_group *old_xcg,
   369				struct xsched_group *new_xcg)
   370	{
   371		struct xsched_entity *xse, *tmp;
   372		struct xsched_cu *xcu;
   373	
   374		spin_lock(&old_xcg->lock);
   375		list_for_each_entry_safe(xse, tmp, &old_xcg->members, group_node) {
   376			if (xse->owner_pid != task_pid_nr(task))
   377				continue;
   378	
   379			xcu = xse->xcu;
   380	
   381			if (old_xcg != xse->parent_grp) {
   382				WARN_ON(old_xcg != xse->parent_grp);
   383				return;
   384			}
   385	
   386			/* delete from the old_xcg */
   387			list_del(&xse->group_node);
   388	
   389			mutex_lock(&xcu->xcu_lock);
   390			/* dequeue from the current runqueue */
   391			dequeue_ctx(xse, xcu);
   392			/* attach to the new_xcg */
   393			xsched_group_xse_attach(new_xcg, xse);
   394			/* enqueue to the runqueue in new_xcg */
   395			enqueue_ctx(xse, xcu);
   396			mutex_unlock(&xcu->xcu_lock);
   397		}
   398		spin_unlock(&old_xcg->lock);
   399	}
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
