Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1368385D6E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 12:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405068; cv=none; b=JjCX7/X86vXtyrXiFUzG8Tjfp+NP4d08c9Pq0Betu2P94HfFk2pPS1Z3IKqCta/2+Exn+oFH+pj9JIgtqaN8aFyKu/ZgTuJ8K41rPMK/ub/PAoY7/QQGmD1zmG8GjKf9x2g3xETmDQtKUL7E5sRgV8VeetY2P8FgggGa5zdbZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405068; c=relaxed/simple;
	bh=TZLkrIFe2hK+qTL/fDz7dFhKNkZhRgn+nxCVSGs6EHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FB2eEqWA+qNrNlTa74+D/mTP1rfa5CR8lVcbNabruafhk2xrTqeLAwlK47jH5nTSp20mg35Lxwj+0vUbNs8cSGb798LUCjX3q5FUoNCjqiQyR2IPGNNb7moR6fPdKZA5phvaRDcasjs8+Cf9B53si1ucGFgPiKQqPXe/UQDMtbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUZWWLkU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUZWWLkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780405066; x=1811941066;
  h=date:from:to:cc:subject:message-id;
  bh=TZLkrIFe2hK+qTL/fDz7dFhKNkZhRgn+nxCVSGs6EHo=;
  b=LUZWWLkUcfIbngzaZK0/FXBoADZ2/dm3Jv9Be6skVMLz+QUrEWXbDfkN
   mevoL+Nnv4BcV5w5yAAONuwW+OLUxS/dOaA5QPYPyMJGITnU+6wwFNL0G
   YTV3YMvoYrT2oMUSQPfneuXtvv5n5fRljL3C0uEgL21n19G4yNMgRq9wj
   FnV3ey6n15AA+PbpI4E+9tBNw1ir71CwqcCXKp9aO3G0kYJACC9uKfHOX
   HdUdUJgL9gd4c5BE3zzTTd0+bTUBB1zzG236A1yq65GoIU/GO05QpIOGu
   mODCwejFneLMPbEXZUTh4+0kZlvjbwi/wSks3MrpsCaCjwDDtOH8vY9/G
   w==;
X-CSE-ConnectionGUID: /cR2xJv5QzeweM2d6VF9ew==
X-CSE-MsgGUID: uyihuKOjQYKyRldtl0k8bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98751331"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="98751331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 05:57:46 -0700
X-CSE-ConnectionGUID: xASDSQ4vT9uo7Wfr2KXCSQ==
X-CSE-MsgGUID: Jo1iNuhoTyKU/kGIb2PslQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="247856581"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jun 2026 05:57:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUOge-00000000C2r-3YPp;
	Tue, 02 Jun 2026 12:57:40 +0000
Date: Tue, 02 Jun 2026 20:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: Anuj Gupta <anuj20.g@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>,
 Kanchan Joshi <joshi.k@samsung.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Christoph Hellwig <hch@lst.de>
Subject: arch/arc/include/asm/uaccess.h:592:33: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202606022029.i60LMcVJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f3ed7fec72fc8979b2a8c7219c0a9fcfc8d07b5
commit: 9eb22f7fedfc9eb1b7f431a5359abd4d15b0b0cd fs: add ioctl to query metadata and protection info capabilities
date:   11 months ago
config: arc-randconfig-r113-20260602 (https://download.01.org/0day-ci/archive/20260602/202606022029.i60LMcVJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022029.i60LMcVJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9eb22f7fedfc ("fs: add ioctl to query metadata and protection info capabilities")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022029.i60LMcVJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-integrity.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
>> arch/arc/include/asm/uaccess.h:592:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char *d_char @@     got void [noderef] __user *to @@
   arch/arc/include/asm/uaccess.h:592:33: sparse:     expected unsigned char *d_char
   arch/arc/include/asm/uaccess.h:592:33: sparse:     got void [noderef] __user *to

vim +592 arch/arc/include/asm/uaccess.h

43697cb0973da1 Vineet Gupta 2013-01-18  588  
80bfe134f0306a Vineet Gupta 2021-08-13  589  static inline unsigned long __clear_user(void __user *to, unsigned long n)
43697cb0973da1 Vineet Gupta 2013-01-18  590  {
43697cb0973da1 Vineet Gupta 2013-01-18  591  	long res = n;
43697cb0973da1 Vineet Gupta 2013-01-18 @592  	unsigned char *d_char = to;
43697cb0973da1 Vineet Gupta 2013-01-18  593  
43697cb0973da1 Vineet Gupta 2013-01-18  594  	__asm__ __volatile__(
43697cb0973da1 Vineet Gupta 2013-01-18  595  	"	bbit0   %0, 0, 1f		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  596  	"75:	stb.ab  %2, [%0,1]		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  597  	"	sub %1, %1, 1			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  598  	"1:	bbit0   %0, 1, 2f		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  599  	"76:	stw.ab  %2, [%0,2]		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  600  	"	sub %1, %1, 2			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  601  	"2:	asr.f   lp_count, %1, 2		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  602  	"	lpnz    3f			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  603  	"77:	st.ab   %2, [%0,4]		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  604  	"	sub %1, %1, 4			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  605  	"3:	bbit0   %1, 1, 4f		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  606  	"78:	stw.ab  %2, [%0,2]		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  607  	"	sub %1, %1, 2			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  608  	"4:	bbit0   %1, 0, 5f		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  609  	"79:	stb.ab  %2, [%0,1]		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  610  	"	sub %1, %1, 1			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  611  	"5:					\n"
43697cb0973da1 Vineet Gupta 2013-01-18  612  	"	.section .fixup, \"ax\"		\n"
43697cb0973da1 Vineet Gupta 2013-01-18  613  	"	.align 4			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  614  	"3:	j   5b				\n"
43697cb0973da1 Vineet Gupta 2013-01-18  615  	"	.previous			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  616  	"	.section __ex_table, \"a\"	\n"
43697cb0973da1 Vineet Gupta 2013-01-18  617  	"	.align 4			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  618  	"	.word   75b, 3b			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  619  	"	.word   76b, 3b			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  620  	"	.word   77b, 3b			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  621  	"	.word   78b, 3b			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  622  	"	.word   79b, 3b			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  623  	"	.previous			\n"
43697cb0973da1 Vineet Gupta 2013-01-18  624  	: "+r"(d_char), "+r"(res)
43697cb0973da1 Vineet Gupta 2013-01-18  625  	: "i"(0)
d5e3c55e01d8b1 Vineet Gupta 2019-02-05  626  	: "lp_count", "memory");
43697cb0973da1 Vineet Gupta 2013-01-18  627  
43697cb0973da1 Vineet Gupta 2013-01-18  628  	return res;
43697cb0973da1 Vineet Gupta 2013-01-18  629  }
43697cb0973da1 Vineet Gupta 2013-01-18  630  

:::::: The code at line 592 was first introduced by commit
:::::: 43697cb0973da144156e7d11ddd035aee226ee30 ARC: uaccess friends

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
