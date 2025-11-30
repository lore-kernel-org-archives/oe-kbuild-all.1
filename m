Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397D2417F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764540010; cv=none; b=lIgVplSUHcfGL0EPFymdl7STg1eoDbVqVijtBQnfnyM4dgtguihDUohI/zP876WthyffPL0XhK0GEOw//odj1Pc4BVmJtkGKOd1MNA6wE7/WIFWVTN6ulMRknZAAgVHv8sCHmqD4GZQrMGBHeIjfjSPMqzdtLwSCfFbcq2cfOtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764540010; c=relaxed/simple;
	bh=kF65YgNPOJ7gtnbqwtcIZtTb/EO/Y8BQ1h+3Lia5lRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/HfPC9u9j6sjuObhZMEZfdkXLWrLaYqyB8VFsk/DMwg5tIxdjOranZvHFaK3/R7ZIvziGh0qpNppDdsJclZ9AqRXvZ79qqbK+EWwCn1bISJNTgke5ENm3cTKhOz30UZvJQBNzpPLQWKDn7c5j4UKBvaRQTVZrvyGIFQUT2zBNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SN35Ok0K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SN35Ok0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764540008; x=1796076008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kF65YgNPOJ7gtnbqwtcIZtTb/EO/Y8BQ1h+3Lia5lRQ=;
  b=SN35Ok0KeRYg8sRWAiTupUNtLbRsbQKJI7gg1CLbdRCdM77TXZ8UBECx
   lVDtXJHv+yGwNWQoUt0EznOsnqFFhwQFz8pzm0niDKgqbZj8uhb9gwRfV
   ERK6C0x2RBBJVS5xao3vH0biqjhhqLlUWZ8ORRv03nwbMClPErY5SHg5V
   wwTzMDn68Pe/hsnmnHSyM4AsoI6EVhxe+kFy1iS1LVvrCfwiZPUit26RS
   2bUwtJy4ECS2bTEoQxcX4zLzHaj9mEw6YX/DOWoJo+wNnpk5SlWeAb7SP
   AG1A9Gjz1LxEqQvT38AdH/HGt6M0zfoLDLtAoczt1xFCcVkVfe2n5o4eM
   Q==;
X-CSE-ConnectionGUID: xewEI5bqSSWAJ5OwmNN4vg==
X-CSE-MsgGUID: gNPPT+YETsmRD+l6TEzkdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77943841"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="77943841"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 14:00:06 -0800
X-CSE-ConnectionGUID: KJPN2VpoR4qNp4ZgsmW7ug==
X-CSE-MsgGUID: drE6hbbkS1mX/cNQGXtlKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="198096980"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Nov 2025 14:00:05 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPpSd-000000008Cv-0HxF;
	Sun, 30 Nov 2025 22:00:03 +0000
Date: Mon, 1 Dec 2025 05:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 11143/12740] arch/arm64/kvm/hyp/pgtable.c:756:2:
 error: label at end of compound statement
Message-ID: <202512010526.0DJ19Dg8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: 2608563b466b9192a9356b18463005da6e138bf9 [11143/12740] KVM: arm64: Add support for FEAT_XNX stage-2 permissions
config: arm64-randconfig-001-20251201 (https://download.01.org/0day-ci/archive/20251201/202512010526.0DJ19Dg8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512010526.0DJ19Dg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512010526.0DJ19Dg8-lkp@intel.com/

Note: the linux-next/master HEAD 7d31f578f3230f3b7b33b0930b08f9afd8429817 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/pgtable.c: In function 'kvm_pgtable_stage2_pte_prot':
>> arch/arm64/kvm/hyp/pgtable.c:756:2: error: label at end of compound statement
     default:
     ^~~~~~~
--
   arch/arm64/kvm/hyp/nvhe/../pgtable.c: In function 'kvm_pgtable_stage2_pte_prot':
>> arch/arm64/kvm/hyp/nvhe/../pgtable.c:756:2: error: label at end of compound statement
     default:
     ^~~~~~~


vim +756 arch/arm64/kvm/hyp/pgtable.c

   733	
   734	enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte)
   735	{
   736		enum kvm_pgtable_prot prot = pte & KVM_PTE_LEAF_ATTR_HI_SW;
   737	
   738		if (!kvm_pte_valid(pte))
   739			return prot;
   740	
   741		if (pte & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R)
   742			prot |= KVM_PGTABLE_PROT_R;
   743		if (pte & KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W)
   744			prot |= KVM_PGTABLE_PROT_W;
   745	
   746		switch (FIELD_GET(KVM_PTE_LEAF_ATTR_HI_S2_XN, pte)) {
   747		case 0b00:
   748			prot |= KVM_PGTABLE_PROT_PX | KVM_PGTABLE_PROT_UX;
   749			break;
   750		case 0b01:
   751			prot |= KVM_PGTABLE_PROT_UX;
   752			break;
   753		case 0b11:
   754			prot |= KVM_PGTABLE_PROT_PX;
   755			break;
 > 756		default:
   757		}
   758	
   759		return prot;
   760	}
   761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
