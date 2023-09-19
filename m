Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512A4374ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695132383; x=1726668383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UqrwduPl8f9EKYWDRCS6PJ+u8b5KxhrEjyOJZPW8uNM=;
  b=NfJjfSJUJE1KM+vAbfSSwT6sRHjyZ6/ZagSLLkAxzifbVOglbefacQo8
   hq/wRIsIH/83yaaR0dCRbsBy0ZMeIIfLpWI2hbaONUFUSyt4sRCr9Ayrv
   5n4zPvNh5dCSYQCL5epDhQoFkIDES94d5NqB9HFl2/W1eo8Z/NFJcwGiX
   8L/+uCG2bvRuM/oJ8s2AA7duivqeqiUKDuZ5aUevPRugqUBQ9xfdP6qeQ
   oZccAPVwL4TIUCAmoiU0wa2U92kZRZqAB386RQ4oAA7gp/9jnh8gGDP/1
   CN0pxvgHTG7zOJ89/FNg0kEWqCqzdWBgIA+pfmJzDaWBRrwOkHB5kMNA+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="370265674"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="370265674"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="889510973"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="889510973"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2023 07:05:31 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qibMk-0007Qe-2t;
	Tue, 19 Sep 2023 14:06:14 +0000
Date: Tue, 19 Sep 2023 22:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pfcp /15] include/linux/bitmap.h:614:12: warning: array
 subscript [2, 288230376151711743] is outside array bounds of 'long unsigned
 int[1]'
Message-ID: <202309192102.IbPhVSJj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pfcp
head:   b963c50bbf48f78bf5dd0750b9e11a2b64536356
commit: 305dd2e2a8739070f378d87ee0c2871e42d80d3c [/15] bitmap: extend bitmap_{get,set}_value8() to bitmap_{get,set}_bits()
config: arm64-randconfig-003-20230919 (https://download.01.org/0day-ci/archive/20230919/202309192102.IbPhVSJj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192102.IbPhVSJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192102.IbPhVSJj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/irq.h:14,
                    from include/linux/irqchip/chained_irq.h:10,
                    from include/linux/gpio/driver.h:6,
                    from drivers/pinctrl/pinctrl-keembay.c:6:
   In function 'bitmap_set_bits',
       inlined from 'keembay_gpio_set_irq' at drivers/pinctrl/pinctrl-keembay.c:1348:2,
       inlined from 'keembay_gpio_irq_enable' at drivers/pinctrl/pinctrl-keembay.c:1380:2:
>> include/linux/bitmap.h:614:12: warning: array subscript [2, 288230376151711743] is outside array bounds of 'long unsigned int[1]' [-Warray-bounds=]
     614 |         map[index] &= ~(mask << offset);
         |         ~~~^~~~~~~
   drivers/pinctrl/pinctrl-keembay.c: In function 'keembay_gpio_irq_enable':
   drivers/pinctrl/pinctrl-keembay.c:1344:30: note: at offset [16, 2305843009213693944] into object 'reg' of size 8
    1344 |         unsigned long flags, reg;
         |                              ^~~
   In function 'bitmap_set_bits',
       inlined from 'keembay_gpio_set_irq' at drivers/pinctrl/pinctrl-keembay.c:1348:2,
       inlined from 'keembay_gpio_irq_enable' at drivers/pinctrl/pinctrl-keembay.c:1380:2:
   include/linux/bitmap.h:615:20: warning: array subscript [2, 288230376151711743] is outside array bounds of 'long unsigned int[1]' [-Warray-bounds=]
     615 |         map[index] |= (value & mask) << offset;
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pinctrl/pinctrl-keembay.c: In function 'keembay_gpio_irq_enable':
   drivers/pinctrl/pinctrl-keembay.c:1344:30: note: at offset [16, 2305843009213693944] into object 'reg' of size 8
    1344 |         unsigned long flags, reg;
         |                              ^~~


vim +614 include/linux/bitmap.h

   592	
   593	/**
   594	 * bitmap_set_bits - set a @len-bit value within a memory region
   595	 * @map: address to the bitmap memory region
   596	 * @start: bit offset of the value
   597	 * @len: bit width of the value
   598	 * @value: new value to set
   599	 *
   600	 * Replaces the @len-bit value located at the @start bit offset within the @src
   601	 * memory region with the new @value. The value can't cross ``BITS_PER_LONG``
   602	 * boundary.
   603	 */
   604	static inline void bitmap_set_bits(unsigned long *map, unsigned long start,
   605					   size_t len, unsigned long value)
   606	{
   607		const size_t index = BIT_WORD(start);
   608		const unsigned long offset = start % BITS_PER_LONG;
   609		unsigned long mask = GENMASK(len - 1, 0);
   610	
   611		if (WARN_ON_ONCE(offset + len > BITS_PER_LONG))
   612			return;
   613	
 > 614		map[index] &= ~(mask << offset);
   615		map[index] |= (value & mask) << offset;
   616	}
   617	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
