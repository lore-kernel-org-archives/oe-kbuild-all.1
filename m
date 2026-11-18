Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035945;
	b=lFomYX3rnrvxPMf8pKSu2lLM0Nws54Mo7zP5sRsRDsWx2OSLdKqvGBOYtPQmAOr/a2nm
	 EVLforG1wrUenDKNhpIJOAc3Q6aP9RTnNZpZni/u7MQZki+aGZ8XiR03FyK4bSwhUijMR
	 vJUHVBG/sg8m7Yes7HBzISyMgjLha/LjQ4h985fpbKkJ61cUNlywZRmCZwp5byyfGem67
	 oo0K5+/fRFBUq+DiEfZcP5J11k9TD7xTomgld9acnEnRhcE3924sqHQTsLqSfBZMB8yo1
	 mZkIuzzXLCcnwzAUSTTUCTbwD4Fdu4fl3UxyX2d71OnfEfsqMerUQwFRySh666LO6Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035945;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=a8W7BWB4/zorXfggmvq0DhD5YaqWMtnWss9rgEAVBtg=;
	b=d05u85wsXnN0N5ZDphk4pANvp3/AWsYdZpW6rlophBbbuI93qxgjcDw85oGbg2f3Xup7
	 MI7di9IV2nxpZGBmdgn9goIt4A6YCo9W7YLG8qkOijjSZIC0dguCt1QhaMyP6X3duRTf5
	 5keZntnPPVsHc0+CL1SkN9EzBENuLRKJm+RyYzXAnY4NRos1bxp5gfzcCGHSmxYFhxm9Y
	 RqOQ/cAh+xP/y8a+LB7EWZbq7Df9tQTbyyZplX2xDxPprsLA2ur4oresUYlO4H0vFoQwS
	 gGLgOPA6SKZvxOhJFZn7ktDHLnr8M94KBgwbAWnC6guDHwXrTcqQu7ohGRJGwZ3dZ+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jp2H5rpX;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53300606A325
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 21:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53300606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jp2H5rpX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795035944; x=1826571944;
  h=date:from:to:cc:subject:message-id;
  bh=kJBJwivjSXu2I4mfsdRiaJ7Ng/Aly1Eikzs4TP2CoQg=;
  b=jp2H5rpXSmtwv7DSHnJ911gtwF6dwrLX45PR94NznASofaJxNlerj3Pb
   pAvk5B3elsEDeOuLLAHmVjFO6/Ol1i2lUUWEK0ixQ9iyeXyDwoGd/HMrf
   X4pOW2NziO8iom1dQnojRd/gMkDPuHob84jcCiwWa+eNrC8caymwTj7JD
   sY54ISFr2xzUu7UiWu2xsgmRrB+LRW+NzOcaoYFKq08FnH0/GZKtofEEL
   nZgFfff0RD7jQxXSzjtPJ1QUF4/K+6yJB47EeUd0/ZWYDLIlx2cPXOm+i
   mdi5x4ngiT2vuJIEURq9IXzHfJg0XNzNdroE7mkSl5YA7o8ScAY5/PMMY
   g==;
X-CSE-ConnectionGUID: PTksGXFVS6qNzZ2q7fl2kA==
X-CSE-MsgGUID: kwXhvRiiTc2+fvywSFTnig==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3859817"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3859817"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 13:05:43 -0800
X-CSE-ConnectionGUID: QFlfxPC8Rru17YTn3qoH4Q==
X-CSE-MsgGUID: bK3VCoxjQFiPK6KQR5xY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10638987"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2026 13:05:42 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTmqa-000000003TN-2epb;
	Wed, 18 Nov 2026 21:05:40 +0000
Date: Wed, 18 Nov 2026 22:04:56 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-10 2/2]
 arch/arm64/kvm/hyp/nvhe/modules.c:128:10: sparse: sparse: symbol
 'num_dynamic_hcalls' was not declared. Should it be static?
Message-ID: <20261118220225.Uqf8e25H-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Quentin,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-10
head:   3f3979a2ea01ce57e5750d3dd06eb92b016b69de
commit: 081625b0457739645b1982b908e449e54f6037dd [2/2] ANDROID: KVM: arm64: Rework pKVM module locking
config: arm64-randconfig-r2307-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118220225.Uqf8e25H-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118220225.Uqf8e25H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118220225.Uqf8e25H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/modules.c:128:10: sparse: sparse: symbol 'num_dynamic_hcalls' was not declared. Should it be static?
>> arch/arm64/kvm/hyp/nvhe/modules.c:129:1: sparse: sparse: symbol 'dyn_hcall_lock' was not declared. Should it be static?

vim +/num_dynamic_hcalls +128 arch/arm64/kvm/hyp/nvhe/modules.c

bc68b420c1452e Vincent Donnefort 2022-09-27  127  
bc68b420c1452e Vincent Donnefort 2022-09-27 @128  atomic_t num_dynamic_hcalls = ATOMIC_INIT(0);
bc68b420c1452e Vincent Donnefort 2022-09-27 @129  DEFINE_HYP_SPINLOCK(dyn_hcall_lock);
bc68b420c1452e Vincent Donnefort 2022-09-27  130  

:::::: The code at line 128 was first introduced by commit
:::::: bc68b420c1452e2c029344d5c3954b8098e125e1 ANDROID: KVM: arm64: Add support for custom hypercall registration

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Will Deacon <willdeacon@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
