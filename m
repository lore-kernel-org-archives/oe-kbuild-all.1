Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6E417C76
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710496808; cv=none; b=JktVij39WeiD4oKnGsIL4usr4eTq6rgC6vDyR2gkSDitEfM8RW7lhqNQtmtkd8Ha9bTUpFT53gKEHNHCR00qdHI5FNLPLr7+t5pzi3MYF//xwlsaA/R+FcuxXVLqzXP/k5D9zXQ4p2Url6ALXDAdbxs4uwaKk3E2di04RnV+sHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710496808; c=relaxed/simple;
	bh=RrKjOBLB7sUaT0YK01ENuaSzSnbPsyesZyoXYhw0E9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xg/SUqQIjy+xXlngRH73aCTv301me1t+BDpUoAfjgQrH7E6tZajq/8M/ti/Hzl/3rVHVOmIZkx5JcTinPHtkGb1wZIRV324WwjkjYWgSAz0MSC0lciTK6r0f2zaX9EZB4yDVT8IaB2t/i5GhdmcfNmoTPkZTPEkG6IhlqYVJL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfDVrunl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfDVrunl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710496806; x=1742032806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RrKjOBLB7sUaT0YK01ENuaSzSnbPsyesZyoXYhw0E9k=;
  b=OfDVrunlKgVF0l6GElCiBdMfuKOT8LDeyyghSoe0F6O2/8KZlvygmtbA
   6PkDIffJPColI/TFuojvprLqZVCoHvvte7bB+QYsgC0yv3nRlh0h0FWhK
   wiB/b3eU1j50CXd/yJqysEWj+Div6BDApjDNpeb2wT6QdB+zlDDzkz64K
   fVsMTuB22GA2vZ2mB/6g+MibeFDOyOoaPSx0Cmm5HvrGnGHX2CII5AVXy
   cyRCybMisSapM1EVSFT5q+tEFETLXq2Yie+KIOBACWypuM0+zYBYrZzKu
   9F62GR6XVrFNgOwgQdwuL5tYjJfmBVNiFB0xoIwzkhVTZMIGML8u7qBKY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16081045"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="16081045"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 03:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; 
   d="scan'208";a="35749330"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2024 03:00:04 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rl4M6-000EJz-0V;
	Fri, 15 Mar 2024 10:00:02 +0000
Date: Fri, 15 Mar 2024 17:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/msr_uaccess_cleanup 15/15] arch/x86/kvm/x86.c:326:67:
 error: parameter 5 ('rw') has incomplete type
Message-ID: <202403151732.jRnP1kV5-lkp@intel.com>
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
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240315/202403151732.jRnP1kV5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403151732.jRnP1kV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403151732.jRnP1kV5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/x86.c:326:52: warning: 'enum kvm_msr_access' declared inside parameter list will not be visible outside of this definition or declaration
     326 |                                               enum kvm_msr_access rw,
         |                                                    ^~~~~~~~~~~~~~
>> arch/x86/kvm/x86.c:326:67: error: parameter 5 ('rw') has incomplete type
     326 |                                               enum kvm_msr_access rw,
         |                                               ~~~~~~~~~~~~~~~~~~~~^~
>> arch/x86/kvm/x86.c:324:28: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     324 | static __always_inline int kvm_do_msr_uaccess(struct kvm_vcpu *vcpu, u32 msr,
         |                            ^~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c: In function 'kvm_do_msr_uaccess':
>> arch/x86/kvm/x86.c:329:32: error: 'MSR_TYPE_W' undeclared (first use in this function); did you mean 'MR_TYPES'?
     329 |         const char *op = rw == MSR_TYPE_W ? "wrmsr" : "rdmsr";
         |                                ^~~~~~~~~~
         |                                MR_TYPES
   arch/x86/kvm/x86.c:329:32: note: each undeclared identifier is reported only once for each function it appears in
   In file included from <command-line>:
>> arch/x86/kvm/x86.c:332:28: error: 'MSR_TYPE_R' undeclared (first use in this function); did you mean 'MR_TYPES'?
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
   arch/x86/kvm/x86.c:1712:61: warning: passing argument 1 of '(({...}))' makes pointer from integer without a cast [-Wint-conversion]
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
>> include/linux/static_call_types.h:56:2: error: too many arguments to function '(({...}))'
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


vim +326 arch/x86/kvm/x86.c

   320	
   321	typedef int (*msr_uaccess_t)(struct kvm_vcpu *vcpu, u32 index, u64 *data,
   322				     bool host_initiated);
   323	
 > 324	static __always_inline int kvm_do_msr_uaccess(struct kvm_vcpu *vcpu, u32 msr,
   325						      u64 *data, bool host_initiated,
 > 326						      enum kvm_msr_access rw,
   327						      msr_uaccess_t msr_uaccess_fn)
   328	{
 > 329		const char *op = rw == MSR_TYPE_W ? "wrmsr" : "rdmsr";
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
