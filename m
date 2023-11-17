Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD60374CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjUX4H6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700238318; x=1731774318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=upeHHBC9vFvHsHrz+UJ4iI9jKpSbjxlyNEIYTW2dtDI=;
  b=SjUX4H6Vqkhw9Be1cGQVsnIlkIpUmfwNsxZXDuD3RWMKXzVUsy3BDhKj
   rAoZEhlfaOVZAEQUBJDctvHVH2ckj51JPLC8JbYx/9Q7UXoEvpMA8Gjjf
   UK0I4pIFEELRsVDHmXLvQaFd2xjAQZAR2lp5OD+bp+smCSyvhOs7dBk73
   8BPRqFeUhfMbqEMcDq2D63lV3nPsqAjtuMrHhUIcgcucsEw7+vDU8nOMa
   Hqahns9EthVG88V2MAyQVfuQBED49uHqPoPqUnNAc5kMkeVs2lUZ+m7Lb
   uiwbMyLAK781i1sd2C0dqr6Eya95m26SZgNZEjHsNYHdze0cN4et+C88C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4472528"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="4472528"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 08:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="856380835"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="856380835"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Nov 2023 08:25:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r41eT-0002vf-0l;
	Fri, 17 Nov 2023 16:25:05 +0000
Date: Sat, 18 Nov 2023 00:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382] csky-linux-ld:
 spi-cadence-quadspi.c:undefined reference to `spi_mem_exec_op'
Message-ID: <202311180000.CmQHw7eQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3d320fa61172b4a33d1c11e57374cc6880562ae0
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: csky-randconfig-002-20231117 (https://download.01.org/0day-ci/archive/20231118/202311180000.CmQHw7eQ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180000.CmQHw7eQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180000.CmQHw7eQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_phy_check_pattern':
   spi-cadence-quadspi.c:(.text+0x200): undefined reference to `spi_mem_exec_op'
>> csky-linux-ld: spi-cadence-quadspi.c:(.text+0x240): undefined reference to `spi_mem_exec_op'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
