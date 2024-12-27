Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666931F7562
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 15:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735312439; cv=none; b=gSLhyz1smITtECuIz2mVAwg+Gyuh4ikuymc4lQgUBQr3PiI31G47N5MoqXgmhaEu8l+vsISHEf98aLI9fsqDIpfJa/JRT0j1qJtFmubRAibEhG4B3J2H68F5oo6MzMyj9a5HS+ILZzN22eLlBtN16Rp4YOUwP+LMtuWXk8YsQoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735312439; c=relaxed/simple;
	bh=9Aw+EF/tbqHYmDvcLX4ddUxCIrgWU0q9B9qW84Y2y8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JPg4krB6u4Vrxr9z6czMeF3zfmUWIeo9PNWytTBrmrgpdOo66jpc+H/0nUxGz9evPx8b1hOwbZ7uw7yn/O07tY31Z8+PhNCbtmQ29OFGlb1S26vu6/HJIn/wH9KNfIlXL5yVe3ixBYXjGgIHoE1Y/DcK+XiRGlJ9sAQGjLBEzSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gS6UpBzZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gS6UpBzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735312436; x=1766848436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Aw+EF/tbqHYmDvcLX4ddUxCIrgWU0q9B9qW84Y2y8g=;
  b=gS6UpBzZyaJ/ThhA6/QahH4DwzYEdldeRKFlgMzFy0IkEQGixDSK4d9J
   Z6w6ziWZrHXKtiPUB9hrrOxzZ0U8dFyCUkfNCXGM2XVKeKvAWq+gDzoBm
   8Cu8NV0znVuVI+kZAQ9q2iUGUgEtwjbhFWQGiNn6bZFHtlLng+37W42Ao
   wiHF0NhkA9PCagBFHWfQOTrI4+wh8U4Y1aNEc3YmvOmhsdYqM/UT0ki2T
   Za/7sGCmj2hUOF0mXsuZ1m7kBwDtmjEVwHGgm5GIrQt6ktG8xMcPLgfXq
   un53OmTyRGYKDlIY1hfdl4PKTCq+VqEtlaCggfNO+3pjIaJwoLpW2Ypmw
   w==;
X-CSE-ConnectionGUID: X3W2p7OIQgC5OHYdSJczSQ==
X-CSE-MsgGUID: ad6py6y3TNeNMUJPlX6zxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46303235"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="46303235"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 07:13:55 -0800
X-CSE-ConnectionGUID: 2Aa2u93YR6GcnL2u+fbvFQ==
X-CSE-MsgGUID: FpJFtsVdRCOYRcoIG8+1Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="105031990"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Dec 2024 07:13:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRC2C-0003Hm-0e;
	Fri, 27 Dec 2024 15:13:52 +0000
Date: Fri, 27 Dec 2024 23:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: hepengpx <pengpengx.he@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Julian Chen <julian.chen@intel.com>,
	zouxiaoh <xiaohong.zou@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] drivers/media/i2c/ti960-des.c:329:6:
 warning: logical not is only applied to the left hand side of this bitwise
 operator
Message-ID: <202412272330.h2tPJMD2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi hepengpx,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: c7f2087e27ce6a3052f8f9f38b790f2408bcd052 [3/3] driver: media: pci: i2c: support IMX390 on kernel 6.6
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241227/202412272330.h2tPJMD2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272330.h2tPJMD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272330.h2tPJMD2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm.h:2170:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/ti960-des.c:14:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/media/i2c/ti960-des.c:14:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/media/i2c/ti960-des.c:14:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
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
   drivers/media/i2c/ti960-des.c:59:19: error: field has incomplete type 'struct gpio_chip'
      59 |         struct gpio_chip gc;
         |                          ^
   drivers/media/i2c/ti960-des.c:59:9: note: forward declaration of 'struct gpio_chip'
      59 |         struct gpio_chip gc;
         |                ^
   drivers/media/i2c/ti960-des.c:183:5: warning: no previous prototype for function 'bus_switch' [-Wmissing-prototypes]
     183 | int bus_switch(struct ti960 *va)
         |     ^
   drivers/media/i2c/ti960-des.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     183 | int bus_switch(struct ti960 *va)
         | ^
         | static 
