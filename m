Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF60A15AC9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 15:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0TAswAa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702220559; x=1733756559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h0CE/Emk+x4zpt6q8t1A76egUvA8gjQRjxSBUjeWyX0=;
  b=M0TAswAa3f0+y0lnV0BczLy+m6D01SNRA0ESBUogQXx49pQLxG1coadp
   FrlfxEnolKn0RoUm9cTrr6zcTLZacoSbc+K6XjRb4CciNSz6eGOod8JV1
   lbWhzc8E7+4tVBUkz/uBlzqUb5wVp6mazBQFVw5ENICDWMtubGShAmpq8
   catJkX4TfJPqYfZR6ERrsw/81nUR+CZJH/1NeI79Bkr7gTO3VYJwuEWuO
   DtiKPohhK7wdWBGZMWbNaES2MWHuwh7pVq9J0BfVerVejH0bvwJLLzdvR
   w3/tIlcoCAVxP0v2uahe5EFgaOjiluZONP97kpZafrOPW09/nEH0ZwePQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1656904"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1656904"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 07:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="14092635"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2023 07:02:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCLKB-000GxC-1L;
	Sun, 10 Dec 2023 15:02:31 +0000
Date: Sun, 10 Dec 2023 23:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx-pp-provider 19/31] io_uring/zc_rx.h:31:9: warning:
 'return' with a value, in function returning void
Message-ID: <202312102222.W869Ero2-lkp@intel.com>
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
commit: a637a9b59d1de6a86ea926ae416dd7bc1f4b6da1 [19/31] io_uring: add interface queue
config: i386-buildonly-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102222.W869Ero2-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102222.W869Ero2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102222.W869Ero2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:98:0:
   io_uring/zc_rx.h: In function 'io_unregister_zc_rx_ifq':
>> io_uring/zc_rx.h:31:9: warning: 'return' with a value, in function returning void
     return -EOPNOTSUPP;
            ^
   io_uring/zc_rx.h:29:20: note: declared here
    static inline void io_unregister_zc_rx_ifq(struct io_ring_ctx *ctx)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/io_uring.c: In function 'io_ring_ctx_free':
   io_uring/io_uring.c:2923:2: error: implicit declaration of function 'io_unregister_zc_rx_ifqs'; did you mean 'io_unregister_zc_rx_ifq'? [-Werror=implicit-function-declaration]
     io_unregister_zc_rx_ifqs(ctx);
     ^~~~~~~~~~~~~~~~~~~~~~~~
     io_unregister_zc_rx_ifq
   io_uring/io_uring.c: In function 'io_ring_exit_work':
   io_uring/io_uring.c:3116:4: error: implicit declaration of function 'io_shut_zc_rx_ifqs'; did you mean 'io_register_zc_rx_ifq'? [-Werror=implicit-function-declaration]
       io_shut_zc_rx_ifqs(ctx);
       ^~~~~~~~~~~~~~~~~~
       io_register_zc_rx_ifq
   cc1: some warnings being treated as errors


vim +/return +31 io_uring/zc_rx.h

    17	
    18	#if defined(CONFIG_PAGE_POOL)
    19	int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
    20				  struct io_uring_zc_rx_ifq_reg __user *arg);
    21	void io_unregister_zc_rx_ifqs(struct io_ring_ctx *ctx);
    22	void io_shut_zc_rx_ifqs(struct io_ring_ctx *ctx);
    23	#else
    24	static inline int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
    25				  struct io_uring_zc_rx_ifq_reg __user *arg)
    26	{
    27		return -EOPNOTSUPP;
    28	}
    29	static inline void io_unregister_zc_rx_ifq(struct io_ring_ctx *ctx)
    30	{
  > 31		return -EOPNOTSUPP;
    32	}
    33	#endif
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
