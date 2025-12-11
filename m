Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13FE27603A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765421854; cv=none; b=bOq16XbhbtjKW24ayQ+wIEB+d7f3CiB0/DTPqssREwA+OEUVdE1RLjZRPzoIEI4Gney1k7wDugUaIz5GPwPZCeh4TYgvm53NpvLjhEZz5LteWzrzrCrgtyOjdTeOVF70oCdnC+Dm9jttjbYDkGnWfjuB1xKkJCkWda+JVd09PCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765421854; c=relaxed/simple;
	bh=JqBuZaN0C19j/9Mti+tpSqChK3Ww6fvNagrCVe9t9+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E3nCPSichJrKNemOQZisOV85Khl6vvUhmYY9OOwgEAnzmGZaeKNS5lMGq8TPLN+3Aa9EsCr4DqUqtvDAd8QpbACaRBlEv+yauT2rcm06tE+99jr3Sjs80xTwonJcan4YXxgl+plHAzO5uPl86nnM7UDZ2S8a3JUkkpQ/WNokY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VfmPi0D7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfmPi0D7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765421852; x=1796957852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JqBuZaN0C19j/9Mti+tpSqChK3Ww6fvNagrCVe9t9+s=;
  b=VfmPi0D7fdG1sKwNaj/+86VTkXYCBzdw6MxTBBS7JBDJBPeaZSGjCrOr
   HyJpJ8CbncbjVIYGtwCIAQzTcERwRM7mHQjDaHZOG1xynbMBhDmZLmU9j
   6x+m9IUeLoRTYQyPXSKthRVnuAtaegs4Eqqm51Yo7/JOmFXHjF4crEctN
   PEO62p7SIj5hUI5620PdKbF9Kvzj0ebivjl8qUjwKRgv3n4Iu5QAZHIo6
   CA4RywcT/hMMdCpcVH201UyqoVdAcTcr4mzou3xNEIWXWto17nYJbM1or
   4YEmDQt9w9EW0zOSxXwDw4FqJ5ZfgrXOY2say+nBH2wznuXaYys20yqMe
   w==;
X-CSE-ConnectionGUID: xh7CNFoATtW2HowpysMsSQ==
X-CSE-MsgGUID: 83Ks7uZdQk+Pagm3VreSfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71025029"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71025029"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:57:29 -0800
X-CSE-ConnectionGUID: Z7HkbRZWSfG3kegk3k0mUg==
X-CSE-MsgGUID: Pz3KbXnPTeiVgnDgNdLd1Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 18:57:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWru-0000000044l-3M9k;
	Thu, 11 Dec 2025 02:57:26 +0000
Date: Thu, 11 Dec 2025 10:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] kernel/sched/psi.c:894:13: warning:
 'task_is_in_psi_v1' defined but not used
Message-ID: <202512111054.dK8iS8qQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   423fccda72fc2b78107cc119a1755d968c2c36de
commit: 2dfc29e742a07863c2426aea03d5c2c97b558b9d [3534/3534] sched/psi: Export cgroup psi from cgroupv2 to cgroupv1
config: x86_64-buildonly-randconfig-002-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111054.dK8iS8qQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111054.dK8iS8qQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111054.dK8iS8qQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/psi.c:894:13: warning: 'task_is_in_psi_v1' defined but not used [-Wunused-function]
     894 | static bool task_is_in_psi_v1(void)
         |             ^~~~~~~~~~~~~~~~~


vim +/task_is_in_psi_v1 +894 kernel/sched/psi.c

   884	
   885	#if defined(CONFIG_CGROUP_CPUACCT) && defined(CONFIG_PSI_CGROUP_V1)
   886	static bool task_is_in_psi_v1(void)
   887	{
   888		if (static_branch_likely(&psi_v1_disabled))
   889			return false;
   890	
   891		return !cgroup_subsys_on_dfl(cpuacct_cgrp_subsys);
   892	}
   893	#else
 > 894	static bool task_is_in_psi_v1(void)
   895	{
   896		return false;
   897	}
   898	#endif
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
