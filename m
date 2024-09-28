Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6572D185B4C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 22:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727563327; cv=none; b=Lt+l2jn6JZErVTSjWN2WlPWMudmw7Q1h1kbKfV12Bia2BjALHt8/D3GKHA7Vs2Z59q/GkoNjQBj/VBd4MxgKU1MmPOeUYkiyl6Urk+J3iSXYRb3fiVW+1wf9LHLgNu9S85YwMLrWkTgmyZXJzz96yp1XrLZUT62KvwDxFRHRVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727563327; c=relaxed/simple;
	bh=C4lEPggVtQzISWQpv4rBfeVIqoZPEqE97E3OZn/Si7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsD7EOqWucYprOl/ASpCZvp0hzERDWW0a357yNoGqc75EoVwBmTafTa+C+1o9weSMVbv8PAxPhEDuxrpadTie4sYlQ/CKW7kC3BwzotsmNNqZUp02xEBtrywBsgNTxQ6H1DETiAueRPwQx8TiR4v8HADyzO5QnoixlxrAIkHcDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyAOcejj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyAOcejj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727563325; x=1759099325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C4lEPggVtQzISWQpv4rBfeVIqoZPEqE97E3OZn/Si7c=;
  b=IyAOcejjiIFaufKjY4W8uB81HK4lsHowbF25rAN9LKjwjumuI9D3Kzqj
   GccmH7PEGIzhgorfcLeNIqWjJIqGUjeX8TsvQbzIbfur1o81et5b6gr+h
   I11xuL2nyq0FuvDJnrUGHde3Ps4D9YfwexiyheN4Gj1QFeCamyb5604gR
   tDyS1T8ZdierWQ3bUXKIqmwAC7KtOnCKn9+YN4ZMc9WRmoblKt6+AMlXI
   HWZSsxfrF/3bUIyawBdqrCmL5bx9ZOG+HLG80nqfobYqLO24gkl1PUU9I
   OdwVuxm/NmWL1BN8WMIbJbR4N6iy30+8ZoZYBO14UERyAUsP4juMFnz48
   Q==;
X-CSE-ConnectionGUID: KngVv2ssToSQxxBdxucGjQ==
X-CSE-MsgGUID: AJ+udDHJTQapovlWWJUEEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26149372"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26149372"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 15:42:03 -0700
X-CSE-ConnectionGUID: 010I7yBrSWilsdwbjRVmiA==
X-CSE-MsgGUID: RfXdX1uSRnui8zp+qfed7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="96220808"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Sep 2024 15:42:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sug8V-000NjE-2M;
	Sat, 28 Sep 2024 22:41:59 +0000
Date: Sun, 29 Sep 2024 06:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4935/16788]
 drivers/firmware/imx/seco_mu.c:689:32: warning: cast from pointer to integer
 of different size
Message-ID: <202409290612.gQmGCiRo-lkp@intel.com>
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
commit: 24be367d4d2abbf139b51524ff9867b3771a8b4e [4935/16788] LF-6580-2: drivers: seco mu: she fast mac
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290612.gQmGCiRo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290612.gQmGCiRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290612.gQmGCiRo-lkp@intel.com/

