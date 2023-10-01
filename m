Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDE14F73
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 22:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696199396; x=1727735396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sr5+mtv9O0D6ETATWkWZFxcK56F/h7geUL1RtbqY1LM=;
  b=gXVwWBXF+RtjHdP2pshqSaqLbFL1k/8WvvKkdzTBNV1u6pwxhxPN6H1L
   1WXkKJIduRxRq2n9hLsmWhxY1oNZ7MPh3ZEmTV+B09cZCze7TK91B7/U1
   3+qAMaP/DC8bLcabugTgRojUrSgBILRRJhYdz6goGOiFuI0ecca7kaPJv
   151Oh9DOxAe+acpPsKUKKB5v6RrOYJtSQK22iQwLzkhp2XHt35UCupJUT
   7HyQzmWySZgYCPR9fIqrn0fHmiGMK7fZMFkXL0YLnZFO6UnyWxbzPappz
   9O0Xw9Q/BZ15RWGWleqcb1pItzZmK9yYw+T46eAE1AlTZ9Vs7mxKgn8a9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="367618182"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="367618182"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 15:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="820718797"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="820718797"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2023 15:29:53 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qn4wh-0005Tt-0x;
	Sun, 01 Oct 2023 22:29:51 +0000
Date: Mon, 2 Oct 2023 06:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radheys@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 632/1370]
 drivers/dma/xilinx/vdmatest.c:329:57: warning: implicit conversion from
 'enum dma_transfer_direction' to 'enum dma_data_direction'
Message-ID: <202310020617.pOdzkKBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 1f464166a3f0edcd429cbc04936c65a8fd29415f [632/1370] dmaengine: xilinx: Add vdmatest test client code
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231002/202310020617.pOdzkKBW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231002/202310020617.pOdzkKBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310020617.pOdzkKBW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/dma/xilinx_dma.h:11,
                    from drivers/dma/xilinx/vdmatest.c:21:
   drivers/dma/xilinx/vdmatest.c: In function 'xilinx_vdmatest_slave_func':
>> drivers/dma/xilinx/vdmatest.c:329:57: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     329 |                                                         DMA_DEV_TO_MEM);
         |                                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:411:66: note: in definition of macro 'dma_map_single'
     411 | #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
         |                                                                  ^
   drivers/dma/xilinx/vdmatest.c:350:57: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     350 |                                                         DMA_MEM_TO_DEV);
         |                                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:411:66: note: in definition of macro 'dma_map_single'
     411 | #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
         |                                                                  ^
   drivers/dma/xilinx/vdmatest.c:370:49: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     370 |                                                 DMA_MEM_TO_DEV);
         |                                                 ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:412:70: note: in definition of macro 'dma_unmap_single'
     412 | #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
         |                                                                      ^
   drivers/dma/xilinx/vdmatest.c:374:49: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     374 |                                                 DMA_DEV_TO_MEM);
         |                                                 ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:412:70: note: in definition of macro 'dma_unmap_single'
     412 | #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
         |                                                                      ^
   drivers/dma/xilinx/vdmatest.c:446:57: warning: implicit conversion from 'enum dma_transfer_direction' to 'enum dma_data_direction' [-Wenum-conversion]
     446 |                                          test_buf_size, DMA_DEV_TO_MEM);
         |                                                         ^~~~~~~~~~~~~~
   include/linux/dma-mapping.h:412:70: note: in definition of macro 'dma_unmap_single'
     412 | #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
         |                                                                      ^
   drivers/dma/xilinx/vdmatest.c:359:31: warning: array subscript 0 is outside array bounds of 'struct data_chunk[]' [-Warray-bounds=]
     359 |                         xt.sgl[0].size = hsize;
         |                         ~~~~~~^~~
   In file included from include/linux/dma/xilinx_dma.h:12:
   include/linux/dmaengine.h:160:27: note: while referencing 'sgl'
     160 |         struct data_chunk sgl[];
         |                           ^~~
   drivers/dma/xilinx/vdmatest.c:110:40: note: defined here 'xt'
     110 | static struct dma_interleaved_template xt;
         |                                        ^~
   drivers/dma/xilinx/vdmatest.c:360:31: warning: array subscript 0 is outside array bounds of 'struct data_chunk[]' [-Warray-bounds=]
     360 |                         xt.sgl[0].icg = 0;
         |                         ~~~~~~^~~
   include/linux/dmaengine.h:160:27: note: while referencing 'sgl'
     160 |         struct data_chunk sgl[];
         |                           ^~~
   drivers/dma/xilinx/vdmatest.c:110:40: note: defined here 'xt'
     110 | static struct dma_interleaved_template xt;
         |                                        ^~
   drivers/dma/xilinx/vdmatest.c:338:31: warning: array subscript 0 is outside array bounds of 'struct data_chunk[]' [-Warray-bounds=]
     338 |                         xt.sgl[0].size = hsize;
         |                         ~~~~~~^~~
   include/linux/dmaengine.h:160:27: note: while referencing 'sgl'
     160 |         struct data_chunk sgl[];
         |                           ^~~
   drivers/dma/xilinx/vdmatest.c:110:40: note: defined here 'xt'
     110 | static struct dma_interleaved_template xt;
         |                                        ^~
   drivers/dma/xilinx/vdmatest.c:339:31: warning: array subscript 0 is outside array bounds of 'struct data_chunk[]' [-Warray-bounds=]
     339 |                         xt.sgl[0].icg = 0;
         |                         ~~~~~~^~~
   include/linux/dmaengine.h:160:27: note: while referencing 'sgl'
     160 |         struct data_chunk sgl[];
         |                           ^~~
   drivers/dma/xilinx/vdmatest.c:110:40: note: defined here 'xt'
     110 | static struct dma_interleaved_template xt;
         |                                        ^~
