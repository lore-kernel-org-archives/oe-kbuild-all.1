Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0AC53AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714232384; cv=none; b=R625mh+aNpHp4TeiuwHVmCa0iEqedW5Qc3JKeThRfHZSWh9c6EmT7bcX7Ywu32m2knsk9q1TNJunBS/WNLGtKorM5YgpQPgjO5dOZbjxlDSXsbKxIGTTqYgQR7FoAlGgNnDc10FkblDboXo90QtZGaB2hP/bEY25T0ZSYDiUnG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714232384; c=relaxed/simple;
	bh=sk1hwDryXERc2waBSsp+w0w5LefhxPg1Mhh35egxCM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QiH/gd3U1thR9mLiL9d5VHbizXUS2Foi10PbqDMxNsiPE96bRV9IaKpAUWt/GhuPWi2H4w2eXw0RrjmAxDxt3/EPB7ltKnKteNCZCLYFHITyNDc5/aC3vkxtNl3jaSAgZseUzl+6KeCDnQ8EPvFM4vsLo3aHLjsrcV6KnDFsJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF1xxm/p; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LF1xxm/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714232383; x=1745768383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sk1hwDryXERc2waBSsp+w0w5LefhxPg1Mhh35egxCM0=;
  b=LF1xxm/pCo5wgzcowXE+1SRilzflzj9CBs+8oLPeVCCr5IkRnt770ZEP
   tdZ7qiBY0wgpW7CPleLP04Z3kC700VFWd9CXhs0Sv37UtkIDmpnd5Fvdj
   lBUziu14cZjQUkJ16l/OhZaxK1bBMncFAKKiiojhzAvHnpFB68BE1f2b4
   PPQqVRvNuaMIBL4QYhNKZbGpxeYbzP/DxvtSRjVVL2kaWsy4qwhins4pV
   3zpWDRYIb5bWZSgRebFkvQlzWQ9hbBXjBXqHTWqNOg+mIbA5MXBbZ/Zkb
   IMCnzEYake8terR/gFJU921qSIcdWWbS1QtaOqr5No8cGfOFkqE6mzk2n
   Q==;
X-CSE-ConnectionGUID: 4PKS+nYxQsCS0rwmbBQCyw==
X-CSE-MsgGUID: UysGLb1tTsSwQHpg3Mzvyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10486593"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="10486593"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 08:39:42 -0700
X-CSE-ConnectionGUID: UsKvS3ckQ2Ss16bidOqwDA==
X-CSE-MsgGUID: ojA/nVD1Q0anywi/tlOJWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="30154622"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2024 08:39:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0k9K-0005D8-2s;
	Sat, 27 Apr 2024 15:39:38 +0000
Date: Sat, 27 Apr 2024 23:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.8.y 91/104]
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:242:8: error: no member named
 'port_stop' in 'struct pmic_typec'
Message-ID: <202404272337.ed2aS91T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.8.y
head:   0bde7107456c88f5ccc83c66d7638f1bf02fa8a1
commit: 73754ea4756c40950cfbdfc032c41b547d13bafc [91/104] usb: typec: qcom-pmic: fix use-after-free on late probe errors
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240427/202404272337.ed2aS91T-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404272337.ed2aS91T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404272337.ed2aS91T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:10:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:14:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:242:8: error: no member named 'port_stop' in 'struct pmic_typec'
     242 |         tcpm->port_stop(tcpm);
         |         ~~~~  ^
   17 warnings and 1 error generated.


