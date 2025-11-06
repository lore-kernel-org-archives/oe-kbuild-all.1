Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56A345724
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762439910; cv=none; b=nH1EGRlOe50JTrOH4oUBNlzbCHM1ScQA1LM/Ne5YU5xDTIrU1WLQFQgHLzp1rodJ/2A3hhbdgHeNz1MjDJVc2Vfsle2UiH/9aatgHhreLkCjMnaLySu1Yf+LJQBVsQre+wU9GY3FxEtzLOngi9guYTGSyraUomMdBApxOZ82oxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762439910; c=relaxed/simple;
	bh=+75GKPCI5jNkPc6bb4WB2j4Mz3JYShSPvH/44slbqt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ab7Fv7dRK6OzdjjcuZ/1yLZa63An7+K/vvWl/y71sOEsTVxD/kp3B59tVPYeNbP6prMPVzv/o9G+5zv0cGOu8ErDCFe26eyHFdbmfxKEqgPVA+sgVyRrxdSk2MOhMeo6p2RKQIGfRyfqBDssNC3d1ZqJKv1KWj+rQkrT6nsb8dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzVjJi+L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzVjJi+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762439909; x=1793975909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+75GKPCI5jNkPc6bb4WB2j4Mz3JYShSPvH/44slbqt4=;
  b=JzVjJi+LHixsvto3sZ6RlM6/x6uxfIYnEODuMwx3/U9FvppKFfG79c9Q
   aVai1t16Df+blgJtdQatgOQ0bf207u+Mszd4NvdZ3ggRLmd+btUdyViZJ
   PtM0uaCa5K/4UvdFdWz8/cZd3sYZdp7fga4Et/UXitktkBpuou6bMKMvm
   7NxeIpepCpfYrk5R4EemStXfOlohU1YC9eEddfGfNc3j1oxQJivm+usLb
   OGYfGApt2J/M7JTIx0COdkirweY0CTiAlzgu8T5SiOxebZij9QmKTamid
   sONPWe1+1Aaelfc9UwNbCTdS6KVFhz8SfMRVH7lhiyO4KRoxxABjkF8f6
   A==;
X-CSE-ConnectionGUID: 09kJOCjlSD+GTRGfUJbCEg==
X-CSE-MsgGUID: 3qxKRpLIQgyO+f+SXze1cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63781805"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="63781805"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 06:38:28 -0800
X-CSE-ConnectionGUID: mtLqvztIR2+6pQQoTPF7Mg==
X-CSE-MsgGUID: ezPYJZsdQpq225RUv4XYxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187487529"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2025 06:38:24 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH182-000U1K-1F;
	Thu, 06 Nov 2025 14:38:22 +0000
Date: Thu, 6 Nov 2025 22:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>,
	kexec@lists.infradead.org
Subject: Re: [PATCH v6] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <202511062213.dHidoorr-lkp@intel.com>
References: <20251104132818.1724562-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104132818.1724562-1-sourabhjain@linux.ibm.com>

Hi Sourabh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.18-rc4 next-20251106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sourabh-Jain/powerpc-kdump-Add-support-for-crashkernel-CMA-reservation/20251104-213036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251104132818.1724562-1-sourabhjain%40linux.ibm.com
patch subject: [PATCH v6] powerpc/kdump: Add support for crashkernel CMA reservation
config: powerpc64-randconfig-r113-20251106 (https://download.01.org/0day-ci/archive/20251106/202511062213.dHidoorr-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511062213.dHidoorr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511062213.dHidoorr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kexec/core.c:62:20: sparse: sparse: symbol 'crashk_cma_size' was not declared. Should it be static?
   arch/powerpc/kexec/core.c:188:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long static [addressable] [toplevel] [usertype] crashk_base @@     got restricted __be64 [usertype] @@
   arch/powerpc/kexec/core.c:188:29: sparse:     expected unsigned long long static [addressable] [toplevel] [usertype] crashk_base
   arch/powerpc/kexec/core.c:188:29: sparse:     got restricted __be64 [usertype]
   arch/powerpc/kexec/core.c:190:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long static [addressable] [toplevel] [usertype] crashk_size @@     got restricted __be64 [usertype] @@
   arch/powerpc/kexec/core.c:190:29: sparse:     expected unsigned long long static [addressable] [toplevel] [usertype] crashk_size
   arch/powerpc/kexec/core.c:190:29: sparse:     got restricted __be64 [usertype]
   arch/powerpc/kexec/core.c:198:19: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long static [addressable] [toplevel] mem_limit @@     got restricted __be64 [usertype] @@
   arch/powerpc/kexec/core.c:198:19: sparse:     expected unsigned long long static [addressable] [toplevel] mem_limit
   arch/powerpc/kexec/core.c:198:19: sparse:     got restricted __be64 [usertype]
   arch/powerpc/kexec/core.c:214:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long static [addressable] [toplevel] [usertype] kernel_end @@     got restricted __be64 [usertype] @@
   arch/powerpc/kexec/core.c:214:20: sparse:     expected unsigned long long static [addressable] [toplevel] [usertype] kernel_end
   arch/powerpc/kexec/core.c:214:20: sparse:     got restricted __be64 [usertype]

vim +/crashk_cma_size +62 arch/powerpc/kexec/core.c

    61	
  > 62	unsigned long long crashk_cma_size;
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
