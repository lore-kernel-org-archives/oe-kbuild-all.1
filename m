Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FACB31739
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 23:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4GZsetH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702770006; x=1734306006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fIcMjDvU/YXC8PbmbjlVFWB8v/hLBbJGe3UugUSv9EM=;
  b=N4GZsetHoVHTj4uyVcsDZXKV4azN8iEpDVdD222KuriksrhtnpvO2KS5
   D4LLYOLjQiDvwMOm069M3zg25RqKsOmw2JX/1m9dsaVetI/eMrs4FN9sx
   prBBBQDox0Dww5xC1Or5UH7jqzaG8MIzoKWJb0XggIGzLr064pJHAFlQP
   8qQfy6oEtpHEB16csyhRYm+0rAlX4RkF3INAZ0CtRwk3kZsBX0mSR0GSq
   XADhzQeT6Hcs34GHe/xEkYNJxiLZZUESaUQBuQd6/b9RaZBvE+E1urPkV
   vPXRNzC1vcgiNiYIqwwEU4Q2ys9Ls8TWV4v9JzJ7E5WlF6irftFuah/oy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="385812945"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="385812945"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 15:40:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16719914"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2023 15:40:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEeGI-0002Lm-0H;
	Sat, 16 Dec 2023 23:40:02 +0000
Date: Sun, 17 Dec 2023 07:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 2822/16025]
 drivers/firmware/imx/seco_mu.c:375:66: warning: format specifies type 'long'
 but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202312170717.a43vH2y5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: fa7e20654ffead9c71a6c29485a7a93ddc974abd [2822/16025] LF-824: fw: imx: seco_mu: Add driver for SECO
config: i386-buildonly-randconfig-004-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170717.a43vH2y5-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170717.a43vH2y5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170717.a43vH2y5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/seco_mu.c:375:66: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
           devctx_dbg(dev_ctx, "write from buf (%p)%ld, ppos=%lld\n", buf, size,
                                                   ~~~                     ^~~~
                                                   %zu
   drivers/firmware/imx/seco_mu.c:208:45: note: expanded from macro 'devctx_dbg'
           miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
                                               ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:189:5: note: expanded from macro 'miscdev_dbg'
                   ##va_args);                                                    \
                     ^~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:387:61: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                   devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
                                                              ~~~            ^~~~
                                                              %zu
   drivers/firmware/imx/seco_mu.c:212:45: note: expanded from macro 'devctx_err'
           miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
                                               ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:203:5: note: expanded from macro 'miscdev_err'
                   ##va_args);                                                    \
                     ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
>> drivers/firmware/imx/seco_mu.c:388:7: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                              sizeof(struct she_mu_hdr));
                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:212:45: note: expanded from macro 'devctx_err'
           miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
                                               ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:203:5: note: expanded from macro 'miscdev_err'
                   ##va_args);                                                    \
                     ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:394:59: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                   devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
                                                            ~~~            ^~~~
                                                            %zu
   drivers/firmware/imx/seco_mu.c:212:45: note: expanded from macro 'devctx_err'
           miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
                                               ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:203:5: note: expanded from macro 'miscdev_err'
                   ##va_args);                                                    \
                     ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:395:7: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
                              MAX_MESSAGE_SIZE_BYTES);
                              ^~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:212:45: note: expanded from macro 'devctx_err'
           miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
                                               ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:203:5: note: expanded from macro 'miscdev_err'
                   ##va_args);                                                    \
                     ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:74:32: note: expanded from macro 'MAX_MESSAGE_SIZE_BYTES'
   #define MAX_MESSAGE_SIZE_BYTES (MAX_MESSAGE_SIZE * sizeof(u32))
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:501:63: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
           devctx_dbg(dev_ctx, "read to buf %p(%ld), ppos=%lld\n", buf, size,
                                               ~~~                      ^~~~
                                               %zu
   drivers/firmware/imx/seco_mu.c:208:45: note: expanded from macro 'devctx_dbg'
           miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
                                               ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:189:5: note: expanded from macro 'miscdev_dbg'
                   ##va_args);                                                    \
                     ^~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:529:7: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                              size, size_to_copy);
                              ^~~~
   drivers/firmware/imx/seco_mu.c:208:45: note: expanded from macro 'devctx_dbg'
           miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
                                               ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:189:5: note: expanded from macro 'miscdev_dbg'
                   ##va_args);                                                    \
                     ^~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:249:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:247:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:223:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:621:28: error: call to undeclared function 'devm_ioremap_nocache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           dev_ctx->secure_mem.ptr = devm_ioremap_nocache(dev_ctx->dev,
                                     ^
   drivers/firmware/imx/seco_mu.c:621:26: error: incompatible integer to pointer conversion assigning to 'u8 *' (aka 'unsigned char *') from 'int' [-Wint-conversion]
           dev_ctx->secure_mem.ptr = devm_ioremap_nocache(dev_ctx->dev,
                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]


