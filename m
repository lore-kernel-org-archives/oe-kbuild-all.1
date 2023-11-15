Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0960D3307F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Nov 2023 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlB2rGyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700066740; x=1731602740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lhoms/6MzKOt/nEMJDiadUKivpQUnscvc2mgAVMXAaw=;
  b=DlB2rGyhkgF6DfbRt1lrESjR9m1q37eXZTyRagu+8MSJbo3mz4Au/WR6
   UtYyPEtC6/Vg0RbAr30BaAxlElMinRk7ps3sLgXLzvULWfk17LwyZ4082
   MbMzydXj3/CVcb35H9WuLM7Y4KEFlnQyzvMFe97lSyvN7x+SFe8RulgHF
   pBUrkohhnVXUMxWiebvrEooN133wZnhovN8O8NkP6+wjItf/LMaF3FDst
   IxwC9xnvILCHrfmslMThb+RSl/aEuqX41Ucipuj1QtzODdRrzCk0zcbSa
   HM7wkEG4/KINvKgBmO2z+fnvYeKBPBKvWNcPNFMreCZarlPwxkqmIxyxc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="4028678"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="4028678"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 08:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096498468"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="1096498468"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2023 08:45:37 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3J1D-0000Zw-1A;
	Wed, 15 Nov 2023 16:45:35 +0000
Date: Thu, 16 Nov 2023 00:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Animesh Manna <animesh.manna@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arun R Murthy <arun.r.murthy@intel.com>
Subject: [linux-next:master 806/1493]
 drivers/gpu/drm/i915/display/intel_psr.c:1322 _psr_compute_config() warn:
 always true condition '(entry_setup_frames >= 0) => (0-255 >= 0)'
Message-ID: <202311160000.dwlz2mPL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc962b35b139dd52319e6fc0f4bab00593bf38c9
commit: b8cf5b5d266ec20e1ab90f38c8d779c669c2d219 [806/1493] drm/i915/panelreplay: Initializaton and compute config for panel replay
config: i386-randconfig-141-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160000.dwlz2mPL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160000.dwlz2mPL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311160000.dwlz2mPL-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:1322 _psr_compute_config() warn: always true condition '(entry_setup_frames >= 0) => (0-255 >= 0)'

Old smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:976 tgl_dc3co_exitline_compute_config() warn: ignoring unreachable code.
drivers/gpu/drm/i915/display/intel_psr.c:1141 intel_psr_entry_setup_frames() warn: signedness bug returning '(-62)'
drivers/gpu/drm/i915/display/intel_psr.c:1156 intel_psr_entry_setup_frames() warn: signedness bug returning '(-62)'
drivers/gpu/drm/i915/display/intel_psr.c:2921 intel_psr_short_pulse() error: uninitialized symbol 'error_status'.
drivers/gpu/drm/i915/display/intel_psr.c:2926 intel_psr_short_pulse() error: uninitialized symbol 'error_status'.
drivers/gpu/drm/i915/display/intel_psr.c:3278 i915_psr_sink_status_show() error: uninitialized symbol 'error_status'.

vim +1322 drivers/gpu/drm/i915/display/intel_psr.c

  1302	
  1303	static bool _psr_compute_config(struct intel_dp *intel_dp,
  1304					struct intel_crtc_state *crtc_state)
  1305	{
  1306		struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
  1307		const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
  1308		u8 entry_setup_frames;
  1309	
  1310		/*
  1311		 * Current PSR panels don't work reliably with VRR enabled
  1312		 * So if VRR is enabled, do not enable PSR.
  1313		 */
  1314		if (crtc_state->vrr.enable)
  1315			return false;
  1316	
  1317		if (!CAN_PSR(intel_dp))
  1318			return false;
  1319	
  1320		entry_setup_frames = intel_psr_entry_setup_frames(intel_dp, adjusted_mode);
  1321	
> 1322		if (entry_setup_frames >= 0) {
  1323			intel_dp->psr.entry_setup_frames = entry_setup_frames;
  1324		} else {
  1325			drm_dbg_kms(&dev_priv->drm,
  1326				    "PSR condition failed: PSR setup timing not met\n");
  1327			return false;
  1328		}
  1329	
  1330		return true;
  1331	}
  1332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
