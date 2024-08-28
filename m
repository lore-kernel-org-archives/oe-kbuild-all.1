Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94B615445E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 10:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724841132; cv=none; b=A/DnowuM8NrURFYnVMJCWsVqn49SXXoRXtGb6yfwIoMxBOQaashQ+k8azzKvWe9uswuSBrF7pZa904+lLsZH7uEljg3wWe3FhsxLwarx36QvcbK5QUEfYeb0QLr2HAy1Emr7mrKC6u+ExpI09Y5oSw1MVMqSUkwDKsJ/NRjG/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724841132; c=relaxed/simple;
	bh=jcYZZYUopyame7hS+JYBfmT0dPB6Dpo9GVEzMdp4nBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GGnk6dzsNsVFjWH6NrfKpgFY+AZ16XfjKEwtUn0gvlKV2EfNkTHhn17hacHJ7glBxvt/Pd6D/hW7AJaE6mOAx5ykudSREa38jHVUJ2PLAhndiM7M3AqFI0fdwl49zKjiM5wMq0e2eGpmV7PBGUZFsc3aH+HhNz23BIJ+a1YRTag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krSnZL6C; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krSnZL6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724841131; x=1756377131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jcYZZYUopyame7hS+JYBfmT0dPB6Dpo9GVEzMdp4nBY=;
  b=krSnZL6C2X5Yg3wJsre3JwPW8cpi+uHnYl5ocJ3MufX1L+sd+lPqM6sF
   ablqd/pjyX7Kuix0HrEqQaVHw4d6Pdc2xMIhmqzK9z/CIFxNDNru5MsUy
   wGKifLy3lgyNePRvo6h+QW+jx5hbfUrM9BjYzUGr6n3BkuaAeXU+3oNb6
   18L1VOmWNoPo49YtlTlySjq6ufrmyjHmqmu/YIUtHKeDhvPkUkINp6kyn
   VtsGguYo5PYxEZqEfq1tCZu4R1EVOXVleLzGGQbTotDxO4g0peM4L9kXa
   2BNdTPkIDGOkjOfSwweSb7wPfnD3cNFIP0wa2BR1vQtZAIHKhAj4HWYyi
   w==;
X-CSE-ConnectionGUID: Ylup4/Q4SHSQC+kjVIQOAA==
X-CSE-MsgGUID: TLckFaL2RnqUJ7atZeV4hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23236153"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23236153"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 03:32:09 -0700
X-CSE-ConnectionGUID: eWMh+ryxTqSYcSJ/D0Y1CA==
X-CSE-MsgGUID: FMYheXhqQPql8ESxDM8YTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67546462"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Aug 2024 03:32:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjFyA-000Kp0-0O;
	Wed, 28 Aug 2024 10:32:06 +0000
Date: Wed, 28 Aug 2024 18:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27353/30000] arch/x86/kvm/x86.c:805:5: warning:
 no previous prototype for function 'kvm_read_guest_page_mmu'
Message-ID: <202408281850.dOf6mZes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   591c3cfd9334124e0c6df438eb2ffb040e6de29e
commit: aeaeb4dcb428b870d4207cc0fae7c125b7522406 [27353/30000] KVM: x86: Subsume nested GPA read helper into load_pdptrs()
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240828/202408281850.dOf6mZes-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281850.dOf6mZes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281850.dOf6mZes-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:805:5: warning: no previous prototype for function 'kvm_read_guest_page_mmu' [-Wmissing-prototypes]
     805 | int kvm_read_guest_page_mmu(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
         |     ^
   arch/x86/kvm/x86.c:805:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     805 | int kvm_read_guest_page_mmu(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
         | ^
         | static 
   arch/x86/kvm/x86.c:900:6: warning: no previous prototype for function 'kvm_post_set_cr0' [-Wmissing-prototypes]
     900 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         |      ^
   arch/x86/kvm/x86.c:900:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     900 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         | ^
         | static 
   arch/x86/kvm/x86.c:1081:6: warning: no previous prototype for function 'kvm_post_set_cr4' [-Wmissing-prototypes]
    1081 | void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
         |      ^
   arch/x86/kvm/x86.c:1081:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1081 | void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
         | ^
         | static 
   3 warnings generated.


vim +/kvm_read_guest_page_mmu +805 arch/x86/kvm/x86.c

16f8a6f9798ab9a Nadav Amit    2014-10-03  799  
ec92fe44e7ff94d Joerg Roedel  2010-09-10  800  /*
ec92fe44e7ff94d Joerg Roedel  2010-09-10  801   * This function will be used to read from the physical memory of the currently
54bf36aac520315 Paolo Bonzini 2015-04-08  802   * running guest. The difference to kvm_vcpu_read_guest_page is that this function
ec92fe44e7ff94d Joerg Roedel  2010-09-10  803   * can read from guest physical or from the guest's guest physical memory.
ec92fe44e7ff94d Joerg Roedel  2010-09-10  804   */
ec92fe44e7ff94d Joerg Roedel  2010-09-10 @805  int kvm_read_guest_page_mmu(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
ec92fe44e7ff94d Joerg Roedel  2010-09-10  806  			    gfn_t ngfn, void *data, int offset, int len,
ec92fe44e7ff94d Joerg Roedel  2010-09-10  807  			    u32 access)
ec92fe44e7ff94d Joerg Roedel  2010-09-10  808  {
54987b7afa902e8 Paolo Bonzini 2014-09-02  809  	struct x86_exception exception;
ec92fe44e7ff94d Joerg Roedel  2010-09-10  810  	gfn_t real_gfn;
ec92fe44e7ff94d Joerg Roedel  2010-09-10  811  	gpa_t ngpa;
ec92fe44e7ff94d Joerg Roedel  2010-09-10  812  
ec92fe44e7ff94d Joerg Roedel  2010-09-10  813  	ngpa     = gfn_to_gpa(ngfn);
54987b7afa902e8 Paolo Bonzini 2014-09-02  814  	real_gfn = mmu->translate_gpa(vcpu, ngpa, access, &exception);
ec92fe44e7ff94d Joerg Roedel  2010-09-10  815  	if (real_gfn == UNMAPPED_GVA)
ec92fe44e7ff94d Joerg Roedel  2010-09-10  816  		return -EFAULT;
ec92fe44e7ff94d Joerg Roedel  2010-09-10  817  
ec92fe44e7ff94d Joerg Roedel  2010-09-10  818  	real_gfn = gpa_to_gfn(real_gfn);
ec92fe44e7ff94d Joerg Roedel  2010-09-10  819  
54bf36aac520315 Paolo Bonzini 2015-04-08  820  	return kvm_vcpu_read_guest_page(vcpu, real_gfn, data, offset, len);
ec92fe44e7ff94d Joerg Roedel  2010-09-10  821  }
ec92fe44e7ff94d Joerg Roedel  2010-09-10  822  EXPORT_SYMBOL_GPL(kvm_read_guest_page_mmu);
ec92fe44e7ff94d Joerg Roedel  2010-09-10  823  

:::::: The code at line 805 was first introduced by commit
:::::: ec92fe44e7ff94d04d8305e49efcffd8773e1cf6 KVM: X86: Add kvm_read_guest_page_mmu function

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
