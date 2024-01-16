Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BFA7F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 02:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cm1Mm9di"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705372446; x=1736908446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YrtcAvIf5zE61PznE1jKZznCKSFUeiETtaAq6whkQ4w=;
  b=cm1Mm9di66tPHOXZxt+JWjGydavWHSfVto2XFh9t+GcrtQ+DigZlzqAw
   t34GE5iOoAVHqrF+hi5sLo1kzPYrvtjIk+MVcetgnErNcKaTRtvONNC1Z
   Y/ta+VukjIgxQq7pr6pVhDndEtSPyS1cIBMp/+Qvk0UCAtbiS+ZhIfCu0
   bIcvWYhy4N8wf+5okeQJEvhMq/roB5IHTslneM7DsqelsUrIPuqnu+gGw
   TKZVnA2Xwu8f4pO0LKTPryzaopfWhHfXldDs2jcrxopIaR8kzi08pa+4F
   6OWyxc4ljkwlGSqXOsF9Mc/O1jVPfz5vL+v1FYgvEITe+f+dZmCnrC6BG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="13230580"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="13230580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; 
   d="scan'208";a="32293406"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Jan 2024 18:34:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPZH5-000CuU-0E;
	Tue, 16 Jan 2024 02:33:59 +0000
Date: Tue, 16 Jan 2024 10:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 2/31] include/asm-generic/io.h:547:31: error:
 performing pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202401161033.S3ZcBUg3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   4deded679db72f26a78e8134688c20f9289367df
commit: 98c9b99c3d9351380be5a9660f7d64c3cd9aec38 [2/31] ZEN: Add VHBA driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240116/202401161033.S3ZcBUg3-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401161033.S3ZcBUg3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401161033.S3ZcBUg3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
>> include/asm-generic/io.h:547:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/scsi/vhba/vhba.c:145:6: error: no previous prototype for function 'devnum_to_bus_and_id' [-Werror,-Wmissing-prototypes]
     145 | void devnum_to_bus_and_id(unsigned int devnum, unsigned int *bus, unsigned int *id)
         |      ^
   drivers/scsi/vhba/vhba.c:145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     145 | void devnum_to_bus_and_id(unsigned int devnum, unsigned int *bus, unsigned int *id)
         | ^
         | static 
   drivers/scsi/vhba/vhba.c:151:14: error: no previous prototype for function 'bus_and_id_to_devnum' [-Werror,-Wmissing-prototypes]
     151 | unsigned int bus_and_id_to_devnum(unsigned int bus, unsigned int id)
         |              ^
   drivers/scsi/vhba/vhba.c:151:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     151 | unsigned int bus_and_id_to_devnum(unsigned int bus, unsigned int id)
         | ^
         | static 
   drivers/scsi/vhba/vhba.c:156:21: error: no previous prototype for function 'vhba_device_alloc' [-Werror,-Wmissing-prototypes]
     156 | struct vhba_device *vhba_device_alloc (void)
         |                     ^
   drivers/scsi/vhba/vhba.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     156 | struct vhba_device *vhba_device_alloc (void)
         | ^
         | static 
   drivers/scsi/vhba/vhba.c:176:6: error: no previous prototype for function 'vhba_device_put' [-Werror,-Wmissing-prototypes]
     176 | void vhba_device_put (struct vhba_device *vdev)
         |      ^
   drivers/scsi/vhba/vhba.c:176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     176 | void vhba_device_put (struct vhba_device *vdev)
         | ^
         | static 
   drivers/scsi/vhba/vhba.c:183:21: error: no previous prototype for function 'vhba_device_get' [-Werror,-Wmissing-prototypes]
     183 | struct vhba_device *vhba_device_get (struct vhba_device *vdev)
         |                     ^
   drivers/scsi/vhba/vhba.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     183 | struct vhba_device *vhba_device_get (struct vhba_device *vdev)
         | ^
         | static 
   drivers/scsi/vhba/vhba.c:192:23: error: variable 'vhost' set but not used [-Werror,-Wunused-but-set-variable]
     192 |     struct vhba_host *vhost;
         |                       ^
   drivers/scsi/vhba/vhba.c:190:5: error: no previous prototype for function 'vhba_device_queue' [-Werror,-Wmissing-prototypes]
     190 | int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         |     ^
   drivers/scsi/vhba/vhba.c:190:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     190 | int vhba_device_queue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         | ^
         | static 
   drivers/scsi/vhba/vhba.c:219:5: error: no previous prototype for function 'vhba_device_dequeue' [-Werror,-Wmissing-prototypes]
     219 | int vhba_device_dequeue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         |     ^
   drivers/scsi/vhba/vhba.c:219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     219 | int vhba_device_dequeue (struct vhba_device *vdev, struct scsi_cmnd *cmd)
         | ^
         | static 
   drivers/scsi/vhba/vhba.c:274:6: error: no previous prototype for function 'vhba_scan_devices_add' [-Werror,-Wmissing-prototypes]
     274 | void vhba_scan_devices_add (struct vhba_host *vhost, int bus, int id)
         |      ^
   drivers/scsi/vhba/vhba.c:274:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     274 | void vhba_scan_devices_add (struct vhba_host *vhost, int bus, int id)
         | ^
         | static 
   drivers/scsi/vhba/vhba.c:287:6: error: no previous prototype for function 'vhba_scan_devices_remove' [-Werror,-Wmissing-prototypes]
     287 | void vhba_scan_devices_remove (struct vhba_host *vhost, int bus, int id)


vim +547 include/asm-generic/io.h

3f7e212df82ca0 Arnd Bergmann  2009-05-13  533  
9216efafc52ff9 Thierry Reding 2014-10-01  534  /*
9216efafc52ff9 Thierry Reding 2014-10-01  535   * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
9216efafc52ff9 Thierry Reding 2014-10-01  536   * implemented on hardware that needs an additional delay for I/O accesses to
9216efafc52ff9 Thierry Reding 2014-10-01  537   * take effect.
9216efafc52ff9 Thierry Reding 2014-10-01  538   */
9216efafc52ff9 Thierry Reding 2014-10-01  539  
f009c89df79abe John Garry     2020-03-28  540  #if !defined(inb) && !defined(_inb)
f009c89df79abe John Garry     2020-03-28  541  #define _inb _inb
214ba3584b2e2c Stafford Horne 2020-07-26  542  static inline u8 _inb(unsigned long addr)
9216efafc52ff9 Thierry Reding 2014-10-01  543  {
87fe2d543f8173 Sinan Kaya     2018-04-05  544  	u8 val;
87fe2d543f8173 Sinan Kaya     2018-04-05  545  
87fe2d543f8173 Sinan Kaya     2018-04-05  546  	__io_pbr();
87fe2d543f8173 Sinan Kaya     2018-04-05 @547  	val = __raw_readb(PCI_IOBASE + addr);
abbbbc83a210e9 Will Deacon    2019-02-22  548  	__io_par(val);
87fe2d543f8173 Sinan Kaya     2018-04-05  549  	return val;
9216efafc52ff9 Thierry Reding 2014-10-01  550  }
9216efafc52ff9 Thierry Reding 2014-10-01  551  #endif
9216efafc52ff9 Thierry Reding 2014-10-01  552  

:::::: The code at line 547 was first introduced by commit
:::::: 87fe2d543f817300e13f0ea683f38c122737856e io: change inX() to have their own IO barrier overrides

:::::: TO: Sinan Kaya <okaya@codeaurora.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
