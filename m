Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE881A6813
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 02:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777862611; cv=none; b=mBJTffof5Hdy9PLDr09FrNvIdHRIxUkGOkrzGqlzsQeOm24nAei1VPHYbO/uqXMr5gxEU9jlv0gARas1cr4RdLh9BxaCRfRSGVf3S5/2/2oVAZ+SG9QKx/J7wY1ndZWKkczTyRM+UQC9xsg51WGq6QCLkj/Qy5UJzTz3bkhm8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777862611; c=relaxed/simple;
	bh=MUq2rFY1Wc5YNLDH0Xz8Aj7vRa5ERNO76qXXN1wPz+4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DtFhcq4LeOvKb0f+2HmfHI0gScP3q5hda19VcANk5R7lsAb4PpmlDTkRmk5XhE2kDwcHcV/vPPTJosbdKL77Z7AzwXAb8ZVhpL8FpsVKI8emxD3G1jO0G4vkeYA7k+LgrmFJNh0lGj8L1W/0TMu5reHrqeKirMu7m+XTovFiZLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibYGkvPQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibYGkvPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777862609; x=1809398609;
  h=date:from:to:cc:subject:message-id;
  bh=MUq2rFY1Wc5YNLDH0Xz8Aj7vRa5ERNO76qXXN1wPz+4=;
  b=ibYGkvPQbyR+wJmvcmodgojQMXHso/Ch7/eEcFW++nOlFskx1+wjzbTa
   8Aq2kbSpchOCahQm900E1nBDaz31F+0LY7BkBlDaT1uPyESScJK2Ez1cw
   yrSfhvtTVbuoVNhGKpSm84QcKcIKuo6rn3Nrp5d7sYrfvK6oBDP41qQkL
   srddWsAeduMR6vxPLTeZK+58Bc2IvjTkLaqIWo/tjRTwL0G0jiAruDRNd
   XZnE7crLAxq0bW/CuZhjdV23xhSgRC8CkrMJkCPiz9FhbJX+ynYDZ1Yzd
   d+5wh7+wR4CPftbGWFXOK+Ntjc5ikDvTqvqVjGBOLIG2UahWOk5A13MxC
   w==;
X-CSE-ConnectionGUID: OUgD+XFCQg+oaA05pgcYng==
X-CSE-MsgGUID: SnVUzf08S52wK8YmjGVG0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82333358"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="82333358"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 19:43:29 -0700
X-CSE-ConnectionGUID: hWatJOv8SM2HtSiHRdxm7A==
X-CSE-MsgGUID: s1vyisptTQ64CdHuY1qjWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="265741557"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 May 2026 19:43:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJjHJ-000000005gb-0KyS;
	Mon, 04 May 2026 02:43:25 +0000
Date: Mon, 04 May 2026 04:42:29 +0200
From: kernel test robot <lkp@intel.com>
To: Javen Xu <javen_xu@realsil.com.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/ethernet/realtek/r8169_main.c:5282:23: warning:
 variable 'irqflags' set but not used
Message-ID: <202605040407.Qa0P0CR0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/javen/r8169-add-some-register-definitions/20260422-012241
head:   f02a35e3ba7a9080f3e3d4f1c9c99dd128ab2466
commit: db198c468eedbb0c1f26f40d19df47baf4f98876 r8169: add napi and irq support
date:   12 days ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260504/202605040407.Qa0P0CR0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040407.Qa0P0CR0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040407.Qa0P0CR0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/realtek/r8169_main.c: In function 'rtl_open':
>> drivers/net/ethernet/realtek/r8169_main.c:5282:23: warning: variable 'irqflags' set but not used [-Wunused-but-set-variable]
    5282 |         unsigned long irqflags;
         |                       ^~~~~~~~
