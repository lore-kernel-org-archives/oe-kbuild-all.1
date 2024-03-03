Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D216EC3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709427668; cv=none; b=G4P6DOym3Gzo9EYW6GIW/+/aKWhgbPaB8yNxRJsnRO24LNBOJiMUpprgM3BWgiw32Z+xfngyGPehGJ+2OIgo5p97f1ZyR3WD0onW6i1YqEML83DfT+tz7ZdjM6AP3rskQ8ftxhc9gO1Lma2t30NxAMfK4opgxZuPMyb4M1XQXMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709427668; c=relaxed/simple;
	bh=p5WK5G3iLfVUAk6o7xGl9nGosm2sQl3yFrjpc6veTbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QceWoTGRjpOjH2Qn7qUBgIvwBnSKz9wHRj0o6SHzKVwOk+tTT/JcLMdAh/N6fQ9uxzI/RzqEH37e0tHv4h96SID4xd3AuUhjM0tyMdZECBNJiumGthXSh3i7uPypVDhO2nWSH7jFdDruKrs5UTZ4D9U/6uEpiFLrMdo+Km066Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIIQtv5B; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIIQtv5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709427666; x=1740963666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p5WK5G3iLfVUAk6o7xGl9nGosm2sQl3yFrjpc6veTbw=;
  b=CIIQtv5B3p/jM9tbnXtrMpa2gTQuAZwm3QOa6qMwITLTtfXVSTVP5b6+
   NdlbCleg1Fc2q/rNr6e6Kc0Aw3l2kwjNy5Aovzwq/5lRX1nb/PIuT/N7l
   Kdx+a5j44PNUXuxoM5rw1O2IZfQPc2ld9St2qREgCqFdTX0VAK5/i2lOP
   v0Un95N492/AE48/tNNw59sgJh+4znwe20QwErYBXG99RPvvcpwPMgrmE
   zPhGRGK9rXsDYkQnM4AdYmrOEVtRZXdjnqxYCdWJz10UrSkTLoKfNdL5E
   vkZ6O7Zs7n0gfmB5IWxcfbtqiqDgUMSGM6rt213bf+ql6DDoUxkdPc6eL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="3834302"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="3834302"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 17:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8969514"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Mar 2024 17:01:05 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgaDu-0000PQ-0W;
	Sun, 03 Mar 2024 01:01:02 +0000
Date: Sun, 3 Mar 2024 09:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.7/zen-sauce 2/31] include/linux/vmstat.h:522:36: error:
 arithmetic between different enumeration types ('enum node_stat_item' and
 'enum lru_list')
Message-ID: <202403030841.n2sQQVg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.7/zen-sauce
head:   01ffb5c93fff64050b2eda359d20f812f62c91c3
commit: 5442bc6cb8f83242249c741205276ef3b1545e37 [2/31] ZEN: Add VHBA driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403030841.n2sQQVg1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030841.n2sQQVg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403030841.n2sQQVg1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2177:
>> include/linux/vmstat.h:522:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/scsi/vhba/vhba.c:27:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
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


vim +522 include/linux/vmstat.h

9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  519  
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  520  static inline const char *lru_list_name(enum lru_list lru)
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  521  {
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04 @522  	return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  523  }
9d7ea9a297e644 Konstantin Khlebnikov 2019-12-04  524  

:::::: The code at line 522 was first introduced by commit
:::::: 9d7ea9a297e6445d567056f15b469dde13ca4134 mm/vmstat: add helpers to get vmstat item names for each enum type

:::::: TO: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
