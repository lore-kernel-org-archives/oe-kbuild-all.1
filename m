Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FCF28CF6F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 02:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406271; cv=none; b=lMLMGKw6Dc0eKoebyVUUT0MPPeYB3zcNVbjCSSK+Kl0o6Vi+cyosMYRxVtjSwCSnoAL7QRRpynJ5IUglGQvJP+G24YdK7SaWGnR8Noa7xx3RMcub8YmoyimkB2q0jkjiKBBVDSB5PHRKKc/IVrVZFnm9tePe+WV8YnVDf48YyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406271; c=relaxed/simple;
	bh=6ezKWO+jH0luJS2knjrwSD0NsXrlhEH7kOYZFAtumBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i3YRBsRc4/KG5mVD3DxPYVWrYV+DYJWxNcS+jvtvWQDklDong3HlQQeri/w5IG9xQvGB+5EDEsUpRbLYmPbmwLwEtvxbxYjxvOmOpXgyzFQW4LzB0cBU4z+VVd80OPHQfA83wSe0YidB0XC0579Gq0Q3SRd6LE7KfFMKTfNSYh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgIkD7Yy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgIkD7Yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774406270; x=1805942270;
  h=date:from:to:cc:subject:message-id;
  bh=6ezKWO+jH0luJS2knjrwSD0NsXrlhEH7kOYZFAtumBI=;
  b=RgIkD7Yy7K402ugfFaAOxtWDLGtjXOob8CGSi/Onv5f5jPfY5iU+Lo0T
   aAFolJTrE7s/6AWelN3/oAKKXkmiyYLQjOyGaqCy/PNLo9trOrC4dT0oR
   xFdoq6HRE3Q+34sHOkKNdVx1ML4WwlIp90FfD7OOcIKb1W0/VCNWzvZdA
   NY0yAnnDH5eE1F+hVPsbB95zjNZwVYMmT/7Sd+kbeNBbyDR3X5S7HYxrk
   PqmCiS+9q2E+RC8o+UciLIHrlTN3zvPyNgDd8hJ5MYv2yFVTGwwGVv59j
   S4zM32TF2/TUJRLzXLyvIpVRHsffCo/Mm/BXBCZxY4fhO1HLQOf2O0tha
   g==;
X-CSE-ConnectionGUID: WNZBbUDeQVK94vPKyaXsaA==
X-CSE-MsgGUID: 6u6uDAZnS2GGWiXfBX3aOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93012432"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="93012432"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:37:47 -0700
X-CSE-ConnectionGUID: +m/fZ5t8TBGVtG2qRmI94Q==
X-CSE-MsgGUID: WLkX3hb1TrGFOL4sbMEPqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="223742257"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Mar 2026 19:37:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5E7o-000000005n9-0IyK;
	Wed, 25 Mar 2026 02:37:40 +0000
Date: Wed, 25 Mar 2026 10:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [lee-mfd:for-mfd-next 23/25] drivers/mfd/ezx-pcap.c:412:25:
 error: assignment to 'struct workqueue_struct *' from 'int' makes pointer
 from integer without a cast
Message-ID: <202603251022.UUrCADAc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   a526075f56fb8f2fd96f791654ff1557e6680bde
commit: 356ee03f6ae7d04f90d8e2104660193c4f3a071c [23/25] mfd: ezx-pcap: Avoid rescheduling after destroying workqueue
config: x86_64-randconfig-161-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251022.UUrCADAc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251022.UUrCADAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251022.UUrCADAc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/ezx-pcap.c: In function 'ezx_pcap_probe':
   drivers/mfd/ezx-pcap.c:412:27: error: implicit declaration of function 'devm_alloc_ordered_workqueue'; did you mean 'alloc_ordered_workqueue'? [-Wimplicit-function-declaration]
     412 |         pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           alloc_ordered_workqueue
>> drivers/mfd/ezx-pcap.c:412:25: error: assignment to 'struct workqueue_struct *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     412 |         pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
         |                         ^


