Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4508C09
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 18:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680200471; x=1711736471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nL2ksJzXJR/zjVqj9+UV60Nicmdrz0S6Gzc76JEEmpQ=;
  b=cNVzG5iB1+w1fkyAVtEtFdu4xwn98DBIyIebPdtFpN6P6RtJIAGndLcj
   HsDFhhbSRYoeVtgE0qM4I2nBgrZwuVExGY8tAhNe3BdSURUtJ4/dpO8KS
   WmnjhNxxD8INNmCdJpy9ee5NBcBLtmYqvi7ngQEnNeQ3sS+fdQx9eqMla
   sgopPisGpxq2ZEFAEJFqM4gLJk8ig9iU5XrKpN3ZaknqGktFw78x2OJ7r
   TEXcU5hxvbTMnh89K65lzle6q9caP/8PahOwj7RBB6vqQK0WSuBf1CADw
   aAwTKYwNmz0atY6rBJoaZGX3zPPy0+0lQpvjFegrPt/+x/nNw9vzBMnvf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="341267282"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="341267282"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 11:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="859010421"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="859010421"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Mar 2023 11:21:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phwtU-000L54-0b;
	Thu, 30 Mar 2023 18:21:04 +0000
Date: Fri, 31 Mar 2023 02:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:optimise-rsrc-update 10/17] io_uring/io_uring.c:1119:13:
 warning: no previous prototype for 'io_free_req_tw'
Message-ID: <202303310249.Serj911C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux optimise-rsrc-update
head:   d4c9d4791c934fb40e17c69529de78afe241cd6b
commit: 80b814f83c1030a35052e02e313109e9c9167ea8 [10/17] io_uring: io_free_req() via tw
config: nios2-randconfig-r015-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310249.Serj911C-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/isilence/linux/commit/80b814f83c1030a35052e02e313109e9c9167ea8
        git remote add isilence https://github.com/isilence/linux
        git fetch --no-tags isilence optimise-rsrc-update
        git checkout 80b814f83c1030a35052e02e313109e9c9167ea8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310249.Serj911C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.c:1119:13: warning: no previous prototype for 'io_free_req_tw' [-Wmissing-prototypes]
    1119 | __cold void io_free_req_tw(struct io_kiocb *req, struct io_tw_state *ts)
         |             ^~~~~~~~~~~~~~


vim +/io_free_req_tw +1119 io_uring/io_uring.c

  1118	
> 1119	__cold void io_free_req_tw(struct io_kiocb *req, struct io_tw_state *ts)
  1120	{
  1121		struct io_ring_ctx *ctx = req->ctx;
  1122	
  1123		io_put_rsrc_node(req->rsrc_node);
  1124		io_dismantle_req(req);
  1125		io_put_task_remote(req->task, 1);
  1126	
  1127		spin_lock(&ctx->completion_lock);
  1128		wq_list_add_head(&req->comp_list, &ctx->locked_free_list);
  1129		ctx->locked_free_nr++;
  1130		spin_unlock(&ctx->completion_lock);
  1131	}
  1132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
