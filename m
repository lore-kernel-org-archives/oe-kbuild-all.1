Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF807B679
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 00:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724373013; cv=none; b=u40TEaz1XpJqyppMH6VSvx8yp2SA4L45YyYxsMVZsBEotC/tAIYaQtlpGk9GtczCvLCjNtDEJydX7vWOFH2WcSCUzLMHTv5sfJy2qs2BJCc6fcIj74pwf9eWf1IQr8vRSl42SUTx6g23VDhi+esMxLpTpVD7w7jGRHAEO95SKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724373013; c=relaxed/simple;
	bh=gRdnYETvgXt1loE1snfb9njk07/X04JcDWFEaDCoO0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqY6B5LkiLXF4bL+VoG01ygCMkhk046Ekawd0UJJWGQb21Dcm8Le1lSXjcqPrZAbWSOx1nNk9fho0hPRDM8Wysj++50qeU08zPlouvsnIQZdEWUouHJpgCkXvdwGn/Vq0kucBmY7lfxdxd4LWYpMzhOj51Wk56QqcoiRIpdKQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WfPjy/R8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfPjy/R8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724373011; x=1755909011;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gRdnYETvgXt1loE1snfb9njk07/X04JcDWFEaDCoO0Q=;
  b=WfPjy/R8OMCo5royLw8hxkvG8A1FxbE2q4Y73XHuANnqVFMAPRFtEn1W
   4yHJQLc37wLQ3mZFFk1TNkt05hbEV3u6cRGQzVrDD6JpFtsQY/37m/4cS
   kqWm/C6yZanjJwhjakL0EQWNmnlnvLeyKL4bwFx7JkJ4fWYONsXxkWeG+
   pw0DL0gNB2hN/nxRNaIq6jh1KQtQJjce14Xw6Iny7KRkn54TnEzGvUH5q
   Uflh2Oo+5lnu9TdLOYFi1+1bmAeAlCeuljDkiUUqL9o3lZJvdzbEQJll9
   MlE2CL0BHew5jtA7R3ClG7z/Anhebds1ZPt2i+pBQ0KGh7oVfLcqzIrab
   g==;
X-CSE-ConnectionGUID: 3Y6a/xbOSv2xpGw0oJJ2vg==
X-CSE-MsgGUID: OruwIxlPSHOHLQkYJItNjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33486884"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="33486884"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 17:30:10 -0700
X-CSE-ConnectionGUID: 0FD2cAf6QZiuhA1laY/fgw==
X-CSE-MsgGUID: 1C63xuUSRj2gC1FC054Xpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="66456183"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Aug 2024 17:30:09 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shIBq-000DJo-1C;
	Fri, 23 Aug 2024 00:30:06 +0000
