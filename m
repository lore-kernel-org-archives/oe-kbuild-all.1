Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5459E12B72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 11:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692272585; x=1723808585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pPCmEoRP32epEQDCgK8R0OgJjoyRrG7zANWIdRwe6QQ=;
  b=HJxyv9Xs3VenGQWn+8NOGxG35Le5JbCOPb/RDH0HM5EjL2PZ4vG5oiJ2
   hA+hjZEh3JTkFiMLcbC7c5N8s6xZZsi+7Sid+1JL/zAV1lC/boeug0Oc8
   xdOKEKAyK/3QdSGdz2bzSmO3Y5pMkBKVOU0fp91tt5nn4zDdoYSBKXMkG
   3XWiNhp+1qCVdM/dAQ2eUAiYkoDUDJNa1N+XmL0OE4oq7qM0uGETZ4yo7
   GK4wSkaPSWojAe+zivzlR9J2CX/KEAEzFZSdmWv3gYqoj7x8vT2g4EGQo
   Ah1bFBwmUBQtGwlHDdBD6jFpij38OYaBe5oBzei949x63fa4ek6ndHzeY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403766683"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="403766683"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 04:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="764051245"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="764051245"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 04:41:49 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWbNp-00015p-2R;
	Thu, 17 Aug 2023 11:41:46 +0000
Date: Thu, 17 Aug 2023 19:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Grove <bgrove@attotech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Rob Crispo <rcrispo@attotech.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:5487: warning: Function
 parameter or member 'sas_addr' not described in 'mpt3sas_atto_get_sas_addr'
Message-ID: <202308171957.Z6vvWcGO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 91cf186aa1bfea06c7438b16eb40a612a4c3b87a scsi: mpt3sas: Add support for ATTO ExpressSAS H12xx GT devices
date:   12 months ago
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230817/202308171957.Z6vvWcGO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171957.Z6vvWcGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171957.Z6vvWcGO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpt3sas/mpt3sas_base.c:5487: warning: Function parameter or member 'sas_addr' not described in 'mpt3sas_atto_get_sas_addr'


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
