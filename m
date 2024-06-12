Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBEF1369B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 06:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718173476; cv=none; b=bnOTfM7FCvrgY0QJow6wgHG6LNApbskk/mY9+PykEXbqHBGONud90LpMbUycqv2abJAbl1gDMQTvmu6hynOamcb+So1b3Am2f+6zLNWT3dlIp6gl4iisLf7osk8fZAoDi5R78QiwraszrmeZDebFFZydUfdgMTTBypj+krB1iBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718173476; c=relaxed/simple;
	bh=r2q9CvbRmVyNJQ1z6Qzm1KPDb4hThM7rFmKBk2uZbdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+ouufRhVfhOpSD8Pw0Ml9fuvpCRxUzKO1sIyEFFMSE3+3I1oJj4hBSGnntDN12weTBmqrj6hUHUesbzKtNdHvciPJAiAV1APUQfXSxZVZD6sBpFa3LumTYK7Deq0aK8B2axfqtlk9to3Et7IOmMVd2fozqf40IXIWjo3P8gVGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InNc9FSX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InNc9FSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718173474; x=1749709474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r2q9CvbRmVyNJQ1z6Qzm1KPDb4hThM7rFmKBk2uZbdg=;
  b=InNc9FSXM8iMczTXmAQRSAN8IMni0u4Hpdn6zcItgg48FtIOmDPq8HEi
   Fk2tfS91iQ9nYVuQG7m8mZImMQ67TgK3KmnGS3WzgHiz6Mby2bNQNNzKz
   WqaD9o06mdGs6zuICHqi0w8g/dPY1Bp64UDag7qIbEKPQYbZCwqZsv0gb
   1eEBmFSjew2aD2BCpXh+mKxAMHbKrgxujwTpwBBBrXYfb79/2n5bCnlSW
   XX4lK04odvUQmwK/bJ/CzW3GPi5sIXqL+U+opUIktT1cr19X89Kn6zLNI
   YbncWBOCFDhh8XJHteoVkGCNHXBReizbVluMmtouxWcfvfPwJDql4Blay
   Q==;
X-CSE-ConnectionGUID: 0hKrrwbASiiOZGSKXxQEzQ==
X-CSE-MsgGUID: YeaoHN3WTxqfPRcZZ5/TkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14759311"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="14759311"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 23:24:34 -0700
X-CSE-ConnectionGUID: AXko5eaMT6iugVYzFqFN2w==
X-CSE-MsgGUID: GFNjnRDAQnOGTB52nyzeKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="44082444"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2024 23:24:33 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHHPL-0001HC-0W;
	Wed, 12 Jun 2024 06:24:31 +0000
Date: Wed, 12 Jun 2024 14:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds
 Interrupt
Message-ID: <202406121341.QCPOP2oG-lkp@intel.com>
References: <20240611150458.684349-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611150458.684349-1-csokas.bence@prolan.hu>

Hi Bence,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on linus/master v6.10-rc3 next-20240611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cs-k-s-Bence/rtc-pcf2127-Add-PPS-capability-through-Seconds-Interrupt/20240611-231226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20240611150458.684349-1-csokas.bence%40prolan.hu
patch subject: [RFC PATCH v2] rtc: pcf2127: Add PPS capability through Seconds Interrupt
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406121341.QCPOP2oG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406121341.QCPOP2oG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406121341.QCPOP2oG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/rtc/rtc-pcf2127.c: In function 'pcf2127_rtc_irq':
>> drivers/rtc/rtc-pcf2127.c:759:27: error: 'pps' undeclared (first use in this function)
     759 |                 pps_event(pps, &ts, PPS_CAPTUREASSERT, NULL);
         |                           ^~~
   drivers/rtc/rtc-pcf2127.c:759:27: note: each undeclared identifier is reported only once for each function it appears in
   drivers/rtc/rtc-pcf2127.c: In function 'pcf2127_probe':
