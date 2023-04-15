Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8EE28E1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681572347; x=1713108347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qYrQvyIbQAZGbUR7eQIMTYfBOdtFGME1/neA0eXa+uI=;
  b=N7vptAJbwk5CZr950if8ZKnjlrRgmCg70YEa6dXSgQ0O1SoKZ5vbwmut
   D7FA4vmvRhF8wWp/ypJX0pcY51rSncdpU57tVeSe2dCgEnbLznBwikbWu
   BZt/FTFKMbQvTPYmxA/g6EcjqbHkJVy9H92vYVojLox3rUg2EA1c09YOY
   g6lMYI0fXXV4fF7E+Q1ns2GEtR23pgxIde2FCGvUh+/xp5a+u0PUVnfn2
   OK8zU2snkheNeyZjvUHkMdL+DVNKTNV9j3Cmq2B1v3cpiGnFduNNMG6Nk
   s4Z+gYwD4srXyyh0rPoakLWhlRcy72SmO6ihzdi/wQ1PzFgsa0ldHd+dx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="324282298"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="324282298"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 08:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="683699073"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="683699073"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2023 08:25:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnhma-000b9e-2h;
	Sat, 15 Apr 2023 15:25:44 +0000
Date: Sat, 15 Apr 2023 23:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 3481/9838]
 drivers/staging/ethosu/ethosu_buffer.c:108:30: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 4 has type
 'dma_addr_t' {aka 'unsigned int'}
Message-ID: <202304152325.l5lSoAt7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 95ce4103b59b6af5d3c264fc137f9dd174e78d3e [3481/9838] npu: ethosu: Add Arm ethos-u driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304152325.l5lSoAt7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/95ce4103b59b6af5d3c264fc137f9dd174e78d3e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 95ce4103b59b6af5d3c264fc137f9dd174e78d3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/pwm/ drivers/soc/imx/ drivers/staging/ethosu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152325.l5lSoAt7-lkp@intel.com/

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

  > 25	#include "ethosu_buffer.h"
    26	
    27	#include "ethosu_device.h"
    28	#include "uapi/ethosu.h"
    29	
    30	#include <linux/anon_inodes.h>
    31	#include <linux/dma-mapping.h>
    32	#include <linux/of_address.h>
    33	#include <linux/file.h>
    34	#include <linux/fs.h>
    35	#include <linux/uaccess.h>
    36	
    37	/****************************************************************************
    38	 * Variables
    39	 ****************************************************************************/
    40	
    41	static int ethosu_buffer_release(struct inode *inode,
    42					 struct file *file);
    43	
    44	static int ethosu_buffer_mmap(struct file *file,
    45				      struct vm_area_struct *vma);
    46	
    47	static long ethosu_buffer_ioctl(struct file *file,
    48					unsigned int cmd,
    49					unsigned long arg);
    50	
    51	static const struct file_operations ethosu_buffer_fops = {
    52		.release        = &ethosu_buffer_release,
    53		.mmap           = &ethosu_buffer_mmap,
    54		.unlocked_ioctl = &ethosu_buffer_ioctl,
    55	#ifdef CONFIG_COMPAT
    56		.compat_ioctl   = &ethosu_buffer_ioctl,
    57	#endif
    58	};
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
https://github.com/intel/lkp-tests
