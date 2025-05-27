Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9A412B93
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 19:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748374406; cv=none; b=cscRED7XWNzumcJ+2JGzWqBZQ5PBIBY5pFH0o0UFov85ejVWySlAekieyDUsMoTF7f1KPVLSgGqFHjeQ8oa17bQIemhNgaiew9PVPYppNI0tyq5HTPBOGBD9zyqCHvdqAhoSC4s2+puTL9ADQ6mLaPVPabojYe/S7Qu17p8v5WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748374406; c=relaxed/simple;
	bh=ZDKTnjIelSBE5lB5ShYXuTCqSRxwHQLp4YHhc1O1HxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RrTLcw9W/n+xHsNTPsknrSWDexSIz8U1FOQRZB2/5l/Vcejf4X3pPxopfpiQ+TtzYyb2qDa4PUKl4F1dmNOSdVwUKroBWob+WExc8BXwskFd0o+Jhm5Es2k3D4OZL5Gzdg4c1iw0M3LECRxG/rDIMG71kTLxRa6ZyVmY1+BfHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+KwtwLg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+KwtwLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748374405; x=1779910405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZDKTnjIelSBE5lB5ShYXuTCqSRxwHQLp4YHhc1O1HxA=;
  b=k+KwtwLgwLFlJLJZicMvV/WdYvwY2JJV5UBONa/wSR/wPXasVwl2+7YW
   2u4angAR9ZUNzWSdmNfWSxxoAFkOV46wAgvlJ1HNiIYkyccUsUCrZ5k8a
   D5rZQOyJUCWvVnXwXfX5FFtgPHa6Hp7tpmOkUSp560zCMpjdfXpD5DcYv
   mB+phEE8BpFGAQJErfYXxOzqPxPFAcaf+1O/EhOMb7IBCMQ1Acq04wOKI
   /H8M0YjrPjiXnhryZDWMlf3helLYPqZ+O/yMi3woWE0u6zl7hvHeBqnd5
   6zujh+Du7rpnL8KIrUK6G0xnKHvsU6TqolGJzCYsaKIxvvts7PK1peOe5
   Q==;
X-CSE-ConnectionGUID: X2IhIwaySeWH5FlkxjAwtA==
X-CSE-MsgGUID: RXev3WCrSxe4uyBTV28S8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="67797749"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="67797749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:33:25 -0700
X-CSE-ConnectionGUID: B9yrURTgQ0e7ME8LrSpAjA==
X-CSE-MsgGUID: 8SUzHpFES5iHtzsgnI9prg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142908448"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 May 2025 12:33:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK037-000UxU-1Q;
	Tue, 27 May 2025 19:33:21 +0000
Date: Wed, 28 May 2025 03:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core 6/15] kernel/cpu.c:1456:18: warning:
 '_cpu_down' defined but not used
Message-ID: <202505280349.uIV0hMPi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core
head:   5f864154521cea5391361b58372298785bc43639
commit: cf8c78a0751387f9ee841d295ebbf1203a15fe2a [6/15] cpu: Protect against concurrent isolated cpuset change
config: parisc-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280349.uIV0hMPi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280349.uIV0hMPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280349.uIV0hMPi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cpu.c:1456:18: warning: '_cpu_down' defined but not used [-Wunused-function]
    1456 | static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
         |                  ^~~~~~~~~


vim +/_cpu_down +1456 kernel/cpu.c

  1455	
> 1456	static int __ref _cpu_down(unsigned int cpu, int tasks_frozen,
  1457				    enum cpuhp_state target)
  1458	{
  1459		int err;
  1460	
  1461		cpus_write_lock();
  1462		err = _cpu_down_locked(cpu, tasks_frozen, target);
  1463		cpus_write_unlock();
  1464		arch_smt_update();
  1465	
  1466		return err;
  1467	}
  1468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
