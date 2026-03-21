Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B1640DFB2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 01:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774055127; cv=none; b=g1yaS+p+Sjrw0cXad9qDfXt0WuZ0CYeTfjsrXbiDQ6Dq/e8XVm61tte3+gkJxLSTq7OCWEqq+rs686pZU1RKRKJlWoMcXEKcA+t5EUR0p3SuRO3ZJNoJVtQyeAnzRd5AWV1g2GGweUUMMfm6J+q+PSk+aZRJeRX9mkTRg7DA1pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774055127; c=relaxed/simple;
	bh=cHtHByYLbK4uJHsn3FhqqBWcZD21mdYzHFIC+XYyjHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LMaIAiubGvKE8CEKL2l+G4PCGbTg8Dq6k5hrmRPtqFfc0s6Fj3e6ejsdyv240OXR1+zwkoMpBSFGqIa1daKU1/IMDMxMM5rtoD8K6pb/aHoSnvpXL1fTcrBPtEwy3FML9Yi1vcYpRKjEOrwD3q2WBp2Qv0pQcjVvfXGekAiA1RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fxi+laMv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fxi+laMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774055125; x=1805591125;
  h=date:from:to:cc:subject:message-id;
  bh=cHtHByYLbK4uJHsn3FhqqBWcZD21mdYzHFIC+XYyjHQ=;
  b=Fxi+laMv09qALE2swMESKOQQLNFLdpNLSuCFRbKUyEfTU3A1lSJmM9nY
   VeLoCCDpX7RZdLFAIXpy+LynT2neV3J2UjTQxBhd2VsfhFU3VdfJra7T4
   3TX3THTNCzU7S7ntY+b3zrKejJmPhI61J4YvvBN9w3akRbOa8ONrywNtc
   cpVFe3/7HGQvbk5qucWUGXo2DDnrN1a7f6boNjg/VIQyta/ees5zMVk/y
   fbDKyjsv5eSEo8g1EPSohPe9FfaxCVltYFuvHq1euR7MvYQPyhC2+sQzr
   e/6rePhB/rwD6lkIZIietD9BJJm3jxq4q6K0gtqcuEP5R+PQAefZCZGn+
   A==;
X-CSE-ConnectionGUID: KAJGTDXaRt6X4rSyANaRpA==
X-CSE-MsgGUID: S5q3cuq2S7SZcAId51vujQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86510520"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="86510520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 18:05:25 -0700
X-CSE-ConnectionGUID: UZX/goYIRWmPqa7GTHjYzA==
X-CSE-MsgGUID: RNiUx1ucTISY1X8seVGGvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="227927843"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Mar 2026 18:05:24 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3kmB-00000000081-3LoG;
	Sat, 21 Mar 2026 01:05:16 +0000
Date: Sat, 21 Mar 2026 09:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 33/33] lib/raid/raid6/x86/mmx.c:29:16:
 error: implicit declaration of function 'boot_cpu_has'
Message-ID: <202603210842.J1XbiCCW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   83a13a72f6f47b7ba7d26a200575edb70bf23c70
commit: 83a13a72f6f47b7ba7d26a200575edb70bf23c70 [33/33] raid6: hide internals
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260321/202603210842.J1XbiCCW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210842.J1XbiCCW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603210842.J1XbiCCW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   lib/raid/raid6/x86/mmx.c: In function 'raid6_have_mmx':
>> lib/raid/raid6/x86/mmx.c:29:16: error: implicit declaration of function 'boot_cpu_has' [-Wimplicit-function-declaration]
      29 |         return boot_cpu_has(X86_FEATURE_MMX);
         |                ^~~~~~~~~~~~
>> lib/raid/raid6/x86/mmx.c:29:29: error: 'X86_FEATURE_MMX' undeclared (first use in this function); did you mean 'XFEATURE_MAX'?
      29 |         return boot_cpu_has(X86_FEATURE_MMX);
         |                             ^~~~~~~~~~~~~~~
         |                             XFEATURE_MAX
   lib/raid/raid6/x86/mmx.c:29:29: note: each undeclared identifier is reported only once for each function it appears in
>> lib/raid/raid6/x86/mmx.c:30:1: warning: control reaches end of non-void function [-Wreturn-type]
      30 | }
         | ^
--
   lib/raid/raid6/x86/sse1.c: In function 'raid6_have_sse1_or_mmxext':
>> lib/raid/raid6/x86/sse1.c:32:16: error: implicit declaration of function 'boot_cpu_has' [-Wimplicit-function-declaration]
      32 |         return boot_cpu_has(X86_FEATURE_MMX) &&
         |                ^~~~~~~~~~~~
>> lib/raid/raid6/x86/sse1.c:32:29: error: 'X86_FEATURE_MMX' undeclared (first use in this function); did you mean 'XFEATURE_MAX'?
      32 |         return boot_cpu_has(X86_FEATURE_MMX) &&
         |                             ^~~~~~~~~~~~~~~
         |                             XFEATURE_MAX
   lib/raid/raid6/x86/sse1.c:32:29: note: each undeclared identifier is reported only once for each function it appears in
>> lib/raid/raid6/x86/sse1.c:33:31: error: 'X86_FEATURE_XMM' undeclared (first use in this function); did you mean 'XFEATURE_YMM'?
      33 |                 (boot_cpu_has(X86_FEATURE_XMM) ||
         |                               ^~~~~~~~~~~~~~~
         |                               XFEATURE_YMM
>> lib/raid/raid6/x86/sse1.c:34:31: error: 'X86_FEATURE_MMXEXT' undeclared (first use in this function)
      34 |                  boot_cpu_has(X86_FEATURE_MMXEXT));
         |                               ^~~~~~~~~~~~~~~~~~
>> lib/raid/raid6/x86/sse1.c:35:1: warning: control reaches end of non-void function [-Wreturn-type]
      35 | }
         | ^


vim +/boot_cpu_has +29 lib/raid/raid6/x86/mmx.c

^1da177e4c3f41 drivers/md/raid6mmx.c Linus Torvalds 2005-04-16  25  
^1da177e4c3f41 drivers/md/raid6mmx.c Linus Torvalds 2005-04-16  26  static int raid6_have_mmx(void)
^1da177e4c3f41 drivers/md/raid6mmx.c Linus Torvalds 2005-04-16  27  {
^1da177e4c3f41 drivers/md/raid6mmx.c Linus Torvalds 2005-04-16  28  	/* Not really "boot_cpu" but "all_cpus" */
^1da177e4c3f41 drivers/md/raid6mmx.c Linus Torvalds 2005-04-16 @29  	return boot_cpu_has(X86_FEATURE_MMX);
^1da177e4c3f41 drivers/md/raid6mmx.c Linus Torvalds 2005-04-16 @30  }
^1da177e4c3f41 drivers/md/raid6mmx.c Linus Torvalds 2005-04-16  31  

:::::: The code at line 29 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
