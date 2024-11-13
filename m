Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF2A16EB5D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 03:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731468585; cv=none; b=JNphcRboivGsoul08wHSPI9xdRbQlabnmRgJ/sSzLB8iaOeyEOYRnYXEn2Yhj3CxE/sKdczx7XZlQ8wpKiqUoHmdNyreRtMO1ttJ9eFwDUlKcXWI5a1j89iafESRDYSpb5+Km2ZzJ4yBVtJMqVggiZA0tEGa25pGFanpnmCu3Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731468585; c=relaxed/simple;
	bh=5K+G9WjER3d6Wa8DRnu4OYA+dWtkKy0RrpfuFWelF+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMMZZR6OV7DiT7LnLV6dtGyqfKwW9vgOd1SqTHc5kzz3JBM9uEjWEmgGeWBJlm/p/aM2hcSvVzE9r3j9eMg32A3LogGrDwVpZcxeT/ak3a9nQO6G97p3N3Wt12aYp8pC7PofQauHoq0BiSKZ5vOgxTzCnm0zOiC+r+dA8Xv06ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CasyfVWg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CasyfVWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731468584; x=1763004584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5K+G9WjER3d6Wa8DRnu4OYA+dWtkKy0RrpfuFWelF+E=;
  b=CasyfVWgmR1lIuWQavbcC+oOxWGohThMgwjV05bdZrYSfd+kPEp9rjlp
   X2O4TQnpEoAAKtvJ+5N1mr6ctqsvvT8kWmzBra+flMo/7boWObBX6RLr3
   +r8epz+XdN7t06SlQ3UdQ8IAmvBevpN6ND2XEQPfIo5W5MNcDl9Jx9BGo
   M9zoFx+ZRAy+sMxgieQb8h2IWVixCU0PaKWQxA8sKEs2Hl4PBFbIoBv1u
   m8lKJQWOjx7MXUoe0BS976Jc2fahoXeUNo3x+mTAuDvRFc4v8lIAMWVCX
   AHN8zYVfhsFioJPlyKKXTFYyRwdb8Bb14Sehd7G9XctmLO4Y+0kvn5G8q
   g==;
X-CSE-ConnectionGUID: cMP9RAatR62k6QQZkE8Lxw==
X-CSE-MsgGUID: luCnNpfaR2qLAA4qGsbwyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53891391"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53891391"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 19:29:42 -0800
X-CSE-ConnectionGUID: i90c0kaRTxKBNX0EXob5uA==
X-CSE-MsgGUID: zu2Wa1oxR3auxgcKzbBCrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="111040573"
Received: from lkp-server01.sh.intel.com (HELO c782e932e0d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2024 19:29:13 -0800
Received: from kbuild by c782e932e0d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB446-00001D-2X;
	Wed, 13 Nov 2024 03:29:10 +0000
Date: Wed, 13 Nov 2024 11:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9715/30000] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
Message-ID: <202411131119.ezxvxgSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   104cc535f91241da2629d8e2d5abcf57a97b0afd
commit: c3e816a56786096a2f1521a3445a5f6b056af6f9 [9715/30000] ANDROID: Incremental fs: Add zstd compression support
config: x86_64-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20241113/202411131119.ezxvxgSP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241113/202411131119.ezxvxgSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131119.ezxvxgSP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for CRYPTO_CRC32
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - RDMA_RXE [=y] && (INFINIBAND_USER_ACCESS [=y] || !INFINIBAND_USER_ACCESS [=y]) && INET [=y] && PCI [=y] && INFINIBAND [=y] && (!64BIT [=y] || ARCH_DMA_ADDR_T_64BIT [=y])
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
