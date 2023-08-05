Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B2617C6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 06:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691215399; x=1722751399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pltRxQ6cU3putiA5srH62jZG7cpH1HZ0jbnjc5sZqfs=;
  b=XAzkHmAeLDjUkZVEnDoj5XHyj54rUggdTfylnug1gBFvpvMeZwEjbUQJ
   rnqaLh9e5B3E/dQkcZJhe0RbjTg0C3+6+h0ZP991bkJ+LNLy5hUqDYHh4
   gE6V1mCtv/0KxtsA+7pA1zluorWc9GjpHwcodt2NDmr1cpUaTrmXcUdtN
   iyJWB3+DfpVXRkXZJegPw8MycpP2sc60m71VEX/j5HNKR9lEAO+V3/QtU
   6QYStmLViTXqGr5pO54UybKT1scmzSFsfLAmaMl8Be60FUtFYXNcVw3mU
   e+k4xq5bcLaSFjhu/skU7l5XFK+ob2jJIiCJSmD8PeVSOF7gR6V1dI9j6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350602224"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="350602224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 23:03:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873650884"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2023 23:03:19 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSANg-0003LX-0z;
	Sat, 05 Aug 2023 06:03:16 +0000
Date: Sat, 5 Aug 2023 14:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 1/8] drivers/hv/hv_common.c:505:13: warning: no
 previous prototype for 'hv_isolation_type_en_snp'
Message-ID: <202308051318.55zX020S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   3a5274c555c28bd6906103b0d9bbfd6e9e9df1ff
commit: b1ddc84577bc7ca5f72239e6e58b1ec9f4877a4f [1/8] x86/hyperv: Add sev-snp enlightened guest static key
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308051318.55zX020S-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051318.55zX020S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051318.55zX020S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/hv_common.c:505:13: warning: no previous prototype for 'hv_isolation_type_en_snp' [-Wmissing-prototypes]
     505 | bool __weak hv_isolation_type_en_snp(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/hv_isolation_type_en_snp +505 drivers/hv/hv_common.c

   504	
 > 505	bool __weak hv_isolation_type_en_snp(void)
   506	{
   507		return false;
   508	}
   509	EXPORT_SYMBOL_GPL(hv_isolation_type_en_snp);
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
