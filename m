Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A3920DD51
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764091749; cv=none; b=iWkeH9XfmxmJLkH63rG7GzYuyhmkQCVKxUAUVtZv0iiaQJfvKiTGwy38r7es6zqssoq2iS2mCobLvOByu5nMqgQ9/ChHsD4NgpBjsVRVk6+cwxQqMWhl4DZyWSz4TB4OxJJJ0d+UtvSdZoSZyIf0Fh1MycXlY7+H5vtcjmgLsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764091749; c=relaxed/simple;
	bh=4u1xGNU46ikaOpPgXbKGMNXgx6L45FsQVbEPPcAuCaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OehhAkrTO739I9fLjZP8OSMblQKVj+LvTr/Q6jajf4yvW89hzLiFSCrsYt8xIC0ntxN8BN2VNKnylJXEXq/c9oTRAuD8uaGAayYf8UtD4XiKWaHFU7GEa2SuIa+Qot2cLk2BzFUG0j/9JbIG2EVuqV4JHCgqAhqMVUDXn4AG4MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apWdNb7Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apWdNb7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764091748; x=1795627748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4u1xGNU46ikaOpPgXbKGMNXgx6L45FsQVbEPPcAuCaQ=;
  b=apWdNb7ZCKiC1thCcGsGhHj0QujcHNqiOh/2V4g65KegSd7vXZyklfrx
   XH2B50OXK/HHYj49kGa4xNNyL+YtxPTVIXAYgraJWRuhTHrXdUkg1eEGc
   ZiOmvzVkTYd07XlPljc9AvZylPFn7BWLdwddCdLePet5y1lEY6U/iOpV7
   ZJXFqbu/iNH+4GbY6k5hbKcoWosQc4Z/PEq9aUMX++jFzvJy/daoliEfh
   ujs6aiXa2c3AmH+weV3I2sYAwqxWndQI9gvRi6Fi6yv1AMWsSwy3wgsFz
   lK1tVnQ2/TXYWLls3KwRUnSlfeDAJI+fU6qdveE5TjilPQw7O6zsfPT6O
   A==;
X-CSE-ConnectionGUID: XcS7D0/mRfWUieDM7fSBdw==
X-CSE-MsgGUID: zHII8eqrSPSWNIexnTJSIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66065066"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="66065066"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 09:29:04 -0800
X-CSE-ConnectionGUID: wLy9UdIqSuewA57sdGt7Mg==
X-CSE-MsgGUID: wmqltWBIRraFee2K391ElQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="191841904"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2025 09:29:03 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNwqa-0000000024n-19hD;
	Tue, 25 Nov 2025 17:29:00 +0000
Date: Wed, 26 Nov 2025 01:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 11293/11746] arch/arm64/kvm/hyp/pgtable.c:757:2:
 warning: label at end of compound statement is a C23 extension
Message-ID: <202511260129.jvYnEtGj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   92fd6e84175befa1775e5c0ab682938eca27c0b2
commit: 2608563b466b9192a9356b18463005da6e138bf9 [11293/11746] KVM: arm64: Add support for FEAT_XNX stage-2 permissions
config: arm64-randconfig-r133-20251125 (https://download.01.org/0day-ci/archive/20251126/202511260129.jvYnEtGj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260129.jvYnEtGj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260129.jvYnEtGj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/pgtable.c:757:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     757 |         }
         |         ^
   1 warning generated.
--
>> arch/arm64/kvm/hyp/nvhe/../pgtable.c:757:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     757 |         }
         |         ^
   1 warning generated.

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/pgtable.c:757:9: sparse: sparse: statement expected after case label
   arch/arm64/kvm/hyp/pgtable.c:268:5: sparse: sparse: context imbalance in 'kvm_pgtable_walk' - different lock contexts for basic block
--
>> arch/arm64/kvm/hyp/nvhe/../pgtable.c:757:9: sparse: sparse: statement expected after case label

vim +757 arch/arm64/kvm/hyp/pgtable.c

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
   756		default:
 > 757		}
   758	
   759		return prot;
   760	}
   761	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
