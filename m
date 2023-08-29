Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F963BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693297369; x=1724833369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yor4lfBD6z60jsvRdOvRS+Uzk9vCzBQuIraUCNIAp+s=;
  b=Qg1blfqnszMMvzYZk9Js4ztrK253FajtcYCybXEpGzo87NpsD+1UfPyS
   Bq11g/JI3K0HT8mfQUFs4yyKktl2w38sdWoPCmMvkkAUN4OxML3M+fhuB
   tWIlGwt4vPTU7XDwLIg2kfBlX6sPOTpB7oMQwN4Rl66Ej4pkZGgnMtd4A
   h258SPwqAi6fHZY8fM+CQP2SiJExlS1jKT/Xz7kHj4sBmjke4qyA8LVVV
   lkUQUOG4uSNF/KTWK44YtW/yKsoYkqNW/Gm9dj/fVc7LdSnD9Dp5RReg8
   55fGGJETVshgWTEtVn2or1CSAqB5ZVms6wsooMn+k9pPFB7h0LFeVSk3u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355632567"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="355632567"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="773589631"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="773589631"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Aug 2023 01:22:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qatzj-0008Yp-2L;
	Tue, 29 Aug 2023 08:22:41 +0000
Date: Tue, 29 Aug 2023 16:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v2-2023-08-28 29/36] drivers/dax/dax-private.h:129:30:
 error: field 'range' has incomplete type
Message-ID: <202308291652.pO8iJuhA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v2-2023-08-28
head:   4e8d6c7176cb59f986a4365a6c6bd7d3610c229e
commit: af90cf6f56ec6574628051a51b1364e759206aa3 [29/36] cxl/region: Expose DC extents on region driver load
config: parisc-randconfig-r033-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291652.pO8iJuhA-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291652.pO8iJuhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291652.pO8iJuhA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/dax/extent.c:6:
>> drivers/dax/dax-private.h:129:30: error: field 'range' has incomplete type
     129 |                 struct range range;
         |                              ^~~~~
   drivers/dax/extent.c: In function 'length_show':
