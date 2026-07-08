Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6AF367B98
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 20:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541607; cv=none; b=NYpuTMNzn0XEehGDTNsvmY8iO5BSQ8IWZVc2SxwkBGKopCfOCGxyzc1FNgP0h/eVdHlPRQXCUYu4P2XNjY0x8beGvluzwIdAdAwjh2Tmn9CksyUCbL4AP5MzwL4HDzkGYA9uQIE6k5KCMrbOD7ZaSoPcK3i2meQEzdUlsgYX/UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541607; c=relaxed/simple;
	bh=F1+H2sLBKl7N5W1WauAJPrhPC9qX727q1s9yVyTEC0M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FVfjKYugPrnVLSGXTZD4NUeWuMj2/RqOXPcBkxjpZWizpg5/g1DaJHEesTiC7CDRne8JLx5I5OYEY0f1pZbZSCrQfn+WSIfxzHkKYwbI9mNFDkFD9KnzW9R83ey39h4+mUGIkypT/27B1Z8rDOKNkWg/NpEn5oT7IvQYbLlpvw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ce4DUTtH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ce4DUTtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783541605; x=1815077605;
  h=date:from:to:cc:subject:message-id;
  bh=F1+H2sLBKl7N5W1WauAJPrhPC9qX727q1s9yVyTEC0M=;
  b=Ce4DUTtHJ1Q94X3IZC/hXmvOTSeyJcC2wHW+CSwNvUvcc+otTIf5L3+b
   kuGOmwe7O5G0G7sM80XSm6kN1tUy7I5QvlgfLR5shP9K64QH5IeeKOAah
   fPVFUBc3unp9VJKt8ScYIY2qeUfTT9U966pLdZu70T2e7fLOMxzWmRg6h
   sa6DbgKUOP6xjouO4RBpoA+zFGrMtXKXFY+lcTGZv87/LVjSQzo7kpHi3
   YKhhF2iTUyPRfD34SvFIYZ+feSMP4Vl/EJcXfSv6+W4YHf/+vGh+yzMjh
   o3zK5kunmXftTsFwNywzwtv5SmGEkLKjULiueTcup3GH4jIyfcRek0h5O
   Q==;
X-CSE-ConnectionGUID: eakIKfPqQO6qTBXc+33BCQ==
X-CSE-MsgGUID: bVO8PbhbQ/q7x8XK0aseEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84314129"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84314129"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 13:13:25 -0700
X-CSE-ConnectionGUID: KwxxmqNERGKHo/z1vU8e3w==
X-CSE-MsgGUID: WJhQQOXxQx2YKT30eW6EiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252636280"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Jul 2026 13:13:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whYdy-00000000Gop-3VmG;
	Wed, 08 Jul 2026 20:13:18 +0000
Date: Thu, 09 Jul 2026 04:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/x86/kvm/mmu/mmu.c:5596:82: sparse: sparse: cast
 truncates bits from constant value (ffff5555 becomes 5555)
