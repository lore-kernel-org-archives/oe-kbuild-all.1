Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004BE28EF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 01:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727574611; cv=none; b=IutTuN1GuH80z/mRLFx4W6kwZY5iokdkcNUcAAjZPTwthi5F0eOEsHn/WosDWFjeAxuphtoB2IDegxde6yt5bYwrpETee4jjeQtxnQa7u3e5OrHXiCxnOewdKrpCCk5vgo70Dk2AeyURVoePZXNiTexI8EQXQgqFs78VbDDFqz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727574611; c=relaxed/simple;
	bh=PbFY1WEYbIG/9GWxcXMaFMLKY1Ube5j6ZYbfdNCCo5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VjWP7I+HOg8wlYTUYJ94OCxS4kbTFWzG+Qi5P2dfQyO/ObwpoJsAZiP9rePkzsGGNLirEJhG71qgpGYmhaf9w/+kaK2VLNKbJnVI6O5p94RfPY2oXvpxPWYXNig1nMHUehd6dvV5wZrbUVic0OPUvWgVuHbggMsqpoMMOS9O6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sd6nAXhs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sd6nAXhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727574610; x=1759110610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PbFY1WEYbIG/9GWxcXMaFMLKY1Ube5j6ZYbfdNCCo5I=;
  b=Sd6nAXhsecJtVYVbpewlZg+iqAtsnZxuILNeY5LTEH0a1hLqGMQyQ3U5
   yecmjTzFXh8bQazQjrb7IDQ/4qfZymqcJ2mk0XTUCviRD6Ex+38Uq/pha
   efdC09TBqA2Tmg1PluqDg/eiBekatETuPAYOWH+6J50fdrnetQmafjdkJ
   Aw6HskF9UFF2htXTdC6vtAj5Cj3DVVSc9O1h9d6v0vQpShceO1j6qzFEb
   1+6hBlVQ5alVImuxxXvwnmLMXIIf00uq1jE2xAXL1UexIG4cadNTCGjt7
   IQ4ozZZg53Re1bz74pVvNjzDsSZ4ixbBTEVWctcqntju2Gt2qhENxZOFr
   w==;
X-CSE-ConnectionGUID: LXEvSXzcTZiUjLhC6Txugw==
X-CSE-MsgGUID: UYkny9mKQ0+NpdR8wBHEqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="29566385"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="29566385"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 18:50:09 -0700
X-CSE-ConnectionGUID: 8BkRTOglQeCvFIe4VmK/fw==
X-CSE-MsgGUID: ex6qAMYMT3mf09pScS/r9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72493423"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 18:50:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suj4Y-000Np5-0v;
	Sun, 29 Sep 2024 01:50:06 +0000
