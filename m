Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D047F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692711129; x=1724247129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XuXxENsJZghyriz/Qw6tu1RCOR7XBmT9iovBEg4dnSo=;
  b=kLcKoU/C12vVz3tvw+B01MftloXRxbWoK2PCNnlJanKrVuXUUWMEKWnQ
   sEx/AVOUG5wTMjJ+SO2ngeB8C++KXaZIcJ6H5ZK9BAO+5yeZ9gCmAl486
   Q4giivUc2Cz1GQaKbzy3AH86tvRy1VfDnQG3NibczlLERdcwOSK79RozT
   mwrvSiDb0nFQRBCtv6KpA6ZT1uuc9BWiQnAPGgt5nGdqpC4kUOmFxFv5o
   1j9WN6t4z/W+90RNWsO2mY8mA0hvzuv7GQ+i2jxaRWtAzcFiEg1Fhevrx
   M/Fd55kNH3/WPCG5nljc24F1cXv7VUI5bSI67ltIRcHa/rgEUiAP/4kFs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404881599"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="404881599"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 06:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982870397"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="982870397"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 06:31:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYRUD-0000DI-1i;
	Tue, 22 Aug 2023 13:31:57 +0000
Date: Tue, 22 Aug 2023 21:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 05/13] perf/core: Add *group_leader for
 perf_event_create_group_kernel_counters()
Message-ID: <202308222100.sfgIoBqK-lkp@intel.com>
References: <20230822051140.512879-6-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822051140.512879-6-dapeng1.mi@linux.intel.com>

Hi Dapeng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fff2e47e6c3b8050ca26656693caa857e3a8b740]

url:    https://github.com/intel-lab-lkp/linux/commits/Dapeng-Mi/KVM-x86-pmu-Add-Intel-CPUID-hinted-TopDown-slots-event/20230822-130925
base:   fff2e47e6c3b8050ca26656693caa857e3a8b740
patch link:    https://lore.kernel.org/r/20230822051140.512879-6-dapeng1.mi%40linux.intel.com
patch subject: [PATCH RFC v3 05/13] perf/core: Add *group_leader for perf_event_create_group_kernel_counters()
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230822/202308222100.sfgIoBqK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222100.sfgIoBqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222100.sfgIoBqK-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kvm/vcpu_pmu.c: In function 'kvm_pmu_create_perf_event':
>> arch/riscv/kvm/vcpu_pmu.c:250:75: error: passing argument 5 of 'perf_event_create_kernel_counter' from incompatible pointer type [-Werror=incompatible-pointer-types]
     250 |         event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
         |                                                                           ^~~
         |                                                                           |
         |                                                                           struct kvm_pmc *
   In file included from include/linux/perf/riscv_pmu.h:12,
                    from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:23,
                    from include/linux/kvm_host.h:45,
                    from arch/riscv/kvm/vcpu_pmu.c:12:
   include/linux/perf_event.h:1106:57: note: expected 'perf_overflow_handler_t' {aka 'void (*)(struct perf_event *, struct perf_sample_data *, struct pt_regs *)'} but argument is of type 'struct kvm_pmc *'
    1106 |                                 perf_overflow_handler_t callback,
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> arch/riscv/kvm/vcpu_pmu.c:250:17: error: too few arguments to function 'perf_event_create_kernel_counter'
     250 |         event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf_event.h:1102:1: note: declared here
    1102 | perf_event_create_kernel_counter(struct perf_event_attr *attr,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/perf_event_create_kernel_counter +250 arch/riscv/kvm/vcpu_pmu.c

0cb74b65d2e5e6 Atish Patra 2023-02-07  231  
badc386869e2cb Atish Patra 2023-02-07  232  static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
badc386869e2cb Atish Patra 2023-02-07  233  				     unsigned long flags, unsigned long eidx, unsigned long evtdata)
badc386869e2cb Atish Patra 2023-02-07  234  {
badc386869e2cb Atish Patra 2023-02-07  235  	struct perf_event *event;
badc386869e2cb Atish Patra 2023-02-07  236  
badc386869e2cb Atish Patra 2023-02-07  237  	kvm_pmu_release_perf_event(pmc);
badc386869e2cb Atish Patra 2023-02-07  238  	attr->config = kvm_pmu_get_perf_event_config(eidx, evtdata);
badc386869e2cb Atish Patra 2023-02-07  239  	if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
badc386869e2cb Atish Patra 2023-02-07  240  		//TODO: Do we really want to clear the value in hardware counter
badc386869e2cb Atish Patra 2023-02-07  241  		pmc->counter_val = 0;
badc386869e2cb Atish Patra 2023-02-07  242  	}
badc386869e2cb Atish Patra 2023-02-07  243  
badc386869e2cb Atish Patra 2023-02-07  244  	/*
badc386869e2cb Atish Patra 2023-02-07  245  	 * Set the default sample_period for now. The guest specified value
badc386869e2cb Atish Patra 2023-02-07  246  	 * will be updated in the start call.
badc386869e2cb Atish Patra 2023-02-07  247  	 */
badc386869e2cb Atish Patra 2023-02-07  248  	attr->sample_period = kvm_pmu_get_sample_period(pmc);
badc386869e2cb Atish Patra 2023-02-07  249  
badc386869e2cb Atish Patra 2023-02-07 @250  	event = perf_event_create_kernel_counter(attr, -1, current, NULL, pmc);
badc386869e2cb Atish Patra 2023-02-07  251  	if (IS_ERR(event)) {
badc386869e2cb Atish Patra 2023-02-07  252  		pr_err("kvm pmu event creation failed for eidx %lx: %ld\n", eidx, PTR_ERR(event));
badc386869e2cb Atish Patra 2023-02-07  253  		return PTR_ERR(event);
badc386869e2cb Atish Patra 2023-02-07  254  	}
badc386869e2cb Atish Patra 2023-02-07  255  
badc386869e2cb Atish Patra 2023-02-07  256  	pmc->perf_event = event;
badc386869e2cb Atish Patra 2023-02-07  257  	if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
badc386869e2cb Atish Patra 2023-02-07  258  		perf_event_enable(pmc->perf_event);
badc386869e2cb Atish Patra 2023-02-07  259  
badc386869e2cb Atish Patra 2023-02-07  260  	return 0;
badc386869e2cb Atish Patra 2023-02-07  261  }
badc386869e2cb Atish Patra 2023-02-07  262  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
