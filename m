Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C04357A38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763554368; cv=none; b=JwJ6kM+FK+nM6SbRxIWGjlZFF47B+X/h9hKbNlFPvpdZ36gaAd9tSyU+KZbsEtPOY4XBnLj5kPCtsmi5nBYqT6dXMplVyJcJKs5EYL0nqV3+fAhaI7VUPyDYIbCAT4Gq/RK6d31O7sI4J4v8DaUIfINRU1CgEqXU2QZw9XPnWZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763554368; c=relaxed/simple;
	bh=cepeMUzN314aypj+77UHm8Lx1ORDn39tPxaieZyc4YI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oLfHtFmHupGwnSIE2ulNQw+sdH8iChOAvj6JpKH5skHYIB2v64ehYfuAEeocOwYcKEsnKJEYYiUHqSsHnsWZ2x3wjJYH+YvagiqgKy9zGQ06vDoPBWnNMux0n66HR+NKwxT562TlQtJ9G7jyTCSLLWihlI3VxjKZFF0yIPokgos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9e2cQIt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9e2cQIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763554365; x=1795090365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cepeMUzN314aypj+77UHm8Lx1ORDn39tPxaieZyc4YI=;
  b=R9e2cQItWuMKoUnS/pTMg3GPr9HmBsksWUb/ieDLogzcKn5vTpVUG65S
   +o+n3dIChEFEQR7Ljw2OoThTxAxLN9Vxgdy0D3m9D25b9n5Kpy8m7QJP4
   FinIBtQUq1s/qh8yCdwrvGmzmDsPUnXpSN0yagblBjjBDVrNOQgPphXRJ
   hyoXOuRuNAEboK19Z5IJ9ioFr/MfCtmVi2xVcMYJQhqWyM2r0ZekiitVv
   fINBl8DE+hXBMlR+AD8CEsGLcLE48R21Xbqaq9R1N5ScD8o5pI/2g5G63
   woEq1RoMVMi6puVUKhg1QOd1Ue2exJaJTiU4Y41aje6AS4ZsYIffmjaNs
   w==;
X-CSE-ConnectionGUID: EOs1SdDHQTqBB7+ZxqOnwg==
X-CSE-MsgGUID: CyMovcLtR2ysz9v6njWFCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="75917377"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="75917377"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:12:44 -0800
X-CSE-ConnectionGUID: lHxnkPc8SLejhdz2NxkJrA==
X-CSE-MsgGUID: L6iepiNNRNy6BLfq4SdEnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190306873"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Nov 2025 04:12:43 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLh3B-0002rl-0b;
	Wed, 19 Nov 2025 12:12:41 +0000
Date: Wed, 19 Nov 2025 20:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3278/3278] include/linux/xsched.h:309:28: error:
 array type has incomplete element type 'struct cgroup_file'
Message-ID: <202511192040.YIPXCVFH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dfb9bd9242c2350c127d51a126976ed386e9cc48
commit: aafde051ac61687823976cc892fb3c416101d694 [3278/3278] xsched: Add support for CFS quota for cgroups
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511192040.YIPXCVFH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511192040.YIPXCVFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511192040.YIPXCVFH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/xsched/vstream.c:23:
   include/linux/xsched.h:276:36: error: field 'css' has incomplete type
     276 |         struct cgroup_subsys_state css;
         |                                    ^~~
>> include/linux/xsched.h:309:28: error: array type has incomplete element type 'struct cgroup_file'
     309 |         struct cgroup_file xcu_file[NR_XCU_FILE_TYPES];
         |                            ^~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]


vim +309 include/linux/xsched.h

   272	
   273	/* Xsched scheduling control group */
   274	struct xsched_group {
   275		/* Cgroups controller structure */
   276		struct cgroup_subsys_state css;
   277	
   278		/* Control group settings: */
   279		int sched_class;
   280		int prio;
   281	
   282		/* Bandwidth setting: shares value set by user */
   283		u64 shares_cfg;
   284		u64 shares_cfg_red;
   285		u32 weight;
   286		u64 children_shares_sum;
   287	
   288		/* Bandwidth setting: maximal quota in period */
   289		s64 quota;
   290		/* record the runtime of operators during the period */
   291		s64 runtime;
   292		s64 period;
   293		struct hrtimer quota_timeout;
   294		struct work_struct refill_work;
   295	
   296		struct xsched_group_xcu_priv perxcu_priv[XSCHED_NR_CUS];
   297	
   298		/* Groups hierarchcy */
   299		struct xsched_group *parent;
   300		struct list_head children_groups;
   301		struct list_head group_node;
   302	
   303		spinlock_t lock;
   304	
   305		/* for XSE to move in perxcu */
   306		struct list_head members;
   307	
   308		/* to control the xcu.{period, quota, shares} files shown or not */
 > 309		struct cgroup_file xcu_file[NR_XCU_FILE_TYPES];
   310		struct work_struct file_show_work;
   311	};
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
