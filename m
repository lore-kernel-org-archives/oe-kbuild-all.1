Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC29E1FC7C5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 00:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399840; cv=none; b=lk4e+U6zx9RzaKjeucE2GmKYrC36T5avOF6z1uP6fBv6ZqDuZJasGmj1u5pgts7FYfVJBYCF/7Nfp+9JvBZNOp6Fw/hoieyCY0+ySi+xq1hmJ5FIi1udOvMe4lY2CwDcPQJ23qq76Antuk7mBbg6mHGxFuw4zlrtg7i1AzOAM2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399840; c=relaxed/simple;
	bh=iU6hKwEb3SZYBncx8DNKYuGFWs+HIMXHSdIuwvrQ45s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nzwVQvDiF3V7keFUBkjagoxZG2GEa+F7diP4Qmgq4RRb6gvG5ZlqwPTp58S+rFr3BafBM+OFKiWorqxr+o9jK0hsyaGrjbI7/3spLXKB3U/FSqRFTdaY8C3/151TErabPDFfzBs9uS0UWHqiHH312557EsAeY3+nf+eY5DPZrIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHF669O9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHF669O9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774399838; x=1805935838;
  h=date:from:to:cc:subject:message-id;
  bh=iU6hKwEb3SZYBncx8DNKYuGFWs+HIMXHSdIuwvrQ45s=;
  b=eHF669O9LsVL3UlDyjpfHyVRlxGtru6V+RR80zix4iRCT4LWj5DG3FlG
   cUcosRc/Y5fpl9ckdOwpO9Z5Q1arCbHenCGWMZ20ZC2mwsx5gblJXqn9T
   4vNoDSxjiO3q0nC0JdyIeWT0aRZu1hs/AswEhHMQGGYbdu4Zt8PeOy64u
   /xCjTpAuRwFNh/yn9RivXjtqMxCGkbyuV4bUgYY97vJVVJZS6KLLx90ZB
   B5k5ngi0guGBghhTUyYS2JfFuH5qw33wI8A18cCzrP0IHGa6vHpbt4+eG
   q6VPuuaWJEpDo1I9XnrYnxzDg80XQEKBdoPUC8KUmm/PM0EqlieBi6c5D
   w==;
X-CSE-ConnectionGUID: DJ0YjsKZQNa239lHgct17A==
X-CSE-MsgGUID: rMzjBZK5QH2DfPtbeXMTsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85739689"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="85739689"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 17:50:36 -0700
X-CSE-ConnectionGUID: TqbSgbXZRAamxEir2+KKFA==
X-CSE-MsgGUID: +nydbD99RjacUAo5FBxygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224780494"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Mar 2026 17:50:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5CS7-000000005el-3NHa;
	Wed, 25 Mar 2026 00:50:31 +0000
Date: Wed, 25 Mar 2026 08:50:20 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [lee-mfd:for-mfd-next 23/25] drivers/mfd/ezx-pcap.c:412:20:
 error: implicit declaration of function 'devm_alloc_ordered_workqueue'; did
 you mean 'alloc_ordered_workqueue'?
Message-ID: <202603250850.8C5TBMn1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   a526075f56fb8f2fd96f791654ff1557e6680bde
commit: 356ee03f6ae7d04f90d8e2104660193c4f3a071c [23/25] mfd: ezx-pcap: Avoid rescheduling after destroying workqueue
config: parisc-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603250850.8C5TBMn1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250850.8C5TBMn1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250850.8C5TBMn1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/mfd/ezx-pcap.c: In function 'ezx_pcap_probe':
>> drivers/mfd/ezx-pcap.c:412:20: error: implicit declaration of function 'devm_alloc_ordered_workqueue'; did you mean 'alloc_ordered_workqueue'? [-Werror=implicit-function-declaration]
     pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                       alloc_ordered_workqueue
>> drivers/mfd/ezx-pcap.c:412:18: warning: assignment to 'struct workqueue_struct *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
                     ^
   cc1: some warnings being treated as errors


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
