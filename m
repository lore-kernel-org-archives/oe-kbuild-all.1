Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74D51854
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 06:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691820369; x=1723356369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BRyWzKF+B4tw6Ganm4As4vLRnktEPLzV/Z/RXPsVWv8=;
  b=aRtnVy/LNatC3rdOxT3d65YEyDR6nhhQ/2Imv2/k5eK5wWZo/Q51AYM0
   /QiPdiYjoFh7ht0crD41Nz+g8kF8eZRNBzl7vx1YqggPAM5h0Zr1L+4yd
   V8BwW0nuwzvw15IQQTmIfdAxonAqDpZvhriNMdeQtLU+XKQDBrmx9q7D8
   hfvBBcTbzqoWjBErhgmWH6sxgZa7gpM7mijha1uTvJvWtijJwRAEc1f0J
   tk1l9/Gf2G0rhgrbZ8Rc1ZT4sX88ykeFFE/Tbzkh5sxa5lipRUct1naak
   amSUmuNc+Q2xKGz5C0WoV0X5MSr3DrWZLWIJe7OdKcwS7YElMfOtI+GIx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402787723"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="402787723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 23:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="906650447"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="906650447"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Aug 2023 23:06:04 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUhlD-0008Je-2A;
	Sat, 12 Aug 2023 06:06:03 +0000
Date: Sat, 12 Aug 2023 14:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Chuck Lever <chuck.lever@oracle.com>
Subject: [cel:topic-sunrpc-thread-scheduling 54/55]
 net/sunrpc/svc_xprt.c:889:29: warning: variable 'error' set but not used
Message-ID: <202308121314.HA8Rq2XG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-sunrpc-thread-scheduling
head:   c1c5d11404378bc0d8a13bd1d9b807a147f6e1c8
commit: 28e0d84927bd64cf5a55271c7766360d99aaf376 [54/55] SUNRPC: integrate back-channel processing with svc_recv()
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230812/202308121314.HA8Rq2XG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121314.HA8Rq2XG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308121314.HA8Rq2XG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sunrpc/svc_xprt.c: In function 'svc_recv':
>> net/sunrpc/svc_xprt.c:889:29: warning: variable 'error' set but not used [-Wunused-but-set-variable]
     889 |                         int error;
         |                             ^~~~~


vim +/error +889 net/sunrpc/svc_xprt.c

   841	
   842	/**
   843	 * svc_recv - Receive and process the next request on any transport
   844	 * @rqstp: an idle RPC service thread
   845	 *
   846	 * This code is carefully organised not to touch any cachelines in
   847	 * the shared svc_serv structure, only cachelines in the local
   848	 * svc_pool.
   849	 */
   850	void svc_recv(struct svc_rqst *rqstp)
   851	{
   852		struct svc_pool *pool = rqstp->rq_pool;
   853	
   854		if (!svc_alloc_arg(rqstp))
   855			return;
   856	
   857		svc_rqst_wait_for_work(rqstp);
   858	
   859		clear_bit(SP_TASK_PENDING, &pool->sp_flags);
   860	
   861		if (kthread_should_stop())
   862			return;
   863	
   864		rqstp->rq_xprt = svc_xprt_dequeue(pool);
   865		if (rqstp->rq_xprt) {
   866			struct svc_xprt *xprt = rqstp->rq_xprt;
   867	
   868			/* Normally we will wait up to 5 seconds for any required
   869			 * cache information to be provided.
   870			 */
   871			if (test_bit(SP_CONGESTED, &pool->sp_flags))
   872				rqstp->rq_chandle.thread_wait = 5 * HZ;
   873			else
   874				rqstp->rq_chandle.thread_wait = 1 * HZ;
   875	
   876			trace_svc_xprt_dequeue(rqstp);
   877			svc_handle_xprt(rqstp, xprt);
   878		}
   879	
   880	#if defined(CONFIG_SUNRPC_BACKCHANNEL)
   881		if (svc_is_backchannel(rqstp)) {
   882			struct svc_serv *serv = rqstp->rq_server;
   883			struct rpc_rqst *req;
   884	
   885			spin_lock_bh(&serv->sv_cb_lock);
   886			req = list_first_entry_or_null(&serv->sv_cb_list,
   887						       struct rpc_rqst, rq_bc_list);
   888			if (req) {
 > 889				int error;
   890	
   891				list_del(&req->rq_bc_list);
   892				spin_unlock_bh(&serv->sv_cb_lock);
   893	
   894				dprintk("Invoking bc_svc_process()\n");
   895				error = bc_svc_process(rqstp->rq_server, req, rqstp);
   896				dprintk("bc_svc_process() returned w/ error code= %d\n",
   897					error);
   898				return;
   899			}
   900			spin_unlock_bh(&serv->sv_cb_lock);
   901		}
   902	#endif
   903	}
   904	EXPORT_SYMBOL_GPL(svc_recv);
   905	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
