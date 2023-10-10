Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A93A63A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 05:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ioGF6sLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696916355; x=1728452355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=32aclSqdpg/4BlHiPHIAr4JEZ8uFQMSf/ZGEZDWsvbQ=;
  b=ioGF6sLIrE9VXy6PIC7GR5IchBMJLl13PuApamOLayoyvrsCvgElCbRc
   NYxuwS37efWL9GfF05linXwAnTyV1pWkT5YjPEGTit00AkV7FszYbDegQ
   JRJQtGjRu5wk4wf6nJmIjn6NoGy0Qg/X89YOhYdw2LmXSeLECCIiEwOyJ
   0pvX7UDEhE96nQuF9Qo8DjEOmY5R0yYl2jcoooa6aX91wC4JACFzmLq51
   qRGBtGCsDquiEqILDNN4N60C6K5UR/f7WRaJx3qDJLNf+U9yQmomb/T3V
   QZJGLNIsb7ld5v+CRo64VW3BLCybOC3NewIoTPW9Udh1iIAg7GN+VQG1M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384172641"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="384172641"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 22:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703182590"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="703182590"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Oct 2023 22:39:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq5SV-00001x-0t;
	Tue, 10 Oct 2023 05:39:07 +0000
Date: Tue, 10 Oct 2023 13:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1786/23612] ld:
 decompress_unzstd.c:undefined reference to `ZSTD_DStreamWorkspaceBound'
Message-ID: <202310101357.oKFGTQRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   46a1c28f3732ea10c416ed79a7d5b8eedb4b6df1
commit: 95a43fc99f147282c64e68baf1ea18041c7755ea [1786/23612] ANDROID: Incremental fs: Add zstd compression support
config: i386-buildonly-randconfig-005-20231010 (https://download.01.org/0day-ci/archive/20231010/202310101357.oKFGTQRs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101357.oKFGTQRs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101357.oKFGTQRs-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: lib/decompress_unzstd.o: in function `__unzstd.constprop.0':
>> decompress_unzstd.c:(.init.text+0x9d): undefined reference to `ZSTD_DCtxWorkspaceBound'
>> ld: decompress_unzstd.c:(.init.text+0xae): undefined reference to `ZSTD_initDCtx'
>> ld: decompress_unzstd.c:(.init.text+0xcb): undefined reference to `ZSTD_findFrameCompressedSize'
>> ld: decompress_unzstd.c:(.init.text+0xec): undefined reference to `ZSTD_decompressDCtx'
>> ld: decompress_unzstd.c:(.init.text+0x1e7): undefined reference to `ZSTD_getFrameParams'
>> ld: decompress_unzstd.c:(.init.text+0x26a): undefined reference to `ZSTD_DStreamWorkspaceBound'
>> ld: decompress_unzstd.c:(.init.text+0x280): undefined reference to `ZSTD_initDStream'
>> ld: decompress_unzstd.c:(.init.text+0x301): undefined reference to `ZSTD_decompressStream'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
