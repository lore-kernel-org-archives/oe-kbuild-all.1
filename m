Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE210F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jan 2024 01:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8Z8zEqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704245798; x=1735781798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KSW0tJg8iMNBTwp05zYDM/MukqKZ3B/bHhaIbS89UDE=;
  b=X8Z8zEqmcRRX3yKEdPgdx7FBSCfXK8tdBgpo8IOBIQUC7x7Q8961+/QX
   mx6o0xxWeCU4rTElauzXNGfei+gOWg3HN3Bd6tq4EnEk16M8REe9sIrUW
   oA1OYbI1pu4XIzJxtgqP50svf0e8jLKT/vjACSL01J8RgRgs8F15T0hPO
   RdWTmMuBfBXD7Vz7NNIA4U52JBvDVJo6hPUW5yGYzhE1eRbw8gfsG2r8w
   qCadwOjTfUzEye7PCYB6FHuFz3E0eCcFNMjTED9DUioPno3yaY8mC1hyb
   NPFlydts+w1TOUTBMxzGDU0RY0YYHSu0F8jsuTaXoATGBXOFmfYvyV7fK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3782770"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="3782770"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 17:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953078454"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="953078454"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Jan 2024 17:36:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKqBM-000Lc4-2B;
	Wed, 03 Jan 2024 01:36:33 +0000
Date: Wed, 3 Jan 2024 09:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 7/9]
 drivers/gpu/drm/evdi/evdi_connector.c:54:6: warning: no previous prototype
 for function 'is_lowest_frequency_mode_of_given_resolution'
Message-ID: <202401030928.FI19QTVs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   350ced6ff13d0f43fb3ee0de43f7d3eae197bda2
commit: 350ced6ff13d0f43fb3ee0de43f7d3eae197bda2 [7/9] CHROMIUM: drm/evdi: Fix 2k monitor is not supported regression
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240103/202401030928.FI19QTVs-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240103/202401030928.FI19QTVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401030928.FI19QTVs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/evdi/evdi_connector.c:54:6: warning: no previous prototype for function 'is_lowest_frequency_mode_of_given_resolution' [-Wmissing-prototypes]
      54 | bool is_lowest_frequency_mode_of_given_resolution(
         |      ^
   drivers/gpu/drm/evdi/evdi_connector.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | bool is_lowest_frequency_mode_of_given_resolution(
         | ^
         | static 
   1 warning generated.


vim +/is_lowest_frequency_mode_of_given_resolution +54 drivers/gpu/drm/evdi/evdi_connector.c

    53	
  > 54	bool is_lowest_frequency_mode_of_given_resolution(
    55		struct drm_connector *connector, struct drm_display_mode *mode)
    56	{
    57		struct drm_display_mode *modeptr;
    58	
    59		list_for_each_entry(modeptr, &(connector->modes), head) {
    60			if (modeptr->hdisplay == mode->hdisplay &&
    61				modeptr->vdisplay == mode->vdisplay &&
    62				drm_mode_vrefresh(modeptr) < drm_mode_vrefresh(mode)) {
    63				return false;
    64			}
    65		}
    66		return true;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
