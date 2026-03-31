Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F55E44A72C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 18:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980398; cv=none; b=rZw9L9/El2qHPkDc7rj6pKlNLfNpFXYw/YfZmxfjqop8uNJu1vrMVtoKald+gam8Lodp87m+E3aOPgmXtCflJBG5KHjzRF6+peu3qPWNn3nQviQn3+BxD5pQ2HJyJC3VzaUEItNDLe/a9TLtIOi1POLsViZnqfimbKQ5p/zNeRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980398; c=relaxed/simple;
	bh=Whf9pn3mX0QQQ9RJoApXDMscUG96MqrMp5opdHWc3bE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DiZ8FemL3IVh55+5sutWRDGQCMhdrab2b2BY7yW0qbKapiyNQUI6v8vmVrUafW2DJFU+pF5vDuhy4t3RZ35b/7OBQxJR1eVQa3OnqmUfaPM92tVAQtGVaeWSMJy6AZ6Ee5GIaLmNOtJmunCHRQBMXQOgeRNM7RmWuuwEVcVgnd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=agmzIkUV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="agmzIkUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774980397; x=1806516397;
  h=date:from:to:cc:subject:message-id;
  bh=Whf9pn3mX0QQQ9RJoApXDMscUG96MqrMp5opdHWc3bE=;
  b=agmzIkUVPcb7H1FmwMEMSeLNUKqyfdw3GcjZngZlY+Hmr/5ZbAfFwMA6
   203OL9k3SxqMFMEzjv+0MG+h+OajcPDus4ZweqwhBAU/we0qpK8GfA7wh
   WgNer5rRdcuBz17DkskJi6WKKZn8Mtohyb/qMoFe7CrsH9eLYiizjSOOz
   On/UMIcaDUydEE8Il2D5116zysE8IrB7SE0iBiXGEKZKiO6N9IyPocBfC
   VWAMavLj/vM3qblR2KIn3dZJhw2HEwkjOTDU5yMD8B4z/8mYZp9hXr88V
   8d/4y/BSOudVAKO40cV7Fs480G9wQqQ1xJFP0k1CADK3XazQmClmUpLwc
   A==;
X-CSE-ConnectionGUID: R//5PuQPR7OpYysjHsa/4A==
X-CSE-MsgGUID: Um5menT9TJOSBYpMhNlkBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76065297"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76065297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:06:36 -0700
X-CSE-ConnectionGUID: 7Ou+B9StSqWw4NZDicwKRQ==
X-CSE-MsgGUID: KR1wDS2TRHKLC/9NIT9MZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="226683638"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Mar 2026 11:06:34 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7dTz-0000000046j-1mZM;
	Tue, 31 Mar 2026 18:06:31 +0000
Date: Wed, 01 Apr 2026 02:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/obt 6/6]
 drivers/misc/lkdtm/bugs.c:835:17: sparse: sparse: cast truncates bits from
 constant value (7fffffff becomes ff)
Message-ID: <202604010149.X24fVPZ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/obt
head:   e5a10c0ef1457ad3c713a1bbe087da2b407d4722
commit: e5a10c0ef1457ad3c713a1bbe087da2b407d4722 [6/6] lkdtm/bugs: Add basic Overflow Behavior Types test
config: arc-randconfig-r121-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010149.X24fVPZ0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010149.X24fVPZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010149.X24fVPZ0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/misc/lkdtm/bugs.c:835:17: sparse: sparse: cast truncates bits from constant value (7fffffff becomes ff)

vim +835 drivers/misc/lkdtm/bugs.c

   819	
   820	static void lkdtm_OBT_TRUNC_TRAP(void)
   821	{
   822		volatile int big = INT_MAX;
   823		volatile int wide_low_value = 5;
   824		u8t narrow_low_value = 0;
   825		s32t same = 0;
   826		u8t small = 0;
   827	
   828		pr_info("Performing same-width assignment\n");
   829		same = big;
   830	
   831		pr_info("Performing small-value assignment\n");
   832		narrow_low_value = wide_low_value;
   833	
   834		pr_info("Performing truncated assignment\n");
 > 835		small = big;
   836	
   837		pr_info("FAIL: survived overflowing truncated assignment: %d -> %u (ok: %d -> %u)\n",
   838			same, small, wide_low_value, narrow_low_value);
   839		pr_expected_config(OVERFLOW_BEHAVIOR_TYPES_TRAP);
   840	}
   841	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
