Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C449563B7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 22:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgpVBtGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701902287; x=1733438287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1hlNA6b9/KtL9HXQfhvUEfWIP9bED1YxyMFriLZJbGk=;
  b=LgpVBtGDrQMFqWs1TkMgnthLj+PlR5D4hHL8RhZefouts/bJgshf7Fic
   G/XlBWCAxSnJv/SB5Se6i7Bf7k6f1DyqZRN18Ezum+v+6/FjavHWOdiRJ
   jEmXvQ/rBq6mnbPYnBu3TIb5eIUTHltscWWWyxr/iQfjKbfJhOo75frkn
   IySaXJxgT8Jsods6dH/sGjNBhUpjIx08GurMvEOjnn8lcxAAl7XDcFBP3
   UkdhzMgmy338IOtyn8zaekOrFQDuH9WP9nodRnFMC/j5gfhZRMvI1Z0UB
   bD0j20kSj/KsLKeVqn1p4TjBMVepk3Am8IyjC6N8Lp7LO7YnjNfoQBOn1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425288991"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="425288991"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 14:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1102973738"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1102973738"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 06 Dec 2023 14:38:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB0Wp-000BWG-2A;
	Wed, 06 Dec 2023 22:38:03 +0000
Date: Thu, 7 Dec 2023 06:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1786/27459] ld:
 lib/decompress_unzstd.c:266: undefined reference to
 `ZSTD_DStreamWorkspaceBound'
Message-ID: <202312070630.NVBHI5bk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   bd5883688256f8eaf708cad509ce2a47ec8384aa
commit: 95a43fc99f147282c64e68baf1ea18041c7755ea [1786/27459] ANDROID: Incremental fs: Add zstd compression support
config: x86_64-randconfig-072-20231201 (https://download.01.org/0day-ci/archive/20231207/202312070630.NVBHI5bk-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070630.NVBHI5bk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070630.NVBHI5bk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: drivers/of/unittest-data/overlay_gpio_04b.dtb.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: drivers/of/unittest-data/overlay_gpio_04b.dtb.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: lib/decompress_unzstd.o: in function `decompress_single':
>> lib/decompress_unzstd.c:127: undefined reference to `ZSTD_DCtxWorkspaceBound'
>> ld: lib/decompress_unzstd.c:129: undefined reference to `ZSTD_initDCtx'
>> ld: lib/decompress_unzstd.c:142: undefined reference to `ZSTD_findFrameCompressedSize'
>> ld: lib/decompress_unzstd.c:148: undefined reference to `ZSTD_decompressDCtx'
   ld: lib/decompress_unzstd.o: in function `__unzstd':
>> lib/decompress_unzstd.c:247: undefined reference to `ZSTD_getFrameParams'
>> ld: lib/decompress_unzstd.c:266: undefined reference to `ZSTD_DStreamWorkspaceBound'
>> ld: lib/decompress_unzstd.c:268: undefined reference to `ZSTD_initDStream'
>> ld: lib/decompress_unzstd.c:301: undefined reference to `ZSTD_decompressStream'
   ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
   drivers/media/common/videobuf2/videobuf2-core.c:2044: undefined reference to `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
