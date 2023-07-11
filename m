Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EC714273
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 05:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689053684; x=1720589684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSfHiXujch+Ty/Do7yi3P5Wg+52YWQX18mfKA4MZvoM=;
  b=EyDxqhvEs4UobJjikKbZ2pQaUZzBEKm5eVFTGA1KuhM/9x3XUEx+Zu9H
   X9Kg9qRSKWP6IAOaSVYj7+6u7lCsT+9KkxaLbO1ulvrp8NTm3YBPXsdHJ
   7h7b8IxCKTJy1W8yF5NOz/5mtbGBDtsodkrkgKAXekgS/IqhevTCVlRJ2
   7rEuhrQjvk6TvncRmqh4zM3KVF/ulhvVHETuuPF1++7WQMXHtY4mgbOFK
   8nuf84Zii9Zdh5rPDFnT+p/2PgrB+EF7Dib8FGrIV6jNNFI1ulMZzjZRp
   7mDeLRMzBoWc/4Iiw/heCAWobGHM0+3L+p2y+P1IGJUqG1s0Hit3ClvqN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367107816"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="367107816"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 22:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="834529121"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="834529121"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2023 22:34:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ61K-0004M7-0q;
	Tue, 11 Jul 2023 05:34:42 +0000
Date: Tue, 11 Jul 2023 13:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/27]
 drivers/net/wireless/espressif/esp_shmem.c:316: undefined reference to
 `esp_tx_resume'
Message-ID: <202307111337.1uYSaPQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   0e48757b20c9e813e7c330d76e0a6f895f0660d4
commit: a35d9035c4d7eacb28bc465097fbbee739fe81fa [25/27] esp_wifi: add shmem transport
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230711/202307111337.1uYSaPQv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111337.1uYSaPQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111337.1uYSaPQv-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_remove':
   drivers/net/wireless/espressif/esp_shmem.c:467: undefined reference to `esp_wifi_deinit'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `write_packet':
   drivers/net/wireless/espressif/esp_shmem.c:88: undefined reference to `esp_tx_pause'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:103: undefined reference to `esp_tx_pause'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_handle_rx':
   drivers/net/wireless/espressif/esp_shmem.c:290: undefined reference to `esp_alloc_skb'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_thread_handler':
   drivers/net/wireless/espressif/esp_shmem.c:364: undefined reference to `esp_process_new_packet_intr'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_handle_tx':
>> drivers/net/wireless/espressif/esp_shmem.c:316: undefined reference to `esp_tx_resume'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `init_hw':
   drivers/net/wireless/espressif/esp_shmem.c:381: undefined reference to `devm_of_iomap'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:385: undefined reference to `devm_iounmap'
