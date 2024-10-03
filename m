Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BCE224D1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 20:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727987575; cv=none; b=tyBAiXPIWcdgz4Q1N/XxwUZ9Afa35MZ8diWSjSpwcegzWQPw/YvTpd3HKUc/zIKo585mxJYTU32eOrFShKJDjyxvW6UCHLyrOFUBc0h694PoCXE0m2/QI+XUfeHT62MHj9bvwiFG8FhdiVB336vK6OOp9SE4werM3S5G1qJNyOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727987575; c=relaxed/simple;
	bh=20ktMqoIR+Fbbc6GYWv5DDHsLBzBI4+7tkITGdV7xsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TdR+jWj5Ix91Yx1OJnM+f/NPgbgXubJCDR2AMRZF62YXYkZO2p4i0qk+KhTmVZfO13JNppPHqkjkHQBLgehVapX327itTVtyM4TuCHSgPqpsu6t3+5WXfK+XtwDlKhpmxZ9+QKM2XsiodYBT7mmQucar4UJe6nApeFo+tkMwb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WaGO5eK3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WaGO5eK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727987573; x=1759523573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20ktMqoIR+Fbbc6GYWv5DDHsLBzBI4+7tkITGdV7xsA=;
  b=WaGO5eK3CXI4BTGa56mXZl2ROuwNJEHJlOqurdec0VWhlYqa86o35qkW
   n+rNbTRFCTRON1UfC3WHCY3TpFwO8fY4yC+74QbDZjHsokqy3y0mB09SG
   RhpaIva2CNHTSR8BRdZDeV+K2Ibyg+0/hrX9A6yOXQl6D1zPooChHalxH
   fhDm/Ea2tVYfggckG7Y3GGDWiGmh2oFNq5iQLTjvNERG6LYu/OV+i1zIE
   jiUKVEZ+VduD4aJ4y8RJKI61UQ0Be/fLddslq7pv25TYlF4sv2M6/KWic
   KaBFfItv1W+cS+wm6zhb/49QczAKImAnjkGL4inR2JPeDyzNVuHqgrSJr
   w==;
X-CSE-ConnectionGUID: 6Aqa2uVFTryW9UPrd+Foww==
X-CSE-MsgGUID: GDKmUpmATZCQT7JDbI73QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27352875"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="27352875"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 13:32:52 -0700
X-CSE-ConnectionGUID: GEcLe/wDQ725lvwT0NHNFw==
X-CSE-MsgGUID: hxbu3JlbRZKIgyhTubisJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="111939155"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 13:32:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swSVF-0000sa-0l;
	Thu, 03 Oct 2024 20:32:49 +0000
Date: Fri, 4 Oct 2024 04:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 3407/16788]
 drivers/staging/ethosu/ethosu_buffer.c:253:18: warning: format '%llx'
 expects argument of type 'long long unsigned int', but argument 8 has type
 'phys_addr_t' {aka 'unsigned int'}
Message-ID: <202410040424.febNf1XA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 95858643398fd1b401b53e88a769e79ec05d2553 [3407/16788] npu: ethosu: Add Arm ethos-u driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410040424.febNf1XA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040424.febNf1XA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040424.febNf1XA-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                       ~~~^
         |                                          |
         |                                          long long unsigned int
         |                                       %x
   drivers/staging/ethosu/ethosu_buffer.c:108:30: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
     108 |                 dev_dbg(dev, "daddr=0x%llx, paddr=0x%llx, size=0x%llx\n",
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
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
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
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