vim +412 drivers/mfd/ezx-pcap.c

   379	
   380	static int ezx_pcap_probe(struct spi_device *spi)
   381	{
   382		struct pcap_platform_data *pdata = dev_get_platdata(&spi->dev);
   383		struct pcap_chip *pcap;
   384		int i, adc_irq;
   385		int ret;
   386	
   387		/* platform data is required */
   388		if (!pdata)
   389			return -ENODEV;
   390	
   391		pcap = devm_kzalloc(&spi->dev, sizeof(*pcap), GFP_KERNEL);
   392		if (!pcap)
   393			return -ENOMEM;
   394	
   395		spin_lock_init(&pcap->io_lock);
   396		spin_lock_init(&pcap->adc_lock);
   397		INIT_WORK(&pcap->isr_work, pcap_isr_work);
   398		INIT_WORK(&pcap->msr_work, pcap_msr_work);
   399		spi_set_drvdata(spi, pcap);
   400	
   401		/* setup spi */
   402		spi->bits_per_word = 32;
   403		spi->mode = SPI_MODE_0 | (pdata->config & PCAP_CS_AH ? SPI_CS_HIGH : 0);
   404		ret = spi_setup(spi);
   405		if (ret)
   406			return ret;
   407	
   408		pcap->spi = spi;
   409	
   410		/* setup irq */
   411		pcap->irq_base = pdata->irq_base;
 > 412		pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
   413		if (!pcap->workqueue)
   414			return -ENOMEM;
   415	
   416		/* redirect interrupts to AP, except adcdone2 */
   417		if (!(pdata->config & PCAP_SECOND_PORT))
   418			ezx_pcap_write(pcap, PCAP_REG_INT_SEL,
   419						(1 << PCAP_IRQ_ADCDONE2));
   420	
   421		/* setup irq chip */
   422		for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++) {
   423			irq_set_chip_and_handler(i, &pcap_irq_chip, handle_simple_irq);
   424			irq_set_chip_data(i, pcap);
   425			irq_clear_status_flags(i, IRQ_NOREQUEST | IRQ_NOPROBE);
   426		}
   427	
   428		/* mask/ack all PCAP interrupts */
   429		ezx_pcap_write(pcap, PCAP_REG_MSR, PCAP_MASK_ALL_INTERRUPT);
   430		ezx_pcap_write(pcap, PCAP_REG_ISR, PCAP_CLEAR_INTERRUPT_REGISTER);
   431		pcap->msr = PCAP_MASK_ALL_INTERRUPT;
   432	
   433		irq_set_irq_type(spi->irq, IRQ_TYPE_EDGE_RISING);
   434		irq_set_chained_handler_and_data(spi->irq, pcap_irq_handler, pcap);
   435		irq_set_irq_wake(spi->irq, 1);
   436	
   437		/* ADC */
   438		adc_irq = pcap_to_irq(pcap, (pdata->config & PCAP_SECOND_PORT) ?
   439						PCAP_IRQ_ADCDONE2 : PCAP_IRQ_ADCDONE);
   440	
   441		ret = devm_request_irq(&spi->dev, adc_irq, pcap_adc_irq, 0, "ADC",
   442					pcap);
   443		if (ret)
   444			goto free_irqchip;
   445	
   446		/* setup subdevs */
   447		for (i = 0; i < pdata->num_subdevs; i++) {
   448			ret = pcap_add_subdev(pcap, &pdata->subdevs[i]);
   449			if (ret)
   450				goto remove_subdevs;
   451		}
   452	
   453		/* board specific quirks */
   454		if (pdata->init)
   455			pdata->init(pcap);
   456	
   457		return 0;
   458	
   459	remove_subdevs:
   460		device_for_each_child(&spi->dev, NULL, pcap_remove_subdev);
   461	free_irqchip:
   462		for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
   463			irq_set_chip_and_handler(i, NULL, NULL);
   464	
   465		return ret;
   466	}
   467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
