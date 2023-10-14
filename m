Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21617F4F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IVnOzz5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697295763; x=1728831763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CNSN3z2BoW/AU7F9ECJuTKqjeejE0gkEKYbDKSdiC6c=;
  b=IVnOzz5CtqMXmaJOxRVjBKMdM6dqwW6QaFkEGmz3taMfddtlc5Qu1p0T
   C0KoyMINFXd4KfXkbDIS5PTFeW6nhPHC+u0SncpZpzlYIWXGrmaYfypr5
   jeckFeFX1ycDGWiPnxqqt7ZHSvIAVAywQXAOJ9Z4xGbfjHpGY1GkbREVC
   vDTnxoDFp06Xh+Y1CUVHXmwxI1OHt+zNHdzlS47ubzyEmIGixNTjeUaph
   QfDK9nEk9EqbQrwRqrBpxwYfc4jZ5tr1M8IDAQ0T5tYEH1hLiKgYF08Yo
   SfAHaj+qGcYee5C4fX0SN/adlKgBQonuWaoZs4AHVB0+4Q5mvRuCThvp8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="3940686"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="3940686"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 08:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002324778"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002324778"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 08:02:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrgA2-0006Hf-1N;
	Sat, 14 Oct 2023 15:02:38 +0000
Date: Sat, 14 Oct 2023 23:02:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3481/15768]
 drivers/staging/ethosu/ethosu_buffer.c:108:30: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 4 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202310142244.IWkg2ZQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alison,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 95ce4103b59b6af5d3c264fc137f9dd174e78d3e [3481/15768] npu: ethosu: Add Arm ethos-u driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310142244.IWkg2ZQT-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310142244.IWkg2ZQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310142244.IWkg2ZQT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:566,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/kref.h:16,
                    from drivers/staging/ethosu/ethosu_buffer.h:28,
                    from drivers/staging/ethosu/ethosu_buffer.c:25:
   drivers/staging/ethosu/ethosu_buffer.c: In function 'ethosu_buffer_dma_ranges':
>> drivers/staging/ethosu/ethosu_buffer.c:108:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/staging/ethosu/ethosu_buffer.c:108:17: note: in expansion of macro 'dev_dbg'
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                 ^~~~~~~
   drivers/staging/ethosu/ethosu_buffer.c:108:42: note: format string is defined here
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                                       ~~~^
         |                                          |
         |                                          long long unsigned int
         |                                       %x
   drivers/staging/ethosu/ethosu_buffer.c:108:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/staging/ethosu/ethosu_buffer.c:108:17: note: in expansion of macro 'dev_dbg'
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                 ^~~~~~~
   drivers/staging/ethosu/ethosu_buffer.c:108:56: note: format string is defined here
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                                                     ~~~^
         |                                                        |
         |                                                        long long unsigned int
         |                                                     %x
   drivers/staging/ethosu/ethosu_buffer.c:108:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
     223 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:249:9: note: in expansion of macro '_dynamic_func_call_cls'
     249 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:272:9: note: in expansion of macro '_dynamic_func_call'
     272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:9: note: in expansion of macro 'dynamic_dev_dbg'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:30: note: in expansion of macro 'dev_fmt'
     155 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/staging/ethosu/ethosu_buffer.c:108:17: note: in expansion of macro 'dev_dbg'
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                 ^~~~~~~
   drivers/staging/ethosu/ethosu_buffer.c:108:69: note: format string is defined here
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                                                                  ~~~^
         |                                                                     |
         |                                                                     long long unsigned int
         |                                                                  %x
   In file included from include/linux/device.h:15,
                    from include/linux/mailbox_client.h:11,
                    from drivers/staging/ethosu/ethosu_mailbox.h:30,
                    from drivers/staging/ethosu/ethosu_device.h:29,
                    from drivers/staging/ethosu/ethosu_buffer.c:27:
   drivers/staging/ethosu/ethosu_buffer.c: In function 'ethosu_buffer_create':
   drivers/staging/ethosu/ethosu_buffer.c:253:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     253 |                  "Buffer create. handle=0x%pK, capacity=%zu, cpu_addr=0x%pK, dma_addr=0x%llx, dma_addr_orig=0x%llx, phys_addr=0x%llx\n",
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:150:58: note: in expansion of macro 'dev_fmt'
     150 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/staging/ethosu/ethosu_buffer.c:252:9: note: in expansion of macro 'dev_info'
     252 |         dev_info(buf->edev->dev,
         |         ^~~~~~~~
   drivers/staging/ethosu/ethosu_buffer.c:253:92: note: format string is defined here
     253 |                  "Buffer create. handle=0x%pK, capacity=%zu, cpu_addr=0x%pK, dma_addr=0x%llx, dma_addr_orig=0x%llx, phys_addr=0x%llx\n",


vim +108 drivers/staging/ethosu/ethosu_buffer.c

    59	
    60	/****************************************************************************
    61	 * Functions
    62	 ****************************************************************************/
    63	
    64	/*
    65	 * The 'dma-ranges' device tree property for shared dma memory does not seem
    66	 * to be fully supported for coherent memory. Therefor we apply the DMA range
    67	 * offset ourselves.
    68	 */
    69	static dma_addr_t ethosu_buffer_dma_ranges(struct device *dev,
    70						   dma_addr_t dma_addr,
    71						   size_t dma_buf_size)
    72	{
    73		struct device_node *node = dev->of_node;
    74		const __be32 *ranges;
    75		int len;
    76		int naddr;
    77		int nsize;
    78		int inc;
    79		int i;
    80	
    81		if (!node)
    82			return dma_addr;
    83	
    84		/* Get the #address-cells and #size-cells properties */
    85		naddr = of_n_addr_cells(node);
    86		nsize = of_n_size_cells(node);
    87	
    88		/* Read the 'dma-ranges' property */
    89		ranges = of_get_property(node, "dma-ranges", &len);
    90		if (!ranges || len <= 0)
    91			return dma_addr;
    92	
    93		dev_dbg(dev, "ranges=%p, len=%d, naddr=%d, nsize=%d\n",
    94			ranges, len, naddr, nsize);
    95	
    96		len /= sizeof(*ranges);
    97		inc = naddr + naddr + nsize;
    98	
    99		for (i = 0; (i + inc) <= len; i += inc) {
   100			dma_addr_t daddr;
   101			dma_addr_t paddr;
   102			dma_addr_t size;
   103	
   104			daddr = of_read_number(&ranges[i], naddr);
   105			paddr = of_read_number(&ranges[i + naddr], naddr);
   106			size = of_read_number(&ranges[i + naddr + naddr], nsize);
   107	
 > 108			dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
   109				daddr, paddr, size);
   110	
   111			if (dma_addr >= paddr &&
   112			    (dma_addr + dma_buf_size) < (paddr + size))
   113				return dma_addr + daddr - paddr;
   114		}
   115	
   116		return dma_addr;
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
