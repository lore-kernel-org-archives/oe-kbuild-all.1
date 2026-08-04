Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1C443B4B8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 22:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785882555; cv=none; b=vFh31OrkIx0R3Cb3XgE7qLyvrUcE+pMB9ZnnNgQ1XG3+ECFnqxFnZXt0CRX9m2WZI9+cFswopHaO9RGF5dT5B+CpbNS/kLv4Yn5mUa9aiIMssq86Z4HIVnBPhNfVMWSUY3ylhdPMpC3mIYpEyNiRME2TMniWpf/jcd626Qhon7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785882555; c=relaxed/simple;
	bh=7rhSDe4SbHh3fa2e/gPf0ewwVRK3JD4it9ENFXaa/fs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KZ6PcnWF7jVHzGLY0Im6K1k6JSLg29fbbn2ooTFEttzc66WL4j+DsDMOOMG3Mtr56In2uP6FMi4hsF+31pncJSKBi2ogZCUkWSv6rQqou6FkU9fPH7FfIIszfjgBp/niGYSORxGi1AFNiGNtUVdaAiOswkKLxHkdeNN67oIwf+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmI78BsR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmI78BsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785882555; x=1817418555;
  h=date:from:to:cc:subject:message-id;
  bh=7rhSDe4SbHh3fa2e/gPf0ewwVRK3JD4it9ENFXaa/fs=;
  b=cmI78BsRRW8s8iYraq+7IJ5ZWaxEBWffgsFpGle2cKhdn6ICC2lgi9Co
   oMsCdbs+DqtdXslwwR59nthIa/KpyRO99FAZCGxZHOrnkxybCyp7oPJY7
   wpjrRoigkYjrvln0VmXXgwLJ+MdSOKT/bVoZdVa7oT30RRCgvVm6ZW+Cp
   jaI+DBNQ9ApKRI4ZfjOjKFZj9+nBJvGyEWn7cIEUGLFc6uTZD/Bu35qj5
   3Zzpxvp9e6/kgT2ad7I061C4fADPK3PLw+bMuSH6ev+BRdE6RzuVeCi/O
   HJghg/sxuebwGfAkzJEC0f0iT2DH1bc+lfkajRQfYCGt09TX/ldv7Slgv
   g==;
X-CSE-ConnectionGUID: ieXw/GNsTLulR7uCt4MPJA==
X-CSE-MsgGUID: RnB4+2D8SRaMWsFJUVLcOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86216915"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86216915"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 15:29:14 -0700
X-CSE-ConnectionGUID: 6fhjeoMFTs6NyFGfSAWIcw==
X-CSE-MsgGUID: Qi8oj4rgTS+rW8Z2Jlo+IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="262210846"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Aug 2026 15:29:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrNdG-00000000AuP-2iTU;
	Tue, 04 Aug 2026 22:29:10 +0000
Date: Wed, 05 Aug 2026 06:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/pkvm.c:70:3: warning: unused variable 'host_s2_mode'
Message-ID: <202608050625.Bgaq4oxM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   42ab2c618ff1c956ec994d575536c84aa9ceb1b3
commit: a834e9b6ddb8d401b3ded1fb0bf4906024f99228 [1/1] ANDROID: KVM: arm64: Add kvm-arm.host_s2 cmdline knob
config: arm64-randconfig-001-20260805 (https://download.01.org/0day-ci/archive/20260805/202608050625.Bgaq4oxM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050625.Bgaq4oxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050625.Bgaq4oxM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/pkvm.c:1063:6: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
    1063 |         u64 pages, nr_busy;
         |             ^
   arch/arm64/kvm/pkvm.c:1807:9: warning: variable 'size' set but not used [-Wunused-but-set-variable]
    1807 |         size_t size;
         |                ^
>> arch/arm64/kvm/pkvm.c:70:3: warning: unused variable 'host_s2_mode' [-Wunused-variable]
      70 | } host_s2_mode;
         |   ^~~~~~~~~~~~
   3 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DIMLIB
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHY_PACKAGE
   Depends on [n]: NETDEVICES [=n] && PHYLIB [=n]
   Selected by [y]:
   - GKI_HIDDEN_PHY_CONFIGS [=y]


vim +/host_s2_mode +70 arch/arm64/kvm/pkvm.c

    66	
    67	static enum {
    68		PKVM_HOST_S2_CMA,
    69		PKVM_HOST_S2_CARVEOUT,
  > 70	} host_s2_mode;
    71	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
