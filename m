Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B65C132
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BbKG+UdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702220556; x=1733756556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KPe4zNEgCbXvEIiZ1djqbL9EPeRmBqajHMm+V8F+yik=;
  b=BbKG+UdCwbertpk666+/PrWHOY/M72MXfQFfM1V7L9USXsMi0PglkDOp
   KZo9PuP1MkYgrifC9wLidXNnrt4CeT0eFRdTmLJAykJfFMPU/8FMlOB7O
   6Ywxua6sDkVjXO1KkUnIMiLa6zM1gjanUIN4Cxe9TWjGSsu7GBsR4ElAm
   hlnj/Qpp54KrIR9dq4SNxW+iv5XSt8AiIv53Z5QsA/k3JQziE8aKoghqH
   I1jwS7+DB+CgZaikGqJR2pnNIKfzx3TMZ3/uNh0cql5O0iCr8vnCsibEr
   J/Q4s5HJ5O3zIBg+xdD8MbxIpA676mNF34lKqBYA2q+ckGYwGlxjcWBnW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1656901"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1656901"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 07:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="14092634"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2023 07:02:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCLKB-000Gx4-13;
	Sun, 10 Dec 2023 15:02:31 +0000
Date: Sun, 10 Dec 2023 23:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-pp-provider 18/31] io_uring/uring_cmd.c:250:5:
 warning: no previous prototype for 'io_uring_cmd_sock'
Message-ID: <202312102203.93pLdS5R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider
head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
commit: 6ad9b73c4e6e27dc9e3adfe7f139c37975780415 [18/31] io_uring: separate header for exported net bits
config: i386-buildonly-randconfig-006-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102203.93pLdS5R-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102203.93pLdS5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102203.93pLdS5R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/uring_cmd.c:250:5: warning: no previous prototype for 'io_uring_cmd_sock' [-Wmissing-prototypes]
     250 | int io_uring_cmd_sock(struct io_uring_cmd *cmd, unsigned int issue_flags)
         |     ^~~~~~~~~~~~~~~~~


vim +/io_uring_cmd_sock +250 io_uring/uring_cmd.c

4232c6e349f3a5 Breno Leitao 2023-10-16  248  
d2cac3ec823798 Breno Leitao 2023-10-16  249  #if defined(CONFIG_NET)
8e9fad0e70b7b6 Breno Leitao 2023-06-27 @250  int io_uring_cmd_sock(struct io_uring_cmd *cmd, unsigned int issue_flags)

:::::: The code at line 250 was first introduced by commit
:::::: 8e9fad0e70b7b62848e0aeb1a873903b9ce4d7c4 io_uring: Add io_uring command support for sockets

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
