Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392CC1E1024
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769985915; cv=none; b=Lg6uYITBZL6cJtiGexf/A7YElVWIIGg4nGolI1Gcko0BMEO+J9xkzwr2hT1QwewbuWdybwjC6BNEz41Fk8IKAKDmvKjPIzBGwKMcgYbnuOfhXsewE7mRbkhlQR2mlOjJI9X/mCr/tRSyhl/gz3GAM5gUzSidHN6glAyQ3cx2CPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769985915; c=relaxed/simple;
	bh=xdTkKvfoQbL64hNn8Q6MkGk0/GNrUrhUdCMskkMlI3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xutrwwvbr8RMXbPW+73xsxA7W4bEJxnX/L92CC1T25rd9eCLv5/XzoeM1vgyZk8YeeYZZoINVBme/jHROlYq4/z5Pxn0couaOb2pYen7fVr075lqnsv5E6Q/zCJ7GQ5MNFLmj7lnRPWMr4tv//bJNf/Vhgd4mp9x2bBPf4b+kOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWBc8hk3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWBc8hk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769985913; x=1801521913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xdTkKvfoQbL64hNn8Q6MkGk0/GNrUrhUdCMskkMlI3E=;
  b=SWBc8hk3yj2buCp6BBLH2rkWb57waZQeS1ZqwBC+w7Yi9oPLDmvygcWV
   NMJeVVNsD7iNU892w/UzfEkrmjp1e5OZHDEuiUZTx7CxjI3JN8JbPGCG3
   7FZ1T7pGOQc2J/Cb+cMdub5/Hv342q1eU3M9uSki0k9aWz8W3isn7aewB
   Izdxrk8TbK3kLyvWdrm6GK1p31VcrQXAurH+WYUfXHJhdQGMDltGgPIZB
   xsL+bDLiJ1UZDnaia3aGkl6J6qxrTRmLoeASVMgB3ndWRYeEoTbbB/kDW
   ZwDP0iwcK3lnpw95MPCcix7s/FVpUbzem5EA6WMUii4KCiyyJ9WhoQqyE
   w==;
X-CSE-ConnectionGUID: se7xRM1IQa66HHFJusTjDg==
X-CSE-MsgGUID: QQ9uE4WBRQW3US6AwcLWOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71051766"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="71051766"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 14:45:13 -0800
X-CSE-ConnectionGUID: UaZnamP4Qiyq5S+r3J8Q3g==
X-CSE-MsgGUID: iVdPDQUHSOyELPwKigKEEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="213893615"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Feb 2026 14:45:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmgBp-00000000f5G-1nFs;
	Sun, 01 Feb 2026 22:45:09 +0000
Date: Mon, 2 Feb 2026 06:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Youngjun Park <youngjun.park@lge.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/5] mm: memcontrol: add interface for swap tier
 selection
Message-ID: <202602020619.cuYdT7eD-lkp@intel.com>
References: <20260131125454.3187546-4-youngjun.park@lge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131125454.3187546-4-youngjun.park@lge.com>

Hi Youngjun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 5a3704ed2dce0b54a7f038b765bb752b87ee8cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Youngjun-Park/mm-swap-introduce-swap-tier-infrastructure/20260201-005914
base:   5a3704ed2dce0b54a7f038b765bb752b87ee8cc2
patch link:    https://lore.kernel.org/r/20260131125454.3187546-4-youngjun.park%40lge.com
patch subject: [RFC PATCH v3 3/5] mm: memcontrol: add interface for swap tier selection
config: s390-randconfig-002-20260201 (https://download.01.org/0day-ci/archive/20260202/202602020619.cuYdT7eD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602020619.cuYdT7eD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602020619.cuYdT7eD-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/memcontrol.o: in function `mem_cgroup_css_free':
>> memcontrol.c:(.text+0x2f2a): undefined reference to `swap_tiers_memcg_sync_mask'
   s390-linux-ld: mm/memcontrol.o: in function `mem_cgroup_css_alloc':
>> memcontrol.c:(.ref.text+0xfc): undefined reference to `swap_tiers_memcg_inherit_mask'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
