Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A069D171C1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW3qEJSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701078308; x=1732614308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HM5AF6MZGPmTAaTpu66W7eV1fgJM4QAt7XCK1tJ65Lk=;
  b=KW3qEJSx2IPtijG0tcKe213VBFWyOq3W5bp9wTACeJ+tc/Os1N/AIvve
   gzI4J+4YQ9WtMMu0zoXtDDzV9jcE4KvXp7n6tQ8AEBXK9yK+bu+NNmbCM
   omPs0MvuBefRDSyhCSLdfY6wrfihOa0AI3GZLsPUxIFm8z0WzOFYSWA/D
   M6iXODuS8lXXB5ZO6HLibZme0dk9WaIkcZIAsC/2Ncfu+/5V0CrflJKMG
   uLW/2/+YuLVfRoePwM9JdzXqAz6MFI76lEABTC0q7+YVWiIruEtvbJ7J9
   RrLm/1O4Hx3lTE8Igjv/XHJbp4imD75PQecoClWi7fhi/tEH4dFR3tY+S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="377704793"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="377704793"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 01:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="744520759"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="744520759"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Nov 2023 01:45:06 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7YAq-00067w-2U;
	Mon, 27 Nov 2023 09:45:04 +0000
Date: Mon, 27 Nov 2023 17:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] bluetooth: ti-st: add GNSS support for TI Wilink
 chips
Message-ID: <202311271628.GORay76H-lkp@intel.com>
References: <20231126191840.110564-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126191840.110564-3-andreas@kemnade.info>

Hi Andreas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.7-rc3 next-20231127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/gnss-Add-AI2-protocol-used-by-some-TI-combo-chips/20231127-032152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20231126191840.110564-3-andreas%40kemnade.info
patch subject: [RFC PATCH 2/3] bluetooth: ti-st: add GNSS support for TI Wilink chips
config: x86_64-randconfig-012-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271628.GORay76H-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311271628.GORay76H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271628.GORay76H-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `gnss_recv_frame':
>> drivers/bluetooth/hci_ll.c:791: undefined reference to `gnss_insert_raw'
   ld: vmlinux.o: in function `hci_ti_remove':
>> drivers/bluetooth/hci_ll.c:916: undefined reference to `gnss_deregister_device'
>> ld: drivers/bluetooth/hci_ll.c:917: undefined reference to `gnss_put_device'
   ld: vmlinux.o: in function `ll_gnss_register':
