Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1D52C1594
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 02:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783822535; cv=none; b=man4dBHvM5O9Y0+C1UmMT2qc61l9LSP6NDaf0vyC+C99MAxokQHedUSlyXYOasRDnHVsbdYwGdcI5hoWbNGhiq2r0kCNWstIhn7+c5MqxkqSymhdhBAku0UZV6Lowd3XQ0NvrTOw4OPGj2bqLiZ3Hgot6gsaX3XGNUMnY6jW5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783822535; c=relaxed/simple;
	bh=2vwe1nfKqxMB/ov/j86LZCX94zrcMEJ3Pnrq3K1fKVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XnPLfd+egnO/lMF4+LGnkbH3bizPOetuavUROqEY+V4ZwLfX/O+lOPl8H+Uowkqtk0T3iw2o6dkzvclcdQCebBEKpi//s23S1GOWFTq6lUd8JYT3e65Smfa/mOXgLLKpoW3lT8A5d+pJpyPD0igPFDpKqIoeGK4e9xSGPsuSoH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nndpJlvW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nndpJlvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783822533; x=1815358533;
  h=date:from:to:cc:subject:message-id;
  bh=2vwe1nfKqxMB/ov/j86LZCX94zrcMEJ3Pnrq3K1fKVk=;
  b=nndpJlvWx1Wr5A5RO6jnOYXNR/KWzGXkuGRmSVynyekPFrm3xYFDy1Fa
   5a32NUGsXK9Ni4wriVjkSqpr9i6yWHS8BhwpMK36x0ylQUA64u77fZpXi
   kZbVdTOB3NmrmkEiYh8guPd1ZKzslS2/O8rymZjVRk/MrIkGqhuzE+dTq
   KhSCZ+KmUk0P1rrGRoBfnNGY1MYd03dl6NHvN6OkpmrqDFQfMZsxIU937
   /vMwHFeZa1Ta7gQmSkspfNPahnx5YnJ9+ZXafvfXODJAgktL0+r533uZu
   YY3ozwYbvKMLh4QLFnwJK+avGC9cckSwN+vbQpn1heIgjuRlRXxlf22si
   A==;
X-CSE-ConnectionGUID: eimjvY4XSD+QaUmal2evdQ==
X-CSE-MsgGUID: tDjfqhALQqS0RMSZONFHhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95080450"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95080450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 19:15:32 -0700
X-CSE-ConnectionGUID: eyERhQk1ScCQ0svnzoWzIQ==
X-CSE-MsgGUID: RQw3gpWLQ7iU4mbVl1ufMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259529850"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Jul 2026 19:15:31 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wijj7-000000003Tp-1nf5;
	Sun, 12 Jul 2026 02:15:29 +0000
Date: Sun, 12 Jul 2026 04:14:54 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 58/59]
 arch/x86/kernel/apic/hw_nmi.c:29:22: error: 'cpu_khz' undeclared
Message-ID: <202607120457.zi1948jw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 27019f00127af90a16c3b8c54e976cdc8a711b0a [58/59] x86: Select ARCH_HAS_RANDOM_ENTROPY
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260712/202607120457.zi1948jw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120457.zi1948jw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120457.zi1948jw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/apic/hw_nmi.c: In function 'hw_nmi_get_sample_period':
>> arch/x86/kernel/apic/hw_nmi.c:29:22: error: 'cpu_khz' undeclared (first use in this function)
      29 |         return (u64)(cpu_khz) * 1000 * watchdog_thresh;
         |                      ^~~~~~~
   arch/x86/kernel/apic/hw_nmi.c:29:22: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/apic/hw_nmi.c:30:1: warning: control reaches end of non-void function [-Wreturn-type]
      30 | }
         | ^


vim +/cpu_khz +29 arch/x86/kernel/apic/hw_nmi.c

28b8235238fa39 Dave Hansen          2023-08-09  25  
05a4a95279311c Nicholas Piggin      2017-07-12  26  #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
4eec42f3920430 Mandeep Singh Baines 2011-05-22  27  u64 hw_nmi_get_sample_period(int watchdog_thresh)
504d7cf10ee42b Don Zickus           2010-02-12  28  {
4eec42f3920430 Mandeep Singh Baines 2011-05-22 @29  	return (u64)(cpu_khz) * 1000 * watchdog_thresh;
504d7cf10ee42b Don Zickus           2010-02-12  30  }
5f2b0ba4d94b3a Don Zickus           2010-11-12  31  #endif
504d7cf10ee42b Don Zickus           2010-02-12  32  

:::::: The code at line 29 was first introduced by commit
:::::: 4eec42f392043063d0f019640b4ccc2a45570002 watchdog: Change the default timeout and configure nmi watchdog period based on watchdog_thresh

:::::: TO: Mandeep Singh Baines <msb@chromium.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