>> drivers/media/i2c/ti960-des.c:329:6: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
     329 |         if (!reg_val & TI960_FSIN_ENABLE) {
         |             ^        ~
   drivers/media/i2c/ti960-des.c:329:6: note: add parentheses after the '!' to evaluate the bitwise operator first
     329 |         if (!reg_val & TI960_FSIN_ENABLE) {
         |             ^                           
         |              (                          )
   drivers/media/i2c/ti960-des.c:329:6: note: add parentheses around left hand side expression to silence this warning
     329 |         if (!reg_val & TI960_FSIN_ENABLE) {
         |             ^
         |             (       )
   drivers/media/i2c/ti960-des.c:398:16: warning: unused variable 'va' [-Wunused-variable]
     398 |         struct ti960 *va = to_ti960(sd);
         |                       ^~
   drivers/media/i2c/ti960-des.c:401:7: warning: unused variable 'next_stream' [-Wunused-variable]
     401 |         bool next_stream = false;
         |              ^~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:435:4: error: call to undeclared function 'media_entity_remote_pad'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     435 |                         media_entity_remote_pad(&sd->entity.pads[sink_pad]);
         |                         ^
   drivers/media/i2c/ti960-des.c:435:4: note: did you mean 'media_entity_remove_links'?
   include/media/media-entity.h:857:6: note: 'media_entity_remove_links' declared here
     857 | void media_entity_remove_links(struct media_entity *entity);
         |      ^
   drivers/media/i2c/ti960-des.c:434:21: error: incompatible integer to pointer conversion initializing 'struct media_pad *' with an expression of type 'int' [-Wint-conversion]
     434 |                 struct media_pad *remote_pad =
         |                                   ^
     435 |                         media_entity_remote_pad(&sd->entity.pads[sink_pad]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:430:16: warning: unused variable 'va' [-Wunused-variable]
     430 |         struct ti960 *va = to_ti960(sd);
         |                       ^~
   drivers/media/i2c/ti960-des.c:847:4: error: call to undeclared function 'media_entity_remote_pad'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     847 |                         media_entity_remote_pad(&va->pad[i]);
         |                         ^
   drivers/media/i2c/ti960-des.c:846:21: error: incompatible integer to pointer conversion initializing 'struct media_pad *' with an expression of type 'int' [-Wint-conversion]
     846 |                 struct media_pad *remote_pad =
         |                                   ^
     847 |                         media_entity_remote_pad(&va->pad[i]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:890:6: warning: unused variable 'i' [-Wunused-variable]
     890 |         int i;
         |             ^
   drivers/media/i2c/ti960-des.c:990:4: error: call to undeclared function 'media_entity_remote_pad'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     990 |                         media_entity_remote_pad(&va->pad[i]);
         |                         ^
   drivers/media/i2c/ti960-des.c:989:21: error: incompatible integer to pointer conversion initializing 'struct media_pad *' with an expression of type 'int' [-Wint-conversion]
     989 |                 struct media_pad *remote_pad =
         |                                   ^
     990 |                         media_entity_remote_pad(&va->pad[i]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ti960-des.c:1198:21: warning: unused variable 'client' [-Wunused-variable]
    1198 |         struct i2c_client *client = v4l2_get_subdevdata(&va->sd);
         |                            ^~~~~~
   drivers/media/i2c/ti960-des.c:1364:15: warning: unused variable 'reset_gpio' [-Wunused-variable]
    1364 |         unsigned int reset_gpio = va->pdata->reset_gpio;
         |                      ^~~~~~~~~~
   drivers/media/i2c/ti960-des.c:1424:48: error: incomplete definition of type 'struct gpio_chip'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                                   ~~~~^
   include/linux/i2c.h:355:39: note: expanded from macro 'to_i2c_client'
     355 | #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
         |                                       ^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/media/i2c/ti960-des.c:59:9: note: forward declaration of 'struct gpio_chip'
      59 |         struct gpio_chip gc;
         |                ^
   drivers/media/i2c/ti960-des.c:1424:48: error: incomplete definition of type 'struct gpio_chip'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                                   ~~~~^
   include/linux/i2c.h:355:39: note: expanded from macro 'to_i2c_client'
     355 | #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
         |                                       ^
   include/linux/container_of.h:20:30: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                     ^~~
   include/linux/compiler_types.h:384:63: note: expanded from macro '__same_type'
     384 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   drivers/media/i2c/ti960-des.c:59:9: note: forward declaration of 'struct gpio_chip'
      59 |         struct gpio_chip gc;
         |                ^
   drivers/media/i2c/ti960-des.c:1424:48: error: incomplete definition of type 'struct gpio_chip'
    1424 |         struct i2c_client *client = to_i2c_client(chip->parent);
         |                                                   ~~~~^
   include/linux/i2c.h:355:39: note: expanded from macro 'to_i2c_client'
     355 | #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
         |                                       ^
   include/linux/container_of.h:21:23: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:384:63: note: expanded from macro '__same_type'
     384 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [m]:
   - DWMAC_INTEL_PLAT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=m] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=m]


vim +329 drivers/media/i2c/ti960-des.c

e986ee1ba98444 zouxiaoh 2024-01-18  314  
e986ee1ba98444 zouxiaoh 2024-01-18  315  static int ti960_fsin_gpio_init(struct ti960 *va, unsigned short rx_port,
e986ee1ba98444 zouxiaoh 2024-01-18  316  		unsigned short ser_alias, unsigned short fsin_gpio)
e986ee1ba98444 zouxiaoh 2024-01-18  317  {
e986ee1ba98444 zouxiaoh 2024-01-18  318  	unsigned char gpio_data;
e986ee1ba98444 zouxiaoh 2024-01-18  319  	int rval;
e986ee1ba98444 zouxiaoh 2024-01-18  320  	int reg_val;
e986ee1ba98444 zouxiaoh 2024-01-18  321  
e986ee1ba98444 zouxiaoh 2024-01-18  322  	dev_dbg(va->sd.dev, "%s\n", __func__);
e986ee1ba98444 zouxiaoh 2024-01-18  323  	rval = regmap_read(va->regmap8, TI960_FS_CTL, &reg_val);
e986ee1ba98444 zouxiaoh 2024-01-18  324  	if (rval) {
e986ee1ba98444 zouxiaoh 2024-01-18  325  		dev_dbg(va->sd.dev, "Failed to read gpio status.\n");
e986ee1ba98444 zouxiaoh 2024-01-18  326  		return rval;
e986ee1ba98444 zouxiaoh 2024-01-18  327  	}
e986ee1ba98444 zouxiaoh 2024-01-18  328  
e986ee1ba98444 zouxiaoh 2024-01-18 @329  	if (!reg_val & TI960_FSIN_ENABLE) {
e986ee1ba98444 zouxiaoh 2024-01-18  330  		dev_dbg(va->sd.dev, "FSIN not enabled, skip config FSIN GPIO.\n");
e986ee1ba98444 zouxiaoh 2024-01-18  331  		return 0;
e986ee1ba98444 zouxiaoh 2024-01-18  332  	}
e986ee1ba98444 zouxiaoh 2024-01-18  333  
e986ee1ba98444 zouxiaoh 2024-01-18  334  	rval = ti960_reg_write(va, TI960_RX_PORT_SEL,
e986ee1ba98444 zouxiaoh 2024-01-18  335  		(rx_port << 4) + (1 << rx_port));
e986ee1ba98444 zouxiaoh 2024-01-18  336  	if (rval)
e986ee1ba98444 zouxiaoh 2024-01-18  337  		return rval;
e986ee1ba98444 zouxiaoh 2024-01-18  338  
e986ee1ba98444 zouxiaoh 2024-01-18  339  	switch (fsin_gpio) {
e986ee1ba98444 zouxiaoh 2024-01-18  340  	case 0:
e986ee1ba98444 zouxiaoh 2024-01-18  341  	case 1:
e986ee1ba98444 zouxiaoh 2024-01-18  342  		rval = regmap_read(va->regmap8, TI960_BC_GPIO_CTL0, &reg_val);
e986ee1ba98444 zouxiaoh 2024-01-18  343  		if (rval) {
e986ee1ba98444 zouxiaoh 2024-01-18  344  			dev_dbg(va->sd.dev, "Failed to read gpio status.\n");
e986ee1ba98444 zouxiaoh 2024-01-18  345  			return rval;
e986ee1ba98444 zouxiaoh 2024-01-18  346  		}
e986ee1ba98444 zouxiaoh 2024-01-18  347  
e986ee1ba98444 zouxiaoh 2024-01-18  348  		if (fsin_gpio == 0) {
e986ee1ba98444 zouxiaoh 2024-01-18  349  			reg_val &= ~TI960_GPIO0_MASK;
e986ee1ba98444 zouxiaoh 2024-01-18  350  			reg_val |= TI960_GPIO0_FSIN;
e986ee1ba98444 zouxiaoh 2024-01-18  351  		} else {
e986ee1ba98444 zouxiaoh 2024-01-18  352  			reg_val &= ~TI960_GPIO1_MASK;
e986ee1ba98444 zouxiaoh 2024-01-18  353  			reg_val |= TI960_GPIO1_FSIN;
e986ee1ba98444 zouxiaoh 2024-01-18  354  		}
e986ee1ba98444 zouxiaoh 2024-01-18  355  
e986ee1ba98444 zouxiaoh 2024-01-18  356  		rval = ti960_reg_write(va, TI960_BC_GPIO_CTL0, reg_val);
e986ee1ba98444 zouxiaoh 2024-01-18  357  		if (rval)
e986ee1ba98444 zouxiaoh 2024-01-18  358  			dev_dbg(va->sd.dev, "Failed to set gpio.\n");
e986ee1ba98444 zouxiaoh 2024-01-18  359  		break;
e986ee1ba98444 zouxiaoh 2024-01-18  360  	case 2:
e986ee1ba98444 zouxiaoh 2024-01-18  361  	case 3:
e986ee1ba98444 zouxiaoh 2024-01-18  362  		rval = regmap_read(va->regmap8, TI960_BC_GPIO_CTL1, &reg_val);
e986ee1ba98444 zouxiaoh 2024-01-18  363  		if (rval) {
e986ee1ba98444 zouxiaoh 2024-01-18  364  			dev_dbg(va->sd.dev, "Failed to read gpio status.\n");
e986ee1ba98444 zouxiaoh 2024-01-18  365  			return rval;
e986ee1ba98444 zouxiaoh 2024-01-18  366  		}
e986ee1ba98444 zouxiaoh 2024-01-18  367  
e986ee1ba98444 zouxiaoh 2024-01-18  368  		if (fsin_gpio == 2) {
e986ee1ba98444 zouxiaoh 2024-01-18  369  			reg_val &= ~TI960_GPIO2_MASK;
e986ee1ba98444 zouxiaoh 2024-01-18  370  			reg_val |= TI960_GPIO2_FSIN;
e986ee1ba98444 zouxiaoh 2024-01-18  371  		} else {
e986ee1ba98444 zouxiaoh 2024-01-18  372  			reg_val &= ~TI960_GPIO3_MASK;
e986ee1ba98444 zouxiaoh 2024-01-18  373  			reg_val |= TI960_GPIO3_FSIN;
e986ee1ba98444 zouxiaoh 2024-01-18  374  		}
e986ee1ba98444 zouxiaoh 2024-01-18  375  
e986ee1ba98444 zouxiaoh 2024-01-18  376  		rval = ti960_reg_write(va, TI960_BC_GPIO_CTL1, reg_val);
e986ee1ba98444 zouxiaoh 2024-01-18  377  		if (rval)
e986ee1ba98444 zouxiaoh 2024-01-18  378  			dev_dbg(va->sd.dev, "Failed to set gpio.\n");
e986ee1ba98444 zouxiaoh 2024-01-18  379  		break;
e986ee1ba98444 zouxiaoh 2024-01-18  380  	}
e986ee1ba98444 zouxiaoh 2024-01-18  381  
e986ee1ba98444 zouxiaoh 2024-01-18  382  	/* enable output and remote control */
e986ee1ba98444 zouxiaoh 2024-01-18  383  	ti953_reg_write(&va->sd, rx_port, ser_alias, TI953_GPIO_INPUT_CTRL, TI953_GPIO_OUT_EN);
e986ee1ba98444 zouxiaoh 2024-01-18  384  	rval = ti953_reg_read(&va->sd, rx_port, ser_alias, TI953_LOCAL_GPIO_DATA,
e986ee1ba98444 zouxiaoh 2024-01-18  385  			&gpio_data);
e986ee1ba98444 zouxiaoh 2024-01-18  386  	if (rval)
e986ee1ba98444 zouxiaoh 2024-01-18  387  		return rval;
e986ee1ba98444 zouxiaoh 2024-01-18  388  	ti953_reg_write(&va->sd, rx_port, ser_alias, TI953_LOCAL_GPIO_DATA,
e986ee1ba98444 zouxiaoh 2024-01-18  389  			gpio_data | TI953_GPIO0_RMTEN << fsin_gpio);
e986ee1ba98444 zouxiaoh 2024-01-18  390  
e986ee1ba98444 zouxiaoh 2024-01-18  391  	return rval;
e986ee1ba98444 zouxiaoh 2024-01-18  392  }
e986ee1ba98444 zouxiaoh 2024-01-18  393  

:::::: The code at line 329 was first introduced by commit
:::::: e986ee1ba98444c2b97240478a5b1dda508e0b35 add ipu driver for kernel 6.6

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
