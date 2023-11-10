Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC58111B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 05:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZ1fbkyb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699594003; x=1731130003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VFWGNgp16NNLjoze1Z5Sc/JWrS+473CTDO2l9O/CBCU=;
  b=mZ1fbkybwhktCw4JrEN3vVtibW3njjhqgm3ENRRdVnOjRc4lHTwq1toO
   /VhAr27+vtf3SVwNb6v3CrjSNVKorHNKqNwHTNQgAcXhj11JSfzDLF+2p
   BjhVyLDnXnjT8oQldg2PZQ01Rn5RpcpYhGK9geFyw9JrpQRGapO3rsVyi
   WOwx25Vw3NAxQ9Q38RTDG0NtXIcezcLxWKNPfu8Xs7hC47f7hfULUQzb2
   LDya0CMvk9di2KHTS+DZFqGI01PtMd5lVftG38vXmBQtVOqSKjIaavsd4
   pyxZkm6Fkj01llim9RCeXAwoPHD38P6O3KKkw11w3Ajq75KYK7Yq/e8OL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="387295440"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="387295440"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 21:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="763662512"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763662512"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Nov 2023 21:26:40 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1K2P-0009RC-2O;
	Fri, 10 Nov 2023 05:26:37 +0000
Date: Fri, 10 Nov 2023 13:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:4323:16: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202311101302.nsMeQMm1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89cdf9d556016a54ff6ddd62324aa5ec790c05cc
commit: f920642e406cfa17ebecf03d5b83a02273ec718e scsi: mpt3sas: Revert "scsi: mpt3sas: Fix writel() use"
date:   1 year, 2 months ago
config: sparc-randconfig-r121-20231110 (https://download.01.org/0day-ci/archive/20231110/202311101302.nsMeQMm1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231110/202311101302.nsMeQMm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101302.nsMeQMm1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/mpt3sas/mpt3sas_base.c:4323:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:4323:16: sparse:     expected unsigned int [usertype] l
   drivers/scsi/mpt3sas/mpt3sas_base.c:4323:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:4345:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:4345:16: sparse:     expected unsigned int [usertype] l
   drivers/scsi/mpt3sas/mpt3sas_base.c:4345:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:4368:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:4368:16: sparse:     expected unsigned int [usertype] l
   drivers/scsi/mpt3sas/mpt3sas_base.c:4368:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:4389:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:4389:16: sparse:     expected unsigned int [usertype] l
   drivers/scsi/mpt3sas/mpt3sas_base.c:4389:16: sparse:     got restricted __le32 [usertype]
   drivers/scsi/mpt3sas/mpt3sas_base.c:7066:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] l @@     got restricted __le32 [usertype] @@
   drivers/scsi/mpt3sas/mpt3sas_base.c:7066:24: sparse:     expected unsigned int [usertype] l
   drivers/scsi/mpt3sas/mpt3sas_base.c:7066:24: sparse:     got restricted __le32 [usertype]

vim +4323 drivers/scsi/mpt3sas/mpt3sas_base.c

  4302	
  4303	/**
  4304	 * _base_put_smid_scsi_io_atomic - send SCSI_IO request to firmware using
  4305	 *   Atomic Request Descriptor
  4306	 * @ioc: per adapter object
  4307	 * @smid: system request message index
  4308	 * @handle: device handle, unused in this function, for function type match
  4309	 *
  4310	 * Return: nothing.
  4311	 */
  4312	static void
  4313	_base_put_smid_scsi_io_atomic(struct MPT3SAS_ADAPTER *ioc, u16 smid,
  4314		u16 handle)
  4315	{
  4316		Mpi26AtomicRequestDescriptor_t descriptor;
  4317		u32 *request = (u32 *)&descriptor;
  4318	
  4319		descriptor.RequestFlags = MPI2_REQ_DESCRIPT_FLAGS_SCSI_IO;
  4320		descriptor.MSIxIndex = _base_set_and_get_msix_index(ioc, smid);
  4321		descriptor.SMID = cpu_to_le16(smid);
  4322	
> 4323		writel(cpu_to_le32(*request), &ioc->chip->AtomicRequestDescriptorPost);
  4324	}
  4325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
