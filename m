Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CD175A8F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 02:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774404886; cv=none; b=QrCsEN6uWk4xilLlIwVpEDMeB4oo/0NwmP7rVIRawVjXTuqGDe3PupY4ulHsmXD91OYH65oti7cTWfpImvQVvmJTA5fPnTS5ugaPUUBtjud8g/MPGbpk9SILYkhezykXpbaPS4IZpRB76XtifOdzjTf2s/TbXyPp1Jq9ww575CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774404886; c=relaxed/simple;
	bh=HKC0V81SUeg+fv4K4gpJ4NRVAlBhrHQBKmVuDbASspQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bW0fZIBmaekj0nqmM4mRi3NBDu78x9aqqeZMxLcEq5giCOvpMDw1l2L5yrqjJdhsj+x/aFi7TEL71W2ZVuE0rBVnAmr2DLtdtGhIakWS9NGx9bKc4I1EZozarPpvNpvVDannB0wPT+ncGlPZUIw7Cl+o8iUrOutT0jyNwmAmmJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnhy8WyO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnhy8WyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774404884; x=1805940884;
  h=date:from:to:cc:subject:message-id;
  bh=HKC0V81SUeg+fv4K4gpJ4NRVAlBhrHQBKmVuDbASspQ=;
  b=nnhy8WyOraz9Ch1tMavlhoOPIm8UWEOzP8kk+bp8qTbNKxcZYdMTcKw+
   YDEbTCnn/4oJsoQOayM0D5r7IZETpH3lSFyKZIcq7RpHhhFeEBDyQfbv9
   RTeyTxVo35l0BVMWoJeFlvTYCt3b5LHo9FIYUXMrIrVW+9yTksJ3T2FLA
   EGZB8jrXYb76phL1Sy3wXp6GKfksbArMEjN0sUcSXIbASZGCLcQENLqaQ
   HhTSELdc2kLTXVeTgqaLlF/OGihP6/AkZP9/YtZQ8EbzIAX/RrClc7IRk
   q0NpK/sb/KTweMaAVmvq+1bIP5eMarpticklkl/pV+vjyxKyKVT6xI+AJ
   g==;
X-CSE-ConnectionGUID: D6sUHb2zQiywsifKYkrrUA==
X-CSE-MsgGUID: Qjf6Sn14TVy3v4Ssp3s6fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93010527"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="93010527"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 19:14:43 -0700
X-CSE-ConnectionGUID: o2iIP0qBQeS64ia3gLKISQ==
X-CSE-MsgGUID: 1jqbUH5UTa2RWjEKxoV0Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="220121080"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Mar 2026 19:14:41 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5DlW-000000005ll-3YKb;
	Wed, 25 Mar 2026 02:14:38 +0000
Date: Wed, 25 Mar 2026 10:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [arm-perf:for-next/perf 4/11]
 drivers/perf/arm-cmn.c:2149:45: warning: format '%llx' expects argument of
 type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka
 'unsigned int'}
Message-ID: <202603251029.epC7wJIx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   2f89b7f78c50ca973ca035ceb30426f78d9e0996
commit: 5394396ff5488f007248727988b722c5d4f0638b [4/11] perf/arm-cmn: Stop claiming entire iomem region
config: arm-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251029.epC7wJIx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251029.epC7wJIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251029.epC7wJIx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/perf/arm-cmn.c: In function 'arm_cmn_init_dtc':
>> drivers/perf/arm-cmn.c:2149:45: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
             "Failed to request DTC region 0x%llx\n", base);
                                             ~~~^     ~~~~
                                             %x


vim +2149 drivers/perf/arm-cmn.c

  2131	
  2132	static int arm_cmn_init_dtc(struct arm_cmn *cmn, struct arm_cmn_node *dn, int idx)
  2133	{
  2134		struct arm_cmn_dtc *dtc = cmn->dtc + idx;
  2135		const struct resource *cfg;
  2136		resource_size_t base, size;
  2137	
  2138		dtc->pmu_base = dn->pmu_base;
  2139		dtc->base = dtc->pmu_base - arm_cmn_pmu_offset(cmn, dn);
  2140		dtc->irq = platform_get_irq(to_platform_device(cmn->dev), idx);
  2141		if (dtc->irq < 0)
  2142			return dtc->irq;
  2143	
  2144		cfg = platform_get_resource(to_platform_device(cmn->dev), IORESOURCE_MEM, 0);
  2145		base = dtc->base - cmn->base + cfg->start;
  2146		size = cmn->part == PART_CMN600 ? SZ_16K : SZ_64K;
  2147		if (!devm_request_mem_region(cmn->dev, base, size, dev_name(cmn->dev)))
  2148			return dev_err_probe(cmn->dev, -EBUSY,
> 2149					     "Failed to request DTC region 0x%llx\n", base);
  2150	
  2151		writel_relaxed(CMN_DT_DTC_CTL_DT_EN, dtc->base + CMN_DT_DTC_CTL);
  2152		writel_relaxed(CMN_DT_PMCR_PMU_EN | CMN_DT_PMCR_OVFL_INTR_EN, CMN_DT_PMCR(dtc));
  2153		writeq_relaxed(0, CMN_DT_PMCCNTR(dtc));
  2154		writel_relaxed(0x1ff, CMN_DT_PMOVSR_CLR(dtc));
  2155	
  2156		return 0;
  2157	}
  2158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
