Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983121570B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708101; cv=none; b=P8pnuCbqj7MpSv8eM2+Wyr/YKkN66VraSz5le7HGTBn8gbcau5uINk+4jq6WyBeM8FB6vL2YQWfr45MKkeifE96SSL/ZSpahldcNsBMIxs7MuKlFml2j7YPzWmXq/GLf7jzWNsy/nOiJrdpg3tn5uDjhUbjuQAz/+tbVBqDDgj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708101; c=relaxed/simple;
	bh=eF1ttju0QlX5yiWFPgITWEqcRTrvhAoNF/tNVsETFmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N4AonXRf1o39bYgX3IdpD+MuhqURGAPgHzCM5WBSzja2lt1i2Irtetafd+VzxxHc8tRLODrW+3dJSqN/naXJJ5xol6flz/QyweUHfYcqrMyW9FBJgGdjLwXK8YXW/q1+/QXddptLpqODQ2AR6IqIfsnvbAfvYx+IH62w3xS5xaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQH62dJG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQH62dJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734708099; x=1766244099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eF1ttju0QlX5yiWFPgITWEqcRTrvhAoNF/tNVsETFmI=;
  b=UQH62dJGZd3PWoROeH2XZOmSICbHt88JbMU1QZMYDPBzJ7ycVh+gvwhU
   wRvJRP9ifvzTiOmF9L32BiUQ+HTwCCy9kO/UaeVNofGe0n8Sp2rs0FFKQ
   JSh79aIpf6DRI4Sy8QSNlYIueV8Rmu9BHYduVWgme954IRQuRoVAU8Aen
   /qmQR0kgLikl1vTAUKY6AG36a/Cl/hHciLAa9vHtdLHcKaddFGJQUItZl
   yvfuLekf8uu8pqzv73pq6JIWHyuLr42G4tTkdLJd9aNASwOJBWwy5HQDM
   lHPNxYhF8DQOKBl2kI7KuIXP5lnpG1Kc+4XGUCmweKgP13tUdvHIwhLjc
   A==;
X-CSE-ConnectionGUID: elSlNeEdSmeIdfEYO2BgFQ==
X-CSE-MsgGUID: 7KKGUr0mTRmvwjP9lNmOlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45863602"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="45863602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 07:21:39 -0800
X-CSE-ConnectionGUID: 9erxVSgbS2CzQd38VcOABQ==
X-CSE-MsgGUID: cYj8SGvkT6OKZ9KAPDaj7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98735014"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2024 07:21:38 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOeoq-0001KD-05;
	Fri, 20 Dec 2024 15:21:36 +0000
Date: Fri, 20 Dec 2024 23:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2594/2594] fs/f2fs/file.o: warning: objtool:
 fill_zero()+0x583: unreachable instruction
Message-ID: <202412202335.VSfnWHmY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e804413fbbd504bc7b5b84dc7b86307f2b127a83
commit: fe0aed0230fbd8246fb028d126548fa69b4f9bf4 [2594/2594] mm: hugetlb: free the 2nd vmemmap page associated with each HugeTLB page
config: x86_64-buildonly-randconfig-006-20241219 (https://download.01.org/0day-ci/archive/20241220/202412202335.VSfnWHmY-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202335.VSfnWHmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202335.VSfnWHmY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/file.o: warning: objtool: fill_zero()+0x583: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
