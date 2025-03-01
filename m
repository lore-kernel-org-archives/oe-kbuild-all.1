Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090A117580
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740836426; cv=none; b=K7o2BBVoFxHF0xsktd4bwrladLomjIZmd1hhRG9q7gYcqUOp7S4Clip58fDVux5dN+A2QK4o2RgZ6NJAgHifzlc/423nA5Ck1cJH25I3pOUkAnJazafUhbiB/pctdFkmzm51jee0MdtElkcTD9M0fxxUiHK9Ir2lbp9E2sQ9XDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740836426; c=relaxed/simple;
	bh=lvoEqAKzLzOQjgOayDCSdJlfrSTv34eEdMq2H1RRLHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TkuxSKe6ZFx9ZFVs1Q+NgIY9Ls3cp1YrwSf0AekyG3XEhVLpfa4bBU69XmCjpf1wujBKYHp9+eInUFUsD69lBy2lhe86ZGvycAwcM8i2KkDRCNqzrZMF+GtunRADacEE9eXiz56qWx9uVhozB/XU7wsCGKnTPduJOn6CeVGjmqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kmc5tvne; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kmc5tvne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740836424; x=1772372424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lvoEqAKzLzOQjgOayDCSdJlfrSTv34eEdMq2H1RRLHY=;
  b=Kmc5tvne+cmXh+r5f4fDs+CGoXZY1K1lyGoggbI59rD4KGqYy5ReDqRN
   DhDx6PgLOUTEZleK1o6AjmBvl7CDQ5BnInUBzRjKpLajUkdM5ZeuGGZoa
   weP4DI98xljDJ6tFEh1ILsbQgn4vT0vcFPEDqUJBx/g0ggktBqic5DS31
   kyxMd3Lw/JttuP022yOQpQTMKyJhmaKOfs6D7d9Hdb+ACSyx3BS/I/uhy
   m9sWbGFWpzU7V5NF/P/wXH2bTs2lGj8e/QrzXy0AKSUYwNgHYADspQM+x
   lkYeed5QgMGdHdXKsz57RAD/JvS2tQ8OTwe5wfEeVJsPJ3sQPzHrH85xw
   A==;
X-CSE-ConnectionGUID: fpb1PCQ3SIylM1xWdGAkWg==
X-CSE-MsgGUID: BrkNdhWATYmbl/xIMvalPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41455389"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="41455389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 05:40:23 -0800
X-CSE-ConnectionGUID: 4WI7DZfPTRuDDA1wFxNpOA==
X-CSE-MsgGUID: zJvXT/evS7GnR+4i7IeemA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148504551"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Mar 2025 05:40:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toN4m-000GHW-0D;
	Sat, 01 Mar 2025 13:40:20 +0000
Date: Sat, 1 Mar 2025 21:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 59/86] drivers/mfd/88pm860x-core.c:627:9: error:
 implicit declaration of function 'irq_domain_add_legacy_of_node'; did you
 mean 'irq_domain_add_legacy'?