Date: Fri, 23 Aug 2024 08:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4] ptp: Add vDSO-style vmclock support
Message-ID: <202408230722.KxiF5aM0-lkp@intel.com>
References: <410bbef9771ef8aa51704994a70d5965e367e2ce.camel@infradead.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <410bbef9771ef8aa51704994a70d5965e367e2ce.camel@infradead.org>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Woodhouse/ptp-Add-vDSO-style-vmclock-support/20240822-055147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/410bbef9771ef8aa51704994a70d5965e367e2ce.camel%40infradead.org
patch subject: [PATCH v4] ptp: Add vDSO-style vmclock support
config: x86_64-randconfig-r133-20240822 (https://download.01.org/0day-ci/archive/20240823/202408230722.KxiF5aM0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230722.KxiF5aM0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230722.KxiF5aM0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ptp/ptp_vmclock.c:562:13: sparse: sparse: restricted __le32 degrades to integer

vim +562 drivers/ptp/ptp_vmclock.c

   486	
   487	static int vmclock_probe(struct platform_device *pdev)
   488	{
   489		struct device *dev = &pdev->dev;
   490		struct vmclock_state *st;
   491		int ret;
   492	
   493		st = devm_kzalloc(dev, sizeof (*st), GFP_KERNEL);
   494		if (!st)
   495			return -ENOMEM;
   496	
   497		if (has_acpi_companion(dev))
   498			ret = vmclock_probe_acpi(dev, st);
   499		else
   500			ret = -EINVAL; /* Only ACPI for now */
   501	
   502		if (ret) {
   503			dev_info(dev, "Failed to obtain physical address: %d\n", ret);
   504			goto out;
   505		}
   506	
   507		if (resource_size(&st->res) < VMCLOCK_MIN_SIZE) {
   508			dev_info(dev, "Region too small (0x%llx)\n",
   509				 resource_size(&st->res));
   510			ret = -EINVAL;
   511			goto out;
   512		}
   513		st->clk = devm_memremap(dev, st->res.start, resource_size(&st->res),
   514					MEMREMAP_WB | MEMREMAP_DEC);
   515		if (IS_ERR(st->clk)) {
   516			ret = PTR_ERR(st->clk);
   517			dev_info(dev, "failed to map shared memory\n");
   518			st->clk = NULL;
   519			goto out;
   520		}
   521	
   522		if (le32_to_cpu(st->clk->magic) != VMCLOCK_MAGIC ||
   523		    le32_to_cpu(st->clk->size) > resource_size(&st->res) ||
   524		    le16_to_cpu(st->clk->version) != 1) {
   525			dev_info(dev, "vmclock magic fields invalid\n");
   526			ret = -EINVAL;
   527			goto out;
   528		}
   529	
   530		ret = ida_alloc(&vmclock_ida, GFP_KERNEL);
   531		if (ret < 0)
   532			goto out;
   533	
   534		st->index = ret;
   535		ret = devm_add_action_or_reset(&pdev->dev, vmclock_put_idx, st);
   536		if (ret)
   537			goto out;
   538	
   539		st->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "vmclock%d", st->index);
   540		if (!st->name) {
   541			ret = -ENOMEM;
   542			goto out;
   543		}
   544	
   545		/*
   546		 * If the structure is big enough, it can be mapped to userspace.
   547		 * Theoretically a guest OS even using larger pages could still
   548		 * use 4KiB PTEs to map smaller MMIO regions like this, but let's
   549		 * cross that bridge if/when we come to it.
   550		 */
   551		if (le32_to_cpu(st->clk->size) >= PAGE_SIZE) {
   552			st->miscdev.minor = MISC_DYNAMIC_MINOR;
   553			st->miscdev.fops = &vmclock_miscdev_fops;
   554			st->miscdev.name = st->name;
   555	
   556			ret = misc_register(&st->miscdev);
   557			if (ret)
   558				goto out;
   559		}
   560	
   561		/* If there is valid clock information, register a PTP clock */
 > 562		if (VMCLOCK_FIELD_PRESENT(st->clk, time_frac_sec)) {
   563			/* Can return a silent NULL, or an error. */
   564			st->ptp_clock = vmclock_ptp_register(dev, st);
   565			if (IS_ERR(st->ptp_clock)) {
   566				ret = PTR_ERR(st->ptp_clock);
   567				st->ptp_clock = NULL;
   568				vmclock_remove(pdev);
   569				goto out;
   570			}
   571		}
   572	
   573		if (!st->miscdev.minor && !st->ptp_clock) {
   574			/* Neither miscdev nor PTP registered */
   575			dev_info(dev, "vmclock: Neither miscdev nor PTP available; not registering\n");
   576			ret = -ENODEV;
   577			goto out;
   578		}
   579	
   580		dev_info(dev, "%s: registered %s%s%s\n", st->name,
   581			 st->miscdev.minor ? "miscdev" : "",
   582			 (st->miscdev.minor && st->ptp_clock) ? ", " : "",
   583			 st->ptp_clock ? "PTP" : "");
   584	
   585		dev_set_drvdata(dev, st);
   586	
   587	 out:
   588		return ret;
   589	}
   590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
