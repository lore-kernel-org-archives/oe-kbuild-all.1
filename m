Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B152719445
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrhpwyiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704286261; x=1735822261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=olJwXLSZBIGaODI+D7IuOLy2Lsw2hyUhJv0c0BPRoPY=;
  b=PrhpwyiR+UPFbWaME5BgzcTkwIcqrmXbkrHFv0t1cRk7E52WBSGxzeFn
   NQxoWXYmxwHv/nWHnuk/U+kafqaQtaOXSragbnBVHf+EEAOLnYCkr1AaE
   oxdoFaPUFBpdh8w/LYPUw+D+k7C3Xc1IatVD29zMuEFpJ5fczuVYDh6y8
   hqdnhUwv3DTp1X4+XS/nBxHhk9dErNhppi6NvnrKFJwsG7TfZvoNptDy5
   eg4HOKnMv7/XkBa+HaMnRqGvIrrwNKNDp/RW/dZqUNqRNOOsg1hqdhC5E
   5b/V+qqgzWD7XrWzrx+pEmMS80mbag1mUkUXVhM1lPkFrbr6IYgTYm5ju
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="10606485"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="10606485"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 04:50:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="850430021"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="850430021"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2024 04:50:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rL0i0-000M5h-1P;
	Wed, 03 Jan 2024 12:50:56 +0000
Date: Wed, 3 Jan 2024 20:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:kdevops 58/58] net/sunrpc/clnt.c:2341:21: error: 'struct
 rpc_task' has no member named 'tk_pid'
Message-ID: <202401032039.K0SKptKX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux kdevops
head:   8bcbb6048716f07d335466d70ae8659d998d43c7
commit: 8bcbb6048716f07d335466d70ae8659d998d43c7 [58/58] Debugging
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240103/202401032039.K0SKptKX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401032039.K0SKptKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401032039.K0SKptKX-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sunrpc/clnt.c: In function 'call_bc_encode':
>> net/sunrpc/clnt.c:2341:21: error: 'struct rpc_task' has no member named 'tk_pid'
    2341 |                 task->tk_pid,
         |                     ^~
   net/sunrpc/clnt.c: In function 'call_bc_transmit':
   net/sunrpc/clnt.c:2357:21: error: 'struct rpc_task' has no member named 'tk_pid'
    2357 |                 task->tk_pid,
         |                     ^~
   net/sunrpc/clnt.c: In function 'call_bc_transmit_status':
   net/sunrpc/clnt.c:2380:21: error: 'struct rpc_task' has no member named 'tk_pid'
    2380 |                 task->tk_pid,
         |                     ^~


vim +2341 net/sunrpc/clnt.c

  2336	
  2337	static void
  2338	call_bc_encode(struct rpc_task *task)
  2339	{
  2340		trace_printk("%08x@%08x tk_status=%d",
> 2341			task->tk_pid,
  2342			task->tk_client ? task->tk_client->cl_clid : -1,
  2343			task->tk_status);
  2344	
  2345		xprt_request_enqueue_transmit(task);
  2346		task->tk_action = call_bc_transmit;
  2347	}
  2348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
