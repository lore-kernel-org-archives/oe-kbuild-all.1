Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274F114AD0D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758151003; cv=none; b=Z025nAMGOqqnkwvzszNEyhrFwXNB5m262C5O0Psp0oRGd/ILF5Wroj1NTCy+SqS1YY5Ct6MqIc+gHask1lyfkJApGiaSaO/MlGvGcQ86rP7UBWGJxeL6Z73tW8U1hw7XXWvyX47vST6WdVOh81XXGNbwbLRB9e39B90TkhTt0BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758151003; c=relaxed/simple;
	bh=N42wga4SqLAjMjym/NbIM45zqp1IhWKQp7tst40HpqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctzoqrlqsmIGtrdssThDavtG639LPoPghrQfrBlm2Ca0UExfuolBrRuXfLqUnCnSwRZHmv5VTxbQFPea70qCCCLZM8a9TsY5bUuTPKaEdil/Zjah6xlGEOpYpfmlKvCcjcykKIpP50zn5+l/AZ20VoKhOSw23ZZhpu5yWhLqL08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep3eGC7x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ep3eGC7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758151001; x=1789687001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N42wga4SqLAjMjym/NbIM45zqp1IhWKQp7tst40HpqA=;
  b=ep3eGC7xCQCbvtSKDLD3JZG+MIa4xg7BYfOeQKR5zjA7/Am+m1VIlqrB
   o0P6C4aeu3GUiO8LX8pUlJdsbzCFLGN6za7rOwSUq0zSe0j9vRgQ4POem
   dGRdGSc+HsZvHlamccBaWzz5fNjwY5FkIDVkWQsarFeBFsUa08hSuuWdV
   3ZeDIIXJ4oo55TUaGm+2qZ+W8gBazs1DWssan4PlRuvWOFweZGUFjtd1R
   ZjD0mdV1NdnFq0AAezP95fhSX3+/broP0EEh3uybnQbSpjTGxOvipg1Yb
   LF+sRaF41ZXA8ONHMbPK5q7XrfcwUb4LfbSsQOPepak3fzo5cw+2dJDYc
   w==;
X-CSE-ConnectionGUID: kPpj6KdRS8S8JA1iWH/oxw==
X-CSE-MsgGUID: WgNeIoGDRkyvxnt4yxYi1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59692278"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="59692278"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 16:16:33 -0700
X-CSE-ConnectionGUID: dgZ6ouQxQ9SrWXQF4FXMxg==
X-CSE-MsgGUID: QH9Lkc0OS6ak1tXa++oo5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="179660376"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Sep 2025 16:16:32 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz1O1-0002Yp-2N;
	Wed, 17 Sep 2025 23:16:29 +0000
Date: Thu, 18 Sep 2025 07:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup
 detector
Message-ID: <202509180648.12pd8jUO-lkp@intel.com>
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916145122.416128-1-wangjinchao600@gmail.com>

Hi Jinchao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.17-rc6 next-20250917]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinchao-Wang/watchdog-Add-boot-time-selection-for-hard-lockup-detector/20250916-225719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250916145122.416128-1-wangjinchao600%40gmail.com
patch subject: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
config: riscv-randconfig-002-20250918 (https://download.01.org/0day-ci/archive/20250918/202509180648.12pd8jUO-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180648.12pd8jUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180648.12pd8jUO-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/watchdog.c: In function 'watchdog_hardlockup_enable':
>> kernel/watchdog.c:298:6: error: 'watchdog_hardlockup_enable_ptr' undeclared (first use in this function); did you mean 'watchdog_hardlockup_enable'?
     298 |  if (watchdog_hardlockup_enable_ptr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |      watchdog_hardlockup_enable
   kernel/watchdog.c:298:6: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/watchdog.c:299:3: error: implicit declaration of function 'watchdog_hardlockup_enable_ptr'; did you mean 'watchdog_hardlockup_enable'? [-Werror=implicit-function-declaration]
     299 |   watchdog_hardlockup_enable_ptr(cpu);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |   watchdog_hardlockup_enable
   kernel/watchdog.c: In function 'watchdog_hardlockup_disable':
>> kernel/watchdog.c:304:6: error: 'watchdog_hardlockup_disable_ptr' undeclared (first use in this function); did you mean 'watchdog_hardlockup_disable'?
     304 |  if (watchdog_hardlockup_disable_ptr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |      watchdog_hardlockup_disable
>> kernel/watchdog.c:305:3: error: implicit declaration of function 'watchdog_hardlockup_disable_ptr'; did you mean 'watchdog_hardlockup_disable'? [-Werror=implicit-function-declaration]
     305 |   watchdog_hardlockup_disable_ptr(cpu);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |   watchdog_hardlockup_disable
   kernel/watchdog.c: In function 'watchdog_hardlockup_probe':
>> kernel/watchdog.c:317:6: error: 'watchdog_hardlockup_probe_ptr' undeclared (first use in this function); did you mean 'watchdog_hardlockup_probe'?
     317 |  if (watchdog_hardlockup_probe_ptr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |      watchdog_hardlockup_probe
>> kernel/watchdog.c:318:10: error: implicit declaration of function 'watchdog_hardlockup_probe_ptr'; did you mean 'watchdog_hardlockup_probe'? [-Werror=implicit-function-declaration]
     318 |   return watchdog_hardlockup_probe_ptr();
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          watchdog_hardlockup_probe
   cc1: some warnings being treated as errors


vim +298 kernel/watchdog.c

   288	
   289	/*
   290	 * These functions can be overridden based on the configured hardlockdup detector.
   291	 *
   292	 * watchdog_hardlockup_enable/disable can be implemented to start and stop when
   293	 * softlockup watchdog start and stop. The detector must select the
   294	 * SOFTLOCKUP_DETECTOR Kconfig.
   295	 */
   296	void __weak watchdog_hardlockup_enable(unsigned int cpu)
   297	{
 > 298		if (watchdog_hardlockup_enable_ptr)
 > 299			watchdog_hardlockup_enable_ptr(cpu);
   300	}
   301	
   302	void __weak watchdog_hardlockup_disable(unsigned int cpu)
   303	{
 > 304		if (watchdog_hardlockup_disable_ptr)
 > 305			watchdog_hardlockup_disable_ptr(cpu);
   306	}
   307	
   308	/*
   309	 * Watchdog-detector specific API.
   310	 *
   311	 * Return 0 when hardlockup watchdog is available, negative value otherwise.
   312	 * Note that the negative value means that a delayed probe might
   313	 * succeed later.
   314	 */
   315	int __weak __init watchdog_hardlockup_probe(void)
   316	{
 > 317		if (watchdog_hardlockup_probe_ptr)
 > 318			return watchdog_hardlockup_probe_ptr();
   319	
   320		return -ENODEV;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
