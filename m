Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5627F1C8618
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 13:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739971642; cv=none; b=ZaxNI7B4rwEH/68UuCaRh5ZxnPtoc/uzuh0ohjk+iNYca5baciXtphlLGMswJDU3eMwLy+cwavvmWV2vHJ8JMYcm6jgArcuJG1aPYu8HcsTaCkYuHqxxI6APpwBeHdKeG6Z2TF8fNVRAGHg7G56H1tyzd/QeqDdtr3zMxrTV5g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739971642; c=relaxed/simple;
	bh=tdfxw/EUMCjCrnwc8iIHX/aG2JelnsskmiyP8RlHyd4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L5lDxvCGho4/4HQ61nz7Ua9HQZXiZJi5St9rJigLShyPrb4QVYRCOOG8ko0ihsXWlDUmlFBZmy1VpazGK3xMXI1dO2EyWuuJsnsrFsqnAANhs+AGCBIsomu+no3mQLxqN5pN+/NrWoHLYhsBop2d74kyDVIInd9DPH0Fb6c74Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/Znohly; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/Znohly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739971640; x=1771507640;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tdfxw/EUMCjCrnwc8iIHX/aG2JelnsskmiyP8RlHyd4=;
  b=J/Znohly1P0Ja90pBDnzY3Y2OVdTjGCs99m/aIpqxI/FV6UgZS6X912x
   +m81HmmKWmYBKaKUc9WPGS5FxQX9UUhI3fUmBgo1AtOfrUQWe06X9MWJi
   S6qFpXpTO+m12B2oQXlW0Z/bm1dKrJVbWsKyEzGfL8HeU7XctiPTc+ms4
   MsMvA/8FSxSrx2yXTjkcljCPNQ3V73JCr+5bFBfdH3rJ1a/F1vADQ1upn
   RqSOAKrJ3KqbaBAx1K1AGfngNzVZ98wwtRVBEv1hgP0/2bCt7ZceFA914
   M+6Xd09GmYWr6q5RcEPNsnWz/SKJZUaUWDxNE2+nrHutF8cmVtEWPDB/V
   w==;
X-CSE-ConnectionGUID: hj9VDqN0QB+uEWoVrW0lgw==
X-CSE-MsgGUID: I7umNf9XQJ2Wyy+jqcji7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40914140"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40914140"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 05:27:19 -0800
X-CSE-ConnectionGUID: viRFd39yRy+NAQgO6FJDrw==
X-CSE-MsgGUID: Xxx98IHiS5WkTSU61S/lKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115193825"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 19 Feb 2025 05:27:19 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkk6U-0002zj-05
	for oe-kbuild-all@lists.linux.dev;
	Wed, 19 Feb 2025 13:27:14 +0000
Date: Wed, 19 Feb 2025 21:25:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/59 1/1] kernel/cpu.c:88:1: warning: 'inline' is not at
 beginning of declaration
Message-ID: <202502192135.8ixkUFuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 5f4b55e10645b7371322c800a5ec745cab487a6c [1/1] smp/hotplug: Differentiate the AP-work lockdep class between up and down
config: sh-randconfig-001-20250218 (https://download.01.org/0day-ci/archive/20250219/202502192135.8ixkUFuN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502192135.8ixkUFuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502192135.8ixkUFuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cpu.c:88:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    static void inline cpuhp_lock_acquire(bool bringup) { }
    ^~~~~~
   kernel/cpu.c:89:1: warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
    static void inline cpuhp_lock_release(bool bringup) { }
    ^~~~~~
   kernel/cpu.c:136:13: warning: 'cpuhp_is_atomic_state' defined but not used [-Wunused-function]
    static bool cpuhp_is_atomic_state(enum cpuhp_state state)
                ^~~~~~~~~~~~~~~~~~~~~


vim +/inline +88 kernel/cpu.c

    87	
  > 88	static void inline cpuhp_lock_acquire(bool bringup) { }
    89	static void inline cpuhp_lock_release(bool bringup) { }
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
