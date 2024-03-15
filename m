Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8AD1B940
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710502510; cv=none; b=ch3n/VOBYeCxgtzdJba7cFjT+wyoIOhqGpajPohPsHCWsj3Y5l76qff/8R9+IEGn9F06aB5ybrpXv8AQITUjoC61Sv/boAw7wlHATwkw3yYoX2aJzxxEh5l4tFv4NzQJ2Amux27+vD3DtAHTt/8lC4soaLoYcTgDpB/43chW2vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710502510; c=relaxed/simple;
	bh=OE+6OcJjFHmh1YMWtssKUXnuWzu0S44vo+hiUCYPoPU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMHymSxXmx1RJeRTIp6J1BntFw/XgNVOH2Xv2ZP4OBp8QvO3DjUNasPG0Y0G5/tKA8V6/h5O32fNCupqZLkcSEY4h/XtFiXqnIY2o8QVCvpejt9i8rFhxHT2SXtf+X2KJzcQHbcQdfOmqD91s3UaKuDfBXfoJmbT/8JJdA702To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y32LHWET; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y32LHWET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710502509; x=1742038509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OE+6OcJjFHmh1YMWtssKUXnuWzu0S44vo+hiUCYPoPU=;
  b=Y32LHWET+SRGnGJ1seRGCmIn3kEFxdAYWxFen3+KGI7lNIe9f1gGDQ1d
   rqYPuQ4OYE0PeDvnIOCkt+o8hLrhgxM3d1k6BluQz/vHOfvNMFJg0XBID
   sZ2ST9U/UhOuslR1QOc5xZ+jVUt3P+3omcspkJ8b0Q9Ibj14Z5A8E2gwv
   68LhxKo6EH5fGJhdSqiqjLttIbpWCJvRsZwQUzcM8STJLCNant2SNf2T2
   Hfdp332BEP9DqLr+gBTftkntuROZ4/vuSENQF05uPOlgPh904qp3h6dWF
   2Czs14hP0ny4P/z2935Z7LqTGEMJnfVwQJJvnv1aoanHCce+Wpr9u6aDz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5223425"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="5223425"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 04:35:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="43684666"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Mar 2024 04:35:07 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl5q4-000ENx-0y;
	Fri, 15 Mar 2024 11:35:04 +0000
Date: Fri, 15 Mar 2024 19:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/msr_uaccess_cleanup 15/15] arch/x86/kvm/x86.c:326:52:
 warning: 'enum kvm_msr_access' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202403151953.utHoaJuN-lkp@intel.com>
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
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240315/202403151953.utHoaJuN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151953.utHoaJuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151953.utHoaJuN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:326:52: warning: 'enum kvm_msr_access' declared inside parameter list will not be visible outside of this definition or declaration
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
>> arch/x86/kvm/x86.c:1712:61: warning: passing argument 1 of '(({...}))' makes pointer from integer without a cast [-Wint-conversion]
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
   include/linux/static_call_types.h:56:2: error: too many arguments to function '(({...}))'
      56 | ({                                                                      \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      57 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      58 |         __raw_static_call(name);                                        \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      59 | })
         | ~~
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
>> arch/x86/kvm/x86.c:1968:1: warning: control reaches end of non-void function [-Wreturn-type]
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


vim +326 arch/x86/kvm/x86.c

   320	
   321	typedef int (*msr_uaccess_t)(struct kvm_vcpu *vcpu, u32 index, u64 *data,
   322				     bool host_initiated);
   323	
   324	static __always_inline int kvm_do_msr_uaccess(struct kvm_vcpu *vcpu, u32 msr,
   325						      u64 *data, bool host_initiated,
 > 326						      enum kvm_msr_access rw,
   327						      msr_uaccess_t msr_uaccess_fn)
   328	{
   329		const char *op = rw == MSR_TYPE_W ? "wrmsr" : "rdmsr";
   330		int ret;
   331	
 > 332		BUILD_BUG_ON(rw != MSR_TYPE_R && rw != MSR_TYPE_W);
   333	
   334		/*
   335		 * Zero the data on read failures to avoid leaking stack data to the
   336		 * guest and/or userspace, e.g. if the failure is ignored below.
   337		 */
   338		ret = msr_uaccess_fn(vcpu, msr, data, host_initiated);
   339		if (ret && rw == MSR_TYPE_R)
   340			*data = 0;
   341	
   342		if (ret != KVM_MSR_RET_INVALID)
   343			return ret;
   344	
   345		if (!ignore_msrs) {
   346			kvm_debug_ratelimited("unhandled %s: 0x%x data 0x%llx\n",
   347					      op, msr, *data);
   348			return ret;
   349		}
   350	
   351		if (report_ignored_msrs)
   352			kvm_pr_unimpl("ignored %s: 0x%x data 0x%llx\n", op, msr, *data);
   353		
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
