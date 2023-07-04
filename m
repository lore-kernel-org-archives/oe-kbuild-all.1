Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159F0181
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 02:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688439153; x=1719975153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2Xtbvehg4OzmQFse0WCA1lSRG68x1L3FGkpEGpBD5Y=;
  b=KpBs9DiDG2NTmOBSe4ByqFpM74rBcY+gMhdpJFWDyAsJPTJtgu0uaN1b
   QIv6zDH+H3l9rqUModkXepUBjrnSvhE+PHmUULiXf50efmp+qg/H1txnU
   nKkTWCSqmMsbfkubbUAlVtxARrYOO8Bb2LuVsCQqzEFjC/MRxv2QYgk8G
   D6GEcr4G0ra6ZAmyocqqveTX6ydNUHSuNEvmqX37U/js2cvzCrlZvawQs
   dAUDiNxNbTaMpjfdvQYmBCQyi19h6dF3nc47t/KVOMOGvaRy3FlQqUK6O
   ddWDqFpliZpQnDu1zAxB9k0OzMP8b8JzrgnoQMslaVr3w6nEX1f4HKI9j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="426701276"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="426701276"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 19:52:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="842831718"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="842831718"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Jul 2023 19:52:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGW9W-000Hox-0h;
	Tue, 04 Jul 2023 02:52:30 +0000
Date: Tue, 4 Jul 2023 10:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-07032023-yi 35/65] htmldocs:
 Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:549:
 WARNING: Inline strong start-string without end-string.
Message-ID: <202307041025.tJWlTDEv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-07032023-yi
head:   ac623a6f5d61ed4f4d90a3f835c668728b07ab95
commit: 8f8a22287657583146bc4fcde78a4d5cc3fa9033 [35/65] iommufd: Add data structure for Intel VT-d stage-1 cache invalidation
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307041025.tJWlTDEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307041025.tJWlTDEv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/userspace-api/iommufd:174: ./include/uapi/linux/iommufd.h:549: WARNING: Inline strong start-string without end-string.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
