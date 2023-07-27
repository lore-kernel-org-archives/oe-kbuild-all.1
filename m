Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEC61FDD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690451547; x=1721987547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8SQQrc2+b/d5UxwfNqNEJzIDCvqg0CvUaI4FRGy3lM=;
  b=Olv9ql/0R1hDJEco5SbTa2gE26Goep2sLgsF0Di0JPhSqphl1ptgtDvs
   O4TSWGCAncJWDrQEjPs910RjBMx2Ss/awEssnciaBNtFXVb7I6Keo7OfV
   RqB35QpmkWIPLzQ+R9ZFX8Lw79ZCQNpodET1wLiF4dTuvDbKL6Bl1hT4D
   yrmQLBGP/3i01fEa39r2uzyzVBx0Dia+EMyCs+WnLa1gGcaLaNTK+N768
   biV88Tox2iyC5jmeSyiyCIJuXHjTp3oB9Sy34h/8Zhv0WEiij9XW/ibzo
   1/7I9P/QHZsAXSEjuujenP9vK6sOJjfJq7zGDE9jqy3+rRdfMX+DfGtm9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="368283160"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="368283160"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 02:52:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="840713451"
X-IronPort-AV: E=Sophos;i="6.01,234,1684825200"; 
   d="scan'208";a="840713451"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2023 02:52:25 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOxf5-00029X-0w;
	Thu, 27 Jul 2023 09:52:07 +0000
Date: Thu, 27 Jul 2023 17:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [esmil:visionfive 25/75] arch/riscv/errata/andes/errata.c:29:23:
 error: storage size of 'ret' isn't known
Message-ID: <202307271745.H11qViyI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   4370487fce31acaedcc03e8bd2e64f3a9c591821
commit: fde37b6e790a93e8af8ec92d08f0ef9b48654876 [25/75] riscv: errata: Add Andes alternative ports
config: riscv-randconfig-r051-20230727 (https://download.01.org/0day-ci/archive/20230727/202307271745.H11qViyI-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307271745.H11qViyI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307271745.H11qViyI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workaround':
>> arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' isn't known
      29 |         struct sbiret ret;
         |                       ^~~
>> arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration of function 'sbi_ecall' [-Werror=implicit-function-declaration]
      35 |         ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
         |               ^~~~~~~~~
   arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 'ret' [-Wunused-variable]
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
