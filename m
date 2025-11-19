Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50E274B2E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763546732; cv=none; b=KbhPJTAoJYMsN5NfwCLp9FxBHiryaScyLGrI0FYCjztqzyASYt38OKWO0sNHcL/glULuiKcg1R/L1OmVn+iCBhl13u/jlSQNS8jm9tKhTGESudtHv6LNHaycZ42W1W+odoDGH6MJv+Q0x/N9TtF0ej+QNz48xZs7qTiRTl2s5lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763546732; c=relaxed/simple;
	bh=ap/V9ZLaOO2ZxqU0sSBopYsyesCCH+KOvVpIoeg4srM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n02DXxQwywtjlnpE5XmhzMe4sjk+WyQ/sYxKhu7NlWAS5s3Ea15XYS3bUeLhklUxvIbwF9aPLoEl9we3Y9XdTs79VoOAVEehKeZQ+4R1KXeWWI0NvCbH5EPX7bX1nImKrtyFlJD6I5O/DVRWy+RujKG+bGIvM10UKlHCCJxIqX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLelnykw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLelnykw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763546730; x=1795082730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ap/V9ZLaOO2ZxqU0sSBopYsyesCCH+KOvVpIoeg4srM=;
  b=gLelnykw9mqAvj+5TKY2DvGqrztdalO0LtY6+zXfWoB4TNHyQdaMdR5P
   Nrueze5aVPem1pAEoQPmCHj7wEcn3O2Ba8ptnXGZkvl6wkdJ46mcSSKH6
   b2mB73R92juzh0hcaOedMykpC3mw3K9xfaNbOOE5XhXqy9OPftOenfYjK
   gGX9oIDppmJl1cWF7dM55Gvr4CX5vg7tjjd9cFBZCl53mARefrMUIDCR/
   bvAPTxR8diDC2L/0H36Zf3L8AmOnKrueZyyaSxfUmO15oLFNhXF/rSRQm
   emhJB4W+LDG2d+PFKjGFuGbvksvikchlb8bPvlLF1Il1rqM6XvHa/fndo
   A==;
X-CSE-ConnectionGUID: mvt5wbohSFKZ1dmFR6frlw==
X-CSE-MsgGUID: mgla6U9dRsio9ygxpaearw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="69200896"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="69200896"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:05:30 -0800
X-CSE-ConnectionGUID: BcHFflNXQaK33odfRrBILQ==
X-CSE-MsgGUID: Y6QxEPBuSAyEZz40ZnvmBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191049642"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Nov 2025 02:05:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLf42-0002i6-21;
	Wed, 19 Nov 2025 10:05:26 +0000
Date: Wed, 19 Nov 2025 18:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3278/3278] include/linux/xsched.h:265:36: error:
 field 'css' has incomplete type
Message-ID: <202511191730.FhCbWCm7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4552257bd9515ad6f78bd3691c7379beb42dc3cd
commit: 43bbefc53356009d3603faa2c6e6a2858f724e4d [3278/3278] xsched: Add XCU control group implementation and its backend in xsched CFS
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511191730.FhCbWCm7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191730.FhCbWCm7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191730.FhCbWCm7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/xsched/vstream.c:23:
>> include/linux/xsched.h:265:36: error: field 'css' has incomplete type
     265 |         struct cgroup_subsys_state css;
         |                                    ^~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +/css +265 include/linux/xsched.h

   261	
   262	/* Xsched scheduling control group */
   263	struct xsched_group {
   264		/* Cgroups controller structure */
 > 265		struct cgroup_subsys_state css;
   266	
   267		/* Control group settings: */
   268		int sched_class;
   269		int prio;
   270	
   271		/* Bandwidth setting: shares value set by user */
   272		u64 shares_cfg;
   273		u64 shares_cfg_red;
   274		u32 weight;
   275		u64 children_shares_sum;
   276	
   277		struct xsched_group_xcu_priv perxcu_priv[XSCHED_NR_CUS];
   278	
   279		/* Groups hierarchcy */
   280		struct xsched_group *parent;
   281		struct list_head children_groups;
   282		struct list_head group_node;
   283	
   284		spinlock_t lock;
   285	
   286		/* for XSE to move in perxcu */
   287		struct list_head members;
   288	};
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