>> drivers/dax/extent.c:13:37: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      13 |         return sysfs_emit(buf, "%#llx\n", dr_reg_ext_dev->length);
         |                                 ~~~~^     ~~~~~~~~~~~~~~~~~~~~~~
         |                                     |                   |
         |                                     |                   resource_size_t {aka unsigned int}
         |                                     long long unsigned int
         |                                 %#x
   In file included from include/linux/device.h:15,
                    from drivers/dax/extent.c:4:
   drivers/dax/extent.c: In function 'unregister_dr_extent':
   drivers/dax/extent.c:69:39: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      69 |         dev_dbg(&dr_reg_ext_dev->dev, "Unregister DAX region ext OFF:%llx L:%s\n",
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/dax/extent.c:69:9: note: in expansion of macro 'dev_dbg'
      69 |         dev_dbg(&dr_reg_ext_dev->dev, "Unregister DAX region ext OFF:%llx L:%s\n",
         |         ^~~~~~~
   drivers/dax/extent.c:69:73: note: format string is defined here
      69 |         dev_dbg(&dr_reg_ext_dev->dev, "Unregister DAX region ext OFF:%llx L:%s\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %x
   drivers/dax/extent.c: In function 'dax_region_ext_create_dev':
   drivers/dax/extent.c:108:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     108 |         dev_dbg(dev, "DAX region extent OFF:%llx LEN:%llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/dax/extent.c:108:9: note: in expansion of macro 'dev_dbg'
     108 |         dev_dbg(dev, "DAX region extent OFF:%llx LEN:%llx\n",
         |         ^~~~~~~
   drivers/dax/extent.c:108:48: note: format string is defined here
     108 |         dev_dbg(dev, "DAX region extent OFF:%llx LEN:%llx\n",
         |                                             ~~~^
         |                                                |
         |                                                long long unsigned int
         |                                             %x
   drivers/dax/extent.c:108:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     108 |         dev_dbg(dev, "DAX region extent OFF:%llx LEN:%llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/dax/extent.c:108:9: note: in expansion of macro 'dev_dbg'
     108 |         dev_dbg(dev, "DAX region extent OFF:%llx LEN:%llx\n",
         |         ^~~~~~~
   drivers/dax/extent.c:108:57: note: format string is defined here
     108 |         dev_dbg(dev, "DAX region extent OFF:%llx LEN:%llx\n",
         |                                                      ~~~^
         |                                                         |
         |                                                         long long unsigned int
         |                                                      %x
   drivers/dax/extent.c:114:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     114 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%llx LEN:%llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/dax/extent.c:114:9: note: in expansion of macro 'dev_err'
     114 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%llx LEN:%llx\n",
         |         ^~~~~~~
   drivers/dax/extent.c:114:66: note: format string is defined here
     114 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%llx LEN:%llx\n",
         |                                                               ~~~^
         |                                                                  |
         |                                                                  long long unsigned int
         |                                                               %x
   drivers/dax/extent.c:114:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     114 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%llx LEN:%llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:144:56: note: in expansion of macro 'dev_fmt'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/dax/extent.c:114:9: note: in expansion of macro 'dev_err'
     114 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%llx LEN:%llx\n",
         |         ^~~~~~~
   drivers/dax/extent.c:114:75: note: format string is defined here
     114 |         dev_err(dev, "Failed to initialize DAX extent dev OFF:%llx LEN:%llx\n",
         |                                                                        ~~~^
         |                                                                           |
         |                                                                           long long unsigned int
         |                                                                        %x


vim +/range +129 drivers/dax/dax-private.h

0b07ce872a9eca Dan Williams 2020-10-13  101  
efebc711180f7f Dave Jiang   2017-04-07  102  /**
89ec9f2cfa36cc Dan Williams 2018-10-29  103   * struct dev_dax - instance data for a subdivision of a dax region, and
89ec9f2cfa36cc Dan Williams 2018-10-29  104   * data while the device is activated in the driver.
efebc711180f7f Dave Jiang   2017-04-07  105   * @region - parent region
736163671bcb16 Dan Williams 2017-05-04  106   * @dax_dev - core dax functionality
8fc5c73554db0a Dan Williams 2018-11-09  107   * @target_node: effective numa node if dev_dax memory range is onlined
70aab281e18c68 Dan Williams 2023-06-02  108   * @dyn_id: is this a dynamic or statically created instance
70aab281e18c68 Dan Williams 2023-06-02  109   * @id: ida allocated id when the dax_region is not static
0b07ce872a9eca Dan Williams 2020-10-13  110   * @ida: mapping id allocator
736163671bcb16 Dan Williams 2017-05-04  111   * @dev - device core
89ec9f2cfa36cc Dan Williams 2018-10-29  112   * @pgmap - pgmap for memmap setup / lifetime (driver owned)
60e93dc097f7f1 Dan Williams 2020-10-13  113   * @nr_range: size of @ranges
60e93dc097f7f1 Dan Williams 2020-10-13  114   * @ranges: resource-span + pgoff tuples for the instance
efebc711180f7f Dave Jiang   2017-04-07  115   */
736163671bcb16 Dan Williams 2017-05-04  116  struct dev_dax {
efebc711180f7f Dave Jiang   2017-04-07  117  	struct dax_region *region;
736163671bcb16 Dan Williams 2017-05-04  118  	struct dax_device *dax_dev;
33cf94d7176672 Joao Martins 2020-10-13  119  	unsigned int align;
8fc5c73554db0a Dan Williams 2018-11-09  120  	int target_node;
70aab281e18c68 Dan Williams 2023-06-02  121  	bool dyn_id;
0f3da14a4f0503 Dan Williams 2020-10-13  122  	int id;
0b07ce872a9eca Dan Williams 2020-10-13  123  	struct ida ida;
efebc711180f7f Dave Jiang   2017-04-07  124  	struct device dev;
f5516ec5efb9fe Dan Williams 2020-10-13  125  	struct dev_pagemap *pgmap;
60e93dc097f7f1 Dan Williams 2020-10-13  126  	int nr_range;
60e93dc097f7f1 Dan Williams 2020-10-13  127  	struct dev_dax_range {
60e93dc097f7f1 Dan Williams 2020-10-13  128  		unsigned long pgoff;
f5516ec5efb9fe Dan Williams 2020-10-13 @129  		struct range range;
0b07ce872a9eca Dan Williams 2020-10-13  130  		struct dax_mapping *mapping;
60e93dc097f7f1 Dan Williams 2020-10-13  131  	} *ranges;
efebc711180f7f Dave Jiang   2017-04-07  132  };
51cf784c42d07f Dan Williams 2017-07-12  133  

:::::: The code at line 129 was first introduced by commit
:::::: f5516ec5efb9fe0f426a46eeef25d389d3c2f988 device-dax: make pgmap optional for instance creation

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
