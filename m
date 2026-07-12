Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40B38A73C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783896825; cv=none; b=kO+iOJFNamwNHFEkLG6oIaZ2/JjiJY5NnA8jeO1ubfXTxyzLviMwAYLJ36OyVlnGoskI2IqrY/AMx1A+pGrOpR0qCh3mhqyDvG+yE6YvVjm2VZTW+35Jxul9EJkKAEZb2Zb6KUjum5pwTV01IKoZjDfQ3RiYigsrt1Dyo5nPMSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783896825; c=relaxed/simple;
	bh=Xapz1RHtK7NilofaurZoTiTlVSRSbmL34XNN/yY2reA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qZth6eff5xlgRaCCI8y8kpJNUiu07UIm/2twy4UfUd/k9vo+b3WjzQ+yWaELZ1RyYlyhRHFpyX0MQjy6zh93yXsWqApBeMYQ0ePROKN+ApDcXxCc6s+/xM/QN+GSviE9D8/zyIcKMJlyD6RqiDloCcBF6K+8dGlsYopFUHgSlM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AElw3xhf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AElw3xhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783896823; x=1815432823;
  h=date:from:to:cc:subject:message-id;
  bh=Xapz1RHtK7NilofaurZoTiTlVSRSbmL34XNN/yY2reA=;
  b=AElw3xhft+H4IpeXMKULYV1Ga8QJV4ANLciuuVw5+0m3om1xQSxGUkTy
   erOuvTgvUpfjBWv5ecowUutd+DzPYZsFRefnMr5bYtp0RqWhuR/CmUw02
   RAcdUBlf+xmFjIwfcei68p8s2jSsg9muKAKDvtzyCn5UUZ4PWBnqsvNnE
   xTbh10MrB4Fm6t7UvIMBEb2K/ihFldpJYB1PtW1pRcMRJIQo6EGz1U7uK
   488BxkMy28Cm6QOf2fN6uofjEY5SC26kuip+kpXBwoNe/m6L7DW3CA6Yc
   oBh47hqG0p6bKWpcBHw01BlBnMqBVkyTbrpBDZU/nwlDu3/fWHrP48Dxn
   w==;
X-CSE-ConnectionGUID: x6yN1iVsQBG1UGOqoMwrqA==
X-CSE-MsgGUID: J6QLc7kMS8CFmiU16Ae7lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95109652"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95109652"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 15:53:40 -0700
X-CSE-ConnectionGUID: 84Y/QMyoTHaRsdp5mN/D+Q==
X-CSE-MsgGUID: Fwi8zOhIR8679YjiG8hBqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250980742"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2026 15:53:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj33I-00000000LBW-0lbB;
	Sun, 12 Jul 2026 22:53:36 +0000
Date: Mon, 13 Jul 2026 06:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:entry/rework 18/21]
 kernel/entry/syscall-common.c:32:9: error: implicit declaration of function
 '__audit_syscall_entry'; did you mean 'audit_syscall_entry'?
Message-ID: <202607130643.SOBCpa5N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry/rework
head:   1454229eb369ff115a01917755f196188bdc74ee
commit: ddef2cc738735c0da1c43b05bbeab690c76f961e [18/21] entry: Rework syscall_audit_enter()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260713/202607130643.SOBCpa5N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130643.SOBCpa5N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130643.SOBCpa5N-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/entry/syscall-common.c: In function 'syscall_enter_audit':
>> kernel/entry/syscall-common.c:32:9: error: implicit declaration of function '__audit_syscall_entry'; did you mean 'audit_syscall_entry'? [-Wimplicit-function-declaration]
      32 |         __audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         audit_syscall_entry


vim +32 kernel/entry/syscall-common.c

    25	
    26	void syscall_enter_audit(struct pt_regs *regs)
    27	{
    28		long syscall = syscall_get_nr(current, regs);
    29		unsigned long args[6];
    30	
    31		syscall_get_arguments(current, regs, args);
  > 32		__audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