Date: Sun, 29 Sep 2024 09:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4915/16788]
 drivers/firmware/imx/seco_mu.c:359:66: warning: format specifies type 'long'
 but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202409290954.dFdprKVP-lkp@intel.com>
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
commit: 5b8f160ce229e143c7ce69cf619a7b3fc947d9d5 [4915/16788] LF-824: fw: imx: seco_mu: Add driver for SECO
config: arm-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290954.dFdprKVP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290954.dFdprKVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290954.dFdprKVP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/imx/seco_mu.c:57:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/firmware/imx/seco_mu.c:359:66: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     359 |         devctx_dbg(dev_ctx, "write from buf (%p)%ld, ppos=%lld\n", buf, size,
         |                                                 ~~~                     ^~~~
         |                                                 %zu
   drivers/firmware/imx/seco_mu.c:193:45: note: expanded from macro 'devctx_dbg'
     193 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:174:5: note: expanded from macro 'miscdev_dbg'
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     174 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:371:61: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     371 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                                                            ~~~            ^~~~
         |                                                            %zu
   drivers/firmware/imx/seco_mu.c:197:45: note: expanded from macro 'devctx_err'
     197 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:188:5: note: expanded from macro 'miscdev_err'
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     188 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
>> drivers/firmware/imx/seco_mu.c:372:7: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     371 |                 devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
         |                                                                  ~~~
         |                                                                  %u
     372 |                            sizeof(struct she_mu_hdr));
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:197:45: note: expanded from macro 'devctx_err'
     197 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:188:5: note: expanded from macro 'miscdev_err'
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     188 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:378:59: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     378 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                                                          ~~~            ^~~~
         |                                                          %zu
   drivers/firmware/imx/seco_mu.c:197:45: note: expanded from macro 'devctx_err'
     197 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:188:5: note: expanded from macro 'miscdev_err'
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     188 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:379:7: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
     378 |                 devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
         |                                                                ~~~
         |                                                                %u
     379 |                            MAX_MESSAGE_SIZE_BYTES);
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:197:45: note: expanded from macro 'devctx_err'
     197 |         miscdev_err((&(p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:188:5: note: expanded from macro 'miscdev_err'
     187 |                 dev_err((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     188 |                 ##va_args);                                                    \
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
   drivers/firmware/imx/seco_mu.c:462:63: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     462 |         devctx_dbg(dev_ctx, "read to buf %p(%ld), ppos=%lld\n", buf, size,
         |                                             ~~~                      ^~~~
         |                                             %zu
   drivers/firmware/imx/seco_mu.c:193:45: note: expanded from macro 'devctx_dbg'
     193 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:174:5: note: expanded from macro 'miscdev_dbg'
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     174 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
   drivers/firmware/imx/seco_mu.c:490:7: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     489 |                 devctx_dbg(dev_ctx, "User buffer too small (%ld < %d)\n",
         |                                                             ~~~
         |                                                             %zu
     490 |                            size, size_to_copy);
         |                            ^~~~
   drivers/firmware/imx/seco_mu.c:193:45: note: expanded from macro 'devctx_dbg'
     193 |         miscdev_dbg(&((p_devctx)->miscdev), fmt, ##va_args)
         |                                             ~~~    ^~~~~~~
   drivers/firmware/imx/seco_mu.c:174:5: note: expanded from macro 'miscdev_dbg'
     173 |                 dev_dbg((_p_miscdev)->parent, "%s: " fmt, (_p_miscdev)->name,  \
         |                                                      ~~~
     174 |                 ##va_args);                                                    \
         |                   ^~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ~~~    ^~~~~~~~~~~
   8 warnings generated.


vim +359 drivers/firmware/imx/seco_mu.c

   348	
   349	/* Write a message to the MU. */
   350	static ssize_t seco_mu_fops_write(struct file *fp, const char __user *buf,
   351					  size_t size, loff_t *ppos)
   352	{
   353		struct seco_mu_device_ctx *dev_ctx = container_of(fp->private_data,
   354						struct seco_mu_device_ctx, miscdev);
   355		struct seco_mu_priv *mu_priv = dev_ctx->mu_priv;
   356		u32 nb_words = 0, header;
   357		int err;
   358	
 > 359		devctx_dbg(dev_ctx, "write from buf (%p)%ld, ppos=%lld\n", buf, size,
   360			   ((ppos) ? *ppos : 0));
   361	
   362		if (down_interruptible(&dev_ctx->fops_lock))
   363			return -EBUSY;
   364	
   365		if (dev_ctx->status != MU_OPENED) {
   366			err = -EINVAL;
   367			goto exit;
   368		}
   369	
   370		if (size < sizeof(struct she_mu_hdr)) {
   371			devctx_err(dev_ctx, "User buffer too small(%ld < %lu)\n", size,
 > 372				   sizeof(struct she_mu_hdr));
   373			err = -ENOSPC;
   374			goto exit;
   375		}
   376	
   377		if (size > MAX_MESSAGE_SIZE_BYTES) {
   378			devctx_err(dev_ctx, "User buffer too big(%ld > %lu)\n", size,
   379				   MAX_MESSAGE_SIZE_BYTES);
   380			err = -ENOSPC;
   381			goto exit;
   382		}
   383	
   384		/* Copy data to buffer */
   385		err = (int)copy_from_user(dev_ctx->temp_cmd, buf, size);
   386		if (err) {
   387			err = -EFAULT;
   388			devctx_err(dev_ctx, "Fail copy message from user\n");
   389			goto exit;
   390		}
   391	
   392		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
   393				     dev_ctx->temp_cmd, size, false);
   394	
   395		header = dev_ctx->temp_cmd[0];
   396	
   397		/* Check the message is valid according to tags */
   398		if (MESSAGE_TAG(header) == MESSAGING_TAG_COMMAND) {
   399			/*
   400			 * unlocked in seco_mu_receive_work_handler when the
   401			 * response to this command is received.
   402			 */
   403			mutex_lock(&mu_priv->mu_cmd_lock);
   404			mu_priv->waiting_rsp_dev = dev_ctx;
   405		} else if (MESSAGE_TAG(header) == MESSAGING_TAG_RESPONSE) {
   406			/* Check the device context can send the command */
   407			if (dev_ctx != mu_priv->cmd_receiver_dev) {
   408				devctx_err(dev_ctx,
   409					   "This channel is not configured to send response to SECO\n");
   410				err = -EPERM;
   411				goto exit;
   412			}
   413		} else {
   414			devctx_err(dev_ctx, "The message does not have a valid TAG\n");
   415			err = -EINVAL;
   416			goto exit;
   417		}
   418	
   419		/*
   420		 * Check that the size passed as argument matches the size
   421		 * carried in the message.
   422		 */
   423		nb_words = MESSAGE_SIZE(header);
   424		if (nb_words * sizeof(u32) != size) {
   425			devctx_err(dev_ctx, "User buffer too small\n");
   426			goto exit;
   427		}
   428	
   429		mutex_lock(&mu_priv->mu_lock);
   430	
   431		/* Send message */
   432		devctx_dbg(dev_ctx, "sending message\n");
   433		err = mbox_send_message(mu_priv->tx_chan, dev_ctx->temp_cmd);
   434		if (err < 0) {
   435			devctx_err(dev_ctx, "Failed to send message\n");
   436			goto unlock;
   437		}
   438	
   439		err = nb_words * (u32)sizeof(u32);
   440	
   441	unlock:
   442		mutex_unlock(&mu_priv->mu_lock);
   443	
   444	exit:
   445		up(&dev_ctx->fops_lock);
   446		return err;
   447	}
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
