Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D9155A4D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743786287; cv=none; b=UIZ90iL0MT+1dKwE2yg9TV055MFdcifNJpshb62H1ds8o6rF+MJS5tBN+Fako6ljRCCI8XKrd7ONOVfbewynPiFD6uq7fpRVZAAZ+N0UT+Cn36fugueJNvsM2y+H4RZMtrK26ny+L68XjC0NGBgrbMzQTseKsxHaWCqIl5mnWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743786287; c=relaxed/simple;
	bh=Vz6/3lSvbp8sxTTg+vPwHJqhlJw2sSLK8z7UCA7Htqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTHcuG1mvDM3zio91Zcm64XfD0HsNyky9G24GCnE4viKgDF0/jq7WL+2+kVpGtt/y9HaZfZmJN+RjbGgUU6ghC8NDAMqfqILJdzrt+kBrhvteTqzKGsOCDigQHjEXXHNQZmiFP7OWhnUylkshlZrF0xrurbaBDdPrq/3c0WFyXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZo00jsf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZo00jsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743786287; x=1775322287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vz6/3lSvbp8sxTTg+vPwHJqhlJw2sSLK8z7UCA7Htqs=;
  b=IZo00jsfE3Ix7e2+M4rQINOQ2K3g3TCsMi4ZHPw72DeBWLylGKaTIbVT
   dNC6DGKgbPU4mZ9DGJ/vyBMPL9iYGiI17WX5JcT/QkMSlmtAp5VzIjoqr
   P4r1DFWmTvEPhP9NGaEpI8yc3djoa/9fz3wv0yFflzJ6bkUrDDgIhiTlE
   91yEgLzJPumuVb8BIHtrtovo9FlQsDjIXR83Q8tPURf3utWXdxgNCZgnR
   FK6t/zoN7eCNwq+EMDF7OtfCIS3rMyQTAt22xNSG23skDJe0ZIE9Xm6xo
   f+lIr/6qNASEqz7u9N6oQbsRUgMPZza8OFhOqrKJgZokFVJBUfdLkYdnJ
   g==;
X-CSE-ConnectionGUID: EaNLHHsYRjuHWy5Qc34g+g==
X-CSE-MsgGUID: WwqHxJ7IQaainDF4WL77yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="49027883"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="49027883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:04:46 -0700
X-CSE-ConnectionGUID: ODEgiN94RuedLBvJYcrMKw==
X-CSE-MsgGUID: 4jvxsrPjR9yzT+CNn+bf4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132564001"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Apr 2025 10:04:43 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0kTB-0001PT-1Z;
	Fri, 04 Apr 2025 17:04:41 +0000
Date: Sat, 5 Apr 2025 01:04:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/cleanups 2/10]
 drivers/pps/generators/pps_gen_tio.c:230:9: error: implicit declaration of
 function 'hrtimer_init'; did you mean 'hrtimers_init'?
