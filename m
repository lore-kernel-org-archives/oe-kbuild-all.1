Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9CA361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 00:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696035504; x=1727571504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kqfnqdn2kVJ4yOZ2py/VNKXJbuSYbZH/kjL5Z5HE/xs=;
  b=QOiZ1T1Rr7rLtTDP17ZF7zhPPJJccyc1xjc6f3OMEz1vx1OwcylIVIYR
   cqTK2WmmVzT1LtIv8uCXD0qsX4LltnEhxHWYs3A258BEf+A3DF5OPHVhT
   k+XwfK9sjPcyCz5VWH7Dd6yO+YWyfS8PbB3HYLqvRMMhvvAAe9eQNEbQt
   zuNSzWmLZzY7JeqsJoAA8CS7AmvVo28wizN2gBRM+Dm7Cd6suj5l6nJnZ
   o7ghkKNO9keT3k26y3OFozQRguJh3TPxNjvGaIYvujCHPpoVTDuAniDIR
   +LKyCeh5mKf+MOqBRbhj/haw7Eef9VYIbg4Yn/4j7gFAh+B404MPEl73i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="448901183"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="448901183"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 17:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="893621669"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="893621669"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2023 17:57:07 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmOJH-0003VB-1k;
	Sat, 30 Sep 2023 00:58:19 +0000
Date: Sat, 30 Sep 2023 08:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 13/13] arch/x86/kernel/acpi/madt.o: warning:
 objtool: asm_acpi_mp_play_dead+0x21: indirect jump found in RETPOLINE build
Message-ID: <202309300827.x9KqSRBV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   34488d4fd2b299a51196e878575dd1e83cbbbc7f
commit: 34488d4fd2b299a51196e878575dd1e83cbbbc7f [13/13] x86/acpi: Add support for CPU offlining for ACPI MADT wakeup method
config: x86_64-buildonly-randconfig-006-20230930 (https://download.01.org/0day-ci/archive/20230930/202309300827.x9KqSRBV-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309300827.x9KqSRBV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300827.x9KqSRBV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/acpi/madt.o: warning: objtool: asm_acpi_mp_play_dead+0x21: indirect jump found in RETPOLINE build


objdump-func vmlinux.o asm_acpi_mp_play_dead:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
