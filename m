Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639333D5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695928526; x=1727464526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gIOylv7oY4n8+HBgbLVvzQehq3L6K5m89PG85RTySqQ=;
  b=BvEQdp8CdfDbMAigYMNCZiVZNbKWt3ivH+Ls8ABnif6MBThG4BM9kRnh
   dD7d1MGRfahGA++k6e2BDDMGKncadKBJTEcy1xH1TEecRZrSCCQ6ePxuo
   DHuGYRSXR7tY9NzTGt6+rulo6SK15vkxf7ojAi4E1hX49vKRa3G2wjNnK
   ENy4ADkp41qGoHavD9+UpAG7XBkH+VcBOqiwk4j+7IiQ8EhH3U6EOpFKw
   yiomc4JH8T/cC+Afn9F5q/5o1JJf9Oo8fXZA1gM1dbaDnkXlLoCNUvtlr
   k9jqT1a7Ve89ce6PayCAUTdulBMqQpYp5IWFeCmd1uWz77Bel9kuNes/S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="3717015"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="3717015"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 12:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="784837293"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; 
   d="scan'208";a="784837293"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Sep 2023 12:15:23 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlwTo-0001qL-2Z;
	Thu, 28 Sep 2023 19:15:20 +0000
Date: Fri, 29 Sep 2023 03:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 10942/29455]
 drivers/cpufreq/goldfish_cpufreq_stats.c:56:13: warning: variable 'ret' set
 but not used
Message-ID: <202309290342.NfnHURE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   857626e91aa591df42f090662697d9c5928733d5
commit: a3f6baa6885122bc9b7f8ed273fd789a5f52fac3 [10942/29455] ANDROID: goldfish_cpufreq: Add goldfish cpufreq stats driver
config: x86_64-randconfig-016-20230929 (https://download.01.org/0day-ci/archive/20230929/202309290342.NfnHURE5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309290342.NfnHURE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309290342.NfnHURE5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/goldfish_cpufreq_stats.c: In function 'cpufreq_stats_create':
>> drivers/cpufreq/goldfish_cpufreq_stats.c:56:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      56 |         int ret;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/ret +56 drivers/cpufreq/goldfish_cpufreq_stats.c

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
