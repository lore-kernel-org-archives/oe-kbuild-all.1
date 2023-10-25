Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D01FCC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GngQ4p00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698228783; x=1729764783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FuNw/OGRlIU4Yj7xXUPOt8wtSvLhFBHlKHt1ehSje2o=;
  b=GngQ4p00ZK03ig3eVUqwo9E7B4C9/iPmbuLU3FHkiFkXwWXv9qmTnNU+
   hQpbvXTVE6Ef1noS/wPBNaOiF7y1QVBxKwwUJePPJdlR5ekQOAh+Juoir
   b49w2b8tmp9o7EEi/8cGPDN9V7r110oBXK7BOiTxyjcaV/Y5wLZ5OH9dd
   PFuHmmroYuJ8oymSvu9bstONamQxxDWTZfKHqUbb+HWpwimxPZ4mxqfo/
   uOriaDJ+K8LKRTc4ETdJALXjX6mkZpVne4d3F4KFbuDOBH7z/pxUozwtT
   VWVJobiKxqABNdkaARpTxzzMpqgNXSJIuu1CGH6ba3iq6ozei0XqWuKr9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453750055"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="453750055"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 03:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="824597687"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="824597687"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Oct 2023 03:13:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvasl-0008ob-0U;
	Wed, 25 Oct 2023 10:12:59 +0000
Date: Wed, 25 Oct 2023 18:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v3-2023-10-24 19/27] drivers/dax/extent.c:85:6: warning:
 no previous declaration for 'dr_ext_reg_put'
Message-ID: <202310251743.PYO4Jb0h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v3-2023-10-24
head:   1d3abb0480b0b8503b82e5f02ef95da8b182ba71
commit: 143c58584ca1474ccfbd6b32ffe0a026db8c2a0a [19/27] dax/region: Expose DC extents on DAX region driver load
config: x86_64-randconfig-003-20231025 (https://download.01.org/0day-ci/archive/20231025/202310251743.PYO4Jb0h-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251743.PYO4Jb0h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251743.PYO4Jb0h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dax/extent.c:85:6: warning: no previous declaration for 'dr_ext_reg_put' [-Wmissing-declarations]
    void dr_ext_reg_put(void *data)
         ^~~~~~~~~~~~~~


vim +/dr_ext_reg_put +85 drivers/dax/extent.c

    84	
  > 85	void dr_ext_reg_put(void *data)
    86	{
    87		struct dr_extent *dr_extent = data;
    88	
    89		dr_extent_put(dr_extent);
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
