Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE1D523
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692970210; x=1724506210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zOzsJ3Nw7dE8fGBwQ3V7H19qoNkqLa/r7nxQvMyb04g=;
  b=e9lhQp4uMz5bt8+ClOEaFU4L2S5oJBUQgp5AfYaCBPgCIFwrdHE8q3Ak
   Igz8Nl5O146I2tWodcLEYW+BFTxwqYtPID3Rz7XknWWBRa7jEz15NhsHp
   dYyec+NrqeOT0y+b+aa6oRMg3DyWbwJCOvu6wiufxyTi8tr4d7+tBG8BS
   aGQXmIaCAUx13mFMWmjT0KTqRGOHtpXDTFjdWSCnioK/EaWLHo7OmPVVA
   Tl2PmH3M+HeVx4B5ocs2NtOiHvZBbKRaRvcz7uWLUinH8N69hcJz2HpjV
   lqW9SuoSMCCFmAzebwzSdk9PJtyXKCeQmtdbceMPT8ggUYr0Y7nTnYXCn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359711305"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359711305"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 06:29:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="766955946"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766955946"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 06:29:53 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZWsh-0003cF-0f;
	Fri, 25 Aug 2023 13:29:52 +0000
Date: Fri, 25 Aug 2023 21:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 72/150] drivers/acpi/pptt.c:428:
 warning: Function parameter or member 'acpi_cpu_id' not described in
 'acpi_pptt_get_cpus_from_container'
Message-ID: <202308252135.PXpFOv7O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   b35e256b516ef563cb57da2628dc19bcd600e35f
commit: 1cf059cb0c7b52697e7d7c0ca047843f2cff2809 [72/150] ACPI / PPTT: Add a helper to fill a cpumask from a processor container
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230825/202308252135.PXpFOv7O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252135.PXpFOv7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252135.PXpFOv7O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/pptt.c:339: warning: Function parameter or member 'callback' not described in 'acpi_pptt_for_each_container'
   drivers/acpi/pptt.c:339: warning: Function parameter or member 'arg' not described in 'acpi_pptt_for_each_container'
>> drivers/acpi/pptt.c:428: warning: Function parameter or member 'acpi_cpu_id' not described in 'acpi_pptt_get_cpus_from_container'
>> drivers/acpi/pptt.c:428: warning: Function parameter or member 'cpus' not described in 'acpi_pptt_get_cpus_from_container'


vim +428 drivers/acpi/pptt.c

   417	
   418	/**
   419	 * acpi_pptt_get_cpus_from_container() - Populate a cpumask with all CPUs in a
   420	 * 					 processor containers
   421	 *
   422	 * Find the specified Processor Container, and fill cpus with all the cpus
   423	 * below it.
   424	 *
   425	 * Return: 0 for a complete walk, or an error if the mask is incomplete.
   426	 */
   427	int acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus)
 > 428	{
   429		struct __cpus_from_container_arg params;
   430	
   431		params.acpi_cpu_id = acpi_cpu_id;
   432		params.cpus = cpus;
   433	
   434		cpumask_clear(cpus);
   435		return acpi_pptt_for_each_container(&__cpus_from_container, &params);
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
