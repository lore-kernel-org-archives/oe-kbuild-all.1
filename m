Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C355167D80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726568107; cv=none; b=u7+K8x+snbakg3QtvHwneTL4PG665cRhc66ltZ9pqICnDO/TC3BYcA4YDTnm1vCf5L4MD5CVP1cB4jk3NtGswt5madDThARVJ2fZpetk0JJXiD1HkcdjGmYlOQQqVXKt2obLVg9hmHRI6ACqpftjUtjsuTUjMDovwXMlTZiynFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726568107; c=relaxed/simple;
	bh=/HvRQ6dmTvWR5rQyuJxyg0Q4T3I9QXnlxi4mS3WRlwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=huuD857aFCdxjUtUa7VfC1YpsAEmthAAj7uiameJe3SHcnHQz4jGOkiIHAnQAYhmabC56LeYurf87j5fbOwxyX0cyJdJT9iTirVpYK8X2yZCfayuie4sJJB6+mVZy7R89FfrvteYj9nrlfRgPQS1CXLT2e2vcePd6t+1KZUm02k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdU+2LOG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdU+2LOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726568105; x=1758104105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/HvRQ6dmTvWR5rQyuJxyg0Q4T3I9QXnlxi4mS3WRlwU=;
  b=gdU+2LOGuL5xPc7lvCXrH7otjHJRyYa6IKB1ODQF6jjwSebQvohHsMwl
   awcFLJwAXsN3F0jhEpFd2kbVE6FBXvBY/QhsP0CKJ2Tl6LTXvF6HnRCQj
   izAtkbaoxqaGXEe/rz1bCKV568zgsTH714vaXGsw1nWBbsU5BKzzth1Mg
   x1hwIJPQc+otCAJrK6nvRR/gAPGpzXpvQsrSVk5B0efl/h/5eq6WppVeo
   5jPTuT1jcRgAI4TVPjvc2aJvNBpYcKcUwqcwowXUOjjdaVP3rwZWDi7uU
   /t/njno3WF+GY/X88Ta0Je+0CEPqYHLyiPZKiDn2/HG6qF+yT9jWhBU0c
   w==;
X-CSE-ConnectionGUID: Eeu7HAptTGuBrGQ9lhA95w==
X-CSE-MsgGUID: 9BmWPen2Q9+hrU5XXtBPEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29200701"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="29200701"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 03:15:04 -0700
X-CSE-ConnectionGUID: xLpDXJx1QCiVQODp2srxBg==
X-CSE-MsgGUID: +ylqlzJ8QuG0/E4gCwLE1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="92435840"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Sep 2024 03:15:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqVEZ-000B3i-2a;
	Tue, 17 Sep 2024 10:14:59 +0000
Date: Tue, 17 Sep 2024 18:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe-2.1 5/5] fork.c:undefined reference to
 `unwind_task_free'
Message-ID: <202409171826.TKOcTuUe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe-2.1
head:   5b35eb7c617539f21cbe3764b0ee0c77567b0f22
commit: 5b35eb7c617539f21cbe3764b0ee0c77567b0f22 [5/5] unwind: Add deferred interfaces
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240917/202409171826.TKOcTuUe-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171826.TKOcTuUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171826.TKOcTuUe-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: kernel/fork.o: in function `__put_task_struct':
>> fork.c:(.text+0x12b4): undefined reference to `unwind_task_free'
>> fork.c:(.text+0x12b4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `unwind_task_free'
   or1k-linux-ld: kernel/fork.o: in function `copy_process':
>> fork.c:(.text+0x2250): undefined reference to `unwind_task_init'
>> fork.c:(.text+0x2250): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `unwind_task_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
