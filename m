Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE214A630
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720190633; cv=none; b=I+7uitA4G0O3g3MkilKH8kOcjiukb843TjVuX2q5e+1ymCf1Fk0JplkBymc9ebdjuXqNtzuAkN9tMfaAkTrd4vUi6ii1l/4orSeO/kw30aePeaJdv18qCbdWbl3l3xWQeGtrTDLnsob3nbVab+tG9gM2vyPnEEanafPCItyhV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720190633; c=relaxed/simple;
	bh=e/I7saiE4x5Sk7P/x6QXDKc32TtuW9s0KXDpN7YecBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4XI975+po5bsa7opZy3TsIzknHViT2lza0snC/lagzZunLYqBzJoLx7HocHKKEWAclnDi1KRZUKhNS69t58bjNsZknv5cZUtuA5SNqvNXQbTc7wDIzYKg7ty7VW5NZAuvDEPoZ3DXg/5jrrW8/ApcBX8vgVUn1wRtHnZ826uDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cv39NuOe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cv39NuOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720190631; x=1751726631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/I7saiE4x5Sk7P/x6QXDKc32TtuW9s0KXDpN7YecBM=;
  b=cv39NuOecnXjQpIJtiMSRCOvNJdsd8jT5hfkenefKRMZQsOhMsWO5dYk
   aADOuHRW8IsUAEkOJw8zAmhfKftecekJUmqK1oxxBwhgdUmV1DAKPkAfj
   U8TfRNdz6ApCzhVTR6UO7FgEw0vPmoq1TkTw4qe+yNCBZGmQc/hZ/uLWD
   D92c1yMDOndbvJP8bDOrDHFhdKsCx+pAN/+HxPWsomZMHJPHmPcfNKHL0
   IM82tu9J+ELcE6JtJXH+fcFzVILDp6EXmU/fkRwfsLJkGFt3KGfC+70cS
   VaTq4zTU1xvx9C6Al/swdSq1ZvKsHWNpZcDeJ+SiN4oOrbVWIWaE7ySXy
   A==;
X-CSE-ConnectionGUID: 95USHM/+SUqFxtQNXkQR8A==
X-CSE-MsgGUID: RbU+S1QYQKuvBXQL3WXRrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17592007"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="17592007"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 07:43:50 -0700
X-CSE-ConnectionGUID: ek5cnxoXQxGjhSqcKN9cnw==
X-CSE-MsgGUID: OalVFF9IS1a4AFRTDVpzqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="46835267"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Jul 2024 07:43:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPkA6-000SUO-1z;
	Fri, 05 Jul 2024 14:43:46 +0000
Date: Fri, 5 Jul 2024 22:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pza:sl-dma-demo 1/3] drivers/dma/sl-dma.c:176:9: error: implicit
 declaration of function 'writeq'; did you mean 'writel'?
Message-ID: <202407052247.ali6Kdq0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.pengutronix.de/git/pza/linux sl-dma-demo
head:   378de31c99885b2a8fbe24ebaead11139d892f28
commit: 3b9d53b21baa3734a355a4466f9e741161df4dc8 [1/3] dmaengine: sl-dma: Add Smartlogic HCC DMA IP Core driver
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240705/202407052247.ali6Kdq0-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407052247.ali6Kdq0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407052247.ali6Kdq0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/dma/sl-dma.c: In function 'sl_dma_writeq':
>> drivers/dma/sl-dma.c:176:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
     176 |         writeq(value, sl_dma->bar + offset);
         |         ^~~~~~
         |         writel
   In file included from include/linux/printk.h:570,
                    from include/asm-generic/bug.h:22,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from drivers/dma/sl-dma.c:21:
   drivers/dma/sl-dma.c: In function 'sl_dma_prep_slave_sg':
>> drivers/dma/sl-dma.c:955:17: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     955 |                 "Preparing transfer for %s channel %u, address = 0x%llx, len = %u\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/dma/sl-dma.c:954:9: note: in expansion of macro 'dev_dbg'
     954 |         dev_dbg(sl_dma->dev,
         |         ^~~~~~~
   drivers/dma/sl-dma.c:955:71: note: format string is defined here
     955 |                 "Preparing transfer for %s channel %u, address = 0x%llx, len = %u\n",
         |                                                                    ~~~^
         |                                                                       |
         |                                                                       long long unsigned int
         |                                                                    %x
   drivers/dma/sl-dma.c: In function 'sl_dma_prep_interleaved_dma':
   drivers/dma/sl-dma.c:999:17: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 7 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     999 |                 "Preparing transfer for %s channel %u, %s = 0x%llx, size = %lu\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/dma/sl-dma.c:998:9: note: in expansion of macro 'dev_dbg'
     998 |         dev_dbg(sl_dma->dev,
         |         ^~~~~~~
   drivers/dma/sl-dma.c:999:66: note: format string is defined here
     999 |                 "Preparing transfer for %s channel %u, %s = 0x%llx, size = %lu\n",
         |                                                               ~~~^
         |                                                                  |
         |                                                                  long long unsigned int
         |                                                               %x
>> drivers/dma/sl-dma.c:999:17: warning: format '%lu' expects argument of type 'long unsigned int', but argument 8 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     999 |                 "Preparing transfer for %s channel %u, %s = 0x%llx, size = %lu\n",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/dma/sl-dma.c:998:9: note: in expansion of macro 'dev_dbg'
     998 |         dev_dbg(sl_dma->dev,
         |         ^~~~~~~
   drivers/dma/sl-dma.c:999:78: note: format string is defined here
     999 |                 "Preparing transfer for %s channel %u, %s = 0x%llx, size = %lu\n",
         |                                                                            ~~^
         |                                                                              |
         |                                                                              long unsigned int
         |                                                                            %u
   drivers/dma/sl-dma.c:1016:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    1016 |                         "Size %lu differs from channel transfer size %u\n",
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/dma/sl-dma.c:1015:17: note: in expansion of macro 'dev_dbg'
    1015 |                 dev_dbg(sl_dma->dev,
         |                 ^~~~~~~
   drivers/dma/sl-dma.c:1016:33: note: format string is defined here
    1016 |                         "Size %lu differs from channel transfer size %u\n",
         |                               ~~^
         |                                 |
         |                                 long unsigned int
         |                               %u
   drivers/dma/sl-dma.c: In function 'sl_dma_issue_pending':
   drivers/dma/sl-dma.c:1148:38: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
    1148 |                 dev_dbg(sl_dma->dev, "Issue transfer on %s channel %u, addr = 0x%llx\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/dma/sl-dma.c:1148:17: note: in expansion of macro 'dev_dbg'
    1148 |                 dev_dbg(sl_dma->dev, "Issue transfer on %s channel %u, addr = 0x%llx\n",
         |                 ^~~~~~~
   drivers/dma/sl-dma.c:1148:84: note: format string is defined here
    1148 |                 dev_dbg(sl_dma->dev, "Issue transfer on %s channel %u, addr = 0x%llx\n",
         |                                                                                 ~~~^
         |                                                                                    |
         |                                                                                    long long unsigned int
         |                                                                                 %x
   cc1: some warnings being treated as errors


vim +176 drivers/dma/sl-dma.c

   173	
   174	static inline void sl_dma_writeq(struct sl_dma *sl_dma, u32 offset, u64 value)
   175	{
 > 176		writeq(value, sl_dma->bar + offset);
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
