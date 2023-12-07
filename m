Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B664E45978
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CA+y8Jv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701963638; x=1733499638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TRQrcR82gGZ4bilKmvDQp3/BMwMwwJ+qVGy8M9ph6/E=;
  b=CA+y8Jv5WNpXG/1PZfPwcNvrKgrXQ+IzgvP9qag945EU/A5/VwlV16ZA
   D/qrlNFBsF4WOYREjux6IKarxVlzKe1Fy+hBL3tO4Lqx79oYe3lnpJHoR
   Yf+hPb0YKRqGijuyi16uLiZfRpIduGbeiJBKomyXvcvVP5r6OwaWh5djR
   BrhADQoqOqQ3Zce5ofDijfMyZr0F2zwWwdjId+qlAYqaGIwBqRZFPra8o
   T/CtnvCAVTmxt4NhU9mF6i5elt2u/NKNxdj8tYr8rerXX3krvJTHVI960
   SaBQpoEUnrK5YW7fpVD58xUUp/PC67rUBWkYqS2la0VWW1TqDH1Mrc6M/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393121332"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="393121332"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 07:40:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="771770862"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="771770862"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 07 Dec 2023 07:40:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBGUH-000CQw-1t;
	Thu, 07 Dec 2023 15:40:29 +0000
Date: Thu, 7 Dec 2023 23:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, stable@vger.kernel.org,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH] cxl/hdm: Fix dpa translation locking
Message-ID: <202312072350.QQTkSsY7-lkp@intel.com>
References: <170192142664.461900.3169528633970716889.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170192142664.461900.3169528633970716889.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc4 next-20231207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/cxl-hdm-Fix-dpa-translation-locking/20231207-115958
base:   linus/master
patch link:    https://lore.kernel.org/r/170192142664.461900.3169528633970716889.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [PATCH] cxl/hdm: Fix dpa translation locking
config: i386-buildonly-randconfig-003-20231207 (https://download.01.org/0day-ci/archive/20231207/202312072350.QQTkSsY7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072350.QQTkSsY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072350.QQTkSsY7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/core/port.c: In function 'dpa_resource_show':
>> drivers/cxl/core/port.c:231:37: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
     231 |         return sysfs_emit(buf, "%#llx\n", cxl_dpa_resource_start(cxled));
         |                                 ~~~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     |     |
         |                                     |     resource_size_t {aka unsigned int}
         |                                     long long unsigned int
         |                                 %#x


vim +231 drivers/cxl/core/port.c

   224	
   225	static ssize_t dpa_resource_show(struct device *dev, struct device_attribute *attr,
   226				    char *buf)
   227	{
   228		struct cxl_endpoint_decoder *cxled = to_cxl_endpoint_decoder(dev);
   229	
   230		guard(rwsem_read)(&cxl_dpa_rwsem);
 > 231		return sysfs_emit(buf, "%#llx\n", cxl_dpa_resource_start(cxled));
   232	}
   233	static DEVICE_ATTR_RO(dpa_resource);
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
