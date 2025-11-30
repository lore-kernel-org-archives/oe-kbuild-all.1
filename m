Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FEB272E6E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764500155; cv=none; b=hNZgxnBdg28QGqrjlljY1zFlxQeb00Ow53i/qOCIFyLa7K201YQlqSDN/TEr1w+ArTWxiIdqi8aCiVKGlmRQO2U3/31YTUCV6HyPa39QoTH+0foXpwyd7mX4kY/U1kB1KKc+QZhyyMNDDRZZiiFTo3pgf/xaPK27MhNQKObzmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764500155; c=relaxed/simple;
	bh=wgIZoG+5gB6lXX4iP5lt8P2+CCoizFFGSAgBS5wjdVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bb2NkrSsHussSFZwKHrjmwG0RVJn7I0OcO6JcChr5tb8IgNRDDBVuDpCwCUwcAQhpGh1RxLkeqDSqP/FmE8cmnL1JcWpNqKQ4NLxuYRFEY36AfFBp1DHMRkomm4S7T0RvvJURALlp1VHafm67vjICS2Hi20Yu+/r5Ix4VzDof9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMRKApdT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMRKApdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764500153; x=1796036153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wgIZoG+5gB6lXX4iP5lt8P2+CCoizFFGSAgBS5wjdVU=;
  b=cMRKApdTP/Yc7uC+UW31PAvlXcmpt5whOMOyhyoLZlSTjA3zZ41C8AHo
   POKmNsgjTAaHCUpDI5FV35QjoN8S55z3Bze5RXo4x/5dZFxLZiqlltWZU
   SRv2ye5gHyV6o782DmM/lysl/wpQTXYxWlknTylmR7BvWab6vadOWNKWm
   cYRv9m6DkMQ0UjL5Das2LyxmqAbWBZIAkITJ1mpwgmPlmCmpnjwU1cSQ7
   X/6K7Xuq6UnddNBiw/Zh9+COzKt+AyqCK0b9VPvygF4E/hSAX1vogJBpd
   MCxnE7dM/00mxC4GQ4dTDqkYfqmKjORVe92CosfjLeFmAp5MCu7RZwj84
   g==;
X-CSE-ConnectionGUID: y9SydBBgTIe9HQmGHFnkEg==
X-CSE-MsgGUID: /fjEpdJOQE6bSO+/spE4oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66345594"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66345594"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 02:55:53 -0800
X-CSE-ConnectionGUID: snhIauiNSOuGQ8i7cvMPSg==
X-CSE-MsgGUID: N9QCHdAFRWSPGKeHHiZQZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="198155808"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Nov 2025 02:55:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPf5o-000000007v7-3qPe;
	Sun, 30 Nov 2025 10:55:48 +0000
Date: Sun, 30 Nov 2025 18:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 6/6]
 drivers/virt/halla/hvm_vtimer.c:77:16: warning: variable 'ret' set but not
 used
Message-ID: <202511301857.VXTeRoAU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6399fe1d738ad2b14a935fcb460f99d5693a4f83
commit: 9007a992df6c7fbc50cbcc21613b3a5c3c019ab6 [6/6] ANDROID: drivers: virt: Initialization halla module
config: arm64-randconfig-r054-20251130 (https://download.01.org/0day-ci/archive/20251130/202511301857.VXTeRoAU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301857.VXTeRoAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301857.VXTeRoAU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/virt/halla/hvm_vtimer.c: In function 'hvm_arch_timer_handler':
>> drivers/virt/halla/hvm_vtimer.c:77:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      77 |  unsigned long ret;
         |                ^~~
--
>> drivers/virt/halla/hvm_ioeventfd.c:27: warning: Function parameter or struct member 'hvm' not described in 'ioeventfd_check_collision'
>> drivers/virt/halla/hvm_ioeventfd.c:231: warning: Function parameter or struct member 'hvm' not described in 'hvm_ioeventfd'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/ret +77 drivers/virt/halla/hvm_vtimer.c

    74	
    75	static irqreturn_t hvm_arch_timer_handler(int irq, void *dev_id)
    76	{
  > 77		unsigned long ret;
    78		u32 tuple = *(u32 *)dev_id;
    79		u32 timer_ppi = guest_vtimer_irq - HVM_IRQ_PPI_START_NUM;
    80	
    81		if (tuple == (u32)(~0) || (read_sysreg(cntp_ctl_el0) & (u64)(2)))
    82			return IRQ_NONE;
    83	
    84		// mask timer
    85		write_sysreg(read_sysreg(cntp_ctl_el0) | (u64)(2), cntp_ctl_el0);
    86		isb();
    87	
    88		// call IRQ_LINE HVC
    89		ret = exynos_hvc(HVC_FID_HVM_IRQ_LINE, tuple,
    90				((u32)(1) << 31) | timer_ppi, true, 0);
    91	
    92		return IRQ_HANDLED;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
