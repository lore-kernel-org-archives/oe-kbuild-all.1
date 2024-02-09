Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14915A787
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707505422; cv=none; b=a73XBs2QMy35BIEH3Ez0+L+4bp4ePeKmzcnoaAmrPwyrYPUP/BPBzFafOFi+4fEj2IYzbaRvq41YWlE4H6nH2bMCzdC6HF0B5oEL0SyWjFZeLeNVp+CzewHyWbicm0uqAwmZojruOc/fd7KRZLcxzsKGTEHA4BccRdpoQa17kpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707505422; c=relaxed/simple;
	bh=AsYFnJNT6mRmmh3SC3P4yAPGnF0wyg+oXZjKaaTRM0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VrVEGRF1M6n03nXABoe7Kkao/lNGfLZtyQihHrAdDD/TqaPAsvC7VdK5WH0d0ByPHQ6J97E0q7z5HgBWDxbz/TRFN32HP3ekTix3BUDs+KUqsfV9p9BCwnd699pcMHLgS2oLtHo0s7ev9CgcjmVSOt1sc/HBl9Dr+DnpSASBZKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVKCDPU2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVKCDPU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707505420; x=1739041420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsYFnJNT6mRmmh3SC3P4yAPGnF0wyg+oXZjKaaTRM0k=;
  b=CVKCDPU2rGO3WUpje/SmE9Ko2ZvdAYiHgXWtCAt65nqola6PR4h68xlN
   iRkZHezmcDS07dtM9W6A4pJ+RaOST4eShgoKMp32K9TCWLnUEd3v8i26w
   dkkUlCU6ife0F1oYb1PM3kRCig/O4B1e+kquyNUIJD8ybrDazyyNgdXVU
   x/4ZU5QomZ+BSUT31WboCiWok17u7g8AgLMl9DJs/KcN/GvYON6jVxH2f
   SFxQPLQ9x5jGI/7PMYtvKkpa8zJ3bpS7uNx+BLw4Lc/GjQ61TscTHf5CZ
   n1fHkXm3QsF37AApludxoKr1IZJlsPEHeEX4v15noyzw+bhjs7DCCf3B+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1392058"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1392058"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 11:03:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6661348"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2024 11:03:37 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYW9w-00052M-0H;
	Fri, 09 Feb 2024 19:03:36 +0000
Date: Sat, 10 Feb 2024 03:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [cip:linux-5.10.y-cip 42/56] drivers/cache/ax45mp_cache.c:70:17:
 error: implicit declaration of function 'csr_write'; did you mean
 'vfs_write'?
Message-ID: <202402100204.VbmPzT5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip
head:   a624abaa85d7f3ff289eb2e257db5c4485d11d18
commit: 1f507f18150b3f6ae54a27ba2f88bd0cc6afd8e6 [42/56] cache: Add L2 cache management for Andes AX45MP RISC-V core
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240210/202402100204.VbmPzT5w-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100204.VbmPzT5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100204.VbmPzT5w-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cache/ax45mp_cache.c: In function 'ax45mp_cpu_cache_operation':
>> drivers/cache/ax45mp_cache.c:70:17: error: implicit declaration of function 'csr_write'; did you mean 'vfs_write'? [-Werror=implicit-function-declaration]
      70 |                 csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
         |                 ^~~~~~~~~
         |                 vfs_write
   drivers/cache/ax45mp_cache.c: At top level:
   drivers/cache/ax45mp_cache.c:121:13: warning: 'ax45mp_dma_cache_wback' defined but not used [-Wunused-function]
     121 | static void ax45mp_dma_cache_wback(phys_addr_t paddr, size_t size)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/cache/ax45mp_cache.c:99:13: warning: 'ax45mp_dma_cache_inv' defined but not used [-Wunused-function]
      99 | static void ax45mp_dma_cache_inv(phys_addr_t paddr, size_t size)
         |             ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +70 drivers/cache/ax45mp_cache.c

    60	
    61	static void ax45mp_cpu_cache_operation(unsigned long start, unsigned long end,
    62					       unsigned int l1_op, unsigned int l2_op)
    63	{
    64		unsigned long line_size = ax45mp_priv.ax45mp_cache_line_size;
    65		void __iomem *base = ax45mp_priv.l2c_base;
    66		int mhartid = smp_processor_id();
    67		unsigned long pa;
    68	
    69		while (end > start) {
  > 70			csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
    71			csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, l1_op);
    72	
    73			pa = virt_to_phys((void *)start);
    74			writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
    75			writel(l2_op, base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
    76			while ((ax45mp_cpu_l2c_get_cctl_status() &
    77				AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=
    78				AX45MP_CCTL_L2_STATUS_IDLE)
    79				;
    80	
    81			start += line_size;
    82		}
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
