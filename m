Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C7B79F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 09:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693475771; x=1725011771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OhW0EhtTLHSzw/hRPTzohiz+jyEWOnvAZgOrBoIehG0=;
  b=Ldwrd5xfO4LhZzvnCXfwKX937m7hKxIYkd9mDLgTzigTfVJ1jm+4SQ8b
   7jz86WaKw7VwREyBXcoTqiRNfb11sEZFwLYykfNHutTJyHaZizokktf+N
   kvLhayEUld2dnRfvOfC1gXXWrfGWaCqZYlwLn3KMSJa2rAHiRSPiyKjCD
   kKOYR/BjtfFQ9RyctK7Dv6vdGtCo2aQodHSDa/j4O6jPlGk9IzKnwsOFp
   uKYxfJJyOg0NcnU7q0JKtpEm8lHjPrTgD8QVQNyUf3FhKGjaw4tPocAuG
   G72ZvmbmKpaUi6yEsOSJRYc469iGU7IkNQmjtasFu2t4MMYTt1tPfFhvz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="356198187"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="356198187"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 02:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="829596773"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="829596773"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2023 02:56:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbePG-000BD6-2h;
	Thu, 31 Aug 2023 09:56:06 +0000
Date: Thu, 31 Aug 2023 17:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3171/24604]
 drivers/firmware/imx/seco_mu.c:375:66: warning: format specifies type 'long'
 but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202308311721.BcQvwBjV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Silvano,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: cbe5e27a90341a3c43c9457554c47475d0712d7b [3171/24604] LF-824: fw: imx: seco_mu: Add driver for SECO
config: riscv-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311721.BcQvwBjV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311721.BcQvwBjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311721.BcQvwBjV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/seco_mu.c:375:66: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     375 |         devctx_dbg(dev_ctx, "write from buf (%p)%ld, ppos=%lld\n", buf, size,
         |                                                 ~~~                     ^~~~
         |                                                 %u
   drivers/firmware/imx/seco_mu.c:208:45: note: expanded from macro 'devctx_dbg'
     208 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:189:5: note: expanded from macro 'miscdev_dbg'
     189 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     190 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:387:61: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     387 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                                                            ~~~            ^~~~
         |                                                            %u
   drivers/firmware/imx/seco_mu.c:212:45: note: expanded from macro 'devctx_err'
     212 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:203:5: note: expanded from macro 'miscdev_err'
     203 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     204 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
>> drivers/firmware/imx/seco_mu.c:388:7: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     388 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                                                                  ~~~
         |                                                                  %u
     389 |                            sizeof(struct she_mu_hdr));
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:212:45: note: expanded from macro 'devctx_err'
     212 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:203:5: note: expanded from macro 'miscdev_err'
     203 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     204 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:394:59: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     394 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                                                          ~~~            ^~~~
         |                                                          %u
   drivers/firmware/imx/seco_mu.c:212:45: note: expanded from macro 'devctx_err'
     212 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:203:5: note: expanded from macro 'miscdev_err'
     203 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     204 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:395:7: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     395 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                                                                ~~~
         |                                                                %u
     396 |                            MAX_MESSAGE_SIZE_BYTES);
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:212:45: note: expanded from macro 'devctx_err'
     212 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:203:5: note: expanded from macro 'miscdev_err'
     203 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     204 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:74:32: note: expanded from macro 'MAX_MESSAGE_SIZE_BYTES'
      74 | #define MAX_MESSAGE_SIZE_BYTES (MAX_MESSAGE_SIZE * sizeof(u32))
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:501:63: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     501 |         devctx_dbg(dev_ctx, "read to buf %p(%ld), ppos=%lld\n", buf, size,
         |                                             ~~~                      ^~~~
         |                                             %u
   drivers/firmware/imx/seco_mu.c:208:45: note: expanded from macro 'devctx_dbg'
     208 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:189:5: note: expanded from macro 'miscdev_dbg'
     189 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     190 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:529:7: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     529 |                 devctx_dbg(dev_ctx, "User buffer too small (%ld < %d)\n",
         |                                                             ~~~
         |                                                             %u
     530 |                            size, size_to_copy);
         |                            ^~~~
   drivers/firmware/imx/seco_mu.c:208:45: note: expanded from macro 'devctx_dbg'
     208 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:189:5: note: expanded from macro 'miscdev_dbg'
     189 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     190 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:621:28: error: implicit declaration of function 'devm_ioremap_nocache' [-Werror,-Wimplicit-function-declaration]
     621 |         dev_ctx->secure_mem.ptr = devm_ioremap_nocache(dev_ctx->dev,


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
