Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BBE15AFC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 23:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688687027; x=1720223027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdscaogceTSfdSXbA6oMh5HdLl29T2m7yxLoocSa7z4=;
  b=F2FpZA5xdC6u1clwJ7C708SsO6kWAYU61jTOD6R7FFAffZS19S/NEMec
   rxAaK9NmzxjWt5Uus4D4KezgSOHr8QB/uWZCzyTuGxT5J4yuTTo/hmJJu
   NkT2GeXCjx7GHRmsTHpbhpSj25lc21dFfdlBY5/E6RtRjKnpFT+0uc689
   MMzUYJ6M0SxTPyg8BULb5Nhpp8fDI+UpvoKVbu+JaT+GHZVSS4VgAugbD
   /DXGUSu8ZH29kKfqkuazA8RrnPpBsT2ESLl5LM9OAhBe7UM9bqWBa51pa
   gEQ/lidgHA1T88BRpH1f3AUGapJJFK/Rv+6MkAbfWnNUOjN6+AAqYmPxp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="343341674"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="343341674"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 16:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="809827058"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="809827058"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2023 16:43:45 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHYdU-0001bs-1S;
	Thu, 06 Jul 2023 23:43:44 +0000
Date: Fri, 7 Jul 2023 07:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 4/4]
 kernel/module/gki_module.c:31:6: warning: no previous prototype for
 'gki_is_module_unprotected_symbol'
Message-ID: <202307070742.F5P6MoSt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   6e0d346f0e2fae199233996745f8dfc03364841b
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [4/4] ANDROID: GKI: Add module load time symbol protection
config: arm-randconfig-r023-20230707 (https://download.01.org/0day-ci/archive/20230707/202307070742.F5P6MoSt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070742.F5P6MoSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070742.F5P6MoSt-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> kernel/module/gki_module.c:31:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> ERROR: modpost: "vmf_insert_pfn" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!
>> ERROR: modpost: "vmf_insert_pfn_prot" [drivers/gpu/drm/ttm/ttm.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && DRM [=m]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
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
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
   Selected by [m]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=m]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


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
