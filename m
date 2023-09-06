Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A8211193
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 22:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694040491; x=1725576491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u24bQV0WryTsPIp99OM9IVCgEXZm6nsEGIuj9KHK1PM=;
  b=JOejA2gmQtUivAoXYE3Qqlt4MSIP7zCLdYvKZO6jvnmPrSIyQh+ibYla
   OFnF3Dzsy1xRxaQW3+VCYJQI6ZzJ4rHuU2hLECrv4SrPoRuddpZGMxYBV
   XJ9rZnU5ANPXUozYaBvPQgKwe85HeMo8ph5kY11oM4nskULAnSg9mtETH
   WkvGPIQqgO7zV0hTc93EgLfpA+plifC8Fs4JHEqeqTS6xJOCd1ooYWbEM
   utPoIudgvUQoy2heFNxFZs9q07906TCOfqohXmec7ucUtQHg14PfJb9uC
   8gzBCCgpxlm9NJNDzvniICqtFpL2pcwWlhXvmklAHtNNFDmRaKWhiqNw2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376103965"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="376103965"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 15:48:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856650664"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="856650664"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 15:48:07 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe1Jd-0000en-0r;
	Wed, 06 Sep 2023 22:48:05 +0000
Date: Thu, 7 Sep 2023 06:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 14450/24606]
 drivers/staging/ethosu/ethosu_buffer.c:253:18: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 8 has type
 'phys_addr_t' {aka 'unsigned int'}
Message-ID: <202309070630.Uy5OpTEl-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: 371963361b09c8020212056cd797d23dd98a10be [14450/24606] LF-6285-1 npu: ethosu: Add Arm ethos-u driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230907/202309070630.Uy5OpTEl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070630.Uy5OpTEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070630.Uy5OpTEl-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
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
   include/linux/dynamic_debug.h:134:29: note: in definition of macro '__dynamic_func_call'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:166:9: note: in expansion of macro '_dynamic_func_call'
     166 |         _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
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
         |                                                                                         ~~~^
         |                                                                                            |
         |                                                                                            long long unsigned int
         |                                                                                         %x
   drivers/staging/ethosu/ethosu_buffer.c:253:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
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
   drivers/staging/ethosu/ethosu_buffer.c:253:114: note: format string is defined here
     253 |                  "Buffer create. handle=0x%pK, capacity=%zu, cpu_addr=0x%pK, dma_addr=0x%llx, dma_addr_orig=0x%llx, phys_addr=0x%llx\n",
         |                                                                                                               ~~~^
         |                                                                                                                  |
         |                                                                                                                  long long unsigned int
         |                                                                                                               %x
>> drivers/staging/ethosu/ethosu_buffer.c:253:18: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 8 has type 'phys_addr_t' {aka 'unsigned int'} [-Wformat=]
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
   drivers/staging/ethosu/ethosu_buffer.c:253:132: note: format string is defined here
     253 |                  "Buffer create. handle=0x%pK, capacity=%zu, cpu_addr=0x%pK, dma_addr=0x%llx, dma_addr_orig=0x%llx, phys_addr=0x%llx\n",
         |                                                                                                                                 ~~~^
         |                                                                                                                                    |
         |                                                                                                                                    long long unsigned int
         |                                                                                                                                 %x


vim +253 drivers/staging/ethosu/ethosu_buffer.c

   218	
   219	int ethosu_buffer_create(struct ethosu_device *edev,
   220				 size_t capacity)
   221	{
   222		struct ethosu_buffer *buf;
   223		int ret = -ENOMEM;
   224	
   225		buf = devm_kzalloc(edev->dev, sizeof(*buf), GFP_KERNEL);
   226		if (!buf)
   227			return -ENOMEM;
   228	
   229		buf->edev = edev;
   230		buf->capacity = capacity;
   231		buf->offset = 0;
   232		buf->size = 0;
   233		kref_init(&buf->kref);
   234	
   235		buf->cpu_addr = dma_alloc_coherent(buf->edev->dev, capacity,
   236						   &buf->dma_addr_orig, GFP_KERNEL);
   237		if (!buf->cpu_addr)
   238			goto free_buf;
   239	
   240		buf->dma_addr = ethosu_buffer_dma_ranges(buf->edev->dev,
   241							 buf->dma_addr_orig,
   242							 buf->capacity);
   243	
   244		ret = anon_inode_getfd("ethosu-buffer", &ethosu_buffer_fops, buf,
   245				       O_RDWR | O_CLOEXEC);
   246		if (ret < 0)
   247			goto free_dma;
   248	
   249		buf->file = fget(ret);
   250		fput(buf->file);
   251	
 > 252		dev_info(buf->edev->dev,
 > 253			 "Buffer create. handle=0x%pK, capacity=%zu, cpu_addr=0x%pK, dma_addr=0x%llx, dma_addr_orig=0x%llx, phys_addr=0x%llx\n",
   254			 buf, capacity, buf->cpu_addr, buf->dma_addr,
   255			 buf->dma_addr_orig, virt_to_phys(buf->cpu_addr));
   256	
   257		return ret;
   258	
   259	free_dma:
   260		dma_free_coherent(buf->edev->dev, buf->capacity, buf->cpu_addr,
   261				  buf->dma_addr_orig);
   262	
   263	free_buf:
   264		devm_kfree(buf->edev->dev, buf);
   265	
   266		return ret;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
