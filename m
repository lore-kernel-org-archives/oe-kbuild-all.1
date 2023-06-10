Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7653399
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 00:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686356640; x=1717892640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CgMpWWVzk2vALfw0ILxMQlMDO/eHPyq/J4sU0IoznKI=;
  b=MfP7ucXgRkpyxwChvNP6IWjx4Sn0DTaTfQNHcXFdGodc1EIe567zNgAk
   yrzbln/3YlAWlc64dsP0hackzkJLRg5nZZ6DQZqZTPFB6InGV5hZpMix+
   pA7FYPxqe7i8wzZsawwK3+tIvSfSMc+DOisstUaI027etidS8pK3LTChH
   CbO1YsIl68UBnAUoJpJJWiG+ltYkrUgLVOu1Ble80lTDOY5d6UjIEMDCv
   H8kKyFy4Tl5ZslKkeO7MsmvsCJQ3ZTEASuV4HRmPYWbVBnxEs9HKLLr/z
   McGgAwV7fe++9OaNhvp26AOctMRHFwu6xuFmwx/qnwiZ01E/KBXpx4S8N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="360195188"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="360195188"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 17:24:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="710519518"
X-IronPort-AV: E=Sophos;i="6.00,230,1681196400"; 
   d="scan'208";a="710519518"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Jun 2023 17:23:59 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7mOc-0009XJ-1I;
	Sat, 10 Jun 2023 00:23:58 +0000
Date: Sat, 10 Jun 2023 08:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-futex 24/25] io_uring/futex.h:18:1: error:
 expected identifier or '(' before '{' token
Message-ID: <202306100840.OBos1msY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-futex
head:   08c3f53180099f7a5188bea9e117f1e3fe591e13
commit: 5fe488baac7abe30d21e45ffc57473f185712e11 [24/25] io_uring: add support for futex wake and wait
config: sparc-randconfig-r014-20230609 (https://download.01.org/0day-ci/archive/20230610/202306100840.OBos1msY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=5fe488baac7abe30d21e45ffc57473f185712e11
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block io_uring-futex
        git checkout 5fe488baac7abe30d21e45ffc57473f185712e11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100840.OBos1msY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:95:
>> io_uring/futex.h:18:1: error: expected identifier or '(' before '{' token
      18 | {
         | ^
   io_uring/futex.h:15:19: warning: 'io_futex_cancel' declared 'static' but never defined [-Wunused-function]
      15 | static inline int io_futex_cancel(struct io_ring_ctx *ctx,
         |                   ^~~~~~~~~~~~~~~
--
   In file included from io_uring/cancel.c:18:
>> io_uring/futex.h:18:1: error: expected identifier or '(' before '{' token
      18 | {
         | ^
>> io_uring/futex.h:15:19: warning: 'io_futex_cancel' used but never defined
      15 | static inline int io_futex_cancel(struct io_ring_ctx *ctx,
         |                   ^~~~~~~~~~~~~~~


vim +18 io_uring/futex.h

     8	
     9	#if defined(CONFIG_FUTEX)
    10	int io_futex_cancel(struct io_ring_ctx *ctx, struct io_cancel_data *cd,
    11			    unsigned int issue_flags);
    12	bool io_futex_remove_all(struct io_ring_ctx *ctx, struct task_struct *task,
    13				 bool cancel_all);
    14	#else
  > 15	static inline int io_futex_cancel(struct io_ring_ctx *ctx,
    16					  struct io_cancel_data *cd,
    17					  unsigned int issue_flags);
  > 18	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
