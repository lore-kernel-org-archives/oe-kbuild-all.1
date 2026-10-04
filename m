Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A20396B76
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135591; cv=none; b=dFadDrIdiMn8eQGAXQbko38Vq5fzOQtGGtDZ9iYKfFwbJNAbgooagiw476BxSbIBasM5VFHiqbCiiEI+rKfoPfgCFM+j81TJt0oZBCRrFek45+meErwpfMx+hXukli7zerDoLxkNVnnRllm9SNtxJX6RP2Luz0XnYgjLzMbe/hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135591; c=relaxed/simple;
	bh=atL3uKk4zSd2yetZ810dMbql2gCB9eUJolQNUz2rULw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pA99ETfwIHlg/b7ctw98l13Mmn+fL5E2HEQWxrc5qcqYq1T6nfyyS1aAVAA7sa5r35WdaiCKfE/8dViHbqsMaDCKBuUwZsdky9Es6JxzraYcujf5Ck/wqowSUNPcWzr/jtuv76S7iOVMqiuCys2pEgU4z+Rhpb49FyERn4FCSmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJHdgUXP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJHdgUXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791135590; x=1822671590;
  h=date:from:to:cc:subject:message-id;
  bh=atL3uKk4zSd2yetZ810dMbql2gCB9eUJolQNUz2rULw=;
  b=jJHdgUXP8Rz71C7TzwJEVuGBYlb57XnOmrPaUyA0m7c5EhY7LPz5iR/P
   JiNeo0fnYss7RDwXmgkBnuOyVOhuRXMJWPplnBtHXKQryZF7Xp1aXOVRw
   tfaiwCCF5C0uRzv9RNhJlGLBqg3oXg/PWuck5eKLiQVgqAg9cWUC3YvQh
   17xBFnn2wbHMjos/9o5XSHpoEuQe4g7yyenEOyHCqQIhrZKLMA7NOwB7f
   fBXL56ofw8JRjjXpyjYb6xgGlgSTj7FcIWaKRh4/54jNimqoLRFTyLt+c
   mC91pVnTHUdm/iOOQF0efA/Ubbcx1sbeE1UIgdqLjLPzPfBh+o+x2va6i
   w==;
X-CSE-ConnectionGUID: Qp7JSuC7QNCLTlarXAWxKA==
X-CSE-MsgGUID: YKa2jvLSQtGMuun3UIvYBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94305073"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="94305073"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 10:39:50 -0700
X-CSE-ConnectionGUID: ThLeNb4MTIaQwRut9AB96Q==
X-CSE-MsgGUID: qpecmF2YQDmTZMamDELgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="314650520"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 04 Oct 2026 10:39:48 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDQBe-000000000Mx-11on;
	Sun, 04 Oct 2026 17:39:46 +0000
Date: Sun, 04 Oct 2026 19:38:57 +0200
From: kernel test robot <lkp@intel.com>
To: Jann Horn <jannh@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:locking/urgent 1/1] undefined reference to
 `futex_mm_init'
Message-ID: <202610041918.F9QU0bxy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/urgent
head:   fcbe4307bda074abc8132bfe746eeb0e502d74ab
commit: fcbe4307bda074abc8132bfe746eeb0e502d74ab [1/1] futex: Fix mm reuse handling for FUT_OFF_MMSHARED
config: alpha-randconfig-r2101-20261001 (https://download.01.org/0day-ci/archive/20261004/202610041918.F9QU0bxy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041918.F9QU0bxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041918.F9QU0bxy-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: kernel/fork.o: in function `mm_init':
>> (.text+0x1b24): undefined reference to `futex_mm_init'
>> alpha-linux-ld: (.text+0x1b34): undefined reference to `futex_mm_init'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
