Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940F10966
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 07:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlBLkmBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698737706; x=1730273706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5aYULcP6/iPayqXOSkBVY2jxcUr/F+K5m8toN+uW7k=;
  b=XlBLkmBl4slH8uuL82se54V8SuXMidmjidY45zjQ5M7JdiComNTkhoql
   nc7PJYhh0o+W66SgS/eT9KWjGDmhx6z8ooVUTrr2AjnWVxwi7BnGrVODS
   YEoUvmpNTJu6TM/RDF9FE4alJQMgnT3WTlZylg7W1IHBLamQ0Dqeviam3
   Wk9vyDGYpBcsorI/74EJXC+AWex/57tdihODfhWAC24S8tR2aTgtw3A3+
   GYxMTnxlYzUVMVXU7GDsJudzPePWuuOJL/21Jor/hOROIzAs8VZDVpdbf
   tW5ovBSxAq2LQzus/jILaNKyxvao9ISDyGlfAGe/H8ePKBi2see07trex
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="378616929"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="378616929"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 00:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="826319638"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="826319638"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Oct 2023 00:35:04 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxjHC-00001M-0T;
	Tue, 31 Oct 2023 07:35:02 +0000
Date: Tue, 31 Oct 2023 15:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 391/29120] undefined reference to
 `v4l_vb2q_enable_media_source'
Message-ID: <202310311545.V8ccpBMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   6710c955e1d50780768d15311a6f399d9e45997e
commit: 649238947d688eea17d27825fdc651d693e48a33 [391/29120] ANDROID: init: GKI: enable hidden configs for media
config: arm64-randconfig-001-20231031 (https://download.01.org/0day-ci/archive/20231031/202310311545.V8ccpBMk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311545.V8ccpBMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310311545.V8ccpBMk-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
>> (.text+0x5440): undefined reference to `v4l_vb2q_enable_media_source'
   (.text+0x5440): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `v4l_vb2q_enable_media_source'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
