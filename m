Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1911443C25
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309962; cv=none; b=h9WRfRNbjqANuolftS0XFjRHrM3bgRYYjYJbeU8vjb2bQSW6ciUsP58kLOOUr+v9FU0N0OuhBJTFzajVSzW9xEPsqCa9+DMO45zqnzCvFcIlOq56KZxtcVM3ndmMcIddpVccP/2pCnFOuteLszCFd5y7fl7m4LTJQ7HgmjZKNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309962; c=relaxed/simple;
	bh=A0ktBwQPoDlPfrponlf6ca28i8onl5dAfQY3fotZ51o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UriTkNRldbZbpF34fcax4QHvyueXTD9KYSny2daROGD3MNBZH87bJ0gMh+a3TdOGoZNOd1hW1E/UnI4FjDLKJ2s7RQEVZj0xcHoKmmv5DovfmISOXZnEYXMbwCyV/b/9wJEWmLPjKV+t3pWxkgrGUKSQZUMBdyKcgPEK9mcmwwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6EmYKmB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6EmYKmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309960; x=1823845960;
  h=date:from:to:cc:subject:message-id;
  bh=A0ktBwQPoDlPfrponlf6ca28i8onl5dAfQY3fotZ51o=;
  b=F6EmYKmBolhPgq/mz4phgiE8xhGnhv6d++Az9PrpVJlxHwf585R3vSdp
   Gnl+oPdg1x0E9UaQeBo3RbyY3rv2OGf2+3AC/iI4geYstN4rt1dKFMEOz
   UoVMW1fZisK3Ea7kZ4Dw53Zq3fIRQ1NA2cku+Jjn7YdlG5dgwEJJvuVWI
   hrYOr/O+r5wAHyk/0LJFqv2yd6suvKtErmyH3qM6z7GZD0KJ2IBYuKvva
   CQuxttB32QQJPfW9cLRfhlc/hkylYNt24O8LzMJDsKtw7geGAVgV0ZnyT
   XppBulyzrd/viOj0rSpZrJseYzEbdeGqgP5ze8bZN0PopenN4WWAibyn3
   Q==;
X-CSE-ConnectionGUID: WDp/5YbwSWKsU0qmz7vvdA==
X-CSE-MsgGUID: 8sn0GF8NQqm2K4h1+tZ/ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916675"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916675"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: WeiyAD96Si27fl2jYcaCuA==
X-CSE-MsgGUID: 9chKoeaSQjOa1tE5giEkEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340777"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:33 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004vF-2LyE;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:43:46 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/7]
 drivers/cpufreq/goldfish_cpufreq_stats.c:28:35: warning: integer literal is
 too large to be represented in type 'long', interpreting as 'unsigned long'
 per C89; this literal will have type 'long long' in C99 onwards
Message-ID: <202610170342.VRbxJ8Ne-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Weilun,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   4e4377cd369feab676638318ab082efbd0d315eb
commit: a3f6baa6885122bc9b7f8ed273fd789a5f52fac3 [0/7] ANDROID: goldfish_cpufreq: Add goldfish cpufreq stats driver
config: i386-randconfig-2301-20261017 (https://download.01.org/0day-ci/archive/20261017/202610170342.VRbxJ8Ne-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170342.VRbxJ8Ne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610170342.VRbxJ8Ne-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/goldfish_cpufreq_stats.c:28:35: warning: integer literal is too large to be represented in type 'long', interpreting as 'unsigned long' per C89; this literal will have type 'long long' in C99 onwards [-Wc99-compat]
      28 |         len = sprintf(buf, "%lu %llu\n", 3000000000, ++fake_time);
         |                                          ^
>> drivers/cpufreq/goldfish_cpufreq_stats.c:56:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      56 |         int ret;
         |             ^
   2 warnings generated.

Kconfig warnings: (for reference only)
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
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


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
