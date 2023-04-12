Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D35A3C02
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681327775; x=1712863775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iqclz4BoP0C2BtflSpF5bmUHZPpAsu7m1T8IfCfAQfg=;
  b=id1KCPSMjW+5FRJeVFBKoZrqWNafcyXuwZypcOmOVudhdIMJwGDmq4GG
   jJp8OHcV1fUqCNAme8bE9smWYX3E+ejlhbU5/DzCz/RSUU8csNIWq3Ptt
   aiX3tUlcM50fhSOQ/bAd8s1FSS5qOIPhuTzglx1HVnjOIiFb88wFrobX0
   Q90KEhDRyxT61BJOngJIZiRzZiraQKsb1CmjFUwL33iGE0b9V4xWkRKlb
   NExmTIWquF/hv1WuLYzWXy5GMCnwdxbgsmQ/RJby60nuyaBtWTKbiLd0h
   fNy2wEtmIWq71C31+9nhw/MAduwq6QfIGbv78b2sri6d4IP3vKEs8obBw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323624597"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323624597"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 12:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863434481"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="863434481"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2023 12:29:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmg9h-000Y0v-2k;
	Wed, 12 Apr 2023 19:29:21 +0000
Date: Thu, 13 Apr 2023 03:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:master 633/1117]
 drivers/dma/xilinx/axidmatest.c:339:54: warning: implicit conversion from
 'enum dma_transfer_direction' to 'enum dma_data_direction'
Message-ID: <202304130357.ZdkbssU0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Appana,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: 5bf6f542e9c5f1b9da03ad2730bb9ae8b56731c9 [633/1117] dmaengine: xilinx: Add axidmatest test client code
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230413/202304130357.ZdkbssU0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/5bf6f542e9c5f1b9da03ad2730bb9ae8b56731c9
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 5bf6f542e9c5f1b9da03ad2730bb9ae8b56731c9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma/xilinx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130357.ZdkbssU0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dma/xilinx_dma.h:11,
                    from drivers/dma/xilinx/axidmatest.c:24:
   drivers/dma/xilinx/axidmatest.c: In function 'dmatest_slave_func':
>> drivers/dma/xilinx/axidmatest.c:339:54: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     339 |                                                      DMA_MEM_TO_DEV);
         |                                                      ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:411:66: note: in definition of macro 'dma_map_single'
     411 | #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
         |                                                                  ^
   drivers/dma/xilinx/axidmatest.c:370:50: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     370 |                                                  DMA_MEM_TO_DEV);
         |                                                  ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:412:70: note: in definition of macro 'dma_unmap_single'
     412 | #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
         |                                                                      ^


