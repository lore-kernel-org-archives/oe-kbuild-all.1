Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0E414F9F7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338359; cv=none; b=imfS4evkpqxyFozHyOFt8MPbZTapxSEtuVzGGpJB7qKdTe9uYcWz9Rmqf492XZ4a6jMbGpZlTL3UxTRCeL6YSsRcaJ8yRnnv6dFMsG/z9iATOEm/4nLAEUsv9PLSuR1LABNI1RTrIOjXECyarziX8qNa4rf2VUgKnbLu23MFpkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338359; c=relaxed/simple;
	bh=ZFTBvzO7PCS/hwEgovz0mHgLWXXcA3LCKMd0E2Xk0ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpg6Oxp6NyBj/juPiLM/3AIjeLp6qTPXH+2pi8SBcXKR48rW/2QcZHmQb41fJOB0ygnw0UdnSBErHZOJnGLcpvhJ/lvW3Okqd45NshKKbtKCVDtX7VT1BUA41qeE6OzENKknWIGo7jemIJbbDGlAGfpM2YhLUOWSD0dr0wJia2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQ3BOybc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQ3BOybc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750338357; x=1781874357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZFTBvzO7PCS/hwEgovz0mHgLWXXcA3LCKMd0E2Xk0ZI=;
  b=JQ3BOybcPnrqBlDw2aOaWKLt+C855FHkDs/ePwkA2/xyjr/wK/QAuKR+
   jkgTCEc+HxnLzRq7QT6tUdwPAUvutZhrO1Vy6eNRhLr1zby06K/p3Wj57
   uYrQWI9/jNmzukJwMooYh0tD+4jyPT/I4wxQ6ORg0VT9DOZf9OBVmdH0w
   XGxWzdJk18SAMzxq3ZchkA3HitUbpVTufO9XHika0TgvO9maODDl2qXuN
   qE7lQi+HhBPJPCmgjK+AfXB3qWd/3U8eek1rf9b/7pEiCLun9/9aVB4JP
   NwnmjxAICTpNrhL13/RhhevcYbigKjXfN2XpcRnFq3J98sV6kwskJzf6S
   Q==;
X-CSE-ConnectionGUID: qhyNKb1hRp+Se9MJ3Iv3Dw==
X-CSE-MsgGUID: MJtp3Pz/S+OFJ8VmqyCnRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63274815"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="63274815"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:05:56 -0700
X-CSE-ConnectionGUID: OsV4ygqATUmXMyhzXewDYg==
X-CSE-MsgGUID: Baimr4aoTTuWrjrW2/XKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="151177879"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Jun 2025 06:05:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSExl-000KlY-0C;
	Thu, 19 Jun 2025 13:05:53 +0000
Date: Thu, 19 Jun 2025 21:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2]
 drivers/block/virtio_blk.c:2149:12: warning: 'virtblk_cdev_add' defined but
 not used