--
>> drivers/dma/xilinx/vdmatest.c:89: warning: expecting prototype for struct vdmatest_slave_thread. Prototype was for struct xilinx_vdmatest_slave_thread instead
>> drivers/dma/xilinx/vdmatest.c:101: warning: expecting prototype for struct vdmatest_chan. Prototype was for struct xilinx_vdmatest_chan instead


vim +329 drivers/dma/xilinx/vdmatest.c

   233	
   234	/*
   235	 * Function for slave transfers
   236	 * Each thread requires 2 channels, one for transmit, and one for receive
   237	 */
   238	static int xilinx_vdmatest_slave_func(void *data)
   239	{
   240		struct xilinx_vdmatest_slave_thread *thread = data;
   241		struct dma_chan *tx_chan, *rx_chan;
   242		const char *thread_name;
   243		unsigned int len, error_count;
   244		unsigned int failed_tests = 0, total_tests = 0;
   245		dma_cookie_t tx_cookie = 0, rx_cookie = 0;
   246		enum dma_status status;
   247		enum dma_ctrl_flags flags;
   248		int ret = -ENOMEM, i;
   249		struct xilinx_vdma_config config;
   250	
   251		thread_name = current->comm;
   252	
   253		/* Limit testing scope here */
   254		test_buf_size = hsize * vsize;
   255	
   256		/* This barrier ensures 'thread' is initialized and
   257		 * we get valid DMA channels
   258		 */
   259		smp_rmb();
   260		tx_chan = thread->tx_chan;
   261		rx_chan = thread->rx_chan;
   262	
   263		thread->srcs = kcalloc(frm_cnt+1, sizeof(u8 *), GFP_KERNEL);
   264		if (!thread->srcs)
   265			goto err_srcs;
   266		for (i = 0; i < frm_cnt; i++) {
   267			thread->srcs[i] = kmalloc(test_buf_size, GFP_KERNEL);
   268			if (!thread->srcs[i])
   269				goto err_srcbuf;
   270		}
   271	
   272		thread->dsts = kcalloc(frm_cnt+1, sizeof(u8 *), GFP_KERNEL);
   273		if (!thread->dsts)
   274			goto err_dsts;
   275		for (i = 0; i < frm_cnt; i++) {
   276			thread->dsts[i] = kmalloc(test_buf_size, GFP_KERNEL);
   277			if (!thread->dsts[i])
   278				goto err_dstbuf;
   279		}
   280	
   281		set_user_nice(current, 10);
   282	
   283		flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
   284	
   285		while (!kthread_should_stop()
   286			&& !(iterations && total_tests >= iterations)) {
   287			struct dma_device *tx_dev = tx_chan->device;
   288			struct dma_device *rx_dev = rx_chan->device;
   289			struct dma_async_tx_descriptor *txd = NULL;
   290			struct dma_async_tx_descriptor *rxd = NULL;
   291			struct completion rx_cmp, tx_cmp;
   292			unsigned long rx_tmo =
   293					msecs_to_jiffies(30000); /* RX takes longer */
   294			unsigned long tx_tmo = msecs_to_jiffies(30000);
   295			u8 align = 0;
   296	
   297			total_tests++;
   298	
   299			/* honor larger alignment restrictions */
   300			align = tx_dev->copy_align;
   301			if (rx_dev->copy_align > align)
   302				align = rx_dev->copy_align;
   303	
   304			if (1 << align > test_buf_size) {
   305				pr_err("%u-byte buffer too small for %d-byte alignment\n",
   306				       test_buf_size, 1 << align);
   307				break;
   308			}
   309	
   310			len = test_buf_size;
   311			xilinx_vdmatest_init_srcs(thread->srcs, 0, len);
   312			xilinx_vdmatest_init_dsts(thread->dsts, 0, len);
   313	
   314			/* Zero out configuration */
   315			memset(&config, 0, sizeof(struct xilinx_vdma_config));
   316	
   317			/* Set up hardware configuration information */
   318			config.frm_cnt_en = 1;
   319			config.coalesc = frm_cnt * 10;
   320			config.park = 1;
   321			xilinx_vdma_channel_set_config(tx_chan, &config);
   322	
   323			xilinx_vdma_channel_set_config(rx_chan, &config);
   324	
   325			for (i = 0; i < frm_cnt; i++) {
   326				dma_dsts[i] = dma_map_single(rx_dev->dev,
   327								thread->dsts[i],
   328								test_buf_size,
 > 329								DMA_DEV_TO_MEM);
   330	
   331				if (dma_mapping_error(rx_dev->dev, dma_dsts[i])) {
   332					failed_tests++;
   333					continue;
   334				}
   335				xt.dst_start = dma_dsts[i];
   336				xt.dir = DMA_DEV_TO_MEM;
   337				xt.numf = vsize;
   338				xt.sgl[0].size = hsize;
   339				xt.sgl[0].icg = 0;
   340				xt.frame_size = 1;
   341				rxd = rx_dev->device_prep_interleaved_dma(rx_chan,
   342									  &xt, flags);
   343				rx_cookie = rxd->tx_submit(rxd);
   344			}
   345	
   346			for (i = 0; i < frm_cnt; i++) {
   347				u8 *buf = thread->srcs[i];
   348	
   349				dma_srcs[i] = dma_map_single(tx_dev->dev, buf, len,
   350								DMA_MEM_TO_DEV);
   351	
   352				if (dma_mapping_error(tx_dev->dev, dma_srcs[i])) {
   353					failed_tests++;
   354					continue;
   355				}
   356				xt.src_start = dma_srcs[i];
   357				xt.dir = DMA_MEM_TO_DEV;
   358				xt.numf = vsize;
   359				xt.sgl[0].size = hsize;
   360				xt.sgl[0].icg = 0;
   361				xt.frame_size = 1;
   362				txd = tx_dev->device_prep_interleaved_dma(tx_chan,
   363									  &xt, flags);
   364				tx_cookie = txd->tx_submit(txd);
   365			}
   366	
   367			if (!rxd || !txd) {
   368				for (i = 0; i < frm_cnt; i++)
   369					dma_unmap_single(tx_dev->dev, dma_srcs[i], len,
   370							DMA_MEM_TO_DEV);
   371				for (i = 0; i < frm_cnt; i++)
   372					dma_unmap_single(rx_dev->dev, dma_dsts[i],
   373							test_buf_size,
   374							DMA_DEV_TO_MEM);
   375				pr_warn("%s: #%u: prep error with len=0x%x ",
   376						thread_name, total_tests - 1, len);
   377				msleep(100);
   378				failed_tests++;
   379				continue;
   380			}
   381	
   382			init_completion(&rx_cmp);
   383			rxd->callback = xilinx_vdmatest_slave_rx_callback;
   384			rxd->callback_param = &rx_cmp;
   385	
   386			init_completion(&tx_cmp);
   387			txd->callback = xilinx_vdmatest_slave_tx_callback;
   388			txd->callback_param = &tx_cmp;
   389	
   390			if (dma_submit_error(rx_cookie) ||
   391					dma_submit_error(tx_cookie)) {
   392				pr_warn("%s: #%u: submit error %d/%d with len=0x%x ",
   393						thread_name, total_tests - 1,
   394						rx_cookie, tx_cookie, len);
   395				msleep(100);
   396				failed_tests++;
   397				continue;
   398			}
   399			dma_async_issue_pending(tx_chan);
   400			dma_async_issue_pending(rx_chan);
   401	
   402			tx_tmo = wait_for_completion_timeout(&tx_cmp, tx_tmo);
   403	
   404			status = dma_async_is_tx_complete(tx_chan, tx_cookie,
   405								NULL, NULL);
   406	
   407			if (tx_tmo == 0) {
   408				pr_warn("%s: #%u: tx test timed out\n",
   409						thread_name, total_tests - 1);
   410				failed_tests++;
   411				continue;
   412			} else if (status != DMA_COMPLETE) {
   413				pr_warn(
   414				"%s: #%u: tx got completion callback, ",
   415					   thread_name, total_tests - 1);
   416				pr_warn("but status is \'%s\'\n",
   417					   status == DMA_ERROR ? "error" :
   418								"in progress");
   419				failed_tests++;
   420				continue;
   421			}
   422	
   423			rx_tmo = wait_for_completion_timeout(&rx_cmp, rx_tmo);
   424			status = dma_async_is_tx_complete(rx_chan, rx_cookie,
   425								NULL, NULL);
   426	
   427			if (rx_tmo == 0) {
   428				pr_warn("%s: #%u: rx test timed out\n",
   429						thread_name, total_tests - 1);
   430				failed_tests++;
   431				continue;
   432			} else if (status != DMA_COMPLETE) {
   433				pr_warn(
   434				"%s: #%u: rx got completion callback, ",
   435						thread_name, total_tests - 1);
   436				pr_warn("but status is \'%s\'\n",
   437						status == DMA_ERROR ? "error" :
   438								"in progress");
   439				failed_tests++;
   440				continue;
   441			}
   442	
   443			/* Unmap by myself */
   444			for (i = 0; i < frm_cnt; i++)
   445				dma_unmap_single(rx_dev->dev, dma_dsts[i],
   446						 test_buf_size, DMA_DEV_TO_MEM);
   447	
   448			error_count = 0;
   449	
   450			pr_debug("%s: verifying source buffer...\n", thread_name);
   451			error_count += xilinx_vdmatest_verify(thread->srcs, 0, 0,
   452					0, PATTERN_SRC, true);
   453			error_count += xilinx_vdmatest_verify(thread->srcs, 0,
   454					len, 0, PATTERN_SRC | PATTERN_COPY, true);
   455			error_count += xilinx_vdmatest_verify(thread->srcs, len,
   456					test_buf_size, len, PATTERN_SRC, true);
   457	
   458			pr_debug("%s: verifying dest buffer...\n",
   459					thread->task->comm);
   460			error_count += xilinx_vdmatest_verify(thread->dsts, 0, 0,
   461					0, PATTERN_DST, false);
   462			error_count += xilinx_vdmatest_verify(thread->dsts, 0,
   463					len, 0, PATTERN_SRC | PATTERN_COPY, false);
   464			error_count += xilinx_vdmatest_verify(thread->dsts, len,
   465					test_buf_size, len, PATTERN_DST, false);
   466	
   467			if (error_count) {
   468				pr_warn("%s: #%u: %u errors with len=0x%x\n",
   469					thread_name, total_tests - 1, error_count, len);
   470				failed_tests++;
   471			} else {
   472				pr_debug("%s: #%u: No errors with len=0x%x\n",
   473					thread_name, total_tests - 1, len);
   474			}
   475		}
   476	
   477		ret = 0;
   478		for (i = 0; thread->dsts[i]; i++)
   479			kfree(thread->dsts[i]);
   480	err_dstbuf:
   481		kfree(thread->dsts);
   482	err_dsts:
   483		for (i = 0; thread->srcs[i]; i++)
   484			kfree(thread->srcs[i]);
   485	err_srcbuf:
   486		kfree(thread->srcs);
   487	err_srcs:
   488		pr_notice("%s: terminating after %u tests, %u failures (status %d)\n",
   489				thread_name, total_tests, failed_tests, ret);
   490	
   491		thread->done = true;
   492		wake_up(&thread_wait);
   493	
   494		return ret;
   495	}
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
