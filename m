Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB41BBBE7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722926201; cv=none; b=etelb8jIESdemfKtrzXrdBo/97O7H7uT43s8S331nLAm4bGhZ2QojtUJOxCHYXKmniRsVTwj+8WLpERG6n9knFvbeOo/uqLd2AIybDfFJCscz1iP6TGVW8nLE2cdcUdbS1Kw1FNHSElBGqrli9ynlOEq1xKti/HK6WdKddCrE9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722926201; c=relaxed/simple;
	bh=WvjXVqMgIHNBzLPVMDq3OGIZCK1YXO+APiGoFIJzZ/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ApRsYIW83M1GQKNpIsqgeKY+ebomxRRetXkaXR/W1CQTultGLKAfKIJ7XxBgd8ROQ7JpH8eMzorTvsIRuu5X7BYDafLlRSN3XzDkNEUKaU1yjvMEhXvMku8iZLRIJjwXCfD1E0BYq+k5BoyLsmfUltDuMQpOMKWRuUsqBJJv0yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=foak2iOY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="foak2iOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722926200; x=1754462200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WvjXVqMgIHNBzLPVMDq3OGIZCK1YXO+APiGoFIJzZ/4=;
  b=foak2iOY+OBP3R95pXKNObz2KFJ3wdrAAK/S++ftiMOmznlTAxatgQLe
   VbpftYnEX6qCHkG8VqlxYnUKoJELe9erg21YfyYGhKNsJQGeMQoauDZOD
   UG3XOYpbzUW1GM1qeRn2jcP2rII7hiHa45O4OcY9IlPOno6rLQlKLTKsj
   dW68k8qUFn1RRx8z/60bRH+VTvOi1MdVlZter6p085vd9bd5AZk1ggC9p
   r0FFTZ5havvbUBBTtpX/sUt15c/vBKXdPhQw1e/unUa8TcZ/nWlGgKSYN
   W2my2dZkmXVbUc/G1T54mkk1sC3HhGsJ25fm3tMvvdlV//E6D/wn6WfB1
   A==;
X-CSE-ConnectionGUID: OmQfOoT0T66/quZNkRftOw==
X-CSE-MsgGUID: DzystwfUR5u0/lAWS4IbkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31584503"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="31584503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 23:36:39 -0700
X-CSE-ConnectionGUID: 92FQbekPQ6+Hr0sUy7aiqQ==
X-CSE-MsgGUID: Y/16wGDzRrqr7uOhkVh9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="56488516"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2024 23:36:38 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbDoA-0004EI-2z;
	Tue, 06 Aug 2024 06:36:34 +0000
Date: Tue, 6 Aug 2024 14:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Rae Moar <rmoar@google.com>
Subject: [shuah-kselftest:kunit-fixes 1/1] ERROR: modpost: "__start_rodata"
 [lib/kunit/kunit.ko] undefined!
Message-ID: <202408061415.kUsu2ZFf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit-fixes
head:   7d3c33b290b1ed0348b48f54911a726241331961
commit: 7d3c33b290b1ed0348b48f54911a726241331961 [1/1] kunit: Device wrappers should also manage driver name
config: parisc-randconfig-002-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061415.kUsu2ZFf-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061415.kUsu2ZFf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061415.kUsu2ZFf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "__start_rodata" [lib/kunit/kunit.ko] undefined!
>> ERROR: modpost: "__end_rodata" [lib/kunit/kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
