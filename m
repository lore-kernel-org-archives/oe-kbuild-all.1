Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CE225F78F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 10:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754477770; cv=none; b=eY9SXnrEA5hSrtZ7S+MegAyl+jFgyPo8tukX7LbFuJWYHcnHlpQYrWxlI34DSI7+Tr9IsERdt0OtiitOFvFeYaBh853mjVWRcKlqlrFSAtFiv+j4SQ3k5TAzaQ4yLEMcL6gCjuKG84ooQ1y86RaxBhK1gxlYN8cYBzvdOU484Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754477770; c=relaxed/simple;
	bh=WtztxRUeHceFAZXcGrg5GWjoIg/NfhikOQa7X2bRHSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qb8Yfy/grnQ6zj2r+PWhB8yRlGxDr3Eg4uFICBZDYLdodbvkRdUec9g/4AlSW2XmRCzSUZfoHJx+ovuQYa23hgEDd+7Unjw26K3OFWcrjDCcxImIdkL4/cxxE7EbNqZHsXhw5XyIuMI8b2lE4E0VyrQB/N58HoDaPeJ6K5uMDKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTHWLhER; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTHWLhER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754477768; x=1786013768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WtztxRUeHceFAZXcGrg5GWjoIg/NfhikOQa7X2bRHSQ=;
  b=TTHWLhERYUmlZFvQ3wOERLCRtGuYThwM/2nhkQijm2fon+UsP3Fc3zbJ
   GENahklOMHyyvRbRGuU1tmdbOQpm3aYqrYolPwwJTdZs+Q1CCI/BQ7WKC
   zJNlP/Y3XOFmvFSSOxHc1J0faUhdry4PoE7Uk1MwIiFd4bJ56M/V17Rhi
   Z/1TwWZ6GtVqikboTbKVEC44VzuzYzozsoElefhr9QND3kBjBDrS1CmFL
   iPMGyunWUd2WXF0ngT4aHKr40ipmoDd49HpGKt3sIYGLCosT54vpqsWx5
   qdJZkTbG/Fzvd1BY37Ap1+aZcKGjoBQW5l9sPJUMYTscCjYExjZUfdouY
   Q==;
X-CSE-ConnectionGUID: UWFt/l+bQjmN24jelW0pZQ==
X-CSE-MsgGUID: MtFPxzfKQZ6BLvQ8iB6DUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56753191"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56753191"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 03:55:52 -0700
X-CSE-ConnectionGUID: 0SmdUthvQ1yNRERRkkPmAA==
X-CSE-MsgGUID: 3jzeeGyRSn2loXdsui7yPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="168993998"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 06 Aug 2025 03:55:51 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujboC-0002C3-24;
	Wed, 06 Aug 2025 10:55:48 +0000
Date: Wed, 6 Aug 2025 12:55:35 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/invept_on_pcpus 5/5] arch/x86/kvm/vmx/vmx.c:3273:39:
 error: 'struct kvm_mmu_page' has no member named 'cpu_flushed_mask'
Message-ID: <202508061219.0qpbN3za-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/invept_on_pcpus
head:   ca798b2e1de4d0975ee808108c7514fe738f0898
commit: ca798b2e1de4d0975ee808108c7514fe738f0898 [5/5] KVM: VMX: Sketch in possible framework for eliding TLB flushes on pCPU migration
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250806/202508061219.0qpbN3za-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061219.0qpbN3za-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061219.0qpbN3za-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmx.c: In function '__vmx_flush_ept_on_pcpu_migration':
>> arch/x86/kvm/vmx/vmx.c:3273:39: error: 'struct kvm_mmu_page' has no member named 'cpu_flushed_mask'
    3273 |             test_and_set_bit(cpu, root->cpu_flushed_mask))
         |                                       ^~


vim +3273 arch/x86/kvm/vmx/vmx.c

  3263	
  3264	static void __vmx_flush_ept_on_pcpu_migration(hpa_t root_hpa, int cpu)
  3265	{
  3266		struct kvm_mmu_page *root;
  3267	
  3268		if (!VALID_PAGE(root_hpa))
  3269			return;
  3270	
  3271		root = root_to_sp(root_hpa);
  3272		if (!WARN_ON_ONCE(!root) &&
> 3273		    test_and_set_bit(cpu, root->cpu_flushed_mask))
  3274			return;
  3275	
  3276		vmx_flush_tlb_ept_root(root_hpa);
  3277	}
  3278	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
