Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051EA179
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 00:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692835952; x=1724371952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Whl24LmlNtfcD7cpQRJIuPKnEWMtCKj9/tgNP57eA08=;
  b=WCDsPnSwExB5lAkvqkJamYhciRk+TYfDhARJWUZGEazcvwaYaY0/Xiwk
   HcC374BKPMX7G9XwsUAew9yp57Vun5Arb1qifTFcurmAp1TWxLDG5zwhc
   lDQm07W1x+ElRjXUmu0DwDedzz9AIrtOBNkzRbwt4CPNOKdZhVvG2KO/k
   KE3hXHan5HouRKuvDnmIcs55AmdJ+kq1cEOgvt7YKKta6JILMm7ivOwII
   6R7V7ioYHu8GYAQsDGhEXa2098NWtbCzw1k5LIXTtiuEZmsEc5+Nbfe5F
   jLoY7VGddtOGRWPXw9K1jS/4qcZYZhWuxVZMEblQYHa1hZKmXHF22jJ/g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353853386"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="353853386"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 17:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="826915013"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="826915013"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2023 17:12:31 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYxxe-0001bx-0u;
	Thu, 24 Aug 2023 00:12:30 +0000
Date: Thu, 24 Aug 2023 08:11:30 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 11762/12208] drivers/perf/arm_pmuv3.c:776:
 undefined reference to `kvm_vcpu_pmu_resync_el0'
Message-ID: <202308240834.9JkuU1vW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3f80d3eae76c3557b3c9b5938ad01c0e6cf25ec
commit: b1f778a223a2a8ad6262e5233cfc3483bcf6e213 [11762/12208] KVM: arm64: pmu: Resync EL0 state on counter rotation
config: arm64-randconfig-r011-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240834.9JkuU1vW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240834.9JkuU1vW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240834.9JkuU1vW-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/perf/arm_pmuv3.o: in function `armv8pmu_start':
>> drivers/perf/arm_pmuv3.c:776: undefined reference to `kvm_vcpu_pmu_resync_el0'


vim +776 drivers/perf/arm_pmuv3.c

   758	
   759	static void armv8pmu_start(struct arm_pmu *cpu_pmu)
   760	{
   761		struct perf_event_context *ctx;
   762		int nr_user = 0;
   763	
   764		ctx = perf_cpu_task_ctx();
   765		if (ctx)
   766			nr_user = ctx->nr_user;
   767	
   768		if (sysctl_perf_user_access && nr_user)
   769			armv8pmu_enable_user_access(cpu_pmu);
   770		else
   771			armv8pmu_disable_user_access();
   772	
   773		/* Enable all counters */
   774		armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
   775	
 > 776		kvm_vcpu_pmu_resync_el0();
   777	}
   778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
