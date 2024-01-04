Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDE12135C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 11:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCFzujpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704369365; x=1735905365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4m4W96Vl3cSvSoxQotIOnbaOZ6Mjb1Jhs93BpGEhGRM=;
  b=LCFzujpTrQ3gvebyWIh7cEoYp4znArLmJt11DAC1LFxVg1uAtTV2rvvm
   gWfTvvX3TQ0B/aEFQXhvRErnUQQldEE19A4ICBrc8TTWFFwXOAU1sc/Rx
   /eyi+IGihufr294rQx7bistCX1L3PM2fAH3hl/lxAezmZFoyl2Qfi1JdV
   BmmI9vdL6K+H0itr6iAY+gKWvQd1a2gY9eIj9vWGXl23hIBQuLg17Nl9V
   jlJk4qqQ4WqJXEAxDDemupG9SFLgYIQ/gMh7vxBbnFGcpYeVoCNtcrsnD
   Ruc3dFHCql3tw8V1NPhg2yBeUlWmR4z8Ipf3qHc4x0/em/KTdusLv+6D1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="15852561"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="15852561"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 03:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="923884795"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="923884795"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jan 2024 03:56:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLMKN-000NGI-2z;
	Thu, 04 Jan 2024 11:55:59 +0000
Date: Thu, 4 Jan 2024 19:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Chan <michael.chan@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vasundhara Volam <vasundhara-v.volam@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: [linux-next:master 11866/12403]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:5662:5-7: Unneeded variable: "rc".
 Return "  0" on line 5677
Message-ID: <202401041942.qrB1amZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d0b3c8aa5e37775cd7c3ac07b256218df0fd6678
commit: 96c9bedc755ed1fa6e35d37328ddbcb439c93c4c [11866/12403] bnxt_en: Refactor L2 filter alloc/free firmware commands.
config: arm64-randconfig-r053-20240104 (https://download.01.org/0day-ci/archive/20240104/202401041942.qrB1amZM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401041942.qrB1amZM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5662:5-7: Unneeded variable: "rc". Return "  0" on line 5677

vim +5662 drivers/net/ethernet/broadcom/bnxt/bnxt.c

  5658	
  5659	static int bnxt_hwrm_clear_vnic_filter(struct bnxt *bp)
  5660	{
  5661		u16 i, j, num_of_vnics = 1; /* only vnic 0 supported */
> 5662		int rc = 0;
  5663	
  5664		/* Any associated ntuple filters will also be cleared by firmware. */
  5665		for (i = 0; i < num_of_vnics; i++) {
  5666			struct bnxt_vnic_info *vnic = &bp->vnic_info[i];
  5667	
  5668			for (j = 0; j < vnic->uc_filter_count; j++) {
  5669				struct bnxt_l2_filter *fltr = vnic->l2_filters[j];
  5670	
  5671				bnxt_hwrm_l2_filter_free(bp, fltr);
  5672				bnxt_del_l2_filter(bp, fltr);
  5673			}
  5674			vnic->uc_filter_count = 0;
  5675		}
  5676	
> 5677		return rc;
  5678	}
  5679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
