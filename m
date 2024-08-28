Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B70918D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 05:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724821422; cv=none; b=IrctKRC0bbfIktJvoyARlfw3jOnLKv8i3wZDcMShJlX3F82SWfdEQzUtf00L0v2PkGGJbpltBB7sJqJ+fBAvjA+SN0AvaN4mhkSKp3IHttXzB54p8gkWCoF6A2D23lGVjC/V36u69HI82ytNewt081DvoqCvSPtuRlvYIG8ESpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724821422; c=relaxed/simple;
	bh=3Sj6HAX+/gj7M/8jPymeMMw8P6jQnpmpbmbp0cB9fME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yjscg1vfOK6ZT5bHWy0YbcdXJzhy8j2rdbtJOFKVfttMlR1KO5p6NIeYaRU9XMxhFo7FD8h/nfZGlwuD8v4weMG8GgwosYvxi72flzWZrZo9s3+6KSiwX6+LSeN9RObcFVs7kZ4I3mNYL3BHT2SFehoGWsnmDe+qy0I3Z0bqcrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bchkvxz5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bchkvxz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724821421; x=1756357421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Sj6HAX+/gj7M/8jPymeMMw8P6jQnpmpbmbp0cB9fME=;
  b=bchkvxz5uFkexd2FWJ0RpqJvfgEQ+oBOk8P1tJ3lQ0JBO3CbvVZkkpdd
   cWzrAOYMoQtkbi/C6iXx3c1MXzeEarf2tMtmdPKvmLhqRUDb1BlS4g6WY
   CtESmEIStAUfgdGE48IrMHupM/j+UCtjHX8s3guxRbOjP6ewHCXkMsW26
   slooADWbG+V95f5+WX4kSeJUjKpfKVKHPNT7rN3+mKHF1gyykQZNj2+5j
   byIczUWyQUEGQLc3oOczghhY6JF7QOnIRT29HQPrTy2OEpdOuYwUef+6G
   lPacHdm8R6uLWKpWsK6nBYonrj5JasnkSAXFr4TEhx9IV+pNAR+mIn1Ew
   g==;
X-CSE-ConnectionGUID: s7NNYNvhRWuvHDzQ/AHvcQ==
X-CSE-MsgGUID: gYi4QtMYRIefS0ba294GMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="22915788"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="22915788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 22:03:40 -0700
X-CSE-ConnectionGUID: /lKGCqcdQ1GpWlM9Q/jcZQ==
X-CSE-MsgGUID: Mw07NU/ERjSQ+h/J8pr+FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="62941204"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Aug 2024 22:03:39 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjAqG-000KVI-0f;
	Wed, 28 Aug 2024 05:03:36 +0000
Date: Wed, 28 Aug 2024 13:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27370/30000] arch/x86/kvm/x86.c:805:5: warning:
 no previous prototype for 'kvm_read_guest_page_mmu'
Message-ID: <202408281227.MN7ngvtP-lkp@intel.com>
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
head:   d96e94294726506c2893c3a71305c65168c22526
commit: aeaeb4dcb428b870d4207cc0fae7c125b7522406 [27370/30000] KVM: x86: Subsume nested GPA read helper into load_pdptrs()
config: x86_64-buildonly-randconfig-005-20240828 (https://download.01.org/0day-ci/archive/20240828/202408281227.MN7ngvtP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281227.MN7ngvtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281227.MN7ngvtP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:805:5: warning: no previous prototype for 'kvm_read_guest_page_mmu' [-Wmissing-prototypes]
     805 | int kvm_read_guest_page_mmu(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:900:6: warning: no previous prototype for 'kvm_post_set_cr0' [-Wmissing-prototypes]
     900 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         |      ^~~~~~~~~~~~~~~~
   arch/x86/kvm/x86.c:1081:6: warning: no previous prototype for 'kvm_post_set_cr4' [-Wmissing-prototypes]
    1081 | void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
         |      ^~~~~~~~~~~~~~~~


vim +/kvm_read_guest_page_mmu +805 arch/x86/kvm/x86.c

16f8a6f9798ab9 Nadav Amit    2014-10-03  799  
ec92fe44e7ff94 Joerg Roedel  2010-09-10  800  /*
ec92fe44e7ff94 Joerg Roedel  2010-09-10  801   * This function will be used to read from the physical memory of the currently
54bf36aac52031 Paolo Bonzini 2015-04-08  802   * running guest. The difference to kvm_vcpu_read_guest_page is that this function
ec92fe44e7ff94 Joerg Roedel  2010-09-10  803   * can read from guest physical or from the guest's guest physical memory.
ec92fe44e7ff94 Joerg Roedel  2010-09-10  804   */
ec92fe44e7ff94 Joerg Roedel  2010-09-10 @805  int kvm_read_guest_page_mmu(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
ec92fe44e7ff94 Joerg Roedel  2010-09-10  806  			    gfn_t ngfn, void *data, int offset, int len,
ec92fe44e7ff94 Joerg Roedel  2010-09-10  807  			    u32 access)
ec92fe44e7ff94 Joerg Roedel  2010-09-10  808  {
54987b7afa902e Paolo Bonzini 2014-09-02  809  	struct x86_exception exception;
ec92fe44e7ff94 Joerg Roedel  2010-09-10  810  	gfn_t real_gfn;
ec92fe44e7ff94 Joerg Roedel  2010-09-10  811  	gpa_t ngpa;
ec92fe44e7ff94 Joerg Roedel  2010-09-10  812  
ec92fe44e7ff94 Joerg Roedel  2010-09-10  813  	ngpa     = gfn_to_gpa(ngfn);
54987b7afa902e Paolo Bonzini 2014-09-02  814  	real_gfn = mmu->translate_gpa(vcpu, ngpa, access, &exception);
ec92fe44e7ff94 Joerg Roedel  2010-09-10  815  	if (real_gfn == UNMAPPED_GVA)
ec92fe44e7ff94 Joerg Roedel  2010-09-10  816  		return -EFAULT;
ec92fe44e7ff94 Joerg Roedel  2010-09-10  817  
ec92fe44e7ff94 Joerg Roedel  2010-09-10  818  	real_gfn = gpa_to_gfn(real_gfn);
ec92fe44e7ff94 Joerg Roedel  2010-09-10  819  
54bf36aac52031 Paolo Bonzini 2015-04-08  820  	return kvm_vcpu_read_guest_page(vcpu, real_gfn, data, offset, len);
ec92fe44e7ff94 Joerg Roedel  2010-09-10  821  }
ec92fe44e7ff94 Joerg Roedel  2010-09-10  822  EXPORT_SYMBOL_GPL(kvm_read_guest_page_mmu);
ec92fe44e7ff94 Joerg Roedel  2010-09-10  823  

:::::: The code at line 805 was first introduced by commit
:::::: ec92fe44e7ff94d04d8305e49efcffd8773e1cf6 KVM: X86: Add kvm_read_guest_page_mmu function

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