>> drivers/rtc/rtc-pcf2127.c:1198:26: error: passing argument 1 of 'snprintf' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1198 |                 snprintf(&pps_info.name, PPS_MAX_NAME_LEN - 1, "%s", dev_name(dev));
         |                          ^~~~~~~~~~~~~~
         |                          |
         |                          char (*)[32]
   In file included from include/linux/kernel.h:33,
                    from arch/arm64/include/asm/cpufeature.h:26,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/rtc/rtc-pcf2127.c:20:
   include/linux/sprintf.h:12:35: note: expected 'char *' but argument is of type 'char (*)[32]'
      12 | __printf(3, 4) int snprintf(char *buf, size_t size, const char *fmt, ...);
         |                             ~~~~~~^~~
   cc1: some warnings being treated as errors


vim +/pps +759 drivers/rtc/rtc-pcf2127.c

   689	
   690	static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
   691	{
   692		struct pcf2127 *pcf2127 = dev_get_drvdata(dev);
   693		struct pps_event_time ts;
   694		unsigned int ctrl2;
   695		int ret = 0;
   696	
   697		/* First of all we get the time stamp... */
   698		pps_get_ts(&ts);
   699	
   700		ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
   701		if (ret)
   702			return IRQ_NONE;
   703	
   704		if (pcf2127->cfg->ts_count == 1) {
   705			/* PCF2127/29 */
   706			unsigned int ctrl1;
   707	
   708			ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL1, &ctrl1);
   709			if (ret)
   710				return IRQ_NONE;
   711	
   712			if (!(ctrl1 & PCF2127_CTRL1_IRQ_MASK || ctrl2 & PCF2127_CTRL2_IRQ_MASK))
   713				return IRQ_NONE;
   714	
   715			if (ctrl1 & PCF2127_BIT_CTRL1_TSF1 || ctrl2 & PCF2127_BIT_CTRL2_TSF2)
   716				pcf2127_rtc_ts_snapshot(dev, 0);
   717	
   718			if (ctrl1 & PCF2127_CTRL1_IRQ_MASK)
   719				regmap_write(pcf2127->regmap, PCF2127_REG_CTRL1,
   720					     ctrl1 & ~PCF2127_CTRL1_IRQ_MASK);
   721	
   722			if (ctrl2 & PCF2127_CTRL2_IRQ_MASK)
   723				regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
   724					     ctrl2 & ~PCF2127_CTRL2_IRQ_MASK);
   725		} else {
   726			/* PCF2131. */
   727			unsigned int ctrl4;
   728	
   729			ret = regmap_read(pcf2127->regmap, PCF2131_REG_CTRL4, &ctrl4);
   730			if (ret)
   731				return IRQ_NONE;
   732	
   733			if (!(ctrl4 & PCF2131_CTRL4_IRQ_MASK || ctrl2 & PCF2131_CTRL2_IRQ_MASK))
   734				return IRQ_NONE;
   735	
   736			if (ctrl4 & PCF2131_CTRL4_IRQ_MASK) {
   737				int i;
   738				int tsf_bit = PCF2131_BIT_CTRL4_TSF1; /* Start at bit 7. */
   739	
   740				for (i = 0; i < pcf2127->cfg->ts_count; i++) {
   741					if (ctrl4 & tsf_bit)
   742						pcf2127_rtc_ts_snapshot(dev, i);
   743	
   744					tsf_bit = tsf_bit >> 1;
   745				}
   746	
   747				regmap_write(pcf2127->regmap, PCF2131_REG_CTRL4,
   748					     ctrl4 & ~PCF2131_CTRL4_IRQ_MASK);
   749			}
   750	
   751			if (ctrl2 & PCF2131_CTRL2_IRQ_MASK)
   752				regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
   753					     ctrl2 & ~PCF2131_CTRL2_IRQ_MASK);
   754		}
   755	
   756		if (ctrl2 & PCF2127_BIT_CTRL2_AF)
   757			rtc_update_irq(pcf2127->rtc, 1, RTC_IRQF | RTC_AF);
   758		else if (ctrl2 & PCF2127_BIT_CTRL2_MSF)
 > 759			pps_event(pps, &ts, PPS_CAPTUREASSERT, NULL);
   760	
   761		pcf2127_wdt_active_ping(&pcf2127->wdd);
   762	
   763		return IRQ_HANDLED;
   764	}
   765	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
