Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538A20FC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 11:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675768680; x=1707304680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJxk3lDagmGHjk+YTkzylLFuIcTpY15uYtATCno8vMg=;
  b=jZ5YJW31326QgzVCKuucTal96Il0smbE/78AKq9WpuxG4Z48m3DxbCcl
   Oc9IqsEDsV4kU90iaHZX/PZoLkAVWug0OeaS440oPCNxLx2vRODZbiETq
   wgrP8bNKaG1HBV237VYhCffFO3ihA0f1rrS/ICicG1on0fErIhSnneZU/
   TX5IjGqzoheEPRvg95PhjNHdui8/UyIyiziYvAhKcN3TsnHK01q5tP+Df
   aDDeHUS0tdEsiKhgmTyckV3jdJ/uGsFz4962IoslcmaIAzH2qWFCcQKYl
   n8FTl2JjOQTxgTFOBl3gqe6Jms6oeInOzvK9FVhcV1HvADsxjmSVpVExp
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309812986"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="309812986"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 03:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="735518426"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="735518426"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2023 03:17:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPLz3-0003UQ-2H;
	Tue, 07 Feb 2023 11:17:57 +0000
Date: Tue, 7 Feb 2023 19:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-filter-upstream 23/31]
 arch/x86/coco/tdx/filter.c:21:13: warning: 'filter_overridden' defined but
 not used
Message-ID: <202302071948.kY6SLiNq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   fd61f2d2a82f5c0c284fa3f074bae5016c39e7bc
commit: 4f14697c74172d5614c9ee8f1d5a6c55dd9fdbbf [23/31] x86/tdx: Add a command line option to add new ACPI tables to the filter
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230207/202302071948.kY6SLiNq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/4f14697c74172d5614c9ee8f1d5a6c55dd9fdbbf
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 4f14697c74172d5614c9ee8f1d5a6c55dd9fdbbf
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
