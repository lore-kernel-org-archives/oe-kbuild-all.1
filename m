Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98B215E98
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkDXTXQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697233673; x=1728769673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hUaeQr7HrheaIK8AZpmaCbYzbrmNaQiwLUzMUwe0Ars=;
  b=RkDXTXQwhSl1XD4XiKYwNGHp8JilL9v5/3+qFyX587pulENPte5wGhUi
   lASIDWRbs9IPUGymEEQ6W7j4HHi59Z6epKjQgBfO/eJEWrGzjL3PdjRLS
   Lj79BoA9XWBLSB+wjjZJe4BjlHxUXHKv3RUBUQ1fwSSd40o5S5TOBx5Fk
   OL8gdrgfbIr22e5ZDQw/lYm+fG5TwAxX9V6QTQV7bmtXg69EmfoFiM4lL
   bYubQb4AEEYnCbKaxuc17l7ffyQJHDcdKNgny6f67t65ed6Hbx9KzT4hd
   SquoW3TZoVDUoH8dIKrDhpKBad3fD/y/eBmDOADtsnuVTHdzoxrspSG9M
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382500716"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="382500716"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 14:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1086300135"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="1086300135"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 14:47:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrQ0b-0005R3-2X;
	Fri, 13 Oct 2023 21:47:49 +0000
Date: Sat, 14 Oct 2023 05:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1004/1018] io_uring/zc_rx.c:144:5: warning: no
 previous declaration for 'io_zc_rx_create_pool'
Message-ID: <202310140530.T7VLuGiE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: de471788991400859db2362ac41d6f1d2662820a [1004/1018] io_uring: add ZC buf and pool
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20231014/202310140530.T7VLuGiE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140530.T7VLuGiE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140530.T7VLuGiE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/zc_rx.c:144:5: warning: no previous declaration for 'io_zc_rx_create_pool' [-Wmissing-declarations]
    int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
        ^~~~~~~~~~~~~~~~~~~~


vim +/io_zc_rx_create_pool +144 io_uring/zc_rx.c

   143	
 > 144	int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
   145				 struct io_zc_rx_ifq *ifq,
   146				 u16 id)
   147	{
   148		struct device *dev = netdev2dev(ifq->dev);
   149		struct io_mapped_ubuf *imu;
   150		struct io_zc_rx_pool *pool;
   151		int nr_pages;
   152		int ret;
   153	
   154		if (ifq->pool)
   155			return -EFAULT;
   156	
   157		if (unlikely(id >= ctx->nr_user_bufs))
   158			return -EFAULT;
   159		id = array_index_nospec(id, ctx->nr_user_bufs);
   160		imu = ctx->user_bufs[id];
   161		if (imu->ubuf & ~PAGE_MASK || imu->ubuf_end & ~PAGE_MASK)
   162			return -EFAULT;
   163	
   164		ret = -ENOMEM;
   165		nr_pages = imu->nr_bvecs;
   166		pool = kvmalloc(struct_size(pool, freelist, nr_pages), GFP_KERNEL);
   167		if (!pool)
   168			goto err;
   169	
   170		pool->bufs = kvmalloc_array(nr_pages, sizeof(*pool->bufs), GFP_KERNEL);
   171		if (!pool->bufs)
   172			goto err_buf;
   173	
   174		ret = io_zc_rx_map_pool(pool, imu, dev);
   175		if (ret)
   176			goto err_map;
   177	
   178		pool->ifq = ifq;
   179		pool->pool_id = id;
   180		pool->nr_pages = nr_pages;
   181		pool->cache_count = 0;
   182		spin_lock_init(&pool->freelist_lock);
   183		pool->free_count = nr_pages;
   184		ifq->pool = pool;
   185	
   186		return 0;
   187	
   188	err_map:
   189		kvfree(pool->bufs);
   190	err_buf:
   191		kvfree(pool);
   192	err:
   193		return ret;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
