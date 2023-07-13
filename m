Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B687C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 01:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689210313; x=1720746313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=azgNIKWbIPW7tCxmSZp1nAXB1zjBfhBl7ouzohN3wzs=;
  b=bj9L5geuXCEp4fHjxWeWBJORnVyTQKT/JPLOxFhLiU6W8FPRHvlGT8DZ
   EO9RWhZ8fjewktfuasWG4YfjcBherXcFuxkQx41tkzPtoMGG4Rkoy1vbi
   36XLgk5ZcVufOD/ZBZmJ09wPwYEGIASFUbAt5+LqVogxCdulfqobIySTq
   pQuFn5YCChTvRgj4VGwFZWQjZ2lOMYfvTLpDJeLzi4xse3CXDY09hI6lM
   LrilaDAgZl70hesQhvZFS0z54yVRqbTxkKRuOSECeSIO8NLe+9SIB8WCt
   kal1zIkCQ0/fGXtVSiYm2gYZyB7ypPTH1761GS8LrIGn2jgnzBJSc1eJO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="395850542"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="395850542"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 18:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="845844606"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="845844606"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jul 2023 18:05:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJklZ-00064j-2y;
	Thu, 13 Jul 2023 01:05:09 +0000
Date: Thu, 13 Jul 2023 09:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/28]
 drivers/net/wireless/espressif/esp_shmem.c:253:18: sparse: sparse: cast to
 restricted __le16
Message-ID: <202307130837.8EEaN2g1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   eb949d6688cf40bfaa832ca9e10978c2892e1ffe
commit: a35d9035c4d7eacb28bc465097fbbee739fe81fa [25/28] esp_wifi: add shmem transport
config: microblaze-randconfig-r082-20230710 (https://download.01.org/0day-ci/archive/20230713/202307130837.8EEaN2g1-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130837.8EEaN2g1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130837.8EEaN2g1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/espressif/esp_shmem.c:253:18: sparse: sparse: cast to restricted __le16
   drivers/net/wireless/espressif/esp_shmem.c:261:15: sparse: sparse: cast to restricted __le16
>> drivers/net/wireless/espressif/esp_shmem.c:381:11: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *p @@     got void [noderef] __iomem * @@
   drivers/net/wireless/espressif/esp_shmem.c:381:11: sparse:     expected void [noderef] __user *p
   drivers/net/wireless/espressif/esp_shmem.c:381:11: sparse:     got void [noderef] __iomem *
>> drivers/net/wireless/espressif/esp_shmem.c:384:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void [noderef] __user *p @@
   drivers/net/wireless/espressif/esp_shmem.c:384:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/net/wireless/espressif/esp_shmem.c:384:34: sparse:     got void [noderef] __user *p
>> drivers/net/wireless/espressif/esp_shmem.c:385:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void [noderef] __user *p @@
   drivers/net/wireless/espressif/esp_shmem.c:385:34: sparse:     expected void [noderef] __iomem *addr
   drivers/net/wireless/espressif/esp_shmem.c:385:34: sparse:     got void [noderef] __user *p

vim +253 drivers/net/wireless/espressif/esp_shmem.c

   236	
   237	static int process_rx_buf(struct esp_wifi_shmem *hw, struct sk_buff *skb)
   238	{
   239		struct esp_payload_header *header;
   240		u16 len = 0;
   241		u16 offset = 0;
   242	
   243		if (!skb)
   244			return -EINVAL;
   245	
   246		header = (struct esp_payload_header *) skb->data;
   247	
   248		if (header->if_type >= ESP_MAX_IF) {
   249			pr_err("%s: bad if_type %d\n", __func__, header->if_type);
   250			return -EINVAL;
   251		}
   252	
 > 253		offset = le16_to_cpu(header->offset);
   254	
   255		/* Validate received SKB. Check len and offset fields */
   256		if (offset != sizeof(struct esp_payload_header)) {
   257			pr_err("%s: bad offfset %d\n", __func__, offset);
   258			return -EINVAL;
   259		}
   260	
   261		len = le16_to_cpu(header->len);
   262		if (!len) {
   263			pr_err("%s: bad len %d\n", __func__, len);
   264			return -EINVAL;
   265		}
   266	
   267		len += sizeof(struct esp_payload_header);
   268	
   269		if (len > SHMEM_BUF_SIZE) {
   270			pr_err("%s: bad len %d\n", __func__, len);
   271			return -EINVAL;
   272		}
   273	
   274		/* Trim SKB to actual size */
   275		skb_trim(skb, len);
   276	
   277		/* enqueue skb for read_packet to pick it */
   278		if (header->if_type == ESP_INTERNAL_IF)
   279			skb_queue_tail(&hw->rx_q[PRIO_Q_HIGH], skb);
   280		else if (header->if_type == ESP_HCI_IF)
   281			skb_queue_tail(&hw->rx_q[PRIO_Q_MID], skb);
   282		else
   283			skb_queue_tail(&hw->rx_q[PRIO_Q_LOW], skb);
   284	
   285		return 0;
   286	}
   287	
   288	static bool esp_wifi_shmem_handle_rx(struct esp_wifi_shmem *hw, void *p)
   289	{
   290		struct sk_buff *rx_skb = esp_alloc_skb(SHMEM_BUF_SIZE);
   291		u8 *rx_buf = skb_put(rx_skb, SHMEM_BUF_SIZE);
   292		int ret;
   293	
   294		memcpy(rx_buf, p, SHMEM_BUF_SIZE);
   295	
   296		ret = process_rx_buf(hw, rx_skb);
   297		if (ret)
   298			dev_kfree_skb(rx_skb);
   299		return ret == 0;
   300	}
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
   316					esp_tx_resume(cb->priv);
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
 > 381		p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
   382		if (IS_ERR(p))
   383			return PTR_ERR(p);
 > 384		hw->hw_q = (void *)readl(p);
 > 385		devm_iounmap(&pdev->dev, p);
   386	
   387		hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
