Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442426E0F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 11:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695728494; x=1727264494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pVXMbpmgn6C1a+8SE2RpNNc5I8xa5hXFdjGuUcE1pLk=;
  b=nZ60/qmbFeAKrOUal69CUxHVPshMgquiDE8ZSmz2J0apei3iYNkQWO7y
   dmZcafd+QJy5irbsaVFpqCtU11iKWvem3nCjWwQx1tP6qbUNexsEHEfTZ
   l9pueIcecjlvGD+o9yJdyoR7O9TiiQjPB2TpKp9n/OOOKZsUYnJ/Ft2Ma
   Sh1g6i6uj6MXZ67sbyoU+3X2Ha/nVYoz6WpMzlrcwYZiBfCSzCX+2+UNz
   xKhLQaqMFagF+vr9jRPEOm+A92Oa8jJCDqfiWJM8n2Aom/JgD3yBQ0v98
   y0DUZyr/x31H/zXUehKFcIbkKZa3r47MTd3c6oPskDuxCLAzXM+7mD6e/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361789060"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="361789060"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 04:41:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="872468491"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="872468491"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Sep 2023 04:41:31 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql6RV-0002lj-36;
	Tue, 26 Sep 2023 11:41:29 +0000
Date: Tue, 26 Sep 2023 19:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5k 28/28] lib/dynamic_debug.c:1330:6: sparse: sparse:
 symbol 'dd_store_func_range' was not declared. Should it be static?
Message-ID: <202309261915.7BTiobUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5k
head:   eac2af73427b308c426b03a2ad349d76e7daa5c7
commit: eac2af73427b308c426b03a2ad349d76e7daa5c7 [28/28] dyndbg: WIP insert _ddebug_site fields into a maple-tree
config: i386-randconfig-062-20230925 (https://download.01.org/0day-ci/archive/20230926/202309261915.7BTiobUu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309261915.7BTiobUu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309261915.7BTiobUu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:1330:6: sparse: sparse: symbol 'dd_store_func_range' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
