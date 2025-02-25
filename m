Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CAA15C14B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740499384; cv=none; b=hMR7WzHzOv6PpGH6e2ofJXu8kTeOgjekBpzKd9gfujLkLBkLTnEU0P1f0IdDNOG0G2NkNDw9otKTq0rZlKUekmFFGSt48a5ta/pUPPGl+gdmOGj5O/hxqtQnV4KT8S8CbC2H0rKZlEilFZN2PJBiXeuoIn5Q3C66jeQe8od1ZDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740499384; c=relaxed/simple;
	bh=zEHxcM5n+JN/9FVLv4/ywRY49fQAZAiJTbdkOubYdV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qKo8l+Ama2iXfqV9/6WwrJ6onCyg1HJ82XyiHhuIQmCJUfKqf7W+/SY8VmiVnFiKDR9tZrfVf7Ff6o5EV0FQEgfLZlqzfXBg2EKGs7sDmE94hk7xBSkn6quzdyNB5zZTJdHH4KaHWvp174Y9PfiELwNGSAq5ICCy7E0dkAb6T3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HaKW3amq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HaKW3amq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740499382; x=1772035382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zEHxcM5n+JN/9FVLv4/ywRY49fQAZAiJTbdkOubYdV4=;
  b=HaKW3amq1W1GvEFKl6UYxDZwiBbmXv+VZ4XKeE0dCraSjcbL456l0QRY
   +oyF1JnYArz+JWM3G0K/T9zrH+ZnEvXLgDwxb9BTPf8rlGM3hTjWuT3q8
   VsNniJqXKG6VRSD7AlBGV4W6I7tePBlqRrK+YV4HCI3QL9WF6/pdqsURV
   MzAbrH06bX9Fwh/XwvovkhRxcWSprhtnjYz4r9iE5vGZVZ+9TpYNUwdFY
   TJt7xziHA0bM2Y0mnoimwNqyGvhQy/wYCj2iyhhXqvi/XXdykpev7VRK2
   vcDSfBbmEBbv5Y8l052/EfeNKtnozA+ajbNls3zc+Z1dvwO7FNJh0L17B
   Q==;
X-CSE-ConnectionGUID: AYVtbgq/QCmy9nn5afXzSA==
X-CSE-MsgGUID: DQbk5Ib4QZaVbJ02nGc7mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41157963"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41157963"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 08:03:02 -0800
X-CSE-ConnectionGUID: 12qMg/s0TqaBEbBiTmWVNg==
X-CSE-MsgGUID: 5NLL4wxlRf6CrPltyvYtRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120543806"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2025 08:03:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmxOb-000AQh-21;
	Tue, 25 Feb 2025 16:02:57 +0000
Date: Wed, 26 Feb 2025 00:02:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 2/2]
 arch/x86/kvm/mmu/paging_tmpl.h:780:19: warning: variable 'orig_pfn' set but
 not used
