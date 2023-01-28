Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D43A3C0B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 09:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674897569; x=1706433569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GVkFWyIFZyRuaRyCHcCfTgVVzC0XccS2Uz+UtiUvK3A=;
  b=ktGjQw3ybKe8VB4bqho71cc6sXfRiUISyNk+FYVVkq7oBdheZhXHy3XO
   H0PO3Hb34AFl/P07RpFkimUkAmSY8qMzsyN3/3DlBsJ3v9RcYN5liuG3E
   hVlJK9h9KOW+hVOPl1F8/iwEko8TlSAR4FatHaMNxY36TWfkJlh/Loy1i
   NkXGWPPVUr9GAUCEaNzyGPI4SUJpZt+7Hqt+KYvj2I2BoBbp/y4uO/+aC
   dEfJTTrdgiTuqTJRWJ1cbd2X7amFOpF9Z0zOdYLk98BGGwCntXutQUjk0
   Km6y905euFbZdm2V8W4CS8Zil3oW0lkVg4u6IBTqoni6IfK9CQCxxXgcm
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="391831892"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="391831892"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 01:19:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="693985708"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="693985708"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Jan 2023 01:19:25 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLhMq-0000Y9-1P;
	Sat, 28 Jan 2023 09:19:24 +0000
Date: Sat, 28 Jan 2023 17:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.3/cxl-ram-region 17/18] ERROR: modpost:
 "cxl_add_to_region" [drivers/cxl/cxl_port.ko] undefined!
Message-ID: <202301281707.ZLMJGwlz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.3/cxl-ram-region
head:   a7cf664d7e997ac36b0f466af2e2be33464ab598
commit: 3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f [17/18] cxl/region: Add region autodiscovery
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230128/202301281707.ZLMJGwlz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.3/cxl-ram-region
        git checkout 3c6c8594f9a2bcb4af19bc8de669ed43834b8d7f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "is_endpoint_decoder" [drivers/cxl/cxl_port.ko] undefined!
>> ERROR: modpost: "cxl_add_to_region" [drivers/cxl/cxl_port.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
