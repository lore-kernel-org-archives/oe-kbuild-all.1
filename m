Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070997;
	b=T2SOXCoFTqEWNr3EqAV1uEwx1XsaXFKJV9JKzJqRfyTtdRWz8nX+pdCpVUxbUSav5pqq
	 pOvltu0E6/xBgmLoMCHLmOjeV6Iid+1+7x1tX9suO7ElywIUxAQeHfNtX/Bnj0oBDCouV
	 sIGqQggTnYFx0hM5aNAK37ZTgiIjbCKIVRRbTZB9dUeFUBVQYSZmugqR36fMbfsTrJeqG
	 rAH3S3lxeBgZVjPzX/R3jmI1O9tHDHEj0sClSXgPO3Z1nSmn1LG/XnzkUz+A8Y1IFkVN7
	 OyqL4Fib34xVDqJbXTkR6i6EU39zMdW2BFj4D6N+cDo9px2MvNLcWrd6urKqsWwbgGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070997;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=na6CmjoEWnRN1pnPcWXFG6g/Wg/h6lgoRHQAayVmCn0=;
	b=zfSCBosC25luqOW2QSMmokU3IzXrUivDEKRlZVsBPg5ykzv5DgLmYdkzJ9ft62oYTmnA
	 sBFtROTK0T5meDzh0sNz3QZWQnbTk/4Hp51qzdcyijxNcPiDSsbEzH/po2TsHx4Ym/I87
	 I12/F3r32+0rDx5H+IiEAJK5qz6eUTt/7Lf/G/qAaDNYJ7eZuiLR/49pxbDcDGf24FyEu
	 t/CWXAeH1L4bA8uNKNhBiosAokQBIAEJT90GJYwM50HMYsR9CDT3FpjfUo/WrdlA+toP6
	 6a+zs2eh1pqbwvR19+49Q/+LDNIkVjS5hbvp8WWNlumN3yCYTQ6c67ug4V7W9xoVkCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bgThC3Wh;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76454606A334
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 06:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76454606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bgThC3Wh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795070997; x=1826606997;
  h=date:from:to:cc:subject:message-id;
  bh=aBINvnL5iZI+RGxS7zdBju4eFiyPvjzkh/TrtHaM4os=;
  b=bgThC3WhKiwRU956Z8d6nKMP2YjAu2lJ2Z9LaN/bFDUyMKBlZrnS8HXN
   zrtjLLfZXKmzklYpe1r7URdzc/wAvs8o5pcRn+36i9c4pLxTRn2mNvbL/
   9u2R3f2WQYORiY0iGhlJk3bWwxhXBefh8TIAIQ5smJZUoEmoVEppxVktR
   uIYjn/HgJjIpDYmmeJ8ZZJamdsww0e09GGWFtK1clTVFcMq3u7sYnBiNy
   kVxBOL4deH0m2fxKfikwxqlsjGw+rRk+PzmUt2FqjZbUaJE4mah2wUBgi
   XOSlifjbcFujnbLIFoTHc/F9udhQ2AHoNHlzL8HS1DvpiUnTTXhtsqVtJ
   g==;
X-CSE-ConnectionGUID: 9PNasbmnT8KZ4/8VELAEew==
X-CSE-MsgGUID: KO1ydlZIQlWPxJ6MRyDVag==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3828242"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3828242"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 22:49:56 -0800
X-CSE-ConnectionGUID: 3c96Hjh8SYSc/DoljEXl7w==
X-CSE-MsgGUID: BbmGNgiqR922cnRUcTburQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10691307"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2026 22:49:55 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTvxw-000000003hT-1avz;
	Thu, 19 Nov 2026 06:49:52 +0000
Date: Thu, 19 Nov 2026 07:49:39 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/resched_ipi_for_non_waiting_req 1/6]
 arch/s390/kernel/smp.c:534:1: warning: parameter names (without types) in
 function declaration
Message-ID: <20261119073955.8OHVqLSu-lkp@intel.com>
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
config: s390-randconfig-2000-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119073955.8OHVqLSu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119073955.8OHVqLSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119073955.8OHVqLSu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/s390/kernel/smp.c:534:1: warning: data definition has no type or storage class
    EXPORT_SYMBOL_FOR_KVM(arch_smp_send_reschedule);
    ^~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/smp.c:534:1: error: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_FOR_KVM' [-Werror=implicit-int]
>> arch/s390/kernel/smp.c:534:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


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
