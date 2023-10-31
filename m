Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263D1156C1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aV2kxe7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698751766; x=1730287766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I2m0eZvhFzPuphPUSknGqlAlJ9QMpgkE81FAf9cjUAA=;
  b=aV2kxe7jhXXezZ5QWmbAQsX7ALlu2yZhyJ7Tkwe2MvjZHEIa3jQvbmZD
   Tc020TOjcA/+mis+LaS2ze3tswBAk252sFj0XxqEXqAQKNcTzqGFAUWOy
   jBLjaHx5AdGry2fbsmZPHheWF7u+AC7LKYL9VDkuxGxncxRdB9hLobh4m
   Vowp2DLsY26rcv67P77hgVSxrE/yRstqcjoXLsuD83+CSVFZ9hv2ui+8Z
   xA1+MrqzsErtsMugyd3f4PNrbphOC/rK2fUzLk2Q0kS/Ga7sl3AcRCe5W
   5SBgKGGgWUikT7JytEmBhc6gIaGP99hkS1NkoKqeEEOwuokx1AB/7p3u5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419377541"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="419377541"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 04:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="851214230"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="851214230"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2023 04:29:23 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxmvy-000088-0O;
	Tue, 31 Oct 2023 11:29:22 +0000
Date: Tue, 31 Oct 2023 19:29:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v3-2023-10-30 16/24] drivers/dax/dax-private.h:111:30:
 error: field 'range' has incomplete type
Message-ID: <202310311958.oyN3xVHo-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231031/202310311958.oyN3xVHo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311958.oyN3xVHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311958.oyN3xVHo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dax/extent.c:6:
>> drivers/dax/dax-private.h:111:30: error: field 'range' has incomplete type
     111 |                 struct range range;
         |                              ^~~~~


vim +/range +111 drivers/dax/dax-private.h

0b07ce872a9eca Dan Williams 2020-10-13   83  
efebc711180f7f Dave Jiang   2017-04-07   84  /**
89ec9f2cfa36cc Dan Williams 2018-10-29   85   * struct dev_dax - instance data for a subdivision of a dax region, and
89ec9f2cfa36cc Dan Williams 2018-10-29   86   * data while the device is activated in the driver.
efebc711180f7f Dave Jiang   2017-04-07   87   * @region - parent region
736163671bcb16 Dan Williams 2017-05-04   88   * @dax_dev - core dax functionality
8fc5c73554db0a Dan Williams 2018-11-09   89   * @target_node: effective numa node if dev_dax memory range is onlined
70aab281e18c68 Dan Williams 2023-06-02   90   * @dyn_id: is this a dynamic or statically created instance
70aab281e18c68 Dan Williams 2023-06-02   91   * @id: ida allocated id when the dax_region is not static
0b07ce872a9eca Dan Williams 2020-10-13   92   * @ida: mapping id allocator
736163671bcb16 Dan Williams 2017-05-04   93   * @dev - device core
89ec9f2cfa36cc Dan Williams 2018-10-29   94   * @pgmap - pgmap for memmap setup / lifetime (driver owned)
60e93dc097f7f1 Dan Williams 2020-10-13   95   * @nr_range: size of @ranges
60e93dc097f7f1 Dan Williams 2020-10-13   96   * @ranges: resource-span + pgoff tuples for the instance
efebc711180f7f Dave Jiang   2017-04-07   97   */
736163671bcb16 Dan Williams 2017-05-04   98  struct dev_dax {
efebc711180f7f Dave Jiang   2017-04-07   99  	struct dax_region *region;
736163671bcb16 Dan Williams 2017-05-04  100  	struct dax_device *dax_dev;
33cf94d7176672 Joao Martins 2020-10-13  101  	unsigned int align;
8fc5c73554db0a Dan Williams 2018-11-09  102  	int target_node;
70aab281e18c68 Dan Williams 2023-06-02  103  	bool dyn_id;
0f3da14a4f0503 Dan Williams 2020-10-13  104  	int id;
0b07ce872a9eca Dan Williams 2020-10-13  105  	struct ida ida;
efebc711180f7f Dave Jiang   2017-04-07  106  	struct device dev;
f5516ec5efb9fe Dan Williams 2020-10-13  107  	struct dev_pagemap *pgmap;
60e93dc097f7f1 Dan Williams 2020-10-13  108  	int nr_range;
60e93dc097f7f1 Dan Williams 2020-10-13  109  	struct dev_dax_range {
60e93dc097f7f1 Dan Williams 2020-10-13  110  		unsigned long pgoff;
f5516ec5efb9fe Dan Williams 2020-10-13 @111  		struct range range;
0b07ce872a9eca Dan Williams 2020-10-13  112  		struct dax_mapping *mapping;
60e93dc097f7f1 Dan Williams 2020-10-13  113  	} *ranges;
efebc711180f7f Dave Jiang   2017-04-07  114  };
51cf784c42d07f Dan Williams 2017-07-12  115  

:::::: The code at line 111 was first introduced by commit
:::::: f5516ec5efb9fe0f426a46eeef25d389d3c2f988 device-dax: make pgmap optional for instance creation

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
