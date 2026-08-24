Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D6A37A493
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 20:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602886; cv=none; b=TgOUyOrWhV1AkknhOMP2ohuvX9KP5TtvKFFAijqPEl8yDEhKM3H2RwHWbu8cRimVCTW56SnuULF/vAuKqgJGzqrqz27w3D0n+nQ9Wuv2eikt4En4cjGrp0pPvVjvvNxFe5Ze2wL8turYW+Yq8pkhsFDjwwWihml9qQwkqhwvKvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602886; c=relaxed/simple;
	bh=L8hPtj8Pj0n/M5dQ+OLk5avFP/yFb3OMUkIdFp71+Bc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=grpG/dLU3Yur0Pr2m0DtdB4RcJE8aBBQ559SfGNWoeEeTO2iANMKuRok6bx7NCNjBp4GufdVvS3VnPael/Z9vBXAqBY7lqR2zCxJu6adJ3uV3HFu9y8RpUmPw5a8hxQsADqKTkyRPMRbzSdJb/kNK5ww8RWY8Z6PF8vfl9r8zWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E4D5N0l6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E4D5N0l6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787602883; x=1819138883;
  h=date:from:to:cc:subject:message-id;
  bh=L8hPtj8Pj0n/M5dQ+OLk5avFP/yFb3OMUkIdFp71+Bc=;
  b=E4D5N0l6YgU1uPtCpP6tv1KWUrxHDfLJRrSLvpazbxbcutATBRAXevk4
   0l5XLuonmxhmDlXSIG6rfIXWbS4gtVEMLNIU2LAuz0MkCNxQahkRaoWIN
   VnkEslMUundnEAP95WRX/uogw0FXHzwy6+9Iv0HMOameDgrKqwtRnU6eg
   wxELbIoDd55GzgwOkNIunLTu0GcGXMX6+kk4M0q06vpdnMUwo3Xw1JN8b
   UXwGR2b49Dr6fasehun7W/e+21aXjxt5wMoO94d9vzQvPzBAjNwuiZzuu
   pZdctskmYalnUqD8JxJLpPW4G1K0o7NyGCdkhZIQuflQ4vE0d219ENT8Z
   w==;
X-CSE-ConnectionGUID: RIAKyV+YSpSXeJnNQO6cvQ==
X-CSE-MsgGUID: 1n/+xIJ8To6KqUOiMbQY+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="110850744"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="110850744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:21:22 -0700
X-CSE-ConnectionGUID: YbQTxM7rRsC/wiy5WFYceQ==
X-CSE-MsgGUID: cN5v3df3QtSsgz7tnAu8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="272311731"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Aug 2026 13:21:20 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wybAL-00000000431-018s;
	Mon, 24 Aug 2026 20:21:14 +0000
Date: Tue, 25 Aug 2026 04:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: Swark Yang <syang@axiado.com>
Cc: oe-kbuild-all@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [jassibrar-mailbox:for-next 22/22]
 drivers/mailbox/axiado-mailbox.c:325:39: warning: '-errors' directive output
 may be truncated writing 7 bytes into a region of size between 2 and 11
