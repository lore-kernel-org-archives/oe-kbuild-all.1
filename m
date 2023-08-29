Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3782B20E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Aug 2023 08:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693298089; x=1724834089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ASTS6FJIz0H6wgB1Wuc4w+vvT4Fd0zpxBzKanm41vFs=;
  b=Avov6GEVhEjp5475mIae9CGI79LdRtyovlqgrwqwoAm5wltZ9yb+1GGe
   kay2mtIyBpEQMLOY7aIc67gHTMTMbOUhgzTd/BhnBLdxYj9G3sWDzICh2
   0W5KDJuN3uLjjLT5UMbu7PfOUaKmyEORZAuUaO+2FpavcYKIZ6n8nAY0d
   5IT0xsh1pgImviFtDkVdpqR4jlsg0OrxQG0v0qj3I0NF3IK1ZZuxqZCBg
   FuhZAWhk4LwbTq8Ql1hmPE7kujoMU0jr3BJbAFomb10I0+X4mSrprxWNd
   TG7bh/CUWXWG11VEIc//ATf4twXNamnh/G4JT7sQ89rSE/jki7eo/a42b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="360311331"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="360311331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:34:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882231784"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2023 01:34:52 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qauBS-0008ZR-28;
	Tue, 29 Aug 2023 08:34:46 +0000
Date: Tue, 29 Aug 2023 16:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v2-2023-08-28 29/36] drivers/cxl/core/region.c:1565:22:
 warning: format '%llx' expects argument of type 'long long unsigned int',
 but argument 4 has type 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202308291616.g6qrqxBS-lkp@intel.com>
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
config: i386-randconfig-r022-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291616.g6qrqxBS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291616.g6qrqxBS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291616.g6qrqxBS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/cxl/core/region.c:5:
   drivers/cxl/core/region.c: In function 'cxl_dc_extent_in_ed':
>> drivers/cxl/core/region.c:1565:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1565 |         dev_dbg(dev, "Cxled start:%llx end:%llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/cxl/core/region.c:1565:9: note: in expansion of macro 'dev_dbg'
    1565 |         dev_dbg(dev, "Cxled start:%llx end:%llx\n",
         |         ^~~~~~~
   drivers/cxl/core/region.c:1565:38: note: format string is defined here
    1565 |         dev_dbg(dev, "Cxled start:%llx end:%llx\n",
         |                                   ~~~^
         |                                      |
         |                                      long long unsigned int
         |                                   %x
   drivers/cxl/core/region.c:1565:22: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
    1565 |         dev_dbg(dev, "Cxled start:%llx end:%llx\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:163:45: note: in expansion of macro 'dev_fmt'
     163 |                 dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
         |                                             ^~~~~~~
   drivers/cxl/core/region.c:1565:9: note: in expansion of macro 'dev_dbg'
    1565 |         dev_dbg(dev, "Cxled start:%llx end:%llx\n",
         |         ^~~~~~~
   drivers/cxl/core/region.c:1565:47: note: format string is defined here
    1565 |         dev_dbg(dev, "Cxled start:%llx end:%llx\n",
         |                                            ~~~^
         |                                               |
         |                                               long long unsigned int
         |                                            %x


vim +1565 drivers/cxl/core/region.c

  1549	
  1550	static bool cxl_dc_extent_in_ed(struct cxl_endpoint_decoder *cxled,
  1551					struct cxl_dc_extent_data *extent)
  1552	{
  1553		struct range dpa_range = (struct range){
  1554			.start = extent->dpa_start,
  1555			.end = extent->dpa_start + extent->length - 1,
  1556		};
  1557		struct device *dev = &cxled->cxld.dev;
  1558	
  1559		dev_dbg(dev, "Checking extent DPA:%llx LEN:%llx\n",
  1560			extent->dpa_start, extent->length);
  1561	
  1562		if (!cxled->cxld.region || !cxled->dpa_res)
  1563			return false;
  1564	
> 1565		dev_dbg(dev, "Cxled start:%llx end:%llx\n",
  1566			cxled->dpa_res->start, cxled->dpa_res->end);
  1567		return (cxled->dpa_res->start <= dpa_range.start &&
  1568			dpa_range.end <= cxled->dpa_res->end);
  1569	}
  1570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
