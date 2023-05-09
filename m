Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7C3160
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 00:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683590751; x=1715126751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYAeguA+h1GqOvqwhDbZVBFx+UenLox2CekqytG99p8=;
  b=ZfHheLDs2DGdFCBebluVbz0CXaMVunJkirlRE2KWxITPtGCKnDq0j5Tf
   ICZHGEeTbp6QaP0Br2WCiHV9bBQ53Zf1NMVhyCJVOCPt5SkvvxYpmBmMa
   o5ygmK7OedICkFyxp9K0qlbE7r5h9wwj/L53bvxpDF6Np0TJOmdiDP+Hb
   3RZMrf4cDlt0/v5cKIkLc3zHZdX/jdL6m0O7V34NVdKDgzNGZm5CwczN3
   GbeMXYddCz9jLeW78I/UFAy1HE59wxwBbQS5Pnou5o2JhahbLD+D3vatI
   1qO+Gl8FYJqoN42HIAehyosrc3c5oLni28naOpke8QChSQp9WaLNgjFVC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330137895"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="330137895"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 17:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698691917"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="698691917"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 May 2023 17:05:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwArR-0001TB-1K;
	Tue, 09 May 2023 00:05:45 +0000
Date: Tue, 9 May 2023 08:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>
Subject: [atishp04:kvm_perf_snapshot_rfc 3/7]
 drivers/perf/riscv_pmu_sbi.c:470:17: warning: this 'if' clause does not
 guard...
Message-ID: <202305090836.Y1opUCBj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux kvm_perf_snapshot_rfc
head:   5ae7188de04f861c3f4026005a0ace2cf2575bde
commit: 49f64ef2ce6b12fd54fc64df1ec2a0d28663b6cb [3/7] drivers/pmu: sbi: Read upper bits of a firmware counter
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230509/202305090836.Y1opUCBj-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/49f64ef2ce6b12fd54fc64df1ec2a0d28663b6cb
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 kvm_perf_snapshot_rfc
        git checkout 49f64ef2ce6b12fd54fc64df1ec2a0d28663b6cb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/ drivers/perf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090836.Y1opUCBj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/perf/riscv_pmu_sbi.c: In function 'pmu_sbi_ctr_read':
>> drivers/perf/riscv_pmu_sbi.c:470:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     470 |                 if (sbi_v2_available && info.width >= 32)
         |                 ^~
   drivers/perf/riscv_pmu_sbi.c:473:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     473 |                         if (!ret.error)
         |                         ^~
>> drivers/perf/riscv_pmu_sbi.c:474:56: warning: left shift count >= width of type [-Wshift-count-overflow]
     474 |                                 val = val | (ret.value << 32);
         |                                                        ^~


vim +/if +470 drivers/perf/riscv_pmu_sbi.c

   455	
   456	static u64 pmu_sbi_ctr_read(struct perf_event *event)
   457	{
   458		struct hw_perf_event *hwc = &event->hw;
   459		int idx = hwc->idx;
   460		struct sbiret ret;
   461		u64 val = 0;
   462		union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
   463	
   464		if (pmu_sbi_is_fw_event(event)) {
   465			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
   466					hwc->idx, 0, 0, 0, 0, 0);
   467			if (!ret.error)
   468				val = ret.value;
   469	#if defined(CONFIG_32BIT)
 > 470			if (sbi_v2_available && info.width >= 32)
   471				ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
   472						hwc->idx, 0, 0, 0, 0, 0);
   473				if (!ret.error)
 > 474					val = val | (ret.value << 32);
   475	#endif
   476		} else {
   477			val = riscv_pmu_ctr_read_csr(info.csr);
   478			if (IS_ENABLED(CONFIG_32BIT))
   479				val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
   480		}
   481	
   482		return val;
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
