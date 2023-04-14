Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF78630
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 23:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681513859; x=1713049859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwXKhtSZUvXDFFBYT3gskagEC5Xa5Lc/UX1daI+Au4k=;
  b=eqFpNUJGBhwOnMQlvBWjJykjXlp1SQy/SCwJn4IJ/Wpj68dugkSf940x
   MRp+PzVlDXoHhxezchaGl6LZG3tPxmFC6GaQpan+FvLHr03ci44mJ2UCu
   JBygLoULOW0yqRCZIB1hgSB+p3s2FTHcYEhUfGKDh7Nwv1ByQ4KnQbdh4
   Kw+VNPT0ozfMc8w/7GPNoELySmpSE4MXmP3iezPiHA+HJjlb1oJsLTVxc
   5yKMGXsTdp1CWRTqm6OlppnKNeXEz6crd0RxSaxoZYSghoxrOD+DwbpCw
   Etr3isw5imGKI/z15gKGk285F/RKHgxMuL4MtYW+++rMLC5pMQ7+FJoD9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="344585656"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="344585656"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 16:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="779361753"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="779361753"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2023 16:10:57 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnSZD-000a6F-2h;
	Fri, 14 Apr 2023 23:10:55 +0000
Date: Sat, 15 Apr 2023 07:10:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4628/9838]
 drivers/firmware/imx/seco_mu.c:683:32: warning: cast from pointer to integer
 of different size
Message-ID: <202304150745.MSdy1asJ-lkp@intel.com>
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
commit: 8adf8e97f191e43b9e0a0a724483cedc7b4e4eb5 [4628/9838] LF-6580-2: drivers: seco mu: she fast mac
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304150745.MSdy1asJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/8adf8e97f191e43b9e0a0a724483cedc7b4e4eb5
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 8adf8e97f191e43b9e0a0a724483cedc7b4e4eb5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/firmware/imx/ drivers/net/ethernet/freescale/fman/ drivers/pwm/ drivers/soc/imx/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150745.MSdy1asJ-lkp@intel.com/

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
>> drivers/firmware/imx/seco_mu.c:683:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     683 |                 io.seco_addr = (u64)addr;
         |                                ^


vim +683 drivers/firmware/imx/seco_mu.c

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
 > 683			io.seco_addr = (u64)addr;
   684		}
   685	
   686		if ((io.flags & SECO_MU_IO_FLAGS_USE_SEC_MEM) &&
   687		    !(io.flags & SECO_MU_IO_FLAGS_USE_SHORT_ADDR))
   688			/*Add base address to get full address.*/
   689			io.seco_addr += SECURE_RAM_BASE_ADDRESS_SCU;
   690	
   691		if (io.flags & SECO_MU_IO_FLAGS_IS_INPUT) {
   692			/*
   693			 * buffer is input:
   694			 * copy data from user space to this allocated buffer.
   695			 */
   696			if (io.flags & SECO_MU_IO_FLAGS_SHE_V2X) {
   697				err = (int)copy_from_user(addr, io.user_buf, io.length);
   698			} else {
   699				err = (int)copy_from_user(shared_mem->ptr + pos,
   700							  io.user_buf,
   701							  io.length);
   702			}
   703			if (err) {
   704				devctx_err(dev_ctx,
   705					   "Failed copy data to shared memory\n");
   706				err = -EFAULT;
   707				goto exit;
   708			}
   709		} else {
   710			/*
   711			 * buffer is output:
   712			 * add an entry in the "pending buffers" list so data
   713			 * can be copied to user space when receiving SECO
   714			 * response.
   715			 */
   716			out_buf_desc = devm_kmalloc(dev_ctx->dev, sizeof(*out_buf_desc),
   717						    GFP_KERNEL);
   718			if (!out_buf_desc) {
   719				err = -ENOMEM;
   720				devctx_err(dev_ctx,
   721					   "Failed allocating mem for pending buffer\n"
   722					   );
   723				goto exit;
   724			}
   725	
   726			if (io.flags & SECO_MU_IO_FLAGS_SHE_V2X)
   727				out_buf_desc->out_ptr = addr;
   728			else
   729				out_buf_desc->out_ptr = shared_mem->ptr + pos;
   730			out_buf_desc->out_usr_ptr = io.user_buf;
   731			out_buf_desc->out_size = io.length;
   732			list_add_tail(&out_buf_desc->link, &dev_ctx->pending_out);
   733		}
   734	
   735	copy:
   736		/* Provide the seco address to user space only if success. */
   737		err = (int)copy_to_user((u8 *)arg, &io,
   738			sizeof(io));
   739		if (err) {
   740			devctx_err(dev_ctx, "Failed to copy iobuff setup to user\n");
   741			err = -EFAULT;
   742			goto exit;
   743		}
   744	
   745	exit:
   746		return err;
   747	}
   748	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
