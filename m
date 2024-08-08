Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE14F155C8E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 22:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155468; cv=none; b=QTjpjJl3MfyfYSzlyULBDt51LnZhEBfKz3qkTl3Y8IioBglolsCgGZmaBKlLLkHL3CMqERNHBpqttPoFHudLNtrczNJs/lb+4gZKL9RldSJ1SV6wnTLEhyyKlBIl2+9wAMJddmPPbriqNOP7o3Z0lUmTcAZkGlj555MFBug6z/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155468; c=relaxed/simple;
	bh=dkBBAPHvAZBQsYnnm/hRvZvf6GqN8xomrejp5POxLb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lifJx/pML/5LZ4Y32xJLSdWmDhnu5Pv5h7kb4TTFud/DsDGu2T+2NRf7eP3rFrPBqBRXe4jqCdd1akVTZUPsFNQWj7DjxjnpkFMwZxIgtdoWnb6r3jDdrrmTC/4xw1ty14z6+9o4ZCC2iDFXJfSYhhuGYpJqWtx2X/gntIhgrOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2R/NKsZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2R/NKsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723155467; x=1754691467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dkBBAPHvAZBQsYnnm/hRvZvf6GqN8xomrejp5POxLb4=;
  b=X2R/NKsZhXpfxl64QgCSc5B67DiChm4NhcitV9O2ejIQ1pjW8vPKuekb
   uIp5W45f7TJE/+UXmQ16ngT57AdyOaw5wKFu8hs/c5YfT9qHniE7IhZ1F
   4ZIxOxMH6XCFklDVBFdUN9dwwBJtbnU+E3W/KrcgWqF4wuLo5uPtaSq1j
   dkXAJ+NU4ymE+8JH7OX32lg3nEzqlL+rAeb5sjC6gar4Q4zhMBCOSPYr3
   Q60/8W6MkTuePRbCdudWtiQMblx7sk7b/Q/cOIs9xk43r8ICQq40zWGS5
   YPpDyxFYH7O4C2J8LZQYtDDCy0uY5cDF0IMLf+hxMScCTZz56WibljMWS
   w==;
X-CSE-ConnectionGUID: bAkWHF+rRQ6SmlEXUx4PJA==
X-CSE-MsgGUID: u/lsGCcdQTGulfMhriBAlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43827892"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="43827892"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 15:17:47 -0700
X-CSE-ConnectionGUID: hc4F4SfDRcyttGfw4c2oYg==
X-CSE-MsgGUID: +6Z3ELm3Qeekl2mnFaW9sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57604307"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 15:17:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scBS2-0006Ys-1n;
	Thu, 08 Aug 2024 22:17:42 +0000
Date: Fri, 9 Aug 2024 06:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 73/83] sound/sparc/cs4231.c:2018:25: error:
 'chpi' undeclared; did you mean 'chip'?
Message-ID: <202408090648.J2EAijjH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   c46fc83e3f3c89f18962e43890de90b1c304747a
commit: d41abde894830bfb77252653f606473728e930eb [73/83] ALSA: sparc: Use standard print API
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20240809/202408090648.J2EAijjH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090648.J2EAijjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090648.J2EAijjH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from sound/sparc/cs4231.c:21:
   sound/sparc/cs4231.c: In function 'snd_cs4231_ebus_create':
