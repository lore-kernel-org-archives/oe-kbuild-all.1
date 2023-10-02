Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AD0CA75
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Oct 2023 12:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696250636; x=1727786636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FtA7RU/4BJM8UIWVUIpd0OmwPLCb2jx/7tvb3niHcIs=;
  b=YwqHGPaPq7A1GbM4tiDfFwvIC82o15Ppvok6rrW2m8WXjieZbuqbcJ0X
   6FNVOI3q73Mb/XesZuyW6b1lL7Lu5b1W70jLcBlSnBtDP5yUcl0lVamOh
   7L8Np9DSQyfw9jfm+MmWL7lbHOsJQYXc/581cC59vGaBoAiEIq8A4u+FX
   1IOsLwFPYpt/6xFNP45mDcGbntEwXLcZTP7NtkNH3XNOo0kIXnSmarnff
   e/PyHJtfVFG85XlBFlUML0XSqnej6xCHVcklJSnzAPFhBzKQQIzkgClRV
   TtV+/zjgMXnhW2CDb0Jgkc1rfoH6AiHkxyi/Tdb6/Yoexq9qMJi+SpFLe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="413545583"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="413545583"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 05:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744104871"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="744104871"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Oct 2023 05:43:53 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnIH8-00063b-0x;
	Mon, 02 Oct 2023 12:43:50 +0000
Date: Mon, 2 Oct 2023 20:43:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 20/34] fs/netfs/output.c:260:32: warning:
 unused variable 'cookie'
Message-ID: <202310022044.yOTrJ07S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   8b08a7e2d3217f7054808246fc559c867f54a524
commit: ae37d723c4aec9e50020269af0818b602535d931 [20/34] netfs: Dispatch write requests to process a writeback slice
config: powerpc64-randconfig-002-20231002 (https://download.01.org/0day-ci/archive/20231002/202310022044.yOTrJ07S-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310022044.yOTrJ07S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310022044.yOTrJ07S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/netfs/output.c: In function 'netfs_set_up_write_to_cache':
>> fs/netfs/output.c:260:32: warning: unused variable 'cookie' [-Wunused-variable]
     260 |         struct fscache_cookie *cookie = netfs_i_cookie(ctx);
         |                                ^~~~~~


vim +/cookie +260 fs/netfs/output.c

   251	
   252	/*
   253	 * Set up a op for writing to the cache.
   254	 */
   255	static void netfs_set_up_write_to_cache(struct netfs_io_request *wreq)
   256	{
   257		struct netfs_cache_resources *cres;
   258		struct netfs_io_subrequest *subreq;
   259		struct netfs_inode *ctx = netfs_inode(wreq->inode);
 > 260		struct fscache_cookie *cookie = netfs_i_cookie(ctx);
   261		loff_t start = wreq->start;
   262		size_t len = wreq->len;
   263		int ret;
   264	
   265		if (!fscache_cookie_enabled(cookie)) {
   266			clear_bit(NETFS_RREQ_WRITE_TO_CACHE, &wreq->flags);
   267			return;
   268		}
   269	
   270		_debug("write to cache");
   271		subreq = netfs_create_write_request(wreq, NETFS_WRITE_TO_CACHE, start, len,
   272						    netfs_write_to_cache_op_worker);
   273		if (!subreq)
   274			return;
   275	
   276		cres = &wreq->cache_resources;
   277		ret = -ENOBUFS;
   278		if (wreq->netfs_ops->begin_cache_operation)
   279			ret = wreq->netfs_ops->begin_cache_operation(wreq);
   280		if (ret < 0) {
   281			netfs_write_subrequest_terminated(subreq, ret, false);
   282			return;
   283		}
   284	
   285		ret = cres->ops->prepare_write(cres, &start, &len, i_size_read(wreq->inode),
   286					       true);
   287		if (ret < 0) {
   288			netfs_write_subrequest_terminated(subreq, ret, false);
   289			return;
   290		}
   291	
   292		netfs_queue_write_request(subreq);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
