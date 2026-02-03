Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39AE39E195
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125838; cv=none; b=LOanb94QNZt0sCHFW3g1un4vngRenvS92E4WmTyXFZMC4vq7zgFRCmH/5Z3sXUY/yfSKO0chMutH1B5IBAqSBEo7AeYFnEcWpLErwcqH3PyILUJmyRZ+AvvszrTcd3lYuGQv8RW/RYsup42xTTYbtCBXX00l/tLx6WVFtNHjIxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125838; c=relaxed/simple;
	bh=rLvwSN3Uz5uhxWXl5e00aiIyW5ykBESG7SvoM/VGydk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2Q3laAJTuYgoDe7veMflXmG4+c91s89KhEYL2SaujzqdaygyDofzNEaLRashAI6aB2BOx4ZiXSJfgNvALOVBjXVJ0bvMwWk4bmKrGV94e863ZPmRVQLtfiMCk2RQrVP9YDrmE3FE378ZNlJBVsS87sLfM+RksjDDqVnXFbmEGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkHYwE81; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkHYwE81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770125836; x=1801661836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rLvwSN3Uz5uhxWXl5e00aiIyW5ykBESG7SvoM/VGydk=;
  b=QkHYwE81B4t0d4t6lpU8aFTlP38ZjDxwgQ61dtCpE+EyyKTKJDQ9Dhcu
   rd1RStU3HDO2mw7/bK5C4mwD2xZMrMw5N/SUL87r3tV7x3ECWInLBG9T5
   xWxRyhH0/2BfBfGdu+BBPf+1N1lipexiF/bpjfU7SrCdA+s+ez/bwKTPm
   F6rXF3arfrp513vNienDa/II6F4DJoDiG2S5koGPdNkzNg+UiTsWKWBMd
   878u+85s+0IBOUCr0uNHk1H2aAgYqwv4b6s7iferjAyuFXBvVBTA+uNQB
   jg0qlhqqRrb2btJCXxFHJbOvSDvn3rbqcR4PHM3J8Mk3r4uFjJn69muhS
   A==;
X-CSE-ConnectionGUID: yWBWUn+fSPSliHHH4lKWWQ==
X-CSE-MsgGUID: 8VAI8gkcRoib/CzkuyagHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71201983"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="71201983"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 05:37:15 -0800
X-CSE-ConnectionGUID: S4JzETjrQLWG9fcIrO4XeQ==
X-CSE-MsgGUID: bTnck/MDR9WEB+6C3uRhKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Feb 2026 05:37:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnGab-00000000ghK-3RHN;
	Tue, 03 Feb 2026 13:37:09 +0000
Date: Tue, 3 Feb 2026 21:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 2/3] reset: add Sky1 soc reset support
Message-ID: <202602032143.85yHYNk5-lkp@intel.com>
References: <20260203022031.4075627-3-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203022031.4075627-3-gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master pza/reset/next v6.19-rc8 next-20260202]
[cannot apply to pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-soc-cix-document-the-simple-mfd-syscon-on-Sky1-SoC/20260203-102331
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260203022031.4075627-3-gary.yang%40cixtech.com
patch subject: [PATCH v6 2/3] reset: add Sky1 soc reset support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602032143.85yHYNk5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032143.85yHYNk5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032143.85yHYNk5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-sky1-base.c:97:5: warning: no previous prototype for 'sky1_reset_common_probe' [-Wmissing-prototypes]
      97 | int sky1_reset_common_probe(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sky1_reset_common_probe +97 drivers/reset/reset-sky1-base.c

    96	
  > 97	int sky1_reset_common_probe(struct platform_device *pdev,
    98				const struct sky1_src_variant *variant)
    99	{
   100		struct sky1_src *sky1src;
   101		struct device *dev = &pdev->dev;
   102	
   103		sky1src = devm_kzalloc(dev, sizeof(*sky1src), GFP_KERNEL);
   104		if (!sky1src)
   105			return -ENOMEM;
   106	
   107		sky1src->regmap = device_node_to_regmap(dev->parent->of_node);
   108		if (IS_ERR(sky1src->regmap)) {
   109			dev_err(dev, "Unable to get sky1-src regmap");
   110			return PTR_ERR(sky1src->regmap);
   111		}
   112	
   113		sky1src->signals = variant->signals;
   114		sky1src->rcdev.owner     = THIS_MODULE;
   115		sky1src->rcdev.nr_resets = variant->signals_num;
   116		sky1src->rcdev.ops       = &sky1_src_ops;
   117		sky1src->rcdev.of_node   = dev->parent->of_node;
   118		sky1src->rcdev.dev       = dev;
   119	
   120		return devm_reset_controller_register(dev, &sky1src->rcdev);
   121	}
   122	EXPORT_SYMBOL_GPL(sky1_reset_common_probe);
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