>> drivers/bluetooth/hci_ll.c:805: undefined reference to `gnss_allocate_device'
>> ld: drivers/bluetooth/hci_ll.c:814: undefined reference to `gnss_register_device'
   ld: drivers/bluetooth/hci_ll.c:819: undefined reference to `gnss_put_device'


vim +791 drivers/bluetooth/hci_ll.c

   768	
   769	static int gnss_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
   770	{
   771		struct hci_uart *hu = hci_get_drvdata(hdev);
   772		struct ll_device *lldev = container_of(hu, struct ll_device, hu);
   773	
   774		if (!IS_ENABLED(CONFIG_GNSS))
   775			return 0;
   776	
   777		if (!lldev->gdev)
   778			return 0;
   779	
   780		if (hci_skb_pkt_type(skb) == GPS_CH9_PKT_NUMBER) {
   781			struct gnssdrv_event_hdr *gnss_hdr =
   782				(struct gnssdrv_event_hdr *)skb->data;
   783			void *data = skb_pull(skb, sizeof(*gnss_hdr));
   784			/*
   785			 * REVISIT: maybe do something with the completed
   786			 * event
   787			 */
   788			if (gnss_hdr->opcode ==	GPS_CH9_OP_READ) {
   789				mutex_lock(&lldev->gdev_mutex);
   790				if (lldev->gdev_open)
 > 791					gnss_insert_raw(lldev->gdev, data, skb->len);
   792				mutex_unlock(&lldev->gdev_mutex);
   793			}
   794		}
   795		kfree_skb(skb);
   796	
   797		return 0;
   798	}
   799	
   800	static int ll_gnss_register(struct ll_device *lldev)
   801	{
   802		struct gnss_device *gdev;
   803		int ret;
   804	
 > 805		gdev = gnss_allocate_device(&lldev->serdev->dev);
   806		if (!gdev)
   807			return -ENOMEM;
   808	
   809		gdev->ops = &gnss_lldev_ops;
   810		gdev->type = GNSS_TYPE_AI2;
   811		gnss_set_drvdata(gdev, lldev);
   812		mutex_init(&lldev->gdev_mutex);
   813	
 > 814		ret = gnss_register_device(gdev);
   815		if (ret == 0) {
   816			lldev->gdev = gdev;
   817			return 0;
   818		}
   819		gnss_put_device(gdev);
   820		return ret;
   821	}
   822	
   823	static int hci_ti_probe(struct serdev_device *serdev)
   824	{
   825		struct hci_uart *hu;
   826		struct ll_device *lldev;
   827		struct nvmem_cell *bdaddr_cell;
   828		u32 max_speed = 3000000;
   829		int ret;
   830	
   831		lldev = devm_kzalloc(&serdev->dev, sizeof(struct ll_device), GFP_KERNEL);
   832		if (!lldev)
   833			return -ENOMEM;
   834		hu = &lldev->hu;
   835	
   836		serdev_device_set_drvdata(serdev, lldev);
   837		lldev->serdev = hu->serdev = serdev;
   838	
   839		lldev->enable_gpio = devm_gpiod_get_optional(&serdev->dev,
   840							     "enable",
   841							     GPIOD_OUT_LOW);
   842		if (IS_ERR(lldev->enable_gpio))
   843			return PTR_ERR(lldev->enable_gpio);
   844	
   845		lldev->ext_clk = devm_clk_get(&serdev->dev, "ext_clock");
   846		if (IS_ERR(lldev->ext_clk) && PTR_ERR(lldev->ext_clk) != -ENOENT)
   847			return PTR_ERR(lldev->ext_clk);
   848	
   849		of_property_read_u32(serdev->dev.of_node, "max-speed", &max_speed);
   850		hci_uart_set_speeds(hu, 115200, max_speed);
   851	
   852		/* optional BD address from nvram */
   853		bdaddr_cell = nvmem_cell_get(&serdev->dev, "bd-address");
   854		if (IS_ERR(bdaddr_cell)) {
   855			int err = PTR_ERR(bdaddr_cell);
   856	
   857			if (err == -EPROBE_DEFER)
   858				return err;
   859	
   860			/* ENOENT means there is no matching nvmem cell and ENOSYS
   861			 * means that nvmem is not enabled in the kernel configuration.
   862			 */
   863			if (err != -ENOENT && err != -ENOSYS) {
   864				/* If there was some other error, give userspace a
   865				 * chance to fix the problem instead of failing to load
   866				 * the driver. Using BDADDR_NONE as a flag that is
   867				 * tested later in the setup function.
   868				 */
   869				dev_warn(&serdev->dev,
   870					 "Failed to get \"bd-address\" nvmem cell (%d)\n",
   871					 err);
   872				bacpy(&lldev->bdaddr, BDADDR_NONE);
   873			}
   874		} else {
   875			bdaddr_t *bdaddr;
   876			size_t len;
   877	
   878			bdaddr = nvmem_cell_read(bdaddr_cell, &len);
   879			nvmem_cell_put(bdaddr_cell);
   880			if (IS_ERR(bdaddr)) {
   881				dev_err(&serdev->dev, "Failed to read nvmem bd-address\n");
   882				return PTR_ERR(bdaddr);
   883			}
   884			if (len != sizeof(bdaddr_t)) {
   885				dev_err(&serdev->dev, "Invalid nvmem bd-address length\n");
   886				kfree(bdaddr);
   887				return -EINVAL;
   888			}
   889	
   890			/* As per the device tree bindings, the value from nvmem is
   891			 * expected to be MSB first, but in the kernel it is expected
   892			 * that bdaddr_t is LSB first.
   893			 */
   894			baswap(&lldev->bdaddr, bdaddr);
   895			kfree(bdaddr);
   896		}
   897	
   898		ret = hci_uart_register_device(hu, &llp);
   899		if (ret)
   900			return ret;
   901	
   902		if (IS_ENABLED(CONFIG_GNSS) &&
   903		    strstr(of_node_full_name(serdev->dev.of_node), "gnss"))
   904			ll_gnss_register(lldev);
   905	
   906		return 0;
   907	}
   908	
   909	
   910	static void hci_ti_remove(struct serdev_device *serdev)
   911	{
   912		struct ll_device *lldev = serdev_device_get_drvdata(serdev);
   913	
   914		hci_uart_unregister_device(&lldev->hu);
   915		if (IS_ENABLED(CONFIG_GNSS) && lldev->gdev) {
 > 916			gnss_deregister_device(lldev->gdev);
 > 917			gnss_put_device(lldev->gdev);
   918		}
   919	}
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
