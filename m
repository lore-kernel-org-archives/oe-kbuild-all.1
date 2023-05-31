Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29140174C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685549089; x=1717085089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GhHQlwGsAUu+ACn5D7vxggcQ8zkdS5cof3lcNwA9zbw=;
  b=fiHyOUnN7dbYi3YhFCiBBXjRxOrJsl0T5/8L7JxtsYxAWw8pdfkAdouq
   5CUysQqJGhQLcqLkpyRRGmVhCCZBIoGLkYB19yAK6w7ePSEeq1Eicr5tI
   4DRv7abqW1gjGz+OJSDZEBDh+cIjmdiYjtd3uGPIqPZPmcHywZskVp9sK
   NiTvFGb7cvpGBQPS+Iu08rnS7RrLFnuudxMu7Hz/h2BdZmpxgPBMNlTB7
   RQYrcINQwLX//RGK7KXGs99y6SUFpfUUoH/cGtu+fOou3al0bzrW4Qhlo
   o3tM13I5aZVEtxigCIfBjL5UbtXEoEnje1zm+AVeEK97SxLGRm7oUfDfD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383546360"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="383546360"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 09:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="776819972"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="776819972"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 May 2023 09:03:31 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4OIM-0001Sp-13;
	Wed, 31 May 2023 16:03:30 +0000
Date: Thu, 1 Jun 2023 00:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-06 867/20126] jack.c:undefined
 reference to `input_free_device'
Message-ID: <202305312335.lED2EPsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-06
head:   1247e4a9ca826161b8c13c6422a56ed008dc4de5
commit: 1e702f432d551041753c46ec0d6d49484e776441 [867/20126] ANDROID: GKI: Added missing SND configs
config: x86_64-buildonly-randconfig-r006-20230531 (https://download.01.org/0day-ci/archive/20230531/202305312335.lED2EPsv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.15-2023-06
        git checkout 1e702f432d551041753c46ec0d6d49484e776441
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305312335.lED2EPsv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
>> jack.c:(.text+0x3f): undefined reference to `input_free_device'
>> ld: jack.c:(.text+0x65): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_register':
>> jack.c:(.text+0x13c): undefined reference to `input_set_capability'
>> ld: jack.c:(.text+0x16f): undefined reference to `input_register_device'
   ld: sound/core/jack.o: in function `snd_jack_dev_free':
   jack.c:(.text+0x3f6): undefined reference to `input_free_device'
   ld: jack.c:(.text+0x437): undefined reference to `input_unregister_device'
   ld: sound/core/jack.o: in function `snd_jack_new':
>> jack.c:(.text+0x596): undefined reference to `input_allocate_device'
>> ld: jack.c:(.text+0x616): undefined reference to `input_set_capability'
>> ld: jack.c:(.text+0x6fd): undefined reference to `input_free_device'
   ld: sound/core/jack.o: in function `snd_jack_report':
>> jack.c:(.text+0x951): undefined reference to `input_event'
>> ld: jack.c:(.text+0x978): undefined reference to `input_event'
   ld: jack.c:(.text+0xa0a): undefined reference to `input_event'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