vim +339 drivers/dma/xilinx/axidmatest.c

   224	
   225	/* Function for slave transfers
   226	 * Each thread requires 2 channels, one for transmit, and one for receive
   227	 */
   228	static int dmatest_slave_func(void *data)
   229	{
   230		struct dmatest_slave_thread	*thread = data;
   231		struct dma_chan *tx_chan;
   232		struct dma_chan *rx_chan;
   233		const char *thread_name;
   234		unsigned int src_off, dst_off, len;
   235		unsigned int error_count;
   236		unsigned int failed_tests = 0;
   237		unsigned int total_tests = 0;
   238		dma_cookie_t tx_cookie;
   239		dma_cookie_t rx_cookie;
   240		enum dma_status status;
   241		enum dma_ctrl_flags flags;
   242		int ret;
   243		int src_cnt;
   244		int dst_cnt;
   245		int bd_cnt = XILINX_DMATEST_BD_CNT;
   246		int i;
   247	
   248		ktime_t	ktime, start, diff;
   249		ktime_t	filltime = 0;
   250		ktime_t	comparetime = 0;
   251		s64 runtime = 0;
   252		unsigned long long total_len = 0;
   253		thread_name = current->comm;
   254		ret = -ENOMEM;
   255	
   256	
   257		/* Ensure that all previous reads are complete */
   258		smp_rmb();
   259		tx_chan = thread->tx_chan;
   260		rx_chan = thread->rx_chan;
   261		dst_cnt = bd_cnt;
   262		src_cnt = bd_cnt;
   263	
   264		thread->srcs = kcalloc(src_cnt + 1, sizeof(u8 *), GFP_KERNEL);
   265		if (!thread->srcs)
   266			goto err_srcs;
   267		for (i = 0; i < src_cnt; i++) {
   268			thread->srcs[i] = kmalloc(test_buf_size, GFP_KERNEL);
   269			if (!thread->srcs[i])
   270				goto err_srcbuf;
   271		}
   272		thread->srcs[i] = NULL;
   273	
   274		thread->dsts = kcalloc(dst_cnt + 1, sizeof(u8 *), GFP_KERNEL);
   275		if (!thread->dsts)
   276			goto err_dsts;
   277		for (i = 0; i < dst_cnt; i++) {
   278			thread->dsts[i] = kmalloc(test_buf_size, GFP_KERNEL);
   279			if (!thread->dsts[i])
   280				goto err_dstbuf;
   281		}
   282		thread->dsts[i] = NULL;
   283	
   284		set_user_nice(current, 10);
   285	
   286		flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
   287	
   288		ktime = ktime_get();
   289		while (!kthread_should_stop() &&
   290		       !(iterations && total_tests >= iterations)) {
   291			struct dma_device *tx_dev = tx_chan->device;
   292			struct dma_device *rx_dev = rx_chan->device;
   293			struct dma_async_tx_descriptor *txd = NULL;
   294			struct dma_async_tx_descriptor *rxd = NULL;
   295			dma_addr_t dma_srcs[XILINX_DMATEST_BD_CNT];
   296			dma_addr_t dma_dsts[XILINX_DMATEST_BD_CNT];
   297			struct completion rx_cmp;
   298			struct completion tx_cmp;
   299			unsigned long rx_tmo =
   300					msecs_to_jiffies(300000); /* RX takes longer */
   301			unsigned long tx_tmo = msecs_to_jiffies(30000);
   302			u8 align = 0;
   303			struct scatterlist tx_sg[XILINX_DMATEST_BD_CNT];
   304			struct scatterlist rx_sg[XILINX_DMATEST_BD_CNT];
   305	
   306			total_tests++;
   307	
   308			/* honor larger alignment restrictions */
   309			align = tx_dev->copy_align;
   310			if (rx_dev->copy_align > align)
   311				align = rx_dev->copy_align;
   312	
   313			if (1 << align > test_buf_size) {
   314				pr_err("%u-byte buffer too small for %d-byte alignment\n",
   315				       test_buf_size, 1 << align);
   316				break;
   317			}
   318	
   319			len = dmatest_random() % test_buf_size + 1;
   320			len = (len >> align) << align;
   321			if (!len)
   322				len = 1 << align;
   323			src_off = dmatest_random() % (test_buf_size - len + 1);
   324			dst_off = dmatest_random() % (test_buf_size - len + 1);
   325	
   326			src_off = (src_off >> align) << align;
   327			dst_off = (dst_off >> align) << align;
   328	
   329			start = ktime_get();
   330			dmatest_init_srcs(thread->srcs, src_off, len);
   331			dmatest_init_dsts(thread->dsts, dst_off, len);
   332			diff = ktime_sub(ktime_get(), start);
   333			filltime = ktime_add(filltime, diff);
   334	
   335			for (i = 0; i < src_cnt; i++) {
   336				u8 *buf = thread->srcs[i] + src_off;
   337	
   338				dma_srcs[i] = dma_map_single(tx_dev->dev, buf, len,
 > 339							     DMA_MEM_TO_DEV);
   340			}
   341	
   342			for (i = 0; i < dst_cnt; i++) {
   343				dma_dsts[i] = dma_map_single(rx_dev->dev,
   344							     thread->dsts[i],
   345							     test_buf_size,
   346							     DMA_BIDIRECTIONAL);
   347			}
   348	
   349			sg_init_table(tx_sg, bd_cnt);
   350			sg_init_table(rx_sg, bd_cnt);
   351	
   352			for (i = 0; i < bd_cnt; i++) {
   353				sg_dma_address(&tx_sg[i]) = dma_srcs[i];
   354				sg_dma_address(&rx_sg[i]) = dma_dsts[i] + dst_off;
   355	
   356				sg_dma_len(&tx_sg[i]) = len;
   357				sg_dma_len(&rx_sg[i]) = len;
   358				total_len += len;
   359			}
   360	
   361			rxd = rx_dev->device_prep_slave_sg(rx_chan, rx_sg, bd_cnt,
   362					DMA_DEV_TO_MEM, flags, NULL);
   363	
   364			txd = tx_dev->device_prep_slave_sg(tx_chan, tx_sg, bd_cnt,
   365					DMA_MEM_TO_DEV, flags, NULL);
   366	
   367			if (!rxd || !txd) {
   368				for (i = 0; i < src_cnt; i++)
   369					dma_unmap_single(tx_dev->dev, dma_srcs[i], len,
   370							 DMA_MEM_TO_DEV);
   371				for (i = 0; i < dst_cnt; i++)
   372					dma_unmap_single(rx_dev->dev, dma_dsts[i],
   373							 test_buf_size,
   374							 DMA_BIDIRECTIONAL);
   375				pr_warn("%s: #%u: prep error with src_off=0x%x ",
   376					thread_name, total_tests - 1, src_off);
   377				pr_warn("dst_off=0x%x len=0x%x\n",
   378					dst_off, len);
   379				msleep(100);
   380				failed_tests++;
   381				continue;
   382			}
   383	
   384			init_completion(&rx_cmp);
   385			rxd->callback = dmatest_slave_rx_callback;
   386			rxd->callback_param = &rx_cmp;
   387			rx_cookie = rxd->tx_submit(rxd);
   388	
   389			init_completion(&tx_cmp);
   390			txd->callback = dmatest_slave_tx_callback;
   391			txd->callback_param = &tx_cmp;
   392			tx_cookie = txd->tx_submit(txd);
   393	
   394			if (dma_submit_error(rx_cookie) ||
   395			    dma_submit_error(tx_cookie)) {
   396				pr_warn("%s: #%u: submit error %d/%d with src_off=0x%x ",
   397					thread_name, total_tests - 1,
   398					rx_cookie, tx_cookie, src_off);
   399				pr_warn("dst_off=0x%x len=0x%x\n",
   400					dst_off, len);
   401				msleep(100);
   402				failed_tests++;
   403				continue;
   404			}
   405			dma_async_issue_pending(rx_chan);
   406			dma_async_issue_pending(tx_chan);
   407	
   408			tx_tmo = wait_for_completion_timeout(&tx_cmp, tx_tmo);
   409	
   410			status = dma_async_is_tx_complete(tx_chan, tx_cookie,
   411							  NULL, NULL);
   412	
   413			if (tx_tmo == 0) {
   414				pr_warn("%s: #%u: tx test timed out\n",
   415					thread_name, total_tests - 1);
   416				failed_tests++;
   417				continue;
   418			} else if (status != DMA_COMPLETE) {
   419				pr_warn("%s: #%u: tx got completion callback, ",
   420					thread_name, total_tests - 1);
   421				pr_warn("but status is \'%s\'\n",
   422					status == DMA_ERROR ? "error" :
   423					"in progress");
   424				failed_tests++;
   425				continue;
   426			}
   427	
   428			rx_tmo = wait_for_completion_timeout(&rx_cmp, rx_tmo);
   429			status = dma_async_is_tx_complete(rx_chan, rx_cookie,
   430							  NULL, NULL);
   431	
   432			if (rx_tmo == 0) {
   433				pr_warn("%s: #%u: rx test timed out\n",
   434					thread_name, total_tests - 1);
   435				failed_tests++;
   436				continue;
   437			} else if (status != DMA_COMPLETE) {
   438				pr_warn("%s: #%u: rx got completion callback, ",
   439					thread_name, total_tests - 1);
   440				pr_warn("but status is \'%s\'\n",
   441					status == DMA_ERROR ? "error" :
   442					"in progress");
   443				failed_tests++;
   444				continue;
   445			}
   446	
   447			/* Unmap by myself */
   448			for (i = 0; i < dst_cnt; i++)
   449				dma_unmap_single(rx_dev->dev, dma_dsts[i],
   450						 test_buf_size, DMA_BIDIRECTIONAL);
   451	
   452			error_count = 0;
   453			start = ktime_get();
   454			pr_debug("%s: verifying source buffer...\n", thread_name);
   455			error_count += dmatest_verify(thread->srcs, 0, src_off,
   456					0, PATTERN_SRC, true);
   457			error_count += dmatest_verify(thread->srcs, src_off,
   458					src_off + len, src_off,
   459					PATTERN_SRC | PATTERN_COPY, true);
   460			error_count += dmatest_verify(thread->srcs, src_off + len,
   461					test_buf_size, src_off + len,
   462					PATTERN_SRC, true);
   463	
   464			pr_debug("%s: verifying dest buffer...\n",
   465				 thread->task->comm);
   466			error_count += dmatest_verify(thread->dsts, 0, dst_off,
   467					0, PATTERN_DST, false);
   468			error_count += dmatest_verify(thread->dsts, dst_off,
   469					dst_off + len, src_off,
   470					PATTERN_SRC | PATTERN_COPY, false);
   471			error_count += dmatest_verify(thread->dsts, dst_off + len,
   472					test_buf_size, dst_off + len,
   473					PATTERN_DST, false);
   474			diff = ktime_sub(ktime_get(), start);
   475			comparetime = ktime_add(comparetime, diff);
   476	
   477			if (error_count) {
   478				pr_warn("%s: #%u: %u errors with ",
   479					thread_name, total_tests - 1, error_count);
   480				pr_warn("src_off=0x%x dst_off=0x%x len=0x%x\n",
   481					src_off, dst_off, len);
   482				failed_tests++;
   483			} else {
   484				pr_debug("%s: #%u: No errors with ",
   485					 thread_name, total_tests - 1);
   486				pr_debug("src_off=0x%x dst_off=0x%x len=0x%x\n",
   487					 src_off, dst_off, len);
   488			}
   489		}
   490	
   491		ktime = ktime_sub(ktime_get(), ktime);
   492		ktime = ktime_sub(ktime, comparetime);
   493		ktime = ktime_sub(ktime, filltime);
   494		runtime = ktime_to_us(ktime);
   495	
   496		ret = 0;
   497		for (i = 0; thread->dsts[i]; i++)
   498			kfree(thread->dsts[i]);
   499	err_dstbuf:
   500		kfree(thread->dsts);
   501	err_dsts:
   502		for (i = 0; thread->srcs[i]; i++)
   503			kfree(thread->srcs[i]);
   504	err_srcbuf:
   505		kfree(thread->srcs);
   506	err_srcs:
   507		pr_notice("%s: terminating after %u tests, %u failures %llu iops %llu KB/s (status %d)\n",
   508			  thread_name, total_tests, failed_tests,
   509			  dmatest_persec(runtime, total_tests),
   510			  dmatest_KBs(runtime, total_len), ret);
   511	
   512		thread->done = true;
   513		wake_up(&thread_wait);
   514	
   515		return ret;
   516	}
   517	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
