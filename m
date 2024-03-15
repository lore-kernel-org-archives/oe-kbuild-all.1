Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1447D1B5B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710502513; cv=none; b=RYVt/OSmLaZnXAOQTBnvkdL9hrkfIADj5XPFV5lKCysVjbOrgBESPX3IcEpEB9WwvIOvi6pAtxpcDGWl6H7VKUq8aTvyTdhaoJtRJAB7mM/0WaEr0P/LPfFZBapuFSpUrtMxtQzCNOk2PD62v/X0fERXcIIxhtqSzxmpLdU+L14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710502513; c=relaxed/simple;
	bh=RQTzVksaK11IouByM9b8CXP2KB+kRspeKcd9GHP3tr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cGzBj0Y/CAocamHmzY7S8bo1+X2exnlgwo1rBXyUhu8/PM1NqF8o/hbqImZnRFAxmXppob9oiwTd/OT9L3VCqcwC6/gkc9hu4QRfpFydm5t1GudIKv2/PQ+EioHGYcPrwqt1WjFa7bd50c4zLacSGzIhlyv/kE9sus/1DvFIQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbSJcY6t; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbSJcY6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710502511; x=1742038511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQTzVksaK11IouByM9b8CXP2KB+kRspeKcd9GHP3tr4=;
  b=JbSJcY6tMtTLa90MuzvbjHUDOUmd74tZn+qIA1xg2GEJKGhUWFwT8+Gf
   D92eqkdSxYFWG/DUw+SM2iOVVNXJ23szSo8KrdgnON6EIOEw3JU4Fez7y
   ekLnnwJVXK2zmEc/mgDt+VKRAeFcTchGoArtwB/f/RB7Vehpb/n6134R1
   3pfb85IErSlwhj4CO3fYePM6qfosQJPAvnmpEP5TzOtMIuubnARbpwYFp
   WlxGk+V5dObaKSqGB8OxmcFvYn0gibm54hDNWr1Ab5NNU1/DSAnkpJRSz
   TLiqy5QgMhFtleckoXT4iZm5j31NPbzVBNeRx+iQPDMm7OuFtGLNMIPge
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5223426"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5223426"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 04:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="43684668"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Mar 2024 04:35:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl5q4-000ENz-15;
	Fri, 15 Mar 2024 11:35:04 +0000
Date: Fri, 15 Mar 2024 19:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/msr_uaccess_cleanup 15/15] arch/x86/kvm/x86.c:1712:61:
 warning: passing argument 1 of '__SCT__kvm_x86_get_msr_feature' makes
 pointer from integer without a cast
