Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131C71CCCC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691875886; x=1723411886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bv1JOqRq4siHKh1SOGhMQLxRi8Jz6wXpRObvnJ56VTk=;
  b=LpbQihV81R7+UwipUTRPqDctW7bQdgL522tvjK18P4wvYblEeIgLDFtz
   T9s62MC9kZ6jdIyfBe6GPgYoPD09zPnjfMw3r78WH00FsvB2ptxj5Okhs
   fGSai24aB8K8j7V/kVp538oYx8emBs6DjXJ08RelbP9ao8AIwfpL0yIX7
   Zz9OAY93Mxbc7hFGx412nkDQMD7k3yVwlJS23VLSethayq0P+fVOxTiYd
   zgFX0fX3l4ODxg5cdM/tCEQfUWVt99NB+vplbUr7hKilo+P4PTn3RRbjx
   mnnYv2aGSKT/IizSt1sQN2QEGxEZ86ZAHooeO+CBbBxSVfirzxgY1ZDQu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="438184219"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="438184219"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 14:31:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="726602174"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="726602174"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Aug 2023 14:31:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUwCh-0008nO-07;
	Sat, 12 Aug 2023 21:31:23 +0000
Date: Sun, 13 Aug 2023 05:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-sunrpc-thread-scheduling 54/56] net/sunrpc/svc.c:1555:13:
 warning: variable 'error' set but not used
Message-ID: <202308130519.2dFUYyN1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-sunrpc-thread-scheduling
head:   1b8bd0b7000850b2d968065283673b9ec6c17fec
commit: 947c6a0641908514166e99da23682d4cc9c56330 [54/56] SUNRPC: Clean up bc_svc_process()
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20230813/202308130519.2dFUYyN1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230813/202308130519.2dFUYyN1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308130519.2dFUYyN1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sunrpc/svc.c: In function 'svc_process_bc':
>> net/sunrpc/svc.c:1555:13: warning: variable 'error' set but not used [-Wunused-but-set-variable]
    1555 |         int error;
         |             ^~~~~


vim +/error +1555 net/sunrpc/svc.c