vim +242 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c

   151	
   152	static int qcom_pmic_typec_probe(struct platform_device *pdev)
   153	{
   154		struct pmic_typec *tcpm;
   155		struct device *dev = &pdev->dev;
   156		struct device_node *np = dev->of_node;
   157		const struct pmic_typec_resources *res;
   158		struct regmap *regmap;
   159		struct device *bridge_dev;
   160		u32 base[2];
   161		int ret;
   162	
   163		res = of_device_get_match_data(dev);
   164		if (!res)
   165			return -ENODEV;
   166	
   167		tcpm = devm_kzalloc(dev, sizeof(*tcpm), GFP_KERNEL);
   168		if (!tcpm)
   169			return -ENOMEM;
   170	
   171		tcpm->dev = dev;
   172		tcpm->tcpc.init = qcom_pmic_typec_init;
   173		tcpm->tcpc.get_vbus = qcom_pmic_typec_get_vbus;
   174		tcpm->tcpc.set_vbus = qcom_pmic_typec_set_vbus;
   175		tcpm->tcpc.set_cc = qcom_pmic_typec_set_cc;
   176		tcpm->tcpc.get_cc = qcom_pmic_typec_get_cc;
   177		tcpm->tcpc.set_polarity = qcom_pmic_typec_set_polarity;
   178		tcpm->tcpc.set_vconn = qcom_pmic_typec_set_vconn;
   179		tcpm->tcpc.start_toggling = qcom_pmic_typec_start_toggling;
   180		tcpm->tcpc.set_pd_rx = qcom_pmic_typec_set_pd_rx;
   181		tcpm->tcpc.set_roles = qcom_pmic_typec_set_roles;
   182		tcpm->tcpc.pd_transmit = qcom_pmic_typec_pd_transmit;
   183	
   184		regmap = dev_get_regmap(dev->parent, NULL);
   185		if (!regmap) {
   186			dev_err(dev, "Failed to get regmap\n");
   187			return -ENODEV;
   188		}
   189	
   190		ret = of_property_read_u32_array(np, "reg", base, 2);
   191		if (ret)
   192			return ret;
   193	
   194		tcpm->pmic_typec_port = qcom_pmic_typec_port_alloc(dev);
   195		if (IS_ERR(tcpm->pmic_typec_port))
   196			return PTR_ERR(tcpm->pmic_typec_port);
   197	
   198		tcpm->pmic_typec_pdphy = qcom_pmic_typec_pdphy_alloc(dev);
   199		if (IS_ERR(tcpm->pmic_typec_pdphy))
   200			return PTR_ERR(tcpm->pmic_typec_pdphy);
   201	
   202		ret = qcom_pmic_typec_port_probe(pdev, tcpm->pmic_typec_port,
   203						 res->port_res, regmap, base[0]);
   204		if (ret)
   205			return ret;
   206	
   207		ret = qcom_pmic_typec_pdphy_probe(pdev, tcpm->pmic_typec_pdphy,
   208						  res->pdphy_res, regmap, base[1]);
   209		if (ret)
   210			return ret;
   211	
   212		mutex_init(&tcpm->lock);
   213		platform_set_drvdata(pdev, tcpm);
   214	
   215		tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
   216		if (!tcpm->tcpc.fwnode)
   217			return -EINVAL;
   218	
   219		bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
   220		if (IS_ERR(bridge_dev))
   221			return PTR_ERR(bridge_dev);
   222	
   223		tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
   224		if (IS_ERR(tcpm->tcpm_port)) {
   225			ret = PTR_ERR(tcpm->tcpm_port);
   226			goto fwnode_remove;
   227		}
   228	
   229		ret = qcom_pmic_typec_port_start(tcpm->pmic_typec_port,
   230						 tcpm->tcpm_port);
   231		if (ret)
   232			goto port_unregister;
   233	
   234		ret = qcom_pmic_typec_pdphy_start(tcpm->pmic_typec_pdphy,
   235						  tcpm->tcpm_port);
   236		if (ret)
   237			goto port_stop;
   238	
   239		return 0;
   240	
   241	port_stop:
 > 242		tcpm->port_stop(tcpm);
   243	port_unregister:
   244		tcpm_unregister_port(tcpm->tcpm_port);
   245	fwnode_remove:
   246		fwnode_remove_software_node(tcpm->tcpc.fwnode);
   247	
   248		return ret;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
