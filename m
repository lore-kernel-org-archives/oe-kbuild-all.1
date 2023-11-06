Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5745218D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 00:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BExwYKCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699230189; x=1730766189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l1QN/XVCeZEFV5qqwN1dg5cfHIzRRjwrrwRSrhHGf3w=;
  b=BExwYKCoD/Gg4hINukeCQWYskDBUShDdSPQ3hqeAS6K/6TZw4FQ7dlw3
   5FQ5qJ/16TrtZEDgrUaFhoqy9JVsw02jLrBeT1bkMc2pOm69WUqyYpCM1
   g+AQENPGdsSIBWyNWCgosjDKUBQgJo72gOvGLaj4oi8OpjwhynmeZB0TK
   Z9qvrBC90A0IfQBTFCi6HQPcXllU/+5hVa+yNLJ2xHMJosBkYnDhqfT7A
   fVt+CNf3VMaFRA/l2QbtRgId5o54iPcISvYQ+StJt3oC4cLcHrIVMp2ng
   XjVBB3ZAtNhGz+DEDBtcn/kIFr2d3MTWd2JMXYZc6xginx3vx3TdD/Snh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="453495155"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="453495155"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 16:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="832565016"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="832565016"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2023 16:23:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qznOT-0005up-1C;
	Mon, 06 Nov 2023 00:23:05 +0000
Date: Mon, 6 Nov 2023 08:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 21/22] mm/swap_slots.c:95:6: warning:
 no previous prototype for 'is_swap_slot_cache_enabled'
Message-ID: <202311060845.Mo04oQwR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f40707abde2eb5cd21cf8848f33aefb7e394ad1a
commit: e064059673798b931f95f724c7e377fa8cd15df7 [21/22] ANDROID: create and export is_swap_slot_cache_enabled
config: i386-buildonly-randconfig-004-20231101 (https://download.01.org/0day-ci/archive/20231106/202311060845.Mo04oQwR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060845.Mo04oQwR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060845.Mo04oQwR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swap_slots.c:95:6: warning: no previous prototype for 'is_swap_slot_cache_enabled' [-Wmissing-prototypes]
      95 | bool is_swap_slot_cache_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/swap_slots.c:101:6: warning: no previous prototype for 'check_cache_active' [-Wmissing-prototypes]
     101 | bool check_cache_active(void)
         |      ^~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +/is_swap_slot_cache_enabled +95 mm/swap_slots.c

    94	
  > 95	bool is_swap_slot_cache_enabled(void)
    96	{
    97		return swap_slot_cache_enabled;
    98	}
    99	EXPORT_SYMBOL_GPL(is_swap_slot_cache_enabled);
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
