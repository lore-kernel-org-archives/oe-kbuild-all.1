Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E617DE36
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730226567; cv=none; b=YJtG0gYNZAKICCtApdG4TMfMQo9UDcFYXJbNbsq7ZTXdLtDslgYprosMsrIgUwoSrxPQJ5cSpoCEGY5DZQhnmY2LFKftWlOWTrYepj1zGOpwT7L07tTxWE4HNrMGVs5jYRV2YHrN0tIb8aghYnGiI87OXRRIJw/WIIN4/5cVVLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730226567; c=relaxed/simple;
	bh=sSSshpr6f4oz9sKO/vGT3UMDTkdc57ZYkgyXeC1AViQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gc38zBK9jQHs7A2nGiyAO3drYhkz+Hdi+HlSaunx/Nf0pBsSb0Uds2N6rIaS2sJh5Wm9yowHn4BXtKNtj79wPcWqrXd2QCf0dwIJ+j7H4iIyRXnCkP472E6bGctVvauQitHxf/k4uCccwwbaUyitSx7tWWSlhyRVnR8NqR7yLbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMv9KLPR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMv9KLPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730226565; x=1761762565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sSSshpr6f4oz9sKO/vGT3UMDTkdc57ZYkgyXeC1AViQ=;
  b=eMv9KLPRFzW5xuphALGo5m/LP+4vIVEqsWYKKHdxpKnBAEEyG050etjR
   jBPx39gKfT7i0+QhWJDYovdzc74PR7KtZkEpJV79ferzKg0qVp08KfUsL
   UoSNOo/ZVeEPM/LJLZJQaqpNGpDyqQUOm7S/RdPe3yhQtVlHYSBvJ9dXL
   49XV7mnWI1pe/Fhh8kV2qYMQk9G3JoLADVZIjtnvVFq0QIE9YvU2YCDVo
   9cd8JwkUqT+QTDZgHnQTfLwJVW43+rMuMMV8Qt+RZMXTdMtkNgnCGJ8to
   3nalEe6CZ2nB4QCZty+OHsNvB9XJA/tQG69TOJzBYFogL/TdR90o/UBtP
   w==;
X-CSE-ConnectionGUID: D8GQNKDWRP+GTve28+J9vQ==
X-CSE-MsgGUID: jppKTR63SFWzTDLcmgwd0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17525367"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="17525367"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 11:29:24 -0700
X-CSE-ConnectionGUID: ScmSLTR/SsuuGnbAEAWwQg==
X-CSE-MsgGUID: oof9AStxQ+ipAQSB9J0wnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="86605480"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2024 11:29:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5qxy-000dzE-01;
	Tue, 29 Oct 2024 18:29:18 +0000
Date: Wed, 30 Oct 2024 02:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 7/68] ld.lld: error:
 duplicate symbol: kvm_arch_reclaim_device
Message-ID: <202410300255.jAwdmrab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   0db30a10b0076364f5db3533414a8aea94f662d6
commit: 6f86b0b0d35ef8ed8a18b9012d5c4909c90dc50f [7/68] ANDROID: KVM: Add arch function for device assignment
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241030/202410300255.jAwdmrab-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300255.jAwdmrab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300255.jAwdmrab-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_device
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_device)
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/posted_intr.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_group
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_group)
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/posted_intr.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_device
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_device)
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/nested.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_group
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_group)
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/nested.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_device
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_device)
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/hyperv.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_group
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_group)
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/hyperv.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_device
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_device)
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/vmcs12.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_group
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_group)
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/vmcs12.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_device
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_device)
   >>> defined at kvm_host.h:1576 (include/linux/kvm_host.h:1576)
   >>>            arch/x86/kvm/vmx/pmu_intel.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: kvm_arch_reclaim_group
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/vmx.o:(kvm_arch_reclaim_group)
   >>> defined at kvm_host.h:1580 (include/linux/kvm_host.h:1580)
   >>>            arch/x86/kvm/vmx/pmu_intel.o:(.text+0x10)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
