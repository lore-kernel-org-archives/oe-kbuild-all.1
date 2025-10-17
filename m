Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21930FC3D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 07:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760685002; cv=none; b=oKxMKYdQhsaQW2oyqlRBkeFYMyd2g1x4cUwXVQAYUaKCj3ILcUeBCAhwFQ88MDru7JE4Eue9cYTWk6NV/zeXWyRgqYhV6IAunWEc/esZLmgpzVnRdzq2jGCFM6DUuw65C1HY6+7uELSpV5VUtvPqn2YqkX4iLDqccWD3pjyoJRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760685002; c=relaxed/simple;
	bh=nWU/4glpO+j4fWX16cxl4SfFRtva3o9O3PCaONoR/mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lffD9z4p/caMTpGUND2WT2Tf0YUJKcpUqJMjUT4vh1r8mNfbgP5UKY22xAvz4vNqqjbMBc/UVnqN0OeKfujmdENVXBBIKg/YNqz9Q2vnIdcCJA86g2s6SUuhXOTj5hRuItUY+rCKqfAeKJGbbxQX100hsU9kyI8o+CYjbJtzph0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvqU1dbR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvqU1dbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760685000; x=1792221000;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nWU/4glpO+j4fWX16cxl4SfFRtva3o9O3PCaONoR/mQ=;
  b=AvqU1dbRaUJHo52fGIxsAzQDaf1tKPfTYgwGh6fog8kKFI0t8no/eixG
   knmg2E0DUjWmFL4tq5PNpFAJPOQLBWrGGvynXId+yUofrkpAHzqFJ6eSH
   P++x+1SbkFITlWZU59AnVfmItGto47JtT3eLDOskFs7hj+wMj6giJsJxf
   rtUfkLJcoHo0C7OzY3gzn7g/ryLFAWRMJVIgs+yxf6MaItZ0svTWU4ImM
   /dt9l15CGpIOc0fzdkHr08neF49HUNzXL4njGnLvUdkKNyJQsLAUYVzU+
   NWAzqa7K3SZadUnJU2tithOgZROZeSja2HOfdZ13b1qkD8lvMVSPZI57e
   g==;
X-CSE-ConnectionGUID: wZJOSaZ2QjO4VwD9xZyRoA==
X-CSE-MsgGUID: i96CKvhGR+eGnHGUrEypLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62980097"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62980097"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 00:09:59 -0700
X-CSE-ConnectionGUID: lvx1pogCTeCGJC476rFpKQ==
X-CSE-MsgGUID: 976QWl0fQJyijvVDhOeBeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="181800277"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Oct 2025 00:09:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9eak-0005ev-28;
	Fri, 17 Oct 2025 07:09:43 +0000
Date: Fri, 17 Oct 2025 15:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 22/26]
 include/kunit/test-bug.h:60:23: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202510171557.OFyLdVV1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   f55c4073139308d7f4b672c67400b0397a58a9ef
commit: abee7c863f6c7d310f7234ad80e117444ff08cf9 [22/26] kunit: Introduce UAPI testing framework
config: x86_64-randconfig-121-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171557.OFyLdVV1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171557.OFyLdVV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171557.OFyLdVV1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/kunit/kunit-uapi.c: note: in included file:
>> include/kunit/test-bug.h:60:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/kunit/test-bug.h:60:23: sparse:    struct task_struct *
   include/kunit/test-bug.h:60:23: sparse:    struct task_struct [noderef] __rcu *
>> include/kunit/test-bug.h:60:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/kunit/test-bug.h:60:23: sparse:    struct task_struct *
   include/kunit/test-bug.h:60:23: sparse:    struct task_struct [noderef] __rcu *

vim +60 include/kunit/test-bug.h

91e93592219f74 David Gow        2022-11-25  48  
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  49  static inline struct kunit *kunit_get_current_or_parent_test(void)
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  50  {
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  51  	struct task_struct *t = current;
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  52  
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  53  	if (!static_branch_unlikely(&kunit_running))
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  54  		return NULL;
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  55  
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  56  	while (t) {
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  57  		if (t->kunit_test)
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  58  			return t->kunit_test;
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  59  
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26 @60  		if (t == t->real_parent)
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  61  			t = NULL;
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  62  		else
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  63  			t = t->real_parent;
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  64  	}
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  65  
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  66  	return NULL;
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  67  }
edcc4fdc930076 Thomas Weiﬂschuh 2025-09-26  68  

:::::: The code at line 60 was first introduced by commit
:::::: edcc4fdc930076efed79770ef16f10a814c9b030 kunit_get_current_or_parent_test

:::::: TO: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
