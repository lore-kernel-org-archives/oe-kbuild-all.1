Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E436125
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352057; cv=none; b=XM35LeYAtqqzmSCxafe9vTs0eQVkuMWM13bPhOUSeeH/6NRped7IWz8mkdL/AHIDjs7zYg/ZfCxQ4FAx+dyuy7lSSpBlJNFEBwfETZr6pb2nj5QaFqxvMZk77jjTVA9PDXZ4yEbv3EO7hN3AIGiBGckPxQQPCaguCwbT/yIRwRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352057; c=relaxed/simple;
	bh=NJaWwP5Tys0f5W07K+1fnSvWdZxalzRMRoucMpp0PTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EpiNyIbvuk4nZMphQ1b8DDu2wTPnUopPQHDcUBFCelNJdvBQi5TqeeDLYMSWVy5MH+oyOd88BOPo5Y7cEiUnYNqGcvxps/oA7Fe+ALM0lK7CyWUoiNCSEvpTMwvDfm0t8dFgHBBM0gb1hyAoCVOqmuEPQx1uWu0FKU1iSTfBMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NY+jrbRd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NY+jrbRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708352055; x=1739888055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJaWwP5Tys0f5W07K+1fnSvWdZxalzRMRoucMpp0PTY=;
  b=NY+jrbRdFPkAysJFBswLniggN4DGiCU+X7NXZ0caAGSezxbshFppl/WG
   Oh3R4cpdmYfV08hiuVceYlZPIDPdaFPNTRvqZoBE75vQrR1ohSZ7FZ/Xu
   akmeRjsdRtGRYwljv4uB2KmInRRA0E3V7i576omRGBTy8OdcjziCEUqDf
   NSVFDa+vAz51LepCrom78XLXXsyRyyiP755wy8U6s+nbIfxBS90VmPBSc
   jjuzGTuPNGf662RFWWs2/luCYDEssgrJx7xVJkBuxdtwbalDmP45Wg6Vl
   RiVN7+P0J+ZlcSeWYrsStl2TFcGi+LcqCpVbNXFnIrvT+1tOi+pR4KRFk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19963798"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="19963798"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 06:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9100942"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Feb 2024 06:14:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rc4PL-0003po-2s;
	Mon, 19 Feb 2024 14:14:11 +0000
Date: Mon, 19 Feb 2024 22:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-zwp 644/675]
 drivers/block/null_blk/main.c:1906:33: error: incompatible pointer types
 passing 'struct queue_limits *' to parameter of type 'struct request_queue
 *'
Message-ID: <202402192200.Zkl0lcKO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-zwp
head:   f24bc80ab52b7ee42fc7bf25c58ea582b7879fd0
commit: c4b8120038fb9990e313c6431d06f9745f1038db [644/675] null-blk-fix
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240219/202402192200.Zkl0lcKO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402192200.Zkl0lcKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402192200.Zkl0lcKO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/null_blk/main.c:1906:33: error: incompatible pointer types passing 'struct queue_limits *' to parameter of type 'struct request_queue *' [-Werror,-Wincompatible-pointer-types]
    1906 |                 rv = null_init_zoned_dev(dev, &lim);
         |                                               ^~~~
   drivers/block/null_blk/null_blk.h:147:33: note: passing argument to parameter 'q' here
     147 |                                       struct request_queue *q)
         |                                                             ^
   1 error generated.


