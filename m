Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE2F27181B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 01:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739322574; cv=none; b=je1ZHpTIjMQeFOeRZ7DVSCQ29rnr368zdO/65zAqAI60DAIA5avLCuIqrwZbOyr3203fAes92/mLWCB+3kyoFSfXUgwgHE7zxgIg8te19sAzxbWLeVQStk5GaeZwyMELQb5MK+IaQVxOnBu4+mt1HFmcYAdCtFWszrD4V8t74uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739322574; c=relaxed/simple;
	bh=pQpEfmnAxj2yvzxvHhRhXtZMA/9/pAb4iul1eDmMxzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hj4ES3OYEKGTdDsScUAab1riRsXveozf0YF4OuCKbZoRND0PhVWxEdPvk+YX59tDQ5eFSSC6jYDBiVPaXETeMKqVolp8C7viVBRv9iaRwzY/UIJ6aRMqCL7qHuPG2Qej7VnE23BPMoPy8WiaV5XI7tyVli2JCzpy+7wHUSa0+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzwTjfeO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzwTjfeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739322572; x=1770858572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQpEfmnAxj2yvzxvHhRhXtZMA/9/pAb4iul1eDmMxzU=;
  b=ZzwTjfeO69aBSWUeyp2cFMe0eJP8dSv8kaAtnVQ9EvG+pn2BhjWbXSMH
   2OMEEHAvwYf9bjCprEdKKp3wYL3504WZM+8MaH2ZDSjeopFgITvzkk7HO
   ubJM5/bQW+6rj1ulUhDEQGsijsePvM0G1iFs+/TmNOspWzD+Ykt7rNJnq
   ownbBTXgN29GmxBepWeSLXUdQvq6FRSju7GGU3v2kFrVw2Zyb9Wcy+oSx
   EPQFHc8B2vlFF73cL6WYhJuaBYfhDZG8ajvMt/JvwgnhGt8udcPlkIX0a
   E/5ZnADoPzxKJwzReLnZ18fDCNjpoVdLBByYO0dK+7xszf97ddU/HSdGa
   g==;
X-CSE-ConnectionGUID: mhot/1Y8R1+ehYsqekpneA==
X-CSE-MsgGUID: t/We9rZIT/q+ueZCnYzmrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39199752"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="39199752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 17:09:30 -0800
X-CSE-ConnectionGUID: dT35Pf+URHuhF3lx97ZF8g==
X-CSE-MsgGUID: pGj7+kfcSseem9QPMGkGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112536051"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Feb 2025 17:09:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti1Fn-0014v3-0v;
	Wed, 12 Feb 2025 01:09:27 +0000
Date: Wed, 12 Feb 2025 09:09:20 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 23/33]
 drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant
 because platform_get_irq() already prints an error
Message-ID: <202502120936.Z8YSEFaD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   dcb5a245dbe2203ae35f6b1b5cb28929f758008c
commit: f5f738835d14a2da372e2d393b08993dcd567bf9 [23/33] hwrng: Add StarFive JH7100 Random Number Generator driver
config: powerpc-randconfig-r053-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120936.Z8YSEFaD-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120936.Z8YSEFaD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/char/hw_random/starfive-vic-rng.c:209:2-9: line 209 is redundant because platform_get_irq() already prints an error

vim +209 drivers/char/hw_random/starfive-vic-rng.c

   186	
   187	static int vic_rng_probe(struct platform_device *pdev)
   188	{
   189		int ret;
   190		int irq;
   191		struct vic_rng *rng;
   192		struct resource *res;
   193	
   194		rng = devm_kzalloc(&pdev->dev, sizeof(*rng), GFP_KERNEL);
   195		if (!rng){
   196			return -ENOMEM;
   197		}
   198	
   199		platform_set_drvdata(pdev, rng);
   200	
   201		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   202		rng->base = devm_ioremap_resource(&pdev->dev, res);
   203		if (IS_ERR(rng->base)){
   204			return PTR_ERR(rng->base);
   205		}
   206	
   207		irq = platform_get_irq(pdev, 0);
   208		if (irq <= 0) {
 > 209			dev_err(&pdev->dev, "Couldn't get irq %d\n", irq);
   210			return irq;
   211		}
   212	
   213		ret = devm_request_irq(&pdev->dev, irq, vic_rng_irq, 0, pdev->name,
   214					(void *)rng);
   215		if (ret) {
   216			dev_err(&pdev->dev, "Can't get interrupt working.\n");
   217			return ret;
   218		}
   219	
   220		rng->rng.name = pdev->name;
   221		rng->rng.init = vic_rng_init;
   222		rng->rng.cleanup = vic_rng_cleanup;
   223		rng->rng.read = vic_rng_read;
   224	
   225		rng->dev = &pdev->dev;
   226	
   227		ret = devm_hwrng_register(&pdev->dev, &rng->rng);
   228		if (ret) {
   229			dev_err(&pdev->dev, "failed to register hwrng\n");
   230			return ret;
   231		}
   232	
   233		dev_info(&pdev->dev, "Initialized\n");
   234	
   235		return 0;
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
