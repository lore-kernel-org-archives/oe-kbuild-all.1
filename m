Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2825101FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 12:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687264034; x=1718800034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66B5ZtdsHsMu/mFwUX4nZugIflgi1AkWBls8wGxnj1Y=;
  b=bMCLwmylAhzSFdr58Xpqe4vk8uOuUExIB8LmKPdSUUYEV9U+pMb153+s
   0DY+DtVX1jHdm15eAgKK+xeygpruHw9SmPVGEeypggYp640No3IM0iXd9
   evnDSYdtjvav4jmxgyYuEiBWWtjb/w8XMYURPyIr0at4ueE/00uDyA+u+
   ZU8KFdax+otxd7GWZwa+OHfgYrZHPdm06euGl3qQMGyXmP8R1N5cdLzIe
   r8u9iRd26MPtPuFdQA2xXvzoe82774RbIftblQA0S2QQn7phcy714CSzH
   zEKfDQDCW+8hL0vYTFQDmtkPY2j0HFK+MpZYtiyajWXKdhtxY3MeZWeC2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="357333790"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="357333790"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 05:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="1044248690"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="1044248690"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jun 2023 05:27:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBaRz-0005s8-0Z;
	Tue, 20 Jun 2023 12:27:11 +0000
Date: Tue, 20 Jun 2023 20:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <atishp@rivosinc.com>
Subject: [avpatel:riscv_kvm_svnapot_v2 14/17]
 arch/riscv/kvm/aia_imsic.c:94:2-3: Unneeded semicolon
Message-ID: <202306202058.dhMe4VXy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_kvm_svnapot_v2
head:   8e4bdcb649c8a3474f88f3f721ad2c5999268e39
commit: 92dcc7250b5ecbf6d5c04dc20c7ecddbbf5e0c10 [14/17] RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC
config: riscv-randconfig-c032-20230620 (https://download.01.org/0day-ci/archive/20230620/202306202058.dhMe4VXy-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202058.dhMe4VXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202058.dhMe4VXy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/aia_imsic.c:94:2-3: Unneeded semicolon
   arch/riscv/kvm/aia_imsic.c:210:2-3: Unneeded semicolon
   arch/riscv/kvm/aia_imsic.c:134:2-3: Unneeded semicolon
   arch/riscv/kvm/aia_imsic.c:173:2-3: Unneeded semicolon
   arch/riscv/kvm/aia_imsic.c:327:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
