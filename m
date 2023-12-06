Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA033D2F3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 05:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2AurOdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701839162; x=1733375162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oYy3ulZppwSO+ElFtVFX9KxBc0sNypmx8d06stBPNsI=;
  b=W2AurOdttW/NZkOpiKdDp0BcfSKAIvg7xi9RYDBm5XrgT4RNHX/ybkBl
   oMyNbFgqsCE3eQFBRrPOiNG95mS02n4k4aiLdW1s58NQVZn7cWBvEMPrS
   8yKvKDJE5aSM0YWiInjKNdY13DFDJ9nkHWm9CfdqubkwgMXn2e/KoOn65
   Hu4VONxsXUuz7E/GVM1xZOXjT9vXVnhaGeB08yj8hNknk42qp6VYPOE04
   IGbOL2Wj2A2ontTXUaxcvN8bJ1LyytdHajXaSuBIRZFQysKlBQ9//kKJW
   /061IS4b6gaZGyuJpemKrsKIsf3DDM6m7m02FrytHdz8C+pAuzuFbnqxE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373468569"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="373468569"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 21:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="12566291"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 21:05:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAk6c-000AJ6-1E;
	Wed, 06 Dec 2023 05:05:54 +0000
Date: Wed, 6 Dec 2023 13:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: Junxian Huang <huangjunxian6@hisilicon.com>, jgg@ziepe.ca,
	leon@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-rdma@vger.kernel.org,
	linuxarm@huawei.com, linux-kernel@vger.kernel.org,
	huangjunxian6@hisilicon.com
Subject: Re: [PATCH for-rc 6/6] RDMA/hns: Improve the readability of free mr
 uninit
Message-ID: <202312061253.0VL1jlNs-lkp@intel.com>
References: <20231129094434.134528-7-huangjunxian6@hisilicon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129094434.134528-7-huangjunxian6@hisilicon.com>

Hi Junxian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc4]
[cannot apply to rdma/for-next next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junxian-Huang/RDMA-hns-Rename-the-interrupts/20231129-183932
base:   linus/master
patch link:    https://lore.kernel.org/r/20231129094434.134528-7-huangjunxian6%40hisilicon.com
patch subject: [PATCH for-rc 6/6] RDMA/hns: Improve the readability of free mr uninit
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312061253.0VL1jlNs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061253.0VL1jlNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061253.0VL1jlNs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'free_mr_exit':
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:2684:23: warning: unused variable 'qp' [-Wunused-variable]
    2684 |         struct ib_qp *qp;
         |                       ^~


vim +/qp +2684 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

  2679	
  2680	static void free_mr_exit(struct hns_roce_dev *hr_dev)
  2681	{
  2682		struct hns_roce_v2_priv *priv = hr_dev->priv;
  2683		struct hns_roce_v2_free_mr *free_mr = &priv->free_mr;
> 2684		struct ib_qp *qp;
  2685		int i;
  2686	
  2687		for (i = 0; i < ARRAY_SIZE(free_mr->rsv_qp); i++)
  2688			free_mr_uninit_qp(hr_dev, i);
  2689	
  2690		free_mr_uninit_cq(hr_dev);
  2691	
  2692		free_mr_uninit_pd(hr_dev);
  2693	}
  2694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
