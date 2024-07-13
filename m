Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584FB14006
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 04:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720844586; cv=none; b=apOe0jBOUbdEhqTdVUNvtHbrnFYt2ioF/bXWyzWDUc+mQF1fcSIbVks71a24mUti3XoE9hVDkPluFJYhS2MC13jJVcMAmm5UICCULXZeSGJ/SBFyKo61lpy+PK5F0YdxsX99w+3XUg68AEk85jTL+qPqVmloE7jrqd5cRNZtPik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720844586; c=relaxed/simple;
	bh=pV8ppZzjvzOsyDdvokWcIrEvAgerPAnuu+oSUGQTsfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAOgE4Xa7a1iIksiFbUBBzZAX1SGdn3MKAqlamoQtmNfyMSTvJdjIIq8Fkms4wHIUz7ZCP9HCzwxtjbd4hp6SLMZFvv3GYf/1QMpJzr+v5NwyhyjD+8tSPSV3wV/XVNYKkjoSqHzzf5JXv/L2TZenaLyNzz9f4FCqerun+FtNkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7GeQyyJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7GeQyyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720844584; x=1752380584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pV8ppZzjvzOsyDdvokWcIrEvAgerPAnuu+oSUGQTsfk=;
  b=Q7GeQyyJcIDO1h8Xg+QL66BNVTRSRTmQfyVfzhWf6f5wZm9LRnawaXRE
   uwRZwyQarCfbvpyma0uCzUcFWuZh2RPKS3SWP1zZ19GODXOYtEZwsCGHc
   7NOILQDLUQc9S92PNLOPvZIoS1KJvGxax4tvRG2upYOJDaX5BOdFBZhk9
   6pogxYuj7gI0a0VW4iJ0KOFLo32AfNZKvmNnGFu+Qr8U5FdfROD207jQg
   5+tVuKmZ4j4hohd21VPSbuRr/M6qSybpAX89t38fszGjEMrhCL/RmuUTi
   UDpYLeEu+XQR5f4m8EV7NhKt8YzKG4fpfONXDH+cS26V0Y7xiGjqGoPxW
   Q==;
X-CSE-ConnectionGUID: BK/poyzUQyWJrzwWkT31Iw==
X-CSE-MsgGUID: TNGB/e5+T76+MFTmzUgZWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28975378"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="28975378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 21:23:04 -0700
X-CSE-ConnectionGUID: dO7jahMKTNWUmx767zjRqQ==
X-CSE-MsgGUID: 4EYzoWZ5Rlqn3I6y2NXRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="53932674"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Jul 2024 21:23:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSUHk-000bgc-1M;
	Sat, 13 Jul 2024 04:23:00 +0000
Date: Sat, 13 Jul 2024 12:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 03/10] task_work, sched: Add a _locked variant to
 task_work_cancel()
Message-ID: <202407131249.3Xkpbz1S-lkp@intel.com>
References: <20240711130004.2157737-4-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711130004.2157737-4-vschneid@redhat.com>

Hi Valentin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on paulmck-rcu/dev tip/master linus/master v6.10-rc7 next-20240712]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/rcuwait-Split-type-definition-to-its-own-header/20240711-225336
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240711130004.2157737-4-vschneid%40redhat.com
patch subject: [RFC PATCH v3 03/10] task_work, sched: Add a _locked variant to task_work_cancel()
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240713/202407131249.3Xkpbz1S-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131249.3Xkpbz1S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407131249.3Xkpbz1S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/task_work.c:167: warning: expecting prototype for task_work_cancel(). Prototype was for task_work_cancel_locked() instead


vim +167 kernel/task_work.c

   153	
   154	/**
   155	 * task_work_cancel - cancel a pending work added by task_work_add()
   156	 * @task: the task which should execute the work
   157	 * @func: identifies the work to remove
   158	 *
   159	 * Find the last queued pending work with ->func == @func and remove
   160	 * it from queue.
   161	 *
   162	 * RETURNS:
   163	 * The found work or NULL if not found.
   164	 */
   165	struct callback_head *
   166	task_work_cancel_locked(struct task_struct *task, task_work_func_t func)
 > 167	{
   168		lockdep_assert_held(&task->pi_lock);
   169	
   170		if (likely(!task_work_pending(task)))
   171			return NULL;
   172	
   173		return task_work_cancel_match_locked(task, task_work_func_match, func);
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
