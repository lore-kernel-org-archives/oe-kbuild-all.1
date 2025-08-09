Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943CD1E7C05
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Aug 2025 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754772200; cv=none; b=ki2M0WcOHZ9MZHI8pYZKvcWMQEPe/kTcic3UBqikAXKti1L1+tRnJ5iWhfc3T1qa6qguAVupi1GsiE/w0ihsNQtJlIdjLYdkHlDo8fX4xoU/ADZ/lyMvjVfh6EAkUns91GYWu8FrcYgpXZOPxyH5G+KoonPZ3Sha+l5BTPnW7dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754772200; c=relaxed/simple;
	bh=NSs6xrL1UwU1QPCJSa1WmL7/mxWjgpVgYiPo66iskVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhPfIiMZlv94cohS3tEMyevdhqGaYIlRIAwdHClpgnlotnjYKOojPZp7t3ZCxAvzF+xuiaHMx3gHz2RooMdaa6jeVccAJWWxIlozxRKRBW5RP7Chj+F9QN/jkqjQrfOearLGyPxU1weibcbZphX5vGpgza0umV46OCuRVbUJi94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E54LkJzz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E54LkJzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754772199; x=1786308199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NSs6xrL1UwU1QPCJSa1WmL7/mxWjgpVgYiPo66iskVA=;
  b=E54LkJzzMsvdUPaOYjgGhCXXLbvm8ok6hSRa6S1e4CZOlwxPpFNGWmmV
   9VdXFDilwED69u+5iTD+2xmMlVFC7samIMIMcZdQ7MFi/q31Vq6tJQiXg
   xMHk3r5l2gfUerSoVC2qByc82yRev8vcjU2D/I4vZSweiR0UvN2JCYtT5
   5Jn8KTWrztYY3/5I7V5MCs9AqvdVbNdXskzKh8QXviikAK27A5n1kv4uu
   fNCihUAhS8iB6ayhAL6ENDrLajCW33ybHev1C7yQTjOQrJw9lohZXKX6A
   R2v0OyjN3SC8eGyLh1osCwcnY7/3Oi+GVIdySQoPa7ivlaOWRDD3ReBha
   Q==;
X-CSE-ConnectionGUID: Z5/qllNZRdmwCm1KR1H4+g==
X-CSE-MsgGUID: y0EKfVXxR1qXcP2u8RTkWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="74667016"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="74667016"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 13:43:15 -0700
X-CSE-ConnectionGUID: TgCrpu6+TeSxatyF0JncZA==
X-CSE-MsgGUID: Q7VDqkSOSSqOrybxbM+Yqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165998592"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Aug 2025 13:43:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukqOk-000532-0P;
	Sat, 09 Aug 2025 20:42:47 +0000
Date: Sun, 10 Aug 2025 04:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] svcrdma: Introduce Receive buffer arenas
Message-ID: <202508100416.aCwCI003-lkp@intel.com>
References: <20250808184648.120866-1-cel@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808184648.120866-1-cel@kernel.org>

Hi Chuck,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/svcrdma-Introduce-Receive-buffer-arenas/20250809-025410
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20250808184648.120866-1-cel%40kernel.org
patch subject: [RFC PATCH] svcrdma: Introduce Receive buffer arenas
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250810/202508100416.aCwCI003-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250810/202508100416.aCwCI003-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508100416.aCwCI003-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sunrpc/xprtrdma/svc_rdma_recvfrom.c: In function 'svc_rdma_recv_ctxt_alloc':
>> net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:136:40: error: passing argument 4 of 'rpcrdma_pool_alloc_buffer' from incompatible pointer type [-Wincompatible-pointer-types]
     136 |                                        &ctxt->rc_recv_sge.addr))
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                                        |
         |                                        u64 * {aka long long unsigned int *}
   In file included from net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:107:
   net/sunrpc/xprtrdma/pool.h:23:61: note: expected 'dma_addr_t *' {aka 'unsigned int *'} but argument is of type 'u64 *' {aka 'long long unsigned int *'}
      23 |                                void **cpu_addr, dma_addr_t *dma_addr);
         |                                                 ~~~~~~~~~~~~^~~~~~~~


vim +/rpcrdma_pool_alloc_buffer +136 net/sunrpc/xprtrdma/svc_rdma_recvfrom.c

   119	
   120	static struct svc_rdma_recv_ctxt *
   121	svc_rdma_recv_ctxt_alloc(struct svcxprt_rdma *rdma)
   122	{
   123		int node = ibdev_to_node(rdma->sc_cm_id->device);
   124		struct svc_rdma_recv_ctxt *ctxt;
   125		unsigned long pages;
   126	
   127		pages = svc_serv_maxpages(rdma->sc_xprt.xpt_server);
   128		ctxt = kzalloc_node(struct_size(ctxt, rc_pages, pages),
   129				    GFP_KERNEL, node);
   130		if (!ctxt)
   131			goto fail0;
   132		ctxt->rc_maxpages = pages;
   133	
   134		if (!rpcrdma_pool_alloc_buffer(rdma->sc_recv_pool, GFP_KERNEL,
   135					       &ctxt->rc_recv_buf,
 > 136					       &ctxt->rc_recv_sge.addr))
   137			goto fail1;
   138	
   139		svc_rdma_recv_cid_init(rdma, &ctxt->rc_cid);
   140		pcl_init(&ctxt->rc_call_pcl);
   141		pcl_init(&ctxt->rc_read_pcl);
   142		pcl_init(&ctxt->rc_write_pcl);
   143		pcl_init(&ctxt->rc_reply_pcl);
   144	
   145		ctxt->rc_recv_wr.next = NULL;
   146		ctxt->rc_recv_wr.wr_cqe = &ctxt->rc_cqe;
   147		ctxt->rc_recv_wr.sg_list = &ctxt->rc_recv_sge;
   148		ctxt->rc_recv_wr.num_sge = 1;
   149		ctxt->rc_cqe.done = svc_rdma_wc_receive;
   150		ctxt->rc_recv_sge.length = rdma->sc_max_req_size;
   151		ctxt->rc_recv_sge.lkey = rdma->sc_pd->local_dma_lkey;
   152		svc_rdma_cc_init(rdma, &ctxt->rc_cc);
   153		return ctxt;
   154	
   155	fail1:
   156		kfree(ctxt);
   157	fail0:
   158		return NULL;
   159	}
   160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
