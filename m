Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496AF17C7F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 17:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708881630; cv=none; b=oiFaTSHOgV5E1QOoPZ3pfrUTS0owzwBIoMZVj7pok4APN1/g6FTC8cYuR5GxigYA0MNLbbhR8FRMlVCEAmPMQSo6vsZHgnM4SjdFj4ZUUFwiga19+5TwA0xs4cOMKkvRcI0rK1QDvhExaD2LZV1IUotTtpQXqr6XuLMgP+igqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708881630; c=relaxed/simple;
	bh=5BU9nwF0cBkNUCzRYOHjTZa9oaBIBsCc8NeQBh9Ykjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjB6GxNHmz2odm3CMamsAASRLIZ8r2pB/QeDUPSfKz2ISaccMVXiDtqzyT2AugOOFyg3EjGCdedvN+V4x2Jrn3dO40GP+3XZCE0aIqdY/p9z3QlDVIvKf9qrqjYU/jFWlNeWzSh2tm5vuszxdhRbo5lOKmKcVe9RgXD8ExL4JDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/9O0y8P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/9O0y8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708881628; x=1740417628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5BU9nwF0cBkNUCzRYOHjTZa9oaBIBsCc8NeQBh9Ykjg=;
  b=U/9O0y8PK1p0Cw5NQMHa2ZGC+lC85Xwalpt1G+HzHU8ZLot1RTwtKQfs
   fXppqKf32IiDmIGt4RJ7iwLkPuoX0hGRrYS3RmXk2kKf1rlUuUX0yFTla
   YDdycnxbQRESx22unt75bkO/uOsowHox8o/ugQt1pkYX0naZBN2EIlVYI
   Ox9vLJ47neMh2yJ1h9R9KBqRz0VbItxe3wuOwR5rcMQQEDm9RAW6QoZVZ
   7ikqojND7yl0IT8svngNaI8MaA+HOxyONSqaM8tUTEXhh6+FISvmH+Scs
   O3SkkVntyeW7Izkob7/AjFNYD7BSr3zWNwaH20lzfZpu1sMcnUqeyEW2J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3283566"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3283566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 09:20:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="37230263"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Feb 2024 09:20:26 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reIAq-0009ge-0q;
	Sun, 25 Feb 2024 17:20:24 +0000
Date: Mon, 26 Feb 2024 01:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:drbd-blk-limits 5/16] drivers/md/raid0.c:396:7: warning:
 variable 'conf' is uninitialized when used here
Message-ID: <202402260107.fb5L5XSm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git drbd-blk-limits
head:   952f67c787298e616a8aa5acc3f881d267e6c7b5
commit: c3361ed114ad32d50e622fdf1e3f27d4a1dde8fb [5/16] md/raid0: use the atomic queue limit update APIs
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240226/202402260107.fb5L5XSm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402260107.fb5L5XSm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402260107.fb5L5XSm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/raid0.c:17:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/md/raid0.c:17:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/md/raid0.c:17:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/md/raid0.c:396:7: warning: variable 'conf' is uninitialized when used here [-Wuninitialized]
     396 |         if (!conf) {
         |              ^~~~
   drivers/md/raid0.c:385:21: note: initialize the variable 'conf' to silence this warning
     385 |         struct r0conf *conf;
         |                            ^
         |                             = NULL
   13 warnings generated.


vim +/conf +396 drivers/md/raid0.c

   381	
   382	static int raid0_run(struct mddev *mddev)
   383	{
   384		struct queue_limits lim;
   385		struct r0conf *conf;
   386		int ret;
   387	
   388		if (mddev->chunk_sectors == 0) {
   389			pr_warn("md/raid0:%s: chunk size must be set.\n", mdname(mddev));
   390			return -EINVAL;
   391		}
   392		if (md_check_no_bitmap(mddev))
   393			return -EINVAL;
   394	
   395		/* if conf is not null, we are here after takeover */
 > 396		if (!conf) {
   397			ret = create_strip_zones(mddev, &conf);
   398			if (ret < 0)
   399				return ret;
   400			mddev->private = conf;
   401		}
   402	
   403		blk_set_stacking_limits(&lim);
   404		lim.max_hw_sectors = mddev->chunk_sectors;
   405		lim.max_write_zeroes_sectors = mddev->chunk_sectors;
   406		lim.io_min = mddev->chunk_sectors << 9;
   407		lim.io_opt = lim.io_min * mddev->raid_disks;
   408		mddev_stack_rdev_limits(mddev, &lim);
   409		ret = queue_limits_set(mddev->queue, &lim);
   410		if (ret)
   411			goto out_free_conf;
   412	
   413		/* calculate array device size */
   414		md_set_array_sectors(mddev, raid0_size(mddev, 0, 0));
   415	
   416		pr_debug("md/raid0:%s: md_size is %llu sectors.\n",
   417			 mdname(mddev),
   418			 (unsigned long long)mddev->array_sectors);
   419	
   420		dump_zones(mddev);
   421	
   422		ret = md_integrity_register(mddev);
   423		if (ret)
   424			goto out_free_conf;
   425		return 0;
   426	out_free_conf:
   427		free_conf(mddev, conf);
   428		return ret;
   429	}
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
