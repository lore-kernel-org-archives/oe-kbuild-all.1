Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2730BF78
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766035484; cv=none; b=pQB/R/Gvf1kLqoLLX4cM2jX7b1UMrZk/3WO17te70ShVu+X7JS4jNkC0BIsa+wndIm1WOKEapQcYd3a1HEFRBTbzePv9bQSF7Ast2IBRdCl0cTVN43yI1BW0pzlKZz7CS1OxWJLRnPax9/m273tcH0Hr2TAMg3jxJaw4NIPRiHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766035484; c=relaxed/simple;
	bh=OyAXGl+vCyFvyd6g76wouHqeDyDiAZgSA6HzjTprpic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oPV0s5OcK7+FHhBdQgWZ8hmlJa0f8irG1/EEag3PiJ6nwSzn+JqO4Ee2UkNHaadLIHYN/Rlb5uPkdk/uBJ2of/QMVHxJNERAEk7gqMNXzDawl/6v28skfkfQJfN0Dbsb1JPH9oAeFMcGCINdKa4MV4owP8ZPNbOnzwfnbUb/GeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLrkKSWN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLrkKSWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766035482; x=1797571482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OyAXGl+vCyFvyd6g76wouHqeDyDiAZgSA6HzjTprpic=;
  b=VLrkKSWNNLfnOc5Ria81wV55aT59UYvMq4RFCN+2MZNnmyv71y4KVn/+
   BxpNYjXBLxE47hoRanodPxmoDoQ6InL3/GhmloXVuFpPiWtCG66Gyxia+
   HD+VHKzoVzj4hjvIOU5R/QJ7TV32vP5dmp6swq1PrI/qa9W6dLURINLgK
   BMXxgGA6dgbJC0O4ySTBZXk3gnRYuNqqbO2Sn2hYpf44kQ/Zdczngx4vv
   RtL9yjQ7JOEQgDhesIzj/GSQygjIyiG048GbG4rXPNHYh2KoyQV7HWVGl
   KwgGk3Kjv+VD9euAEX05fPtipkxHlOk6fybLWlAJRmlAB2dQTTqGA4gd4
   w==;
X-CSE-ConnectionGUID: 7/AS9JvoRQ+3Jr1VmKtkVQ==
X-CSE-MsgGUID: APw8LfWYTx6ILWjfEgCrjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="70560508"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="70560508"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:24:38 -0800
X-CSE-ConnectionGUID: BcTAIWFBT7S0L4Err9HI5A==
X-CSE-MsgGUID: 5E4U0rBCQCagYbjdxYmDVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="203005065"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2025 21:24:37 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW6V8-000000001d3-25qc;
	Thu, 18 Dec 2025 05:24:34 +0000
Date: Thu, 18 Dec 2025 13:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:perf/core 22/22] include/linux/kvm_types.h:9:10: fatal error:
 asm/kvm_types.h: No such file or directory
Message-ID: <202512181326.hyPrIzxf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
head:   23faa33d88df6d126cebd3121ea2cff3586e7b95
commit: 23faa33d88df6d126cebd3121ea2cff3586e7b95 [22/22] perf: Use EXPORT_SYMBOL_FOR_KVM() for the mediated APIs
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20251218/202512181326.hyPrIzxf-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181326.hyPrIzxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181326.hyPrIzxf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/events/core.c:60:
>> include/linux/kvm_types.h:9:10: fatal error: asm/kvm_types.h: No such file or directory
       9 | #include <asm/kvm_types.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 include/linux/kvm_types.h

d77a39d982431e drivers/kvm/types.h       Hollis Blanchard    2007-12-03   5  
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18   6  #include <linux/bits.h>
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18   7  #include <linux/export.h>
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18   8  #include <linux/types.h>
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18  @9  #include <asm/kvm_types.h>
20c48920583675 include/linux/kvm_types.h Sean Christopherson 2025-09-18  10  

:::::: The code at line 9 was first introduced by commit
:::::: 20c48920583675e67b3824f147726e0fbda735ce KVM: Export KVM-internal symbols for sub-modules only

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
