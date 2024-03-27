Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7E212F371
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 15:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711553312; cv=none; b=KA+HTsBi1fgxAlqC37+MA7Bdx2vnk6X/MQwXV7a5W0VqLz/OnCRX3RUE9Bu9iup4aVLH/mNMQOnye9BBQYgpEFyRFKc6hsPKV0xBxooa5tI6bsacJdOtcX56ow8hIpt99b2JgsDUQCoxpgkhHKmV4vIAyjsupaM+PEMVI19UXDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711553312; c=relaxed/simple;
	bh=hu3NuhDurzXtL0MDHJzl5sd+0uZNXX3ttcWg31UJk5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rLTIkl+roDwKxfTifv8cAOYhBriqp1MDlXeXgddpnDxV7F+QnuNlhxDmOtXEF7eQg0IiBT+UNmk6+IbRIBs2Av06KKY5QBvTwf0r2gFDWIsl5JTRWsagNAVHr4lEQhLXs+/0gu6ZO5ic/A5OEjtVDMg77cjHYZt0Swv0vrYi6c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KD61TRdp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KD61TRdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711553311; x=1743089311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hu3NuhDurzXtL0MDHJzl5sd+0uZNXX3ttcWg31UJk5g=;
  b=KD61TRdpEPto1Sz2/BIJ9lTx3B488U8a1/AdTl9zDNIRwJgAZctnEmIS
   l8tbWnInFO73h3BTPdc6H5XlovcePVky9OKBgCFNYsLQ0Y5aaU6vN+OZT
   J2LKG81DZfjfA2v0Dn1CquLwDlFwcCs7wqRWq+cjtFEyRO3awxBumh0DD
   2liMZPwFhy8SJ9IWh3zDe5nPJWHqlm+IpMwEfg2h044lSmudBMdnRv+Sj
   Mb+C7inhEh6sf+rEWkFvEh+VOxESlJZRygr7fOXAjbDud4UJwTvkmLFCk
   XQkEi2VupoRWuSDcsH8SB5NVwOCH64imrpE6/FvcfuD++zZV1/duGX2uk
   Q==;
X-CSE-ConnectionGUID: CDQZl8G0Rm+JFh0N44IavQ==
X-CSE-MsgGUID: 5DjC9R3zT1qrBhvRhk0Vtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6778501"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6778501"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 08:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="16966214"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Mar 2024 08:28:29 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpVCU-0001At-2x;
	Wed, 27 Mar 2024 15:28:26 +0000
Date: Wed, 27 Mar 2024 23:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 130/377]
 drivers/cpufreq/brcmstb-avs-cpufreq.c:486:9: warning: ISO C90 forbids mixed
 declarations and code
Message-ID: <202403272315.ekdy4NrZ-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240327/202403272315.ekdy4NrZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403272315.ekdy4NrZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403272315.ekdy4NrZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/brcmstb-avs-cpufreq.c: In function 'brcm_avs_cpufreq_get':
>> drivers/cpufreq/brcmstb-avs-cpufreq.c:486:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     486 |         struct private_data *priv = policy->driver_data;
         |         ^~~~~~


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
