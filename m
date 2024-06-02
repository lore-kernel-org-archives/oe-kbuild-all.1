Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06CCC8FB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 16:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717346799; cv=none; b=DwBhDrU0w2d+5mSbIK5C9cfZHMVkaMFV0QFL+9Pms5H2gXD6YVo0npBSrbKDA2orvKNFAjqdWmwztvGIBCnTFPdLokM7w5PgAOlctUnlmFBKxJt9YLY0qfLcnbuuHX9+q//3Ukq39xv0HqZRVhLBVY7GRgaqoxLq7qlou4w0ZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717346799; c=relaxed/simple;
	bh=bC+HnFGaIzp5PtVweCl5HmtZJ0zXKg7XamEODVzoPh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j0W28wB5DmmbUoPlQOGYXiY4Nr9RJ0eR8JakbfYbSdhBwJ/v1Ba79g7sjiMFuWz8djJpuLw8priJsOS6UAfRbIBaeCBBgG1eXCcWJvPu3vNqHyUFTsatr6YJgadb3D4u2PVrKHNT6UETsV/Y5LGkF4QdZp94GA7KRFO0s+KWCQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n433hhjy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n433hhjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717346798; x=1748882798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bC+HnFGaIzp5PtVweCl5HmtZJ0zXKg7XamEODVzoPh4=;
  b=n433hhjybR6x4+eVWbVS3H7EA1m0xg0sO60zwMDPKVBZooMEzVHVtMW0
   dtOmo/yPnLbAs1oWWf82QiKFMx+V28buS1i0Se9z1coe/EpbfO8hc6ztT
   k5KxNwkFyMm+v9fUnVtugwa0hUupySCQQ5qlh4J6P2sE5ZiqKeusiysAJ
   w1V0jk57p3ErWj+neIwgqzJkldSehA/emvs1yYlixeE+7AO/ut7rQH/NP
   CWvkDeV2LVGWvL760JLaIGHTEhxaw9SO/hngSjQ/OZql0+YYWR8k8kPOl
   ZSHrZkvW5LENTddVlzdP+BP9Abnl15nMBISrddDODki26Ihn4yjGvQv65
   A==;
X-CSE-ConnectionGUID: aXwLZ0xaQbi3qswZip2m6g==
X-CSE-MsgGUID: 5mHTbBo2Q4GjUd4QopitHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17664602"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; 
   d="scan'208";a="17664602"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 09:46:37 -0700
X-CSE-ConnectionGUID: XJ9Lw5bqScy61K7NHaLGZg==
X-CSE-MsgGUID: KUPrfC47SsCkan2xbgnS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; 
   d="scan'208";a="36558456"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2024 09:46:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDoLp-000KB3-1g;
	Sun, 02 Jun 2024 16:46:33 +0000
Date: Mon, 3 Jun 2024 00:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ian Rogers <irogers@google.com>
Subject: [akpm-mm:mm-nonmm-unstable 38/65] fs/bcachefs/clock.c:150:18-21:
 Unneeded variable: "ret". Return "NULL" on line 164
Message-ID: <202406030001.jwsq6DZp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   54524b845fbe070c5401141bc4ff2ec3f01f1e72
commit: cf66e6c3b24c5aaf365c54bb7dc8b9cb01f47f4d [38/65] bcachefs: remove heap-related macros and switch to generic min_heap
config: x86_64-randconfig-102-20240602 (https://download.01.org/0day-ci/archive/20240603/202406030001.jwsq6DZp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406030001.jwsq6DZp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/clock.c:150:18-21: Unneeded variable: "ret". Return "NULL" on line 164

vim +150 fs/bcachefs/clock.c

1c6fdbd8f2465dd Kent Overstreet 2017-03-16  146  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  147  static struct io_timer *get_expired_timer(struct io_clock *clock,
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  148  					  unsigned long now)
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  149  {
1c6fdbd8f2465dd Kent Overstreet 2017-03-16 @150  	struct io_timer *ret = NULL;
cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  151  	const struct min_heap_callbacks callbacks = {
cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  152  		.less = io_timer_cmp,
cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  153  		.swp = io_timer_swp,
cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  154  	};
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  155  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  156  	spin_lock(&clock->timer_lock);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  157  
cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  158  	if (clock->timers.nr &&
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  159  	    time_after_eq(now, clock->timers.data[0]->expire))
cf66e6c3b24c5aa Kuan-Wei Chiu   2024-05-24  160  		min_heap_pop(&clock->timers, &callbacks, NULL);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  161  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  162  	spin_unlock(&clock->timer_lock);
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  163  
1c6fdbd8f2465dd Kent Overstreet 2017-03-16 @164  	return ret;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  165  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  166  

:::::: The code at line 150 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
