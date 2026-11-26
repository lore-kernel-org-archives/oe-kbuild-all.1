Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700583;
	b=R6eihFCutbTuNLQxtB2xZ6uJ/khRiP4qILpijpkNRpzFZYDf02qK8DbnP1bIStzDbe6P
	 W2lvLApRs8+DcFg4RrwVYkiUHmwkxRTDrLesjL1bB+3+04nknpjRjgoc6UGJBZ/ZajsqG
	 ypEq6vYdiqg1aeTUFu2PuUUc4DUOIOMh4rwRns+QuywjssxJGih2il0pzOi+JoweJMXL0
	 57DdWAgOSkQotY6nOVF1l91JQ2Ej7FpHIZCNkStEcF3glLp+uU0PIFZaaJ10oDboMqjhc
	 ztRgNXhuw6OtFV5Ip9ldXc/m4U4FkJD4XRvRBnfG7O7qez3pzmZpUN3IJHvrs5IUfrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700583;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9BhZdXl2Q1tHP7Lu0glWQCDUyKnXZxtdmxzHHmKLQ0U=;
	b=u9brt67ZbmScluEJeqDX3F2BVaP70GxF27T83UpRsOEzrfEOhc9ZinCdEb6rIs3089UY
	 GaVWqfYlKXBS175T5RVwiO2RZM6bFWm1vhwXW2L4OLRjp/LYNaHM+tFw6X6y/4iJ8iDNG
	 V9AWi+3FylPRp4jFilNlU5tQlXzhSVoLqWIDkj8qSxqjvQESHGx7+sea1L9ZevmEQQ516
	 5JzSh+UrLgGeSX6B7Typy79fsEGbmTAlJRnCP0n8ch0HMPF2kKQqqijKKfgqpqtqdjUW6
	 c/8MbDkN1H7SKPrXWkemBzcpazuxEpCs3FC8qCJUZ4fEpQa0nn1RrLaoU4U3bz5ltiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lu6SGAUm;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20B6606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 13:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B20B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lu6SGAUm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795700582; x=1827236582;
  h=date:from:to:cc:subject:message-id;
  bh=sI1sdO0Ar20cZoGVvHb4m9dL+kS8/MO3zKgljzb7ou4=;
  b=Lu6SGAUmneosV5DtYdvd7MIIXeAIRVLSegbBJ0wlYVhu8I+AlPcXf7UX
   Hu5jcb3dSLeNGxnxSIrl+Q6HhDZnsc0GgIBaRA1TwQtSu161DJZM+IKxK
   SBa8KJmqDDbA4fJ0LiTvdgoFVOeW/h0KjVaXLNHjt/XcfTD1yPxnhahfh
   fo7JFYscxbGXs44eEAQhsxINh47HzK/1ySiPTjyfhVlUD8ehR+jUK9Enq
   Y8zoyYNz8LuxcrkZHc90uy8D+PE3pLkrdC96Xivs3ITG7/EyzbPAZMlyo
   TNlyeSFl0orXaP839+S8NT5krzlVOe2C3nfAwHjWSP8Pdef3k0s1lMzPj
   A==;
X-CSE-ConnectionGUID: l9KTc4RiQDCIW6AxJOLHGg==
X-CSE-MsgGUID: 673ZbLYFTa2w/Ysa7QNlsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4521954"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4521954"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 05:43:02 -0800
X-CSE-ConnectionGUID: rRDAjKT6Sc2HQvVe+uUtzw==
X-CSE-MsgGUID: Hbz6JCHPT1CIGGHsyXDwKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="12069031"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2026 05:43:01 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWZkV-0000000004g-2Jln;
	Thu, 26 Nov 2026 13:42:55 +0000
Date: Thu, 26 Nov 2026 14:42:37 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 65/65]
 arch/arm64/kvm/arm.c:493:15: warning: no previous prototype for function
 'kvm_arch_vcpu_get_ip'
Message-ID: <20261126143811.GK49g8aQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Sean,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   36e3098ebf6d37570aab9dc5f8f4d24bd5ffdd06
commit: a2aa2a6c9491a807bb898220acb1062dd8226a12 [65/65] BACKPORT: KVM: Move x86's perf guest info callbacks to generic KVM
config: arm64-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126143811.GK49g8aQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126143811.GK49g8aQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126143811.GK49g8aQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:493:15: warning: no previous prototype for function 'kvm_arch_vcpu_get_ip' [-Wmissing-prototypes]
     493 | unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
         |               ^
   arch/arm64/kvm/arm.c:493:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     493 | unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
         | ^
         | static 
   1 warning generated.


vim +/kvm_arch_vcpu_get_ip +493 arch/arm64/kvm/arm.c

   492	
 > 493	unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
   494	{
   495		return *vcpu_pc(vcpu);
   496	}
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
