Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B103D964
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 05:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706679940; cv=none; b=a1PQzbhIH0zGw/FFWlCk/Bp3qrWme/CFtxyos6Z/qeQN+/uLP+bGAe+AmVUSqx0RqkPUUSWJWHCa3qyaDBg9SAo5zmGvnA6Oneah8NC7pU3V6CeaO4sQ+nkU8U40EFj2eI0Qpjsq7/q1SjSLOh5KyThkfEgCygHQs4dzYhseO3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706679940; c=relaxed/simple;
	bh=75oGbPgkiPujkJZuyEZVjD45aLIy5wfhS/c+UQkVziQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AyPBpQWvP1OYwxL9TtavqYBSLjniCUv6pfXUqe83NMotyE07HDa1+203SENxKt7Z/9mMZC6CkuyHQYvWzWNygAmpb8QQlQEvz7vKd7i504J5HCCnB9xAWwPXPJUvtNnKi0dAjjk8bjMHTWEEzyt/ivtaKkM8Qwt5BY0KfLeXn8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P4VmCXMV; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P4VmCXMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706679938; x=1738215938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=75oGbPgkiPujkJZuyEZVjD45aLIy5wfhS/c+UQkVziQ=;
  b=P4VmCXMV6ob3eJZjGaYYdGxw2N6YSse/f3OQ8ypphKrSkP9Hfen0OOR1
   //DR/x2Od06110MTiyz+VFLDKnOSZLGHfCYKjjUlBhpaI0TA7WkF7lr3K
   Y0baGkgLiwsmD/c/6HsfkXySowAcBU08RFh/fMFliF2dxTkVBLCzgp/4Z
   zkTt4CYwBTxLWl3v4a513/tJ4IYftfLgJr7KB6Flg45D6zx/TJgPdegNw
   KectQ+Lp2+YXvwWYtaXo6FoILaNL3NVI2AOGKDLopB2qzTPT8D/4MVQlL
   NIKx8mmHf8c1pX0U+t8MtNiEZZ1FEsJW7l6tCW9vfZrrseotABODoKD4a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="400638452"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="400638452"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 21:45:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3967974"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2024 21:45:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV3Oj-0001Aa-0B;
	Wed, 31 Jan 2024 05:44:49 +0000
Date: Wed, 31 Jan 2024 13:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Shi <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:schedtest 12/12] kernel/sched/fair.c:9748:48: error:
 implicit declaration of function 'cpu_core_flags'
Message-ID: <202401311303.MEmeViJC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git schedtest
head:   b92ab0e6c7d969d7c8b42f8a5ff7e1e73f63599b
commit: b92ab0e6c7d969d7c8b42f8a5ff7e1e73f63599b [12/12] sched/fair: change sched asym checking condition
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240131/202401311303.MEmeViJC-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311303.MEmeViJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311303.MEmeViJC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:23,
                    from include/linux/cpumask.h:10,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'sched_use_asym_prio':
>> kernel/sched/fair.c:9748:48: error: implicit declaration of function 'cpu_core_flags' [-Werror=implicit-function-declaration]
    9748 |                 (is_core_idle(cpu) && test_bit(cpu_core_flags(), (void*)&sd->flags));
         |                                                ^~~~~~~~~~~~~~
   include/linux/bitops.h:49:32: note: in definition of macro 'bitop'
      49 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   kernel/sched/fair.c:9748:39: note: in expansion of macro 'test_bit'
    9748 |                 (is_core_idle(cpu) && test_bit(cpu_core_flags(), (void*)&sd->flags));
         |                                       ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu_core_flags +9748 kernel/sched/fair.c

  9730	
  9731	/**
  9732	 * sched_use_asym_prio - Check whether asym_packing priority must be used
  9733	 * @sd:		The scheduling domain of the load balancing
  9734	 * @cpu:	A CPU
  9735	 *
  9736	 * Always use CPU priority when balancing load between SMT siblings. When
  9737	 * balancing load between cores, it is not sufficient that @cpu is idle. Only
  9738	 * use CPU priority if the whole core is idle.
  9739	 *
  9740	 * Returns: True if the priority of @cpu must be followed. False otherwise.
  9741	 */
  9742	static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
  9743	{
  9744		if (!(sd->flags & SD_ASYM_PACKING))
  9745			return false;
  9746	
  9747		return (sd->flags & SD_SHARE_CPUCAPACITY) ||
> 9748			(is_core_idle(cpu) && test_bit(cpu_core_flags(), (void*)&sd->flags));
  9749	}
  9750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
