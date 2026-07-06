Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD432E121
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 02:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783306218; cv=none; b=WOZskp88IUNynWmQ014yJEykC9ZQl4/p+gDAsyvuBVkm4i0ln0GmEtX2Y9hpA3PErbwZsKw8xLw3mZSSyWY6GhM9nGJjSrvuWrt4iXCHCYZ5ELBormYEMoEdQ2nVnGa8wfx9ghWCpbDkEP1q/OUeXg5MsWnIhMika1k8J9A9QWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783306218; c=relaxed/simple;
	bh=gMkPTGnLOT/YNq1bXVCf/pFQCDL8kzDi+M5DfpY9JOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TvZa4SFDa3CKbPBHqpJlw3oCvcnAK8ZeciSuwKMQDFA1bFq+kAHOk3dW5pi45GkE0vxTKOJZnoyyTmWQAaQjzlm0IwmA8SDZ1FEhqnytzOMoI6DU7F+SCiCLBxsbEX7OpcWlgmyYLOzL+/5ZBJdLKEWpjRIk0/qOnwaCETe7QIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3oNWiTR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3oNWiTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783306216; x=1814842216;
  h=date:from:to:cc:subject:message-id;
  bh=gMkPTGnLOT/YNq1bXVCf/pFQCDL8kzDi+M5DfpY9JOg=;
  b=k3oNWiTRAwCeRjva1aEj0/5SRK5rbbAJ4PEV2vv3nGWZb7lUOXrYKYJ1
   wgDqfZe6MTn06OtSoy5UoSfjJUPsJsapuAWVSrYrN2sEwYREG/IughCWe
   1nFBkJRaQ/nzn2Pr/tPSMd9vZKYJcmeXAnY0Vb+P8mEqu9nQdW3KQb8LU
   gP4li/2/ENanY+VIV4yBpkhb0RGk8e/b///ddFKlaC0KjnCOwyabNLLcZ
   6zJ26INb2g9cKp2NgcpkZ1tzLip6WI4ZkRN9f+mx21G8uFuOuG/FfHI7l
   k0kZ0s54lLO5USM0zJLjcv3rqmQoPLJlcpmxQeZu+5IOzDuRSgHnKDZRY
   g==;
X-CSE-ConnectionGUID: U1Guov1bSDmnYGvd/rLr/g==
X-CSE-MsgGUID: akw/sXMsRJ2kcAiDpC6vRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95310679"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95310679"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 19:50:16 -0700
X-CSE-ConnectionGUID: jM2mH5GjTMCrn2vVCbaBBQ==
X-CSE-MsgGUID: FUoh6sFISzS1eJxxRBGQDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="250920886"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jul 2026 19:50:14 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgZPQ-0000000024v-2QCu;
	Mon, 06 Jul 2026 02:50:12 +0000
Date: Mon, 06 Jul 2026 04:49:31 +0200
From: kernel test robot <lkp@intel.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/printk/printk.c:2131:14: error: conflicting types for
 'printk_delay_msec'; have 'unsigned int'
Message-ID: <202607060458.o2DoPl4f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andrew-Murray/printk-remove-BOOT_PRINTK_DELAY-config-option/20260701-004359
head:   77bdeadc30ea25978d2e590405710ebc1c3ceee8
commit: 9723ebd13ec9e050081c95baace694bdea02bbae printk: deprecate boot_delay in favour of printk_delay
date:   5 days ago
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260706/202607060458.o2DoPl4f-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607060458.o2DoPl4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607060458.o2DoPl4f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/printk/printk.c:2131:14: error: conflicting types for 'printk_delay_msec'; have 'unsigned int'
    2131 | unsigned int printk_delay_msec __read_mostly;
         |              ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from kernel/printk/printk.c:22:
   include/linux/printk.h:191:12: note: previous declaration of 'printk_delay_msec' with type 'int'
     191 | extern int printk_delay_msec;
         |            ^~~~~~~~~~~~~~~~~


vim +2131 kernel/printk/printk.c

  2122	
  2123	/* Exit recursion tracking, restoring interrupts. */
  2124	#define printk_exit_irqrestore(recursion_ptr, flags)	\
  2125		do {						\
  2126			typecheck(u8 *, recursion_ptr);		\
  2127			(*(recursion_ptr))--;			\
  2128			local_irq_restore(flags);		\
  2129		} while (0)
  2130	
> 2131	unsigned int printk_delay_msec __read_mostly;
  2132	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
