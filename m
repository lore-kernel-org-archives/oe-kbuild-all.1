Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074121;
	b=vZvBhI++vLQnn6OOzJtDB3G7EU+4ItjzPl6tZAvdNhwEEouy34/SYc6Nyu4uC8PrjsoH
	 iVR9JXYml7mk9yGdaUmJ9YJCm2KU+6Sp+eg5UCTxiv6ky6lZfSZmUVGS3Bv+X1/95/KLp
	 gd0ckZsepoC9tFnzpVhzKIIJhtJyjJGkIf/7vYD5rfF3tRw589NjpWyF5TdIdprg7UeZV
	 188vclVdPjMligV2lDr+26tPxvmQlR1xVXM+Cs1unQqDg8ZrVp0rWNnNdwBuLgfc3eDIt
	 CYBUHjdic+Rqtil5kvyzT2OYdZn+/89sxDC0ZtnJqE7VuXXgQGym13xrL2qyJAUu8+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074121;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bYbAWpZSEDJU8THBqjZUijf/Dd6b9FVeyFftcyNsbzQ=;
	b=odLe/zac3tiRqCkaRC2hzxi4i0HZVaWm8npywk+g6396oyTWIyap0ri3OPqvkePP4Kj1
	 SEkwrh3dvoBjD+74FcCa/xCyNrkeEYj/6+hAh5IkSzUlwhC6/qfKeneEckcDzwzntsI3c
	 enKa4wZAc6nL9phJ1kquUVRkg6N6G04pHrw/s6U45mvstxVr9as95OfMPKs9BinlprmZv
	 Xv1hCSAFa/Ii+haOHDn/1q7XXj+DvO/nlNpBPd3KgGXcKNLzCaWean60NhsRCUWBRXnO8
	 CEp1wk6ZqQktCBq/XKZEqow3H9aStVV9rvNu2/uv+Or3BqbcZfIP6NEaJW0dvypF1Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VDDm2RcU;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65520606A325
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 07:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65520606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VDDm2RcU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795074122; x=1826610122;
  h=date:from:to:cc:subject:message-id;
  bh=9b/kqvMvkEIos4hgUJQdNlAK8RnVtEnxLQAwikIi1Rk=;
  b=VDDm2RcUjCiK+Ejp6MxzXOjygpqa1xRmSCXTEkJlKDd5ltYFuVHhUe77
   ivd2qzoDNezumxTIPM4DQ2/oVmZflQuCQZh8Lhwv9ikChF2/EcOks3wEk
   WXUbrOB9DiiWYgfdUZL3SGtPurac8LfFQlOGXLqrKiBTLJy8v8ikGf/k2
   h9F1EKtK6ffw3I92dgTeXwHac+9KJ3a+Htc7pHtNrrmHPLzPtbHuQfACP
   /whP6J3sogL9WB/Kv/8okqbBKYncl9kEZxd1UYjybE++Ogulrhb7BDZl3
   ZXrf0OsVfUm37r7vGGDBmUWm15NCkN0d7nw/D0ketnjFDH5uphO/ML1oc
   g==;
X-CSE-ConnectionGUID: /nz0/rPWTdWo+luF7xqBgA==
X-CSE-MsgGUID: MFbMT26gQnuoZdODeW1iBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3832909"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3832909"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 23:42:01 -0800
X-CSE-ConnectionGUID: xjqngMbpQzGA9O7OuAGoWw==
X-CSE-MsgGUID: VQ83TAeKRg6t0ytQ0VrZFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10357527"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2026 23:42:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTwmK-000000003iF-0qIo;
	Thu, 19 Nov 2026 07:41:56 +0000
Date: Thu, 19 Nov 2026 08:41:55 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/resched_ipi_for_non_waiting_req 1/6]
 arch/s390/kernel/smp.c:534:1: error: type defaults to 'int' in declaration of
 'EXPORT_SYMBOL_FOR_KVM'
Message-ID: <20261119084116.yO9VHmJ1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/sean-jc/linux x86/resched_ipi_for_non_waiting_req
head:   769450d587b91613f4275a4be6cae3418f32bb17
commit: 2cc0d8d1272ddf4c03128471342b6cfadd7d6311 [1/6] s390/smp: Export arch_smp_send_reschedule() for KVM when kvm.ko is a module
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261119/20261119084116.yO9VHmJ1-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119084116.yO9VHmJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119084116.yO9VHmJ1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/s390/kernel/smp.c:534:1: warning: data definition has no type or storage class
     534 | EXPORT_SYMBOL_FOR_KVM(arch_smp_send_reschedule);
         | ^~~~~~~~~~~~~~~~~~~~~
>> arch/s390/kernel/smp.c:534:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_FOR_KVM' [-Wimplicit-int]
>> arch/s390/kernel/smp.c:534:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +534 arch/s390/kernel/smp.c

   524	
   525	/*
   526	 * this function sends a 'reschedule' IPI to another CPU.
   527	 * it goes straight through and wastes no time serializing
   528	 * anything. Worst case is that we lose a reschedule ...
   529	 */
   530	void arch_smp_send_reschedule(int cpu)
   531	{
   532		pcpu_ec_call(per_cpu_ptr(&pcpu_devices, cpu), ec_schedule);
   533	}
 > 534	EXPORT_SYMBOL_FOR_KVM(arch_smp_send_reschedule);
   535	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
