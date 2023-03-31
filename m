Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5410A79DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 16:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680279178; x=1711815178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QWybDyWxnMYkV7i9sB8ENXt8erzrGO/3+uxu604RT34=;
  b=ciT6SNzjmjeWt+VW+vPQ+yo8OZ/nc5qI3cLhN5/R+kiHAxYBtC7WuJ+2
   V3o0tQ/0cOfkZFPqQCmdt9b9dfwChAtSEg7WkWVifCXjunDB4JfNii56h
   DuVmU0sIm1YArEUah9/qe2uxYlOty0zp6rfRUWQb/4B6GdYM1kKQGQGQF
   l/AjOqrIfC22dXIv2KZIEVo7+JBY/n1Lwvb2rhZ73rby/50VUx3iAzkWm
   R6durxd42kCVrRqr5+oJKRwTe365K9KXJEdgrqCuoneauLCDlhnVMq7YK
   qfzRF2Dlhgw2Wh/Ua3r0ZN3VnMcB5XI8vsN5koSeadCGQCEU6F1Nk+ein
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="340218494"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="340218494"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 09:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717789837"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="717789837"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 Mar 2023 09:10:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piHKv-000Lwb-0E;
	Fri, 31 Mar 2023 16:10:45 +0000
Date: Sat, 1 Apr 2023 00:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:optimise-rsrc-update 17/19] io_uring/io_uring.c:2795:6:
 sparse: sparse: symbol 'io_rsrc_node_cache_free' was not declared. Should it
 be static?
Message-ID: <202304010023.LF8N6KGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux optimise-rsrc-update
head:   61d74f03ff726afcf7269fb00c7a8790659cb843
commit: 9e46d10a55b4c618be18ff5b2f0f7cba24990d3e [17/19] io_uring/rsrc: cache struct io_rsrc_node
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230401/202304010023.LF8N6KGl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/isilence/linux/commit/9e46d10a55b4c618be18ff5b2f0f7cba24990d3e
        git remote add isilence https://github.com/isilence/linux
        git fetch --no-tags isilence optimise-rsrc-update
        git checkout 9e46d10a55b4c618be18ff5b2f0f7cba24990d3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010023.LF8N6KGl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through include/trace/events/io_uring.h):
   include/linux/io_uring_types.h:179:37: sparse: sparse: array of flexible structures
   include/linux/io_uring_types.h:151:37: sparse: sparse: array of flexible structures
   io_uring/io_uring.c:505:57: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int mask @@     got restricted __poll_t [usertype] @@
   io_uring/io_uring.c:505:57: sparse:     expected unsigned int mask
   io_uring/io_uring.c:505:57: sparse:     got restricted __poll_t [usertype]
   io_uring/io_uring.c:541:57: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int mask @@     got restricted __poll_t [usertype] @@
   io_uring/io_uring.c:541:57: sparse:     expected unsigned int mask
   io_uring/io_uring.c:541:57: sparse:     got restricted __poll_t [usertype]
>> io_uring/io_uring.c:2795:6: sparse: sparse: symbol 'io_rsrc_node_cache_free' was not declared. Should it be static?
   io_uring/io_uring.c:602:28: sparse: sparse: context imbalance in 'io_aux_cqe' - unexpected unlock
   io_uring/io_uring.c:631:23: sparse: sparse: context imbalance in '__io_submit_flush_completions' - different lock contexts for basic block

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