1cad7ea6fe98dc Ricardo Labiaga     2009-04-01  1543  
9e00abc3c20904 Trond Myklebust     2011-07-13  1544  #if defined(CONFIG_SUNRPC_BACKCHANNEL)
947c6a06419085 Chuck Lever         2023-08-12  1545  /**
947c6a06419085 Chuck Lever         2023-08-12  1546   * svc_process_bc - process a reverse-direction RPC request
947c6a06419085 Chuck Lever         2023-08-12  1547   * @req: RPC request to be used for client-side processing
947c6a06419085 Chuck Lever         2023-08-12  1548   * @rqstp: server-side execution context
947c6a06419085 Chuck Lever         2023-08-12  1549   *
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1550   */
947c6a06419085 Chuck Lever         2023-08-12  1551  void svc_process_bc(struct rpc_rqst *req, struct svc_rqst *rqstp)
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1552  {
632dda833e28fe Chuck Lever         2015-05-11  1553  	struct rpc_task *task;
0d2a970d0ae550 Trond Myklebust     2015-06-04  1554  	int proc_error;
632dda833e28fe Chuck Lever         2015-05-11 @1555  	int error;
632dda833e28fe Chuck Lever         2015-05-11  1556  
632dda833e28fe Chuck Lever         2015-05-11  1557  	dprintk("svc: %s(%p)\n", __func__, req);
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1558  
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1559  	/* Build the svc_rqst used by the common processing routine */
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1560  	rqstp->rq_xid = req->rq_xid;
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1561  	rqstp->rq_prot = req->rq_xprt->prot;
d4b09acf924b84 Vasily Averin       2018-12-24  1562  	rqstp->rq_bc_net = req->rq_xprt->xprt_net;
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1563  
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1564  	rqstp->rq_addrlen = sizeof(req->rq_xprt->addr);
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1565  	memcpy(&rqstp->rq_addr, &req->rq_xprt->addr, rqstp->rq_addrlen);
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1566  	memcpy(&rqstp->rq_arg, &req->rq_rcv_buf, sizeof(rqstp->rq_arg));
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1567  	memcpy(&rqstp->rq_res, &req->rq_snd_buf, sizeof(rqstp->rq_res));
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1568  
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1569  	/* Adjust the argument buffer length */
38b7631fbe42e6 Benjamin Coddington 2015-11-20  1570  	rqstp->rq_arg.len = req->rq_private_buf.len;
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1571  	if (rqstp->rq_arg.len <= rqstp->rq_arg.head[0].iov_len) {
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1572  		rqstp->rq_arg.head[0].iov_len = rqstp->rq_arg.len;
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1573  		rqstp->rq_arg.page_len = 0;
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1574  	} else if (rqstp->rq_arg.len <= rqstp->rq_arg.head[0].iov_len +
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1575  			rqstp->rq_arg.page_len)
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1576  		rqstp->rq_arg.page_len = rqstp->rq_arg.len -
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1577  			rqstp->rq_arg.head[0].iov_len;
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1578  	else
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1579  		rqstp->rq_arg.len = rqstp->rq_arg.head[0].iov_len +
756b9b37cfb2e3 Trond Myklebust     2015-12-07  1580  			rqstp->rq_arg.page_len;
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1581  
5f69d5f65a5468 Chuck Lever         2023-01-08  1582  	/* Reset the response buffer */
5f69d5f65a5468 Chuck Lever         2023-01-08  1583  	rqstp->rq_res.head[0].iov_len = 0;
f4afc8fead386c Chuck Lever         2023-01-02  1584  
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1585  	/*
f4afc8fead386c Chuck Lever         2023-01-02  1586  	 * Skip the XID and calldir fields because they've already
f4afc8fead386c Chuck Lever         2023-01-02  1587  	 * been processed by the caller.
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1588  	 */
5f69d5f65a5468 Chuck Lever         2023-01-08  1589  	svcxdr_init_decode(rqstp);
f4afc8fead386c Chuck Lever         2023-01-02  1590  	if (!xdr_inline_decode(&rqstp->rq_arg_stream, XDR_UNIT * 2)) {
f4afc8fead386c Chuck Lever         2023-01-02  1591  		error = -EINVAL;
f4afc8fead386c Chuck Lever         2023-01-02  1592  		goto out;
f4afc8fead386c Chuck Lever         2023-01-02  1593  	}
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1594  
632dda833e28fe Chuck Lever         2015-05-11  1595  	/* Parse and execute the bc call */
5f69d5f65a5468 Chuck Lever         2023-01-08  1596  	proc_error = svc_process_common(rqstp);
0d2a970d0ae550 Trond Myklebust     2015-06-04  1597  
7402a4fedc2bc4 Trond Myklebust     2019-07-16  1598  	atomic_dec(&req->rq_xprt->bc_slot_count);
0d2a970d0ae550 Trond Myklebust     2015-06-04  1599  	if (!proc_error) {
632dda833e28fe Chuck Lever         2015-05-11  1600  		/* Processing error: drop the request */
b3b02ae5865c2d Trond Myklebust     2012-05-31  1601  		xprt_free_bc_request(req);
8f7766c805d27a Vasily Averin       2018-12-24  1602  		error = -EINVAL;
8f7766c805d27a Vasily Averin       2018-12-24  1603  		goto out;
4b5b3ba16be1b1 Andy Adamson        2011-01-06  1604  	}
632dda833e28fe Chuck Lever         2015-05-11  1605  	/* Finally, send the reply synchronously */
632dda833e28fe Chuck Lever         2015-05-11  1606  	memcpy(&req->rq_snd_buf, &rqstp->rq_res, sizeof(req->rq_snd_buf));
0f41979164a52a Trond Myklebust     2015-06-01  1607  	task = rpc_run_bc_task(req);
632dda833e28fe Chuck Lever         2015-05-11  1608  	if (IS_ERR(task)) {
632dda833e28fe Chuck Lever         2015-05-11  1609  		error = PTR_ERR(task);
632dda833e28fe Chuck Lever         2015-05-11  1610  		goto out;
632dda833e28fe Chuck Lever         2015-05-11  1611  	}
632dda833e28fe Chuck Lever         2015-05-11  1612  
632dda833e28fe Chuck Lever         2015-05-11  1613  	WARN_ON_ONCE(atomic_read(&task->tk_count) != 1);
632dda833e28fe Chuck Lever         2015-05-11  1614  	error = task->tk_status;
632dda833e28fe Chuck Lever         2015-05-11  1615  	rpc_put_task(task);
632dda833e28fe Chuck Lever         2015-05-11  1616  
632dda833e28fe Chuck Lever         2015-05-11  1617  out:
632dda833e28fe Chuck Lever         2015-05-11  1618  	dprintk("svc: %s(), error=%d\n", __func__, error);
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1619  }
947c6a06419085 Chuck Lever         2023-08-12  1620  EXPORT_SYMBOL_GPL(svc_process_bc);
9e00abc3c20904 Trond Myklebust     2011-07-13  1621  #endif /* CONFIG_SUNRPC_BACKCHANNEL */
4d6bbb6233c9cf Ricardo Labiaga     2009-04-01  1622  

:::::: The code at line 1555 was first introduced by commit
:::::: 632dda833e28fe43049a01b4bc53e409176e7843 SUNRPC: Clean up bc_send()

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Trond Myklebust <trond.myklebust@primarydata.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
