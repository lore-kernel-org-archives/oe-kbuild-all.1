Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A455821B19D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901310; cv=none; b=gS9jXBk4Gn7qALDRzkzMgNrY1vyw/dCWCyD6ddDOgEnlGWjm8YsqaBUDKjxXDc0aGepGPxiYU1N2WRMms6kv8h81e8Hsj54R4bazVlAHZJerGOedsR4pCVisuXHGMI3sQG0iR08ENF2oLUOHBJApmMrc8C52JEvJCuEHrvaEv5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901310; c=relaxed/simple;
	bh=3IJUPx4mTCmbf/rR/pJYHJcK5Uds2BW1vf9YZK3SsQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ed2KofsSa+7KIl/q7MXOorOyuMkUjMQMfdyI5RIn7CJESJmTeqN0wSrCg6ALW2s0fDuUdv4U2cdQqzMBQzeRCnbtV2BVhw/sqs7WSquHhUWTJf7Am71oSI69DNJyFzq9wfIofDTtDoUEUQ8FYr8lX1f4PON65MhYw5KGYR9I56k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJf8ti8Z; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJf8ti8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746901307; x=1778437307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3IJUPx4mTCmbf/rR/pJYHJcK5Uds2BW1vf9YZK3SsQg=;
  b=GJf8ti8Zhmc4c0cfzrWiCMGLv78hqKPwXRkRm+NqyDvXWE9KMBi8VwZ4
   Zku0USegwWyqTLv6J4IZZ8RVUkkiWNbO0mZ5lJFq6SgcC3bql0soOVeoq
   6niYThepu9Km/FFEheEji1SLpI9yaAUYaZNf2VzCHzn1sYv05M2+NyKA2
   d2IT5g3nLjuIqhIq5RenON+ONMxmV0fa65VuTN/cH96j3XZOzSFnjPwoe
   lJHfVSOjisTEvCVpcZfUe6DorIe95iTQuZTcDqMcBMBhlM9gJgoprFlLA
   T4Ln+2ixasrZm3TdRwNqt9j1aEuiROiLVmcWqULZhSHMtSB0jIJdhqeah
   g==;
X-CSE-ConnectionGUID: nVv2CVuoQf+qfSB0M2n4DA==
X-CSE-MsgGUID: IUw47wocQhmIWvdjeEhCkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="47835039"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="47835039"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 11:21:46 -0700
X-CSE-ConnectionGUID: iM5EQdcBTQywyan67sq9/g==
X-CSE-MsgGUID: mH/oPz/iQqG7djF9FBdULQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="167860082"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2025 11:21:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDopT-000DHB-2i;
	Sat, 10 May 2025 18:21:43 +0000
Date: Sun, 11 May 2025 02:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for function 'memcg_reap_background_set'
Message-ID: <202505110205.P015V563-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a79e0786f3fa90fd521f198ac6ccf6b11dbf67c2
commit: 67960246d7b8e4034d9a6ef1f75aaa35353ed21e [0/94] anolis: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505110205.P015V563-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110205.P015V563-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110205.P015V563-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^
   mm/memcg_zombie_reaper.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void memcg_reap_background_set(void)
         | ^
         | static 
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for function 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^
   mm/memcg_zombie_reaper.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | void memcg_reap_background_clear(void)
         | ^
         | static 
   2 warnings generated.


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