Message-ID: <202607090444.wjsjpjxT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: a8827c19614629ee51f2355ceeea36b96d77eb60 KVM: x86/mmu: introduce ACC_READ_MASK
date:   8 weeks ago
config: x86_64-randconfig-123 (https://download.01.org/0day-ci/archive/20260709/202607090444.wjsjpjxT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090444.wjsjpjxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a8827c196146 ("KVM: x86/mmu: introduce ACC_READ_MASK")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090444.wjsjpjxT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/mmu.c: note: in included file:
   arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/paging_tmpl.h:440:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
>> arch/x86/kvm/mmu/mmu.c:5596:82: sparse: sparse: cast truncates bits from constant value (ffff5555 becomes 5555)
>> arch/x86/kvm/mmu/mmu.c:5598:59: sparse: sparse: cast truncates bits from constant value (ffff3333 becomes 3333)
>> arch/x86/kvm/mmu/mmu.c:5607:63: sparse: sparse: cast truncates bits from constant value (ffff00ff becomes ff)
>> arch/x86/kvm/mmu/mmu.c:5614:62: sparse: sparse: cast truncates bits from constant value (ffff0f0f becomes f0f)
   arch/x86/kvm/mmu/mmu.c:5617:72: sparse: sparse: cast truncates bits from constant value (ffff00ff becomes ff)

vim +5596 arch/x86/kvm/mmu/mmu.c

  5531	
  5532	/*
  5533	 * Build a mask with all combinations of PTE access rights that
  5534	 * include the given access bit.  The mask can be queried with
  5535	 * "mask & (1 << access)", where access is a combination of
  5536	 * ACC_* bits.
  5537	 *
  5538	 * By mixing and matching multiple masks returned by ACC_BITS_MASK,
  5539	 * update_permission_bitmask() builds what is effectively a
  5540	 * two-dimensional array of bools.  The second dimension is
  5541	 * provided by individual bits of permissions[pfec >> 1], and
  5542	 * logical &, | and ~ operations operate on all the 16 possible
  5543	 * combinations of ACC_* bits.
  5544	 */
  5545	#define ACC_BITS_MASK(access) \
  5546		((1 & (access) ? 1 << 1 : 0) | \
  5547		 (2 & (access) ? 1 << 2 : 0) | \
  5548		 (3 & (access) ? 1 << 3 : 0) | \
  5549		 (4 & (access) ? 1 << 4 : 0) | \
  5550		 (5 & (access) ? 1 << 5 : 0) | \
  5551		 (6 & (access) ? 1 << 6 : 0) | \
  5552		 (7 & (access) ? 1 << 7 : 0) | \
  5553		 (8 & (access) ? 1 << 8 : 0) | \
  5554		 (9 & (access) ? 1 << 9 : 0) | \
  5555		 (10 & (access) ? 1 << 10 : 0) | \
  5556		 (11 & (access) ? 1 << 11 : 0) | \
  5557		 (12 & (access) ? 1 << 12 : 0) | \
  5558		 (13 & (access) ? 1 << 13 : 0) | \
  5559		 (14 & (access) ? 1 << 14 : 0) | \
  5560		 (15 & (access) ? 1 << 15 : 0))
  5561	
  5562	static void update_permission_bitmask(struct kvm_mmu *mmu, bool ept)
  5563	{
  5564		unsigned index;
  5565	
  5566		const u16 x = ACC_BITS_MASK(ACC_EXEC_MASK);
  5567		const u16 w = ACC_BITS_MASK(ACC_WRITE_MASK);
  5568		const u16 r = ACC_BITS_MASK(ACC_READ_MASK);
  5569	
  5570		bool cr4_smep = is_cr4_smep(mmu);
  5571		bool cr4_smap = is_cr4_smap(mmu);
  5572		bool cr0_wp = is_cr0_wp(mmu);
  5573		bool efer_nx = is_efer_nx(mmu);
  5574	
  5575		/*
  5576		 * In hardware, page fault error codes are generated (as the name
  5577		 * suggests) on any kind of page fault.  permission_fault() and
  5578		 * paging_tmpl.h already use the same bits after a successful page
  5579		 * table walk, to indicate the kind of access being performed.
  5580		 *
  5581		 * However, PFERR_PRESENT_MASK and PFERR_RSVD_MASK are never set here,
  5582		 * exactly because the page walk is successful.  PFERR_PRESENT_MASK is
  5583		 * removed by the shift, while PFERR_RSVD_MASK is repurposed in
  5584		 * permission_fault() to indicate accesses that are *not* subject to
  5585		 * SMAP restrictions.
  5586		 */
  5587		for (index = 0; index < ARRAY_SIZE(mmu->permissions); ++index) {
  5588			unsigned pfec = index << 1;
  5589	
  5590			/*
  5591			 * Each "*f" variable has a 1 bit for each ACC_* combo
  5592			 * that causes a fault with the given PFEC.
  5593			 */
  5594	
  5595			/* Faults from reads to non-readable pages */
> 5596			u16 rf = (pfec & (PFERR_WRITE_MASK|PFERR_FETCH_MASK)) ? 0 : (u16)~r;
  5597			/* Faults from writes to non-writable pages */
> 5598			u16 wf = (pfec & PFERR_WRITE_MASK) ? (u16)~w : 0;
  5599			/* Faults from user mode accesses to supervisor pages */
  5600			u16 uf = 0;
  5601			/* Faults from fetches of non-executable pages */
  5602			u16 ff = 0;
  5603			/* Faults from kernel mode accesses of user pages */
  5604			u16 smapf = 0;
  5605	
  5606			if (ept) {
> 5607				ff = (pfec & PFERR_FETCH_MASK) ? (u16)~x : 0;
  5608			} else {
  5609				const u16 u = ACC_BITS_MASK(ACC_USER_MASK);
  5610	
  5611				/* Faults from kernel mode accesses to user pages */
  5612				u16 kf = (pfec & PFERR_USER_MASK) ? 0 : u;
  5613	
> 5614				uf = (pfec & PFERR_USER_MASK) ? (u16)~u : 0;
  5615	
  5616				if (efer_nx)
  5617					ff |= (pfec & PFERR_FETCH_MASK) ? (u16)~x : 0;
  5618	
  5619				/* Allow supervisor writes if !cr0.wp */
  5620				if (!cr0_wp)
  5621					wf = (pfec & PFERR_USER_MASK) ? wf : 0;
  5622	
  5623				/* Disallow supervisor fetches of user code if cr4.smep */
  5624				if (cr4_smep)
  5625					ff |= (pfec & PFERR_FETCH_MASK) ? kf : 0;
  5626	
  5627				/*
  5628				 * SMAP:kernel-mode data accesses from user-mode
  5629				 * mappings should fault. A fault is considered
  5630				 * as a SMAP violation if all of the following
  5631				 * conditions are true:
  5632				 *   - X86_CR4_SMAP is set in CR4
  5633				 *   - A user page is accessed
  5634				 *   - The access is not a fetch
  5635				 *   - The access is supervisor mode
  5636				 *   - If implicit supervisor access or X86_EFLAGS_AC is clear
  5637				 *
  5638				 * Here, we cover the first four conditions.  The fifth
  5639				 * is computed dynamically in permission_fault() and
  5640				 * communicated by setting PFERR_RSVD_MASK.
  5641				 */
  5642				if (cr4_smap)
  5643					smapf = (pfec & (PFERR_RSVD_MASK|PFERR_FETCH_MASK)) ? 0 : kf;
  5644			}
  5645	
  5646			mmu->permissions[index] = ff | uf | wf | rf | smapf;
  5647		}
  5648	}
  5649	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
