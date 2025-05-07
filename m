Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271B12010F6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 07:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601655; cv=none; b=gXH82HHBvc+uFzFyIxhKp/Gtmk2SecLHszLXX1YWQIvTpiBWGX/amRukAorQohz3IGpYJooni/dyXjBJ5LuSNDg8L27Mu+DisFQgGKWBSQQeub4DeHaoBpijD5Hl+WP1UKB9sqwL0sYfvSGruoLcF4Cr7tB/g5lkS6mxcQ2L6g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601655; c=relaxed/simple;
	bh=fQezpvUGLkWKBNbBNeYyLVZSZpuY4nRgoW5DgJTHY0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGwlam+ghE0LH2by6RTTnBBJfSql8cdhnDUmZ0r6QtBifk5jodWdSMUxVqfayzpMsabDALW/rWFqZrYvv/epEJQLt6RLmYQKBL7gHChyNh15+K8Yq6d2lYLIr9JjM8Bix+kkGWOAZj0ne/3e+r1mJgV4acKPvp8Iw3RpJc5S8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+K9vEYy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+K9vEYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746601654; x=1778137654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fQezpvUGLkWKBNbBNeYyLVZSZpuY4nRgoW5DgJTHY0w=;
  b=Z+K9vEYyCkyE1bSnXO4f8D6RvXEZ4Su1yJv8QuNiNj1fJQQzwtPpMEuh
   1zx+2STz2F+ZqhJZd7hrZVj/FRApaY62l8DGm42DyDrLWDCtFa/figMc9
   1j/49ghb89pPwo0zgYTnThpAsev3qKp5Hh01lAqJU545wbYVEguWg1fXq
   mB8XSiKRfVD7kHleJCfc3QxCvzHZncdaCia/eY7R3Gi7TxQE679G0O6ha
   DPfnR4n9jdjpjLealQbME+6vH6Jm0dSK1FEwlnBUY13AQTxTxotvNWqi/
   C7sgCKplVlmMiZeV1CYzEV0BfNLU8B4QaVw0b8NCj/YzN5Xw5z1spmJyJ
   g==;
X-CSE-ConnectionGUID: 1VETlezPQ8KaXXjvyobQNA==
X-CSE-MsgGUID: Nj3gUGDITnaj30OjN7THpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="73702372"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="73702372"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:07:32 -0700
X-CSE-ConnectionGUID: /8ghFqIQT1KTcNe5fdvvrg==
X-CSE-MsgGUID: WeIaWtp/TXemY5QkgJsiYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135767234"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 00:07:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYsK-0007GN-2P;
	Wed, 07 May 2025 07:07:28 +0000
Date: Wed, 7 May 2025 15:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/stats_pointer 1/1]
 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:479:25: error: 'struct
 kvm_vcpu_stat' has no member named 'extended'
Message-ID: <202505071448.T9e5NHn0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/stats_pointer
head:   b9a199c65702bb4d0d6bc77c88198df60cdd940f
commit: b9a199c65702bb4d0d6bc77c88198df60cdd940f [1/1] KVM: x86: PoC for shoving a subset of stats into a pointer
config: loongarch-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250507/202505071448.T9e5NHn0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071448.T9e5NHn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071448.T9e5NHn0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_vcpu_destroy':
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:479:25: error: 'struct kvm_vcpu_stat' has no member named 'extended'
     479 |         vfree(vcpu->stat.extended);
         |                         ^
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: In function 'update_halt_poll_stats':
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3611:56: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    3611 |         struct kvm_vcpu_stat_extended *ext = vcpu->stat.extended;
         |                                                        ^
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_vcpu_halt':
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:3657:56: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    3657 |         struct kvm_vcpu_stat_extended *ext = vcpu->stat.extended;
         |                                                        ^
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_vm_ioctl_create_vcpu':
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4113:19: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    4113 |         vcpu->stat.extended = vzalloc(sizeof(*vcpu->stat.extended));
         |                   ^
   In file included from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:15:
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4113:57: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    4113 |         vcpu->stat.extended = vzalloc(sizeof(*vcpu->stat.extended));
         |                                                         ^
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/vmalloc.h:141:33: note: in expansion of macro 'alloc_hooks'
     141 | #define vzalloc(...)            alloc_hooks(vzalloc_noprof(__VA_ARGS__))
         |                                 ^~~~~~~~~~~
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4113:31: note: in expansion of macro 'vzalloc'
    4113 |         vcpu->stat.extended = vzalloc(sizeof(*vcpu->stat.extended));
         |                               ^~~~~~~
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4113:57: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    4113 |         vcpu->stat.extended = vzalloc(sizeof(*vcpu->stat.extended));
         |                                                         ^
   include/linux/alloc_tag.h:231:24: note: in definition of macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/vmalloc.h:141:33: note: in expansion of macro 'alloc_hooks'
     141 | #define vzalloc(...)            alloc_hooks(vzalloc_noprof(__VA_ARGS__))
         |                                 ^~~~~~~~~~~
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4113:31: note: in expansion of macro 'vzalloc'
    4113 |         vcpu->stat.extended = vzalloc(sizeof(*vcpu->stat.extended));
         |                               ^~~~~~~
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4113:57: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    4113 |         vcpu->stat.extended = vzalloc(sizeof(*vcpu->stat.extended));
         |                                                         ^
   include/linux/alloc_tag.h:234:24: note: in definition of macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/vmalloc.h:141:33: note: in expansion of macro 'alloc_hooks'
     141 | #define vzalloc(...)            alloc_hooks(vzalloc_noprof(__VA_ARGS__))
         |                                 ^~~~~~~~~~~
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4113:31: note: in expansion of macro 'vzalloc'
    4113 |         vcpu->stat.extended = vzalloc(sizeof(*vcpu->stat.extended));
         |                               ^~~~~~~
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4114:24: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    4114 |         if (!vcpu->stat.extended) {
         |                        ^
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4123:33: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    4123 |                 vfree(vcpu->stat.extended);
         |                                 ^
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_vcpu_stats_read':
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4219:61: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    4219 |                               sizeof(vcpu->stat), vcpu->stat.extended,
         |                                                             ^
   arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4220:49: error: 'struct kvm_vcpu_stat' has no member named 'extended'
    4220 |                               sizeof(*vcpu->stat.extended), user_buffer,
         |                                                 ^
>> arch/loongarch/kvm/../../../virt/kvm/kvm_main.c:4222:1: warning: control reaches end of non-void function [-Wreturn-type]
    4222 | }
         | ^


vim +479 arch/loongarch/kvm/../../../virt/kvm/kvm_main.c

   465	
   466	static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
   467	{
   468		kvm_arch_vcpu_destroy(vcpu);
   469		kvm_dirty_ring_free(&vcpu->dirty_ring);
   470	
   471		/*
   472		 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
   473		 * the vcpu->pid pointer, and at destruction time all file descriptors
   474		 * are already gone.
   475		 */
   476		put_pid(vcpu->pid);
   477	
   478		free_page((unsigned long)vcpu->run);
 > 479		vfree(vcpu->stat.extended);
   480		kmem_cache_free(kvm_vcpu_cache, vcpu);
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
