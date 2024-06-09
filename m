Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53FC8F3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 04:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717908176; cv=none; b=W0JS5oaZpQ0s++beGoxAhg0zuPSpXd9sKN1n44QFyJTYVvhMZrByKbpV9vFnCGogcBr8eW/l0MlDsNWxn//H2Z9XeJoUMVkMlfufVY0RK3wEyK1iTs2f0t4gPyI0yAlork2AsAo4jmNLPL2yMzIgonnwA0a1KGkckmT1IjMZ5Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717908176; c=relaxed/simple;
	bh=Z50q/sG2KFuoMZ++QcDHyMVeRyQCE9N1EaQ+/pLcanI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EjaaOdrrW9FCOlTiRX3tycuPXu870MRme9h8YvdIi8IX9a9j2/RMET6IUBmaz+uPJ1XKM6hPZruHtbqJ6ts4SQnZLrpjTzci84TyxSbcl7xrWTQE+03Mervy30UFd7LH7XWXxqW6YW9fbNh8eglyx1zAMdTvaac/2yguuqsAgIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NoYQwSlI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NoYQwSlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717908173; x=1749444173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z50q/sG2KFuoMZ++QcDHyMVeRyQCE9N1EaQ+/pLcanI=;
  b=NoYQwSlIauJSq++BcCGmBB+tICMDlwC59HlqT3op6Lyn5haTYAtFdQP5
   h1brh686HBRENNZnEwgIezIITuNb2cU1HaFnqqFZtd+NagOUto/OdLDZJ
   jHkRZq/zHybTUPDH8QHmvplHnwes4m/dylXagBIl9vZGX57GQjt+GuKC7
   YXnYD+hUzjyIwWBALFxEc8HksP40u4GkvRCQ8SO7Lzbfp4T3kBsmHgR+D
   KDNA38H5bNoa/S8klygIAPjn4rJ6cCl82Bk8AS4AxO3df8qjxBscag2tX
   cYjy/rRV1NBNnsYkNx20EhfVdCnIR37kCfkVvoHfO0ws7hRcOhsKFe/HM
   A==;
X-CSE-ConnectionGUID: /+gnM+9LTSmscyO9GJ2R1Q==
X-CSE-MsgGUID: itYWq7cOSEexcZKFNphhXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14330562"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14330562"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 21:42:52 -0700
X-CSE-ConnectionGUID: AzxQ2maaSGqm588mNg9KJQ==
X-CSE-MsgGUID: K47QG6p2QGaL9ZZwobQopg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="69507585"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Jun 2024 21:42:51 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGAOG-0000qy-2z;
	Sun, 09 Jun 2024 04:42:48 +0000
Date: Sun, 9 Jun 2024 12:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-limit-flags 48/52] drivers/block/ublk_drv.c:2200:7:
 error: no member named 'zoned' in 'struct queue_limits'
