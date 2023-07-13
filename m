Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000B53A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 05:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689226299; x=1720762299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKnXjoglW7hYmiZSSb1wswkc9hJErdcDIN1siHXYdqw=;
  b=ZPqbUcqU1TVSP1qT2zjKfIQsVruOhT//RA+PXbgdXzEemJ1v1B3uOyxp
   5ikI1m15cVu2yhK33nCRQjy2cmh6g3FOYpXyc+lns9fWQ2oh4dShv3Ysq
   sEhtEACGetwyF+YBn943lwSaGrb1esr9FPYoxfV/zh17ZqsnLZ/SuPn7b
   bEn9wkEZeFiH2QvQvLM925clOHoIbB16k753EnDBuqktsBn3LoMEwk5lY
   mg2dlahLBIzfsbsEqxdjwOaFBvNK60IX2qtQZl66avQ/2dYlab+MGPZ0/
   hK51nenPxAobehqEolV44W72ERHDsEdC7Cn9/5/3L/xnboeQpcz0iOrqp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="365119701"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="365119701"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 22:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="699118877"
X-IronPort-AV: E=Sophos;i="6.01,201,1684825200"; 
   d="scan'208";a="699118877"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jul 2023 22:31:36 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJovQ-0006GF-0e;
	Thu, 13 Jul 2023 05:31:36 +0000
Date: Thu, 13 Jul 2023 13:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_kvm_onereg_imp_v1 31/37]
 arch/riscv/kvm/vcpu_onereg.c:64:24: error: implicit declaration of function
 'riscv_v_vstate_ctrl_user_allowed'
Message-ID: <202307131344.6WS6qcej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_kvm_onereg_imp_v1
head:   5248cca9bf7fdb826293e90cbf7cf2995458b645
commit: 9b47b09df905b9489514edb9f8679aa5f733634d [31/37] RISC-V: KVM: Factor-out ONE_REG related code to its own source file
config: riscv-randconfig-r062-20230710 (https://download.01.org/0day-ci/archive/20230713/202307131344.6WS6qcej-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131344.6WS6qcej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307131344.6WS6qcej-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kvm/vcpu_onereg.c: In function 'kvm_riscv_vcpu_isa_enable_allowed':
>> arch/riscv/kvm/vcpu_onereg.c:64:24: error: implicit declaration of function 'riscv_v_vstate_ctrl_user_allowed' [-Werror=implicit-function-declaration]
      64 |                 return riscv_v_vstate_ctrl_user_allowed();
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/riscv_v_vstate_ctrl_user_allowed +64 arch/riscv/kvm/vcpu_onereg.c

    57	
    58	static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
    59	{
    60		switch (ext) {
    61		case KVM_RISCV_ISA_EXT_H:
    62			return false;
    63		case KVM_RISCV_ISA_EXT_V:
  > 64			return riscv_v_vstate_ctrl_user_allowed();
    65		default:
    66			break;
    67		}
    68	
    69		return true;
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
