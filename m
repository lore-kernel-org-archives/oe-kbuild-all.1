Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5090254723
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777209458; cv=none; b=B1LyKPYSZVuJuvraNw/Ni7k+7YBt6+wdy9NLp27/QDX6rHaeUYvh2RhWny6XNMv+uYL7DIaVCWChWQDNiUE1fxzvojkQqpjGj6UYIBOMd64C2iIhPV2q+Fj/EzcIk11rpKaY/R0zKoGf6KXtWPG3M2SsVIIBAe+8ZFeZuFraYbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777209458; c=relaxed/simple;
	bh=+TLm8XKvmp0g04S9Klba/93EACScFIzlzsP4wJXilOU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=As4rpdlBmhWSj1Z6RdvlLSMKWpIcPfWLuAml3QsmWOxVXoemwC+76oXKOWmhCdnuNXzgI2oOsfx2JH/d8457RXo/gN1E5EssRBKgoUMgeCeWIEp8COBbCPqMoGzqITfxBKFAjFW0/LkNt9PhX0ulxNZR95GndDxIQqoJ/FNQQA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxhyDgwS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxhyDgwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777209457; x=1808745457;
  h=date:from:to:cc:subject:message-id;
  bh=+TLm8XKvmp0g04S9Klba/93EACScFIzlzsP4wJXilOU=;
  b=SxhyDgwSh7aRlu3SwyTLKg3o4djN9+QF5gSNLF/lv+kTKjRxNRGAGDer
   Co0uiPqV7Lapih50WBMSTuOkdutSG6WkzpYtzqBuCzAGyK+IAgQflhg+R
   piNkgru+7BNOWWwZDEN/TvyuHLDCtnp3jSAo6KmGS26+8loidUOP6LfRp
   cFXXYUDxKoRCuq/HGGKpsvDA0M7W3dPJd5MKlaN3fYMSQKI8E+gkdDzSl
   TH1Jm5K/m84TylX5WOu2TYDADrmcK/vKqQrn/jxNk/3pFHgy/JEgGhWq1
   2I67k4BclL9Hxktygoj04VeQYrbIucyc/WC99Qno/jvxcZLpI7qT7A8XE
   A==;
X-CSE-ConnectionGUID: q1DUiWpOQhmNDhvoGkQoCQ==
X-CSE-MsgGUID: 9L6Ni7EAS2SA9bppdG45fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77992319"
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="77992319"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 06:17:36 -0700
X-CSE-ConnectionGUID: kLjwSRqpS5OWTBeRWiaz9A==
X-CSE-MsgGUID: rv6k7Qz5QAyZYLETrqA2vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,200,1770624000"; 
   d="scan'208";a="271528165"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Apr 2026 06:17:34 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGzMZ-000000007tx-377J;
	Sun, 26 Apr 2026 13:17:31 +0000
Date: Sun, 26 Apr 2026 21:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 kernel/gki_module.c:31:6: warning: no previous prototype for
 'gki_is_module_unprotected_symbol'
Message-ID: <202604262139.0wDkt646-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   6f2622d53d94b55352e8afd862a6d0b829b8ccd4
commit: e7451150cb701de01d6b836c496e1bd012d885cd [0/1] ANDROID: GKI: Add module load time symbol protection
config: x86_64-buildonly-randconfig-003-20260425 (https://download.01.org/0day-ci/archive/20260426/202604262139.0wDkt646-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604262139.0wDkt646-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604262139.0wDkt646-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:31:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
