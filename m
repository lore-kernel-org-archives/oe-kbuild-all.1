Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C284E1CF94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694680503; x=1726216503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LUGkJLg5b3ubSyaMpZmVDF1fYcq2ZIfLqxeL5EVcJ1g=;
  b=SsRpH0vzDpc7xe+PUc91mkVlFtbG8cNMwe1rRaz3TcN8q2OIWJ4SLBHh
   4CXOFfECwYmfY9teNHWb20e2ANObGbMxTEYb6sfbP/ZBcuXfKNgb8m8Wx
   eY/vZ88v8f+OOtb1Vrm4s25MX1py7RIF3KOAFLHn7xhmOSDvaJzAv0OmS
   ArTPFFQziLvd1NqgerzYRECtXuCAoY2m+z+gvTuALXq9deNru0N5a2sU+
   3Ejp6gMA64D4yki3X+hpB5qvAmJl5JmYKsWKe2B2/PzCcV/rhNyD9S6kz
   z7JIBtICA7bcESdN+dWxPbQaIJ4W0v4tcBOkxQLmhMJlocE3Y+CnPoBnu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363929611"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="363929611"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 01:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="859608176"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="859608176"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2023 01:35:01 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qghoR-0001Nc-39;
	Thu, 14 Sep 2023 08:34:59 +0000
Date: Thu, 14 Sep 2023 16:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 12/21]
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:33: warning: expecting prototype
 for struct _gsccs_client_ctx. Prototype was for struct gsccs_client_ctx
 instead
Message-ID: <202309141603.TjF05sQc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   594fd51eca94e00d5cd37eff668d762e9d613115
commit: 9b39a063a5855376413f556cf1911df355f502d1 [12/21] CHROMIUM: drm/i915/pxp/mtl: Add client resource management into GSCCS
config: x86_64-randconfig-004-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141603.TjF05sQc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141603.TjF05sQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141603.TjF05sQc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c:33: warning: expecting prototype for struct _gsccs_client_ctx. Prototype was for struct gsccs_client_ctx instead


vim +33 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c

    21	
    22	/**
    23	 * struct _gsccs_client_ctx
    24	 *
    25	 * We dont need to allocate multiple execution resources (above struct)
    26	 * for a single drm_client that is executing multiple PXP sessions.
    27	 * So we use a link list of nodes indexed by the drmclient handle
    28	 */
    29	struct gsccs_client_ctx {
    30		struct list_head link;
    31		struct gsccs_session_resources exec;
    32		struct drm_file *drmfile;
  > 33	};
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
