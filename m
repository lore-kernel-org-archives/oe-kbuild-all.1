Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CE0388E74
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 01:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789782068; cv=none; b=MnSFqbOHRdRoLxZXkkDoPtbkib2Z2ni5o1EWnjMWjR969q5f/BuP4Ew1VlVic87zvhvP2WcOEktUIu2twcTIbwoRw1aOkgE6mmaEUjJswB8j+Rk+2Ulx6rQfffcvJfQKB0q6WJ5JTgJ+ybz/bP/bdsLI8EDFr0ef3lUM7slJalY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789782068; c=relaxed/simple;
	bh=T3zfPOjtpQuQ3ul2hnArlSbfJZmCacebxFqs+3ggOWA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PO6vAzkP81xEuiEnwiLl+Y8Io5fNO+cIUZ2ZaGvFOEHHWloExOWdqthb8AB2qpMF1K3wH35t2te+o972UiudoOnFbcCHI1OUtgn5d30mtvxkucCZlPTDhkhGZecX/LSlz8VdUQVcgefacg1P46M6/LZ1TaGkH3+Pgp7H0umdTWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4U59ybp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4U59ybp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789782061; x=1821318061;
  h=date:from:to:cc:subject:message-id;
  bh=T3zfPOjtpQuQ3ul2hnArlSbfJZmCacebxFqs+3ggOWA=;
  b=Q4U59ybpib8mBsNd6LRscSE5nHiMhpJ4ZDX0p/szcKHMBsOB0c6dWnTW
   Rh5g3aBZ4UPyIjA+WxCM4duvwbvirauZaSY0KUnKWvjb3d600z5FlqM3s
   999VhpbFd/LWQHVbb1ogq5InsqSbJ/wEWuXUmFNR9KeM/GM0LNVCRJXdn
   n7D96J9omVH+xq8alsooOStnwC6e/0TOuggrjMtPXsmlGpL0YzGeDVeBZ
   1sfpss7UUf+H0ghD8+1Hz2fff2DaT44Us9WyAn8BEkj0kTZqU2q4zWaSu
   dHYOheUbZBk1rZ9BYJlSIgDET6qfZ+TQCUMaLoDicUo2DzL1w9i6FKrF4
   w==;
X-CSE-ConnectionGUID: odAm2XT/Tw6/b0UUlQ9keQ==
X-CSE-MsgGUID: VIm86CdES/+O0LWzHex7bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100919498"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100919498"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 18:40:58 -0700
X-CSE-ConnectionGUID: 3+qfik4ATzCnHF2J6VH2CQ==
X-CSE-MsgGUID: WlmpU1qaTyOjZ1dfzgdn7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2859625"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 18 Sep 2026 18:40:57 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7k4U-00000000AYv-0djA;
	Sat, 19 Sep 2026 01:40:54 +0000
Date: Sat, 19 Sep 2026 09:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 5532/8449]
 arch/arm64/kvm/vgic/vgic-v5-tables.c:962:34: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202609190952.glUgOBvp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
commit: 77f7a9282fee67180134e75b107ff09d7e1a5876 [5532/8449] KVM: arm64: gic-v5: Introduce guest IST alloc and management
config: arm64-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260919/202609190952.glUgOBvp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190952.glUgOBvp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190952.glUgOBvp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/vgic/vgic-v5-tables.c:464:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *vmd_base @@     got void *[assigned] vmd @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:464:31: sparse:     expected void [noderef] __iomem *vmd_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:464:31: sparse:     got void *[assigned] vmd
   arch/arm64/kvm/vgic/vgic-v5-tables.c:505:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [noderef] [usertype] __iomem *vpet_base @@     got restricted __le64 [usertype] *[assigned] vpet @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:505:24: sparse:     expected restricted __le64 [noderef] [usertype] __iomem *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:505:24: sparse:     got restricted __le64 [usertype] *[assigned] vpet
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:962:34: sparse: sparse: Using plain integer as NULL pointer
   arch/arm64/kvm/vgic/vgic-v5-tables.c:628:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:628:18: sparse:     expected void const *objp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:628:18: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:629:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got void [noderef] __iomem *vmd_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:629:18: sparse:     expected void const *objp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:629:18: sparse:     got void [noderef] __iomem *vmd_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:669:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [usertype] *vpet_base @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:669:19: sparse:     expected restricted __le64 [usertype] *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:669:19: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:681:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] tmp @@     got unsigned long long @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:681:13: sparse:     expected restricted __le64 [usertype] tmp
   arch/arm64/kvm/vgic/vgic-v5-tables.c:681:13: sparse:     got unsigned long long
   arch/arm64/kvm/vgic/vgic-v5-tables.c:684:17: sparse: sparse: cast from restricted __le64
   arch/arm64/kvm/vgic/vgic-v5-tables.c:717:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected restricted __le64 [usertype] *vpet_base @@     got restricted __le64 [noderef] [usertype] __iomem *vpet_base @@
   arch/arm64/kvm/vgic/vgic-v5-tables.c:717:19: sparse:     expected restricted __le64 [usertype] *vpet_base
   arch/arm64/kvm/vgic/vgic-v5-tables.c:717:19: sparse:     got restricted __le64 [noderef] [usertype] __iomem *vpet_base

vim +962 arch/arm64/kvm/vgic/vgic-v5-tables.c

   938	
   939	/* Allocate a two-level IST - LPIs, only */
   940	static int vgic_v5_alloc_two_level_lpi_ist(struct kvm *kvm, unsigned int id_bits,
   941						   unsigned int istsz, unsigned int l2sz)
   942	{
   943		u32 vm_id = vgic_v5_vm_id(kvm);
   944		struct vgic_v5_vm_info *vmi;
   945		int ret;
   946	
   947		/*
   948		 * Allocate the L1 IST first, then all of the L2s. Everything
   949		 * is preallocated and we do no on-demand IST allocation. This
   950		 * is to avoid needing to track if and when the guest is doing
   951		 * on-demand IST allocation.
   952		 */
   953		ret = vgic_v5_alloc_l1_ist(kvm, id_bits, istsz, l2sz);
   954		if (ret)
   955			return ret;
   956	
   957		ret = vgic_v5_alloc_l2_ists(kvm, id_bits, istsz, l2sz);
   958		if (ret) {
   959			/* Free the L1 IST again */
   960			vmi = xa_load(&vm_info, vm_id);
   961			kfree(vmi->h_lpi_ist);
 > 962			vmi->h_lpi_ist = 0;
   963	
   964			return ret;
   965		}
   966	
   967		return 0;
   968	}
   969	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
