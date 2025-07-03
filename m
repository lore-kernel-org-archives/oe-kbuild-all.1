Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8732D661D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 23:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584462; cv=none; b=RxIuzyrQPqgKsIZj0XHUQJYPjKq4CKm9t68Vsbj9sHla+o9FeRK+SXHzzEKgZVW6JEt7XCjD/9qXCUKrOWQxPFnJS4ZDTMKUtK2ABmb3OBYj7zZZ3L2Mv4EcVk1zyl5AODZjUR9dEZL+A5MKnKJGNAX9vF8MAPLsyggwUNiaDd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584462; c=relaxed/simple;
	bh=zGZ0pXyv5IgTa0BQTZwoamf/Y4MnfO2nnBzi2uo1C7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crQ9tf1ZUsxKdgD2bnjfkTvug4uB7PeHOLWGRytDt6swkMVlCm2jSFmLxuEnYl7kPjusexn6Y2mSmb1uqdBqtvNV5DmiPFGCh+1XLtQ8HRExpVZK6saMb+F7dktSdtKj8imYOkxaRjG8wHYvVxuImle6edAvOPu+k5WJu3UKtPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=neLWlsbK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="neLWlsbK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751584461; x=1783120461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zGZ0pXyv5IgTa0BQTZwoamf/Y4MnfO2nnBzi2uo1C7E=;
  b=neLWlsbK57MNFwPOOyTNpF6bxJ55mjNHdKiDUZvyZ+5lY2wWkhCrRfXq
   KgFN84RUERzyHewsNkIg275eT8DsPgBsISYv+M75b8xjzbcW1qDl3cMQj
   jV/P9z8UTVYx7AwURZhC7BaN7VsYcK3s3G76PDYZKj3YMHOhynC+HclZ7
   bEaaScKegq43CNvHegj0JqPvKQv3dnFenV6zZplgXROeW+yjlSEIN5JAg
   LvKG8Erc5PVx5T2DexxFGIr48AoiP+tCTnIdB3o5vuHNMtxgeyVQooOLX
   n+K0HgtxI4EewUQp3Mp+MkckBzyXpiPeGbirKcXeIHmqzsUHwKEpP1gQy
   A==;
X-CSE-ConnectionGUID: 0pgcLwPhSOeLTOT91IRdjw==
X-CSE-MsgGUID: feitmBoeTd6LvWr3SW3pfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64975610"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="64975610"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 16:14:21 -0700
X-CSE-ConnectionGUID: Ea+UynGqQXOB4SLWehKH6A==
X-CSE-MsgGUID: GycfcAz2Rka3Be3qdUfMzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="159052503"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2025 16:14:19 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXT8D-0000Xx-0r;
	Thu, 03 Jul 2025 23:14:17 +0000
Date: Fri, 4 Jul 2025 01:14:09 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-11 0/15]
 kernel/module/gki_module.c:31:6: warning: no previous prototype for
 'gki_is_module_unprotected_symbol'
Message-ID: <202507040148.xhwchNST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-11
head:   1d873e4aee8bf3c96dbb4222ecf206afe52c6c81
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [0/15] ANDROID: GKI: Add module load time symbol protection
config: i386-buildonly-randconfig-2001-20250701 (https://download.01.org/0day-ci/archive/20250704/202507040148.xhwchNST-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040148.xhwchNST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040148.xhwchNST-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:31:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/module/gki_module.c

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
