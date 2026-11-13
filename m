Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592530;
	b=cSPKXQqCT5G8Sa3GN2QA2XzjaYIYbBP3RJYERMyCceOiXW7BZ0I3OVcrRHGvkP9qDRTY
	 yLNx2/T+acOzqK5IW3c45qaQ7mkIJcce1g270H46ciubpLRa+fpOHqGAN2NLaqnsc5MTV
	 wmvMMx35X/ql+g20FgH8q1ePp21rv5ig7R/7U3Z1itjenRhjeOwLlYfHPDfefC40eHoCS
	 SlriKhd4vPVB+REUEtqLuzipWTygpoJQCGyPEMZbWFj0rwv9B1yA0G4BepcLDua8TL6uH
	 YxgMkvXo2DYnFYLd5EcJSMbtWra/NpGrY6YkQ7uWSAM3R5xozIp/nA6TBhqEeaZF+Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6TT7Ej0gM+IbNbzY4ZqBOO5+D/eQd9sJFjOOKfLd56g=;
	b=RLIF+Ern0ach1A9fEveXXK4CwG4CI+n5f1kADu8NpgXiT+EybOjohRUbJynLoYO5GNlE
	 dRZ16RcuzX4UJeseiBobEad77RLz8c/Jc2yfFP2etHAc16w2gtYwlDJbJB3P7eRcYOkJo
	 4enDU679a3BQlG8Hu+bqnWIeCGEyxov5bvwZGQqh0Lq7pjJw5tLVA0FL3dwldm16zVe4/
	 oShtgR3/GSP9FCOHKBrvBECV38vgCJ4O8QxZ1DwI/tOPHQGvHvLnatj+YEh6juLIbOphT
	 /GVUIDGqG//nKbwnN5i7hLumZDIdus179DMqLvU0D7tA44ryYpf6NbFQOCmCJk+Fxbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mpL6EtX5;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA65606A335
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 17:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA65606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mpL6EtX5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794592529; x=1826128529;
  h=date:from:to:cc:subject:message-id;
  bh=/K2947hZOhbJDhvz8HL9b3D/ZwGsPivxu63QUET57Po=;
  b=mpL6EtX5cjaBuH6E5IsoZ1Kri0SRdvKgORI4PbO3kmLBl3+p0mwm2IZv
   jV4t87CfF2dFMLo5GwrU3/AhdYkhVLvY8VplxIKQGnF/pygk/T/x06o8b
   qn+o4MJZncdIclw9JRDSIyzTel3Z7uv3V0ZE8oO8HTCdw/PqNoIxbLjmA
   SUeNa2Dx6AnPjt/iKCZF9QUK9aLdWEjgNK/trLNWpkRhZzl5v1eRbFytU
   YATivRwgkAKK+lhp/XYTAXyloya3MiHgRUMEfFTUj+oxiobD3s9MIZKJ6
   LI2I0k8LypP7ROJoiiIbCs02vqnAlBDmkjl7kbrmpdK3wz+Aa97LI/XHI
   g==;
X-CSE-ConnectionGUID: cyMhRocpQca+sICudVpBFA==
X-CSE-MsgGUID: P+GSgB98QWe6jjlHwM7/1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3436036"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3436036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:55:29 -0800
X-CSE-ConnectionGUID: XIIDvA7MSKa/Cj1zej71Xg==
X-CSE-MsgGUID: knM9l/xjTWes812mZizqCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8787936"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2026 09:55:27 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRvUi-000000001Jv-211h;
	Fri, 13 Nov 2026 17:55:24 +0000
Date: Fri, 13 Nov 2026 18:54:39 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 5/5]
 drivers/cpufreq/goldfish_cpufreq_stats.c:28:9: warning: this decimal constant
 is unsigned only in ISO C90
Message-ID: <202611131804.Hencs4w7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Weilun,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   1691ede0a60c1fb31b68de026528cd7dda21029e
commit: a3f6baa6885122bc9b7f8ed273fd789a5f52fac3 [5/5] ANDROID: goldfish_cpufreq: Add goldfish cpufreq stats driver
config: arm-randconfig-r2301-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131804.Hencs4w7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131804.Hencs4w7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131804.Hencs4w7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/goldfish_cpufreq_stats.c: In function 'time_in_state_show':
>> drivers/cpufreq/goldfish_cpufreq_stats.c:28:9: warning: this decimal constant is unsigned only in ISO C90
      28 |         len = sprintf(buf, "%lu %llu\n", 3000000000, ++fake_time);
         |         ^~~
   drivers/cpufreq/goldfish_cpufreq_stats.c: In function 'cpufreq_stats_create':
   drivers/cpufreq/goldfish_cpufreq_stats.c:56:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      56 |         int ret;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
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
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