Message-ID: <202506192047.C7GlCBTP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   72ad9fd00b32380d70b2ad46ae6dfbf606f42a02
commit: 2114cb6d98e2b0719a7b37bf3cbedab06a854e00 [2/2] anolis: virtio-blk: make chardev only exposed to specific devices
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250619/202506192047.C7GlCBTP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506192047.C7GlCBTP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506192047.C7GlCBTP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/virtio_blk.c:2102:5: warning: no previous prototype for 'virtblk_chr_uring_cmd_iopoll' [-Wmissing-prototypes]
    2102 | int virtblk_chr_uring_cmd_iopoll(struct io_uring_cmd *ioucmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/virtio_blk.c: In function 'virtblk_probe':
   drivers/block/virtio_blk.c:2293:25: warning: unused variable 'i' [-Wunused-variable]
    2293 |         int err, index, i;
         |                         ^
   drivers/block/virtio_blk.c: At top level:
>> drivers/block/virtio_blk.c:2149:12: warning: 'virtblk_cdev_add' defined but not used [-Wunused-function]
    2149 | static int virtblk_cdev_add(struct virtio_blk *vblk)
         |            ^~~~~~~~~~~~~~~~
>> drivers/block/virtio_blk.c:2143:13: warning: 'virtblk_cdev_del' defined but not used [-Wunused-function]
    2143 | static void virtblk_cdev_del(struct cdev *cdev, struct device *cdev_device)
         |             ^~~~~~~~~~~~~~~~


vim +/virtblk_cdev_add +2149 drivers/block/virtio_blk.c

6cc24e242a114a Ferry Meng            2024-07-02  2101  
45a746d87c4215 Ferry Meng            2024-06-20 @2102  int virtblk_chr_uring_cmd_iopoll(struct io_uring_cmd *ioucmd,
45a746d87c4215 Ferry Meng            2024-06-20  2103  				 struct io_comp_batch *iob, unsigned int poll_flags)
45a746d87c4215 Ferry Meng            2024-06-20  2104  {
45a746d87c4215 Ferry Meng            2024-06-20  2105  	struct request *req;
45a746d87c4215 Ferry Meng            2024-06-20  2106  	int ret = 0;
45a746d87c4215 Ferry Meng            2024-06-20  2107  	struct virtio_blk *vblk;
45a746d87c4215 Ferry Meng            2024-06-20  2108  	struct request_queue *q;
45a746d87c4215 Ferry Meng            2024-06-20  2109  
45a746d87c4215 Ferry Meng            2024-06-20  2110  	req = READ_ONCE(ioucmd->cookie);
45a746d87c4215 Ferry Meng            2024-06-20  2111  	vblk = container_of(file_inode(ioucmd->file)->i_cdev,
45a746d87c4215 Ferry Meng            2024-06-20  2112  			struct virtio_blk, cdev);
45a746d87c4215 Ferry Meng            2024-06-20  2113  	q = vblk->disk->queue;
45a746d87c4215 Ferry Meng            2024-06-20  2114  	if (test_bit(QUEUE_FLAG_POLL, &q->queue_flags))
45a746d87c4215 Ferry Meng            2024-06-20  2115  		ret = bio_poll(req->bio, iob, poll_flags);
45a746d87c4215 Ferry Meng            2024-06-20  2116  	return ret;
45a746d87c4215 Ferry Meng            2024-06-20  2117  }
beb2017abd5c9b Ferry Meng            2024-07-29  2118  
beb2017abd5c9b Ferry Meng            2024-07-29  2119  static int virtblk_chr_open(struct inode *inode, struct file *file)
beb2017abd5c9b Ferry Meng            2024-07-29  2120  {
beb2017abd5c9b Ferry Meng            2024-07-29  2121  	return virtblk_device_open(container_of(inode->i_cdev, struct virtio_blk, cdev));
beb2017abd5c9b Ferry Meng            2024-07-29  2122  }
beb2017abd5c9b Ferry Meng            2024-07-29  2123  
beb2017abd5c9b Ferry Meng            2024-07-29  2124  static int virtblk_chr_release(struct inode *inode, struct file *file)
beb2017abd5c9b Ferry Meng            2024-07-29  2125  {
beb2017abd5c9b Ferry Meng            2024-07-29  2126  	virtblk_device_release(container_of(inode->i_cdev, struct virtio_blk, cdev));
beb2017abd5c9b Ferry Meng            2024-07-29  2127  	return 0;
beb2017abd5c9b Ferry Meng            2024-07-29  2128  }
beb2017abd5c9b Ferry Meng            2024-07-29  2129  
beb2017abd5c9b Ferry Meng            2024-07-29  2130  static const struct file_operations virtblk_chr_fops = {
beb2017abd5c9b Ferry Meng            2024-07-29  2131  	.owner		= THIS_MODULE,
beb2017abd5c9b Ferry Meng            2024-07-29  2132  	.open		= virtblk_chr_open,
beb2017abd5c9b Ferry Meng            2024-07-29  2133  	.release	= virtblk_chr_release,
6cc24e242a114a Ferry Meng            2024-07-02  2134  	.uring_cmd	= virtblk_chr_uring_cmd,
45a746d87c4215 Ferry Meng            2024-06-20  2135  	.uring_cmd_iopoll = virtblk_chr_uring_cmd_iopoll,
beb2017abd5c9b Ferry Meng            2024-07-29  2136  };
beb2017abd5c9b Ferry Meng            2024-07-29  2137  
beb2017abd5c9b Ferry Meng            2024-07-29  2138  static void virtblk_cdev_rel(struct device *dev)
beb2017abd5c9b Ferry Meng            2024-07-29  2139  {
beb2017abd5c9b Ferry Meng            2024-07-29  2140  	ida_free(&vd_chr_minor_ida, MINOR(dev->devt));
beb2017abd5c9b Ferry Meng            2024-07-29  2141  }
beb2017abd5c9b Ferry Meng            2024-07-29  2142  
beb2017abd5c9b Ferry Meng            2024-07-29 @2143  static void virtblk_cdev_del(struct cdev *cdev, struct device *cdev_device)
beb2017abd5c9b Ferry Meng            2024-07-29  2144  {
beb2017abd5c9b Ferry Meng            2024-07-29  2145  	cdev_device_del(cdev, cdev_device);
beb2017abd5c9b Ferry Meng            2024-07-29  2146  	put_device(cdev_device);
beb2017abd5c9b Ferry Meng            2024-07-29  2147  }
beb2017abd5c9b Ferry Meng            2024-07-29  2148  
beb2017abd5c9b Ferry Meng            2024-07-29 @2149  static int virtblk_cdev_add(struct virtio_blk *vblk)
beb2017abd5c9b Ferry Meng            2024-07-29  2150  {
beb2017abd5c9b Ferry Meng            2024-07-29  2151  	struct cdev *cdev = &vblk->cdev;
beb2017abd5c9b Ferry Meng            2024-07-29  2152  	struct device *cdev_device = &vblk->cdev_device;
beb2017abd5c9b Ferry Meng            2024-07-29  2153  	int minor, ret;
beb2017abd5c9b Ferry Meng            2024-07-29  2154  
beb2017abd5c9b Ferry Meng            2024-07-29  2155  	minor = ida_alloc(&vd_chr_minor_ida, GFP_KERNEL);
beb2017abd5c9b Ferry Meng            2024-07-29  2156  	if (minor < 0)
beb2017abd5c9b Ferry Meng            2024-07-29  2157  		return minor;
beb2017abd5c9b Ferry Meng            2024-07-29  2158  
beb2017abd5c9b Ferry Meng            2024-07-29  2159  	device_initialize(cdev_device);
beb2017abd5c9b Ferry Meng            2024-07-29  2160  	cdev_device->parent = &vblk->vdev->dev;
beb2017abd5c9b Ferry Meng            2024-07-29  2161  	cdev_device->devt = MKDEV(MAJOR(vd_chr_devt), minor);
beb2017abd5c9b Ferry Meng            2024-07-29  2162  	cdev_device->class = vd_chr_class;
beb2017abd5c9b Ferry Meng            2024-07-29  2163  	cdev_device->release = virtblk_cdev_rel;
beb2017abd5c9b Ferry Meng            2024-07-29  2164  
beb2017abd5c9b Ferry Meng            2024-07-29  2165  	ret = dev_set_name(cdev_device, "%sc0", vblk->disk->disk_name);
beb2017abd5c9b Ferry Meng            2024-07-29  2166  	if (ret)
beb2017abd5c9b Ferry Meng            2024-07-29  2167  		goto fail;
beb2017abd5c9b Ferry Meng            2024-07-29  2168  
beb2017abd5c9b Ferry Meng            2024-07-29  2169  	cdev_init(cdev, &virtblk_chr_fops);
beb2017abd5c9b Ferry Meng            2024-07-29  2170  	cdev->owner = THIS_MODULE;
beb2017abd5c9b Ferry Meng            2024-07-29  2171  	ret = cdev_device_add(cdev, cdev_device);
beb2017abd5c9b Ferry Meng            2024-07-29  2172  	if (ret)
beb2017abd5c9b Ferry Meng            2024-07-29  2173  		goto fail;
beb2017abd5c9b Ferry Meng            2024-07-29  2174  
beb2017abd5c9b Ferry Meng            2024-07-29  2175  	return 0;
beb2017abd5c9b Ferry Meng            2024-07-29  2176  fail:
beb2017abd5c9b Ferry Meng            2024-07-29  2177  	put_device(cdev_device);
beb2017abd5c9b Ferry Meng            2024-07-29  2178  	return ret;
beb2017abd5c9b Ferry Meng            2024-07-29  2179  }
beb2017abd5c9b Ferry Meng            2024-07-29  2180  
cead3662bf2846 Ferry Meng            2025-03-28  2181  #ifdef CONFIG_DEBUG_FS
cead3662bf2846 Ferry Meng            2025-03-28  2182  static int virtblk_dbg_virtqueues_show(struct seq_file *s, void *unused)
cead3662bf2846 Ferry Meng            2025-03-28  2183  {
cead3662bf2846 Ferry Meng            2025-03-28  2184  	struct virtio_blk *vblk = s->private;
cead3662bf2846 Ferry Meng            2025-03-28  2185  	unsigned long flags;
cead3662bf2846 Ferry Meng            2025-03-28  2186  	int i;
cead3662bf2846 Ferry Meng            2025-03-28  2187  
cead3662bf2846 Ferry Meng            2025-03-28  2188  	for (i = 0; i < vblk->num_vqs; i++) {
cead3662bf2846 Ferry Meng            2025-03-28  2189  		spin_lock_irqsave(&vblk->vqs[i].lock, flags);
cead3662bf2846 Ferry Meng            2025-03-28  2190  		virtqueue_show_split_message(vblk->vqs[i].vq, s);
cead3662bf2846 Ferry Meng            2025-03-28  2191  		spin_unlock_irqrestore(&vblk->vqs[i].lock, flags);
cead3662bf2846 Ferry Meng            2025-03-28  2192  	}
cead3662bf2846 Ferry Meng            2025-03-28  2193  	return 0;
cead3662bf2846 Ferry Meng            2025-03-28  2194  }
cead3662bf2846 Ferry Meng            2025-03-28  2195  
cead3662bf2846 Ferry Meng            2025-03-28  2196  static int virtblk_dbg_virtqueues_open(struct inode *inode, struct file *file)
cead3662bf2846 Ferry Meng            2025-03-28  2197  {
cead3662bf2846 Ferry Meng            2025-03-28  2198  	return single_open(file, virtblk_dbg_virtqueues_show, inode->i_private);
cead3662bf2846 Ferry Meng            2025-03-28  2199  }
cead3662bf2846 Ferry Meng            2025-03-28  2200  
cead3662bf2846 Ferry Meng            2025-03-28  2201  static const struct file_operations virtblk_dbg_virtqueue_ops = {
cead3662bf2846 Ferry Meng            2025-03-28  2202  	.open = virtblk_dbg_virtqueues_open,
cead3662bf2846 Ferry Meng            2025-03-28  2203  	.read = seq_read,
cead3662bf2846 Ferry Meng            2025-03-28  2204  	.llseek = seq_lseek,
cead3662bf2846 Ferry Meng            2025-03-28  2205  	.release = single_release,
cead3662bf2846 Ferry Meng            2025-03-28  2206  };
cead3662bf2846 Ferry Meng            2025-03-28  2207  
cead3662bf2846 Ferry Meng            2025-03-28  2208  #ifdef CONFIG_VIRTIO_BLK_RING_PAIR
cead3662bf2846 Ferry Meng            2025-03-28  2209  static int virtblk_dbg_rqs_show(struct seq_file *s, void *unused)
cead3662bf2846 Ferry Meng            2025-03-28  2210  {
cead3662bf2846 Ferry Meng            2025-03-28  2211  	struct virtio_blk *vblk = s->private;
cead3662bf2846 Ferry Meng            2025-03-28  2212  	struct virtblk_indir_desc *indir_desc;
cead3662bf2846 Ferry Meng            2025-03-28  2213  	int i, j;
cead3662bf2846 Ferry Meng            2025-03-28  2214  
cead3662bf2846 Ferry Meng            2025-03-28  2215  	seq_printf(s, "ring_pair is %d\n", vblk->ring_pair);
cead3662bf2846 Ferry Meng            2025-03-28  2216  	if (!vblk->ring_pair)
cead3662bf2846 Ferry Meng            2025-03-28  2217  		return 0;
cead3662bf2846 Ferry Meng            2025-03-28  2218  
cead3662bf2846 Ferry Meng            2025-03-28  2219  	for (i = 0; i < vblk->num_vqs / VIRTBLK_RING_NUM; i++) {
cead3662bf2846 Ferry Meng            2025-03-28  2220  		for (j = 0; j < vblk->tag_set.queue_depth; j++) {
cead3662bf2846 Ferry Meng            2025-03-28  2221  			indir_desc = &vblk->indir_desc[i][j];
cead3662bf2846 Ferry Meng            2025-03-28  2222  			if (indir_desc->desc) {
cead3662bf2846 Ferry Meng            2025-03-28  2223  				seq_printf(s, "hctx %d, tag %d, desc 0x%px, ",
cead3662bf2846 Ferry Meng            2025-03-28  2224  					i / VIRTBLK_RING_NUM, j,
cead3662bf2846 Ferry Meng            2025-03-28  2225  					indir_desc->desc);
cead3662bf2846 Ferry Meng            2025-03-28  2226  				seq_printf(s, "dma_addr 0x%llx, len 0x%x\n",
cead3662bf2846 Ferry Meng            2025-03-28  2227  					indir_desc->dma_addr, indir_desc->len);
cead3662bf2846 Ferry Meng            2025-03-28  2228  			}
cead3662bf2846 Ferry Meng            2025-03-28  2229  		}
cead3662bf2846 Ferry Meng            2025-03-28  2230  	}
cead3662bf2846 Ferry Meng            2025-03-28  2231  
cead3662bf2846 Ferry Meng            2025-03-28  2232  	return 0;
cead3662bf2846 Ferry Meng            2025-03-28  2233  }
cead3662bf2846 Ferry Meng            2025-03-28  2234  
cead3662bf2846 Ferry Meng            2025-03-28  2235  static int virtblk_dbg_rqs_open(struct inode *inode, struct file *file)
cead3662bf2846 Ferry Meng            2025-03-28  2236  {
cead3662bf2846 Ferry Meng            2025-03-28  2237  	return single_open(file, virtblk_dbg_rqs_show, inode->i_private);
cead3662bf2846 Ferry Meng            2025-03-28  2238  }
cead3662bf2846 Ferry Meng            2025-03-28  2239  
cead3662bf2846 Ferry Meng            2025-03-28  2240  static const struct file_operations virtblk_dbg_rqs_ops = {
cead3662bf2846 Ferry Meng            2025-03-28  2241  	.open = virtblk_dbg_rqs_open,
cead3662bf2846 Ferry Meng            2025-03-28  2242  	.read = seq_read,
cead3662bf2846 Ferry Meng            2025-03-28  2243  	.llseek = seq_lseek,
cead3662bf2846 Ferry Meng            2025-03-28  2244  	.release = single_release,
cead3662bf2846 Ferry Meng            2025-03-28  2245  };
cead3662bf2846 Ferry Meng            2025-03-28  2246  #endif
cead3662bf2846 Ferry Meng            2025-03-28  2247  
cead3662bf2846 Ferry Meng            2025-03-28  2248  static int virtio_blk_dev_dbg_init(struct virtio_blk *vblk)
cead3662bf2846 Ferry Meng            2025-03-28  2249  {
cead3662bf2846 Ferry Meng            2025-03-28  2250  	struct dentry *dir, *parent_block_dir;
cead3662bf2846 Ferry Meng            2025-03-28  2251  
cead3662bf2846 Ferry Meng            2025-03-28  2252  	parent_block_dir = vblk->disk->queue->debugfs_dir;
cead3662bf2846 Ferry Meng            2025-03-28  2253  	if (!parent_block_dir)
cead3662bf2846 Ferry Meng            2025-03-28  2254  		return -EIO;
cead3662bf2846 Ferry Meng            2025-03-28  2255  
cead3662bf2846 Ferry Meng            2025-03-28  2256  	dir = debugfs_create_dir("insight", parent_block_dir);
cead3662bf2846 Ferry Meng            2025-03-28  2257  	if (IS_ERR(dir)) {
cead3662bf2846 Ferry Meng            2025-03-28  2258  		dev_err(&vblk->vdev->dev, "Failed to get debugfs dir for '%s'\n",
cead3662bf2846 Ferry Meng            2025-03-28  2259  			vblk->disk->disk_name);
cead3662bf2846 Ferry Meng            2025-03-28  2260  		return -EIO;
cead3662bf2846 Ferry Meng            2025-03-28  2261  	}
cead3662bf2846 Ferry Meng            2025-03-28  2262  
cead3662bf2846 Ferry Meng            2025-03-28  2263  	debugfs_create_file("virtqueues", 0444, dir, vblk, &virtblk_dbg_virtqueue_ops);
cead3662bf2846 Ferry Meng            2025-03-28  2264  #ifdef CONFIG_VIRTIO_BLK_RING_PAIR
cead3662bf2846 Ferry Meng            2025-03-28  2265  	debugfs_create_file("rpair", 0444, dir, vblk, &virtblk_dbg_rqs_ops);
cead3662bf2846 Ferry Meng            2025-03-28  2266  #endif
cead3662bf2846 Ferry Meng            2025-03-28  2267  	vblk->dbg_dir = dir;
cead3662bf2846 Ferry Meng            2025-03-28  2268  	return 0;
cead3662bf2846 Ferry Meng            2025-03-28  2269  }
cead3662bf2846 Ferry Meng            2025-03-28  2270  
cead3662bf2846 Ferry Meng            2025-03-28  2271  static void virtblk_dev_dbg_close(struct virtio_blk *vblk)
cead3662bf2846 Ferry Meng            2025-03-28  2272  {
cead3662bf2846 Ferry Meng            2025-03-28  2273  	debugfs_remove_recursive(vblk->dbg_dir);
cead3662bf2846 Ferry Meng            2025-03-28  2274  }
cead3662bf2846 Ferry Meng            2025-03-28  2275  #else
cead3662bf2846 Ferry Meng            2025-03-28  2276  static int virtblk_dev_dbg_init(struct virtio_blk *vblk) { return 0; }
cead3662bf2846 Ferry Meng            2025-03-28  2277  static void virtblk_dev_dbg_close(struct virtio_blk *vblk) { }
cead3662bf2846 Ferry Meng            2025-03-28  2278  #endif
cead3662bf2846 Ferry Meng            2025-03-28  2279  
24d2f90309b23f Christoph Hellwig     2014-04-15  2280  static unsigned int virtblk_queue_depth;
24d2f90309b23f Christoph Hellwig     2014-04-15  2281  module_param_named(queue_depth, virtblk_queue_depth, uint, 0444);
1cf7e9c68fe842 Jens Axboe            2013-11-01  2282  
c1706d4de3de49 Ferry Meng            2025-03-12  2283  #ifdef CONFIG_VIRTIO_BLK_RING_PAIR
c1706d4de3de49 Ferry Meng            2025-03-12  2284  static unsigned short virtblk_dyn_max_rqs = 16384;
c1706d4de3de49 Ferry Meng            2025-03-12  2285  module_param_named(dyn_max_rqs, virtblk_dyn_max_rqs, short, 0444);
c1706d4de3de49 Ferry Meng            2025-03-12  2286  MODULE_PARM_DESC(dyn_max_rqs, "Max requests per rpair(0~65535), default 2^14");
c1706d4de3de49 Ferry Meng            2025-03-12  2287  #endif
c1706d4de3de49 Ferry Meng            2025-03-12  2288  
8d85fce77edfc2 Greg Kroah-Hartman    2012-12-21  2289  static int virtblk_probe(struct virtio_device *vdev)
e467cde238184d Rusty Russell         2007-10-22  2290  {
e467cde238184d Rusty Russell         2007-10-22  2291  	struct virtio_blk *vblk;
69740c8ba878f5 Christoph Hellwig     2010-02-24  2292  	struct request_queue *q;
f082416f33f41a Ferry Meng            2025-03-25 @2293  	int err, index, i;
a98755c559e0e9 Asias He              2012-08-08  2294  
fd1068e1860e44 Joerg Roedel          2019-02-07  2295  	u32 v, blk_size, max_size, sg_elems, opt_io_size;
69740c8ba878f5 Christoph Hellwig     2010-02-24  2296  	u16 min_io_size;
69740c8ba878f5 Christoph Hellwig     2010-02-24  2297  	u8 physical_block_exp, alignment_offset;
a888f361041681 Joseph Qi             2021-01-22  2298  	unsigned int queue_depth;
e467cde238184d Rusty Russell         2007-10-22  2299  
a4379fd841cc1a Michael S. Tsirkin    2015-01-12  2300  	if (!vdev->config->get) {
a4379fd841cc1a Michael S. Tsirkin    2015-01-12  2301  		dev_err(&vdev->dev, "%s failure: config access disabled\n",
a4379fd841cc1a Michael S. Tsirkin    2015-01-12  2302  			__func__);
a4379fd841cc1a Michael S. Tsirkin    2015-01-12  2303  		return -EINVAL;
a4379fd841cc1a Michael S. Tsirkin    2015-01-12  2304  	}
a4379fd841cc1a Michael S. Tsirkin    2015-01-12  2305  
5087a50e66bd51 Michael S. Tsirkin    2011-10-30  2306  	err = ida_simple_get(&vd_index_ida, 0, minor_to_index(1 << MINORBITS),
5087a50e66bd51 Michael S. Tsirkin    2011-10-30  2307  			     GFP_KERNEL);
5087a50e66bd51 Michael S. Tsirkin    2011-10-30  2308  	if (err < 0)
5087a50e66bd51 Michael S. Tsirkin    2011-10-30  2309  		goto out;
5087a50e66bd51 Michael S. Tsirkin    2011-10-30  2310  	index = err;
4f3bf19c6e8164 Christian Borntraeger 2008-01-31  2311  
0864b79a153342 Rusty Russell         2008-12-30  2312  	/* We need to know how many segments before we allocate. */
855e0c5288177b Rusty Russell         2013-10-14  2313  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_SEG_MAX,
855e0c5288177b Rusty Russell         2013-10-14  2314  				   struct virtio_blk_config, seg_max,
0864b79a153342 Rusty Russell         2008-12-30  2315  				   &sg_elems);
a5b365a652206c Christoph Hellwig     2010-05-25  2316  
a5b365a652206c Christoph Hellwig     2010-05-25  2317  	/* We need at least one SG element, whatever they say. */
a5b365a652206c Christoph Hellwig     2010-05-25  2318  	if (err || !sg_elems)
0864b79a153342 Rusty Russell         2008-12-30  2319  		sg_elems = 1;
0864b79a153342 Rusty Russell         2008-12-30  2320  
dc1352d4c31048 Stefan Hajnoczi       2021-05-24  2321  	/* Prevent integer overflows and honor max vq size */
dc1352d4c31048 Stefan Hajnoczi       2021-05-24  2322  	sg_elems = min_t(u32, sg_elems, VIRTIO_BLK_MAX_SG_ELEMS - 2);
dc1352d4c31048 Stefan Hajnoczi       2021-05-24  2323  
beb2017abd5c9b Ferry Meng            2024-07-29  2324  	vdev->priv = vblk = kzalloc(sizeof(*vblk), GFP_KERNEL);
e467cde238184d Rusty Russell         2007-10-22  2325  	if (!vblk) {
e467cde238184d Rusty Russell         2007-10-22  2326  		err = -ENOMEM;
5087a50e66bd51 Michael S. Tsirkin    2011-10-30  2327  		goto out_free_index;
e467cde238184d Rusty Russell         2007-10-22  2328  	}
e467cde238184d Rusty Russell         2007-10-22  2329  
90b5feb8c4bebc Stefan Hajnoczi       2020-04-30  2330  	/* This reference is dropped in virtblk_remove(). */
90b5feb8c4bebc Stefan Hajnoczi       2020-04-30  2331  	refcount_set(&vblk->refs, 1);
90b5feb8c4bebc Stefan Hajnoczi       2020-04-30  2332  	mutex_init(&vblk->vdev_mutex);
90b5feb8c4bebc Stefan Hajnoczi       2020-04-30  2333  
e467cde238184d Rusty Russell         2007-10-22  2334  	vblk->vdev = vdev;
a98755c559e0e9 Asias He              2012-08-08  2335  
7a7c924cf03da2 Christoph Hellwig     2011-02-01  2336  	INIT_WORK(&vblk->config_work, virtblk_config_changed_work);
e467cde238184d Rusty Russell         2007-10-22  2337  
6abd6e5a440405 Amit Shah             2011-12-22  2338  	err = init_vq(vblk);
6abd6e5a440405 Amit Shah             2011-12-22  2339  	if (err)
e467cde238184d Rusty Russell         2007-10-22  2340  		goto out_free_vblk;
e467cde238184d Rusty Russell         2007-10-22  2341  
e467cde238184d Rusty Russell         2007-10-22  2342  	/* FIXME: How many partitions?  How long is a piece of string? */
4f3bf19c6e8164 Christian Borntraeger 2008-01-31  2343  	vblk->disk = alloc_disk(1 << PART_BITS);
e467cde238184d Rusty Russell         2007-10-22  2344  	if (!vblk->disk) {
e467cde238184d Rusty Russell         2007-10-22  2345  		err = -ENOMEM;
1cf7e9c68fe842 Jens Axboe            2013-11-01  2346  		goto out_free_vq;
e467cde238184d Rusty Russell         2007-10-22  2347  	}
e467cde238184d Rusty Russell         2007-10-22  2348  
fc4324b4597c4e Rusty Russell         2014-03-19  2349  	/* Default queue sizing is to fill the ring. */
a888f361041681 Joseph Qi             2021-01-22  2350  	if (likely(!virtblk_queue_depth)) {
a888f361041681 Joseph Qi             2021-01-22  2351  		queue_depth = vblk->vqs[0].vq->num_free;
fc4324b4597c4e Rusty Russell         2014-03-19  2352  		/* ... but without indirect descs, we use 2 descs per req */
fc4324b4597c4e Rusty Russell         2014-03-19  2353  		if (!virtio_has_feature(vdev, VIRTIO_RING_F_INDIRECT_DESC))
a888f361041681 Joseph Qi             2021-01-22  2354  			queue_depth /= 2;
a888f361041681 Joseph Qi             2021-01-22  2355  	} else {
a888f361041681 Joseph Qi             2021-01-22  2356  		queue_depth = virtblk_queue_depth;
fc4324b4597c4e Rusty Russell         2014-03-19  2357  	}
24d2f90309b23f Christoph Hellwig     2014-04-15  2358  
24d2f90309b23f Christoph Hellwig     2014-04-15  2359  	memset(&vblk->tag_set, 0, sizeof(vblk->tag_set));
f082416f33f41a Ferry Meng            2025-03-25  2360  #ifdef CONFIG_VIRTIO_BLK_RING_PAIR
c1706d4de3de49 Ferry Meng            2025-03-12  2361  	if (vblk->ring_pair) {
c1706d4de3de49 Ferry Meng            2025-03-12  2362  		vblk->tag_set.ops = &virtio_mq_pair_ops;
c1706d4de3de49 Ferry Meng            2025-03-12  2363  		vblk->tag_set.nr_hw_queues = vblk->num_vqs / VIRTBLK_RING_NUM;
c1706d4de3de49 Ferry Meng            2025-03-12  2364  		/* For ring pair, we don't want to use io scheduler. So we set
c1706d4de3de49 Ferry Meng            2025-03-12  2365  		 * NO_SCHED flag, in this case BLK_MQ_F_SHOULD_MERGE is unused.
c1706d4de3de49 Ferry Meng            2025-03-12  2366  		 */
c1706d4de3de49 Ferry Meng            2025-03-12  2367  		vblk->tag_set.flags = BLK_MQ_F_DYN_ALLOC | BLK_MQ_F_NO_SCHED;
c1706d4de3de49 Ferry Meng            2025-03-12  2368  		vblk->tag_set.queue_depth = virtblk_dyn_max_rqs;
c1706d4de3de49 Ferry Meng            2025-03-12  2369  		vblk->tag_set.nr_static_rqs = queue_depth;
c1706d4de3de49 Ferry Meng            2025-03-12  2370  	} else {
c1706d4de3de49 Ferry Meng            2025-03-12  2371  		vblk->tag_set.ops = &virtio_mq_ops;
c1706d4de3de49 Ferry Meng            2025-03-12  2372  		vblk->tag_set.nr_hw_queues = vblk->num_vqs;
c1706d4de3de49 Ferry Meng            2025-03-12  2373  		vblk->tag_set.queue_depth = queue_depth;
c1706d4de3de49 Ferry Meng            2025-03-12  2374  		vblk->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
c1706d4de3de49 Ferry Meng            2025-03-12  2375  	}
f082416f33f41a Ferry Meng            2025-03-25  2376  #else
24d2f90309b23f Christoph Hellwig     2014-04-15  2377  	vblk->tag_set.ops = &virtio_mq_ops;
f082416f33f41a Ferry Meng            2025-03-25  2378  	vblk->tag_set.nr_hw_queues = vblk->num_vqs;
a888f361041681 Joseph Qi             2021-01-22  2379  	vblk->tag_set.queue_depth = queue_depth;
24d2f90309b23f Christoph Hellwig     2014-04-15  2380  	vblk->tag_set.flags = BLK_MQ_F_SHOULD_MERGE;
c1706d4de3de49 Ferry Meng            2025-03-12  2381  #endif
c1706d4de3de49 Ferry Meng            2025-03-12  2382  	vblk->tag_set.numa_node = NUMA_NO_NODE;
b8b7e0926c7836 Ferry Meng            2024-07-22  2383  	/* For bidirectional passthrough vblk request, both WRITE and READ
b8b7e0926c7836 Ferry Meng            2024-07-22  2384  	 * operations need pre-alloc inline SGs. So we should prealloc twice
b8b7e0926c7836 Ferry Meng            2024-07-22  2385  	 * the size than original ways. Due to the inability to predict whether
b8b7e0926c7836 Ferry Meng            2024-07-22  2386  	 * a request is bidirectional, there may be memory wastage, but won't
b8b7e0926c7836 Ferry Meng            2024-07-22  2387  	 * be significant.
b8b7e0926c7836 Ferry Meng            2024-07-22  2388  	 */
24d2f90309b23f Christoph Hellwig     2014-04-15  2389  	vblk->tag_set.cmd_size =
1cf7e9c68fe842 Jens Axboe            2013-11-01  2390  		sizeof(struct virtblk_req) +
b8b7e0926c7836 Ferry Meng            2024-07-22  2391  		sizeof(struct scatterlist) * 2 * VIRTIO_BLK_INLINE_SG_CNT;
24d2f90309b23f Christoph Hellwig     2014-04-15  2392  	vblk->tag_set.driver_data = vblk;
10e33ddf40faed Suwan Kim             2022-04-07  2393  	vblk->tag_set.nr_maps = 1;
10e33ddf40faed Suwan Kim             2022-04-07  2394  	if (vblk->io_queues[HCTX_TYPE_POLL])
10e33ddf40faed Suwan Kim             2022-04-07  2395  		vblk->tag_set.nr_maps = 3;
1cf7e9c68fe842 Jens Axboe            2013-11-01  2396  

:::::: The code at line 2149 was first introduced by commit
:::::: beb2017abd5c9bd4e92e15d67637e465ca299df3 anolis: virtio-blk: add virtio-blk chardev support

:::::: TO: Ferry Meng <mengferry@linux.alibaba.com>
:::::: CC: Ferry Meng <mengferry@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
