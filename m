Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A7D2FB6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679416841; x=1710952841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KqIJi7DXkQu4Hj1HuCf3rCymWFPuGaIFxwH+hnV1Ogc=;
  b=ifXT3nBYL1kHNAu1QN6zWfFwHPaMf0+8iOpbNg1PTKZF2dlMWU430Svy
   ZeCLv09dJE9Do/sPau/GGjUE5k8AgZg/wvHPwIEOhhqjvXRD5YCfDK/ZK
   nJJULr1YRXHjQxd/fYqnaGRnDBB7RJeeCkvhm/zuJAV8m2K1e508jbMBA
   +7TTNIOJew4b2l8sucFKXHpLOwepxVtr4iqx+YI0TJtv5CI2DbDnJXKjt
   TrtLLLidanEOBVUFqH5Y/JDu8o0OgznDUfSTEcYkMqsU1po/UI/GGGH35
   WqAx2vYqL/f3BJsxwKMlL+UyqT3FtrHjGcj5RCbIiqTbbt2Yxpb2IrVRZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340534820"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="340534820"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 09:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631657195"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="631657195"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Mar 2023 09:40:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pef2N-000C9q-0c;
	Tue, 21 Mar 2023 16:40:39 +0000
Date: Wed, 22 Mar 2023 00:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 6028/9999] mm/huge_memory.c:2854:13:
 warning: unused variable 'nid'
Message-ID: <202303220038.GSxzsThi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: e6ca020bc338ccebde78046d05e232093c57be8a [6028/9999] alinux: mm: thp: move deferred split queue to memcg's nodeinfo
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230322/202303220038.GSxzsThi-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/alibaba/cloud-kernel/commit/e6ca020bc338ccebde78046d05e232093c57be8a
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout e6ca020bc338ccebde78046d05e232093c57be8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220038.GSxzsThi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/huge_memory.c:527:15: warning: no previous prototype for '__thp_get_unmapped_area' [-Wmissing-prototypes]
     527 | unsigned long __thp_get_unmapped_area(struct file *filp, unsigned long len,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   mm/huge_memory.c: In function 'split_huge_page_to_list':
   mm/huge_memory.c:2662:29: warning: unused variable 'pgdata' [-Wunused-variable]
    2662 |         struct pglist_data *pgdata = NODE_DATA(page_to_nid(head));
         |                             ^~~~~~
   mm/huge_memory.c: In function 'deferred_split_count':
>> mm/huge_memory.c:2854:13: warning: unused variable 'nid' [-Wunused-variable]
    2854 |         int nid = sc->nid;
         |             ^~~
   mm/huge_memory.c: In function 'deferred_split_scan':
   mm/huge_memory.c:2868:13: warning: unused variable 'nid' [-Wunused-variable]
    2868 |         int nid = sc->nid;
         |             ^~~


vim +/nid +2854 mm/huge_memory.c

  2850	
  2851	static unsigned long deferred_split_count(struct shrinker *shrink,
  2852			struct shrink_control *sc)
  2853	{
> 2854		int nid = sc->nid;
  2855		struct pglist_data *pgdata = NODE_DATA(nid);
  2856		struct deferred_split *ds_queue = &pgdata->deferred_split_queue;
  2857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
