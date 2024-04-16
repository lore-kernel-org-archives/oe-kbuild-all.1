Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414037152
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 04:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240270; cv=none; b=isazmWw9doqAcWiFMeatLBJNGfvrgm+IOwdewnBk5K/moQw/VGCh4kU+3OJhbYVplJaeLnAlc2mJKvHKUQ2tHMe59lIkqeU7zuqNV5DKCGz9ydhUjwBNi//4uouI0lP9o0tf6Iq3v9hrbj9Ql8O0/FrEiPqd1/dVgzpLNIVlGps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240270; c=relaxed/simple;
	bh=m0Ef5QhPebAuatmtKngLkebG3Ap/krNh/aEDaS729X8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXSU2QjItLZHsrAXgPODaWFAoWKFBxat+KmzYHCvZqQ5zgJIKLLiAxh7jLjJAfXnVfLlgyTHm/IAvSBLztxfiADeI1bIssR4IS4yl2YENmrnOQUcOwjpcBCa3bl9RaROl7NrO+t60/re2DHyTlKVO6xRab3dCeEk7uVryS5kOI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FudSJuTA; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FudSJuTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713240269; x=1744776269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0Ef5QhPebAuatmtKngLkebG3Ap/krNh/aEDaS729X8=;
  b=FudSJuTAsxjEac1OSN8CvZ4HXa6aMTlW806E+i+eR0JIdy6q9CT75EqF
   GIyXvHUZ2DsunAVwxrPGdJdwucrcVAcz+aleqHdPVyH40v3D4GCz+k5cN
   Anp5CHmzylplh85x/vRUv94IWTDFxBjpnnw2HjxDXMdS5Y00ZUHdlXnGh
   5CJ4z/p6bAeDgTPtnNaAt7TFFbi1Na4xmyGu0j2sMO+HvuXSkwCjzR0XV
   rAR0jg5MuwRMN3+qsRIqJCnjvwonN7KV5yJRMQDmMF1H9HYNjwlysCIw2
   AUwEH2erkeAJGwfhDZnJiM+pyyc6LbQr3Br7TDnblpG11U17WZvX1j4T2
   A==;
X-CSE-ConnectionGUID: 4rAuqZiyRp+a0fSInF8Gxw==
X-CSE-MsgGUID: MSO7jjR/QV+cjojy73T1hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8519171"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8519171"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 21:04:28 -0700
X-CSE-ConnectionGUID: Tn70Iq7vSHW2gB3E4NiLwQ==
X-CSE-MsgGUID: xtsJ873cTBKG8NHGNNnFIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="22214638"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2024 21:04:27 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwa3U-0004wg-2g;
	Tue, 16 Apr 2024 04:04:24 +0000
Date: Tue, 16 Apr 2024 12:03:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 6086/21662] ERROR: modpost:
 "fuse_get_bpf_prog" [fs/fuse/fuse.ko] undefined!
Message-ID: <202404161101.J77YzHFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   bc8dccf0e351f8b1f462250dab685ada42c9463d
commit: 57f3ff9648991998d008ecf32f2f9e78a08bfb8b [6086/21662] ANDROID: fuse-bpf v1.1
config: i386-randconfig-052-20240416 (https://download.01.org/0day-ci/archive/20240416/202404161101.J77YzHFc-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161101.J77YzHFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161101.J77YzHFc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "fuse_get_bpf_prog" [fs/fuse/fuse.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
