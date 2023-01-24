Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B747E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 04:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674534942; x=1706070942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjd2VDW+Qu+W/Qt64F5j7QCCR1XsiqXu7IQh6yn0HNg=;
  b=NVw4S1Xn5+GaTnEmAme+V5zRAmmIQmZc4AXLpDZYEBCT+4v1t2ebdI0n
   ADiVLxNjl5IGOYXKcBro3Slrs4i4lr8Sb8nW+3Xt0QhoNsq+i8OF/ppDC
   qsxnzwpYciUgFyH7YgHyNU5UM9nCsPXn5g+JonP+B5XMrBUdFJHMfLC+p
   DG1MxAP+ITfDJ1V1ZnhvlEJ0M0l7hfxwYNoc2O0HWWCnx6Brr3jSOT5zW
   sAwy5FVEmrcn8gTmMfzC57EWKke9RYBWlh2r217p9NiAtHR+/pWurjHpI
   yXKoSdsQ3BAoO3iBHAiXieXBgYdX0V9U2s+amW5dQuNrmPB/SMQfsZ9ae
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="314127273"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="314127273"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 20:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694209476"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="694209476"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Jan 2023 20:35:40 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKB23-00068a-0v;
	Tue, 24 Jan 2023 04:35:39 +0000
Date: Tue, 24 Jan 2023 12:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 22/30]
 arch/x86/coco/tdx/filter.c:21:13: warning: 'filter_overridden' defined but
 not used
Message-ID: <202301241209.AiSFYa3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   2eb6cd239352583e1275ed7d6e772e7bbc0343b0
commit: c28dbc3cf90d7c85d18cb4a8f79f4a18f5386e91 [22/30] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-randconfig-a004-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241209.AiSFYa3n-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/c28dbc3cf90d7c85d18cb4a8f79f4a18f5386e91
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout c28dbc3cf90d7c85d18cb4a8f79f4a18f5386e91
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/filter.c:21:13: warning: 'filter_overridden' defined but not used [-Wunused-variable]
      21 | static bool filter_overridden;
         |             ^~~~~~~~~~~~~~~~~


vim +/filter_overridden +21 arch/x86/coco/tdx/filter.c

    19	
    20	/* Set true if authorize_allow_devs is used */
  > 21	static bool filter_overridden;
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
