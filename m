Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7B44A20
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719056928; cv=none; b=tyQrLxBQt4jut8PDpaJd3lSbSL6usIy7H1I1M7vqmNr7jRfO5nEaFBiCMSE45io1zbn8kQcokzqhgpZuZRoa9Y5Wb04AGokVxF9wGuf1v2uW0dckbHnllo7xsQxffI5TQsHfHuQtMnEiFZ75krvi420l+jAEwRvv8AMXuVDB+sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719056928; c=relaxed/simple;
	bh=0ncIQkq+WnmB5YBdmHU643o7Pu+c07gukBUaiZEUeAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bM1bQaCvcYh3wgsh62pIXWMuHIQolOW6N4ub1yQh6uUGL3R3+emAQoHw7y6v8AWPo0t4PrpeDysQC7v1564xbBC7TB7niPHBPdCzIjzH7XYpzqnH3+R/NiMlay9eTCng8B7HdXd8R55ze+A/Zh1D1FE7K90R35toHYq54fl1n1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsLCa5Q0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsLCa5Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719056926; x=1750592926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ncIQkq+WnmB5YBdmHU643o7Pu+c07gukBUaiZEUeAY=;
  b=gsLCa5Q0X55l70e7Q9yJpka60Aoq1uv2M800NpHAHskQhCI97jm74UVp
   9BznyZ+anZMsu4585lpmcIuY6XxjWgVB8/LH5HBhk2wl+4GS0uTIrjt2s
   9l5iRXzo3M8c01p7n/tYSu8tQmzFeuyHSPJSl44WkGKQtv+PhC9D8Lwh7
   2npbiHnYF1FGBIxIr6/qVcB8EQVeD/oFT9JHahrSzcmYN4m1S0UZijGKo
   NaKm2+cstLQwnhO9J1Djvga9vzCQtXX6U23kARFEPr5qWaOEz1pn6gQTk
   ZQ2KumCksbz7Pb0cIpve67wk3OnwKc8hFKo/jGq7SlFUooZfUHPk8x+/g
   A==;
X-CSE-ConnectionGUID: vnKy1hu1QCaX5PeRCb/htA==
X-CSE-MsgGUID: k+zdqifaQwaAagNRBE4WQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26770494"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="26770494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 04:48:45 -0700
X-CSE-ConnectionGUID: g4nnqME/TK+8niwpMGbf6A==
X-CSE-MsgGUID: aYDFw1pVTJamdecGR5Z9hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="43515962"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2024 04:48:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKzEX-0009Ze-2d;
	Sat, 22 Jun 2024 11:48:41 +0000
Date: Sat, 22 Jun 2024 19:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, David Stevens <stevensd@chromium.org>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [sean-jc:x86/mmu_follow_pfn 13/28]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:2987:18: error: 'struct
 kvm_follow_pfn' has no member named 'atomic'
Message-ID: <202406221925.KFeQFUgm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   57ff012a34bc3bfac1ebb0724078e8fe47fdb60a
commit: 2e1ef556dc18d78c75fc1ddc11cb770a3de6eb61 [13/28] KVM: mmu: Introduce kvm_follow_pfn()
config: x86_64-randconfig-161-20240622 (https://download.01.org/0day-ci/archive/20240622/202406221925.KFeQFUgm-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221925.KFeQFUgm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221925.KFeQFUgm-lkp@intel.com/

Note: the sean-jc/x86/mmu_follow_pfn HEAD 57ff012a34bc3bfac1ebb0724078e8fe47fdb60a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function '__gfn_to_pfn_memslot':
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2987:18: error: 'struct kvm_follow_pfn' has no member named 'atomic'
    2987 |                 .atomic = atomic,
         |                  ^~~~~~
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:2987:27: error: 'atomic' undeclared (first use in this function); did you mean 'atomic_t'?
    2987 |                 .atomic = atomic,
         |                           ^~~~~~
         |                           atomic_t
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:2987:27: note: each undeclared identifier is reported only once for each function it appears in


vim +2987 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  2979	
  2980	kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
  2981				       bool interruptible, bool no_wait,
  2982				       bool write_fault, bool *writable)
  2983	{
  2984		struct kvm_follow_pfn kfp = {
  2985			.slot = slot,
  2986			.gfn = gfn,
> 2987			.atomic = atomic,
  2988			.map_writable = writable,
  2989		};
  2990	
  2991		if (write_fault)
  2992			kfp.flags |= FOLL_WRITE;
  2993		if (no_wait)
  2994			kfp.flags |= FOLL_NOWAIT;
  2995		if (interruptible)
  2996			kfp.flags |= FOLL_INTERRUPTIBLE;
  2997	
  2998		return kvm_follow_pfn(&kfp);
  2999	}
  3000	EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
  3001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
