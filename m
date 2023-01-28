Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20572570
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 07:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674890063; x=1706426063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=atefpNtY17E9LVpYSxCv+VPF+1rEkRnr86d0kwCPXco=;
  b=ix76oqfg7Ty93X6NpvoBnP//Zh+FkXR49sp5UfFXbd4k4LFpkk53KPmZ
   8uZeXwQOxSXmBvcoIXl37DrEhllSSgm0ExnODjcWPfdAwJ/TsPpIMtNH1
   gsF4cD6vNuKnKYVVctKfqTytGoma/u1I9ZBoGVYbI/KJfyhRbe2dZOQeb
   RWjRMozrMfYDYku85qre7HIsMnuM9lGWZFh4ferB00pczo9mgQ07nFqAD
   ZPTdTavFnZxl7XP5wvL2E+Ou/G/tdXvmNNfabvlLWFEoYnF20NMYKWMEG
   butGDqe2mMkP1vXYGw27n3JIUv3Z3FVF5A5Pp/ZnvpeidMjFgC8DqyuQD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="389650129"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="389650129"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 23:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="837401950"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="837401950"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Jan 2023 23:14:21 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLfPo-0000TV-1b;
	Sat, 28 Jan 2023 07:14:20 +0000
Date: Sat, 28 Jan 2023 15:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: io_uring/io_uring.c:2932:40: error: variable 'prev' set but not used
Message-ID: <202301281505.Y1qiPCDf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5af6ce7049365952f7f023155234fe091693ead1
commit: ed29b0b4fd835b058ddd151c49d021e28d631ee6 io_uring: move to separate directory
date:   6 months ago
config: x86_64-sof-customedconfig-edison-defconfig (https://download.01.org/0day-ci/archive/20230128/202301281505.Y1qiPCDf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ed29b0b4fd835b058ddd151c49d021e28d631ee6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ed29b0b4fd835b058ddd151c49d021e28d631ee6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   io_uring/io_uring.c: In function '__io_submit_flush_completions':
>> io_uring/io_uring.c:2932:40: error: variable 'prev' set but not used [-Werror=unused-but-set-variable]
    2932 |         struct io_wq_work_node *node, *prev;
         |                                        ^~~~
   cc1: all warnings being treated as errors


vim +/prev +2932 io_uring/io_uring.c

7a743e225b2a9da fs/io_uring.c Pavel Begunkov 2020-03-03  2928  
c450178d9be9dc4 fs/io_uring.c Pavel Begunkov 2021-09-08  2929  static void __io_submit_flush_completions(struct io_ring_ctx *ctx)
a141dd896f544df fs/io_uring.c Jens Axboe     2021-08-12  2930  	__must_hold(&ctx->uring_lock)
905c172f32c56f0 fs/io_uring.c Pavel Begunkov 2021-02-10  2931  {
6f33b0bc4ea43f5 fs/io_uring.c Pavel Begunkov 2021-09-24 @2932  	struct io_wq_work_node *node, *prev;
cd0ca2e048dc0dd fs/io_uring.c Pavel Begunkov 2021-08-09  2933  	struct io_submit_state *state = &ctx->submit_state;
905c172f32c56f0 fs/io_uring.c Pavel Begunkov 2021-02-10  2934  
3d4aeb9f98058c3 fs/io_uring.c Pavel Begunkov 2021-11-10  2935  	if (state->flush_cqes) {
79ebeaee8a21a00 fs/io_uring.c Jens Axboe     2021-08-10  2936  		spin_lock(&ctx->completion_lock);
6f33b0bc4ea43f5 fs/io_uring.c Pavel Begunkov 2021-09-24  2937  		wq_list_for_each(node, prev, &state->compl_reqs) {
6f33b0bc4ea43f5 fs/io_uring.c Pavel Begunkov 2021-09-24  2938  			struct io_kiocb *req = container_of(node, struct io_kiocb,
6f33b0bc4ea43f5 fs/io_uring.c Pavel Begunkov 2021-09-24  2939  						    comp_list);
5182ed2e332e8e1 fs/io_uring.c Pavel Begunkov 2021-06-26  2940  
f43de1f88841d59 fs/io_uring.c Pavel Begunkov 2022-06-15  2941  			if (!(req->flags & REQ_F_CQE_SKIP))
91ef75a7db0d085 fs/io_uring.c Pavel Begunkov 2022-06-15  2942  				__io_fill_cqe_req(ctx, req);
905c172f32c56f0 fs/io_uring.c Pavel Begunkov 2021-02-10  2943  		}
3d4aeb9f98058c3 fs/io_uring.c Pavel Begunkov 2021-11-10  2944  
905c172f32c56f0 fs/io_uring.c Pavel Begunkov 2021-02-10  2945  		io_commit_cqring(ctx);
79ebeaee8a21a00 fs/io_uring.c Jens Axboe     2021-08-10  2946  		spin_unlock(&ctx->completion_lock);
905c172f32c56f0 fs/io_uring.c Pavel Begunkov 2021-02-10  2947  		io_cqring_ev_posted(ctx);
3d4aeb9f98058c3 fs/io_uring.c Pavel Begunkov 2021-11-10  2948  		state->flush_cqes = false;
3d4aeb9f98058c3 fs/io_uring.c Pavel Begunkov 2021-11-10  2949  	}
5182ed2e332e8e1 fs/io_uring.c Pavel Begunkov 2021-06-26  2950  
1cce17aca621c38 fs/io_uring.c Pavel Begunkov 2021-09-24  2951  	io_free_batch_list(ctx, state->compl_reqs.first);
6f33b0bc4ea43f5 fs/io_uring.c Pavel Begunkov 2021-09-24  2952  	INIT_WQ_LIST(&state->compl_reqs);
7a743e225b2a9da fs/io_uring.c Pavel Begunkov 2020-03-03  2953  }
7a743e225b2a9da fs/io_uring.c Pavel Begunkov 2020-03-03  2954  

:::::: The code at line 2932 was first introduced by commit
:::::: 6f33b0bc4ea43f5c5ce7b7c9ab66051f80837862 io_uring: use slist for completion batching

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
