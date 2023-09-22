Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4D200A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 11:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695382906; x=1726918906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+NYi9rqvqX3GEniqVYKz6diT0ojaoGhw1W877HBlfk=;
  b=djslisKe+i8kML6PgrJFIRIyQEN3wmHg0qvds45nG3uNmpw6XFHDkeFC
   W4Cuw9yb1+OdNV4V1CPKWJnliyobDr9pTUd1j6Orq/rO9uEZSTyNBClUx
   Hbu4eRYCdtNkK/47YOqyIDq/6DJZb5W3i8Wmdj88dA1t+t8E7EwmlsHg8
   +XDRTSkDUKBLUwIQSrklBwrMVkNiQbYmK01+HxT+jdiWKDE7nrA3PMAap
   CR6lbhAM024G8WRjo64O7GqdTjn6IQkJE1k5425d5zi/hEAQlDtXP1LKX
   vgeZHBmxkJArqFk64i+GQLyDQ01AUKLZX/JHWLvTCsCOMiNI4jWcSkdKg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384643597"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="384643597"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 04:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="871216860"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="871216860"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Sep 2023 04:41:44 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjeXV-0000d7-2c;
	Fri, 22 Sep 2023 11:41:41 +0000
Date: Fri, 22 Sep 2023 19:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 6443/6975] htmldocs:
 Documentation/gpu/amdgpu/thermal:43:
 ./drivers/gpu/drm/amd/pm/amdgpu_pm.c:988: WARNING: Unexpected indentation.
Message-ID: <202309221945.uwcQ56zg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: 615585d09b33e609bef5eb7986f5df2b4e053ac3 [6443/6975] Documentation/amdgpu: Modify pp_dpm_*clk details
reproduce: (https://download.01.org/0day-ci/archive/20230922/202309221945.uwcQ56zg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221945.uwcQ56zg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/amdgpu/thermal:43: ./drivers/gpu/drm/amd/pm/amdgpu_pm.c:988: WARNING: Unexpected indentation.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
