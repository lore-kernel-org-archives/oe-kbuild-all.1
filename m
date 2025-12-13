Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA471C84D7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765630245; cv=none; b=d+Rrun7/Q22H6xRf74CpoB0WvTP5604RkJPk3Ve8OMHZxqbn1vvDLxUGKqdHXfRRVFwxTHoWzslhyahH9P58YNlEIfCIAadxCveY1CbWL3uAsLW5dQ65lsBcQqLMZY/bzGOFx4vazw55gzi4XS7mypNpC/VjF1okXRYyM17o0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765630245; c=relaxed/simple;
	bh=U7V3u9lQ4trGsJn4tnN7GS0kS955Cdxv0seDWhENkN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OuB9LwZNo3W8lVlmF6SZ7PlPz8XdeFWhsff2caDYoiyk+KYNRJ+qpWwmOBIaAlLrOQXwQ5w3rfo8fCdeS6KR97P4W8sGWS5JNUOrp0CEZ22sbN6PBamHqHjAH4Y5crM6qQzAyLEylCtOuRwad0ohK2XDau9TYE+Ywa9ina+DJwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQibLutb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQibLutb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765630242; x=1797166242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U7V3u9lQ4trGsJn4tnN7GS0kS955Cdxv0seDWhENkN8=;
  b=gQibLutbTkEcNbWMoVE9v16eo23EZ/Zi60EA5w0O+S7rkFvHgSc5VlSO
   IwwCUpti6x2NvikygEx2C44q681FlBYLGB+aw9xq2joqQMaBBCdcJrSKB
   Fhc1IkNe+7hhPuqyebUzacb9NF2stQwZG4gY/VGRZXuAvRsaNzYoXqIcg
   nkX+i9HNE68AGoiT09jDGWk98VVNAs2zG4JpU9IXKQfkHZDQ37BB37UBJ
   Bg92wMdyBMArOa3YZXEdHw1jniUfm+93Si6JWRzEewHm0oEWOOkvvywv+
   JXPJg6nJMn858TWYhM2UDw8IhXRUfp2SwA69NZEI8PzlUywvaORp3Qv62
   A==;
X-CSE-ConnectionGUID: igWUahEzSlC/sH24hjYScw==
X-CSE-MsgGUID: 5NS9clCFS063jSJzHROhJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="85018291"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85018291"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 04:50:42 -0800
X-CSE-ConnectionGUID: 2E5GKDKvSYKNKhb7Q+BDow==
X-CSE-MsgGUID: nVumxi4zSZSldThJeC4ZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196592918"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 04:50:41 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUP54-000000007e2-2Acz;
	Sat, 13 Dec 2025 12:50:38 +0000
Date: Sat, 13 Dec 2025 20:50:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liao Chen <liaochen4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/cpufreq/brcmstb-avs-cpufreq.c:458:9: warning: ISO C90 forbids mixed
 declarations and code
Message-ID: <202512132042.PgSubudu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 5bfdf47235f04f1d6e51aa8381e804c3160d834b [1942/1942] cpufreq: brcmstb-avs-cpufreq: add check for cpufreq_cpu_get's return value
config: arm64-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132042.PgSubudu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132042.PgSubudu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132042.PgSubudu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/brcmstb-avs-cpufreq.c: In function 'brcm_avs_cpufreq_get':
>> drivers/cpufreq/brcmstb-avs-cpufreq.c:458:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     458 |         struct private_data *priv = policy->driver_data;
         |         ^~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +458 drivers/cpufreq/brcmstb-avs-cpufreq.c

de322e085995b9 Markus Mayer     2016-10-27  452  
de322e085995b9 Markus Mayer     2016-10-27  453  static unsigned int brcm_avs_cpufreq_get(unsigned int cpu)
de322e085995b9 Markus Mayer     2016-10-27  454  {
de322e085995b9 Markus Mayer     2016-10-27  455  	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
5bfdf47235f04f Anastasia Belova 2024-05-07  456  	if (!policy)
5bfdf47235f04f Anastasia Belova 2024-05-07  457  		return 0;
de322e085995b9 Markus Mayer     2016-10-27 @458  	struct private_data *priv = policy->driver_data;
de322e085995b9 Markus Mayer     2016-10-27  459  
de322e085995b9 Markus Mayer     2016-10-27  460  	return brcm_avs_get_frequency(priv->base);
de322e085995b9 Markus Mayer     2016-10-27  461  }
de322e085995b9 Markus Mayer     2016-10-27  462  

:::::: The code at line 458 was first introduced by commit
:::::: de322e085995b9417582d6f72229dadb5c09d163 cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq driver for Broadcom STB SoCs

:::::: TO: Markus Mayer <mmayer@broadcom.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
