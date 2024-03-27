Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B38C21342
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711552112; cv=none; b=KUS7t6DoRSsGRBXU5zoRPK01SLyPhqunhhdFZGqTgz9WBh97fbU/LSFHWWIHRaKty5f3i/ZujYubMEZNV3GEk2ilZoXMUTkyI29iTotWlLD8Fd8wQi2yvVYrZoBU93x2JCNocRQiilK3grTOTIbvasPxEx87NNbc4/IiQq6cnqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711552112; c=relaxed/simple;
	bh=aGlkh1czs1jiMapnKmlhVzX7Y86QjjwKfjPzz8zJijc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UP9LwmA00NSAIUVd+tP2ToRWfAsoTExBYmA7erz+lwx1Yh63lx7gQcc35x+d0x23xgVLELEI67OeH/oZvTKEYKtqvUk9Efc0joNM4I1QJ0IthhdoMibgS/bhRkEmSBz0qDKnzJ/xU/zqmxOtTCgffW78d1VNdfxBwKlRgvA01JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcLsXudU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcLsXudU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711552110; x=1743088110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aGlkh1czs1jiMapnKmlhVzX7Y86QjjwKfjPzz8zJijc=;
  b=gcLsXudUkCmgmDn78je+K9olBGI2K/6WmTZfSEk3q1f0bC1B7vzbIT8P
   RLCgEFvY8wv51Z7pUZNyo0LYPvVeUaJL6BGLqjs7aM/EiKziXyZFypkSY
   z6qHJC8mvMnmkZY45INcj2ThK/KsNR4JFhN2s5q0KkZnqmHCaveq2Y0vk
   pd1dJ/zkydY5s1Q8WzoXzdyakf/ksvo6eii9tk/mY0nNRk/WZEVB17KbJ
   pO0IougxakY3TEc6HMuRUEY18bfPjmjhDZZdZuah/yP3BIPmrlXW01lwU
   9spIU0f3saLuD9GxAj9713fMyBc/wOJEV4n6JffxEhB8TwDno/MnO1y8Y
   Q==;
X-CSE-ConnectionGUID: 9em5yHcRTemNYBwmxplFtA==
X-CSE-MsgGUID: nGt4WU19SEKlfGwt++vMPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18046116"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="18046116"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 08:08:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="16356774"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Mar 2024 08:08:29 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpUt8-00019z-1M;
	Wed, 27 Mar 2024 15:08:26 +0000
Date: Wed, 27 Mar 2024 23:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 130/377]
 drivers/cpufreq/brcmstb-avs-cpufreq.c:486:23: warning: mixing declarations
 and code is a C99 extension
Message-ID: <202403272258.t6uql9QK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   9465fef4ae351749f7068da8c78af4ca27e61928
commit: d951cf510fb0df91d3abac0121a59ebbc63c0567 [130/377] cpufreq: brcmstb-avs-cpufreq: add check for cpufreq_cpu_get's return value
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240327/202403272258.t6uql9QK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403272258.t6uql9QK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403272258.t6uql9QK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/brcmstb-avs-cpufreq.c:486:23: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           struct private_data *priv = policy->driver_data;
                                ^
   1 warning generated.


vim +486 drivers/cpufreq/brcmstb-avs-cpufreq.c

de322e085995b9 Markus Mayer     2016-10-27  480  
de322e085995b9 Markus Mayer     2016-10-27  481  static unsigned int brcm_avs_cpufreq_get(unsigned int cpu)
de322e085995b9 Markus Mayer     2016-10-27  482  {
de322e085995b9 Markus Mayer     2016-10-27  483  	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
d951cf510fb0df Anastasia Belova 2024-01-17  484  	if (!policy)
d951cf510fb0df Anastasia Belova 2024-01-17  485  		return 0;
de322e085995b9 Markus Mayer     2016-10-27 @486  	struct private_data *priv = policy->driver_data;
de322e085995b9 Markus Mayer     2016-10-27  487  
a48ac1c9f294e1 chenqiwu         2020-01-20  488  	cpufreq_cpu_put(policy);
a48ac1c9f294e1 chenqiwu         2020-01-20  489  
de322e085995b9 Markus Mayer     2016-10-27  490  	return brcm_avs_get_frequency(priv->base);
de322e085995b9 Markus Mayer     2016-10-27  491  }
de322e085995b9 Markus Mayer     2016-10-27  492  

:::::: The code at line 486 was first introduced by commit
:::::: de322e085995b9417582d6f72229dadb5c09d163 cpufreq: brcmstb-avs-cpufreq: AVS CPUfreq driver for Broadcom STB SoCs

:::::: TO: Markus Mayer <mmayer@broadcom.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
