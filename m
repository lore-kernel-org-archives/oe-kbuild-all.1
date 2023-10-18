Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1964311C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 03:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyWvswcy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697598878; x=1729134878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RFdegzCEt8URtrRM0wztYKDqppOmOCATldAg1ZnFHu0=;
  b=XyWvswcyMZmYJjjEeFQ7g5RZNrxChuVhOQwfrR7sMLEXrZjArbCyn5oC
   MfMxWDRmHZ9MvonAy3zYq2rXirV6BERbQBAcWKoZ0FL/+x+K+wI4D+0th
   x0bqyjIvgsVOVIO5KcsX7xcUojCPslTjdMNr3FGIu3WTsxWgvhUQfIpBl
   VtiDWwQotU5fMp4d8dtsKG7rEal+HuxrX6BdwWDzOjtJKwtsA5LXtB0sl
   R1UIBpJ1fgC4ANLqymGkcNNtZqlHxZzaSZ8rqGZVKQpRDoHF6dCTLzB7c
   bo3BJDonS2AxbUs5IuidbV2jeEkjpYhZw6b9eF6u/QJLOai9a1g+w28wG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389802703"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="389802703"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 20:14:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="929994107"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="929994107"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Oct 2023 20:14:35 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsx0z-000ARd-1L;
	Wed, 18 Oct 2023 03:14:33 +0000
Date: Wed, 18 Oct 2023 11:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Wyes Karny <wyes.karny@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>
Subject: include/linux/amd-pstate.h:87:27: warning: 'amd_pstate_mode_string'
 defined but not used
Message-ID: <202310181119.Ws0iO2pZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wyes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06dc10eae55b5ceabfef287a7e5f16ceea204aa0
commit: 36c5014e5460963ad7766487c0e22a7ff28681fc cpufreq: amd-pstate: optimize driver working mode selection in amd_pstate_param()
date:   9 months ago
config: x86_64-randconfig-002-20231010 (https://download.01.org/0day-ci/archive/20231018/202310181119.Ws0iO2pZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181119.Ws0iO2pZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181119.Ws0iO2pZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cpufreq/amd-pstate-ut.c:29:
>> include/linux/amd-pstate.h:87:27: warning: 'amd_pstate_mode_string' defined but not used [-Wunused-const-variable=]
      87 | static const char * const amd_pstate_mode_string[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~~~


vim +/amd_pstate_mode_string +87 include/linux/amd-pstate.h

    86	
  > 87	static const char * const amd_pstate_mode_string[] = {
    88		[AMD_PSTATE_DISABLE]     = "disable",
    89		[AMD_PSTATE_PASSIVE]     = "passive",
    90		[AMD_PSTATE_ACTIVE]      = "active",
    91		NULL,
    92	};
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
