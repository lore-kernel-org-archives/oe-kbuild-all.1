Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5823CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 06:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694413179; x=1725949179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0suqW0vzaBvr35Tc57McjmbqsvwRtL5AHpwCsKCekmo=;
  b=UcXMYjPrEWAUZC/G6KtQPBD5uglYZpZfg1GmazljYNjXriOvDZzciClY
   3Dbnsg4SmuKx95ybhKCdYxs0/+xLYya36n7S6wxCgXxonIytY7MNF4Zok
   8XMnZrCXFY8+MGteeYn7eKHD/HO8z52VFMFYMlqhJr9ToRsDWZbLoXx0M
   2qHA3mSztvk6C0nBF5NTr0s3SXpBm2D0jlKS6SyNxUQHovVuSIullvJbt
   UJx7VPCAOSZoQvNt4TBEMdgtJ/IVANxF6JeZLIg+Lu9WavuFOsAregwqK
   MERbXh5pdvK1uKDOQpFYJFjauNQKgmq2z2CmLDZYH0rqoxODRrasK7fLA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="377920496"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="377920496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 23:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="989969360"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="989969360"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Sep 2023 23:19:37 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfaGk-0005sy-2o;
	Mon, 11 Sep 2023 06:19:34 +0000
Date: Mon, 11 Sep 2023 14:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 867/28405] jack.c:undefined reference
 to `input_set_capability'
Message-ID: <202309111432.j3mUALIW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   37d958fa8871b14db29738088a29b16c40f05ba1
commit: 1e702f432d551041753c46ec0d6d49484e776441 [867/28405] ANDROID: GKI: Added missing SND configs
config: i386-buildonly-randconfig-006-20230908 (https://download.01.org/0day-ci/archive/20230911/202309111432.j3mUALIW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111432.j3mUALIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111432.j3mUALIW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: sound/core/jack.o: in function `snd_jack_dev_register':
>> jack.c:(.text+0xae): undefined reference to `input_set_capability'
>> ld: jack.c:(.text+0xbc): undefined reference to `input_register_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
>> jack.c:(.text+0xec): undefined reference to `input_unregister_device'
>> ld: jack.c:(.text+0xf3): undefined reference to `input_free_device'
   ld: sound/core/jack.o: in function `snd_jack_new':
>> jack.c:(.text+0x2a0): undefined reference to `input_allocate_device'
>> ld: jack.c:(.text+0x2d2): undefined reference to `input_set_capability'
   ld: jack.c:(.text+0x311): undefined reference to `input_free_device'
   ld: sound/core/jack.o: in function `snd_jack_report':
>> jack.c:(.text+0x406): undefined reference to `input_event'
>> ld: jack.c:(.text+0x43f): undefined reference to `input_event'
   ld: jack.c:(.text+0x44e): undefined reference to `input_event'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
