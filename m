Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8833DB31D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 10:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086720; cv=none; b=OSm6P3DYc6+rqlwwPRjCcXWDqDTM3Xcx456NHrt5kFr4I5Wy4mahMTaGWwacanErWzqckGZzv5hmxXHu3AHAxCREpdJSAhpIYtt8k0C3kusvnMkYSYQbQkmRDKAdgFU4ZkjlghZyzx0kIIszkZYxSoHOZYIBgTDL06IKx0RjK5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086720; c=relaxed/simple;
	bh=0vT6m0xvtZBn1DCKXnEF5E8HMLI8Cq+xgqUa5y0l/HY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eLkDtJV9nEX320zaIzM+Y/EKTnOY1mSZlt4bJQJ926oDfowY0AGPhbTvLN76FAG/V/9Fa42yGrIYfxercDY+nhiJXs/qGnEp6Zn1QLJcj4qGODQhXJ4ldKpojWEAuxpkL5YLn8EhtZQqiH+o00xXmv2De0R3Z7Nj+osn4q2lsb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DADZfyF/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DADZfyF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781086717; x=1812622717;
  h=date:from:to:cc:subject:message-id;
  bh=0vT6m0xvtZBn1DCKXnEF5E8HMLI8Cq+xgqUa5y0l/HY=;
  b=DADZfyF/7DQcW92nYpl+y6M8/Ttvcg0Whp9Q4HcfxVAPvJ0Y3Dd0Sk/h
   +EmaoFtl6F0liyI4Kc0MBBwzgg/7DOT5kJ2EyQ/WaEhvcAs2/4UTVzdR7
   5iD5XqJHuQ9P6PVndabgUCKE5TqxhdJILLjRXy1vfHo492R5EHdobvxUK
   TGxJEQf+afKHXoWM8kDW0zUVJelKgClyyRBH5mDuFGY1Vc4LDPfoAmKiO
   U4bUztEceLFy2zQZosEWe4WoybVou5Cbt+ja3jBIn7XfmI3e9JFv0exx6
   UMnfElt7xcHGETayT9SJvWE7b8rfrRbQTN8w0H52YLKim/xZL5wKaak/C
   Q==;
X-CSE-ConnectionGUID: WhW3ro61TlarnAWFK2c25g==
X-CSE-MsgGUID: FeSDQRPuTPGZLKAhor02mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81985780"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81985780"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 03:18:36 -0700
X-CSE-ConnectionGUID: StIwlisdSJS0p1FDMtdAnQ==
X-CSE-MsgGUID: xmyESamaTPS2kLldtgYKDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245988928"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jun 2026 03:18:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXG12-00000000LHO-2rV6;
	Wed, 10 Jun 2026 10:18:32 +0000
Date: Wed, 10 Jun 2026 18:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 1/51]
 arch/x86/kernel/jailhouse.c:68:9: error: too few arguments to function
 'apic_set_timer_period_khz'
Message-ID: <202606101835.L8oQ2QHC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   03e00f8b41e58b5dd5ceef21940a62e5d8e08766
commit: e3916a6bfe7c4342989909ff0109708bda8ed516 [1/51] x86/apic: Provide helpers to set local APIC timer period in hz and khz
config: x86_64-buildonly-randconfig-005-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101835.L8oQ2QHC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101835.L8oQ2QHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101835.L8oQ2QHC-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/jailhouse.c: In function 'jailhouse_timer_init':
>> arch/x86/kernel/jailhouse.c:68:9: error: too few arguments to function 'apic_set_timer_period_khz'
      68 |         apic_set_timer_period_khz(setup_data.v1.apic_khz);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/jailhouse.c:16:
   arch/x86/include/asm/apic.h:141:13: note: declared here
     141 | extern void apic_set_timer_period_khz(u64 period_khz, const char *source);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/apic_set_timer_period_khz +68 arch/x86/kernel/jailhouse.c

    65	
    66	static void __init jailhouse_timer_init(void)
    67	{
  > 68		apic_set_timer_period_khz(setup_data.v1.apic_khz);
    69	}
    70	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
