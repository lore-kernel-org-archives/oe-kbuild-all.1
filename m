Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FEA944C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695290062; x=1726826062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zl3Ucm1eICQZgaQdIICPIFo1HJeIEsrvs5MGWbXEFOY=;
  b=RDIZBiDLN7XgQb5z3eJVQlnikpnyzIt3qCx0YQcElf/UxoOnQojyrddj
   Ut+2LX6Twyh720xd/Tgy/gyn/pQNgDYLpQuYroqwDuGg2xAh1VaFheC8C
   TSax3BxIK6zjqmlfauuNI78HS7Shwf3J27lyoPobh8t55kcB2KJOKUDCc
   Xp+uwmCBfL5rxINTufAR7GCFWypNPSGzBgwvzcsWdKDqXp0NPQz3VWulc
   nSAjYlPKqZ6atGvTSQ6dhRP/3hTtgdM7jj7MUQBWt2576PKwgJxf6BfFp
   lSn10jcqy292B27YOb+A6I5Vz9lalSOVU/K/LIfmMDutCPnjZ8k2MKldZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466782201"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="466782201"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 02:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740556540"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; 
   d="scan'208";a="740556540"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Sep 2023 02:54:18 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjGO0-0009qM-1l;
	Thu, 21 Sep 2023 09:54:16 +0000
Date: Thu, 21 Sep 2023 17:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ohad Sharabi <osharabi@habana.ai>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Oded Gabbay <ogabbay@kernel.org>
Subject: [linux-next:master 5896/6975]
 drivers/accel/habanalabs/common/device.c:209:37: error: 'struct scatterlist'
 has no member named 'dma_length'; did you mean 'length'?
Message-ID: <202309211712.ti68BWbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: c313fc57eaefbeca50a51d5d2554264297d98526 [5896/6975] accel/habanalabs: trace dma map sgtable
config: um-randconfig-r005-20230815 (https://download.01.org/0day-ci/archive/20230921/202309211712.ti68BWbS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211712.ti68BWbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211712.ti68BWbS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/habanalabs/common/device.c: In function 'hl_dma_map_sgtable_caller':
>> drivers/accel/habanalabs/common/device.c:209:37: error: 'struct scatterlist' has no member named 'dma_length'; did you mean 'length'?
     209 |                                 sg->dma_length, dir, caller);
         |                                     ^~~~~~~~~~
         |                                     length
   drivers/accel/habanalabs/common/device.c: In function 'hl_dma_unmap_sgtable_caller':
   drivers/accel/habanalabs/common/device.c:246:45: error: 'struct scatterlist' has no member named 'dma_length'; did you mean 'length'?
     246 |                                         sg->dma_length, dir, caller);
         |                                             ^~~~~~~~~~
         |                                             length


vim +209 drivers/accel/habanalabs/common/device.c

   190	
   191	int hl_dma_map_sgtable_caller(struct hl_device *hdev, struct sg_table *sgt,
   192					enum dma_data_direction dir, const char *caller)
   193	{
   194		struct asic_fixed_properties *prop = &hdev->asic_prop;
   195		struct scatterlist *sg;
   196		int rc, i;
   197	
   198		rc = hdev->asic_funcs->dma_map_sgtable(hdev, sgt, dir);
   199		if (rc)
   200			return rc;
   201	
   202		if (!trace_habanalabs_dma_map_page_enabled())
   203			return 0;
   204	
   205		for_each_sgtable_dma_sg(sgt, sg, i)
   206			trace_habanalabs_dma_map_page(hdev->dev,
   207					page_to_phys(sg_page(sg)),
   208					sg->dma_address - prop->device_dma_offset_for_host_access,
 > 209					sg->dma_length, dir, caller);
   210	
   211		return 0;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
