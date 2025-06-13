Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022931FCCEB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833761; cv=none; b=kB0PFmsZBp0o46Slr6o2wRDjfmwszqgoYUvPBIPrsjaz3qu3YkJwqIHfRpLfShGw4PwMMea1+UUlSIHsg/ygcXNwnQ1d10KYPk1VirOYdSf8Y4rLh2/qOmNlTAVvWmFV1nHdy733yccnDA5YvEhhIjlhXCkMomTNX+IUutBYAJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833761; c=relaxed/simple;
	bh=TV6ev59m7+zuQ0/kTzNAgLsoo00SwKHe0vrBGvEHqo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8pOX+OERFg2lpjjOQNA6E2u7KjhyH/G1Ob7bBsb3W8yIUaytivbkcxu+FJna3g392xVK7bwgUmYVR8UNOhKH94+qNR9BZPeRKPHjfaQiTegXrWBTIPmRyT4oIiclLHvg/jhuTrRoOIz8O7SMbdPh5P4vZ0965fXyO6avKUZzB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDY6zamJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDY6zamJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749833759; x=1781369759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TV6ev59m7+zuQ0/kTzNAgLsoo00SwKHe0vrBGvEHqo0=;
  b=cDY6zamJ2HLd/EPvj0lvvGQ4YuBSJccxb+X5CQ9nshy+U2vrw74XToaa
   Rq44oDi9vTwUeLX6SilUagEahq0utg/LYJu0/GSsOOCpm5ubHUfAjuRju
   IbLxDEGPovO5sD4Ts+ku1bEsiE1a/gTJyBEwcu+RbyCxUxgLnniYvXjx7
   jdou23AMlhJnREAEvC8M01+J20mr13SO9B0rp+PPCoIAQ+zu+KAB7WDoQ
   DLtX/i5UGu3dduTrDqbVBbstT1UyS+M4Q1ulZWLMefRpy4N0t/0RHPYxc
   n+/TmCo7HfEQ3awUX4kbXXbJwJcOX8h81bMtJ0tex3iwn97XA42K5wvwE
   w==;
X-CSE-ConnectionGUID: UAR+5IyATbquzGDuHkxq9w==
X-CSE-MsgGUID: BeE/nhK5QgKqPiUnHvzg0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51973010"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="51973010"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 09:55:58 -0700
X-CSE-ConnectionGUID: 9MxQVbL5RRqiYICGbHuKaQ==
X-CSE-MsgGUID: vUpEGydZRX6sHfj0UefKOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="148764661"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jun 2025 09:55:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ7h4-000Cq8-2p;
	Fri, 13 Jun 2025 16:55:54 +0000
Date: Sat, 14 Jun 2025 00:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:libcrypto-pending 17/17]
 arch/alpha/include/asm/irqflags.h:35:9: error: implicit declaration of
 function 'barrier'
Message-ID: <202506140001.CtqYqDPn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-pending
head:   22b6c41dda32d4e2394c18802f779d808ba61c3a
commit: 22b6c41dda32d4e2394c18802f779d808ba61c3a [17/17] lib/crypto: explicitly include <linux/export.h>
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250614/202506140001.CtqYqDPn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140001.CtqYqDPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140001.CtqYqDPn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crypto/aescfb.c:8:
   arch/alpha/include/asm/irqflags.h: In function 'arch_local_irq_disable':
>> arch/alpha/include/asm/irqflags.h:35:9: error: implicit declaration of function 'barrier' [-Wimplicit-function-declaration]
      35 |         barrier();
         |         ^~~~~~~
   arch/alpha/include/asm/irqflags.h: At top level:
>> arch/alpha/include/asm/irqflags.h:58:15: error: unknown type name 'bool'
      58 | static inline bool arch_irqs_disabled_flags(unsigned long flags)
         |               ^~~~
   arch/alpha/include/asm/irqflags.h:6:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
       5 | #include <asm/pal.h>
     +++ |+#include <stdbool.h>
       6 | 
   arch/alpha/include/asm/irqflags.h:63:15: error: unknown type name 'bool'
      63 | static inline bool arch_irqs_disabled(void)
         |               ^~~~
   arch/alpha/include/asm/irqflags.h:63:15: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'


vim +/barrier +35 arch/alpha/include/asm/irqflags.h

df9ee29270c11d David Howells 2010-10-07  31  
df9ee29270c11d David Howells 2010-10-07  32  static inline void arch_local_irq_disable(void)
df9ee29270c11d David Howells 2010-10-07  33  {
df9ee29270c11d David Howells 2010-10-07  34  	setipl(IPL_MAX);
df9ee29270c11d David Howells 2010-10-07 @35  	barrier();
df9ee29270c11d David Howells 2010-10-07  36  }
df9ee29270c11d David Howells 2010-10-07  37  
df9ee29270c11d David Howells 2010-10-07  38  static inline unsigned long arch_local_irq_save(void)
df9ee29270c11d David Howells 2010-10-07  39  {
df9ee29270c11d David Howells 2010-10-07  40  	unsigned long flags = swpipl(IPL_MAX);
df9ee29270c11d David Howells 2010-10-07  41  	barrier();
df9ee29270c11d David Howells 2010-10-07  42  	return flags;
df9ee29270c11d David Howells 2010-10-07  43  }
df9ee29270c11d David Howells 2010-10-07  44  
df9ee29270c11d David Howells 2010-10-07  45  static inline void arch_local_irq_enable(void)
df9ee29270c11d David Howells 2010-10-07  46  {
df9ee29270c11d David Howells 2010-10-07  47  	barrier();
df9ee29270c11d David Howells 2010-10-07  48  	setipl(IPL_MIN);
df9ee29270c11d David Howells 2010-10-07  49  }
df9ee29270c11d David Howells 2010-10-07  50  
df9ee29270c11d David Howells 2010-10-07  51  static inline void arch_local_irq_restore(unsigned long flags)
df9ee29270c11d David Howells 2010-10-07  52  {
df9ee29270c11d David Howells 2010-10-07  53  	barrier();
df9ee29270c11d David Howells 2010-10-07  54  	setipl(flags);
df9ee29270c11d David Howells 2010-10-07  55  	barrier();
df9ee29270c11d David Howells 2010-10-07  56  }
df9ee29270c11d David Howells 2010-10-07  57  
df9ee29270c11d David Howells 2010-10-07 @58  static inline bool arch_irqs_disabled_flags(unsigned long flags)
df9ee29270c11d David Howells 2010-10-07  59  {
df9ee29270c11d David Howells 2010-10-07  60  	return flags == IPL_MAX;
df9ee29270c11d David Howells 2010-10-07  61  }
df9ee29270c11d David Howells 2010-10-07  62  

:::::: The code at line 35 was first introduced by commit
:::::: df9ee29270c11dba7d0fe0b83ce47a4d8e8d2101 Fix IRQ flag handling naming

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
