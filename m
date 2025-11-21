Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42EB2EBB8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 16:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743330; cv=none; b=e/Eb2vuJQm1h1Dq5qcdLQ/kYyNHuTppWANGJjqodfiQKjPCEQ+UD6w2tG6h+knOOsg6nFlop6Fpk1I1uEFk9OgJW99I2R0yFl/9WrLsxcfq3i8nHv7shNDSrHgdPgtpNNySHkGNNJ3WC57laqilwipm5s+cgCgY19+5goPOmG+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743330; c=relaxed/simple;
	bh=hRTcnjTRtf4Yv6+SOGmb+bUrSXXKlbhALuPzTpPQH1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unJ7WGBFiMbrjgTjczw1OapGsFdtWs58bl5VRot1K8afGcP5AA5JABEIzekIZ9m8/fpJyvvBhRk/EEZT0OlopqCmGkXm5PZWSC2pcbSxRXBSu0bMcpid5zVfmFnw1dPentkmc9jnk1t3fT5cOIIjhpJxSILWAxnQMjuXEpC2j84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLDrraba; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLDrraba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763743329; x=1795279329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hRTcnjTRtf4Yv6+SOGmb+bUrSXXKlbhALuPzTpPQH1U=;
  b=JLDrraba2jgo4UwPC9/rOuII/aCZHNvuQZv1XA1cE+MiTUxMuqMHyjjz
   ijF17hw5cH+9opw/p+oTqMD8GRTxJIUWoeIzUgsDXeljK1Oradf1qCHEJ
   Vv26txMIG2hvXNQ98gZ2RLcXoTq/5FxdZgmRG30dM2NPXS23p8g2XRdlh
   Jfa8u3GiaFqnKp/vNThc0czbJcoujZlRclxb08KgHO7HjObkB+2Y8uRnu
   /kuS8yBN9dGMZNRk4hgpHj1loXqMn8cnaF6jGuYWqK3EHu6NPGPyPyFh2
   9eu9E9GGGQa288JQeiQblBYMTgHM2T0AVJ3M/UGCG1OSvPOtQssEAzIv1
   w==;
X-CSE-ConnectionGUID: J3NNaX8xTDWxgmKhBM/Xaw==
X-CSE-MsgGUID: UnShJzMqRESz0hiKGNio7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69459334"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69459334"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 08:42:09 -0800
X-CSE-ConnectionGUID: hz/fvhtvSg24Z4djTThBJw==
X-CSE-MsgGUID: i1sv61V/SHadPLtk9GXt5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191410992"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Nov 2025 08:42:07 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMUCz-0006b3-0z;
	Fri, 21 Nov 2025 16:42:05 +0000
Date: Sat, 22 Nov 2025 00:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vmxon_sucks 10/16] arch/x86/virt/hw.c:269:23: error:
 implicit declaration of function
 'x86_svm_emergency_disable_virtualization_cpu'; did you mean
 'x86_vmx_emergency_disable_virtualization_cpu'?
Message-ID: <202511220033.ZQT3gyNU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/vmxon_sucks
head:   4fb18821409337968c67b6b6f7afb11b3ec12fd2
commit: 4134b1c7cd3f9236e29eac315ddf39e30700b375 [10/16] KVM: x86: Extract VMXON and EFER.SVME enablement to kernel
config: i386-randconfig-141-20251121 (https://download.01.org/0day-ci/archive/20251122/202511220033.ZQT3gyNU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220033.ZQT3gyNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220033.ZQT3gyNU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/dev_printk.h:14,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/x86/virt/hw.c:2:
   arch/x86/virt/hw.c: In function 'x86_virt_put_cpu':
   arch/x86/virt/hw.c:269:21: error: void value not ignored as it ought to be
     269 |                 __r = x86_svm_##fn();                   \
         |                     ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/x86/virt/hw.c:300:9: note: in expansion of macro 'BUG_ON'
     300 |         BUG_ON(x86_virt_call(put_cpu) && !virt_rebooting);
         |         ^~~~~~
   arch/x86/virt/hw.c:300:16: note: in expansion of macro 'x86_virt_call'
     300 |         BUG_ON(x86_virt_call(put_cpu) && !virt_rebooting);
         |                ^~~~~~~~~~~~~
   arch/x86/virt/hw.c: In function 'x86_virt_emergency_disable_virtualization_cpu':
>> arch/x86/virt/hw.c:269:23: error: implicit declaration of function 'x86_svm_emergency_disable_virtualization_cpu'; did you mean 'x86_vmx_emergency_disable_virtualization_cpu'? [-Wimplicit-function-declaration]
     269 |                 __r = x86_svm_##fn();                   \
         |                       ^~~~~~~~
   arch/x86/virt/hw.c:328:15: note: in expansion of macro 'x86_virt_call'
     328 |         (void)x86_virt_call(emergency_disable_virtualization_cpu);
         |               ^~~~~~~~~~~~~


vim +269 arch/x86/virt/hw.c

   259	
   260	#define x86_virt_call(fn)				\
   261	({							\
   262		int __r;					\
   263								\
   264		if (IS_ENABLED(CONFIG_KVM_INTEL) &&		\
   265		    cpu_feature_enabled(X86_FEATURE_VMX))	\
   266			__r = x86_vmx_##fn();			\
   267		else if (IS_ENABLED(CONFIG_KVM_AMD) &&		\
   268			 cpu_feature_enabled(X86_FEATURE_SVM))	\
 > 269			__r = x86_svm_##fn();			\
   270		else						\
   271			__r = -EOPNOTSUPP;			\
   272								\
   273		__r;						\
   274	})
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
