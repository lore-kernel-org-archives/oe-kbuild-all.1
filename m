Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0019366
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690051413; x=1721587413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKjOph+EkNmWhq6BoWy9I3wcCRI+i0ecjFSpZSpl2gY=;
  b=HhCRFk8/kiV3dF6BkSTjYNaA/YvYT2hcEMbOpNLLZJUCzA0pmwujORnR
   oZwA4uHksdyg+tZkSAGL+SFzS/9UF8FswP2VBcItySL+Ea1SR2Ib99Vys
   Yaak41KQIR37lUymYpg8d3EXflWK3oi3RgA5NDxGjTJM6o2qtyhwJ0Vle
   R8BTJzTldL4N2Vqqd3pwiKmvYH0JrLP9T5+wTMPUG9gB2yipNXjnDQcyv
   cVqqwgdX7qEz4YPQT6Ad6hyk+yHIygU9wqZNOwA8yNyP4p8O9milpUnV9
   G/AfKaTTKVxSP/IE0r0EwLZmCEaIAR7of7IIs9uBnLUkewiDymd9buaE6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="364679086"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="364679086"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 11:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="675389803"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="675389803"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Jul 2023 11:43:31 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNHZi-0008WL-0v;
	Sat, 22 Jul 2023 18:43:30 +0000
Date: Sun, 23 Jul 2023 02:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 8/67]
 drivers/soc/sophgo/top/top_intc.c:55:20: warning: no previous prototype for
 'cdns_pcie_get_parent_irq_domain'
Message-ID: <202307230234.8JGwN8Z9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 7b0ad6270e48635cd221c2a13a361542f3dcb947 [8/67] driver: pcie: Add sophgo sg2042 soc support
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230723/202307230234.8JGwN8Z9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307230234.8JGwN8Z9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307230234.8JGwN8Z9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/sophgo/top/top_intc.c:55:20: warning: no previous prototype for 'cdns_pcie_get_parent_irq_domain' [-Wmissing-prototypes]
      55 | struct irq_domain *cdns_pcie_get_parent_irq_domain(int intc_id)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cdns_pcie_get_parent_irq_domain +55 drivers/soc/sophgo/top/top_intc.c

    54	
  > 55	struct irq_domain *cdns_pcie_get_parent_irq_domain(int intc_id)
    56	{
    57		if (intc_id >= TOP_INTC_NUM)
    58			return NULL;
    59	
    60		if (tic_data[intc_id])
    61			return tic_data[intc_id]->domain;
    62		else
    63			return NULL;
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
