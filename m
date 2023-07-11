Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCBC125B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 05:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689054349; x=1720590349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jGnJmSQdCW2/1SF9PpGbXNLB5HjkMa5PAay1G1eWClI=;
  b=FVcSroQT51pz2f2tmpKczMXSQqMTzsD1zQUkKdzbAKoK6Y+c3sqNYcql
   Hs5KFYLxVckG01e9/vVsDWbTR3w2864PFuo9fwNLwW4bUpxEYVT9CgeYA
   MTNc6VlCNGyG19+qVvqpRH+XTOPdGxseagAJDNHLuvSfTewxixWmUrsy5
   O9IPA/2IbDA+vryFnlMjKEq+zeqpHWkmhP21zBOrzRiSRNzGo/22Bh0bU
   /JG3mEfcem+PW4VXt9TYdaHLdUmfap06hDyTBhaLR54unMJ6i0iQ7R+qa
   3nusS5p2w0A/aX+NwGdA1w+FyLTwdGmtivo898YdtF/CMoS+cladIyIi2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430617591"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="430617591"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 22:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750597418"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="750597418"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Jul 2023 22:45:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ6By-0004Mh-1m;
	Tue, 11 Jul 2023 05:45:42 +0000
Date: Tue, 11 Jul 2023 13:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/27]
 drivers/net/wireless/espressif/esp_shmem.c:384:20: warning: cast to pointer
 from integer of different size
Message-ID: <202307111317.lcAWIDjB-lkp@intel.com>
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
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230711/202307111317.lcAWIDjB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111317.lcAWIDjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111317.lcAWIDjB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/espressif/esp_shmem.c: In function 'init_hw':
>> drivers/net/wireless/espressif/esp_shmem.c:384:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     384 |         hw->hw_q = (void *)readl(p);
         |                    ^


vim +384 drivers/net/wireless/espressif/esp_shmem.c

   376	
   377	static int init_hw(struct platform_device *pdev, struct esp_wifi_shmem *hw)
   378	{
   379		void __user *p;
   380	
   381		p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
   382		if (IS_ERR(p))
   383			return PTR_ERR(p);
 > 384		hw->hw_q = (void *)readl(p);
   385		devm_iounmap(&pdev->dev, p);
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