Message-ID: <202503012157.svJctukP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   6a5773ba87efb03d0d268aa0936b43196309cbb6
commit: 8ae34066ab729cbc83be795387f0677fe126cc5f [59/86] irqdomain: Rename _add functions to _add_*_of_node
config: arc-randconfig-002-20250301 (https://download.01.org/0day-ci/archive/20250301/202503012157.svJctukP-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503012157.svJctukP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503012157.svJctukP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
>> drivers/mfd/88pm860x-core.c:627:9: error: implicit declaration of function 'irq_domain_add_legacy_of_node'; did you mean 'irq_domain_add_legacy'? [-Werror=implicit-function-declaration]
     627 |         irq_domain_add_legacy_of_node(node, nr_irqs, chip->irq_base, 0,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         irq_domain_add_legacy
   cc1: some warnings being treated as errors
--
   drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
>> drivers/mfd/max8925-core.c:685:9: error: implicit declaration of function 'irq_domain_add_legacy_of_node'; did you mean 'irq_domain_add_legacy'? [-Werror=implicit-function-declaration]
     685 |         irq_domain_add_legacy_of_node(node, MAX8925_NR_IRQS, chip->irq_base, 0,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         irq_domain_add_legacy
   cc1: some warnings being treated as errors


vim +627 drivers/mfd/88pm860x-core.c

   566	
   567	static int device_irq_init(struct pm860x_chip *chip,
   568					     struct pm860x_platform_data *pdata)
   569	{
   570		struct i2c_client *i2c = (chip->id == CHIP_PM8607) ?
   571			chip->client : chip->companion;
   572		unsigned char status_buf[INT_STATUS_NUM];
   573		unsigned long flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
   574		int data, mask, ret = -EINVAL;
   575		int nr_irqs, irq_base = -1;
   576		struct device_node *node = i2c->dev.of_node;
   577	
   578		mask = PM8607_B0_MISC1_INV_INT | PM8607_B0_MISC1_INT_CLEAR
   579			| PM8607_B0_MISC1_INT_MASK;
   580		data = 0;
   581		chip->irq_mode = 0;
   582		if (pdata && pdata->irq_mode) {
   583			/*
   584			 * irq_mode defines the way of clearing interrupt. If it's 1,
   585			 * clear IRQ by write. Otherwise, clear it by read.
   586			 * This control bit is valid from 88PM8607 B0 steping.
   587			 */
   588			data |= PM8607_B0_MISC1_INT_CLEAR;
   589			chip->irq_mode = 1;
   590		}
   591		ret = pm860x_set_bits(i2c, PM8607_B0_MISC1, mask, data);
   592		if (ret < 0)
   593			goto out;
   594	
   595		/* mask all IRQs */
   596		memset(status_buf, 0, INT_STATUS_NUM);
   597		ret = pm860x_bulk_write(i2c, PM8607_INT_MASK_1,
   598					INT_STATUS_NUM, status_buf);
   599		if (ret < 0)
   600			goto out;
   601	
   602		if (chip->irq_mode) {
   603			/* clear interrupt status by write */
   604			memset(status_buf, 0xFF, INT_STATUS_NUM);
   605			ret = pm860x_bulk_write(i2c, PM8607_INT_STATUS1,
   606						INT_STATUS_NUM, status_buf);
   607		} else {
   608			/* clear interrupt status by read */
   609			ret = pm860x_bulk_read(i2c, PM8607_INT_STATUS1,
   610						INT_STATUS_NUM, status_buf);
   611		}
   612		if (ret < 0)
   613			goto out;
   614	
   615		mutex_init(&chip->irq_lock);
   616	
   617		if (pdata && pdata->irq_base)
   618			irq_base = pdata->irq_base;
   619		nr_irqs = ARRAY_SIZE(pm860x_irqs);
   620		chip->irq_base = irq_alloc_descs(irq_base, 0, nr_irqs, 0);
   621		if (chip->irq_base < 0) {
   622			dev_err(&i2c->dev, "Failed to allocate interrupts, ret:%d\n",
   623				chip->irq_base);
   624			ret = -EBUSY;
   625			goto out;
   626		}
 > 627		irq_domain_add_legacy_of_node(node, nr_irqs, chip->irq_base, 0,
   628				      &pm860x_irq_domain_ops, chip);
   629		chip->core_irq = i2c->irq;
   630		if (!chip->core_irq)
   631			goto out;
   632	
   633		ret = request_threaded_irq(chip->core_irq, NULL, pm860x_irq,
   634					   flags | IRQF_ONESHOT, "88pm860x", chip);
   635		if (ret) {
   636			dev_err(chip->dev, "Failed to request IRQ: %d\n", ret);
   637			chip->core_irq = 0;
   638		}
   639	
   640		return 0;
   641	out:
   642		chip->core_irq = 0;
   643		return ret;
   644	}
   645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