Message-ID: <202406091204.lNPjI0aS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git block-limit-flags
head:   b8da03a6bf6868bc22e344df8b888a805a34d7fa
commit: ecd2eb65b1f6eec3edf6afe2044167e723b91107 [48/52] block: move the zoned flag into the feature field
config: x86_64-buildonly-randconfig-002-20240609 (https://download.01.org/0day-ci/archive/20240609/202406091204.lNPjI0aS-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406091204.lNPjI0aS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406091204.lNPjI0aS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/ublk_drv.c:487:24: warning: unused variable 'q' [-Wunused-variable]
     487 |         struct request_queue *q = ub->ub_disk->queue;
         |                               ^
>> drivers/block/ublk_drv.c:2200:7: error: no member named 'zoned' in 'struct queue_limits'
    2200 |                 lim.zoned = true;
         |                 ~~~ ^
   1 warning and 1 error generated.


vim +2200 drivers/block/ublk_drv.c

71f28f3136aff5 Ming Lei          2022-07-13  2158  
bfbcef036396a7 Ming Lei          2023-01-06  2159  static int ublk_ctrl_start_dev(struct ublk_device *ub, struct io_uring_cmd *cmd)
71f28f3136aff5 Ming Lei          2022-07-13  2160  {
fd9b8547bc5c34 Breno Leitao      2023-05-04  2161  	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2162  	const struct ublk_param_basic *p = &ub->params.basic;
71f28f3136aff5 Ming Lei          2022-07-13  2163  	int ublksrv_pid = (int)header->data[0];
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2164  	struct queue_limits lim = {
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2165  		.logical_block_size	= 1 << p->logical_bs_shift,
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2166  		.physical_block_size	= 1 << p->physical_bs_shift,
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2167  		.io_min			= 1 << p->io_min_shift,
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2168  		.io_opt			= 1 << p->io_opt_shift,
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2169  		.max_hw_sectors		= p->max_sectors,
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2170  		.chunk_sectors		= p->chunk_sectors,
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2171  		.virt_boundary_mask	= p->virt_boundary_mask,
eaf4a9b19b9961 Uday Shankar      2024-04-30  2172  		.max_segments		= USHRT_MAX,
eaf4a9b19b9961 Uday Shankar      2024-04-30  2173  		.max_segment_size	= UINT_MAX,
928b607d1a0941 Jens Axboe        2024-05-11  2174  		.dma_alignment		= 3,
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2175  	};
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2176  	struct gendisk *disk;
34d8f2bea52928 Christoph Hellwig 2022-07-21  2177  	int ret = -EINVAL;
71f28f3136aff5 Ming Lei          2022-07-13  2178  
71f28f3136aff5 Ming Lei          2022-07-13  2179  	if (ublksrv_pid <= 0)
34d8f2bea52928 Christoph Hellwig 2022-07-21  2180  		return -EINVAL;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2181  	if (!(ub->params.types & UBLK_PARAM_TYPE_BASIC))
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2182  		return -EINVAL;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2183  
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2184  	if (ub->params.types & UBLK_PARAM_TYPE_DISCARD) {
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2185  		const struct ublk_param_discard *pd = &ub->params.discard;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2186  
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2187  		lim.discard_alignment = pd->discard_alignment;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2188  		lim.discard_granularity = pd->discard_granularity;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2189  		lim.max_hw_discard_sectors = pd->max_discard_sectors;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2190  		lim.max_write_zeroes_sectors = pd->max_write_zeroes_sectors;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2191  		lim.max_discard_segments = pd->max_discard_segments;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2192  	}
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2193  
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2194  	if (ub->params.types & UBLK_PARAM_TYPE_ZONED) {
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2195  		const struct ublk_param_zoned *p = &ub->params.zoned;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2196  
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2197  		if (!IS_ENABLED(CONFIG_BLK_DEV_ZONED))
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2198  			return -EOPNOTSUPP;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2199  
494ea040bcb5f4 Christoph Hellwig 2024-02-15 @2200  		lim.zoned = true;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2201  		lim.max_active_zones = p->max_active_zones;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2202  		lim.max_open_zones =  p->max_open_zones;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2203  		lim.max_zone_append_sectors = p->max_zone_append_sectors;
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2204  	}
34d8f2bea52928 Christoph Hellwig 2022-07-21  2205  
517fa191cf3c4d Christoph Hellwig 2024-06-05  2206  	if (ub->params.basic.attrs & UBLK_ATTR_VOLATILE_CACHE) {
517fa191cf3c4d Christoph Hellwig 2024-06-05  2207  		lim.features |= BLK_FEAT_WRITE_CACHE;
517fa191cf3c4d Christoph Hellwig 2024-06-05  2208  		if (ub->params.basic.attrs & UBLK_ATTR_FUA)
517fa191cf3c4d Christoph Hellwig 2024-06-05  2209  			lim.features |= BLK_FEAT_FUA;
517fa191cf3c4d Christoph Hellwig 2024-06-05  2210  	}
517fa191cf3c4d Christoph Hellwig 2024-06-05  2211  
fd5fca92ead079 Christoph Hellwig 2024-06-08  2212  	if (ub->params.basic.attrs & UBLK_ATTR_ROTATIONAL)
fd5fca92ead079 Christoph Hellwig 2024-06-08  2213  		lim.features |= BLK_FEAT_ROTATIONAL;
fd5fca92ead079 Christoph Hellwig 2024-06-08  2214  
53e7d08f6d6e21 Ming Lei          2023-07-26  2215  	if (wait_for_completion_interruptible(&ub->completion) != 0)
53e7d08f6d6e21 Ming Lei          2023-07-26  2216  		return -EINTR;
71f28f3136aff5 Ming Lei          2022-07-13  2217  
71f28f3136aff5 Ming Lei          2022-07-13  2218  	mutex_lock(&ub->mutex);
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2219  	if (ub->dev_info.state == UBLK_S_DEV_LIVE ||
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2220  	    test_bit(UB_STATE_USED, &ub->state)) {
34d8f2bea52928 Christoph Hellwig 2022-07-21  2221  		ret = -EEXIST;
34d8f2bea52928 Christoph Hellwig 2022-07-21  2222  		goto out_unlock;
34d8f2bea52928 Christoph Hellwig 2022-07-21  2223  	}
34d8f2bea52928 Christoph Hellwig 2022-07-21  2224  
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2225  	disk = blk_mq_alloc_disk(&ub->tag_set, &lim, NULL);
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2226  	if (IS_ERR(disk)) {
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2227  		ret = PTR_ERR(disk);
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2228  		goto out_unlock;
71f28f3136aff5 Ming Lei          2022-07-13  2229  	}
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2230  	sprintf(disk->disk_name, "ublkb%d", ub->ub_number);
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2231  	disk->fops = &ub_fops;
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2232  	disk->private_data = ub;
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2233  
71f28f3136aff5 Ming Lei          2022-07-13  2234  	ub->dev_info.ublksrv_pid = ublksrv_pid;
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2235  	ub->ub_disk = disk;
0aa73170eba5ea Ming Lei          2022-07-30  2236  
494ea040bcb5f4 Christoph Hellwig 2024-02-15  2237  	ublk_apply_params(ub);
0aa73170eba5ea Ming Lei          2022-07-30  2238  
73a166d9749230 Ming Lei          2023-01-06  2239  	/* don't probe partitions if any one ubq daemon is un-trusted */
73a166d9749230 Ming Lei          2023-01-06  2240  	if (ub->nr_privileged_daemon != ub->nr_queues_ready)
73a166d9749230 Ming Lei          2023-01-06  2241  		set_bit(GD_SUPPRESS_PART_SCAN, &disk->state);
73a166d9749230 Ming Lei          2023-01-06  2242  
1221b9e982e181 Ming Lei          2024-02-23  2243  	ublk_get_device(ub);
4985e7b2c002eb Ming Lei          2023-03-18  2244  	ub->dev_info.state = UBLK_S_DEV_LIVE;
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2245  
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2246  	if (ublk_dev_is_zoned(ub)) {
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2247  		ret = ublk_revalidate_disk_zones(ub);
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2248  		if (ret)
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2249  			goto out_put_cdev;
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2250  	}
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2251  
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2252  	ret = add_disk(disk);
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2253  	if (ret)
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2254  		goto out_put_cdev;
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2255  
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2256  	set_bit(UB_STATE_USED, &ub->state);
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2257  
29802d7ca33bc0 Andreas Hindborg  2023-08-04  2258  out_put_cdev:
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2259  	if (ret) {
4985e7b2c002eb Ming Lei          2023-03-18  2260  		ub->dev_info.state = UBLK_S_DEV_DEAD;
93d71ec89d5fb2 Ming Lei          2022-07-30  2261  		ublk_put_device(ub);
6d9e6dfdf3b207 Christoph Hellwig 2022-07-21  2262  	}
0aa73170eba5ea Ming Lei          2022-07-30  2263  	if (ret)
0aa73170eba5ea Ming Lei          2022-07-30  2264  		put_disk(disk);
34d8f2bea52928 Christoph Hellwig 2022-07-21  2265  out_unlock:
71f28f3136aff5 Ming Lei          2022-07-13  2266  	mutex_unlock(&ub->mutex);
71f28f3136aff5 Ming Lei          2022-07-13  2267  	return ret;
71f28f3136aff5 Ming Lei          2022-07-13  2268  }
71f28f3136aff5 Ming Lei          2022-07-13  2269  

:::::: The code at line 2200 was first introduced by commit
:::::: 494ea040bcb5f4cc78c37dc53c7915752c24f739 ublk: pass queue_limits to blk_mq_alloc_disk

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
