Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6141581F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743335854; cv=none; b=Qf7/yVSx5Ofa+6wg6f34AlPgwmuWgyThs2waFn0sNQgiuJl1JYfM8jPh2qsQPppYcIVFrGWsrqrYOBClfkb5S6zcpsMjx6FcyPfbhw+x3+THjl0CiaH6fnUdznYPpUtXrqRzY+9+68wwdiomVcPw/ZzGjzS8XhU5gPR0KKUprZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743335854; c=relaxed/simple;
	bh=kxxPmyfvQFiOXK8FMgNPkT37QJgAQR0/zYA/RGe5fig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emSB0CNVdGnHsp0IK9EvVy3pCNOHuKk4s1DAA0di1xlr2uSlfPvXolV6F/Izr99Ua2E8OqdPphmMgPA4gRUoRkbJ9wk+IAE+judpF1F+eDuNuDQvkn8yMRuWVl33dqKxT765OhwWDpQ6BNdR8k/jkRzQ7BLGG3xwxwf0QfL1AyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Va+M3IBX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Va+M3IBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743335852; x=1774871852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kxxPmyfvQFiOXK8FMgNPkT37QJgAQR0/zYA/RGe5fig=;
  b=Va+M3IBXhYDxj7uVCiXw1KtSd4eWCx4ONIMjvnMxvJ7vSph00+2MdzQz
   c27SIAArLROFFTIMNWriKbSQpK8pDDgDZCu+HEXmTT3cPgM32TRJsGdBI
   E+rl2JOh8ZzvtgIENEnr2dEPfXoiW4UaF53XLbtrJGXMe7LJeJJ4TRtt/
   7YAaKkhG6mqrCa2+pT1nO96PjbCErJojHAqRgQ2KRZuVWxljWplNkIuzu
   c5zXdEn3VZnuDOv7S5d8szpzb1omtQGKVpdLpxODLS0iBGu+gFgInPgZz
   VlIURjE85NazXVCKs6MjKNlQEoEL83hplP6cG7XfOxGqw9MA8gruwZH0B
   g==;
X-CSE-ConnectionGUID: EFiHxmU0RQq+ytLNkxYuRw==
X-CSE-MsgGUID: qFgiivPBTLGANzDgZh/o9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44524953"
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; 
   d="scan'208";a="44524953"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 04:57:31 -0700
X-CSE-ConnectionGUID: UxfFZ5H/QCmdlWGMonPMqg==
X-CSE-MsgGUID: 6fY7t3RhRSy8nyk/jjpsBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,288,1736841600"; 
   d="scan'208";a="129988452"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Mar 2025 04:57:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyrI0-0008gK-2q;
	Sun, 30 Mar 2025 11:57:23 +0000
Date: Sun, 30 Mar 2025 19:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1531/1531] mm/swapfile.o: warning:
 objtool: free_swap_and_cache()+0x10f: unreachable instruction
Message-ID: <202503301931.DQUjzVBe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: 9b3ba7800bc02ca4f0e62d79b32edc22e24ca926 [1531/1531] mm: swap: fix race between free_swap_and_cache() and swapoff()
config: x86_64-buildonly-randconfig-005-20250329 (https://download.01.org/0day-ci/archive/20250330/202503301931.DQUjzVBe-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301931.DQUjzVBe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301931.DQUjzVBe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/swapfile.c:11:
   In file included from include/linux/hugetlb.h:45:
   include/linux/mempolicy.h:329:13: warning: unused function '__do_mbind' [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   1 warning generated.
>> mm/swapfile.o: warning: objtool: free_swap_and_cache()+0x10f: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
