Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3638C40B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 06:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784268823; cv=none; b=dS0sq4mBi1Utbob0aAAYJMTDtLJfwrvj5J6VcU1mjoTyk1KQ3O7N4UKv71gzhMmk2+MnUCRF9lt9ZjcLeUB3zhGxzbnyMgT3pLDIT7G9U/8RWvKzkHG0+IIwiiJ2IEUho68Nk58Z9XU+bUhgHzreyt7/KFSJIcOK3q/zZ19jELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784268823; c=relaxed/simple;
	bh=cauGNuk1I2RzC0u/GEkzsWkSnzgbTIPwFAJxoio2XSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aQVcDNAUxHBv6NliEEkZFEYkCFSsQuX0H6n1wzeuZewcU4Q/RApmdm9CuN9HV4qy0aZw5af8SUN2Q5UW7S/THW8tFEqtJ9+/vLj4SzJv3fNbUwDRO3cL8v8uk/VpjjBo3MXhF/XWuyBBbwrRs5ZndGWzHRXqH0Gqm+iR5ZTjdus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnZ/30jU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnZ/30jU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784268821; x=1815804821;
  h=date:from:to:cc:subject:message-id;
  bh=cauGNuk1I2RzC0u/GEkzsWkSnzgbTIPwFAJxoio2XSM=;
  b=XnZ/30jUD6SDBwM+lduO7g9imHzNtl7Qjk8bcThc7QBesMuEfyId9EDo
   +zQkW5KIUYLhA/rBslvzbiLp3Fb8uYMmfjDRuyUG7UHB+JTDrxW1CGrPk
   9/HgYehDKzpDZOnUj/PRs7JJH5UCNbrTNyABlDLKcbyAzW5RU4faepZLu
   DBAuQ0Bt/YJlc+nV54JaWHOfPn/KeTUfqGXYAKthcZw5bCVYRNHcdquyH
   frfAOge7lIYHIvVqsBjVAM0UV4QxOezKzUpoQSfeMXd2StCdBZOk704KD
   zeQSu70VDFAAWPYCUTpCDBKSdd8U4t9R0BPt3PgGqhG1iluu408zPqtz6
   A==;
X-CSE-ConnectionGUID: q89OYZgITjGX5bNcqnRKyw==
X-CSE-MsgGUID: kV/2hPmqTvmwC+2wX0f22w==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85028928"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="85028928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 23:13:40 -0700
X-CSE-ConnectionGUID: cdw6IVJOT6qqEns9iVv4ig==
X-CSE-MsgGUID: T5l/cb7cTeO/epJddnXEzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="260286553"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Jul 2026 23:13:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkbpI-00000000STo-3xU2;
	Fri, 17 Jul 2026 06:13:36 +0000
Date: Fri, 17 Jul 2026 14:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:next 15/15]
 drivers/pmdomain/starfive/jh71xx-pmu.c:271:13: warning: variable 'ret' set
 but not used
Message-ID: <202607171349.RX0peGoS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
head:   ffdca02d427a25b04a6985bcf139ce7602ccc046
commit: ffdca02d427a25b04a6985bcf139ce7602ccc046 [15/15] pmdomain: starfive: Remove redundant dev_err()
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260717/202607171349.RX0peGoS-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171349.RX0peGoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171349.RX0peGoS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pmdomain/starfive/jh71xx-pmu.c: In function 'jh7110_pmu_parse_irq':
>> drivers/pmdomain/starfive/jh71xx-pmu.c:271:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable=]
     271 |         int ret;
         |             ^~~


vim +/ret +271 drivers/pmdomain/starfive/jh71xx-pmu.c

08b9a94e8654d4 drivers/soc/starfive/jh71xx_pmu.c      Walker Chen      2023-01-19  267  
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  268  static int jh7110_pmu_parse_irq(struct platform_device *pdev, struct jh71xx_pmu *pmu)
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  269  {
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  270  	struct device *dev = &pdev->dev;
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13 @271  	int ret;
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  272  
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  273  	pmu->irq = platform_get_irq(pdev, 0);
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  274  	if (pmu->irq < 0)
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  275  		return pmu->irq;
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  276  
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  277  	ret = devm_request_irq(dev, pmu->irq, jh71xx_pmu_interrupt,
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  278  			       0, pdev->name, pmu);
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  279  
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  280  	jh71xx_pmu_int_enable(pmu, JH71XX_PMU_INT_ALL_MASK & ~JH71XX_PMU_INT_PCH_FAIL, true);
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  281  
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  282  	return 0;
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  283  }
296eea56129bdb drivers/pmdomain/starfive/jh71xx-pmu.c Changhuang Liang 2023-09-13  284  

:::::: The code at line 271 was first introduced by commit
:::::: 296eea56129bdb30680d97b5297b2e6c598976f1 pmdomain: starfive: Extract JH7110 pmu private operations

:::::: TO: Changhuang Liang <changhuang.liang@starfivetech.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
