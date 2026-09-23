Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82398485924
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 11:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164406; cv=none; b=ao9yGyKX7nLkpJt2nrM3n9KRE3AJfJY0dn2/wybyETWplDhWn05fQgKtNJlXxDZO5NHtD+IVj42Nxvq+CZEhlrAcOw09VcIf9+545jdfWcQruw5vCHYpHvC/MJH1UqdLADQ8CQCNbMfvSbOqU0Lyx6JxZUxLZRoOU57/T+FkouI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164406; c=relaxed/simple;
	bh=CoC0oEZ5xes023V7UhZW0cTF7bJnvpGbvkKhjlfB5Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iAqHSdzBees6/vy7LgsmW0AiIUt9gbOFR4GaDl/Q3LT1ySODsc8ZnzHPfjYUNGOEZcBI58g8MCLuh0WTRWQ5i+llx5sik83izWmu6iv3Xsq0QXQ0gU2cZBVlYJilc2uap1/UQQZduELU8NEYgIfPTlGhTlRSVHZ+qxz+cOi8V4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggAPYC61; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggAPYC61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790164395; x=1821700395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CoC0oEZ5xes023V7UhZW0cTF7bJnvpGbvkKhjlfB5Ns=;
  b=ggAPYC619crnEylvsdKtYwBiAvwhiepdXv52BikB73l9T0tKFCUCHau+
   xgrtcpkJVZMInZsnfaw8X5jtEd+RP9ltYCJdib3t43AxrwEKDhuI3RNmF
   YVmyTk+nlzTsPM692hBItNmCJCmZWpxhVtGAQiVW+XXiAd0piI7mzV7BZ
   mS+xa4nFG6AlOcw7KhtFcSolvFM6qu5+lU+qpvxnxQQQzqakQU6aI4tKp
   ogV2+Nux9DHE1odU9QrkYmasnPCRykW4ahxG5eTLusm3z7jn1556G4+mp
   EuwUQJgKUhcRzZYd94y4giFKicskuXb56t4zX562ECwsh4rTZrpO8lIpt
   Q==;
X-CSE-ConnectionGUID: 6cmqRbizSnaJZOFgE0e4wQ==
X-CSE-MsgGUID: bX94LosLQU2cymgdk9m7YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="116372437"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="116372437"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 04:53:11 -0700
X-CSE-ConnectionGUID: M+H3r649SFS/h9GpqY+kkw==
X-CSE-MsgGUID: iZEWFRAuSnmjwcuwXbntlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="301492200"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Sep 2026 04:53:09 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9LX9-000000000e3-1ZzY;
	Wed, 23 Sep 2026 11:53:07 +0000
Date: Wed, 23 Sep 2026 13:52:27 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-bonsai-clean 58/67]
 include/linux/extable.h:57:10: error: use of undeclared identifier 'ENODEV'
Message-ID: <202609231347.cy2zcAKu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-bonsai-clean
head:   1b386f2c853c6e84025fa93d485e69ba8c1d76f4
commit: 1004de649431d4488b747496cffa70b779e91550 [58/67] kernel/extable: Accelerate exception table search with Bonsai Tree
config: hexagon-randconfig-r2102-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231347.cy2zcAKu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231347.cy2zcAKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231347.cy2zcAKu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/module/main.c:11:
>> include/linux/extable.h:57:10: error: use of undeclared identifier 'ENODEV'
      57 |         return -ENODEV;
         |                 ^
   In file included from kernel/module/main.c:15:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/module/main.c:15:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/module/main.c:15:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/module/main.c:15:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/module/main.c:15:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/module/main.c:15:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/module/main.c:15:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/module/main.c:15:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \


vim +/ENODEV +57 include/linux/extable.h

    47	
    48	#if IS_ENABLED(CONFIG_TEST_BONSAI_TREE)
    49	int extable_export_bonsai_tree(struct bonsai_tree **bt,
    50				       const struct exception_table_entry **start,
    51				       size_t *count);
    52	#else
    53	static inline int extable_export_bonsai_tree(struct bonsai_tree **bt,
    54						     const struct exception_table_entry **start,
    55						     size_t *count)
    56	{
  > 57		return -ENODEV;
    58	}
    59	#endif
    60	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
