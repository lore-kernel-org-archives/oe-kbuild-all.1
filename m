Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB11DA935
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 10:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751193021; cv=none; b=VqPKfUtCIhaLg2VHkmx9KYAufH7MeNbJQ+p59ZpOcLcJH2icWuQ2f7PCbl/IAq16tyVr6Oxhfn4tZkkEiQmxYSwoBD2XAFGLz1hR1zo4kTrYutH84xvsIe3uoG/wUmRDg+Lyeml1oANqKm27Dn/caybepfiQgC00LLd+/LTUcso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751193021; c=relaxed/simple;
	bh=a5Mpr1Xy9jHUGh+D2LTZSHrkF02Dh6BMCMS+Je2bitU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kDjfMksANcTGdCWkFMC1Ub5sRATGI6pr8GgvOKkbG855pBovkJeVTmeCvXPS2ylEUFCV8LedHwmxz5OKMb034ZU3xA0Hf/OVBfOnmqWN1sWUC1wttrEcOWzupBW1CW4F/aNHXBT5o2Vvj4HKB/whWHh+zSWAIBmLzZEiSSEymvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAALOalu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAALOalu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751193019; x=1782729019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a5Mpr1Xy9jHUGh+D2LTZSHrkF02Dh6BMCMS+Je2bitU=;
  b=KAALOaluysj9kU4ktJh+Zc3o5s6m7/I5nN8X7eh2/F35VlkDk2/f5149
   S7nXy5QMl+zsfgGEJTcvVKtGRX3WNEuduzgz6QZham5RtjBMByQ4csDSv
   36xOZFuIvpxRqKUCThPkymNeP/Q8v7k+mZwmhVbu2UrLcERMsQttW+fO3
   dETBe/pfzk7DgFxKDr1Yn5DthFlRsers9TuGvSXKVzZ4XRD7kchxTm+ot
   02Tqp7bEC2TZsjt64qt3lx0t3DaC7MnBSZ+678pxiSI/2+Sj+QQc4cVm8
   jjgK75tDVkQLelRm10rRDex5dOhhpAXopQuOO4URenFYGUl4WPUdjlTDn
   Q==;
X-CSE-ConnectionGUID: vtNx7cEHRKW/AFQegdcTBw==
X-CSE-MsgGUID: w3beycj9Q/eoWyTJxLWowA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64036459"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="64036459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 03:30:16 -0700
X-CSE-ConnectionGUID: ig9IUgMbT7ubdzgbglTdMA==
X-CSE-MsgGUID: rPJPXg2wREyV1PIHAWpL4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="158700246"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 29 Jun 2025 03:30:15 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVpIb-0000t1-1H;
	Sun, 29 Jun 2025 10:30:13 +0000
Date: Sun, 29 Jun 2025 12:30:10 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2411/2411]
 drivers/crypto/ccp/hygon/psp-dev.c:25:10: warning: no previous prototype for
 'atomic64_exchange'
Message-ID: <202506291256.D2SqWOXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: fe08767e3a083e73a72f08432bc6fbd864fa7179 [2411/2411] drivers/crypto/ccp: concurrent psp access support between user and kernel space
config: x86_64-buildonly-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250629/202506291256.D2SqWOXZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291256.D2SqWOXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506291256.D2SqWOXZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/psp-dev.c:25:10: warning: no previous prototype for 'atomic64_exchange' [-Wmissing-prototypes]
      25 | uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
         |          ^~~~~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/psp-dev.c:30:5: warning: no previous prototype for 'psp_mutex_init' [-Wmissing-prototypes]
      30 | int psp_mutex_init(struct psp_mutex *mutex)
         |     ^~~~~~~~~~~~~~
   drivers/crypto/ccp/hygon/psp-dev.c:38:5: warning: no previous prototype for 'psp_mutex_trylock' [-Wmissing-prototypes]
      38 | int psp_mutex_trylock(struct psp_mutex *mutex)
         |     ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ACPI_HOTPLUG_IGNORE_OSC
   Depends on [n]: ACPI [=y] && ACPI_HOTPLUG_CPU [=n]
   Selected by [y]:
   - X86 [=y] && ACPI [=y] && HOTPLUG_CPU [=y]


vim +/atomic64_exchange +25 drivers/crypto/ccp/hygon/psp-dev.c

    24	
  > 25	uint64_t atomic64_exchange(uint64_t *dst, uint64_t val)
    26	{
    27		return xchg(dst, val);
    28	}
    29	
  > 30	int psp_mutex_init(struct psp_mutex *mutex)
    31	{
    32		if (!mutex)
    33			return -1;
    34		mutex->locked = 0;
    35		return 0;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
