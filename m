Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CAF22A7E1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016350; cv=none; b=h0bcktvrCjqsj1A6Y9aTfkH+wmRD/VQ90nubI3mRcEs+Rp+42/IzkOBwnc+afT690Sld7iel+sr+IE1izFbaY9NB8kdQu0rTqv/guLwo7tPsAOkP4NZrLn0YIUsKHl4yuKutMPvB239BSD0LR1OFJGd5eV/S32m1Lj+aNnj6VzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016350; c=relaxed/simple;
	bh=PFCfCYkPbcIeP2dyV8Ar7dehrc6RjjqYE9WXcqp2UmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KONJjRCKIxzTvLCniAGa5xrPHPC874Ni8H3LXoDXdWgDD2CQRi59OYSraBIBn4LaoOgP1AKns1xqDn6DdYgZi559S8XWQ3YN7mltve7SmhnOifYJwt9f2lNzuEdLQ7Nj5Wbpm7sSn0TJjAkxj4gWNlEHPM0K3OT3H1gNbR99qcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbfcxZuw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbfcxZuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744016348; x=1775552348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PFCfCYkPbcIeP2dyV8Ar7dehrc6RjjqYE9WXcqp2UmI=;
  b=ZbfcxZuw/V7lYxsQzHGc+qk3FTBypnrhh7bVK8MX+Sm3RuzaOzLR38T2
   Ix9FaGEB1LXik/Ha+V4jCSlQs/Kinh7Zu6AWjH144jjuKNz82g8puQ9md
   tPpDziHjZf/EDeyPIsEn/2ygHsPjpVaZq3EEkvLD0AmAvmQ/kFybSa1pQ
   4QrPY/jcpPHBIxg3Kc1L8NVNcTPdlhtzPsA52aj8LDPmuhGZCqjGr3d01
   5fuP3UH4jeYochtGKVDWfp7DYnKpfiD7emgMf7Cu2b8JCR39ByD4hfdE1
   bnlRyh53XpyIa3fzeOZ9m2X/RKNqqmSzHetJDPlR7EMnZYGXsULK3mvty
   w==;
X-CSE-ConnectionGUID: HHm7FC3uTKqsGXiKuriWzQ==
X-CSE-MsgGUID: XvekR5AlR0SA9bkHDbpWIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45103848"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45103848"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 01:59:07 -0700
X-CSE-ConnectionGUID: XC1wt8IaQvGjtinglbcfMg==
X-CSE-MsgGUID: 28+r3v9GSRuwL9CPujKg5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="158876371"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2025 01:59:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1iJs-0003BN-0R;
	Mon, 07 Apr 2025 08:59:04 +0000
Date: Mon, 7 Apr 2025 16:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:dev-shazptr 8/9] ERROR: modpost: "synchronize_shazptr"
 [kernel/rcu/rcuscale.ko] undefined!
Message-ID: <202504071622.SuXBSI3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git dev-shazptr
head:   963a9158eb230d764e011214d5f820a6c312e398
commit: 45e3e9c4ea4423dc404522122a3284a54ee6c84b [8/9] rcuscale: Add tests for simple hazard pointers
config: riscv-randconfig-001-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071622.SuXBSI3D-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071622.SuXBSI3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071622.SuXBSI3D-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "synchronize_shazptr" [kernel/rcu/rcuscale.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
