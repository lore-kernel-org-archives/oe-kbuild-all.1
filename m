Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FD118E0C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707947740; cv=none; b=q7Tu/RIYhkKwxam8MX185qXH2NzlJJD8RaSoW21YQjOIJyJcF7aN+Dn6lj166oo5uVtZnQnDU9w66rrjrDG6OKFvsyO2G5jTMdAQSfCePNAbyYyfMlMw8wJoetp3gR2Izff7S1xzXfIS89MXVpcSmvKRL7Sng3ck4uqaOqGTxXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707947740; c=relaxed/simple;
	bh=e0mGpwj7tK2WjvatRN+eTo9QrjEVsUwMNhoP+jKjjeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QkaSzPS4kqydPaAoYPFYJEnnu9l7Lh9a29TftUKO0kzP65YXrtVJN321hmnoE0CAOIGvGLXuAfh8Ph8AkblvcB6DjiGFlnKJCncITy9RwrbIKLLPGFUY7adtiYEg02MYx0vQvBpvsw7B03xQttOWeaPRlnMTYNROUkiAUfwBCWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F3QWi7/i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F3QWi7/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707947738; x=1739483738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e0mGpwj7tK2WjvatRN+eTo9QrjEVsUwMNhoP+jKjjeA=;
  b=F3QWi7/iemPRR2dhPsRwg/UEhCRLZAN89C5Nn7t6URaT73DiDc6WID51
   jlz8K1RI9LWydYS/2SyDcRMEIIe1i1nLW0M4DZ28ijcbLSkzDL3Jsap7k
   g8Wg65Y3pLFayz9DUSPg/dGO+K+7sxzAi8T+6ajKMzgljBk4/lt/4J/wW
   V6FfGGL4DgryngVJxOgD8JfqTjBTH/epuTg6MudawblIEYioCS/jCQchQ
   b8+I0xX40IQIs9NpNsbMTmC0DBAyJ7i1nKr2gnXn+mbKCFVYq51eZpmyg
   tXZx9m6UB597XpKp/mxYyByt43Yoq7dju8kGeDhO0e4373UpMWP/WeRjd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1889915"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="1889915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 13:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="7936776"
Received: from lkp-server01.sh.intel.com (HELO 323e10984596) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2024 13:55:37 -0800
Received: from kbuild by 323e10984596 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raNE6-0000FQ-2F;
	Wed, 14 Feb 2024 21:55:34 +0000
Date: Thu, 15 Feb 2024 05:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 9101/30000]
 drivers/cpufreq/goldfish_cpufreq_stats.c:28:9: warning: this decimal
 constant is unsigned only in ISO C90
Message-ID: <202402150539.DK6QDAOt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f9690232902eb464b12d3aa2b42a878afdeb7e0a
commit: a3f6baa6885122bc9b7f8ed273fd789a5f52fac3 [9101/30000] ANDROID: goldfish_cpufreq: Add goldfish cpufreq stats driver
config: arm-randconfig-r061-20240214 (https://download.01.org/0day-ci/archive/20240215/202402150539.DK6QDAOt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240215/202402150539.DK6QDAOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402150539.DK6QDAOt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/goldfish_cpufreq_stats.c: In function 'time_in_state_show':
>> drivers/cpufreq/goldfish_cpufreq_stats.c:28:9: warning: this decimal constant is unsigned only in ISO C90
      28 |         len = sprintf(buf, "%lu %llu\n", 3000000000, ++fake_time);
         |         ^~~
   drivers/cpufreq/goldfish_cpufreq_stats.c: In function 'cpufreq_stats_create':
>> drivers/cpufreq/goldfish_cpufreq_stats.c:56:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      56 |         int ret;
         |             ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=m] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=m] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
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