vim +1906 drivers/block/null_blk/main.c

  1869	
  1870	static int null_add_dev(struct nullb_device *dev)
  1871	{
  1872		struct queue_limits lim = {
  1873			.logical_block_size	= dev->blocksize,
  1874			.physical_block_size	= dev->blocksize,
  1875			.max_hw_sectors		= dev->max_sectors,
  1876		};
  1877	
  1878		struct nullb *nullb;
  1879		int rv;
  1880	
  1881		rv = null_validate_conf(dev);
  1882		if (rv)
  1883			return rv;
  1884	
  1885		nullb = kzalloc_node(sizeof(*nullb), GFP_KERNEL, dev->home_node);
  1886		if (!nullb) {
  1887			rv = -ENOMEM;
  1888			goto out;
  1889		}
  1890		nullb->dev = dev;
  1891		dev->nullb = nullb;
  1892	
  1893		spin_lock_init(&nullb->lock);
  1894	
  1895		rv = setup_queues(nullb);
  1896		if (rv)
  1897			goto out_free_nullb;
  1898	
  1899		rv = null_setup_tagset(nullb);
  1900		if (rv)
  1901			goto out_cleanup_queues;
  1902	
  1903		if (dev->virt_boundary)
  1904			lim.virt_boundary_mask = PAGE_SIZE - 1;
  1905		if (dev->zoned) {
> 1906			rv = null_init_zoned_dev(dev, &lim);
  1907			if (rv)
  1908				goto out_cleanup_tags;
  1909		}
  1910		null_config_discard(nullb, &lim);
  1911	
  1912		nullb->disk = blk_mq_alloc_disk(nullb->tag_set, &lim, nullb);
  1913		if (IS_ERR(nullb->disk)) {
  1914			rv = PTR_ERR(nullb->disk);
  1915			goto out_cleanup_zone;
  1916		}
  1917		nullb->q = nullb->disk->queue;
  1918	
  1919		if (dev->mbps) {
  1920			set_bit(NULLB_DEV_FL_THROTTLED, &dev->flags);
  1921			nullb_setup_bwtimer(nullb);
  1922		}
  1923	
  1924		if (dev->cache_size > 0) {
  1925			set_bit(NULLB_DEV_FL_CACHE, &nullb->dev->flags);
  1926			blk_queue_write_cache(nullb->q, true, true);
  1927		}
  1928	
  1929		nullb->q->queuedata = nullb;
  1930		blk_queue_flag_set(QUEUE_FLAG_NONROT, nullb->q);
  1931	
  1932		mutex_lock(&lock);
  1933		rv = ida_alloc(&nullb_indexes, GFP_KERNEL);
  1934		if (rv < 0) {
  1935			mutex_unlock(&lock);
  1936			goto out_cleanup_disk;
  1937		}
  1938		nullb->index = rv;
  1939		dev->index = rv;
  1940		mutex_unlock(&lock);
  1941	
  1942		if (config_item_name(&dev->group.cg_item)) {
  1943			/* Use configfs dir name as the device name */
  1944			snprintf(nullb->disk_name, sizeof(nullb->disk_name),
  1945				 "%s", config_item_name(&dev->group.cg_item));
  1946		} else {
  1947			sprintf(nullb->disk_name, "nullb%d", nullb->index);
  1948		}
  1949	
  1950		set_capacity(nullb->disk,
  1951			((sector_t)nullb->dev->size * SZ_1M) >> SECTOR_SHIFT);
  1952		nullb->disk->major = null_major;
  1953		nullb->disk->first_minor = nullb->index;
  1954		nullb->disk->minors = 1;
  1955		nullb->disk->fops = &null_ops;
  1956		nullb->disk->private_data = nullb;
  1957		strscpy_pad(nullb->disk->disk_name, nullb->disk_name, DISK_NAME_LEN);
  1958	
  1959		if (nullb->dev->zoned) {
  1960			rv = null_register_zoned_dev(nullb);
  1961			if (rv)
  1962				goto out_ida_free;
  1963		}
  1964	
  1965		rv = add_disk(nullb->disk);
  1966		if (rv)
  1967			goto out_ida_free;
  1968	
  1969		mutex_lock(&lock);
  1970		list_add_tail(&nullb->list, &nullb_list);
  1971		mutex_unlock(&lock);
  1972	
  1973		pr_info("disk %s created\n", nullb->disk_name);
  1974	
  1975		return 0;
  1976	
  1977	out_ida_free:
  1978		ida_free(&nullb_indexes, nullb->index);
  1979	out_cleanup_disk:
  1980		put_disk(nullb->disk);
  1981	out_cleanup_zone:
  1982		null_free_zoned_dev(dev);
  1983	out_cleanup_tags:
  1984		if (nullb->tag_set == &nullb->__tag_set)
  1985			blk_mq_free_tag_set(nullb->tag_set);
  1986	out_cleanup_queues:
  1987		kfree(nullb->queues);
  1988	out_free_nullb:
  1989		kfree(nullb);
  1990		dev->nullb = NULL;
  1991	out:
  1992		return rv;
  1993	}
  1994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
