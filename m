Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C98214807
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 01:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761356699; cv=none; b=rGBY5hWM6aVEfmJ1wO0VQJo/yzkH3gpdIVNDNnsN90qn9FYp0KfcGE7E+/+bN2YjJngsdxk2YAaVnV7rycXTxOP+PRNzRIvTFWE83tiCDqFybX7iWUNThd2IVmcU5Ldhy+DqKavKHLqMyyKu4jl3CEVvKT7NhKmI+5rZ1jM4BPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761356699; c=relaxed/simple;
	bh=+Fu5OgTDIZIRAtIoJ7xpHPgfs7GVRyqQ9fmPndTdNj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bjHC4lXwlaKoEvORKKe9ZdRqjr1RnlP3ONE2EFS66aSR7y7H41GsoKXmU8FaNampZyYPrR9emdjyukcEYlSdtCyJHLu8M6fyCtq6iFo5FnRUxHRMur2tbbL9BnxwLOS3i6LjlD9Uy6yqSNFykJmehSBSJGzSc0jvbkXyFW4QjV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvLi/4NF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvLi/4NF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761356698; x=1792892698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Fu5OgTDIZIRAtIoJ7xpHPgfs7GVRyqQ9fmPndTdNj8=;
  b=TvLi/4NF2XUo2QEiNJiSW04zQoQnXl3zIBgvTwTgCxVCgwlXLl6LY0Cz
   VBVEE010GoMqtRlESCbh9dMDw5U1l0boneERSjuHVW3epKAMlKHRcj8Su
   ZEKjhObprEauSqjIv3K7JtGz4HDEefO1IduMEmYzCgKBER4jqwW5B0z+1
   14jiNhEbbzgak0vLf9oMFyQGcVHz2vYb/1VVFVTYnYWHB4QxQEmz9+SbX
   YQd8rKkuzRrBeEmtv/KspYV3o7d8H+bT+wwJ6LvY/QBAmi/iAGCN8F3eq
   7rnesGFf7L/x9g5Aqru8KNp98UZhIivwKsfdiK914IAVz0/SewkaP4vj0
   A==;
X-CSE-ConnectionGUID: oD+/X/F1RpiSQPrPn76BlA==
X-CSE-MsgGUID: KnXvRjr3TEeWJ4Dfc8DxZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63428822"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63428822"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 18:44:57 -0700
X-CSE-ConnectionGUID: 0P5/ws5BQEeC/C8es36vTw==
X-CSE-MsgGUID: ENSWOxcpQT2WmA5yBuWBZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184466788"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Oct 2025 18:44:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCTKv-000F37-0E;
	Sat, 25 Oct 2025 01:44:53 +0000
Date: Sat, 25 Oct 2025 09:44:43 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [tip:locking/core 8/11] build_policy.c:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <202510250928.YLPmMRoX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   37d0472c8ac441af8bc10fc4959ad9d62dd5fa4c
commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b [8/11] seqlock: Change thread_group_cputime() to use scoped_seqlock_read()
config: x86_64-buildonly-randconfig-002-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250928.YLPmMRoX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250928.YLPmMRoX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250928.YLPmMRoX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__scoped_seqlock_next.constprop.0':
>> build_policy.c:(.text+0x23f6d3): undefined reference to `__scoped_seqlock_bug'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
