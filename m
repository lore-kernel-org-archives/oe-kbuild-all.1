Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0DB46BA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 03:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710559176; cv=none; b=tLWVgwzxHFQD62P2UIluK0wyE88tYgWFDCpkWzGsXD4OSibJJMLpMns2q9ydmBLZMuqZHZLCkYVtubKT9e4VoS47t7yg8vekSWkrQc54XtTpG9kGR8JV4/JwQW2OUjrI5y7dJTa+Ur/TLuuaA2krQTVjuWs9j0IxY6GXrMolNQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710559176; c=relaxed/simple;
	bh=RNCKmy86moWfaHmhvDQzXDJZloyC3R/zvjHyhJTnMwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i0RDUPcCG9WsY1ID8zINs5DH2FJdpskFdSaQEv+fgAvrvbqyp1GYKxqCK4cWVOOlR/p4gsEWq6cUdy+v90ZaupGvsJqc3AqPp00Gu0NFkjoy4GPIAuENoWtJZMYAOWYxIs9PW50YNg0PwWHP+/fZu4mL5b/8v4KHf+aCqu3l8G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMv+eU07; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMv+eU07"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710559174; x=1742095174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNCKmy86moWfaHmhvDQzXDJZloyC3R/zvjHyhJTnMwA=;
  b=kMv+eU07H8JNNl3fmo6ga2hRj+A5ac43v+QkHWi1Sr8ypXjyropMBj4n
   TPTBe9tmNv8UmN3c8C4fY8APmwrvahRhSR2bm3gbEHZAN5jNehQ9j6EKQ
   k2nMJSa0PgogFTgTfPo4iuHSF1Ia5eRr2RO7xwUyg1J+gYV8PKUfoPtkL
   CxZ54/MlkycUiyR1V8hfyDAv7BdlW16SkmtkNEbi+3dlh8Y3eLGqdbxiZ
   zpem/f2unVUXIw3xgtnq1lj/fubFMf0ryfglUUz0lDwG0DyrNitPxREda
   dIQulWKgAAQPMZBlXpCjIgXr8akfH+KduLlExvn34YjSyysxX9Ozk7Bdh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5320483"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5320483"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 20:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="12837751"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Mar 2024 20:19:32 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlKa2-000F1J-1L;
	Sat, 16 Mar 2024 03:19:30 +0000
Date: Sat, 16 Mar 2024 11:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 10/12] fs/netfs/objects.c:25:43: error:
 invalid use of incomplete typedef 'mempool_t' {aka 'struct mempool_s'}
Message-ID: <202403161107.O4ZJvFGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   be938ad004e7a8f28cc6fc8500c120c7687339f7
commit: 0361c7613ba8192cccf99a39007a8ce54ed1f562 [10/12] netfs: Use mempools for allocating requests and subrequests
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20240316/202403161107.O4ZJvFGt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161107.O4ZJvFGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161107.O4ZJvFGt-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/objects.c: In function 'netfs_alloc_request':
>> fs/netfs/objects.c:25:43: error: invalid use of incomplete typedef 'mempool_t' {aka 'struct mempool_s'}
      25 |         struct kmem_cache *cache = mempool->pool_data;
         |                                           ^~
   fs/netfs/objects.c:33:24: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      33 |                 rreq = mempool_alloc(mempool, GFP_KERNEL);
         |                        ^~~~~~~~~~~~~
         |                        mm_alloc
   fs/netfs/objects.c:33:22: warning: assignment to 'struct netfs_io_request *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      33 |                 rreq = mempool_alloc(mempool, GFP_KERNEL);
         |                      ^
   fs/netfs/objects.c:61:25: error: implicit declaration of function 'mempool_free' [-Werror=implicit-function-declaration]
      61 |                         mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
         |                         ^~~~~~~~~~~~
   fs/netfs/objects.c: In function 'netfs_alloc_subrequest':
   fs/netfs/objects.c:156:43: error: invalid use of incomplete typedef 'mempool_t' {aka 'struct mempool_s'}
     156 |         struct kmem_cache *cache = mempool->pool_data;
         |                                           ^~
   fs/netfs/objects.c:159:24: warning: assignment to 'struct netfs_io_subrequest *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     159 |                 subreq = mempool_alloc(rreq->netfs_ops->subrequest_pool ?: &netfs_subrequest_pool,
         |                        ^
   cc1: some warnings being treated as errors


vim +25 fs/netfs/objects.c

    11	
    12	/*
    13	 * Allocate an I/O request and initialise it.
    14	 */
    15	struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
    16						     struct file *file,
    17						     loff_t start, size_t len,
    18						     enum netfs_io_origin origin)
    19	{
    20		static atomic_t debug_ids;
    21		struct inode *inode = file ? file_inode(file) : mapping->host;
    22		struct netfs_inode *ctx = netfs_inode(inode);
    23		struct netfs_io_request *rreq;
    24		mempool_t *mempool = ctx->ops->request_pool ?: &netfs_request_pool;
  > 25		struct kmem_cache *cache = mempool->pool_data;
    26		bool is_unbuffered = (origin == NETFS_UNBUFFERED_WRITE ||
    27				      origin == NETFS_DIO_READ ||
    28				      origin == NETFS_DIO_WRITE);
    29		bool cached = !is_unbuffered && netfs_is_cache_enabled(ctx);
    30		int ret;
    31	
    32		for (;;) {
    33			rreq = mempool_alloc(mempool, GFP_KERNEL);
    34			if (rreq)
    35				break;
    36			msleep(10);
    37		}
    38	
    39		memset(rreq, 0, kmem_cache_size(cache));
    40		rreq->start	= start;
    41		rreq->len	= len;
    42		rreq->upper_len	= len;
    43		rreq->origin	= origin;
    44		rreq->netfs_ops	= ctx->ops;
    45		rreq->mapping	= mapping;
    46		rreq->inode	= inode;
    47		rreq->i_size	= i_size_read(inode);
    48		rreq->debug_id	= atomic_inc_return(&debug_ids);
    49		INIT_LIST_HEAD(&rreq->subrequests);
    50		INIT_WORK(&rreq->work, NULL);
    51		refcount_set(&rreq->ref, 1);
    52	
    53		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
    54		if (cached)
    55			__set_bit(NETFS_RREQ_WRITE_TO_CACHE, &rreq->flags);
    56		if (file && file->f_flags & O_NONBLOCK)
    57			__set_bit(NETFS_RREQ_NONBLOCK, &rreq->flags);
    58		if (rreq->netfs_ops->init_request) {
    59			ret = rreq->netfs_ops->init_request(rreq, file);
    60			if (ret < 0) {
    61				mempool_free(rreq, rreq->netfs_ops->request_pool ?: &netfs_request_pool);
    62				return ERR_PTR(ret);
    63			}
    64		}
    65	
    66		trace_netfs_rreq_ref(rreq->debug_id, 1, netfs_rreq_trace_new);
    67		netfs_proc_add_rreq(rreq);
    68		netfs_stat(&netfs_n_rh_rreq);
    69		return rreq;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
