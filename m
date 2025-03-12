Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154DE23F369
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741799653; cv=none; b=ag9nM/LjeKUMTGUE/MlmX/GH4nxbtXxkAcc4eD6vQyJh86Qcc6iXXF3sSecCShf0rC9NgE7+9sXtuxJ/kl49ZDExexmtnvPtT9v4i/Xogy9wrI9QCnaOl8L47uL4FSk4d5w60Zl10irC1aJwdtJivszs4yMZHihECG9Wo/UHaP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741799653; c=relaxed/simple;
	bh=LQx/+iKCGxsgBJ19q2ceP+ca5pMX0QnZGcb0DMCJ/lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=idVdnqnitFgZZ2g0ecX48dr9CH+MBi4cWsOAFCBL7U7uEtB7lwxrto7rX5HOn0V7hnvLkyWvEtXK5c0g4XOI8Pt8f9seR9O3deqAspeWQ/NPWVlf/qbaj+FlLAYERnC/5WQ7wP2wuDAQAztVunnXc/r84gg1ywW+mKVm3osHWBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/6+dyb0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/6+dyb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741799652; x=1773335652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQx/+iKCGxsgBJ19q2ceP+ca5pMX0QnZGcb0DMCJ/lE=;
  b=l/6+dyb0JtbOQrAn93gxlB79thrNZy2LokiFY2pDSlKK5MSi7JngjWjc
   npbEM6SqBO08WP5ukVJwUZ7u/3DLyoVFvt2xQPEkZWqbkASuj2oQqFB9h
   gHVz8mhm36C0jLdEzK2XwHCRZipfy5sMn0Z/tk+Pu5eITUSObALwqSLrN
   9EFY6GV9+pQoQBGizOVLLA9D0kwnFiEd3v0irXVB8MNvUZaG4/6hYxzlV
   gp/P2ntYnEvwkV2dGJTGXDfQMy2Ci37Nt2sdAHODFcj2Qt/4b/9z/eSmy
   O45CimpxzaV+R/b/+7w+g//YIcUy8zSoe+XAhiznZPgsnvcqlVVtuBtK5
   g==;
X-CSE-ConnectionGUID: lNHDQEOVR8OOMmg29xfHZQ==
X-CSE-MsgGUID: SahduTKHRSanmk9S34ILrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68250950"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="68250950"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 10:14:09 -0700
X-CSE-ConnectionGUID: yYFppW4qQlyEjKa8JKyusg==
X-CSE-MsgGUID: EidRO7UHSemB5vCrCzoWSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="143895370"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2025 10:14:08 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsPeg-0008lK-08;
	Wed, 12 Mar 2025 17:14:06 +0000
Date: Thu, 13 Mar 2025 01:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 280/280]
 arch/x86/kvm/mmu/mmu.c:4757:31: error: no member named 'pkvm' in 'struct
 kvm_arch'
Message-ID: <202503130142.I5liChOR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   416b1b8e121ff0114c661e47e388426ad5cce864
commit: 6e27d23add2a1f16ed2a78641daed6d88a91a32c [280/280] ANDROID: pkvm: x86: Fix compiling issues found by 0day for arch s390/powerpc
config: i386-buildonly-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130142.I5liChOR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130142.I5liChOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130142.I5liChOR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/mmu/mmu.c:4739:25: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_pinned_page'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^~~~~~~~
   include/linux/slab.h:887:52: note: expanded from macro 'kmalloc'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:241:31: note: expanded from macro 'alloc_hooks'
     241 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:227:9: note: expanded from macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4734:9: note: forward declaration of 'struct kvm_pinned_page'
    4734 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
   arch/x86/kvm/mmu/mmu.c:4739:25: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_pinned_page'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^~~~~~~~
   include/linux/slab.h:887:52: note: expanded from macro 'kmalloc'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:241:31: note: expanded from macro 'alloc_hooks'
     241 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:231:10: note: expanded from macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4734:9: note: forward declaration of 'struct kvm_pinned_page'
    4734 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
   arch/x86/kvm/mmu/mmu.c:4739:25: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_pinned_page'
    4739 |                 ppage = kmalloc(sizeof(*ppage), GFP_KERNEL_ACCOUNT);
         |                                       ^~~~~~~~
   include/linux/slab.h:887:52: note: expanded from macro 'kmalloc'
     887 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                                            ^~~~~~~~~~~
   include/linux/alloc_tag.h:241:31: note: expanded from macro 'alloc_hooks'
     241 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^~~~~~~~~
   include/linux/alloc_tag.h:234:10: note: expanded from macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4734:9: note: forward declaration of 'struct kvm_pinned_page'
    4734 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
   arch/x86/kvm/mmu/mmu.c:4755:9: error: incomplete definition of type 'struct kvm_pinned_page'
    4755 |                         ppage->page = page;
         |                         ~~~~~^
   arch/x86/kvm/mmu/mmu.c:4734:9: note: forward declaration of 'struct kvm_pinned_page'
    4734 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
>> arch/x86/kvm/mmu/mmu.c:4757:31: error: no member named 'pkvm' in 'struct kvm_arch'
    4757 |                         spin_lock(&vcpu->kvm->arch.pkvm.pinned_page_lock);
         |                                    ~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/mmu/mmu.c:4758:19: error: incomplete definition of type 'struct kvm_pinned_page'
    4758 |                         list_add(&ppage->list, &vcpu->kvm->arch.pkvm.pinned_pages);
         |                                   ~~~~~^
   arch/x86/kvm/mmu/mmu.c:4734:9: note: forward declaration of 'struct kvm_pinned_page'
    4734 |         struct kvm_pinned_page *ppage = NULL;
         |                ^
   arch/x86/kvm/mmu/mmu.c:4758:44: error: no member named 'pkvm' in 'struct kvm_arch'
    4758 |                         list_add(&ppage->list, &vcpu->kvm->arch.pkvm.pinned_pages);
         |                                                 ~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/mmu/mmu.c:4759:33: error: no member named 'pkvm' in 'struct kvm_arch'
    4759 |                         spin_unlock(&vcpu->kvm->arch.pkvm.pinned_page_lock);
         |                                      ~~~~~~~~~~~~~~~ ^
   8 errors generated.


vim +4757 arch/x86/kvm/mmu/mmu.c

  4752	
  4753		if (ppage) {
  4754			if (r == RET_PF_FIXED && (page = kvm_pfn_to_refcounted_page(fault->pfn))) {
  4755				ppage->page = page;
  4756				get_page(page);
> 4757				spin_lock(&vcpu->kvm->arch.pkvm.pinned_page_lock);
  4758				list_add(&ppage->list, &vcpu->kvm->arch.pkvm.pinned_pages);
  4759				spin_unlock(&vcpu->kvm->arch.pkvm.pinned_page_lock);
  4760			} else {
  4761				kfree(ppage);
  4762			}
  4763		}
  4764	
  4765		return r;
  4766	}
  4767	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
