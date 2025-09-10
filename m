Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6A2D3ED9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757507357; cv=none; b=cQlBlLy7i4Er0xBwkqe1dR5s5+TytA2SjS+raK83UFVISCt1WYYGxtcK9noOfSUL5kTkXkGfhKAaDHzbhAwllKF/y+vRfUdV6pd9DnBCGweT3g5tUvrCJbB4rRWdPAo3NUSN8cV4ZOTEzklv8AESqe3BwknbLkS+NXV407rZiqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757507357; c=relaxed/simple;
	bh=ILlVyGxf1MtNLw/3diXcFFT66mEYJV2duV2FlRjYKUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HKsAeqe+Uv77HkUzfzeJP/j9uFYX1c6kGtVpByD/Bheb22Fb1tHIgZb2nigzNJROQi97No3WPex4vRHgkNEIKI30aQuk+CsgOu08NMn9LaqAgQIKqSzKliP9CYlM0jbOGHSaJtov48r6SJnVxcLpe973cTmz6b33hjlKwOkdloE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXrOMF4Z; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXrOMF4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757507355; x=1789043355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILlVyGxf1MtNLw/3diXcFFT66mEYJV2duV2FlRjYKUk=;
  b=lXrOMF4ZvNkdftP3CH2O0KA6Ku/2PcIwwkDA26W9Mm8ldPi3mWTKdajq
   tLqCrex0eVKFqga31tDiUWR+Z6t51PEmMsg5SLq8Xt9QQxpvDlNl4ElNF
   al4HXJU3kvVaP+xPs0mwDsl8AYkxkLzq64EwLSopt4iGnVqpYDI2Hv293
   fdT3bBCtfd7Yvb8aHOXN8GzPbDFOfXznb27maWdcgavO+6stH7WKZyHuO
   BiWnoYuhvgr8ULKKv9IwjDrBoGoclWubSplJAlFcwBiUuI21C/V0I/plg
   wH/knto/D56AxgYiRbQfjt+rbNaiVhJUaYVPsCnKfF7CgPv/vM+HzP9Ch
   w==;
X-CSE-ConnectionGUID: K5BROEaiSFyTDjIpZqvMTg==
X-CSE-MsgGUID: kW1g73tnRMOt8K0LIQNKnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="62444156"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="62444156"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 05:29:14 -0700
X-CSE-ConnectionGUID: I2POaQt7R1GzDKVS377tgg==
X-CSE-MsgGUID: jQss2a27RrKFP80tGvWh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="204149757"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2025 05:29:13 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwJwk-0005uv-1q;
	Wed, 10 Sep 2025 12:29:10 +0000
Date: Wed, 10 Sep 2025 20:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xu Raoqing <xuraoqing@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2861/2861] arch/arm64/kvm/arm.c:569:5: sparse:
 sparse: symbol 'kvm_arch_rec_init' was not declared. Should it be static?
Message-ID: <202509102008.TYNWJrfa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   de77e9c80efaf3890697ce25530864472e02bff3
commit: fa36fa3469d2461c1887e823371059401941ae8a [2861/2861] CCA: Fix cca kabi conflict
config: arm64-randconfig-r121-20250907 (https://download.01.org/0day-ci/archive/20250910/202509102008.TYNWJrfa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250910/202509102008.TYNWJrfa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509102008.TYNWJrfa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/arm.c:569:5: sparse: sparse: symbol 'kvm_arch_rec_init' was not declared. Should it be static?

vim +/kvm_arch_rec_init +569 arch/arm64/kvm/arm.c

   568	
 > 569	int kvm_arch_rec_init(struct kvm_vcpu_arch *vcpu_arch)
   570	{
   571		struct realm_rec *rec;
   572	
   573		rec = kzalloc(sizeof(struct realm_rec), GFP_KERNEL_ACCOUNT);
   574		if (!rec)
   575			return -ENOMEM;
   576		rec->mpidr = INVALID_HWID;
   577		vcpu_arch->rec = rec;
   578		return 0;
   579	}
   580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
