Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B39ED311
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 05:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678081071; x=1709617071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=grd/413uoPqrBlGcxSXEDm1OeROARSPVbh4KKK1O+zM=;
  b=Qymft3D0QqZKaZx/mAqdgXE0qaOmTWtsEmzj0Lnf8QoWuSFXhrnn/ttU
   PE8nJnz/qe8BTDDrF7NqVJBD0zdYe/l1ssRQnRf/cJWpX9dOz97SweU7d
   FoFqeL61pZmRMTCaPKIteZq4K14RCZkLjUjm9HX2yGBHkATss2Oq0GIei
   5FLGVrQnebx2tl0PURB2IGavAS8BpU83AjewinmifJ67IxFzMpamBv3yQ
   w0zSP10oCVmGnaX6OU3yW49VP365fOvqsYtb6DCXcd5YLOfgHRKIgskJ6
   CMLesKSlvL8NKvIbq1WQHeEonZEzzMLSUA//tTnPW/r49GwF2v7FyX2Y9
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="398058538"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="398058538"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 21:37:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="850177337"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="850177337"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Mar 2023 21:37:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ3Xg-00003r-1g;
	Mon, 06 Mar 2023 05:37:48 +0000
Date: Mon, 6 Mar 2023 13:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 23/31]
 arch/x86/coco/tdx/filter.c:21:13: warning: 'filter_overridden' defined but
 not used
Message-ID: <202303061353.PLJV99Nn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   2a65ce7abb22ae45b4be1299bbd9eb72534827eb
commit: 313c0b6ca9f8a5039397575b18226ded8573e358 [23/31] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230306/202303061353.PLJV99Nn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/313c0b6ca9f8a5039397575b18226ded8573e358
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 313c0b6ca9f8a5039397575b18226ded8573e358
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061353.PLJV99Nn-lkp@intel.com/

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