>> /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:387: undefined reference to `devm_of_iomap'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `esp_wifi_shmem_probe':
>> drivers/net/wireless/espressif/esp_shmem.c:444: undefined reference to `esp_wifi_init'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.o: in function `process_event_esp_bootup':
   drivers/net/wireless/espressif/esp_shmem.c:152: undefined reference to `process_fw_data'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:153: undefined reference to `esp_remove_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:159: undefined reference to `process_test_capabilities'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:212: undefined reference to `cfg80211_scan_done'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:216: undefined reference to `cfg80211_disconnected'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:221: undefined reference to `esp_remove_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:226: undefined reference to `esp_add_card'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:230: undefined reference to `process_capabilities'
   /usr/bin/ld: drivers/net/wireless/espressif/esp_shmem.c:231: undefined reference to `print_capabilities'
   collect2: error: ld returned 1 exit status


vim +316 drivers/net/wireless/espressif/esp_shmem.c

   301	
   302	static void esp_wifi_shmem_handle_tx(struct esp_wifi_shmem *hw, u32 n)
   303	{
   304		struct sk_buff *skb;
   305		bool resumed = false;
   306		u32 i;
   307	
   308		for (i = 0; i < n; ++i) {
   309			skb = skb_dequeue(&hw->tx_q);
   310			if (WARN_ON(!skb))
   311				break;
   312			if (!resumed && skb) {
   313				struct esp_skb_cb *cb = (struct esp_skb_cb *)skb->cb;
   314	
   315				if (cb->priv) {
 > 316					esp_tx_resume(cb->priv);
   317					resumed = true;
   318				}
   319			}
   320			dev_kfree_skb(skb);
   321		}
   322		hw->tx_done += n;
   323	}
   324	
   325	static irqreturn_t esp_wifi_shmem_irq_handler(int irq, void *dev)
   326	{
   327		struct esp_wifi_shmem *hw = dev;
   328	
   329		if (hw->hw_q) {
   330			writel(0, hw->regs + ESP_SHMEM_IRQ_FROM_WIFI_REG);
   331			return IRQ_WAKE_THREAD;
   332		}
   333		return IRQ_NONE;
   334	}
   335	
   336	static irqreturn_t esp_wifi_shmem_thread_handler(int irq, void *dev)
   337	{
   338		struct esp_wifi_shmem *hw = dev;
   339		struct esp_wifi_shmem_queue *q = hw->hw_q + ESP_SHMEM_READ_HW_Q;
   340		void **data = (void *)hw->hw_q + q->offset;
   341		u32 w, r;
   342		bool rx_done = false;
   343	
   344		for (;;) {
   345			w = READ_ONCE(q->write);
   346			r = READ_ONCE(q->read);
   347			rmb();
   348			if (r == w) {
   349				break;
   350			} else {
   351				void *p = READ_ONCE(data[r & q->mask]);
   352	
   353				pr_debug("%s: read queue: r = %d, w = %d\n", __func__, r, w);
   354				if (esp_wifi_shmem_handle_rx(hw, p))
   355					rx_done = true;
   356				++r;
   357				wmb();
   358				WRITE_ONCE(q->read, r);
   359			}
   360		}
   361	
   362		/* indicate reception of new packets */
   363		if (rx_done)
   364			esp_process_new_packet_intr(&hw->adapter);
   365	
   366		q = hw->hw_q + ESP_SHMEM_WRITE_HW_Q;
   367		w = READ_ONCE(q->write);
   368		r = READ_ONCE(q->read);
   369		rmb();
   370		pr_debug("%s: write queue: r = %d, w = %d\n", __func__, r, w);
   371		if (r != hw->tx_done)
   372			esp_wifi_shmem_handle_tx(hw, r - hw->tx_done);
   373	
   374		return IRQ_HANDLED;
   375	}
   376	
   377	static int init_hw(struct platform_device *pdev, struct esp_wifi_shmem *hw)
   378	{
   379		void __user *p;
   380	
   381		p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
   382		if (IS_ERR(p))
   383			return PTR_ERR(p);
   384		hw->hw_q = (void *)readl(p);
   385		devm_iounmap(&pdev->dev, p);
   386	
 > 387		hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
   388		if (IS_ERR(hw->regs))
   389			return PTR_ERR(hw->regs);
   390	
   391		dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
   392			__func__, hw->regs, hw->hw_q);
   393		if (hw->hw_q) {
   394			u32 i;
   395	
   396			for (i = 0; i < 2; ++i) {
   397				dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
   398					__func__, i,
   399					hw->hw_q[i].offset,
   400					hw->hw_q[i].mask);
   401			}
   402			hw->tx_done = hw->hw_q[ESP_SHMEM_WRITE_HW_Q].write;
   403		} else {
   404			return -ENODEV;
   405		}
   406	
   407		hw->irq = platform_get_irq(pdev, 0);
   408		if (hw->irq >= 0) {
   409			int ret;
   410	
   411			ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
   412							esp_wifi_shmem_irq_handler,
   413							esp_wifi_shmem_thread_handler,
   414							IRQF_SHARED, pdev->name, hw);
   415			if (ret < 0) {
   416				dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
   417				return ret;
   418			}
   419		} else {
   420			dev_err(&pdev->dev, "missing IRQ property\n");
   421			return -ENODEV;
   422		}
   423	
   424		return 0;
   425	}
   426	
   427	static int esp_wifi_shmem_probe(struct platform_device *pdev)
   428	{
   429		struct esp_wifi_shmem *hw =
   430			devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
   431		int ret;
   432		int i;
   433	
   434		if (!hw)
   435			return -ENOMEM;
   436		platform_set_drvdata(pdev, hw);
   437		for (i = 0; i < MAX_PRIORITY_QUEUES; ++i)
   438			skb_queue_head_init(&hw->rx_q[i]);
   439		skb_queue_head_init(&hw->tx_q);
   440	
   441		ret = init_hw(pdev, hw);
   442		if (ret < 0)
   443			return ret;
 > 444		ret = esp_wifi_init(&hw->adapter, &if_ops);
   445		if (ret < 0)
   446			return ret;
   447	
   448		hw->hw_q[ESP_SHMEM_WRITE_HW_Q].read = 0;
   449		hw->hw_q[ESP_SHMEM_WRITE_HW_Q].write = 0;
   450		wmb();
   451		writel(1, hw->regs + ESP_SHMEM_IRQ_TO_WIFI_REG);
   452	
   453		esp_wifi_shmem_thread_handler(0, hw);
   454	
   455		return ret;
   456	}
   457	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
