Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850E113D890
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730023747; cv=none; b=HRlSTd2UaVq27ZPytUOoTDSeUJtE8hnqJxyTfngTG8ShgSPViNGM5p6Ve2xo6zZP0C+sYc+Abe+s2yJAm+0rhrnrmQq0McItj48jCZ+SFERfqD/1BgoMNJubD3P6laDmLtbh2FAkScbjy3EZW2uL5rEtTDeP+nj6hEq2DeFzSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730023747; c=relaxed/simple;
	bh=GOz8QzotD7a9ekpft+CXqT7PKOaw7+6PinQzImTEpPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EFS+03uGoLcgRZdL26ln+JnqwGNtVjZaeCshX6fqhz7mud+birIzV+Q0uOFdtbol6awBe/E54nl9jxGSGaJK5t/xYtC8pLln30b/k5RK5DlyzCSELLlAOoAeJWXSAWOAvS5gsQq0yZtBbfieuXAgfyRczlsJ94k6uqVrRkXIwGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkymNvJr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkymNvJr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730023744; x=1761559744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GOz8QzotD7a9ekpft+CXqT7PKOaw7+6PinQzImTEpPE=;
  b=BkymNvJrivhZY/h1ugkzgKqV8Ojaa60gvWoVGr9vnrUHDKFOhq0nUHnG
   gf96sauBEUu2XVeWzA0B7Rz9WuuMoTgPB6IVfnMgdQGzg+fGRjAGUIJns
   PIE4xLqTAXCren3c0Hm0Pn5EcV6SX5JIpSSzi4lcxj5phJe4NERqL8tmX
   vLc+IEzJ4Uwis28ORVIMI7XHF/bvTag9iKeWtxjQhVV38K7MmDcSHLIoX
   jVqjQAdevqTAy2GnWijIDmEMCIz5MBrH5/ifsMhC5lXpwbrDM9a+BSz9L
   brNy/r5ErWASsYdeMr0TRYasSfRswGkWjAlw5ngnDqa4bpjhqFwxB6Hdl
   w==;
X-CSE-ConnectionGUID: 6WFw1ayITXGNnXY1xk7ViA==
X-CSE-MsgGUID: MhQsDvOpRiK3i0U4zqNs0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="17272745"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="17272745"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 03:09:03 -0700
X-CSE-ConnectionGUID: r/d4MIE8RP2Z8ntBExG8fQ==
X-CSE-MsgGUID: jHs5NwQvTfi4055m8oY/yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81374271"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2024 03:09:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t50Ch-000abw-1d;
	Sun, 27 Oct 2024 10:08:59 +0000
Date: Sun, 27 Oct 2024 18:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jie Liu <liujie375@h-partners.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 15074/30000] kernel/sched/topology.c:1618:9:
 error: implicit declaration of function 'register_sysctl_init'; did you mean
 'register_sysctl'?
Message-ID: <202410271829.BwTi43vD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tim,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 8ce3e706b31409147f035c037055caa68e450ce5 [15074/30000] scheduler: Add runtime knob sysctl_sched_cluster
config: arm64-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241027/202410271829.BwTi43vD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271829.BwTi43vD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271829.BwTi43vD-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/topology.c: In function 'sched_cluster_sysctl_init':
>> kernel/sched/topology.c:1618:9: error: implicit declaration of function 'register_sysctl_init'; did you mean 'register_sysctl'? [-Werror=implicit-function-declaration]
    1618 |         register_sysctl_init("kernel", sched_cluster_sysctls);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         register_sysctl
   cc1: some warnings being treated as errors


vim +1618 kernel/sched/topology.c

  1615	
  1616	static int __init sched_cluster_sysctl_init(void)
  1617	{
> 1618		register_sysctl_init("kernel", sched_cluster_sysctls);
  1619		return 0;
  1620	}
  1621	late_initcall(sched_cluster_sysctl_init);
  1622	#endif
  1623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