Message-ID: <202504050126.K62Di5RY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
commit: 58b3f2cce01bb48b6f6e0c1cdca5e5a2fc0c56ad [2/10] hrtimers: Delete hrtimer_init()
config: i386-buildonly-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050126.K62Di5RY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050126.K62Di5RY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050126.K62Di5RY-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pps/generators/pps_gen_tio.c: In function 'pps_gen_tio_probe':
>> drivers/pps/generators/pps_gen_tio.c:230:9: error: implicit declaration of function 'hrtimer_init'; did you mean 'hrtimers_init'? [-Werror=implicit-function-declaration]
     230 |         hrtimer_init(&tio->timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
         |         ^~~~~~~~~~~~
         |         hrtimers_init
   cc1: some warnings being treated as errors


vim +230 drivers/pps/generators/pps_gen_tio.c

c89755d1111fa17 Subramanian Mohan 2025-02-19  199  
c89755d1111fa17 Subramanian Mohan 2025-02-19  200  static int pps_gen_tio_probe(struct platform_device *pdev)
c89755d1111fa17 Subramanian Mohan 2025-02-19  201  {
c89755d1111fa17 Subramanian Mohan 2025-02-19  202  	struct device *dev = &pdev->dev;
c89755d1111fa17 Subramanian Mohan 2025-02-19  203  	struct pps_tio *tio;
c89755d1111fa17 Subramanian Mohan 2025-02-19  204  
c89755d1111fa17 Subramanian Mohan 2025-02-19  205  	if (!(cpu_feature_enabled(X86_FEATURE_TSC_KNOWN_FREQ) &&
c89755d1111fa17 Subramanian Mohan 2025-02-19  206  	      cpu_feature_enabled(X86_FEATURE_ART))) {
c89755d1111fa17 Subramanian Mohan 2025-02-19  207  		dev_warn(dev, "TSC/ART is not enabled");
c89755d1111fa17 Subramanian Mohan 2025-02-19  208  		return -ENODEV;
c89755d1111fa17 Subramanian Mohan 2025-02-19  209  	}
c89755d1111fa17 Subramanian Mohan 2025-02-19  210  
c89755d1111fa17 Subramanian Mohan 2025-02-19  211  	tio = devm_kzalloc(dev, sizeof(*tio), GFP_KERNEL);
c89755d1111fa17 Subramanian Mohan 2025-02-19  212  	if (!tio)
c89755d1111fa17 Subramanian Mohan 2025-02-19  213  		return -ENOMEM;
c89755d1111fa17 Subramanian Mohan 2025-02-19  214  
c89755d1111fa17 Subramanian Mohan 2025-02-19  215  	tio->gen_info.use_system_clock = true;
c89755d1111fa17 Subramanian Mohan 2025-02-19  216  	tio->gen_info.enable = pps_tio_gen_enable;
c89755d1111fa17 Subramanian Mohan 2025-02-19  217  	tio->gen_info.get_time = pps_tio_get_time;
c89755d1111fa17 Subramanian Mohan 2025-02-19  218  	tio->gen_info.owner = THIS_MODULE;
c89755d1111fa17 Subramanian Mohan 2025-02-19  219  
c89755d1111fa17 Subramanian Mohan 2025-02-19  220  	tio->pps_gen = pps_gen_register_source(&tio->gen_info);
c89755d1111fa17 Subramanian Mohan 2025-02-19  221  	if (IS_ERR(tio->pps_gen))
c89755d1111fa17 Subramanian Mohan 2025-02-19  222  		return PTR_ERR(tio->pps_gen);
c89755d1111fa17 Subramanian Mohan 2025-02-19  223  
c89755d1111fa17 Subramanian Mohan 2025-02-19  224  	tio->dev = dev;
c89755d1111fa17 Subramanian Mohan 2025-02-19  225  	tio->base = devm_platform_ioremap_resource(pdev, 0);
c89755d1111fa17 Subramanian Mohan 2025-02-19  226  	if (IS_ERR(tio->base))
c89755d1111fa17 Subramanian Mohan 2025-02-19  227  		return PTR_ERR(tio->base);
c89755d1111fa17 Subramanian Mohan 2025-02-19  228  
c89755d1111fa17 Subramanian Mohan 2025-02-19  229  	pps_tio_disable(tio);
c89755d1111fa17 Subramanian Mohan 2025-02-19 @230  	hrtimer_init(&tio->timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
c89755d1111fa17 Subramanian Mohan 2025-02-19  231  	tio->timer.function = hrtimer_callback;
c89755d1111fa17 Subramanian Mohan 2025-02-19  232  	spin_lock_init(&tio->lock);
c89755d1111fa17 Subramanian Mohan 2025-02-19  233  	platform_set_drvdata(pdev, &tio);
c89755d1111fa17 Subramanian Mohan 2025-02-19  234  
c89755d1111fa17 Subramanian Mohan 2025-02-19  235  	return 0;
c89755d1111fa17 Subramanian Mohan 2025-02-19  236  }
c89755d1111fa17 Subramanian Mohan 2025-02-19  237  

:::::: The code at line 230 was first introduced by commit
:::::: c89755d1111fa17ecfb69b50c336778a2d37dae4 pps: generators: Add PPS Generator TIO Driver

:::::: TO: Subramanian Mohan <subramanian.mohan@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
