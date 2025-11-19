Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C21730B52F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582021; cv=none; b=Be5IEIpYt0jFJrvYIcxDq5gmCc6aEKATmrUKWNwEA0ApSTm5mPdgelR+aZcC6rGdPXmAeVipS484xk9CuaFaQVO+0HPAVym1s+5aWtzhWaZJRjYBG+QsXEmFzVHmbYzPFJltN+H0+G+hUclfIbZ4h2Djgsmr2Mt++4u2c3om9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582021; c=relaxed/simple;
	bh=opqhHVnEniYzhPrvw/595DchBCvHCc1iAOQSP4lkp5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fSVIalUIg58zqvv98vRC72Tp2bQmMak40LvO9DO1LdgKLqFTGnVu5P4TJ/s4OuvpQFysKdTdCwQSlSJHEupmBBqpvlELMvtwPuLE/E2YDo3D+jmr4ojXZbERtF+0MD/2CYvZV++nqbZ46pRRSkFixwkdBB7qP1NEx8gcjA6pY+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RqS+x6XS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RqS+x6XS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763582016; x=1795118016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=opqhHVnEniYzhPrvw/595DchBCvHCc1iAOQSP4lkp5U=;
  b=RqS+x6XSkUP4srwA6EV67fYtO/mPL1w/BESzZoUL2TW/u8G0mEw/DpvJ
   H6n/6vOioE98p1kItuxUhShVmLSHBY1fLPAQkL823/6L0NK3KmH3Yrl8o
   xiDAtFxUlNLwpJUaBi7C2fV++/qNhvh2GbqvzQlXFO5xBEcWDXYPtdlSJ
   xWHSK0GxcqS/cMd/1hHWG5sPiXzY5m87mhbNpXV4fa9kwivWye54Pj4I3
   B+Ss6ziJuFYWTrlQoH/Li+PlldaW3j5i1deIhZeE/ENixNKcRstAwcx9o
   VwuJDirneLCYe5vIoxBvSOu9d5KqLTtxdmfzNdNGuqHqzUcvIijBH8Rhk
   A==;
X-CSE-ConnectionGUID: ac+JE2v4QbKBppxZ5AMisw==
X-CSE-MsgGUID: 3MCUBRaVScCzd6yWcHKW6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76248839"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="76248839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 11:53:33 -0800
X-CSE-ConnectionGUID: 69jNsuL1Rvmu5infQ/T2eg==
X-CSE-MsgGUID: GnqM++QxQS2TKO/mWY/IfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="222085285"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2025 11:53:33 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLoF8-0003GB-27;
	Wed, 19 Nov 2025 19:53:30 +0000
Date: Thu, 20 Nov 2025 03:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 drivers/cpufreq/goldfish_cpufreq_stats.c:28:35: warning: integer literal is
 too large to be represented in type 'long', interpreting as 'unsigned long'
 per C89; this literal will have type 'long long' in C99 onwards
Message-ID: <202511200338.uWxDWAnT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   246916b9d1480eb0dd52e26e28c7c0c731b40b81
commit: a3f6baa6885122bc9b7f8ed273fd789a5f52fac3 [0/1] ANDROID: goldfish_cpufreq: Add goldfish cpufreq stats driver
config: i386-buildonly-randconfig-004-20251120 (https://download.01.org/0day-ci/archive/20251120/202511200338.uWxDWAnT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200338.uWxDWAnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200338.uWxDWAnT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/goldfish_cpufreq_stats.c:28:35: warning: integer literal is too large to be represented in type 'long', interpreting as 'unsigned long' per C89; this literal will have type 'long long' in C99 onwards [-Wc99-compat]
      28 |         len = sprintf(buf, "%lu %llu\n", 3000000000, ++fake_time);
         |                                          ^
>> drivers/cpufreq/goldfish_cpufreq_stats.c:56:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      56 |         int ret;
         |             ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +28 drivers/cpufreq/goldfish_cpufreq_stats.c

    22	
    23	static ssize_t time_in_state_show(struct kobject *kobj,
    24			struct kobj_attribute *attr, char *buf)
    25	{
    26		ssize_t len = 0;
    27	
  > 28		len = sprintf(buf, "%lu %llu\n", 3000000000, ++fake_time);
    29		return len;
    30	}
    31	
    32	static struct kobj_attribute time_in_state =
    33		__ATTR_RO_MODE(time_in_state, 0444);
    34	
    35	static struct attribute *cpufreq_stats_attrs[] = {
    36		&time_in_state.attr,
    37		NULL
    38	};
    39	static struct attribute_group stats_attr_group = {
    40		.attrs = cpufreq_stats_attrs,
    41		.name = "stats"
    42	};
    43	
    44	static void cpufreq_stats_free(unsigned int cpu)
    45	{
    46		struct device *dev = get_cpu_device(cpu);
    47		struct kobject **kobj = &per_cpu(cpufreq_kobj, cpu);
    48	
    49		sysfs_remove_group(&dev->kobj, &stats_attr_group);
    50		kobject_put(*kobj);
    51		*kobj=NULL;
    52	}
    53	
    54	static void cpufreq_stats_create(unsigned int cpu)
    55	{
  > 56		int ret;
    57		struct device *dev = get_cpu_device(cpu);
    58		struct kobject **kobj = &per_cpu(cpufreq_kobj, cpu);
    59	
    60		*kobj = kobject_create_and_add("cpufreq", &dev->kobj);
    61		ret = sysfs_create_group(*kobj, &stats_attr_group);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
