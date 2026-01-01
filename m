Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623921A3029
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jan 2026 01:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767231085; cv=none; b=t2HHySCJjcCGEK6QvayUh3adc5UKZW1ZCiWA8Zqd9p+PYgBghBBAhuXPjGLhEtfKWoqR9cUbAlUP6s/WeRWIdpvc/P0tUzS/uj2meyxaqWViETee9mKRjWqIb+/QISnglEPuvuLiJzwTMh1oZTD/z6+MugIGbe8un9jWGdQqM7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767231085; c=relaxed/simple;
	bh=kD/0X7vKLTBz0/XmQVT00lrP//sFjh8elGmkK10Og8Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VE895Lh7cDCBm9gBijVCpueQXNeFROuQVCEuIV6qF3EQVM8ldLadgrpPDGWVEdaPpCvSyRzFDtRow7aBQRc2e29/tMbYbPbWKspaOxkwjQmvn3Lh+QX7wpOJHEjHm/kC6+WAFv2JEX6sRCyDVunT5JMTlZahKiar01/+Q/YmOqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JP9XOfg3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JP9XOfg3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767231083; x=1798767083;
  h=date:from:to:cc:subject:message-id;
  bh=kD/0X7vKLTBz0/XmQVT00lrP//sFjh8elGmkK10Og8Q=;
  b=JP9XOfg3byuRz0ElkzAKiT65kouwar2W86HyAruem94I6t+HreP9o6Cx
   1Ee5w10arnfsSp1dRu1ZoPpbFFLxOpNXwwV3ayHVI7ZD/0dMrtAcDcwt1
   /Je1BCz+s6L/czgo00U5A2PVkS7DjHl2N1PCgIerIYulMR7ZxbfVKclGj
   B9iU6Lwt4P7WHW5kJuBb5UBnElBRtdXkAw0+PANbRmVK9lsezKWZD1oeY
   Mu15yDDFLDCXQTCiuJuwisRTpsiLy0HC2TscRSaWOwlUgPGBvOkzWFZul
   z5YaFIaTSfOWyMogdOpxH0VZ2yJrIORN3e77xNYSOLDvkWDcgMXuKne6m
   Q==;
X-CSE-ConnectionGUID: Jne6okzkT3OgcmiouS1shA==
X-CSE-MsgGUID: jxDT/bdHSy6/k0uHia8cSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68724403"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68724403"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 17:31:23 -0800
X-CSE-ConnectionGUID: wUr5SM3/RCimib4oPnzmSg==
X-CSE-MsgGUID: BWAiCTiPQ8atJqCAPjCZ6w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Dec 2025 17:31:21 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb7X5-000000001aT-0nrs;
	Thu, 01 Jan 2026 01:31:19 +0000
Date: Thu, 01 Jan 2026 09:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>,
 Yuan Yao <yaoyuan0329os@gmail.com>
Subject: [sean-jc:slf/amx_xfd_non_init 4/5] Warning:
 arch/x86/kernel/fpu/core.c:332 function parameter 'gfpu' not described in
 'fpu_sync_guest_vmexit_xfd_state'
Message-ID: <202601010951.SmoY8Vq5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux slf/amx_xfd_non_init
head:   33fa9d8a2137bc45ef495066cac99a3fdc05ef28
commit: e3ab3b0cd9dfa94c6d7f2ce7abce7a24422a9931 [4/5] x86, fpu: separate fpstate->xfd and guest XFD
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260101/202601010951.SmoY8Vq5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010951.SmoY8Vq5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010951.SmoY8Vq5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/kernel/fpu/core.c:332 function parameter 'gfpu' not described in 'fpu_sync_guest_vmexit_xfd_state'
>> Warning: arch/x86/kernel/fpu/core.c:332 function parameter 'gfpu' not described in 'fpu_sync_guest_vmexit_xfd_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
