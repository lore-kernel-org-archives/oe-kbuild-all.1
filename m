Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DB2171B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694513845; x=1726049845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bG6C3cCR9oLzGBu8ngw+C0QuziE8skiPhJFq7sSoUxk=;
  b=kf+P6k8rBODaGTbnnB5hdpKdyK/uQsYqSXgckbNHeJ8Nylr911wQKc0P
   +79ckusEWYYtWXdBBZnD2rsAsowz8Y73wjUCTvUe6s4qy28VY8/it+5XH
   xVJyhjURvxSVahsAgYsHG2vwtDrJXYL5BlbQ19gaNlYs95E1RrXGlCGoy
   U4z28fxwL39bmj61hBXgIWu70r5i9ZmovR/AX+nqNKgZHm0Scaa1WOAHb
   66cd3dTY6RbVfUmg5ibUiUqmtJEWWOsdWOX0i63XNSmSz7a75aEg5XoL0
   Wq5aD42EY0RrA92VrsgMYJPLs4a4jKeuqZT9/2zvzHQqCerYu00btXr4+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444769281"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="444769281"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 03:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917383238"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="917383238"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Sep 2023 03:17:23 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg0SP-0000F9-1K;
	Tue, 12 Sep 2023 10:17:21 +0000
Date: Tue, 12 Sep 2023 18:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 9/14] fs/fuse/dev.c:2291:6: warning:
 unused variable 'ret'
Message-ID: <202309121849.TkZ00yIL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   3261f1053434f1126b5b0edc9f1a86e365afdf6a
commit: 3510cbde64cb5a3fabe4cb26221058af38c82a08 [9/14] fuse: implement ioctls to setup inode bound backing files
config: hexagon-randconfig-r022-20230912 (https://download.01.org/0day-ci/archive/20230912/202309121849.TkZ00yIL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121849.TkZ00yIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121849.TkZ00yIL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/fuse/dev.c:9:
   In file included from fs/fuse/fuse_i.h:23:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/fuse/dev.c:9:
   In file included from fs/fuse/fuse_i.h:23:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/fuse/dev.c:9:
   In file included from fs/fuse/fuse_i.h:23:
   In file included from include/linux/backing-dev.h:16:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/fuse/dev.c:2291:6: warning: unused variable 'ret' [-Wunused-variable]
    2291 |         int ret;
         |             ^
   7 warnings generated.


vim +/ret +2291 fs/fuse/dev.c

  2285	
  2286	static long fuse_dev_ioctl_backing(struct file *file, unsigned int cmd,
  2287					   struct fuse_backing_map __user *argp)
  2288	{
  2289		struct fuse_dev *fud = fuse_get_dev(file);
  2290		struct fuse_backing_map map;
> 2291		int ret;
  2292	
  2293		if (!fud)
  2294			return -EINVAL;
  2295	
  2296		if (copy_from_user(&map, argp, sizeof(map)))
  2297			return -EFAULT;
  2298	
  2299		switch (cmd) {
  2300	#ifdef CONFIG_FUSE_PASSTHROUGH
  2301		case FUSE_DEV_IOC_BACKING_OPEN:
  2302			ret = fuse_backing_open(fud->fc, &map);
  2303			if (ret)
  2304				return ret;
  2305	
  2306			if (copy_to_user(argp, &map, sizeof(map)))
  2307				return -EFAULT;
  2308	
  2309			return 0;
  2310	
  2311		case FUSE_DEV_IOC_BACKING_CLOSE:
  2312			return fuse_backing_close(fud->fc, &map);
  2313	#endif
  2314	
  2315		default:
  2316			return -ENOTTY;
  2317		}
  2318	}
  2319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
