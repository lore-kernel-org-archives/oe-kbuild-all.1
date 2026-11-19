Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795064851;
	b=NByaeTqj7/47D036r4mt6WVlhPc1l/W7omkDAJvYM47841aHBDAscM2HDG1ZxusCn+TE
	 ZMlIn9OUtHw9dN0/HUHGBGj1/jEzBOnlmEuEATZVR2yhD7ocmYSu470c4YL1cTxVQcZgc
	 DTlqNw7ddZe1Nd/fY7Cwvd872ns4jP6ycF4gKM4PSZF9bKXNqq+rjw5kXdMnQO1wvuKL5
	 mF7Ef8WVJFoI7XssNDGS240q/t0gPd6mdwzLqgfnSexIhvWwbwqS0bvV8e3dOQwaNyy+o
	 SCyMOQTlT6XXX7P8lWY4EDwcixp5ywU2TYN46UpXQJ0UDy8sDFG86pBVrLCUDZQbwMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795064851;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=h7EvgOUr72PkOlvM+bRXaabASGp2I9GoFSH7z0FfQLQ=;
	b=sy/2Ldii+Pm2+glcrjlGHe2xciUKuEuV9pgQNmxa5tWww5pe0rBI9zIu9Pd77/RZInce
	 OGwiHDJ0DIV2A+RePtWyXwQ9QaaUuTyRfvf371+6f7QU+trTDDUvW5VxNQewu3KGqKA3x
	 0vPTJbwRWVNruDLMu1H7sEQ7x4kzCz/QstKM8FKIimgfP5Tnb6BEwrE4qjeolEf1lZ4Ge
	 RneSt/GB91e75DjfJXv425BN35jGo4VM3dzygbfK6Z41mOuAq0AITbEs5WSqIvq/T3npv
	 HtOZxpeLrJ/XCL9a4tjxdUday3FHcSTmibPEUDN7YBfWdIGBD55z5OcZNvovN32Esew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HzZP3L1X;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAA606A320
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 05:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBAA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HzZP3L1X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795064851; x=1826600851;
  h=date:from:to:cc:subject:message-id;
  bh=8hTiPjLPa+d92OzZSFeJNA5hjREcbnBusm2Ljaxk0Xk=;
  b=HzZP3L1XnHZKzwqLuhSfNY2VlitDJrLan5xNJccFxI1YNZ4QVm2MSMjI
   EXZmIDRwmIuxG24Rjmr1bab4kH2KecLaoaoasafyUI83R69gssz4r26/d
   Ag0eFgNK/ipm8hDIrA4teV/OCKjqrO8IlEjTI3v7lyYV2lM6/OnJCalz8
   yibu3LfFrdcSMDI7zGUtj36HQy+NMcKz1lAHjd5JbVXgdxw89fnEyeUzV
   GGl08kPiw1eWSFE0vye3U6Esd/zfm0csaGHZMmwpXCldcO/68grrsQ8eJ
   7B0Ug/nOC16IVOp6brCK9FiJnoGuPvBoNkrjJehgzB6PdTGNwLneppFoi
   g==;
X-CSE-ConnectionGUID: qUr8t5TpRgawACz2c0/N6A==
X-CSE-MsgGUID: 8rgUSNrMTBWgIjaaoCTecQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3904066"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3904066"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 21:07:31 -0800
X-CSE-ConnectionGUID: jP0eml17TM27S0Sn1YiOaw==
X-CSE-MsgGUID: 8fjFi8AYTYyzSTKvTwUqAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10897354"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 18 Nov 2026 21:07:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTuMp-000000003ft-0GzG;
	Thu, 19 Nov 2026 05:07:27 +0000
Date: Thu, 19 Nov 2026 06:07:00 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/resched_ipi_for_non_waiting_req 1/6]
 arch/s390/kernel/smp.c:534:1: error: type specifier missing, defaults to
 'int'; ISO C99 and later do not support implicit int
Message-ID: <20261119055723.IDCV5F7a-lkp@intel.com>
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
config: s390-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119055723.IDCV5F7a-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119055723.IDCV5F7a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119055723.IDCV5F7a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/smp.c:534:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     534 | EXPORT_SYMBOL_FOR_KVM(arch_smp_send_reschedule);
         | ^
         | int 
>> arch/s390/kernel/smp.c:534:23: error: a parameter list without types is only allowed in a function definition
     534 | EXPORT_SYMBOL_FOR_KVM(arch_smp_send_reschedule);
         |                       ^
   2 errors generated.


vim +/int +534 arch/s390/kernel/smp.c

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
