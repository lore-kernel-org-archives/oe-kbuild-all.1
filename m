Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6201183098
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739777342; cv=none; b=O+gkbjh34S69RdcupV9O5q2A5OiugfX1AeUsr0o4De+920fEl3XzXOHUlxifqFvpjpYPCpLm0HOF7ZKq/++6KhvjG8+LtDPo8qP/zYITMByYM24/FGcbwuBmBPoY7fB8IRgDindbdKJLPF8Gqu4VINkrmRr1FfqOYzOX4s4NiW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739777342; c=relaxed/simple;
	bh=HHRNYG6tutyT40b/l/lUdTF2NI0A5HBc+SIeFUKEGGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J90Ga7xf4lSiyDQ17w/z4GxQ/EJa6xOeRRD3iDobHeZGNaC1MjjjcJYZ0BnX40AdZX6Ei+u4X9sNuqhQMJbSVNlVGj+fN1lsPpJMNYKvlPAo6vq7hBo+TDj9VtIvt3bftI/kCJ3fjaS4foEkXlbxp7YEG3uQ6Y4/9EBqDitPlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2QX5f9c; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2QX5f9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739777340; x=1771313340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHRNYG6tutyT40b/l/lUdTF2NI0A5HBc+SIeFUKEGGE=;
  b=B2QX5f9c88hPyhHOHQgmwQlkg+51dZRbW66Hifzi/2KzQsdZqQr/m0x0
   MmQO90feH1TiXGzhuK5bMCw1HTP5QURT/rzHoGl+caMqm+REal3QwI9a9
   Z1ff3tbUS4ghDFpbs1ZcP5kkofR1/WJ0hCfsRCTLxVC5i0e3oiASe+igU
   HxL9wKrcnNUpYszz7oPieal8EJ+s7a2aXhLPzME+fyelCobBOsqp0e0L+
   QOIVZJzdaoko0qkWCBtXgPJ/9Hfxc1z2h2IK949bmXA6C3IAtgrkToPe0
   tr4qfKp67ctgZqmyMhXlsPXvQ2q1JQswkmeNO+HWKNSJoSmrsabDSPa+m
   w==;
X-CSE-ConnectionGUID: haAfXfJ6Tye2pcgK5eFQww==
X-CSE-MsgGUID: YiTQn7ACQb26cXkb4L1R4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="57856157"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="57856157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 23:29:00 -0800
X-CSE-ConnectionGUID: 2hM3F3noRc6+lZKBNV9B5g==
X-CSE-MsgGUID: n+rtl5DjQl+JmgnSRUILGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; 
   d="scan'208";a="119059423"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Feb 2025 23:28:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjvYl-001Cjj-1x;
	Mon, 17 Feb 2025 07:28:55 +0000
Date: Mon, 17 Feb 2025 15:28:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Shahidan, Muhammad Shahmil" <muhammad.shahmil.shahidan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jianfeng Gao <jianfeng.gao@intel.com>
Subject: [intel-lts:pr/56 1/1] drivers/media/i2c/ar0234.c:2139:13: warning:
 no previous prototype for function 'ar0234_threaded_irq_fn'
Message-ID: <202502171554.oNkLIyQj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Muhammad,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: 423fe4526abc0642f0a2484e41612f550fd6aaf1 [1/1] Updating AR0234 Kconfig
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250217/202502171554.oNkLIyQj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171554.oNkLIyQj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171554.oNkLIyQj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:1756:
   include/linux/vmstat.h:502:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     502 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     503 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:509:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     509 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     510 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:521:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     521 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     522 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:530:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     530 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     531 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/i2c/ar0234.c:10:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
   In file included from drivers/media/i2c/ar0234.c:10:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/media/i2c/ar0234.c:10:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
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
>> drivers/media/i2c/ar0234.c:2139:13: warning: no previous prototype for function 'ar0234_threaded_irq_fn' [-Wmissing-prototypes]
    2139 | irqreturn_t ar0234_threaded_irq_fn(int irq, void *dev_id)
         |             ^
   drivers/media/i2c/ar0234.c:2139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2139 | irqreturn_t ar0234_threaded_irq_fn(int irq, void *dev_id)
         | ^
         | static 
   18 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [m]:
   - DWMAC_INTEL_PLAT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=m] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=m]


vim +/ar0234_threaded_irq_fn +2139 drivers/media/i2c/ar0234.c

f4f573909f4273e zouxiaoh 2023-05-05  2138  
f4f573909f4273e zouxiaoh 2023-05-05 @2139  irqreturn_t ar0234_threaded_irq_fn(int irq, void *dev_id)
f4f573909f4273e zouxiaoh 2023-05-05  2140  {
f4f573909f4273e zouxiaoh 2023-05-05  2141  	struct ar0234 *ar0234 = dev_id;
f4f573909f4273e zouxiaoh 2023-05-05  2142  
f4f573909f4273e zouxiaoh 2023-05-05  2143  	if ((ar0234->platform_data->gpios[0] != -1) && (ar0234->platform_data->irq_pin != -1)) {
f4f573909f4273e zouxiaoh 2023-05-05  2144  		mutex_lock(&ar0234->mutex);
f4f573909f4273e zouxiaoh 2023-05-05  2145  		if (ar0234->streaming == false) {
f4f573909f4273e zouxiaoh 2023-05-05  2146  			gpio_set_value(ar0234->platform_data->gpios[0], 0);
f4f573909f4273e zouxiaoh 2023-05-05  2147  			goto ar0234_irq_handled;
f4f573909f4273e zouxiaoh 2023-05-05  2148  		}
f4f573909f4273e zouxiaoh 2023-05-05  2149  
f4f573909f4273e zouxiaoh 2023-05-05  2150  		if (ar0234->strobe_source->val == V4L2_FLASH_STROBE_SOURCE_EXTERNAL) {
f4f573909f4273e zouxiaoh 2023-05-05  2151  			gpio_set_value(ar0234->platform_data->gpios[0],
f4f573909f4273e zouxiaoh 2023-05-05  2152  					gpio_get_value(ar0234->platform_data->irq_pin));
f4f573909f4273e zouxiaoh 2023-05-05  2153  		}
f4f573909f4273e zouxiaoh 2023-05-05  2154  
f4f573909f4273e zouxiaoh 2023-05-05  2155  ar0234_irq_handled:
f4f573909f4273e zouxiaoh 2023-05-05  2156  		mutex_unlock(&ar0234->mutex);
f4f573909f4273e zouxiaoh 2023-05-05  2157  	}
f4f573909f4273e zouxiaoh 2023-05-05  2158  
f4f573909f4273e zouxiaoh 2023-05-05  2159  	return IRQ_HANDLED;
f4f573909f4273e zouxiaoh 2023-05-05  2160  }
f4f573909f4273e zouxiaoh 2023-05-05  2161  

:::::: The code at line 2139 was first introduced by commit
:::::: f4f573909f4273e27e507e2cd7a6e8913a2c8fc8 add ipu driver for LTS 6.1

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: Pan, Kris <kris.pan@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
