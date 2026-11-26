Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697459;
	b=VlWdi5OZkkZpQMiDja6+kzSCVJLSI0T+9GFvMTt3a/WMeRXPYL0PXj5wSvmfP9DEFtlG
	 4ZEAkN82HqoEGs0DUjrojgJIzH3M5gcYFekzPSRt9fv06VxeYJBhJXG7mTKKXGTjmGCrO
	 ALOqkUj2mwZQzNodTH19/sjlNz3sxRPx0ajKN5ZMMj0bh1SIjrNLZ8y3mOl1E8VtYlk44
	 /kXNPvTxsjEQlzQfTx1fDqsyEhoOxiivUGkionPQXGMyx0opr/Nwwvfx3v6I/kUct4nK9
	 IEnfnz1Tf7oEyqJcNva97qtItaqOmV+kpz0AU/k6vgKy4okHEHdLQTv4mQZzKsSe2VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697459;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NstzzQUc1GqnCWUWVsfuU5sjJsX6d60D/LmUqm2abq0=;
	b=u56df5wQ0pP0W+LL/67vA4npkSZyu8BsIcBlLQrhYgt4Wjtxb/CfrFekAbtQoZCq32zq
	 CxNIuOz3vWANwqpX0i754Iwu/SFsXn3+ceMAh+7XUI96fLGwDqQyGqGDQUvHy26tDMggK
	 LwMkq35AAI079+vknbcI68/SJgooBitmsWhqYMJZjWAByRhPKoQ+wVyXqz7luYPoFUknw
	 fmqzd9wERmKp7yEpzgkwB/ByKTmrBgQaMDDss1fPsRVc/ZYSLIfMOCOjb5Y3EBGG+XAFy
	 VAaBcegNpvzl4yHegMdsnG6xXM7093/N8bDImCyFSOGCWW19ZK3LRLQzAs7R/hSDi9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="GQNN8tL/";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291C5606A329
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 12:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291C5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQNN8tL/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795697459; x=1827233459;
  h=date:from:to:cc:subject:message-id;
  bh=mFdHaRcq5PZVtbtvxgSsBlcPh7XLdd9RI8F3qknDaJY=;
  b=GQNN8tL/Vcw5z1y8SYF2N4wyfkUGl6WlFjkb9vb9eqjFwaOxQo/NzpN0
   tCD858zoeDxMEcykgGAB5QSmpyKxX4abNS5HZGWjJM6eP83UjDIza+K97
   yElagdUTWu4OBt0QGz5i+8UTtA2zHVZjViuSAtnHaold0HR5fKM6HNG5c
   KmSnT/XsWzg8pq90bYmvCROzYHXajWH/oqsxPR4T2951xhsabiKfpUfhH
   FopXi7Ve9SrnoNLbiHuiSEQc+GaRh8UUunShW1F98aCbxCwjO+taZlusk
   YZiKqMHRv4Vpk7RtIpXvP/kOMuefBXzkW9LJ5DaHia7NxeNacOwiBLL20
   w==;
X-CSE-ConnectionGUID: Sc2AhlSHS+qJCIDw6XOnWA==
X-CSE-MsgGUID: mSP6qywoRIyoq8MPZVnBzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4533028"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4533028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:50:58 -0800
X-CSE-ConnectionGUID: /uf1qsjRQMKWErvslU5nPA==
X-CSE-MsgGUID: hQiguIjUTgag0cwNJ3n65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12315688"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2026 04:50:57 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWYw9-0000000003i-3NwQ;
	Thu, 26 Nov 2026 12:50:53 +0000
Date: Thu, 26 Nov 2026 13:50:06 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 65/65]
 drivers/perf/arm-cmn.c:356:15: sparse: sparse: symbol 'arm_cmn_debugfs' was
 not declared. Should it be static?
Message-ID: <20261126134501.qN6PNBT8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   36e3098ebf6d37570aab9dc5f8f4d24bd5ffdd06
commit: 31eccfd00de09d61f9be767eca053547e1064338 [65/65] UPSTREAM: perf/arm-cmn: Add debugfs topology info
config: arm-randconfig-r2301-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126134501.qN6PNBT8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a2bea097c8bf336f31f45e88e96f20d88e37ff5a)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126134501.qN6PNBT8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126134501.qN6PNBT8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm-cmn.c:356:15: sparse: sparse: symbol 'arm_cmn_debugfs' was not declared. Should it be static?
   drivers/perf/arm-cmn.c: note: in included file:
   include/linux/io-64-nonatomic-lo-hi.h:38:9: sparse: sparse: cast truncates bits from constant value (8000000000 becomes 0)
   include/linux/io-64-nonatomic-lo-hi.h:38:9: sparse: sparse: cast truncates bits from constant value (8000000000 becomes 0)

vim +/arm_cmn_debugfs +356 drivers/perf/arm-cmn.c

   355	
 > 356	struct dentry *arm_cmn_debugfs;
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