>> sound/sparc/cs4231.c:2018:25: error: 'chpi' undeclared (first use in this function); did you mean 'chip'?
    2018 |                 dev_dbg(chpi->card->dev,
         |                         ^~~~
   include/linux/dev_printk.h:139:44: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   sound/sparc/cs4231.c:2018:17: note: in expansion of macro 'dev_dbg'
    2018 |                 dev_dbg(chpi->card->dev,
         |                 ^~~~~~~
   sound/sparc/cs4231.c:2018:25: note: each undeclared identifier is reported only once for each function it appears in
    2018 |                 dev_dbg(chpi->card->dev,
         |                         ^~~~
   include/linux/dev_printk.h:139:44: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                            ^~~
   sound/sparc/cs4231.c:2018:17: note: in expansion of macro 'dev_dbg'
    2018 |                 dev_dbg(chpi->card->dev,
         |                 ^~~~~~~


vim +2018 sound/sparc/cs4231.c

  1950	
  1951	static int snd_cs4231_ebus_create(struct snd_card *card,
  1952					  struct platform_device *op,
  1953					  int dev)
  1954	{
  1955		struct snd_cs4231 *chip = card->private_data;
  1956		int err;
  1957	
  1958		spin_lock_init(&chip->lock);
  1959		spin_lock_init(&chip->c_dma.ebus_info.lock);
  1960		spin_lock_init(&chip->p_dma.ebus_info.lock);
  1961		mutex_init(&chip->mce_mutex);
  1962		mutex_init(&chip->open_mutex);
  1963		chip->flags |= CS4231_FLAG_EBUS;
  1964		chip->op = op;
  1965		memcpy(&chip->image, &snd_cs4231_original_image,
  1966		       sizeof(snd_cs4231_original_image));
  1967		strcpy(chip->c_dma.ebus_info.name, "cs4231(capture)");
  1968		chip->c_dma.ebus_info.flags = EBUS_DMA_FLAG_USE_EBDMA_HANDLER;
  1969		chip->c_dma.ebus_info.callback = snd_cs4231_ebus_capture_callback;
  1970		chip->c_dma.ebus_info.client_cookie = chip;
  1971		chip->c_dma.ebus_info.irq = op->archdata.irqs[0];
  1972		strcpy(chip->p_dma.ebus_info.name, "cs4231(play)");
  1973		chip->p_dma.ebus_info.flags = EBUS_DMA_FLAG_USE_EBDMA_HANDLER;
  1974		chip->p_dma.ebus_info.callback = snd_cs4231_ebus_play_callback;
  1975		chip->p_dma.ebus_info.client_cookie = chip;
  1976		chip->p_dma.ebus_info.irq = op->archdata.irqs[1];
  1977	
  1978		chip->p_dma.prepare = _ebus_dma_prepare;
  1979		chip->p_dma.enable = _ebus_dma_enable;
  1980		chip->p_dma.request = _ebus_dma_request;
  1981		chip->p_dma.address = _ebus_dma_addr;
  1982	
  1983		chip->c_dma.prepare = _ebus_dma_prepare;
  1984		chip->c_dma.enable = _ebus_dma_enable;
  1985		chip->c_dma.request = _ebus_dma_request;
  1986		chip->c_dma.address = _ebus_dma_addr;
  1987	
  1988		chip->port = of_ioremap(&op->resource[0], 0, 0x10, "cs4231");
  1989		chip->p_dma.ebus_info.regs =
  1990			of_ioremap(&op->resource[1], 0, 0x10, "cs4231_pdma");
  1991		chip->c_dma.ebus_info.regs =
  1992			of_ioremap(&op->resource[2], 0, 0x10, "cs4231_cdma");
  1993		if (!chip->port || !chip->p_dma.ebus_info.regs ||
  1994		    !chip->c_dma.ebus_info.regs) {
  1995			snd_cs4231_ebus_free(chip);
  1996			dev_dbg(chip->card->dev,
  1997				"cs4231-%d: Unable to map chip registers.\n", dev);
  1998			return -EIO;
  1999		}
  2000	
  2001		if (ebus_dma_register(&chip->c_dma.ebus_info)) {
  2002			snd_cs4231_ebus_free(chip);
  2003			dev_dbg(chip->card->dev,
  2004				"cs4231-%d: Unable to register EBUS capture DMA\n",
  2005				dev);
  2006			return -EBUSY;
  2007		}
  2008		if (ebus_dma_irq_enable(&chip->c_dma.ebus_info, 1)) {
  2009			snd_cs4231_ebus_free(chip);
  2010			dev_dbg(chip->card->dev,
  2011				"cs4231-%d: Unable to enable EBUS capture IRQ\n",
  2012				dev);
  2013			return -EBUSY;
  2014		}
  2015	
  2016		if (ebus_dma_register(&chip->p_dma.ebus_info)) {
  2017			snd_cs4231_ebus_free(chip);
> 2018			dev_dbg(chpi->card->dev,
  2019				"cs4231-%d: Unable to register EBUS play DMA\n",
  2020				dev);
  2021			return -EBUSY;
  2022		}
  2023		if (ebus_dma_irq_enable(&chip->p_dma.ebus_info, 1)) {
  2024			snd_cs4231_ebus_free(chip);
  2025			dev_dbg(chip->card->dev,
  2026				"cs4231-%d: Unable to enable EBUS play IRQ\n", dev);
  2027			return -EBUSY;
  2028		}
  2029	
  2030		if (snd_cs4231_probe(chip) < 0) {
  2031			snd_cs4231_ebus_free(chip);
  2032			return -ENODEV;
  2033		}
  2034		snd_cs4231_init(chip);
  2035	
  2036		err = snd_device_new(card, SNDRV_DEV_LOWLEVEL,
  2037				     chip, &snd_cs4231_ebus_dev_ops);
  2038		if (err < 0) {
  2039			snd_cs4231_ebus_free(chip);
  2040			return err;
  2041		}
  2042	
  2043		return 0;
  2044	}
  2045	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