Message-ID: <202403151955.R1BVbgZ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/msr_uaccess_cleanup
head:   08d9dcfffc5235154aa5ac85956aa72f18acea0b
commit: 08d9dcfffc5235154aa5ac85956aa72f18acea0b [15/15] writeme
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240315/202403151955.R1BVbgZ6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151955.R1BVbgZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151955.R1BVbgZ6-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c:326:52: warning: 'enum kvm_msr_access' declared inside parameter list will not be visible outside of this definition or declaration
     326 |                                               enum kvm_msr_access rw,
         |                                                    ^~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:326:67: error: parameter 5 ('rw') has incomplete type
     326 |                                               enum kvm_msr_access rw,
         |                                               ~~~~~~~~~~~~~~~~~~~~^~
   arch/x86/kvm/x86.c:324:28: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     324 | static __always_inline int kvm_do_msr_uaccess(struct kvm_vcpu *vcpu, u32 msr,
         |                            ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c: In function 'kvm_do_msr_uaccess':
   arch/x86/kvm/x86.c:329:32: error: 'MSR_TYPE_W' undeclared (first use in this function); did you mean 'MR_TYPES'?
     329 |         const char *op = rw == MSR_TYPE_W ? "wrmsr" : "rdmsr";
         |                                ^~~~~~~~~~
         |                                MR_TYPES
   arch/x86/kvm/x86.c:329:32: note: each undeclared identifier is reported only once for each function it appears in
   In file included from <command-line>:
   arch/x86/kvm/x86.c:332:28: error: 'MSR_TYPE_R' undeclared (first use in this function); did you mean 'MR_TYPES'?
     332 |         BUILD_BUG_ON(rw != MSR_TYPE_R && rw != MSR_TYPE_W);
         |                            ^~~~~~~~~~
   include/linux/compiler_types.h:415:23: note: in definition of macro '__compiletime_assert'
     415 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:435:9: note: in expansion of macro '_compiletime_assert'
     435 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:332:9: note: in expansion of macro 'BUILD_BUG_ON'
     332 |         BUILD_BUG_ON(rw != MSR_TYPE_R && rw != MSR_TYPE_W);
         |         ^~~~~~~~~~~~
   arch/x86/kvm/x86.c: In function 'kvm_get_msr_feature':
>> arch/x86/kvm/x86.c:1712:61: warning: passing argument 1 of '__SCT__kvm_x86_get_msr_feature' makes pointer from integer without a cast [-Wint-conversion]
    1712 |                 return static_call(kvm_x86_get_msr_feature)(index, data);
         |                                                             ^~~~~
         |                                                             |
         |                                                             u32 {aka unsigned int}
   arch/x86/kvm/x86.c:1712:61: note: expected 'struct kvm_msr_entry *' but argument is of type 'u32' {aka 'unsigned int'}
   In file included from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/percpu.h:6,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/x86.c:20:
>> include/linux/static_call_types.h:43:34: error: too many arguments to function '__SCT__kvm_x86_get_msr_feature'
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                 ~^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:74:33: note: in expansion of macro '__raw_static_call'
      74 | #define __static_call(name)     __raw_static_call(name)
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kvm/x86.c:1712:24: note: in expansion of macro 'static_call'
    1712 |                 return static_call(kvm_x86_get_msr_feature)(index, data);
         |                        ^~~~~~~~~~~
   arch/x86/kvm/x86.c: In function 'do_get_msr_feature':
   arch/x86/kvm/x86.c:1735:60: error: 'MSR_TYPE_R' undeclared (first use in this function); did you mean 'MR_TYPES'?
    1735 |         return kvm_do_msr_uaccess(vcpu, index, data, true, MSR_TYPE_R,
         |                                                            ^~~~~~~~~~
         |                                                            MR_TYPES
   arch/x86/kvm/x86.c: In function 'kvm_set_msr_ignored_check':
   arch/x86/kvm/x86.c:1926:70: error: 'MSR_TYPE_W' undeclared (first use in this function); did you mean 'MR_TYPES'?
    1926 |         return kvm_do_msr_uaccess(vcpu, index, data, host_initiated, MSR_TYPE_W,
         |                                                                      ^~~~~~~~~~
         |                                                                      MR_TYPES
   arch/x86/kvm/x86.c: In function 'kvm_get_msr_ignored_check':
   arch/x86/kvm/x86.c:1966:70: error: 'MSR_TYPE_R' undeclared (first use in this function); did you mean 'MR_TYPES'?
    1966 |         return kvm_do_msr_uaccess(vcpu, index, data, host_initiated, MSR_TYPE_R,
         |                                                                      ^~~~~~~~~~
         |                                                                      MR_TYPES
   arch/x86/kvm/x86.c:1968:1: warning: control reaches end of non-void function [-Wreturn-type]
    1968 | }
         | ^
   arch/x86/kvm/x86.c: In function 'kvm_set_msr_ignored_check':
   arch/x86/kvm/x86.c:1928:1: warning: control reaches end of non-void function [-Wreturn-type]
    1928 | }
         | ^
   arch/x86/kvm/x86.c: In function 'do_get_msr_feature':
   arch/x86/kvm/x86.c:1737:1: warning: control reaches end of non-void function [-Wreturn-type]
    1737 | }
         | ^
   cc1: some warnings being treated as errors


vim +/__SCT__kvm_x86_get_msr_feature +1712 arch/x86/kvm/x86.c

  1695	
  1696	static int kvm_get_msr_feature(struct kvm_vcpu *vcpu, u32 index, u64 *data,
  1697				       bool host_initiated)
  1698	{
  1699		WARN_ON_ONCE(!host_initiated);
  1700	
  1701		switch (index) {
  1702		case MSR_IA32_ARCH_CAPABILITIES:
  1703			*data = kvm_get_arch_capabilities();
  1704			break;
  1705		case MSR_IA32_PERF_CAPABILITIES:
  1706			*data = kvm_caps.supported_perf_cap;
  1707			break;
  1708		case MSR_IA32_UCODE_REV:
  1709			rdmsrl_safe(index, data);
  1710			break;
  1711		default:
> 1712			return static_call(kvm_x86_get_msr_feature)(index, data);
  1713		}
  1714		return 0;
  1715	}
  1716	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
