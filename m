Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F4F12FB2D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719997681; cv=none; b=lAT01JgGwiuMM0C3doLXKaEMtboDnK6X25PLMvwWu9myRnWJZVMDL1cXgVQgKNnJGcE63w/cSI7Vkjr/FLVFF77tXCFhr40ttA7k5lbXFVDyak3SW4xoqeM31FsHMuRW7mGkGSc+2mPouvYSZmLB73KseeJuKjjreHIjiRQf5Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719997681; c=relaxed/simple;
	bh=GM9Gi4rAOyebS/YBxhDe8AQrM7TNsspnnkIbWgnS+fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP5j0s1oL9QRGrf3sw2WCIkUYrf021INOdSOKSLbcyZKJhGtc3a/3av/dxP1rfL6VYnTGFZ+5UZRrgSgA6QL50l1bk2oyAAUmlL5rKGi4gi8JrbDuMOmjWsFoy/ISHB5pLM3gNKscV6GhmvOHmQaTOJjlV2G6dsRc2BfqfAn8k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwQ8yyWs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwQ8yyWs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719997679; x=1751533679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GM9Gi4rAOyebS/YBxhDe8AQrM7TNsspnnkIbWgnS+fM=;
  b=gwQ8yyWsdVytRc/muFkVIwIuTGDNyll9P5NWoMKexaC8r7ZIhtvJw+dY
   uj11eZKifpA85vRE7CTH6reddHqUxZxrRp1QGiD/gugqUKIOaOOfyRvsG
   oMiwa7qTiz9ZgDFjbxG4rjx1+R0pg/P8MIu4Wxp/5IIlUGwi1hHRsHeQA
   1B6FL3ZlkvvsNvs0LpvdM+GDOvsRTNS9ZaB10p51bLr70KejcwEZOHfmt
   CebmRJ/Y6eO/ELWp/oqX6pfneLW8KOPacdrtUuG6sDjprr0SKKVau0HEr
   Rj4AmxFGXklRYsxM0FkoBTdBKd9D4OkCKpr1M45r35qwn7WTtNCVbuKrl
   A==;
X-CSE-ConnectionGUID: S6zNzjQlSG2nGydMvtFFxw==
X-CSE-MsgGUID: Oo82bq41QrKTkTuya0ya5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20120099"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="20120099"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 02:07:58 -0700
X-CSE-ConnectionGUID: E00roestRF+FZ9F9nC3uFQ==
X-CSE-MsgGUID: cmUW5ECvQAa0Vh0BDhqgNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="50503252"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jul 2024 02:07:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOvxy-000PZO-2d;
	Wed, 03 Jul 2024 09:07:54 +0000
Date: Wed, 3 Jul 2024 17:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 9442/10451]
 drivers/platform/cznic/turris-omnia-mcu-gpio.c:1027:10: error: no member
 named 'of_gpio_n_cells' in 'struct gpio_chip'
Message-ID: <202407031646.trNSwajF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: dfa556e45ae9ecc199e598222debc8f1883a7cce [9442/10451] platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
config: s390-randconfig-r054-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031646.trNSwajF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031646.trNSwajF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031646.trNSwajF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/cznic/turris-omnia-mcu-gpio.c:13:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/platform/cznic/turris-omnia-mcu-gpio.c:16:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/platform/cznic/turris-omnia-mcu-gpio.c:16:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/platform/cznic/turris-omnia-mcu-gpio.c:16:
   In file included from include/linux/gpio/driver.h:8:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/platform/cznic/turris-omnia-mcu-gpio.c:1027:10: error: no member named 'of_gpio_n_cells' in 'struct gpio_chip'
    1027 |         mcu->gc.of_gpio_n_cells = 3;
         |         ~~~~~~~ ^
>> drivers/platform/cznic/turris-omnia-mcu-gpio.c:1028:10: error: no member named 'of_xlate' in 'struct gpio_chip'
    1028 |         mcu->gc.of_xlate = omnia_gpio_of_xlate;
         |         ~~~~~~~ ^
   13 warnings and 2 errors generated.


vim +1027 drivers/platform/cznic/turris-omnia-mcu-gpio.c

   999	
  1000	int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
  1001	{
  1002		bool new_api = mcu->features & OMNIA_FEAT_NEW_INT_API;
  1003		struct device *dev = &mcu->client->dev;
  1004		unsigned long irqflags;
  1005		int err;
  1006	
  1007		err = devm_mutex_init(dev, &mcu->lock);
  1008		if (err)
  1009			return err;
  1010	
  1011		mcu->gc.request = omnia_gpio_request;
  1012		mcu->gc.get_direction = omnia_gpio_get_direction;
  1013		mcu->gc.direction_input = omnia_gpio_direction_input;
  1014		mcu->gc.direction_output = omnia_gpio_direction_output;
  1015		mcu->gc.get = omnia_gpio_get;
  1016		mcu->gc.get_multiple = omnia_gpio_get_multiple;
  1017		mcu->gc.set = omnia_gpio_set;
  1018		mcu->gc.set_multiple = omnia_gpio_set_multiple;
  1019		mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
  1020		mcu->gc.can_sleep = true;
  1021		mcu->gc.names = omnia_mcu_gpio_templates;
  1022		mcu->gc.base = -1;
  1023		mcu->gc.ngpio = ARRAY_SIZE(omnia_gpios);
  1024		mcu->gc.label = "Turris Omnia MCU GPIOs";
  1025		mcu->gc.parent = dev;
  1026		mcu->gc.owner = THIS_MODULE;
> 1027		mcu->gc.of_gpio_n_cells = 3;
> 1028		mcu->gc.of_xlate = omnia_gpio_of_xlate;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
