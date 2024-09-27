Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AA317107F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 05:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727414940; cv=none; b=PufgPEbdvVomAIPxh3V5JuhipsQ4jynLYyAmvGWIa723JDFxlvB0bxeEFBOA0B4en2tAdLH6QCAW3b0BUiSSZRrysqOfjtXKhmc2HMqwijlL3Xs/1DF25I20SWQuIhF3eAeyjl4hXw+NvruLVCIkgnHayemYtH/5ukagIwN8O7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727414940; c=relaxed/simple;
	bh=LrC8wHDySnfFsJF7XEbXIZ9BU5eTLKnIwwuPwximyTM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lPc0VAH5keiGFaNTfmLhZLEM+vYkxskkqSHeelBCBs4EANnSUA9BrqhlOkQSs8g007g9UV3W/uD1djNZN+g6a9mqGfRwd2fzqb6xaZg+JsKmmXo/W30JeqG2HOUr/VLVhvU4VYpkAguNiQ2f3RAocTIDgz0EeskGGvRlZAUMfk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDC2x4xw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDC2x4xw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727414938; x=1758950938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrC8wHDySnfFsJF7XEbXIZ9BU5eTLKnIwwuPwximyTM=;
  b=dDC2x4xwdd7U6TplRd+6/p/dqgBGdi+yTAYHN5VZPzbtpwRZSIi29DMo
   qkCIE8MDRR/9FPsmBZLvsSRXrENBScInxT7lMcPk+x3aTt8XNT8IF36nw
   /IvFIBk0fbf6ZKUkvBJCSCXiWzqQLTWSqSHC0+kPh5GqrgW3C++qJyHtX
   3EHh+E690xfILtmBa/BAiBpoOeymuKmD/YdfI1oKDJ6r3Npx3/vG37VF0
   L2hLD1N00wXw5Qb5xicGN5Fi7eFYe+bdBqNgiVT456fxKNeSa9zmiWT9V
   3f7dd2gL7NF3ZArXNEV9eW+dTq1palGFgAYrc+YtfbBl2tDK2YRUsKfXt
   A==;
X-CSE-ConnectionGUID: caH2aElLRkqnjRgaf8MrNQ==
X-CSE-MsgGUID: LYDfiJSnQrK9ouuDaXoJ2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26722853"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="26722853"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 22:28:57 -0700
X-CSE-ConnectionGUID: mgSN7Q1KTTezamyk+sDKog==
X-CSE-MsgGUID: L8llLNUORJC2MCQqLVVOBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76927399"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2024 22:28:56 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su3XC-000LW0-2P;
	Fri, 27 Sep 2024 05:28:54 +0000
Date: Fri, 27 Sep 2024 13:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/affinity-v4 11/20]
 kernel/sched/core.c:3428:39: error: 'p' undeclared
Message-ID: <202409271359.mSliXtik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/affinity-v4
head:   c98b17d85bd1b6b8919504cc48995765c3ef5756
commit: c147dfb3fc25b06f03dff1afcab62c99adbbca66 [11/20] sched: Handle CPU isolation on last resort fallback rq selection
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240927/202409271359.mSliXtik-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271359.mSliXtik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409271359.mSliXtik-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'task_cpu_fallback_mask':
>> kernel/sched/core.c:3428:39: error: 'p' undeclared (first use in this function)
    3428 |         mask = task_cpu_possible_mask(p);
         |                                       ^
   kernel/sched/core.c:3428:39: note: each undeclared identifier is reported only once for each function it appears in


vim +/p +3428 kernel/sched/core.c

  3423	
  3424	static const struct cpumask *task_cpu_fallback_mask(struct task_struct *t)
  3425	{
  3426		const struct cpumask *mask;
  3427	
> 3428		mask = task_cpu_possible_mask(p);
  3429		/*
  3430		 * Architectures that overrides the task possible mask
  3431		 * must handle CPU isolation.
  3432		 */
  3433		if (mask != cpu_possible_mask)
  3434			return mask;
  3435		else
  3436			return housekeeping_cpumask(HK_TYPE_TICK);
  3437	}
  3438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
