Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9EB54A7E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083011; cv=none; b=pnV6tcjrLowahPblaHQlwUjyQLPUCbkETimCKb/INm0QsBsmjQkjddc7c8GAJiOyQGPMDHfXx/AbXQEkiwHMubkRR4z/osIv9GBfsFJq+5eGfet2mEZLBemROuWlUsdXPWjOPMgOJ4Y2u5PNc90cg0lEqvDneQFPeh3BjESO52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083011; c=relaxed/simple;
	bh=WW/SxBr2ZzJ/DmmAAxAxR939dEaoZXKx+rAs7PAAeY4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lcOB/sVa00RTHCRROjP+qM0uUMrhjRoe863D3IcVku0fCK1a/MT/NsYa0Ci51yPugfOaCWdBxpQ80igaKBTfIAExD0OVDNmE9SOsif/Yqj47bdDOmTa+dKpQth1Cdh9tJLSSPDjwqhcqI3p252QupypiqIBnmDCZFO0bwPFN7+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEmGD9E5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEmGD9E5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792082996; x=1823618996;
  h=date:from:to:cc:subject:message-id;
  bh=WW/SxBr2ZzJ/DmmAAxAxR939dEaoZXKx+rAs7PAAeY4=;
  b=cEmGD9E53J7NIQW2JbwOL2ReIL8qPbdCT4YJQ1rTqBImt/ClOxksoHNI
   M9Nva0CHS1g/8u0ksOlXkXx2PMbryaYnURC+DqmhxhgkrHyaJ9GanLkJP
   GOXPIoBLZ5qtrwsBopeYvoR8a30wn7VnN6fmP6Sl9jDFBO8OuatZ65uKw
   OBMIZUJIUezrFfcRYtG3Jw3IwBd4zWir5CErpK8V9oisv+y1eRymcFVxm
   MVC6YdLm4je2C36jV/g4q3BIzRW93rO/vgf6VLgbpR20rK5uG0mQY5nlU
   MncwmjA9ec6W5jNhUlXHqGcndz0EnCvR1zkB3ww9SgXexVnR7Zo5j/IzN
   g==;
X-CSE-ConnectionGUID: 7LvTDc5JSwmcLyqUsHAVQw==
X-CSE-MsgGUID: UE2VUW5eRciqGrNmuAJxuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="747720"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="747720"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 09:49:55 -0700
X-CSE-ConnectionGUID: Xa/3yrWZQkeFipKGX2OvIg==
X-CSE-MsgGUID: HrLGWCF0Qia71LpAasxTEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1751061"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2026 09:49:52 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHOeM-00000000BmJ-2ANf;
	Thu, 15 Oct 2026 16:49:50 +0000
Date: Thu, 15 Oct 2026 18:49:49 +0200
From: kernel test robot <lkp@intel.com>
To: Bill Wendling <morbo@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [linux-next:master 14937/17613]
 include/linux/seq_buf.h:68:22: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202610151829.prwKNQKm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d419d682257d813f6cb7a28e42b35d0edf4ad038
commit: 61ef3f1490f879ddffe39a8f1a1bf1ae1e60fc23 [14937/17613] seq_buf: Add seq_buf_init_append()
config: m68k-randconfig-r2302-20261015 (https://download.01.org/0day-ci/archive/20261015/202610151829.prwKNQKm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151829.prwKNQKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151829.prwKNQKm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/tests/seq_buf_kunit.c: note: in included file:
>> include/linux/seq_buf.h:68:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   lib/tests/seq_buf_kunit.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, include/linux/smp.h, ...):
   arch/m68k/include/asm/string.h:21:21: sparse: signed value source

vim +68 include/linux/seq_buf.h

3a161d99c43ce7 Steven Rostedt (Red Hat  2014-06-25  58) 
505a4aeea2c98a Kees Cook                2026-10-05  59  /*
505a4aeea2c98a Kees Cook                2026-10-05  60   * Mark @s as overflowed, which discards the length of what it holds. The
505a4aeea2c98a Kees Cook                2026-10-05  61   * bytes up to its last one are the string from then on, as that is where
ea5666e56723e9 Kees Cook                2026-10-05  62   * seq_buf_str() terminates it, so clear whatever was not written: a writer
ea5666e56723e9 Kees Cook                2026-10-05  63   * sets len to how much it filled, and anything past that was never adopted.
505a4aeea2c98a Kees Cook                2026-10-05  64   */
3a161d99c43ce7 Steven Rostedt (Red Hat  2014-06-25  65) static inline void
3a161d99c43ce7 Steven Rostedt (Red Hat  2014-06-25  66) seq_buf_set_overflow(struct seq_buf *s)
3a161d99c43ce7 Steven Rostedt (Red Hat  2014-06-25  67) {
ea5666e56723e9 Kees Cook                2026-10-05 @68  	if (s->len < s->size)
ea5666e56723e9 Kees Cook                2026-10-05  69  		memset(s->buffer + s->len, 0, s->size - s->len);
ea5666e56723e9 Kees Cook                2026-10-05  70  
8cd709ae7658a7 Steven Rostedt (Red Hat  2014-10-29  71) 	s->len = s->size + 1;
3a161d99c43ce7 Steven Rostedt (Red Hat  2014-06-25  72) }
3a161d99c43ce7 Steven Rostedt (Red Hat  2014-06-25  73) 

:::::: The code at line 68 was first introduced by commit
:::::: ea5666e56723e9ac7094ff9849cf154dcb0e436e seq_buf: Clear what a writer did not claim when a seq_buf overflows

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Kees Cook <kees@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