All warnings (new ones prefixed by >>):

     194 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:204:9: note: in expansion of macro 'miscdev_err'
     204 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:379:17: note: in expansion of macro 'devctx_err'
     379 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:194:47: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     194 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:194:17: note: in expansion of macro 'dev_err'
     194 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:204:9: note: in expansion of macro 'miscdev_err'
     204 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:386:17: note: in expansion of macro 'devctx_err'
     386 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:194:47: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
     194 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/firmware/imx/seco_mu.c:194:17: note: in expansion of macro 'dev_err'
     194 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:204:9: note: in expansion of macro 'miscdev_err'
     204 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:386:17: note: in expansion of macro 'devctx_err'
     386 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c: In function 'seco_mu_fops_read':
   drivers/firmware/imx/seco_mu.c:180:47: warning: format '%ld' expects argument of type 'long int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     180 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
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
   drivers/firmware/imx/seco_mu.c:180:17: note: in expansion of macro 'dev_dbg'
     180 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:200:9: note: in expansion of macro 'miscdev_dbg'
     200 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:470:9: note: in expansion of macro 'devctx_dbg'
     470 |         devctx_dbg(dev_ctx, "read to buf %p(%ld), ppos=%lld\n", buf, size,
         |         ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:180:47: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     180 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                               ^~~~~~
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
   drivers/firmware/imx/seco_mu.c:180:17: note: in expansion of macro 'dev_dbg'
     180 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                 ^~~~~~~
   drivers/firmware/imx/seco_mu.c:200:9: note: in expansion of macro 'miscdev_dbg'
     200 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |         ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:508:17: note: in expansion of macro 'devctx_dbg'
     508 |                 devctx_dbg(dev_ctx, "User buffer too small (%ld < %d)\n",
         |                 ^~~~~~~~~~
   drivers/firmware/imx/seco_mu.c: In function 'seco_mu_ioctl_setup_iobuf_handler':
>> drivers/firmware/imx/seco_mu.c:689:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     689 |                 io.seco_addr = (u64)addr;
         |                                ^
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/dma-mapping.h:5:
   drivers/firmware/imx/seco_mu.c: In function 'imx_sc_v2x_reset_notify':
   drivers/firmware/imx/seco_mu.c:1049:23: error: 'IMX_SC_IRQ_V2X_RESET' undeclared (first use in this function); did you mean 'IMX_SC_C_DPI_RESET'?
    1049 |         if (!(event & IMX_SC_IRQ_V2X_RESET))
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/firmware/imx/seco_mu.c:1049:9: note: in expansion of macro 'if'
    1049 |         if (!(event & IMX_SC_IRQ_V2X_RESET))
         |         ^~
   drivers/firmware/imx/seco_mu.c:1049:23: note: each undeclared identifier is reported only once for each function it appears in
    1049 |         if (!(event & IMX_SC_IRQ_V2X_RESET))
         |                       ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/firmware/imx/seco_mu.c:1049:9: note: in expansion of macro 'if'
    1049 |         if (!(event & IMX_SC_IRQ_V2X_RESET))
         |         ^~
   drivers/firmware/imx/seco_mu.c: In function 'seco_mu_probe':
   drivers/firmware/imx/seco_mu.c:1217:41: error: 'IMX_SC_IRQ_V2X_RESET' undeclared (first use in this function); did you mean 'IMX_SC_C_DPI_RESET'?
    1217 |                                         IMX_SC_IRQ_V2X_RESET, true);
         |                                         ^~~~~~~~~~~~~~~~~~~~
         |                                         IMX_SC_C_DPI_RESET


vim +689 drivers/firmware/imx/seco_mu.c

   614	
   615	/*
   616	 * Copy a buffer of daa to/from the user and return the address to use in
   617	 * messages
   618	 */
   619	static int seco_mu_ioctl_setup_iobuf_handler(struct seco_mu_device_ctx *dev_ctx,
   620						     unsigned long arg)
   621	{
   622		struct seco_out_buffer_desc *out_buf_desc;
   623		struct seco_mu_ioctl_setup_iobuf io;
   624		struct seco_shared_mem *shared_mem;
   625		int err = -EINVAL;
   626		u32 pos;
   627		u8 *addr;
   628	
   629		struct seco_mu_priv *priv = dev_get_drvdata(dev_ctx->dev);
   630	
   631		err = (int)copy_from_user(&io,
   632			(u8 *)arg,
   633			sizeof(io));
   634		if (err) {
   635			devctx_err(dev_ctx, "Failed copy iobuf config from user\n");
   636			err = -EFAULT;
   637			goto exit;
   638		}
   639	
   640		/* Function call to retrieve MU Buffer address */
   641		if (io.flags & SECO_MU_IO_FLAGS_SHE_V2X)
   642			addr = get_mu_buf(priv->tx_chan);
   643	
   644		devctx_dbg(dev_ctx, "io [buf: %p(%d) flag: %x]\n",
   645			   io.user_buf, io.length, io.flags);
   646	
   647		if (io.length == 0 || !io.user_buf) {
   648			/*
   649			 * Accept NULL pointers since some buffers are optional
   650			 * in SECO commands. In this case we should return 0 as
   651			 * pointer to be embedded into the message.
   652			 * Skip all data copy part of code below.
   653			 */
   654			io.seco_addr = 0;
   655			goto copy;
   656		}
   657	
   658		/* Select the shared memory to be used for this buffer. */
   659		if (!(io.flags & SECO_MU_IO_FLAGS_SHE_V2X)) {
   660			if (io.flags & SECO_MU_IO_FLAGS_USE_SEC_MEM) {
   661				/* App requires to use secure memory for this buffer.*/
   662				shared_mem = &dev_ctx->secure_mem;
   663			} else {
   664				/* No specific requirement for this buffer. */
   665				shared_mem = &dev_ctx->non_secure_mem;
   666			}
   667		}
   668	
   669		/* Check there is enough space in the shared memory. */
   670		if (!(io.flags & SECO_MU_IO_FLAGS_SHE_V2X) &&
   671		     (io.length >= shared_mem->size - shared_mem->pos)) {
   672			devctx_err(dev_ctx, "Not enough space in shared memory\n");
   673			err = -ENOMEM;
   674			goto exit;
   675		}
   676	
   677		if (!(io.flags & SECO_MU_IO_FLAGS_SHE_V2X)) {
   678			/* Allocate space in shared memory. 8 bytes aligned. */
   679			pos = shared_mem->pos;
   680			shared_mem->pos += round_up(io.length, 8u);
   681			io.seco_addr = (u64)shared_mem->dma_addr + pos;
   682		} else {
   683			if (io.length > MAX_DATA_SIZE_PER_USER) {
   684				devctx_err(dev_ctx, "Buffer length exceeded the max limit\n");
   685				err = -ENOMEM;
   686				goto exit;
   687			}
   688	
 > 689			io.seco_addr = (u64)addr;
   690		}
   691	
   692		if ((io.flags & SECO_MU_IO_FLAGS_USE_SEC_MEM) &&
   693		    !(io.flags & SECO_MU_IO_FLAGS_USE_SHORT_ADDR))
   694			/*Add base address to get full address.*/
   695			io.seco_addr += SECURE_RAM_BASE_ADDRESS_SCU;
   696	
   697		if (io.flags & SECO_MU_IO_FLAGS_IS_INPUT) {
   698			/*
   699			 * buffer is input:
   700			 * copy data from user space to this allocated buffer.
   701			 */
   702			if (io.flags & SECO_MU_IO_FLAGS_SHE_V2X) {
   703				err = (int)copy_from_user(addr, io.user_buf, io.length);
   704			} else {
   705				err = (int)copy_from_user(shared_mem->ptr + pos,
   706							  io.user_buf,
   707							  io.length);
   708			}
   709			if (err) {
   710				devctx_err(dev_ctx,
   711					   "Failed copy data to shared memory\n");
   712				err = -EFAULT;
   713				goto exit;
   714			}
   715		} else {
   716			/*
   717			 * buffer is output:
   718			 * add an entry in the "pending buffers" list so data
   719			 * can be copied to user space when receiving SECO
   720			 * response.
   721			 */
   722			out_buf_desc = devm_kmalloc(dev_ctx->dev, sizeof(*out_buf_desc),
   723						    GFP_KERNEL);
   724			if (!out_buf_desc) {
   725				err = -ENOMEM;
   726				devctx_err(dev_ctx,
   727					   "Failed allocating mem for pending buffer\n"
   728					   );
   729				goto exit;
   730			}
   731	
   732			if (io.flags & SECO_MU_IO_FLAGS_SHE_V2X)
   733				out_buf_desc->out_ptr = addr;
   734			else
   735				out_buf_desc->out_ptr = shared_mem->ptr + pos;
   736			out_buf_desc->out_usr_ptr = io.user_buf;
   737			out_buf_desc->out_size = io.length;
   738			list_add_tail(&out_buf_desc->link, &dev_ctx->pending_out);
   739		}
   740	
   741	copy:
   742		/* Provide the seco address to user space only if success. */
   743		err = (int)copy_to_user((u8 *)arg, &io,
   744			sizeof(io));
   745		if (err) {
   746			devctx_err(dev_ctx, "Failed to copy iobuff setup to user\n");
   747			err = -EFAULT;
   748			goto exit;
   749		}
   750	
   751	exit:
   752		return err;
   753	}
   754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
