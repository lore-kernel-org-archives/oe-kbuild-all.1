Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969030BF70
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007808; cv=none; b=jPNunuw/0mZo3D6hZFwMG6HR77VbIWAI1LmPfComSeRjNkx4TqUmt252++JKghidtiSA9qN+aApU4u49p3ZzwFFbkzJTTBoMGRQNBNWOfQj79wdxHQ9cvmVyrjWRvr9y0fCk8ZfNBOkX/G5Z5EE2iDmGx+RSnrokIIlqMhODHMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007808; c=relaxed/simple;
	bh=IpJaM5ZWWGVXATm0MaDjNTCRL4vEKeMR4sxhUqfP2yI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GiC7MFHreIdzR0VlQcMZksFg3xgdJu+NpafyrKG/q4x5dtPMtiCpq15KcufV7/AnfrbPHnt2k/20ifRjrVoDafaJuUkGm+3nQDK8NgYudUpm3qJr92XiYPPO8rIzfbU83qcE9OXGEnFCG9HElt6xaPlrO8LkGicCwoMx9NAJ9vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrdZ1IxL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrdZ1IxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784007807; x=1815543807;
  h=date:from:to:cc:subject:message-id;
  bh=IpJaM5ZWWGVXATm0MaDjNTCRL4vEKeMR4sxhUqfP2yI=;
  b=nrdZ1IxLrnbmJZ+68JY9X1Ve0sq6FdZFU5qbDIjhxmaA4Y2svz6cLG5D
   p8u+qokct04shDS/CJQB/i778zkHBvAGAnim69fyJ58M++aVX4MSVsJrB
   OpFQTVaDk1429I5asDnxk5z9jvenxiFXdaRk/t51pU6qw6vkQdZqu6dS/
   uXBQzdgpJ78SJdT0Ydcmcb+dHTLZp3Kb/H84w8CJKSyfkJ5hpac15kVsn
   bokWsazqPSkDB7gmxwkv+lYl9POOmcizp40j1inyiizY+AoyoHX1kj5Uf
   KFjBPhIg2FkpCaTitzXKTA5zOSymb2Xmo6f6fX8uvOX8XN6z8OrIcnUh/
   A==;
X-CSE-ConnectionGUID: X5pFiMaFSXmWjqlT3UMURA==
X-CSE-MsgGUID: 6BeG1//WTfG4Je7cxzSNHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="110168340"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="110168340"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:43:26 -0700
X-CSE-ConnectionGUID: M2GOnikERnex5aPKKrkQGw==
X-CSE-MsgGUID: nlk4JeUmRYq4maLTOQaxOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="254635788"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Jul 2026 22:43:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjVvO-00000000MRo-2PeQ;
	Tue, 14 Jul 2026 05:43:22 +0000
Date: Tue, 14 Jul 2026 13:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 58/59]
 arch/x86/kernel/apic/hw_nmi.c:30:1: warning: control reaches end of non-void
 function
Message-ID: <202607141354.j2DgSzBp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 27019f00127af90a16c3b8c54e976cdc8a711b0a [58/59] x86: Select ARCH_HAS_RANDOM_ENTROPY
config: i386-randconfig-141-20260713 (https://download.01.org/0day-ci/archive/20260714/202607141354.j2DgSzBp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607141354.j2DgSzBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141354.j2DgSzBp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/apic/hw_nmi.c: In function 'hw_nmi_get_sample_period':
   arch/x86/kernel/apic/hw_nmi.c:29:22: error: 'cpu_khz' undeclared (first use in this function)
      29 |         return (u64)(cpu_khz) * 1000 * watchdog_thresh;
         |                      ^~~~~~~
   arch/x86/kernel/apic/hw_nmi.c:29:22: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/kernel/apic/hw_nmi.c:30:1: warning: control reaches end of non-void function [-Wreturn-type]
      30 | }
         | ^


vim +30 arch/x86/kernel/apic/hw_nmi.c

28b8235238fa39 Dave Hansen          2023-08-09  25  
05a4a95279311c Nicholas Piggin      2017-07-12  26  #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
4eec42f3920430 Mandeep Singh Baines 2011-05-22  27  u64 hw_nmi_get_sample_period(int watchdog_thresh)
504d7cf10ee42b Don Zickus           2010-02-12  28  {
4eec42f3920430 Mandeep Singh Baines 2011-05-22 @29  	return (u64)(cpu_khz) * 1000 * watchdog_thresh;
504d7cf10ee42b Don Zickus           2010-02-12 @30  }
5f2b0ba4d94b3a Don Zickus           2010-11-12  31  #endif
504d7cf10ee42b Don Zickus           2010-02-12  32  

:::::: The code at line 30 was first introduced by commit
:::::: 504d7cf10ee42bb76b9556859f23d4121dee0a77 nmi_watchdog: Compile and portability fixes

:::::: TO: Don Zickus <dzickus@redhat.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