Message-ID: <202502252349.MW5rIYDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   1cd69cd68d8470b2504c03c331dca866646cacff
commit: 1cd69cd68d8470b2504c03c331dca866646cacff [2/2] Merge branch 'android15-6.6-2aa57daa75e0' into android15-6.6-desktop
config: x86_64-buildonly-randconfig-001-20250225 (https://download.01.org/0day-ci/archive/20250225/202502252349.MW5rIYDX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502252349.MW5rIYDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502252349.MW5rIYDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/mmu/mmu.c:4748:
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'ept_page_fault':
>> arch/x86/kvm/mmu/paging_tmpl.h:780:19: warning: variable 'orig_pfn' set but not used [-Wunused-but-set-variable]
     780 |         kvm_pfn_t orig_pfn;
         |                   ^~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:4752:
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'paging64_page_fault':
>> arch/x86/kvm/mmu/paging_tmpl.h:780:19: warning: variable 'orig_pfn' set but not used [-Wunused-but-set-variable]
     780 |         kvm_pfn_t orig_pfn;
         |                   ^~~~~~~~
   In file included from arch/x86/kvm/mmu/mmu.c:4756:
   arch/x86/kvm/mmu/paging_tmpl.h: In function 'paging32_page_fault':
>> arch/x86/kvm/mmu/paging_tmpl.h:780:19: warning: variable 'orig_pfn' set but not used [-Wunused-but-set-variable]
     780 |         kvm_pfn_t orig_pfn;
         |                   ^~~~~~~~


vim +/orig_pfn +780 arch/x86/kvm/mmu/paging_tmpl.h

6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  762  
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  763  /*
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  764   * Page fault handler.  There are several causes for a page fault:
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  765   *   - there is no shadow pte for the guest pte
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  766   *   - write access through a shadow pte marked read only so that we can set
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  767   *     the dirty bit
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  768   *   - write access to a shadow pte marked read only so we can update the page
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  769   *     dirty bitmap, when userspace requests it
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  770   *   - mmio access; in this case we will never install a present shadow pte
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  771   *   - normal guest page fault due to the guest pte marked not present, not
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  772   *     writable, or not executable
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  773   *
e2dec939db1269 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-01-05  774   *  Returns: 1 if we need to emulate the instruction, 0 otherwise, or
e2dec939db1269 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-01-05  775   *           a negative value on error.
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  776   */
c501040abc4209 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  777  static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  778  {
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  779  	struct guest_walker walker;
0d5c7fcfa58534 arch/x86/kvm/mmu/paging_tmpl.h Nikolay Kuratov     2024-12-08 @780  	kvm_pfn_t orig_pfn;
e2dec939db1269 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-01-05  781  	int r;
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  782  
c501040abc4209 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  783  	WARN_ON_ONCE(fault->is_tdp);
714b93da1a6d97 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-01-05  784  
ceee7df749da03 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2015-05-07  785  	/*
9c03b1821a89c1 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  786  	 * Look up the guest pte for the faulting address.
e9ee956e311d3d arch/x86/kvm/paging_tmpl.h     Takuya Yoshikawa    2016-02-22  787  	 * If PFEC.RSVD is set, this is a shadow page fault.
e9ee956e311d3d arch/x86/kvm/paging_tmpl.h     Takuya Yoshikawa    2016-02-22  788  	 * The bit needs to be cleared before walking guest page tables.
ceee7df749da03 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2015-05-07  789  	 */
9c03b1821a89c1 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  790  	r = FNAME(walk_addr)(&walker, vcpu, fault->addr,
9c03b1821a89c1 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  791  			     fault->error_code & ~PFERR_RSVD_MASK);
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  792  
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  793  	/*
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  794  	 * The page is not mapped by the guest.  Let the guest handle it.
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  795  	 */
7993ba43db1c07 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-01-26  796  	if (!r) {
2839180ce5bb27 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-09-29  797  		if (!fault->prefetch)
0cd665bd20f908 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2020-03-25  798  			kvm_inject_emulated_page_fault(vcpu, &walker.fault);
a30f47cb150dd8 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2011-09-22  799  
9b8ebbdb74b5ad arch/x86/kvm/paging_tmpl.h     Paolo Bonzini       2017-08-17  800  		return RET_PF_RETRY;
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  801  	}
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  802  
b8a5d551151537 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  803  	fault->gfn = walker.gfn;
9a967700496fea arch/x86/kvm/mmu/paging_tmpl.h Lai Jiangshan       2023-02-02  804  	fault->max_level = walker.level;
e710c5f6be0eb3 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2021-09-24  805  	fault->slot = kvm_vcpu_gfn_to_memslot(vcpu, fault->gfn);
e710c5f6be0eb3 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2021-09-24  806  
b8a5d551151537 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  807  	if (page_fault_handle_page_track(vcpu, fault)) {
9c03b1821a89c1 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  808  		shadow_page_table_clear_flood(vcpu, fault->addr);
9b8ebbdb74b5ad arch/x86/kvm/paging_tmpl.h     Paolo Bonzini       2017-08-17  809  		return RET_PF_EMULATE;
e5691a81e830c1 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2016-02-24  810  	}
3d0c27ad6ee465 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2016-02-24  811  
378f5cd64aefd7 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2020-07-02  812  	r = mmu_topup_memory_caches(vcpu, true);
f3747a5a9e5a26 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2020-07-02  813  	if (r)
f3747a5a9e5a26 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2020-07-02  814  		return r;
f3747a5a9e5a26 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2020-07-02  815  
354c908c068ec0 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-09-21  816  	r = kvm_faultin_pfn(vcpu, fault, walker.pte_access);
5276c616abf149 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-04-23  817  	if (r != RET_PF_CONTINUE)
d7c55201e66e9f arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2011-07-12  818  		return r;
d7c55201e66e9f arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2011-07-12  819  
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  820  	/*
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  821  	 * Do not change pte_access if the pfn is a mmio page, otherwise
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  822  	 * we will cache the incorrect access into mmio spte.
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  823  	 */
c501040abc4209 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  824  	if (fault->write && !(walker.pte_access & ACC_WRITE_MASK) &&
e710c5f6be0eb3 arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2021-09-24  825  	    !is_cr0_wp(vcpu->arch.mmu) && !fault->user && fault->slot) {
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  826  		walker.pte_access |= ACC_WRITE_MASK;
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  827  		walker.pte_access &= ~ACC_USER_MASK;
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  828  
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  829  		/*
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  830  		 * If we converted a user page to a kernel page,
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  831  		 * so that the kernel can write to it when cr0.wp=0,
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  832  		 * then we should prevent the kernel from executing it
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  833  		 * if SMEP is enabled.
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  834  		 */
9a65d0b70fa06a arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2021-06-22  835  		if (is_cr4_smep(vcpu->arch.mmu))
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  836  			walker.pte_access &= ~ACC_EXEC_MASK;
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  837  	}
c22885050e651c arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2013-01-08  838  
0d5c7fcfa58534 arch/x86/kvm/mmu/paging_tmpl.h Nikolay Kuratov     2024-12-08  839  	orig_pfn = fault->pfn;
0d5c7fcfa58534 arch/x86/kvm/mmu/paging_tmpl.h Nikolay Kuratov     2024-12-08  840  
43fdcda96e2550 arch/x86/kvm/paging_tmpl.h     Junaid Shahid       2019-01-03  841  	r = RET_PF_RETRY;
531810caa9f4bc arch/x86/kvm/mmu/paging_tmpl.h Ben Gardon          2021-02-02  842  	write_lock(&vcpu->kvm->mmu_lock);
a955cad84cdaff arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2021-11-20  843  
ba6e3fe255439f arch/x86/kvm/mmu/paging_tmpl.h David Matlack       2022-09-21  844  	if (is_page_fault_stale(vcpu, fault))
e930bffe95e1e8 arch/x86/kvm/paging_tmpl.h     Andrea Arcangeli    2008-07-25  845  		goto out_unlock;
bc32ce21524064 arch/x86/kvm/paging_tmpl.h     Xiao Guangrong      2010-08-28  846  
7bd7ded642978f arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2020-06-23  847  	r = make_mmu_pages_available(vcpu);
7bd7ded642978f arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2020-06-23  848  	if (r)
26eeb53cf0f9a0 arch/x86/kvm/paging_tmpl.h     Wanpeng Li          2017-08-10  849  		goto out_unlock;
9c03b1821a89c1 arch/x86/kvm/mmu/paging_tmpl.h Paolo Bonzini       2021-08-06  850  	r = FNAME(fetch)(vcpu, fault, &walker);
e930bffe95e1e8 arch/x86/kvm/paging_tmpl.h     Andrea Arcangeli    2008-07-25  851  
e930bffe95e1e8 arch/x86/kvm/paging_tmpl.h     Andrea Arcangeli    2008-07-25  852  out_unlock:
efe8eebff6d08b arch/x86/kvm/mmu/paging_tmpl.h David Stevens       2024-02-21  853  	kvm_set_page_accessed(fault->accessed_page);
531810caa9f4bc arch/x86/kvm/mmu/paging_tmpl.h Ben Gardon          2021-02-02  854  	write_unlock(&vcpu->kvm->mmu_lock);
43fdcda96e2550 arch/x86/kvm/paging_tmpl.h     Junaid Shahid       2019-01-03  855  	return r;
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  856  }
6aa8b732ca01c3 drivers/kvm/paging_tmpl.h      Avi Kivity          2006-12-10  857  

:::::: The code at line 780 was first introduced by commit
:::::: 0d5c7fcfa5853462fd161389182fb975eeb1bd2a KVM: x86/mmu: Ensure that kvm_release_pfn_clean() takes exact pfn from kvm_faultin_pfn()

:::::: TO: Nikolay Kuratov <kniv@yandex-team.ru>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
