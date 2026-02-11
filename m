Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E638128725B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 07:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770796342; cv=none; b=sO5A5Fdm285p8aT87YKOMb7//Wx1RPHVV3tElkBTbOpGc5ww91/zTuJHh1SJyKMULCKpD864Z2WQFW9EOIEOqEl3KWQALig5g89IzrABFt875tPUMIkkpJOsOHSsLwNJSXZNcrJLHCfAWtj8xGYmk3CLXI/FExiHww1li7iFpJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770796342; c=relaxed/simple;
	bh=ZahawXdD0lbJk75fg1V9rXa1M47nNykkGGfkbL/T7p8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o8G7Unlb8ytWisr/dSkDjdS46q0Ii3xO/Uz/rEq02UIrjpGJ394M7cnWnISMsmSwrciQ9MNecc5rCKkGs0QjmhFrEYuCE9LXPp+/8oWlVJLrMqp0N7sceYzA0JRwOvx0HYf6r+D4l51huMtOmDpPMi+2RJnbmcqen1FhY/1abPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aX3rlXGl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aX3rlXGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770796341; x=1802332341;
  h=date:from:to:cc:subject:message-id;
  bh=ZahawXdD0lbJk75fg1V9rXa1M47nNykkGGfkbL/T7p8=;
  b=aX3rlXGlWZd32oH8LlKbY15A378vOGA9duJGnAEuTTCATd+9MAAud0t6
   1CqHTx4e9liuw3L5clpEY96OvwfLPfB62IoTiE5Jyio7QJBPxuS4MM6n5
   FRN3ICOB4FWeKXfhUweHyRdjIWKlbRC+iyjuY/jmohqyOliuiNsAGkKL1
   muXZ0w0T+IURa0eia1ghp4MOOSqxJfh5xNrrXFh+taEAMTUeMw/7ytz78
   7uSFq2RjXtol3WhENYbtYfprvp2Goq7r68H+nEy9zdhnQHP9xBJzU/Mtx
   xBgstSAG4gJFkthQ31HEQYMo4lPQAiX+B0WXxnn6cXjc7zBYVdl7Pt8IQ
   w==;
X-CSE-ConnectionGUID: wiFi29u2SDa573Jh2LG4dg==
X-CSE-MsgGUID: bEQf6BxgRluker/dVv+1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71840481"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71840481"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 23:52:21 -0800
X-CSE-ConnectionGUID: DT3Gq8oURHiwWQPdu0YhVQ==
X-CSE-MsgGUID: XygKQo9OQbuLC1oNnrBgNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212260871"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2026 23:52:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq51F-00000000pna-0fwn;
	Wed, 11 Feb 2026 07:52:17 +0000
Date: Wed, 11 Feb 2026 15:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 10/14] fs/proc/root.c:340:41: error:
 incomplete definition of type 'struct container'
Message-ID: <202602111518.6xepFJ52-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   ac4ec62cd4decf787406c1407f18ade110d80c5a
commit: eae87346ef7094984596a12c9096148d3989c983 [10/14] containers: Make fsopen() able to create a superblock in a container
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260211/202602111518.6xepFJ52-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111518.6xepFJ52-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111518.6xepFJ52-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/root.c:340:41: error: incomplete definition of type 'struct container'
     340 |                 ctx->pid_ns = get_pid_ns(fc->container->pid_ns);
         |                                          ~~~~~~~~~~~~~^
   include/linux/sched.h:65:8: note: forward declaration of 'struct container'
      65 | struct container;
         |        ^
   1 error generated.


vim +340 fs/proc/root.c

   330	
   331	static int proc_init_fs_context(struct fs_context *fc)
   332	{
   333		struct proc_fs_context *ctx;
   334	
   335		ctx = kzalloc(sizeof(struct proc_fs_context), GFP_KERNEL);
   336		if (!ctx)
   337			return -ENOMEM;
   338	
   339		if (fc->container)
 > 340			ctx->pid_ns = get_pid_ns(fc->container->pid_ns);
   341		else
   342			ctx->pid_ns = get_pid_ns(task_active_pid_ns(current));
   343	
   344		put_user_ns(fc->user_ns);
   345		fc->user_ns = get_user_ns(ctx->pid_ns->user_ns);
   346		fc->fs_private = ctx;
   347		fc->ops = &proc_fs_context_ops;
   348		return 0;
   349	}
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
