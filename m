Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45714430E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7zEQAgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697578079; x=1729114079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WGhyw6b5AaO5oRHf4oQq9HF58U/arpaEHDj9e0rkUaA=;
  b=M7zEQAgGMUUAKW3GTYXNPIDPtNvVdpm0UGt4CKSxDEeWYPitP15s9lfv
   us1Q11Bb57jbn7GNBdYAohOpEax0Vwe/JEF1G1yspZV80Hmk+arY0/Whu
   forXqryqporH6qhG9qln4OB81P3ptZw74ZUxYOxOVj1aCslP9QF7XDx82
   YlCI+sEsQJ8ti4tBcISUTet+iZ48JJY8F/Bfh7UE45soI5mw3rLWfEYGn
   4qKtbQMUPWA+HSsg892p3DQPTHNFiWgPfNZtuaLRWog+L1cor6B1nyDVO
   kDynNn/LLMDTy4ZCer3P2FjeB2wmfDJB4aLuvn9GsSSpbHH/tROCY+OeK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385718704"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="385718704"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 14:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="4249453"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2023 14:28:01 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsrbV-000A6L-0e;
	Tue, 17 Oct 2023 21:27:53 +0000
Date: Wed, 18 Oct 2023 05:27:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Grove <bgrove@attotech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Rob Crispo <rcrispo@attotech.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:5487: warning: Function
 parameter or member 'sas_addr' not described in 'mpt3sas_atto_get_sas_addr'
Message-ID: <202310180526.lMLsejM1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bradley,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 91cf186aa1bfea06c7438b16eb40a612a4c3b87a scsi: mpt3sas: Add support for ATTO ExpressSAS H12xx GT devices
date:   1 year, 2 months ago
config: x86_64-randconfig-x063-20230716 (https://download.01.org/0day-ci/archive/20231018/202310180526.lMLsejM1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180526.lMLsejM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180526.lMLsejM1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpt3sas/mpt3sas_base.c:5487: warning: Function parameter or member 'sas_addr' not described in 'mpt3sas_atto_get_sas_addr'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [y]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=y] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +5487 drivers/scsi/mpt3sas/mpt3sas_base.c

  5477	
  5478	/**
  5479	 * mpt3sas_atto_get_sas_addr - get the ATTO SAS address from mfg page 1
  5480	 *
  5481	 * @ioc : per adapter object
  5482	 * @*sas_addr : return sas address
  5483	 * Return: 0 for success, non-zero for failure.
  5484	 */
  5485	static int
  5486	mpt3sas_atto_get_sas_addr(struct MPT3SAS_ADAPTER *ioc, union ATTO_SAS_ADDRESS *sas_addr)
> 5487	{
  5488		Mpi2ManufacturingPage1_t mfg_pg1;
  5489		Mpi2ConfigReply_t mpi_reply;
  5490		struct ATTO_SAS_NVRAM *nvram;
  5491		int r;
  5492		__be64 addr;
  5493	
  5494		r = mpt3sas_config_get_manufacturing_pg1(ioc, &mpi_reply, &mfg_pg1);
  5495		if (r) {
  5496			ioc_err(ioc, "Failed to read manufacturing page 1\n");
  5497			return r;
  5498		}
  5499	
  5500		/* validate nvram */
  5501		nvram = (struct ATTO_SAS_NVRAM *) mfg_pg1.VPD;
  5502		r = mpt3sas_atto_validate_nvram(ioc, nvram);
  5503		if (r)
  5504			return r;
  5505	
  5506		addr = *((__be64 *) nvram->SasAddr);
  5507		sas_addr->q = cpu_to_le64(be64_to_cpu(addr));
  5508		return r;
  5509	}
  5510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
