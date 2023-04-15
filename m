Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949D10E8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681545636; x=1713081636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CA3uenHMu6R2IauDCoZbYSz/bQv3vZxsRlsXEKWZZ6c=;
  b=V+K5JeHLhRdLZjBMc2wq/pT+0gryqh+ZF5rSH7VgrYoY4Xkmhh65wx20
   2XMWi1vtZZ97ihDtlw9YL2m4sapdoQx0NnP+BVKPyOnwV9nvznTHRqJ9R
   AW3k2AtY48mUZUsZlaESS/F24dGueeuM1XkAz5r/B4+HxA/7QPRY/7SQi
   A4IoqTzLzFLEFolb5AYwd9iAZXYnrgDC6Bv8doWKpNAjTgGl4+zLx3X64
   lnVyivZOaRu57wXtrSuXHCbGTkwJ4eLpWta7d2e9TWoFrM2IsXHDa4Wxj
   2/tHrIc3HatGX/bxXzo467f3rBTEyDG0NYMf+y6JpSnLBVKdf3mBjzXZU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324974763"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324974763"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 01:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722744301"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="722744301"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Apr 2023 01:00:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnapZ-000aiZ-2E;
	Sat, 15 Apr 2023 08:00:21 +0000
Date: Sat, 15 Apr 2023 15:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 420/9838]
 ./usr/include/linux/mxc_v4l2.h:52:9: error: unknown type name 'uint32_t'
Message-ID: <202304151507.80Ynnpbf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 317b1cf90ab94b50bef4c49148f8726aa1e42ea1 [420/9838] media: capture: add mxc v4l2 capture driver
config: x86_64-randconfig-a014-20230410 (https://download.01.org/0day-ci/archive/20230415/202304151507.80Ynnpbf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/317b1cf90ab94b50bef4c49148f8726aa1e42ea1
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 317b1cf90ab94b50bef4c49148f8726aa1e42ea1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151507.80Ynnpbf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/mxc_v4l2.h:52:9: error: unknown type name 'uint32_t'
      52 |         uint32_t u_offset;
         |         ^~~~~~~~
   ./usr/include/linux/mxc_v4l2.h:53:9: error: unknown type name 'uint32_t'
      53 |         uint32_t v_offset;
         |         ^~~~~~~~
>> ./usr/include/linux/mxc_v4l2.h:57:9: error: unknown type name '__u32'
      57 |         __u32                   type;   /* enum v4l2_buf_type */
         |         ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
