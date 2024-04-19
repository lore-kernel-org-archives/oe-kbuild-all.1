Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CED41C66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 13:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713533042; cv=none; b=Bahmv7GvMyOvO3EOrWp9qwOhtWVeKIwXEnLpp5ugFZredpJ4AU0VTYW/nh4O8riFo0p5J4eiDDFEErRtFDj+cTMc0BZJRjNy9aEg5gHHCsk9CsJVSU9KW7PpNMbwgxbCNXF68m1luc2LlGFlthZJHFVPXtNuA12Gp2+wxd/FGrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713533042; c=relaxed/simple;
	bh=r7/HkqSprxsLbYkKl78JdPK/HnaD4hudWwV9JY4Z6B8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LlkKJE0lgxwZ0YmJwKIbtfjKFG29W53NJqWZvVRlBoCdyoqcYCfLcTC6OKy7qOQW84tCS0vj12awOcuO27pUFUUz1oxWt7KQNzWF7eNADEbFFcudEKqsGp0ChOndCBvA/URMZhA/fn/opFkchy3bSiwhA3Y6r8R8bCXgHaCRw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKZRKIv4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKZRKIv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713533040; x=1745069040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7/HkqSprxsLbYkKl78JdPK/HnaD4hudWwV9JY4Z6B8=;
  b=QKZRKIv4DAQdIApDNj9Zov6sCIY1ZJVko/jPOzwho98TudDzPMw3oCOz
   lKBT6HNA3dpTXyuHzyGjG5o5y0UNIeUQ6gteLo8nIDi4H6onHSZIwZtAP
   +Mm0WKrQokUhK7MImPxoFVW9TFVA6PSDhvucHqQ9IRoTIyj5peUG0jNUk
   Jx948UAyw6PaPgc4QAUGuo2kO+4qmAX475QZ6Q7sN5j/ioju6mt+NVeCQ
   POjZod25CsKxeimf2/UfIVP7acOpKF/H56o+TRGBmgOac4dxjWRD+oJtW
   +Fn2nvYg7oU5aFtUwi4NNaPeU7wnIO8vt8af3/ydguxvvfFdkFBtt7vpk
   g==;
X-CSE-ConnectionGUID: cAi7oGZ/SliiYlvzEz8a8g==
X-CSE-MsgGUID: 4eVmpL4MRFWGrkyVyArwZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9246928"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9246928"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 06:23:59 -0700
X-CSE-ConnectionGUID: sQTJCi0vT1Cx8kfS4PH/lw==
X-CSE-MsgGUID: zMJfh8pOTTSImzQBbOF+Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23361052"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Apr 2024 06:23:56 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxoDb-000AAG-1G;
	Fri, 19 Apr 2024 13:23:55 +0000
Date: Fri, 19 Apr 2024 21:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4300/18115]
 drivers/net/ethernet/freescale/fman/mac.c:502:36: warning: unused variable
 'mac_acpi_match'
Message-ID: <202404192120.LfWzSK6i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 9eddcd885aeb305820f06e648271f50ceb6b1db3 [4300/18115] fsl/fman: add MAC ACPI support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240419/202404192120.LfWzSK6i-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240419/202404192120.LfWzSK6i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404192120.LfWzSK6i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/freescale/fman/mac.c:12:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/freescale/fman/mac.c:12:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/net/ethernet/freescale/fman/mac.c:12:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/freescale/fman/mac.c:14:
   In file included from include/linux/of_net.h:9:
   In file included from include/linux/phy.h:16:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/netlink.h:7:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:1748:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   drivers/net/ethernet/freescale/fman/mac.c:359:13: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     358 |         dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
         |                                              ~~~~
         |                                              %x
     359 |                 __func__, mac_dev->res->start, resource_size(mac_dev->res));
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
     273 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/net/ethernet/freescale/fman/mac.c:359:34: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
     358 |         dev_dbg(dev, "MAC : %s : IORESOURCE [%llx] size [%llx]\n",
         |                                                          ~~~~
         |                                                          %x
     359 |                 __func__, mac_dev->res->start, resource_size(mac_dev->res));
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:273:19: note: expanded from macro 'dynamic_dev_dbg'
     273 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
     247 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
>> drivers/net/ethernet/freescale/fman/mac.c:502:36: warning: unused variable 'mac_acpi_match' [-Wunused-const-variable]
     502 | static const struct acpi_device_id mac_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~
   10 warnings generated.


vim +/mac_acpi_match +502 drivers/net/ethernet/freescale/fman/mac.c

   501	
 > 502	static const struct acpi_device_id mac_acpi_match[] = {
   503		{ .id = "NXP0025",
   504		  .driver_data = (kernel_ulong_t)memac_initialization },
   505		{},
   506	};
   507	MODULE_DEVICE_TABLE(acpi, mac_acpi_match);
   508	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