Message-ID: <202608250447.gGkRwNAl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
head:   14af7a96afa39f4f3c1972705489b9ba15c01857
commit: 14af7a96afa39f4f3c1972705489b9ba15c01857 [22/22] mailbox: add Axiado AX3005 mailbox driver
config: arm64-randconfig-004-20260825 (https://download.01.org/0day-ci/archive/20260825/202608250447.gGkRwNAl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608250447.gGkRwNAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608250447.gGkRwNAl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mailbox/axiado-mailbox.c: In function 'axiado_mbox_probe':
>> drivers/mailbox/axiado-mailbox.c:325:39: warning: '-errors' directive output may be truncated writing 7 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
      snprintf(name, sizeof(name), "chan%u-errors", i);
                                          ^~~~~~~
   drivers/mailbox/axiado-mailbox.c:325:3: note: 'snprintf' output between 13 and 22 bytes into a destination of size 16
      snprintf(name, sizeof(name), "chan%u-errors", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +325 drivers/mailbox/axiado-mailbox.c

   266	
   267	static int axiado_mbox_probe(struct platform_device *pdev)
   268	{
   269		const struct axiado_mbox_data *drv_data;
   270		struct axiado_channel_data *ch_data;
   271		struct device *dev = &pdev->dev;
   272		struct axiado_mbox *mb;
   273		unsigned int irq_idx = 0;
   274		unsigned int rx_chan;
   275		unsigned int i;
   276		int ret;
   277	
   278		drv_data = device_get_match_data(dev);
   279		if (!drv_data)
   280			return -ENODEV;
   281	
   282		mb = devm_kzalloc(dev, sizeof(*mb), GFP_KERNEL);
   283		if (!mb)
   284			return -ENOMEM;
   285	
   286		mb->mbox.dev = dev;
   287		mb->mbox.num_chans = drv_data->num_chans;
   288	
   289		mb->mbox.chans = devm_kcalloc(&pdev->dev,
   290					      drv_data->num_chans,
   291					      sizeof(*mb->mbox.chans),
   292					      GFP_KERNEL);
   293		if (!mb->mbox.chans)
   294			return -ENOMEM;
   295	
   296		mb->tx_base = devm_platform_ioremap_resource_byname(pdev, "tx");
   297		if (IS_ERR(mb->tx_base))
   298			return PTR_ERR(mb->tx_base);
   299	
   300		mb->rx_base = devm_platform_ioremap_resource_byname(pdev, "rx");
   301		if (IS_ERR(mb->rx_base))
   302			return PTR_ERR(mb->rx_base);
   303	
   304		ch_data = devm_kcalloc(&pdev->dev,
   305				       drv_data->num_chans,
   306				       sizeof(*ch_data),
   307				       GFP_KERNEL);
   308		if (!ch_data)
   309			return -ENOMEM;
   310	
   311		mb->debugfs_dir = debugfs_create_dir(dev_name(dev), NULL);
   312		ret = devm_add_action_or_reset(dev, axiado_mbox_debugfs_remove,
   313					       mb->debugfs_dir);
   314		if (ret)
   315			return ret;
   316	
   317		for (i = 0; i < drv_data->num_chans; i++) {
   318			char name[16];
   319	
   320			ch_data[i].channel_num = i;
   321			ch_data[i].chan = &mb->mbox.chans[i];
   322	
   323			mb->mbox.chans[i].con_priv = &ch_data[i];
   324	
 > 325			snprintf(name, sizeof(name), "chan%u-errors", i);
   326			debugfs_create_atomic_t(name, 0444, mb->debugfs_dir,
   327						&ch_data[i].fifo_errors);
   328	
   329			if (i < AXIADO_MBOX_TX_CHANS) {
   330				ch_data[i].mbox_reg = mb->tx_base + (i * AXIADO_MBOX_CHAN_STRIDE);
   331				ch_data[i].csr_reg = mb->tx_base + AXIADO_MBOX_TX_REG_STRIDE +
   332						       (i * AXIADO_MBOX_CHAN_STRIDE);
   333				ch_data[i].irq = -1;
   334				continue;
   335			}
   336	
   337			ch_data[i].rx_buffer = devm_kzalloc(dev, drv_data->msg_size,
   338							    GFP_KERNEL);
   339			if (!ch_data[i].rx_buffer)
   340				return -ENOMEM;
   341	
   342			rx_chan = i - AXIADO_MBOX_TX_CHANS;
   343			ch_data[i].mbox_reg = mb->rx_base +
   344					       (rx_chan * AXIADO_MBOX_CHAN_STRIDE);
   345			ch_data[i].csr_reg = mb->rx_base + AXIADO_MBOX_RX_REG_STRIDE +
   346					      (rx_chan * AXIADO_MBOX_CHAN_STRIDE);
   347			ch_data[i].irq = platform_get_irq(pdev, irq_idx++);
   348			if (ch_data[i].irq < 0)
   349				return dev_err_probe(dev, ch_data[i].irq,
   350						     "Failed to get IRQ for channel %u\n", i);
   351	
   352			ret = devm_request_threaded_irq(dev, ch_data[i].irq, NULL,
   353							axiado_rx_thread,
   354							IRQF_ONESHOT | IRQF_NO_AUTOEN,
   355							dev_name(dev), &ch_data[i]);
   356			if (ret)
   357				return dev_err_probe(dev, ret,
   358						     "Failed to request IRQ for channel %u\n", i);
   359	
   360			dev_dbg(dev, "RX chan %u -> irq %d\n", i, ch_data[i].irq);
   361		}
   362	
   363		platform_set_drvdata(pdev, mb);
   364		mb->drv_data = drv_data;
   365		mb->mbox.ops = &axiado_mbox_chan_ops;
   366		mb->mbox.txdone_irq = false;
   367		mb->mbox.txdone_poll = true;
   368		mb->mbox.txpoll_period = 5;
   369	
   370		return devm_mbox_controller_register(dev, &mb->mbox);
   371	}
   372	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
