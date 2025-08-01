Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C16A1A256E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 22:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754086771; cv=none; b=QA3q1UFfVF1wFBM/IoBIayH14YFl22ALYsJkc6WaAdbzY9GFwjufcU+FddCOBg0qJwYoat72lUjWRB5Rrp0w+qcScSDxb54iQF5qCOZYgn73D1i+EQEjpIVhSCjr251hbo8lUu6xFn50N3lY9j/qkuVX8ePljwe2AxQC9Vl0ZUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754086771; c=relaxed/simple;
	bh=JW5Qr32LPi8jvHQOiLhG/zcF9eWLYfWkYrRSQpblfRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FyfCdw4f/LHrWFsie0j27uwN82cEysRBwZpV+zIIJMeXNU5IH/4dwCOmvJO10CT3z3GUn4l6EobFEQ7J7KxDyG659ezp810rZeodOb4fe7G+5arrnm9WtgAJiZDcc3LEweyKYJlbFEvmb9+j1gAAOgW/H2hPD29/L5PZ/Nx/5pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5o7q9S6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5o7q9S6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754086769; x=1785622769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JW5Qr32LPi8jvHQOiLhG/zcF9eWLYfWkYrRSQpblfRg=;
  b=Y5o7q9S65ymNPDb+hn8+Lc/os+TLWry1Nx3MkqcemVA4MJ9O6yvHsddB
   MksfBIS2+Ts9+u1NlKCEPTlJryQGlEyn+W8RGtt+c2RQc0ZQcaKuppAOX
   5z9BtYCpMPmGxQgd9r05zuZSY7NHiB8RhBTHX+upCnkCTtPBcVEedA7lA
   GaPkPfoig5Ql+dB2H0GGRlBQxsU/ddRqCdjt/HYQ5SVWJjH6kK916QPeL
   sRar8wUP7Fl0uTtX2jRxcum6XOFNjDkqSyk1sio3EoQSxzXra2WGwutDQ
   aQCvB0KE0HnXbMO24zO6T2nc/tHW+ESBi8Gb7KjWJeWLBPLo+XD+rJKYA
   Q==;
X-CSE-ConnectionGUID: AauIEo6RRzq52UAtk5aspg==
X-CSE-MsgGUID: 1W+jbWY9SvaLBwdyZIk+zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60259597"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60259597"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 15:19:29 -0700
X-CSE-ConnectionGUID: Dbagu3vqQGWhjXu/GnJ31w==
X-CSE-MsgGUID: 2kZO4el2Ss6nYOaR5Ji+eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="162956142"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2025 15:19:27 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhy61-0001IZ-14;
	Fri, 01 Aug 2025 22:19:25 +0000
Date: Sat, 2 Aug 2025 00:19:21 +0200
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/tidss/field-api 45/60]
 drivers/gpu/drm/tidss/tidss_dispc.c:516:35: error: 'struct dev_pm_info' has
 no member named 'runtime_status'
Message-ID: <202508020003.A68CGGw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: fbb0210d25fde20027f86a6ca9eee75630b5ac2b [45/60] HACK: check if DSS is runtime-active when touching regs
config: parisc-randconfig-2001-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020003.A68CGGw5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020003.A68CGGw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020003.A68CGGw5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/tidss/tidss_dispc.c:7:
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'CH':
>> drivers/gpu/drm/tidss/tidss_dispc.c:516:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     516 |         WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:517:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     517 |                 (dispc->dev->power.runtime_status != RPM_RESUMING) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:518:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     518 |                 (dispc->dev->power.runtime_status != RPM_SUSPENDING));
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^


vim +516 drivers/gpu/drm/tidss/tidss_dispc.c

   513	
   514	static void CH(struct dispc_device *dispc)
   515	{
 > 516		WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
   517			(dispc->dev->power.runtime_status != RPM_RESUMING) &&
   518			(dispc->dev->power.runtime_status != RPM_SUSPENDING));
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
