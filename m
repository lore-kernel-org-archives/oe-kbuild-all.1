Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE44400
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 08:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687250347; x=1718786347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lENMy1RZSrEswlm4nUDLq3ESpoLl2Gp7dSnR3viJRxk=;
  b=eBpToGHZuVsC+ycdPKSygeBH6LZ+pv9CdcLdRhKzazGv5DrAnIjpR65r
   flJj5rBYcp6yJUzxVg9FRYtPIxqsxSjuGDMx/yOqVOyxlXHcsga2v3DS3
   FbzSt48oT9RSTzhaBUpGE6yyHdJBwR8vr7gbB+QEUshuyDjKF4+9BNg2A
   FotZXDYD32XWvJQga6Cv2xXv2tcCqtnuI3eFn3pX9tlbz0wGtyvJuoPqq
   Zu5A81l3psLHjNQorfFbrCPmND1LHwP4otmQGRLv6JPqnp8qmD2fi2LUl
   k7yZpvoQQwS7hudMlZUZozOU4YnFd1HAW/e2/SyZsBQbYdX7N+rK2bSfb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="358673714"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="358673714"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 01:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="717155359"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="717155359"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jun 2023 01:39:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBWtF-0005iW-01;
	Tue, 20 Jun 2023 08:39:05 +0000
Date: Tue, 20 Jun 2023 16:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <atishp@rivosinc.com>
Subject: [avpatel:riscv_timer_imp_v1 11/51]
 arch/riscv/kvm/aia_device.c:105:4-5: Unneeded semicolon
Message-ID: <202306201657.oHoFqOD2-lkp@intel.com>
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
config: riscv-randconfig-c032-20230620 (https://download.01.org/0day-ci/archive/20230620/202306201657.oHoFqOD2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201657.oHoFqOD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201657.oHoFqOD2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/riscv/kvm/aia_device.c:105:4-5: Unneeded semicolon
   arch/riscv/kvm/aia_device.c:166:2-3: Unneeded semicolon

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
