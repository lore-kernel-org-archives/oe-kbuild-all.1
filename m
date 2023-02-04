Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DC31859
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 03:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675482512; x=1707018512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o2EV8TTmEOhXBXlw9hXJnrCrhOjNqDr5zPWPFhgrDUA=;
  b=mesTVbE1LiTAfHFnPFnhxxl4zEukdmv4L4DtsRgVEKQ05HzWfbTFnn/o
   rx9TCLOxezWlU+u0Sbhk5L1i3eodZfBZsgFoxu/8tqBO/UZOKcYxolPKE
   PuM2URO13cO4Su0fTAXslJcj2+79D3882xdnWVkZztbm5IK1DEqHJrNGA
   mcuoii/K29OEhkqFfAhSccFrhreewXauRFevbTSORgEnp1FBciIK22V6O
   Uobj6zpmlkPxAF4awhCBN3gf15rtOEUlhMp8vW6azlUp/TvT9tjPRdhLe
   Js1HkyZRLRpjEYP2dHm8pxejlhdbK1lnChXP9qvImd7LBTuwbYefEJ6QY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330204662"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="330204662"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 19:48:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="734570734"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="734570734"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2023 19:48:30 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO9XR-00010n-2V;
	Sat, 04 Feb 2023 03:48:29 +0000
Date: Sat, 4 Feb 2023 11:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_nested_v1 36/76] arch/riscv/kernel/cpu.c:261:6:
 warning: no previous prototype for 'acpi_print_hart_info'
Message-ID: <202302041120.3uOASnQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_nested_v1
head:   27e6109638389f74b42fe02858caa9c7a381cbbe
commit: f10d91c4595417710a1be739d697cce32feb9bb0 [36/76] RISC-V: ACPI: cpu: Enable cpuinfo for ACPI systems
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041120.3uOASnQ2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/f10d91c4595417710a1be739d697cce32feb9bb0
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_sbi_nested_v1
        git checkout f10d91c4595417710a1be739d697cce32feb9bb0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpu.c:261:6: warning: no previous prototype for 'acpi_print_hart_info' [-Wmissing-prototypes]
     261 | void acpi_print_hart_info(struct seq_file *m,
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/acpi_print_hart_info +261 arch/riscv/kernel/cpu.c

   259	
   260	#ifdef CONFIG_ACPI
 > 261	void acpi_print_hart_info(struct seq_file *m,
   262				  unsigned long cpu)
   263	{
   264		const char *isa;
   265	
   266		if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
   267			print_isa(m, isa);
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
