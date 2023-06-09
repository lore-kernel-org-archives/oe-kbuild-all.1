Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FE7E2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 05:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686287240; x=1717823240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcZbod1UWmRrLt+GI4HQgYjBvX3UYPne0m6Sl22dsPc=;
  b=BvXgIroRIOOBjOAoPPsUFwK3LSWKY1tTcwURkGBNZQiTHTQOtsl4Kee4
   H7u4p9jAAJOabFmIFcD+uXj8Cn2VClY4ycRp36wRjg1hdnzjAXbUeAc7B
   zMfbqz7ZH/N7FsTTVOSHVRW/8S3plR0w5IWzA/q2OQoQIUxaYE/reyM3g
   hUaMvR/cM8AFh1Z3n8lCrWyyCf3AqEdhOIGVHIza9GlkYTCzhWjmYe+Kv
   wnnyhdJXr8TWKBb6v13dggfKOt+qefK4DWUoPPbVzYW3DFMeviBbN1N52
   gVcMp6mgfIxnrL8V/1cpzSenKhl3K9wbh1BCfqdmlK/vib866aeuPQ8PM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="347165596"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="347165596"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 22:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="710233881"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="710233881"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 22:07:18 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7ULG-0008fA-0Q;
	Fri, 09 Jun 2023 05:07:18 +0000
Date: Fri, 9 Jun 2023 13:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-futex 26/26] io_uring/cancel.c:152: undefined
 reference to `io_futex_cancel'
Message-ID: <202306091349.M1QIX9mb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-futex
head:   f5301ffdaa8000783b6ef63ea885349a48493bc1
commit: f5301ffdaa8000783b6ef63ea885349a48493bc1 [26/26] io_uring/futex: add support for cancelation
config: parisc-buildonly-randconfig-r005-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091349.M1QIX9mb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=f5301ffdaa8000783b6ef63ea885349a48493bc1
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block io_uring-futex
        git checkout f5301ffdaa8000783b6ef63ea885349a48493bc1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091349.M1QIX9mb-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: io_uring/cancel.o: in function `__io_async_cancel':
>> io_uring/cancel.c:152: undefined reference to `io_futex_cancel'


vim +152 io_uring/cancel.c

   130	
   131	static int __io_async_cancel(struct io_cancel_data *cd,
   132				     struct io_uring_task *tctx,
   133				     unsigned int issue_flags)
   134	{
   135		bool all = cd->flags & (IORING_ASYNC_CANCEL_ALL|IORING_ASYNC_CANCEL_ANY);
   136		struct io_ring_ctx *ctx = cd->ctx;
   137		struct io_tctx_node *node;
   138		int ret, nr = 0;
   139	
   140		do {
   141			ret = io_try_cancel(tctx, cd, issue_flags);
   142			if (ret == -ENOENT)
   143				break;
   144			if (!all)
   145				return ret;
   146			nr++;
   147		} while (1);
   148	
   149		/* slow path, try all io-wq's */
   150		ret = -ENOENT;
   151		io_ring_submit_lock(ctx, issue_flags);
 > 152		ret = io_futex_cancel(ctx, cd);
   153		if (ret != -ENOENT)
   154			goto out;
   155	
   156		list_for_each_entry(node, &ctx->tctx_list, ctx_node) {
   157			struct io_uring_task *tctx = node->task->io_uring;
   158	
   159			ret = io_async_cancel_one(tctx, cd);
   160			if (ret != -ENOENT) {
   161				if (!all)
   162					break;
   163				nr++;
   164			}
   165		}
   166	out:
   167		io_ring_submit_unlock(ctx, issue_flags);
   168		return all ? nr : ret;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
