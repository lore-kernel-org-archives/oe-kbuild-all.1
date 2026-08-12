Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515C437F727
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786566749; cv=none; b=FOlxPdc2yLDu0eSnYizi/xVkxO2nwLOhqY8LnZwAVwoPVQNmfGiGBwcckp8IebOf9Qf/L2JTH2cGTgjD2tAoOirz8dVRHg+qlCEdQV3OusgzE2yeIB7KxvHSS2jPwsPUl/bAG8ddP49gH+8y5p1smTY1JNXws92uNEh6s5pxY8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786566749; c=relaxed/simple;
	bh=M2R+QPYsapdsBYJG3ADI1IN/AvqSfO3HPRM67zSASAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AEqZteSoC64QdZ4crV1R4xFz1vUXhdhgtm6hqAtYU2tBWfHk9xasf39merwa3BJGvmlb3AXfuH2zEdjgSuzHzHIHYd/s0YAFLH8R3iQynEdtrra6s395jZRjDrAseM0/JxEznaFA3WYN0IscFJ5gW8GIwAu7wnvMgBg4u+WdWYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cU5ELP7u; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cU5ELP7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786566747; x=1818102747;
  h=date:from:to:cc:subject:message-id;
  bh=M2R+QPYsapdsBYJG3ADI1IN/AvqSfO3HPRM67zSASAU=;
  b=cU5ELP7u/im/mptQQVTBp7DnwxsxTSL5LYcN0BMxkX6//ZDmknN6VkJ9
   YO0b+0wu4KZJ8IWZMkXd2m3GwCdG7C8v3PN2tQx7jRXsIrDmPxmq48rpM
   /8DQPReXxEiMxIdtzLmFkoA/mZ2/Ujw3EjmHQ1wtuWd5IC4MKPXVdprt3
   KWTpt/VqXeJamaulXTwtCLtKjl2sZdnuAeQRT+KpcL6bRaPN2hK1j8o4a
   wQ+r6R8kkpgpsMxdNOLc6Gq6nQGXKQNqAJLDnw8QYVI8pvF3gSp3AR3KY
   B1akbYWU1yQ4Hfcwprwv0LIlOiY4+1GGXlO1Go0wYBp/PxlWYdSQbekZq
   A==;
X-CSE-ConnectionGUID: 14DluAc6RoyVxL1E3KST4g==
X-CSE-MsgGUID: O8cOHtz3T2KNw+9aTXynGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="90814659"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="90814659"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 13:32:27 -0700
X-CSE-ConnectionGUID: piMapqRsRraOdw/dycJcbQ==
X-CSE-MsgGUID: 6BMgqD28QOKxhOib3j1/qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="268011489"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2026 13:32:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuFcd-00000000RcA-1llR;
	Wed, 12 Aug 2026 20:32:23 +0000
Date: Thu, 13 Aug 2026 04:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/gpu/drm/i915/gt/intel_rps.c:2732:2: error: #error "Use of GKI
 forbidden symbol_get/symbol_put symbols, please refactor code first"
Message-ID: <202608130450.FatrlKFm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Tomasz,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: f8833da199c243bbf9801b0eb6b36820abe8f3ec [1/1] ANDROID: [TEMP] i915: Provide workaround to build i915 as vendor module
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608130450.FatrlKFm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130450.FatrlKFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130450.FatrlKFm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/intel_rps.c: In function 'ips_ping_for_i915_load':
>> drivers/gpu/drm/i915/gt/intel_rps.c:2732:2: error: #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
    2732 | #error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
         |  ^~~~~


vim +2732 drivers/gpu/drm/i915/gt/intel_rps.c

  2714	
  2715	/*
  2716	 * Tells the intel_ips driver that the i915 driver is now loaded, if
  2717	 * IPS got loaded first.
  2718	 *
  2719	 * This awkward dance is so that neither module has to depend on the
  2720	 * other in order for IPS to do the appropriate communication of
  2721	 * GPU turbo limits to i915.
  2722	 */
  2723	static void
  2724	ips_ping_for_i915_load(void)
  2725	{
  2726	#if IS_ENABLED(CONFIG_INTEL_IPS)
  2727		/*
  2728		 * (b/352497771): GKI does not allow to build any vendor module which
  2729		 * uses symbol_get/symbol_put as symbol lookup circumvents all ABI
  2730		 * checking.
  2731		 */
> 2732	#error "Use of GKI forbidden symbol_get/symbol_put symbols, please refactor code first"
  2733		void (*link)(void);
  2734	
  2735		link = symbol_get(ips_link_to_i915_driver);
  2736		if (link) {
  2737			link();
  2738			symbol_put(ips_link_to_i915_driver);
  2739		}
  2740	#endif
  2741	}
  2742	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
