Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E501E0DE4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785516; cv=none; b=TCUbKL/FWUfmv9DyM/icNDQiarJAG3fNZh0i5kiz9MujySq8EU7165arpojcOxqrfAKq45R35v8aTex2IAI0E/axy0Y/djt0OeYE+YuzJwUEKDskrWaY5VQnrYYlzhgdWGucEV+d9FtXuQVx0l7Bd78Du6GvY+u1B7i6fJQN+pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785516; c=relaxed/simple;
	bh=ttFn4K1HM/qjq7RtRGfsWTEoaFJwd2PL4W1ABxm7ekQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ALTGnBbyz12TLkfTSPHo3V7xIiBgIoIhXKZD+66zO7VOWydNueBLADjxPtumVGGij6gVJlxIdDplq+CsRHDukRGyG0TEN3Vaq4f51ejSKmkBoY6pFHsM5GelxJa1tOLw4zLIqjLBRxRv7VFbdHHAjjWg3536O0cLCYBPhdSaTjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4QxFuNx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4QxFuNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738785515; x=1770321515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ttFn4K1HM/qjq7RtRGfsWTEoaFJwd2PL4W1ABxm7ekQ=;
  b=N4QxFuNxIhKJ33OTrsxySiqVyQ+lrjRzVR7hZUbBfxEHq+7ztm3WgIKU
   H3TxbYTp1iMA0nLRPfAIIu6kGWPKcP8Nb43NvMm9UENBEQInHEuHoCIFo
   urU/fOu9dpzpchlxPHpilzOl5v/vGQDGC9MAomh65mBTIqlSc6ksEXAt5
   NFcy47dDIoXYvTbMzsQX6JhaOYBdMeB+9/yTMKSLAsIYsx9OWd5yru8zF
   doZbXF6AD6ZglePgC7MNfr7eeI3Fh+DHw07oijhP6VnsIdrc9+UVOWagj
   /Y+r0raTdFwexo/y5YFM8Vm49YMI147lCZi5EpDMKMqcon+sicpdyom4E
   Q==;
X-CSE-ConnectionGUID: t/72iIUlRQKfCEE79kiyPw==
X-CSE-MsgGUID: A+HOWoqbSqKn0Xa91h3ykA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64724942"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="64724942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 11:58:34 -0800
X-CSE-ConnectionGUID: j9wQ7I0oRSK2HeZqX1ZxZw==
X-CSE-MsgGUID: 2n+An9ZlTAGvNEfmZtI9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115075128"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Feb 2025 11:58:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tflXb-000w0t-1u;
	Wed, 05 Feb 2025 19:58:31 +0000
Date: Thu, 6 Feb 2025 03:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 19/23] uapi.c:undefined
 reference to `kunit_unary_assert_format'
Message-ID: <202502060314.jBzQjaCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   c5dc664800bcb374e0ea3bcb152167b8dc1715c0
commit: 3fa629ee991a0fc313ed2402ea59462c01c399d6 [19/23] kunit: Introduce UAPI testing framework
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250206/202502060314.jBzQjaCE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060314.jBzQjaCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060314.jBzQjaCE-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: lib/kunit/uapi.o: in function `kunit_uapi_run_executable':
>> uapi.c:(.text+0x710): undefined reference to `kunit_unary_assert_format'
>> loongarch64-linux-ld: uapi.c:(.text+0x720): undefined reference to `kunit_unary_assert_format'
>> loongarch64-linux-ld: uapi.c:(.text+0x73c): undefined reference to `__kunit_do_failed_assertion'
>> loongarch64-linux-ld: uapi.c:(.text+0x8d8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: uapi.c:(.text+0x8e8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: uapi.c:(.text+0x908): undefined reference to `__kunit_do_failed_assertion'
   loongarch64-linux-ld: uapi.c:(.text+0x930): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: uapi.c:(.text+0x940): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: uapi.c:(.text+0x960): undefined reference to `__kunit_do_failed_assertion'
   loongarch64-linux-ld: uapi.c:(.text+0x9a8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: uapi.c:(.text+0x9c8): undefined reference to `kunit_binary_assert_format'
   loongarch64-linux-ld: uapi.c:(.text+0x9e8): undefined reference to `__kunit_do_failed_assertion'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
