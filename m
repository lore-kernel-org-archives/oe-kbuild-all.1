Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0D3746B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693471966; x=1725007966;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pkl0508t0Bu2O/tA3Htacdki08EVdYD/nSEza+6m+9U=;
  b=AJqNxk6vEhgm1KwO2wu4TI+8Xv7zmV3EVmh3meJOaQpYwfFBWXIlDess
   b+GBWL9z2voDYRrxdJDy34DkLgawfMVWzlVlPIo83UdXMKvxCsiA09pyB
   J8FUXIvKB7L3FpCWAapwD8EjHqUJJQZ/nYjkr9PFUr7zTo7Zj9qqtphrm
   SGd9ArChFPUEMvKKoACyZDjhyBGwLQPMWmbHq2enWbGBT7sD+Zp1JLYQx
   ZWUkYdtd6mtd1ke8M2CJsQsKb9CRQ/Qula9svgTuNZypyCRflFtuY9Jyf
   ocXfUd9gCk73+dmOk8rRFogpob2sPALeSOOQ+L7EYJdrcYb3VT/EMH0Ss
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="366066719"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="366066719"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 01:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="862949630"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="862949630"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 01:52:44 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbdPI-000B9f-2e;
	Thu, 31 Aug 2023 08:52:20 +0000
Date: Thu, 31 Aug 2023 16:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 13230/13643]
 arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' isn't
 known
Message-ID: <202308311610.ec6bm2G8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a47fc304d2b678db1a5d760a7d644dac9b067752
commit: f2863f30d1b05e5ecf61c063609cb974954d47f8 [13230/13643] riscv: errata: Add Andes alternative ports
config: riscv-randconfig-001-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311610.ec6bm2G8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workaround':
>> arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' isn't known
      29 |         struct sbiret ret;
         |                       ^~~
>> arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration of function 'sbi_ecall' [-Werror=implicit-function-declaration]
      35 |         ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
         |               ^~~~~~~~~
>> arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 'ret' [-Wunused-variable]
      29 |         struct sbiret ret;
         |                       ^~~
   cc1: some warnings being treated as errors


vim +29 arch/riscv/errata/andes/errata.c

    26	
    27	static long ax45mp_iocp_sw_workaround(void)
    28	{
  > 29		struct sbiret ret;
    30	
    31		/*
    32		 * ANDES_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP is missing and
    33		 * cache is controllable only then CMO will be applied to the platform.
    34		 */
  > 35		ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
    36				0, 0, 0, 0, 0, 0);
    37	
    38		return ret.error ? 0 : ret.value;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
