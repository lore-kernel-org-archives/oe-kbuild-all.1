Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8671215BF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709469111; cv=none; b=bW3XeMlOqLXHYs5VDbCQO4I0BPe6RFk1C09qe0yBNq5gJ5nL5IBdhFYhGDqSUAmqgDMX7iTlTsM5JqPN7FhT9Sqt4FQtdGerTixvqsv21FA8axSlpx1d9EfMr0KkLiVLY3dUkoEcQH4gd0ODiSjgzOIUbxnEaDMfofhZh1XX9GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709469111; c=relaxed/simple;
	bh=xzgRoBa6ww2ac57CbvcYW3Xop6CcL2OuufPMm4b3JOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gS3CYMbWQ9YWvxhAmi3DEzcjp4CnjW/91X/i+JX7QNPSy7hYC58HaedpIldIiFMOaIYjRIXY2ZXcfTnBooDPyz1VgxripyReGw8jhqbJKoZrv7VqFhVGQGC8JafeVSEWh/YFWMMgBjAmiCer1+HyMM/qEnEPW8uqcKSEJniovSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcJXAa1w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcJXAa1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709469109; x=1741005109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xzgRoBa6ww2ac57CbvcYW3Xop6CcL2OuufPMm4b3JOw=;
  b=VcJXAa1wyjrU5Eb1fmr3Cmb/HE3JEdHTqVrw1HCMXfRrIercJ/viJ1ap
   XdAHUi9m0VNLE3ke1p2md78xTcEZ2tfRcc4+DVvSvwivBjmve0N9Q6/ZK
   cPetHHHFBBFwKZLFOoUGggOwprx7pOBoGZAfwcWljlrbmncVBkyxIqiW0
   L3BVnDrzK5gRuI2MMbsbHjV+Dv4IdVXDcpQlXJXWUrspSpOSprpKqDLVa
   b3r/HCyQzXDfx/hOFTU7Q1vgVEks/2pa22GyH8ttOJIddOg0GhmxsRc45
   mB4c4MlN1yoBVz/g1mmysIdUMX0y+2kBllER6aDLsWB9KlKZRt9SQyMhG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4543401"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4543401"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 04:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="46217785"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Mar 2024 04:31:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgl0L-0001lE-0N;
	Sun, 03 Mar 2024 12:31:45 +0000
Date: Sun, 3 Mar 2024 20:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1624/3769] loongson3-acpi-cpufreq.c:undefined
 reference to `acpi_processor_unregister_performance'
Message-ID: <202403032032.n9rHviOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbcd4a3032a53350f6d182c9daeaa4c46e65d964
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1624/3769] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240303/202403032032.n9rHviOs-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032032.n9rHviOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032032.n9rHviOs-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `loongson3_cpufreq_cpu_exit':
>> loongson3-acpi-cpufreq.c:(.text+0x668): undefined reference to `acpi_processor_unregister_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L342':
>> loongson3-acpi-cpufreq.c:(.text+0x255c): undefined reference to `acpi_processor_register_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L359':
   loongson3-acpi-cpufreq.c:(.text+0x2e80): undefined reference to `acpi_processor_unregister_performance'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
