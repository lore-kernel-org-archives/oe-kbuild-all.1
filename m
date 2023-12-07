Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBAF39FFB
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwRW4VCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701952492; x=1733488492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QTIpRDoNM7WI3ltgGX03/EutWE7qRKSVZUcH+7nick=;
  b=dwRW4VCdWDmAGlFfAiuhWdJ4Nr0tTmotUjV9L352ywcHmU+XshoL8XFY
   6PI8RSgyddrSp02XH60f9yFiqHMrid/4a1T20xE6htsaBOKPOb6FMz1Bp
   hAWKWCn15jHAqg2GeWEJxwBaue3Tt8UzxGaIbjxf6BL8nZCgAcBedDK4d
   mB0kD/EbzWYm8HPM6VUdwYom+8eFvoW5nVjYQZD9Jlzm8WEkq8romUS9m
   blJdJKhrg/Za3CMbTMq49mr8DcUOkWG0Pl+wwAnE7UasTitFp+0GdC30w
   A4L1WarDXKj6bv73bMFyCNeYhvCQSughJy5tDkqKDAFKTYMbFHqJlDHmH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1305864"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1305864"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721449025"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="721449025"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 07 Dec 2023 04:34:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBDaN-000CEc-1A;
	Thu, 07 Dec 2023 12:34:35 +0000
Date: Thu, 7 Dec 2023 20:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 5087/5882] drivers/perf/riscv_pmu_sbi.c:1008:35:
 error: initialization of 'int (*)(const struct ctl_table *, int,  void *,
 size_t *, loff_t *)' {aka 'int (*)(const struct ctl_table *, int,  void *,
 unsigned int *, long long int *)'} from incompatible pointer type 'i...
Message-ID: <202312072017.DQIMIMxq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e00ce02066e8f6f1ad5eab49a2ede7bf7a5ef64
commit: c8be9e66ca1eb71c694537e20d00533db48650a9 [5087/5882] sysctl: treewide: constify the ctl_table argument of handlers
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20231207/202312072017.DQIMIMxq-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072017.DQIMIMxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072017.DQIMIMxq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/perf/riscv_pmu_sbi.c:1008:35: error: initialization of 'int (*)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(const struct ctl_table *, int,  void *, unsigned int *, long long int *)'} from incompatible pointer type 'int (*)(struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, unsigned int *, long long int *)'} [-Werror=incompatible-pointer-types]
    1008 |                 .proc_handler   = riscv_pmu_proc_user_access_handler,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/riscv_pmu_sbi.c:1008:35: note: (near initialization for 'sbi_pmu_sysctl_table[0].proc_handler')
   cc1: some warnings being treated as errors


vim +1008 drivers/perf/riscv_pmu_sbi.c

cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1001  
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1002  static struct ctl_table sbi_pmu_sysctl_table[] = {
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1003  	{
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1004  		.procname       = "perf_user_access",
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1005  		.data		= &sysctl_perf_user_access,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1006  		.maxlen		= sizeof(unsigned int),
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1007  		.mode           = 0644,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02 @1008  		.proc_handler	= riscv_pmu_proc_user_access_handler,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1009  		.extra1		= SYSCTL_ZERO,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1010  		.extra2		= SYSCTL_TWO,
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1011  	},
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1012  	{ }
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1013  };
cc4c07c89aada1 Alexandre Ghiti 2023-08-02  1014  

:::::: The code at line 1008 was first introduced by commit
:::::: cc4c07c89aada16229084eeb93895c95b7eabaa3 drivers: perf: Implement perf event mmap support in the SBI backend

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
