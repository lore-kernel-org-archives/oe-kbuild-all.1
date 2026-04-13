Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928C1313E15
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 22:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776120762; cv=none; b=a6e2OdHjSegOSeNHhNSYrBkQcC85ExTweQPPdq4lC0QM/GTCtkSguy8FgloNHX6NNjFPYGFG23rZnxCPlEyL04c67SKRx70k9Y4aG380gEKSVvG9RwQHlZtFQFLFbAwdxo7SIS2IeoLc5lDPoxNee0q2xaWIjrVF8HmHMyCFUmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776120762; c=relaxed/simple;
	bh=cKbltWg1jga4Yl5GgW7kNioIeDm9WVOb6BCNxixij4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncBqkEJqZlS+jKFjhIXm0VlTLf49VbwBAyQ/NnGhrngKhmU15sP/23JYl546zdpE22TD8t5GyE7XS5DX4fAHIDQJN9l/dnFrzqcpoXKTGsAxeUyuy2zeOZ5VqAD4nfpWnDEe3f6ZKSW3/g6kP8JHcXfVuJ8h7rVXzaUl/Nqhq/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSeL6TZR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSeL6TZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776120760; x=1807656760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cKbltWg1jga4Yl5GgW7kNioIeDm9WVOb6BCNxixij4A=;
  b=ZSeL6TZRrC6lYKyiJgYhf2mfww3FhuF5xZeafWCAf58IgJn6z+DLP72B
   SRqQLAqX5UVSGP8pmOS95DSxbQWDh4vUvIhKj+A/oDvCKWjf6+lz1ZE54
   mohiAgJq/x/ucSvTiHrWfuFWl60857TbU610wiDUAXW8zpIoTw5gT1FKP
   nGsdzaTX8UqkzHU4JXiv2WU4bo6VzAwHNx27bodh7kg8SPuHd8hBWf4GS
   hOuISWn6qLBa9t6/y5M1TJmVUxwtg+dE0M8HY8AOATVa47pjdSKI1CwYF
   dBWmx0yMHZEISD/8PidqgWGv8rHXadO0HRD786sUXodV+cjqBe4URfVBa
   A==;
X-CSE-ConnectionGUID: gYLxAdf1RcK0Oe23O4ZbKQ==
X-CSE-MsgGUID: Wu33ShC5TAitvglt+N/6GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76946864"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="76946864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 15:52:40 -0700
X-CSE-ConnectionGUID: 7d84IPBMQOOtgjSNxMJHnA==
X-CSE-MsgGUID: ERt7o8jSTOKiv249XO6BjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="229856290"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Apr 2026 15:52:39 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCQ8y-000000000vh-3p9L;
	Mon, 13 Apr 2026 22:52:36 +0000
Date: Tue, 14 Apr 2026 06:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] netlink: Add Netlink process event for cgroup
 migration
Message-ID: <202604140633.6zMiph03-lkp@intel.com>
References: <20260407172339.2017158-2-prakash.sangappa@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407172339.2017158-2-prakash.sangappa@oracle.com>

Hi Prakash,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on net/main net-next/main linus/master v7.0 next-20260413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prakash-Sangappa/netlink-Add-Netlink-process-event-for-cgroup-migration/20260413-212045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
patch link:    https://lore.kernel.org/r/20260407172339.2017158-2-prakash.sangappa%40oracle.com
patch subject: [RFC PATCH 1/1] netlink: Add Netlink process event for cgroup migration
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260414/202604140633.6zMiph03-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140633.6zMiph03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140633.6zMiph03-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cgroup.c: In function 'cgroup_attach_task':
>> kernel/cgroup/cgroup.c:2985:17: error: implicit declaration of function 'proc_cgroup_migrate_connector'; did you mean 'proc_cgrp_migrate_connector'? [-Wimplicit-function-declaration]
    2985 |                 proc_cgroup_migrate_connector(leader, dst_cgrp);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 proc_cgrp_migrate_connector
--
   kernel/cgroup/cgroup-v1.c: In function 'cgroup_transfer_tasks':
>> kernel/cgroup/cgroup-v1.c:153:33: error: implicit declaration of function 'proc_cgroup_migrate_connector'; did you mean 'proc_cgrp_migrate_connector'? [-Wimplicit-function-declaration]
     153 |                                 proc_cgroup_migrate_connector(task, to);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 proc_cgrp_migrate_connector


vim +2985 kernel/cgroup/cgroup.c

  2951	
  2952	/**
  2953	 * cgroup_attach_task - attach a task or a whole threadgroup to a cgroup
  2954	 * @dst_cgrp: the cgroup to attach to
  2955	 * @leader: the task or the leader of the threadgroup to be attached
  2956	 * @threadgroup: attach the whole threadgroup?
  2957	 *
  2958	 * Call holding cgroup_mutex and cgroup_threadgroup_rwsem.
  2959	 */
  2960	int cgroup_attach_task(struct cgroup *dst_cgrp, struct task_struct *leader,
  2961			       bool threadgroup)
  2962	{
  2963		DEFINE_CGROUP_MGCTX(mgctx);
  2964		struct task_struct *task;
  2965		int ret = 0;
  2966	
  2967		/* look up all src csets */
  2968		spin_lock_irq(&css_set_lock);
  2969		task = leader;
  2970		do {
  2971			cgroup_migrate_add_src(task_css_set(task), dst_cgrp, &mgctx);
  2972			if (!threadgroup)
  2973				break;
  2974		} while_each_thread(leader, task);
  2975		spin_unlock_irq(&css_set_lock);
  2976	
  2977		/* prepare dst csets and commit */
  2978		ret = cgroup_migrate_prepare_dst(&mgctx);
  2979		if (!ret)
  2980			ret = cgroup_migrate(leader, threadgroup, &mgctx);
  2981	
  2982		cgroup_migrate_finish(&mgctx);
  2983	
  2984		if (!ret) {
> 2985			proc_cgroup_migrate_connector(leader, dst_cgrp);
  2986			TRACE_CGROUP_PATH(attach_task, dst_cgrp, leader, threadgroup);
  2987		}
  2988	
  2989		return ret;
  2990	}
  2991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