>> drivers/net/ethernet/realtek/r8169_main.c:5062:46: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 10 and 25 [-Wformat-truncation=]
    5062 |                 snprintf(irq->name, len, "%s-%d", dev->name, i);
         |                                              ^~
   In function 'rtl8169_request_irq',
       inlined from 'rtl_open' at drivers/net/ethernet/realtek/r8169_main.c:5309:11:
   drivers/net/ethernet/realtek/r8169_main.c:5062:42: note: directive argument in the range [-2147483641, 254]
    5062 |                 snprintf(irq->name, len, "%s-%d", dev->name, i);
         |                                          ^~~~~~~
   drivers/net/ethernet/realtek/r8169_main.c:5062:17: note: 'snprintf' output between 3 and 28 bytes into a destination of size 26
    5062 |                 snprintf(irq->name, len, "%s-%d", dev->name, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/irqflags +5282 drivers/net/ethernet/realtek/r8169_main.c

dc1c00ce70da5d drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5277  
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5278  static int rtl_open(struct net_device *dev)
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5279  {
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5280  	struct rtl8169_private *tp = netdev_priv(dev);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5281  	struct pci_dev *pdev = tp->pci_dev;
870f531e178e14 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2020-11-01 @5282  	unsigned long irqflags;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5283  	int retval = -ENOMEM;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5284  
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5285  	pm_runtime_get_sync(&pdev->dev);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5286  
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5287  	/*
e75d660672ddd1 drivers/net/ethernet/realtek/r8169.c      Jiri Kosina     2012-04-08  5288  	 * Rx and Tx descriptors needs 256 bytes alignment.
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5289  	 * dma_alloc_coherent provides more.
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5290  	 */
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5291  	tp->TxDescArray = dma_alloc_coherent(&pdev->dev, R8169_TX_RING_BYTES,
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5292  					     &tp->TxPhyAddr, GFP_KERNEL);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5293  	if (!tp->TxDescArray)
1c470b53ece583 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2020-10-29  5294  		goto out;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5295  
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5296  	tp->RxDescArray = dma_alloc_coherent(&pdev->dev, R8169_RX_RING_BYTES,
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5297  					     &tp->RxPhyAddr, GFP_KERNEL);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5298  	if (!tp->RxDescArray)
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5299  		goto err_free_tx_0;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5300  
b1127e641e8986 drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit 2018-04-17  5301  	retval = rtl8169_init_ring(tp);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5302  	if (retval < 0)
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5303  		goto err_free_rx_1;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5304  
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5305  	rtl_request_firmware(tp);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5306  
870f531e178e14 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2020-11-01  5307  	irqflags = pci_dev_msi_enabled(pdev) ? IRQF_NO_THREAD : IRQF_SHARED;
db198c468eedbb drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-04-20  5308  
db198c468eedbb drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-04-20  5309  	retval = rtl8169_request_irq(tp);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5310  	if (retval < 0)
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5311  		goto err_release_fw_2;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5312  
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit 2018-07-17  5313  	retval = r8169_phy_connect(tp);
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit 2018-07-17  5314  	if (retval)
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit 2018-07-17  5315  		goto err_free_irq;
567ca57faa6266 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2020-06-20  5316  	rtl8169_up(tp);
d56f58cec90d46 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2020-05-01  5317  	rtl8169_init_counter_offsets(tp);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5318  	netif_start_queue(dev);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5319  out:
1c470b53ece583 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2020-10-29  5320  	pm_runtime_put_sync(&pdev->dev);
1c470b53ece583 drivers/net/ethernet/realtek/r8169_main.c Heiner Kallweit 2020-10-29  5321  
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5322  	return retval;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5323  
f1e911d5d0dfde drivers/net/ethernet/realtek/r8169.c      Heiner Kallweit 2018-07-17  5324  err_free_irq:
db198c468eedbb drivers/net/ethernet/realtek/r8169_main.c Javen Xu        2026-04-20  5325  	rtl8169_free_irq(tp);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5326  err_release_fw_2:
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5327  	rtl_release_firmware(tp);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5328  	rtl8169_rx_clear(tp);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5329  err_free_rx_1:
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5330  	dma_free_coherent(&pdev->dev, R8169_RX_RING_BYTES, tp->RxDescArray,
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5331  			  tp->RxPhyAddr);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5332  	tp->RxDescArray = NULL;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5333  err_free_tx_0:
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5334  	dma_free_coherent(&pdev->dev, R8169_TX_RING_BYTES, tp->TxDescArray,
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5335  			  tp->TxPhyAddr);
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5336  	tp->TxDescArray = NULL;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5337  	goto out;
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5338  }
df43ac7831a0e3 drivers/net/ethernet/realtek/r8169.c      Francois Romieu 2012-03-08  5339  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
