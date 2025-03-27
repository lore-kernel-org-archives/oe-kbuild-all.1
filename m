Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A021AB6D8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 03:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045981; cv=none; b=EAMkTjWNMrQBpgFmO3Z+pd7Wryu0RFwr48kcj4yTy+6Kb1C8WlZx51cfZRqvUIvZ9debiuCU/Kl2h+wqDE3u8+nt5CnUkSQNm3fmDupbrObGpArWejo2RC3baAkQPim6G+zFFwMZV6ClWaGuvkCbJWUxK0wSxl5+LXuoazytMRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045981; c=relaxed/simple;
	bh=id7mGlnKmc1JfA/h2qs5TGe4ktgGO0KFAo5mMQ6W5Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KqF+LsgdzjsTjFF2qk4PT4PaPULIga2SNm6DqJeXdP6ajE8e+dSHjfwDf0JCu9eDRKlhSRZNdf0QDL96c8RflP1KQVbccREgJPV+ub40GEZ2CjLVugmJABBra5u5vDHgspBmavz1EwB9niTqih9VnP6iSmbIBCLaUCwGQXssM10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNDYNkqi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNDYNkqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743045979; x=1774581979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=id7mGlnKmc1JfA/h2qs5TGe4ktgGO0KFAo5mMQ6W5Vs=;
  b=DNDYNkqimh6kI/PjRSNmLyvLZOS33tj4DiTSq6l3TCLlUIt9j64MkK3m
   Lc6anBkCDE1PxFal9jx4vJ4RgkftFooCm4dcMQwOtq1XFPHb4C3qcr+7a
   nlaL8KiolNoPLDH2m0emNo4T7xiK7LyeWTSPMCvFHzZrfPdTJpEBNfXHI
   zg9+EOBZiYB45u3OicxbXh34HvW1SXQ6ZfboxKp+uB3L+MdeQtBHaJ7g2
   1ad4yIkDjg886RvLL3DnI9jTvSKQp6f2wmBaFjZI/9Kixf47J5qD5eOvf
   fEbAuwpoLJ4t6YZsFKfzaJYxm61tvIZNFPyicjlco/6oJ725SV15wC1og
   g==;
X-CSE-ConnectionGUID: UdiA/vDtQGiuamHsxiG3sg==
X-CSE-MsgGUID: SVE5JuP5RtGXdd+4riDdHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55019448"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="55019448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 20:26:19 -0700
X-CSE-ConnectionGUID: /851fQW7S7et0bn2FdHx2Q==
X-CSE-MsgGUID: NvcXmhsZTvKv2eYTfkErLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="129852331"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 26 Mar 2025 20:26:18 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txdsh-0006K6-0E;
	Thu, 27 Mar 2025 03:26:12 +0000
Date: Thu, 27 Mar 2025 11:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 15/21] ld: uapi.c:undefined
 reference to `__kunit_do_failed_assertion'
Message-ID: <202503271124.1NQspOCy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   c1f41508dfc38dc5750d2b2c5b29f1f819ae053a
commit: 926e32cf9160e7403dbe68341e15fc5e583c1aae [15/21] kunit: Introduce UAPI testing framework
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250327/202503271124.1NQspOCy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271124.1NQspOCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271124.1NQspOCy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: lib/kunit/uapi.o: in function `kunit_uapi_printk_subtest_lines':
   uapi.c:(.text+0x199): undefined reference to `kunit_log_append'
   ld: lib/kunit/uapi.o: in function `kunit_uapi_run_kselftest':
   uapi.c:(.text+0x39a): undefined reference to `kunit_fail_assert_format'
>> ld: uapi.c:(.text+0x3aa): undefined reference to `__kunit_do_failed_assertion'
>> ld: uapi.c:(.text+0x407): undefined reference to `kunit_fail_assert_format'
   ld: uapi.c:(.text+0x415): undefined reference to `__kunit_do_failed_assertion'
   ld: uapi.c:(.text+0x546): undefined reference to `kunit_fail_assert_format'
   ld: uapi.c:(.text+0x554): undefined reference to `__kunit_do_failed_assertion'
   ld: uapi.c:(.text+0x620): undefined reference to `kunit_fail_assert_format'
   ld: uapi.c:(.text+0x62e): undefined reference to `__kunit_do_failed_assertion'
   ld: uapi.c:(.text+0x660): undefined reference to `kunit_fail_assert_format'
   ld: uapi.c:(.text+0x66e): undefined reference to `__kunit_do_failed_assertion'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
