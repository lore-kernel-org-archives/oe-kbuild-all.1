Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284700;
	b=Flgt/12cbQKjBbShIrpngH+vSglqrMTX5Fj1V/ooShuafYn/G78uTHJYAXiOeCmd8LY2
	 +iOMowtJj/gVnHp3pV18SbS0AGlwocR686A7n6ozGEmEE13cLP5jyZXxsv9wSQ9eKw1vA
	 SvEXvCtLtzgH5OJbyP21NBxod2RBbo78ZnrokvE8Lhhcr20kFC2tu8tWlPHUWJMFazqdL
	 TnRRsIURI4ofEprRpoJqNbsc4NfYd37MWwPMbcuVl6LaJK6FEg4lJ/dlCJ+Vd2x89FOk4
	 TBay7thsnW6bw+Wn6+0UfEPHiQMVy9O4DtmXjs9FwowWPYy6JwI14BMeeHIXHCe0Z6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284700;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PDvlpYOucALmvbgmcjxVT7CV39QsRZXJUAVyVC6i1eY=;
	b=Kz+Pb/6W18X1EHtqZN9Oj2o3OjF+0gvsPSJPRtF+Jn0GVD3p53rcn3rcmTSp4ySai+nh
	 eH5tMArJDM0PsRD/U17Z892ctwWHwfv14SBPMw9X713MKpveRlZ1VkcHwUIBPvgTF+3G1
	 UsDgKt+iJAnCRVqmsujWzWmxIDvFVmmDiUb4qidY0wih+R/umPb++5Dpy/53aEPlbpgHI
	 +NSFSyxvaa6idVfk031oIa1SulUiU0cndzY1a72DQoYbSmZ6v+o237nnJ+GIkUjZGHg6y
	 fPLVTAPGCymh13RyC4gLhF5sEPNm9VZwE4aZP3PLExqw9FPIU1FvdzvgcwSBqKTGOxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYwxtCjv;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD6606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 14:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FBD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYwxtCjv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793284699; x=1824820699;
  h=date:from:to:cc:subject:message-id;
  bh=u1rgapXL3P3/S1/ducCi80x/2BFlhXYoZhNCDBJxsKA=;
  b=dYwxtCjvdNh994VEXUpo7qJEvEHTvCGEk3axq1wGK7cr+/vCt7w+in/J
   +DZuDEKoYQmun2BPit8laHzfwftYt6r0mrgkyMEIi8h815oMO1Y+qhDE1
   L4dSaDLYUzZTJiGK5MGyv9aPvaqp4Q+Bgzx8YbPcvZkjhSwS4RuU/hnoJ
   euWvcz4ZPk11rF8B8MIPtzF29Tk53bqRZKM4epspm1/vVLTF601kcJk3y
   HYnSi6siif6QIGyspblJFC4rRumvtEt3ifjvPHRvH6xr4numqXcqYv85O
   ow9sbQ6yOinOsWPTAxQkWevY+TAiXtPrtk+39e4ME3gCY4Q6wo6am5Me0
   w==;
X-CSE-ConnectionGUID: cF++Gk3rS6qeT7Rw1ATvyw==
X-CSE-MsgGUID: xFBtFReXSpORxVLpFM4H6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2043654"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2043654"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:38:18 -0700
X-CSE-ConnectionGUID: Nl4jR8ZRSA2I0zlnf1DSZA==
X-CSE-MsgGUID: nYMZu3scRl6dnjtU+1+bQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5559281"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2026 07:38:18 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMRGd-00000000aEW-2ITJ;
	Thu, 29 Oct 2026 14:38:11 +0000
Date: Thu, 29 Oct 2026 22:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-p3s 2/2]
 arch/arm64/kvm/mmu.c:307:22: warning: no previous prototype for
 'kvm_pinned_pages_insert'
Message-ID: <202610292208.hu0bQvI0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-p3s
head:   606d03f6372c0cd085fc0d154cbfc17c298058f2
commit: 6cf1f36e41a79cd8275eab61d29ad30219b60047 [2/2] ANDROID: KVM: Use interval-tree for kvm_pinned_page
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261029/202610292208.hu0bQvI0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610292208.hu0bQvI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610292208.hu0bQvI0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/mmu.c:11:
>> arch/arm64/kvm/mmu.c:307:22: warning: no previous prototype for 'kvm_pinned_pages_insert' [-Wmissing-prototypes]
     307 |                      kvm_pinned_pages);
         |                      ^~~~~~~~~~~~~~~~
   include/linux/interval_tree_generic.h:38:15: note: in definition of macro 'INTERVAL_TREE_DEFINE'
      38 | ITSTATIC void ITPREFIX ## _insert(ITSTRUCT *node,                             \
         |               ^~~~~~~~
   arch/arm64/kvm/mmu.c: In function 'user_mem_abort':
   arch/arm64/kvm/mmu.c:1842:21: warning: variable 'ipa' set but not used [-Wunused-but-set-variable=]
    1842 |         phys_addr_t ipa = fault_ipa;
         |                     ^~~


vim +/kvm_pinned_pages_insert +307 arch/arm64/kvm/mmu.c

   304	
   305	INTERVAL_TREE_DEFINE(struct kvm_pinned_page, node, u64, __subtree_last,
   306			     __pinned_page_start, __pinned_page_end, /* emtpy */,
 > 307			     kvm_pinned_pages);
   308	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
