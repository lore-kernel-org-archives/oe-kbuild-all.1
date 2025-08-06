Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2ED235063
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754518003; cv=none; b=fKWO+mPg26IX6sxR3lXvULK3AsdElFpo3beFczW1N1QgfhxJMNNDmImSORPwc3EkNaG3hpX2g0cL7OSjU8a+BjkT5Cz6lOfTqbqYfk0VCFRVK7ZqkTIqbEEDX5KcV5qAWjm7XX7gyl65crIoo7HNhkvWaKv+94dGvhGCzrQ8p+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754518003; c=relaxed/simple;
	bh=oaqukWOvjnqduMOZkaFZu0eoQBevzC+4PNgtMUvuSbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGETzJFA276yvbz5S2lTAw2/WqdBivyWQoy67TdPcGCq97SuOKFVAu4XXYqx6lhj9OJRUor3zjWoBtMQJtwcE6kn9MbhLQdpPMaFdc6d76XpWC9UOGFSzoMM/PxhR98ErCsxZNsETCYoJosGhPM/xQktmHpenY+FJztb1gVBnB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQVAn16S; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQVAn16S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754518002; x=1786054002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oaqukWOvjnqduMOZkaFZu0eoQBevzC+4PNgtMUvuSbE=;
  b=iQVAn16S26VuBWbopjcZS9ZTNaAKSnUORACO/xD5whGCZqixznlYfMs7
   9iiPafZ6OnbtqZNKyh49FdqjpuSp69nggK84AXm6pStjqAo1j2mXuOXbt
   QAbJgx0McL81uFzu2Cn0BCjvcn6GhxtApTI1uZGTffNPe2BT1uBzHf1A2
   4/B8Kg+uOE7XN+SYtHT8a3NJAB1cN9NPnmpJclTcQxLIyHMopDmAx+UNO
   CXdmr8s3rpiOmE9VFEi8z351Q4Xfqq8HzKbpAqLE6ODRP4JbjzTpxauVw
   OO12X0AploRI+ynskUNtfv0c7TfqnPRaagiZnSrmqSSRnQ1WZUF3kUgCp
   A==;
X-CSE-ConnectionGUID: DWglp4K7SI6QgC2XIybruA==
X-CSE-MsgGUID: 9X64VwoRROaFiwytdlmHow==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60478492"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60478492"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 15:06:41 -0700
X-CSE-ConnectionGUID: yYEBHRQKQNeIUKyQIAmMbg==
X-CSE-MsgGUID: 3iQbChD8R0ujUwgic2K68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170155989"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2025 15:06:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujmHN-00029E-0j;
	Wed, 06 Aug 2025 22:06:37 +0000
Date: Thu, 7 Aug 2025 06:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [sj:mm-new 39/45] arch/x86/include/asm/atomic.h:23: undefined
 reference to `kasan_flag_enabled'
Message-ID: <202508070658.s1RZB1Fd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git mm-new
head:   b2a4beca30ba51331a16d7bb84387a70b692a66d
commit: 825af80daf827d439c7dd3e24ef5648cc338bc98 [39/45] mm/kasan: make kasan=on|off take effect for all three modes
config: um-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070658.s1RZB1Fd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070658.s1RZB1Fd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070658.s1RZB1Fd-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: lib/stackdepot.o: in function `stack_depot_early_init':
   stackdepot.c:(.init.text+0x21f): undefined reference to `kasan_flag_enabled'
   /usr/bin/ld: mm/mempool.o: in function `remove_element':
>> arch/x86/include/asm/atomic.h:23: undefined reference to `kasan_flag_enabled'
   /usr/bin/ld: mm/mempool.o: in function `poison_element':
>> arch/x86/include/asm/atomic.h:23: undefined reference to `kasan_flag_enabled'
   collect2: error: ld returned 1 exit status


vim +23 arch/x86/include/asm/atomic.h

5abbbbf0b0cd4a Brian Gerst    2010-01-07  11  
5abbbbf0b0cd4a Brian Gerst    2010-01-07  12  /*
5abbbbf0b0cd4a Brian Gerst    2010-01-07  13   * Atomic operations that C can't guarantee us.  Useful for
5abbbbf0b0cd4a Brian Gerst    2010-01-07  14   * resource counting etc..
5abbbbf0b0cd4a Brian Gerst    2010-01-07  15   */
5abbbbf0b0cd4a Brian Gerst    2010-01-07  16  
8bf705d130396e Dmitry Vyukov  2018-01-29  17  static __always_inline int arch_atomic_read(const atomic_t *v)
5abbbbf0b0cd4a Brian Gerst    2010-01-07  18  {
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  19  	/*
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  20  	 * Note for KASAN: we deliberately don't use READ_ONCE_NOCHECK() here,
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  21  	 * it's non-inlined function that increases binary size and stack usage.
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  22  	 */
37f8173dd84936 Peter Zijlstra 2020-01-24 @23  	return __READ_ONCE((v)->counter);
5abbbbf0b0cd4a Brian Gerst    2010-01-07  24  }
5abbbbf0b0cd4a Brian Gerst    2010-01-07  25  

:::::: The code at line 23 was first introduced by commit
:::::: 37f8173dd84936ea78000ed1cad24f8b18d48ebb locking/atomics: Flip fallbacks and instrumentation

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
