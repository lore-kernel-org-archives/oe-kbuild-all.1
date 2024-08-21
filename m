Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FCE142631
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 18:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724263675; cv=none; b=bK+BVLOx80hdyMq4cYPGX7636PNcP92iwyfefIwSK6scv5UZLgooy1L0HjwE+AhWtjQYHX2OgwbjG1BCQjYY0oUUf/mxylA8rseIJYQ63879iNZ3yHMdltFhxxbaEqoSlkbPj6OCFVCUFHLy3u/KP1pui5yzskI6feINnJabJcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724263675; c=relaxed/simple;
	bh=ADA2nh7I1+NYrSYEimA78H6epAZnomL8iY+9nktLl9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF2d1s+AvkaPRADJJpAokef8bu24V/QrCDUUWJi0c5jMoUZKrgMfCvCDjCUserGCajCMsYci4ktdmY7rL796Xy+cWf+p6k71Mgb7y1HgfEQijjpT8RHxzKJm54wRdL1gRFnshXtF+HLxtr/ALB7auVHq7Yrhmw8estS95OEhDsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fND9Sw/g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fND9Sw/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724263674; x=1755799674;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ADA2nh7I1+NYrSYEimA78H6epAZnomL8iY+9nktLl9k=;
  b=fND9Sw/gwVRANKzAnG6Ez5UHyyGqZh4OY8MR8SM6Bm+jn6qndPQl8u73
   6FFPELgShN+FPbA1T0CVDhoYn+ptIom8w2U6bTyei9j7+EgQLC1BbVc8e
   fS5zmkOlt8fv1KJ7fOdUJga3oPfDKqcSE2EZ7B1IvxcBCPvK6LdErF0fq
   S0qKCOdsP64t7KUB6KpnfB7BsxzOgVrh6x2MBj/3VG67nwlZHESQc5eiK
   /Ir0b3xXw5iQx/PFcYRZ8M1V6ippKBzQ20LbuZAWuEwc77i/+aBLQ3PoK
   HwJ9lCGTYVphw/TMOBi4fE9IIOCXh7WVYq9qy07qWVQ4oS5tm9i9Tu2lj
   Q==;
X-CSE-ConnectionGUID: gN/T5rqMTU+SyDqj/nGPpA==
X-CSE-MsgGUID: bd8UnAhJS5eimIKRlq7DzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22452872"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22452872"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 11:07:53 -0700
X-CSE-ConnectionGUID: w+EfMrZLShCQwZYy8J36uQ==
X-CSE-MsgGUID: NCaB8/rZSUeRJUs4UVJp2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="84337619"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2024 11:07:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgpkL-000BlG-2t;
	Wed, 21 Aug 2024 18:07:49 +0000
Date: Thu, 22 Aug 2024 02:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 14/18] KVM: arm64: nv: Add SW walker for AT S1
 emulation
Message-ID: <202408220101.bqH2w4z5-lkp@intel.com>
References: <20240820103756.3545976-15-maz@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820103756.3545976-15-maz@kernel.org>

