Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA36FA2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 05:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHgXIdJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702878244; x=1734414244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/nvTn6QU2JS8rwN657YhPE0VHmwHMoWeT+sjxILZFA=;
  b=BHgXIdJgjbf7nPDW/qlqBWd2Nk/tefhY8JL2hv4E7ZkNnLd5HlEDs2bH
   e94v/KzHmCN0Yvw5MSnd+svOnEJUc0pJqQ6kf9lS6kodaNxSdwGA7TOzW
   w/rmJeyiFUKyN/ZG+S4mnE8TVRXZVgHFDK6J4z3zCDY9X6vZlaHrwx66t
   m1IDiFxo41GN1cnPz/S8NCjforK6+hf2b8hZ+p/U5IObURthuXxqzi8B2
   u+WJXHsOVagnJ40tuP6MjQevQjt130dHg4kYdv6ILDv8+3/jSrTYCBWcz
   2QA8zSCrgsPRLlIVdCxZ67MFF92iP5dXwNMjxHLEWmP1M/NuouyzMjR0Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8903691"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="8903691"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 21:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="725185251"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="725185251"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Dec 2023 21:44:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF6Q2-0003oK-2j;
	Mon, 18 Dec 2023 05:43:58 +0000
Date: Mon, 18 Dec 2023 13:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 23/58]
 drivers/gpu/drm/lima/lima_ctx.c:30:13: error: implicit declaration of
 function 'task_pid_nr'
Message-ID: <202312181339.RNwQDu6C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   eec52e75ee3833d03432749e190443f7c86301c8
commit: 397f28a72a81a4b81b801d65273a979c3cd36b4b [23/58] sched.h: move pid helpers to pid.h
config: i386-buildonly-randconfig-004-20231218 (https://download.01.org/0day-ci/archive/20231218/202312181339.RNwQDu6C-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181339.RNwQDu6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181339.RNwQDu6C-lkp@intel.com/

Note: the bcachefs/header_cleanup HEAD eec52e75ee3833d03432749e190443f7c86301c8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_create':
>> drivers/gpu/drm/lima/lima_ctx.c:30:13: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
      30 |  ctx->pid = task_pid_nr(current);
         |             ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/task_pid_nr +30 drivers/gpu/drm/lima/lima_ctx.c

a1d2a6339961efc Qiang Yu    2019-03-09   8  
a1d2a6339961efc Qiang Yu    2019-03-09   9  int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
a1d2a6339961efc Qiang Yu    2019-03-09  10  {
a1d2a6339961efc Qiang Yu    2019-03-09  11  	struct lima_ctx *ctx;
a1d2a6339961efc Qiang Yu    2019-03-09  12  	int i, err;
a1d2a6339961efc Qiang Yu    2019-03-09  13  
a1d2a6339961efc Qiang Yu    2019-03-09  14  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
a1d2a6339961efc Qiang Yu    2019-03-09  15  	if (!ctx)
a1d2a6339961efc Qiang Yu    2019-03-09  16  		return -ENOMEM;
a1d2a6339961efc Qiang Yu    2019-03-09  17  	ctx->dev = dev;
a1d2a6339961efc Qiang Yu    2019-03-09  18  	kref_init(&ctx->refcnt);
a1d2a6339961efc Qiang Yu    2019-03-09  19  
a1d2a6339961efc Qiang Yu    2019-03-09  20  	for (i = 0; i < lima_pipe_num; i++) {
a1d2a6339961efc Qiang Yu    2019-03-09  21  		err = lima_sched_context_init(dev->pipe + i, ctx->context + i, &ctx->guilty);
a1d2a6339961efc Qiang Yu    2019-03-09  22  		if (err)
a1d2a6339961efc Qiang Yu    2019-03-09  23  			goto err_out0;
a1d2a6339961efc Qiang Yu    2019-03-09  24  	}
a1d2a6339961efc Qiang Yu    2019-03-09  25  
14d2bd53a47a7e1 Dave Airlie 2019-04-05  26  	err = xa_alloc(&mgr->handles, id, ctx, xa_limit_32b, GFP_KERNEL);
a1d2a6339961efc Qiang Yu    2019-03-09  27  	if (err < 0)
a1d2a6339961efc Qiang Yu    2019-03-09  28  		goto err_out0;
a1d2a6339961efc Qiang Yu    2019-03-09  29  
6ebd24b6bf106d3 Qiang Yu    2020-02-22 @30  	ctx->pid = task_pid_nr(current);
6ebd24b6bf106d3 Qiang Yu    2020-02-22  31  	get_task_comm(ctx->pname, current);
6ebd24b6bf106d3 Qiang Yu    2020-02-22  32  
a1d2a6339961efc Qiang Yu    2019-03-09  33  	return 0;
a1d2a6339961efc Qiang Yu    2019-03-09  34  
a1d2a6339961efc Qiang Yu    2019-03-09  35  err_out0:
a1d2a6339961efc Qiang Yu    2019-03-09  36  	for (i--; i >= 0; i--)
a1d2a6339961efc Qiang Yu    2019-03-09  37  		lima_sched_context_fini(dev->pipe + i, ctx->context + i);
a1d2a6339961efc Qiang Yu    2019-03-09  38  	kfree(ctx);
a1d2a6339961efc Qiang Yu    2019-03-09  39  	return err;
a1d2a6339961efc Qiang Yu    2019-03-09  40  }
a1d2a6339961efc Qiang Yu    2019-03-09  41  

:::::: The code at line 30 was first introduced by commit
:::::: 6ebd24b6bf106d3195bdbfeaa1ac77571e3dc670 drm/lima: save process info for debug usage

:::::: TO: Qiang Yu <yuq825@gmail.com>
:::::: CC: Qiang Yu <yuq825@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
