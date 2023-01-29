Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AE917D9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674986942; x=1706522942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cSY8uISZ69C16JOHUU8wHueTTL1NP0poYLZZMQZY0hk=;
  b=RYUadxQrHsThlc1Cq06Gkfi4QHBzATqzHI9hPeXPgrVI9NfivW+1EUAI
   wtGia0gT+j6Q8PjN74TDX8zAf5SUkrKrpHKhsN4fSV2KXd9JCwY50JgN4
   Npyaw1n9S5IWozaBAuJIIIcSafCXhjk+ksFO6Bz+RcUIjmGI8Us+qBH0B
   VldT+UGZjSw9qBEo2D8P6sTUGr8/j+WpM8j7By+p/sSduSze/SnSgAH94
   QHj5xyPl3bn+hQyPAlLcZL1hSjCcVlmOJNQ+n0jSOceJ73gMeLtP4Abc6
   BFDL7c6vSE8xy//u+h0uokX+ILYpNxT9q62ogoO9EVwUIPtib5mlnhlG1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="328666862"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="328666862"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 02:09:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="772125737"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="772125737"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2023 02:09:00 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pM4cN-0002h8-1Z;
	Sun, 29 Jan 2023 10:08:59 +0000
Date: Sun, 29 Jan 2023 18:08:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvdimm@lists.01.org
Subject: [nvdimm:libnvdimm-fixes 3/3] drivers/nvdimm/pfn_devs.c:16:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202301291846.or1ypEcc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git libnvdimm-fixes
head:   5109a9ab7c7d37b8037a9bc2167f58b058b8b2b8
commit: 5109a9ab7c7d37b8037a9bc2167f58b058b8b2b8 [3/3] nvdimm: Support sizeof(struct page) > MAX_STRUCT_PAGE_SIZE
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230129/202301291846.or1ypEcc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git/commit/?id=5109a9ab7c7d37b8037a9bc2167f58b058b8b2b8
        git remote add nvdimm https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git
        git fetch --no-tags nvdimm libnvdimm-fixes
        git checkout 5109a9ab7c7d37b8037a9bc2167f58b058b8b2b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvdimm/pfn_devs.c:16:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
      16 | const static bool page_struct_override = IS_ENABLED(CONFIG_NVDIMM_KMSAN);
         | ^~~~~


vim +/static +16 drivers/nvdimm/pfn_devs.c

    15	
  > 16	const static bool page_struct_override = IS_ENABLED(CONFIG_NVDIMM_KMSAN);
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
