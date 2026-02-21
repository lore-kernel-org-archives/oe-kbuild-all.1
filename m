Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605FB29D29F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Feb 2026 09:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771667045; cv=none; b=TvyiA6knNHDJEf4Uc9oB8B7AneWanQpymZJN+QcrYuU5u2gOj0AVHijwOV9UpTWfuxrRNIQMDvFlCbwk/lq/WxFgqpJzfa/Isv3sCMFrA4utkoA97eGJ3DiLW281VdEdG9ZvOAOvcczg1p2Vh8VZpNlj97s7opN7qDsz1DvnrNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771667045; c=relaxed/simple;
	bh=LI0eZm22I9gMK6Fll5kzJ1Y6oLpf5z+ulBJkXhuG9Dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rjujTeM0pZqwwXRQqchOUDe2jXljAMVbY273foqrsNI26OA+uADaPdRPqwuOTOdwPLcoriCRW972gYOhayWz2pLw1uoFGVCr6ROisb2Kz7sAl9YCvwg+OTV7FNrB3vtfo2aQEbnn5euhVXJDXGhM6q427jBE+qm4WbY6trTkUxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODGRhWzr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODGRhWzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771667043; x=1803203043;
  h=date:from:to:cc:subject:message-id;
  bh=LI0eZm22I9gMK6Fll5kzJ1Y6oLpf5z+ulBJkXhuG9Dw=;
  b=ODGRhWzr9IUyjswABau+/pNmU2gWGv8dJj2JfrAWhGkK4iGVmG25HprG
   slvz+fSuPT/nru7cuhaKDEpMAeGWMMuRDJ3/rMfqq1nnp58xuIbyDFB+Y
   lMHhSralsJgOEsRZgGkKMlwb7wc77vvU6j5KDQgmIIKzt05ZXPfljeFE4
   HlPxZ/ifsSwqUumDeG0lSEVIpy4piJCp3jUMFWZPlRSdveE+r0FaOtvwV
   0pJzkWd0EA6hOjXUVwRhqDDhWBBTZ1/t2kWZuZd3SyH8gD8aPXNXphPF3
   jZDnV52Wgxbg1fi7kTiDX3OqP65CMQXf+x7iWniBgRnFgcuXxzy21WVI8
   w==;
X-CSE-ConnectionGUID: yu6pFPqBRaSyTPj+o+LWzw==
X-CSE-MsgGUID: o6Jnb4IbRsuTotV412vnjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72786393"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72786393"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 01:44:03 -0800
X-CSE-ConnectionGUID: qb+cSz0nR4mIsmSZW9HZ1g==
X-CSE-MsgGUID: gBWqCaHISuer7NAV8Q4nhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214065528"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2026 01:44:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtjWp-000000014q0-0a7t;
	Sat, 21 Feb 2026 09:43:59 +0000
Date: Sat, 21 Feb 2026 17:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 arch/arm64/kvm/arm.c:493:15: warning: no previous prototype for function
 'kvm_arch_vcpu_get_ip'
Message-ID: <202602211701.4caaQJ7V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   1288cf49369f97cac9813b758d7860dcf41199ef
commit: a2aa2a6c9491a807bb898220acb1062dd8226a12 [1/1] BACKPORT: KVM: Move x86's perf guest info callbacks to generic KVM
config: arm64-randconfig-002-20260221 (https://download.01.org/0day-ci/archive/20260221/202602211701.4caaQJ7V-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211701.4caaQJ7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211701.4caaQJ7V-lkp@intel.com/

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
