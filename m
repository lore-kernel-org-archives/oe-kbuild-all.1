Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F833AFB0C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791112364; cv=none; b=dYTsulEJy7NoNkZ+jhUFmwRfl3nCdE7iViSAjFORQT/kL0nVnDF+YKMprj9lgVN1Kuy1SKn1ag/U7QBLPVHkMBOjZX3hxks+z/ZK7tM/ptg2ceyR1iir7QfuByXHfebCHEdK8LKkfQcJKUj+C41IoCo4AId9m1sLtw+/GAVQ+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791112364; c=relaxed/simple;
	bh=riAylIhl+ab40U4aXcA5fkQzjhqvqz+9LaXmy/hL8M4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IJngrSzdg8Nlf1kXHt0IUPH+avWMMVU3XViRrIJhgx0w4GgBvV/IoZyu+ibmpl/PD8vffP4NI/hvtm3i3GI5gMPW38B5wxoNK3YnzEJi7m8/w4zoVnc0TC3S4Nz0giwlG5mN5ofVVfTIs7Fua4+6iVEoxykRcMMGghY6ZollBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoYYSRTU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoYYSRTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791112362; x=1822648362;
  h=date:from:to:cc:subject:message-id;
  bh=riAylIhl+ab40U4aXcA5fkQzjhqvqz+9LaXmy/hL8M4=;
  b=DoYYSRTUg5/EYScKDNubWSRWcAI6kcuXB140Be1OeaUPDDMb+dJQFAhE
   S8YRb1MvscJ2mL56OuKV/pXyK0sZ4b+9242eQXozrFRsHvgJco/IahPxh
   kjXMaUlsIHiqZ3MC/VANu7msqHP8KvRTTG085xR+Z0suE+YRc4glWBNJ+
   oAsA4W1SlpKyahi8YTmICPFlUvxpgYiI6NAjdKkls4bOKMHb0AegoYh82
   LGfeZSxTTVR9YcaQEufqFBk652VNKRGlS0sB7cXJHfRPoxUJtIlMOEm2q
   CKMysnvJTOCjGHOeS9pWZanq0rTq2Tj/l9q/oKMm0rosJKP8x+IkTYnCf
   A==;
X-CSE-ConnectionGUID: UwpWOJ2+SBOPaRxLM4HKSg==
X-CSE-MsgGUID: jh1GUwbER6StnunW3Dcw+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="113584500"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="113584500"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 04:12:42 -0700
X-CSE-ConnectionGUID: 42RCgvxkTtqxHkAfPymFVg==
X-CSE-MsgGUID: clnrwnZcTumcmYydf8TENQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="306101545"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Oct 2026 04:12:41 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDK90-000000000H9-00zH;
	Sun, 04 Oct 2026 11:12:38 +0000
Date: Sun, 04 Oct 2026 13:12:00 +0200
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.3-rc2/skb-buckets/v4 5/7] ERROR: modpost:
 lib/tests/slub_kunit.ko: symbol 'mem_cgroup_kmem_disabled' undefined!
Message-ID: <202610041301.Pv01mTBa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.3-rc2/skb-buckets/v4
head:   0864a85d9ba2e3c91ab69bccd8823903cf1a6cad
commit: b2a9de7fac15da160cb2554479f3396b10e0ab17 [5/7] mm/slab: Provide kmalloc type fallback for bucket allocations
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20261004/202610041301.Pv01mTBa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041301.Pv01mTBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041301.Pv01mTBa-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/tests/slub_kunit.ko: symbol 'mem_cgroup_kmem_disabled' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
