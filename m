Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637C823AD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 00:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709251987; cv=none; b=f5rhdh1cm4Vb1cFVPdr22gzjT+G5hDfP8ufzyqKp+rnTNI2Bspa9C09JleCvli5pBbg7lVxG2xHJpBOLk+am9gOcawoczv0hLGcNdV6kPFqcGISp34T+bkPPDI76ExoBZQhuzhTYFY6iL8qvttjy0o50rb+zCpDUfrTErJL2Thw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709251987; c=relaxed/simple;
	bh=Mf648nhbJvtYVfwxyrA0lKuYEEWOD8GWExgRUUfRrLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHq0rXmEqQlz/e6tocTFu4FDzTRFz/TunQK7jOnpK9N4RrcCD/DLnUVMsNRcZuUBFausCikNfPJ1wAl2G8DhldHMOPLSNvKFGOIc7F/Hm/LrzBEmd9hpuIvKbSRnCil4SVgkgnPPFZ7qhEGQHk5nsEc7fLw4xWKhfdY/+zFkT9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITh937Uk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITh937Uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709251985; x=1740787985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mf648nhbJvtYVfwxyrA0lKuYEEWOD8GWExgRUUfRrLU=;
  b=ITh937UkHsd2MWPVHzEVGQbCc48r2vTO5qI15DALeZ/qHHVCI1ONuavT
   O4Vht1WrZVBzVSBqeA0XN+t0gch5nW1jjdRXP9rgYHPQI46ewAu7swp5M
   XkAYPhWRUNq1WNMmkjs9xWAKdb3h70tWXOk4q1kUJB5HNjENop6oR1GA9
   ppSsdy4SPdJf6dwhlP0Hzx5wW643tKYf/72mP1VH+DDJATm9XPzJUNsCt
   0tjWKvcQ+ZpRvnre0nMrLrGOYCrLd4O8mNoWPoCxjYPC7OqT/YyUVyLKp
   +yK2mJOtGnzeFbWNIVKaMoMueSsDQr/vrZH5CnPfqSDLvJqEB898o0e0C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3654827"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3654827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 16:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8565556"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 Feb 2024 16:13:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfqWA-000DNR-2h;
	Fri, 01 Mar 2024 00:12:52 +0000
Date: Fri, 1 Mar 2024 08:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202403010820.eyx3IUwb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   582c6d188ec138d8ed9c6ef235bf5698d80d7d6b
commit: 582c6d188ec138d8ed9c6ef235bf5698d80d7d6b [1/1] ANDROID: userfaultfd: allow SPF for UFFD_FEATURE_SIGBUS on private+anon
config: i386-randconfig-063-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010820.eyx3IUwb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010820.eyx3IUwb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010820.eyx3IUwb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mmap.c: note: in included file (through include/linux/hugetlb.h):
>> include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx *
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx [noderef] __rcu *
>> include/linux/userfaultfd_k.h:81:64: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx *
   include/linux/userfaultfd_k.h:81:64: sparse:    struct userfaultfd_ctx [noderef] __rcu *
--
>> fs/userfaultfd.c:759:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct userfaultfd_ctx [noderef] __rcu *ctx @@     got struct userfaultfd_ctx *[assigned] ctx @@
   fs/userfaultfd.c:759:29: sparse:     expected struct userfaultfd_ctx [noderef] __rcu *ctx
   fs/userfaultfd.c:759:29: sparse:     got struct userfaultfd_ctx *[assigned] ctx
>> fs/userfaultfd.c:773:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct userfaultfd_ctx *ctx @@     got struct userfaultfd_ctx [noderef] __rcu *ctx @@
   fs/userfaultfd.c:773:45: sparse:     expected struct userfaultfd_ctx *ctx
   fs/userfaultfd.c:773:45: sparse:     got struct userfaultfd_ctx [noderef] __rcu *ctx
>> fs/userfaultfd.c:1483:64: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct userfaultfd_ctx [noderef] __rcu *ctx @@     got struct userfaultfd_ctx *ctx @@
   fs/userfaultfd.c:1483:64: sparse:     expected struct userfaultfd_ctx [noderef] __rcu *ctx
   fs/userfaultfd.c:1483:64: sparse:     got struct userfaultfd_ctx *ctx

vim +81 include/linux/userfaultfd_k.h

    58	
    59	extern int mfill_atomic_install_pte(struct mm_struct *dst_mm, pmd_t *dst_pmd,
    60					    struct vm_area_struct *dst_vma,
    61					    unsigned long dst_addr, struct page *page,
    62					    bool newly_allocated, bool wp_copy);
    63	
    64	extern ssize_t mcopy_atomic(struct mm_struct *dst_mm, unsigned long dst_start,
    65				    unsigned long src_start, unsigned long len,
    66				    bool *mmap_changing, __u64 mode);
    67	extern ssize_t mfill_zeropage(struct mm_struct *dst_mm,
    68				      unsigned long dst_start,
    69				      unsigned long len,
    70				      bool *mmap_changing);
    71	extern ssize_t mcopy_continue(struct mm_struct *dst_mm, unsigned long dst_start,
    72				      unsigned long len, bool *mmap_changing);
    73	extern int mwriteprotect_range(struct mm_struct *dst_mm,
    74				       unsigned long start, unsigned long len,
    75				       bool enable_wp, bool *mmap_changing);
    76	
    77	/* mm helpers */
    78	static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
    79						struct vm_userfaultfd_ctx vm_ctx)
    80	{
  > 81		return rcu_access_pointer(vma->vm_userfaultfd_ctx.ctx) == vm_ctx.ctx;
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
