Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A1F3C0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680123134; x=1711659134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hAdgpgL+20ReBXQs4M91OAUnF/BYP2CxZy8sD+KhEF4=;
  b=WTaTZWyaMwcaLX0f3aIWHb/wRdFbHUcuh+WjJnIDHkYCcuqEtiJY1JBc
   7SZOuzBVmlhRm92cEORlYy4KXGat1YxVKhQV8DRlzaMzmc/jbB6FyDtX8
   V3TLlFUPcoOcz2Stj4gsc98kVfWZiqY8ZCEJ1WIkBLLdvyG9xzzoHUOH7
   k0yoX7CjAd8VVLTaEvBgitMg83sjzSzGBh7+FhPKO2yAPRWpFvY5J77a1
   BFLNHJNJmLzPUpDRoT9oJQPV1EJ5yjifpDAsBNy9FcX3JhobsFexY7Wp7
   v8efJy3iHnoNvP+UlGjEupUnmB9OAm+exhKd+v5QIANlZMlZDMbIy0dhv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="324915828"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="324915828"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 13:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="634612524"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="634612524"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Mar 2023 13:52:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phcmC-000JwK-18;
	Wed, 29 Mar 2023 20:52:12 +0000
Date: Thu, 30 Mar 2023 04:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:optimise-rsrc-update 10/10] io_uring/rsrc.c:277:17: error:
 too many arguments to function 'io_put_rsrc_node'
Message-ID: <202303300455.IaikC7R2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux optimise-rsrc-update
head:   c9b1352d2a9473070aa6ab1a4c562dcec430aa1a
commit: c9b1352d2a9473070aa6ab1a4c562dcec430aa1a [10/10] io_uring/rsrc: protect node refs with uring_lock
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230330/202303300455.IaikC7R2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/isilence/linux/commit/c9b1352d2a9473070aa6ab1a4c562dcec430aa1a
        git remote add isilence https://github.com/isilence/linux
        git fetch --no-tags isilence optimise-rsrc-update
        git checkout c9b1352d2a9473070aa6ab1a4c562dcec430aa1a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300455.IaikC7R2-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/rsrc.c: In function 'io_rsrc_node_switch':
>> io_uring/rsrc.c:277:17: error: too many arguments to function 'io_put_rsrc_node'
     277 |                 io_put_rsrc_node(rsrc_node, 1);
         |                 ^~~~~~~~~~~~~~~~
   In file included from io_uring/rsrc.c:17:
   io_uring/rsrc.h:109:20: note: declared here
     109 | static inline void io_put_rsrc_node(struct io_rsrc_node *node)
         |                    ^~~~~~~~~~~~~~~~


vim +/io_put_rsrc_node +277 io_uring/rsrc.c

   259	
   260	void io_rsrc_node_switch(struct io_ring_ctx *ctx,
   261				 struct io_rsrc_data *data_to_kill)
   262		__must_hold(&ctx->uring_lock)
   263	{
   264		WARN_ON_ONCE(!ctx->rsrc_backup_node);
   265		WARN_ON_ONCE(data_to_kill && !ctx->rsrc_node);
   266	
   267		if (data_to_kill) {
   268			struct io_rsrc_node *rsrc_node = ctx->rsrc_node;
   269	
   270			rsrc_node->rsrc_data = data_to_kill;
   271			spin_lock_irq(&ctx->rsrc_ref_lock);
   272			list_add_tail(&rsrc_node->node, &ctx->rsrc_ref_list);
   273			spin_unlock_irq(&ctx->rsrc_ref_lock);
   274	
   275			atomic_inc(&data_to_kill->refs);
   276			/* put master ref */
 > 277			io_put_rsrc_node(rsrc_node, 1);
   278			ctx->rsrc_node = NULL;
   279		}
   280	
   281		if (!ctx->rsrc_node) {
   282			ctx->rsrc_node = ctx->rsrc_backup_node;
   283			ctx->rsrc_backup_node = NULL;
   284		}
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
