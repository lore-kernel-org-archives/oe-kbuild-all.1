Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB22BCF51
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 20:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751574095; cv=none; b=O9maJxfe/xalX8KIzT3DUjVqsSfPQ9DI1YfaV5nlgtD10LGJ97yUL95/L1suTLUf37ST2Hz8UcMDDxGp9EYV7XlvtOMYkcfQRXsKAi5w9Wx9ShK1kzmJvpXfMuUYpb6lUCP/RD+hk3Qv1Ip7W2aeSSFH9/OKuBIqDc7c/uhzVuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751574095; c=relaxed/simple;
	bh=yv3eo0FxDVdYftNVMmoMiPXHUNY95bPVuBQ44UOnoKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rhgqXAPXHAEJrBz456VoAFsQRuPaXYF90l+X+DRMAItZSXh3SlEEE6u4V0vSnZ6zbSB7aXEedW7X2+PCkkp1v8OneA8YNGb9PAluHOB0D4YlKY0N3r3LdgCpBhtx5ACVIXjHihFf3s05zWo6mdj02Lj+Lf4I3/72meRJ2oORDnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eACYWmoi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eACYWmoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751574093; x=1783110093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yv3eo0FxDVdYftNVMmoMiPXHUNY95bPVuBQ44UOnoKE=;
  b=eACYWmoi01AOXwR8/mQxGrRZIz7DPvzACJrV609gZrleoJmNtj8FoVs7
   oyi5dkzzH4jxEl2HODtcwauypI+21sxxawuXeLCDobAk0WIEIqc4Me2eL
   orCIedMyOat7cckdK6WYPMtYO3K2+YDzIixjH5Suhz263wMehaJ3ueGtC
   DjfzS3Qnq1vGdrzcx5mTCnaL9ePThr4XSwb8wMxXubOfUrLHXCeoVOXG8
   AD3jlR9hrRku2KF3NV7vODUFAgmPImd5I7oRJUfCrB/VhxCujDL3bgeMo
   G1FWuVyjnzyrceD4WmiHLATyRwVab6rJsSKDrEU2S/OYbLOT4b7eDRxvd
   Q==;
X-CSE-ConnectionGUID: WDolMl7xQOCsd3foDUk4uw==
X-CSE-MsgGUID: 4jAqO6UeTX6or9v4I5tOAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53136581"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53136581"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 13:21:33 -0700
X-CSE-ConnectionGUID: YFXnrLJERtmkTHlFa1UgLg==
X-CSE-MsgGUID: Urii43ceThiI6Wy+gJ7lNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="159021543"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2025 13:21:32 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXQQz-0002yh-1X;
	Thu, 03 Jul 2025 20:21:29 +0000
Date: Fri, 4 Jul 2025 04:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2455/2455] kernel/sched/stats.h:156:20: error: no
 member named 'last_waking' in 'struct sched_info'
Message-ID: <202507040452.3fsLFRs4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b85bcf0e6357841885264f42859bec05c9073f4
commit: 4c89400decb94cca83aae81bf0838c6a85bb8161 [2455/2455] interference: Add sched wakelat interference track support
config: arm64-randconfig-002-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040452.3fsLFRs4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f1a4bb62452d88a0edd9340b3ca7c9b11ad9193f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040452.3fsLFRs4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040452.3fsLFRs4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:60:
   In file included from kernel/sched/sched.h:2131:
>> kernel/sched/stats.h:156:20: error: no member named 'last_waking' in 'struct sched_info'
     156 |         if (t->sched_info.last_waking)
         |             ~~~~~~~~~~~~~ ^
   kernel/sched/stats.h:159:16: error: no member named 'last_waking' in 'struct sched_info'
     159 |         t->sched_info.last_waking = sched_clock();
         |         ~~~~~~~~~~~~~ ^
   kernel/sched/stats.h:166:21: error: no member named 'last_waking' in 'struct sched_info'
     166 |         if (!t->sched_info.last_waking)
         |              ~~~~~~~~~~~~~ ^
   kernel/sched/stats.h:170:30: error: no member named 'last_waking' in 'struct sched_info'
     170 |         delta = now - t->sched_info.last_waking;
         |                       ~~~~~~~~~~~~~ ^
   kernel/sched/stats.h:171:16: error: no member named 'last_waking' in 'struct sched_info'
     171 |         t->sched_info.last_waking = 0;
         |         ~~~~~~~~~~~~~ ^
   5 errors generated.


vim +156 kernel/sched/stats.h

   153	
   154	static inline void ifs_task_waking(struct task_struct *t)
   155	{
 > 156		if (t->sched_info.last_waking)
   157			return;
   158	
   159		t->sched_info.last_waking = sched_clock();
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
