Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED291BDC6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoC+e629"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698936815; x=1730472815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hs31JN5ZIPgNGsV/AKc2TQcO7h+0igp95KiagZ1gLNE=;
  b=QoC+e629KfPIuEdfmqjoGpTZCrwu+/XqIl8Tq7C7hqcje1J1rSuVzEqQ
   HNh6oOTKGiLL6vx/VC9fwtxmy8QHF372QEpbqd/AsDT8ZbcAoFu4tsIXe
   EBNSPTn+yHB5gS0bOrxEPaAqpWWNXwQVvzhh/yXsKvBKPHFFweWDfNBu6
   R84y8s/ywFWhjuuIVI3kC3KIe8PoSC7VG4f04fP0SD78SwoCliJXKd9Jj
   3h2El1lhycGYYcCkzdY2JSz/C395fMD/i+OPYMv3SAiBLVDWzjsVZeOom
   7DJ8pu1iDROXQ5nVAcj0VYN37xU3Up+EGy2uwN7Oqs2jaje6CC9t/3Yjt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1601826"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1601826"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 07:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="831711552"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="831711552"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2023 07:53:32 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyZ4c-0001XA-1H;
	Thu, 02 Nov 2023 14:53:30 +0000
Date: Thu, 2 Nov 2023 22:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v3-2023-10-30 16/24] drivers/dax/extent.c:117: undefined
 reference to `__udivdi3'
Message-ID: <202311022251.OrwLw6It-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v3-2023-10-30
head:   d3da9e88296217b17eb067531b48dfd0211393c9
commit: 504c306092e50af6e24f41dfcda5885ac18f6dd7 [16/24] dax/region: Expose DC extents on DAX region driver load
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20231102/202311022251.OrwLw6It-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311022251.OrwLw6It-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311022251.OrwLw6It-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/dax/extent.o: in function `dax_region_ext_create_dev':
>> drivers/dax/extent.c:117: undefined reference to `__udivdi3'


vim +117 drivers/dax/extent.c

    91	
    92	int dax_region_ext_create_dev(struct dax_region *dax_region,
    93				      void *private_data,
    94				      void (*release)(void *private_data),
    95				      resource_size_t offset,
    96				      resource_size_t length,
    97				      const char *label)
    98	{
    99		struct dr_extent *dr_extent;
   100		struct device *dev;
   101		int rc;
   102	
   103		dr_extent = kzalloc(sizeof(*dr_extent), GFP_KERNEL);
   104		if (!dr_extent)
   105			return -ENOMEM;
   106	
   107		dr_extent->offset = offset;
   108		dr_extent->length = length;
   109		snprintf(dr_extent->label, DAX_EXTENT_LABEL_LEN, "%s", label);
   110	
   111		dr_extent->private_data = private_data;
   112		dr_extent->release = release;
   113		kref_init(&dr_extent->ref);
   114	
   115		dev = &dr_extent->dev;
   116		device_initialize(dev);
 > 117		dev->id = offset / dax_region->align;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
