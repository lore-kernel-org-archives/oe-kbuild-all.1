Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B27314005
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695641751; x=1727177751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9q32yyXneRJS75WGs0tDMzm/tVGbXa29+WT/5afsU4=;
  b=da2z5GR1X0zwTRDlWdenKlCqzoDyrb9VCGYCoQfHDK5gOJ1tFvWg5dPG
   RCFjD5TQWWeV6E41HkROuDQrWL2GBf+qp3fpFX2nXEZAGS5hqgjZYvo80
   XFE4rZDqYvwWi7HYPUWebJXXrRwuT8NcA8JQqsXg+vBr5lO9i36c53Yty
   4yZxaGHq4jQfCyoTbyORCedNjo0V04DX8KQ2IvQj3EYSmXq4YD3msLd9v
   K9m7SAcMZm+NwvFBX3yfMFpixxTgAqghM10KaZ8n8MO2nRYk5LFEg4tHY
   Wpp6DnQo6Omsp1tKltHvzPSVrUOUuCeffu3IP+/dGq0E2N8S/CWPYGIYt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385058255"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="385058255"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 04:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="891652382"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="891652382"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2023 04:34:47 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkjsR-0001Sx-1I;
	Mon, 25 Sep 2023 11:35:47 +0000
Date: Mon, 25 Sep 2023 19:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tinazhangzw:per-iommu_IOTLB_invalidation 9/14]
 include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
Message-ID: <202309251954.qNj51U6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git per-iommu_IOTLB_invalidation
head:   c5144840fce67da51a43d9b6ef05b4b344f5786f
commit: fa8b08eb650d3a32f2190224035305d113bbea75 [9/14] iommu: Add mmu_notifier to iommu_domain
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20230925/202309251954.qNj51U6W-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251954.qNj51U6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251954.qNj51U6W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/init-mm.c:13:
>> include/linux/iommu.h:117:45: error: field 'notifier' has incomplete type
     117 |                         struct mmu_notifier notifier;
         |                                             ^~~~~~~~


vim +/notifier +117 include/linux/iommu.h

    94	
    95	struct iommu_domain {
    96		unsigned type;
    97		const struct iommu_domain_ops *ops;
    98		unsigned long pgsize_bitmap;	/* Bitmap of page sizes in use */
    99		struct iommu_domain_geometry geometry;
   100		struct iommu_dma_cookie *iova_cookie;
   101		enum iommu_page_response_code (*iopf_handler)(struct iommu_fault *fault,
   102							      void *data);
   103		void *fault_data;
   104		union {
   105			struct {
   106				iommu_fault_handler_t handler;
   107				void *handler_token;
   108			};
   109			struct {	/* IOMMU_DOMAIN_SVA */
   110				struct mm_struct *mm;
   111				int users;
   112				/*
   113				 * Next iommu_domain in mm->iommu_mm->sva-domains list
   114				 * protected by iommu_sva_lock.
   115				 */
   116				struct list_head next;
 > 117				struct mmu_notifier notifier;
   118			};
   119		};
   120	};
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