vim +375 drivers/firmware/imx/seco_mu.c

   363	
   364	/* Write a message to the MU. */
   365	static ssize_t seco_mu_fops_write(struct file *fp, const char __user *buf,
   366					  size_t size, loff_t *ppos)
   367	{
   368		struct seco_mu_device_ctx *dev_ctx = container_of(fp->private_data,
   369						struct seco_mu_device_ctx, miscdev);
   370		struct seco_mu_priv *mu_priv = dev_ctx->mu_priv;
   371		u32 *data, data_idx = 0, nb_words = 0, header;
   372		struct mbox_chan *chan;
   373		int err;
   374	
 > 375		devctx_dbg(dev_ctx, "write from buf (%p)%ld, ppos=%lld\n", buf, size,
   376			   ((ppos) ? *ppos : 0));
   377	
   378		if (down_interruptible(&dev_ctx->fops_lock))
   379			return -EBUSY;
   380	
   381		if (dev_ctx->status != MU_OPENED) {
   382			err = -EINVAL;
   383			goto exit;
   384		}
   385	
   386		if (size < sizeof(struct she_mu_hdr)) {
   387			devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
 > 388				   sizeof(struct she_mu_hdr));
   389			err = -ENOSPC;
   390			goto exit;
   391		}
   392	
   393		if (size > MAX_MESSAGE_SIZE_BYTES) {
   394			devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
   395				   MAX_MESSAGE_SIZE_BYTES);
   396			err = -ENOSPC;
   397			goto exit;
   398		}
   399	
   400		/* Copy data to buffer */
   401		err = (int)copy_from_user(dev_ctx->temp_cmd, buf, size);
   402		if (err) {
   403			err = -EFAULT;
   404			devctx_err(dev_ctx, "Fail copy message from user\n");
   405			goto exit;
   406		}
   407	
   408		header = dev_ctx->temp_cmd[0];
   409	
   410		/* Check the message is valid according to tags */
   411		if (MESSAGE_TAG(header) == MESSAGING_TAG_COMMAND) {
   412			/*
   413			 * unlocked in seco_mu_receive_work_handler when the
   414			 * response to this command is received.
   415			 */
   416			mutex_lock(&mu_priv->mu_cmd_lock);
   417			mu_priv->waiting_rsp_dev = dev_ctx;
   418		} else if (MESSAGE_TAG(header) == MESSAGING_TAG_RESPONSE) {
   419			/* Check the device context can send the command */
   420			if (dev_ctx != mu_priv->cmd_receiver_dev) {
   421				devctx_err(dev_ctx,
   422					   "This channel is not configured to send response to SECO\n");
   423				err = -EPERM;
   424				goto exit;
   425			}
   426		} else {
   427			devctx_err(dev_ctx, "The message does not have a valid TAG\n");
   428			err = -EINVAL;
   429			goto exit;
   430		}
   431	
   432		/*
   433		 * Check that the size passed as argument matches the size
   434		 * carried in the message.
   435		 */
   436		nb_words = MESSAGE_SIZE(header);
   437		if (nb_words * sizeof(u32) != size) {
   438			devctx_err(dev_ctx, "User buffer too small\n");
   439			goto exit;
   440		}
   441	
   442		mutex_lock(&mu_priv->mu_lock);
   443	
   444		/* Send the first word along with the signaling */
   445		data = &dev_ctx->temp_cmd[data_idx];
   446		chan = mu_priv->com_chans[0].chan;
   447		devctx_dbg(dev_ctx, "sending[%d] %.8x\n", data_idx, *data);
   448		err = mbox_send_message(chan, data);
   449		if (err < 0) {
   450			devctx_err(dev_ctx, "Failed to send header\n");
   451			goto unlock;
   452		}
   453	
   454		devctx_dbg(dev_ctx, "%s\n", "signaling");
   455		err = mbox_send_message(mu_priv->tx_started, &data);
   456		if (err < 0) {
   457			devctx_err(dev_ctx, "Failed to send signal\n");
   458			goto unlock;
   459		}
   460	
   461		data_idx = 1;
   462	
   463		/* Loop over the data of the message to send */
   464		while (data_idx < nb_words) {
   465			data = &dev_ctx->temp_cmd[data_idx];
   466			chan = mu_priv->com_chans[data_idx % MU_TR_COUNT].chan;
   467	
   468			devctx_dbg(dev_ctx, "sending[%d] %.8x\n", data_idx, *data);
   469			err = mbox_send_message(chan, data);
   470			if (err < 0) {
   471				devctx_err(dev_ctx, "Failed to send data %d\n",
   472					   data_idx);
   473				goto unlock;
   474			}
   475			data_idx++;
   476		}
   477	
   478		err = data_idx * (u32)sizeof(u32);
   479	
   480	unlock:
   481		mutex_unlock(&mu_priv->mu_lock);
   482	
   483	exit:
   484		up(&dev_ctx->fops_lock);
   485		return err;
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