Hi Marc,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvmarm/next]
[also build test WARNING on arm64/for-next/core soc/for-next linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Zyngier/arm64-Add-missing-APTable-and-TCR_ELx-HPD-masks/20240820-184117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20240820103756.3545976-15-maz%40kernel.org
patch subject: [PATCH v4 14/18] KVM: arm64: nv: Add SW walker for AT S1 emulation
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240822/202408220101.bqH2w4z5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220101.bqH2w4z5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220101.bqH2w4z5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/at.c: In function 'handle_at_slow':
>> arch/arm64/kvm/at.c:736:45: warning: variable 'px' set but not used [-Wunused-but-set-variable]
     736 |         bool perm_fail, ur, uw, ux, pr, pw, px;
         |                                             ^~
   arch/arm64/kvm/at.c: In function '__kvm_at_s1e2':
   arch/arm64/kvm/at.c:973:36: warning: variable 'mmu' set but not used [-Wunused-but-set-variable]
     973 |                 struct kvm_s2_mmu *mmu;
         |                                    ^~~


vim +/px +736 arch/arm64/kvm/at.c

   733	
   734	static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
   735	{
 > 736		bool perm_fail, ur, uw, ux, pr, pw, px;
   737		struct s1_walk_result wr = {};
   738		struct s1_walk_info wi = {};
   739		int ret, idx;
   740	
   741		ret = setup_s1_walk(vcpu, op, &wi, &wr, vaddr);
   742		if (ret)
   743			goto compute_par;
   744	
   745		if (wr.level == S1_MMU_DISABLED)
   746			goto compute_par;
   747	
   748		idx = srcu_read_lock(&vcpu->kvm->srcu);
   749	
   750		ret = walk_s1(vcpu, &wi, &wr, vaddr);
   751	
   752		srcu_read_unlock(&vcpu->kvm->srcu, idx);
   753	
   754		if (ret)
   755			goto compute_par;
   756	
   757		/* FIXME: revisit when adding indirect permission support */
   758		/* AArch64.S1DirectBasePermissions() */
   759		if (wi.regime != TR_EL2) {
   760			switch (FIELD_GET(PTE_USER | PTE_RDONLY, wr.desc)) {
   761			case 0b00:
   762				pr = pw = true;
   763				ur = uw = false;
   764				break;
   765			case 0b01:
   766				pr = pw = ur = uw = true;
   767				break;
   768			case 0b10:
   769				pr = true;
   770				pw = ur = uw = false;
   771				break;
   772			case 0b11:
   773				pr = ur = true;
   774				pw = uw = false;
   775				break;
   776			}
   777	
   778			switch (wr.APTable) {
   779			case 0b00:
   780				break;
   781			case 0b01:
   782				ur = uw = false;
   783				break;
   784			case 0b10:
   785				pw = uw = false;
   786				break;
   787			case 0b11:
   788				pw = ur = uw = false;
   789				break;
   790			}
   791	
   792			/* We don't use px for anything yet, but hey... */
   793			px = !((wr.desc & PTE_PXN) || wr.PXNTable || uw);
   794			ux = !((wr.desc & PTE_UXN) || wr.UXNTable);
   795	
   796			if (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) {
   797				bool pan;
   798	
   799				pan = *vcpu_cpsr(vcpu) & PSR_PAN_BIT;
   800				pan &= ur || uw;
   801				pw &= !pan;
   802				pr &= !pan;
   803			}
   804		} else {
   805			ur = uw = ux = false;
   806	
   807			if (!(wr.desc & PTE_RDONLY)) {
   808				pr = pw = true;
   809			} else {
   810				pr = true;
   811				pw = false;
   812			}
   813	
   814			if (wr.APTable & BIT(1))
   815				pw = false;
   816	
   817			/* XN maps to UXN */
   818			px = !((wr.desc & PTE_UXN) || wr.UXNTable);
   819		}
   820	
   821		perm_fail = false;
   822	
   823		switch (op) {
   824		case OP_AT_S1E1RP:
   825		case OP_AT_S1E1R:
   826		case OP_AT_S1E2R:
   827			perm_fail = !pr;
   828			break;
   829		case OP_AT_S1E1WP:
   830		case OP_AT_S1E1W:
   831		case OP_AT_S1E2W:
   832			perm_fail = !pw;
   833			break;
   834		case OP_AT_S1E0R:
   835			perm_fail = !ur;
   836			break;
   837		case OP_AT_S1E0W:
   838			perm_fail = !uw;
   839			break;
   840		default:
   841			BUG();
   842		}
   843	
   844		if (perm_fail)
   845			fail_s1_walk(&wr, ESR_ELx_FSC_PERM_L(wr.level), false, false);
   846	
   847	compute_par:
   848		return compute_par_s1(vcpu, &wr, wi.regime);
   849	}
   850	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
