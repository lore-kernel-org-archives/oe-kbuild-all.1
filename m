Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E818C27
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687257134; x=1718793134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6jMFvVOyfX3NJ3wo7HZuPg+b4k2FZ0x/7odsapZJsbc=;
  b=J+7GV1d34naBLa4EVxxv/tu/HjF+Rp8soru9HibLVFGj8BQdAar21u8I
   7ihdWartiikTX6pFNcnE9RzxtRw0+jb7uipvoQzn16z8Lu2cirvVl1cqv
   J5Q8+K3kBwIH2hRXz1B8oPg85HI9FQCun8Y6TCZL/cVqbXhYjGWY4Mbfa
   J+kiCj95dj6i4PUzM+YLEmYtXponeWaQXUzKwPcO8Kk61OUX+sOsMkOiT
   LhBg7lPjp2RJh9ZDjFX+PG/6BjwUQJUkZuma9aG1CON0coAbH9mlYmvo6
   RamlqBDR/2quXdWw2/R4Opvf9sb9sLNxaqK/Ev/0AZiPz/bqpqKCLZ63S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="363246056"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="363246056"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 03:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="691378405"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="691378405"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jun 2023 03:32:11 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBYeh-0005oK-0a;
	Tue, 20 Jun 2023 10:32:11 +0000
Date: Tue, 20 Jun 2023 18:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <atishp@rivosinc.com>
Subject: [avpatel:riscv_timer_imp_v1 11/51]
 arch/riscv/kvm/aia_device.c:105:4-5: Unneeded semicolon
Message-ID: <202306201818.CMIALUfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_timer_imp_v1
head:   a1052b9c33cad3633fbd2de9cc46e174feaa9716
commit: 46df28076abd80c8be71820956cbb7f51ce5ea6c [11/51] RISC-V: KVM: Implement device interface for AIA irqchip
config: riscv-randconfig-c032-20230620 (https://download.01.org/0day-ci/archive/20230620/202306201818.CMIALUfn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201818.CMIALUfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201818.CMIALUfn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/aia_device.c:105:4-5: Unneeded semicolon
   arch/riscv/kvm/aia_device.c:166:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
