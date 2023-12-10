Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B781774A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXXqGro5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702230842; x=1733766842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wupGRIcXQE3rQJ1+S2nUeMoGIQmmN7F41sifHiXdWD8=;
  b=KXXqGro5svGc8LcwnEojjtdwDLR4kMFt+mbSGQdM8KVBwjJKmjeolvWf
   5A6ZggjoBEL/qj56Im6+q5gQwB5YjWcbHWzhBhCOAdKhMDMP2g76IiCgR
   30SchNnheRNrMHrqF5kFiQ5owGt7hQGee0I02Wd4dajD4WczplN7JtfGS
   mGzX5We9xTCxls/ude44pCecRaZr5DwcV0ZGQA8qegisdqqx2Z/MULvx6
   nklffrUNugwiHJAwh59GMSopT85V6nWvOJE/pWxm3AYbRJX2SvnGekiKm
   2IhZPC4fzyxbrT3hEXRGDNaHMyTlp8uwFfZh2HhKEuzqgv5fcoVaEqk0J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="425695997"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="425695997"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 09:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="896154845"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="896154845"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 10 Dec 2023 09:54:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCO05-000H8K-32;
	Sun, 10 Dec 2023 17:53:57 +0000
Date: Mon, 11 Dec 2023 01:53:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-pp-provider 23/31] io_uring/zc_rx.c:195:5: error:
 redefinition of 'io_register_zc_rx_sock'
Message-ID: <202312110153.vCoMSEzs-lkp@intel.com>
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
commit: 91fec79b805edefb26cbef78d95ce0571750c778 [23/31] io_uring/zcrx: implement socket registration
config: i386-buildonly-randconfig-006-20231210 (https://download.01.org/0day-ci/archive/20231211/202312110153.vCoMSEzs-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110153.vCoMSEzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110153.vCoMSEzs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/zc_rx.c:13:
   io_uring/zc_rx.h: In function 'io_unregister_zc_rx_ifq':
   io_uring/zc_rx.h:43:9: warning: 'return' with a value, in function returning void [-Wreturn-type]
      43 |  return -EOPNOTSUPP;
         |         ^
   io_uring/zc_rx.h:41:20: note: declared here
      41 | static inline void io_unregister_zc_rx_ifq(struct io_ring_ctx *ctx)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/zc_rx.c: At top level:
   io_uring/zc_rx.c:44:5: warning: no previous prototype for 'io_allocate_rbuf_ring' [-Wmissing-prototypes]
      44 | int io_allocate_rbuf_ring(struct io_zc_rx_ifq *ifq,
         |     ^~~~~~~~~~~~~~~~~~~~~
   io_uring/zc_rx.c:64:6: warning: no previous prototype for 'io_free_rbuf_ring' [-Wmissing-prototypes]
      64 | void io_free_rbuf_ring(struct io_zc_rx_ifq *ifq)
         |      ^~~~~~~~~~~~~~~~~
   io_uring/zc_rx.c:93:5: error: redefinition of 'io_register_zc_rx_ifq'
      93 | int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from io_uring/zc_rx.c:13:
   io_uring/zc_rx.h:36:19: note: previous definition of 'io_register_zc_rx_ifq' was here
      36 | static inline int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
         |                   ^~~~~~~~~~~~~~~~~~~~~
   io_uring/zc_rx.c:156:6: warning: no previous prototype for 'io_unregister_zc_rx_ifqs' [-Wmissing-prototypes]
     156 | void io_unregister_zc_rx_ifqs(struct io_ring_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   io_uring/zc_rx.c:171:6: warning: no previous prototype for 'io_shut_zc_rx_ifqs' [-Wmissing-prototypes]
     171 | void io_shut_zc_rx_ifqs(struct io_ring_ctx *ctx)
         |      ^~~~~~~~~~~~~~~~~~
>> io_uring/zc_rx.c:195:5: error: redefinition of 'io_register_zc_rx_sock'
     195 | int io_register_zc_rx_sock(struct io_ring_ctx *ctx,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from io_uring/zc_rx.c:13:
   io_uring/zc_rx.h:45:19: note: previous definition of 'io_register_zc_rx_sock' was here
      45 | static inline int io_register_zc_rx_sock(struct io_ring_ctx *ctx,
         |                   ^~~~~~~~~~~~~~~~~~~~~~


vim +/io_register_zc_rx_sock +195 io_uring/zc_rx.c

   194	
 > 195	int io_register_zc_rx_sock(struct io_ring_ctx *ctx,
   196				   struct io_uring_zc_rx_sock_reg __user *arg)
   197	{
   198		struct io_uring_zc_rx_sock_reg sr;
   199		struct io_zc_rx_ifq *ifq;
   200		struct socket *sock;
   201		struct file *file;
   202		int ret = -EEXIST;
   203		int idx;
   204	
   205		if (copy_from_user(&sr, arg, sizeof(sr)))
   206			return -EFAULT;
   207		if (sr.__resv[0] || sr.__resv[1])
   208			return -EINVAL;
   209		if (sr.zc_rx_ifq_idx != 0 || !ctx->ifq)
   210			return -EINVAL;
   211	
   212		ifq = ctx->ifq;
   213		if (ifq->nr_sockets >= ARRAY_SIZE(ifq->sockets))
   214			return -EINVAL;
   215	
   216		BUILD_BUG_ON(ARRAY_SIZE(ifq->sockets) > IO_ZC_IFQ_IDX_MASK);
   217	
   218		file = fget(sr.sockfd);
   219		if (!file)
   220			return -EBADF;
   221	
   222		if (io_file_need_scm(file)) {
   223			fput(file);
   224			return -EBADF;
   225		}
   226	
   227		sock = sock_from_file(file);
   228		if (unlikely(!sock || !sock->sk)) {
   229			fput(file);
   230			return -ENOTSOCK;
   231		}
   232	
   233		idx = ifq->nr_sockets;
   234		lock_sock(sock->sk);
   235		if (!sock->zc_rx_idx) {
   236			unsigned token;
   237	
   238			token = idx + (sr.zc_rx_ifq_idx << IO_ZC_IFQ_IDX_OFFSET);
   239			WRITE_ONCE(sock->zc_rx_idx, token);
   240			ret = 0;
   241		}
   242		release_sock(sock->sk);
   243	
   244		if (ret) {
   245			fput(file);
   246			return -EINVAL;
   247		}
   248		ifq->sockets[idx] = file;
   249		ifq->nr_sockets++;
   250		return 0;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
