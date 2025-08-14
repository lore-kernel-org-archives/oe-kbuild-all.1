Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81492FD1AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 16:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755189810; cv=none; b=RCSfUCKMqaXgyKD29f3kcGWBYWIqVzRUkiOXkLcH5nEEOOkZA1cIMc7M99/VXjO75el5a5f/F63WhTfieieQHn2WjoEbY1AYmx3e0dmXkjH5VmXrU1dEKjHvQIh0iR3suaRT6W43lbgWhmuPEWX95gBuXdYImaQ5dl3YDkfJfVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755189810; c=relaxed/simple;
	bh=V/V8x5Yj1AM29W+XG4Ia7BrZ22Eq80Zzcod8uJy+NB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mr9RQ6N1IXNGz1/lSWt/iHcpy3zlufLfQTdTsbWHGwddPt4bmx74q5CQ2YLw+R2ETAShlj+0m/25me/knm+hg3jLWDZRT/dzy1fjXL0c1PoxxZeXltU9ycTGLiAKID2SnDeZgu0JuuKAhYsWQIsI1ztFjtp+xN/d+IpQSIoNO3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DF0YiWGT; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DF0YiWGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755189808; x=1786725808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V/V8x5Yj1AM29W+XG4Ia7BrZ22Eq80Zzcod8uJy+NB4=;
  b=DF0YiWGTrvR2+9eyLgmF4TjX1eilL7an8fT/3RpUKchxlwZ55ZZuQ/hn
   jzUuEB28NV7g5h01TFNYdvCsInSFn7RlZ6EhUIVtLQeXnjKgr7nd+11H6
   HDAlodTXHCkjqaz+3BnyFjOYAuTUQ1HVBXPj+uW9FZKHEr+8xPEiOVw9D
   AfOKMMKkCe5UfmyJjL9iUPD2pvoHKxgerV69kvr5CPImlT5lbYbTSZ8vJ
   kLDYaQA8THQtAqdqNGuQoaHNNNvVmQdfnDwEaLntWYiyO7iwsgoMTBUiH
   Pel6mUgs9ryHaHuaBeulyQQe+9YvClY8pV2u/oTtKojXY+6MnLG9YOLiE
   A==;
X-CSE-ConnectionGUID: rfC0c4iESyCs7iKPJ/XWiw==
X-CSE-MsgGUID: L9duySwVQLqWLWOVVV/Cng==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="74962781"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="74962781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 09:43:23 -0700
X-CSE-ConnectionGUID: 4IfJCuIgTfa7eSnYVENcyw==
X-CSE-MsgGUID: jiBgOoSDRHWZgCD2Uct1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="203988727"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 14 Aug 2025 09:43:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umb2s-000B9c-2G;
	Thu, 14 Aug 2025 16:43:18 +0000
Date: Fri, 15 Aug 2025 00:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] arch/arm64/kernel/bpf-rvi.c:8:6:
 warning: no previous prototype for function 'bpf_arm64_cpu_have_feature'
Message-ID: <202508150054.NTqDP4S0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: 225346eb8c1a1c9cc44f816da80a5c12a0e93cba [2679/2679] bpf-rvi: arm64: Add bpf_arm64_cpu_have_feature() kfunc
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150054.NTqDP4S0-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150054.NTqDP4S0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150054.NTqDP4S0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/bpf-rvi.c:8:6: warning: no previous prototype for function 'bpf_arm64_cpu_have_feature' [-Wmissing-prototypes]
       8 | bool bpf_arm64_cpu_have_feature(unsigned int num)
         |      ^
   arch/arm64/kernel/bpf-rvi.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
       8 | bool bpf_arm64_cpu_have_feature(unsigned int num)
         | ^
         | static 
   1 warning generated.


vim +/bpf_arm64_cpu_have_feature +8 arch/arm64/kernel/bpf-rvi.c

     7	
   > 8	bool bpf_arm64_cpu_have_feature(unsigned int num)
     9	{
    10		return cpu_have_feature(num);
    11	}
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
