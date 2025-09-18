Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D303E34BA44
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Sep 2025 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187059; cv=none; b=qdrpITKI24cx5rEnBmaQvQpsK1I+r/qMEapojhMxJTiSfYXzs7bX+NUDYPPcUCONs92p+Kp5M6hBs5cxohEsxguCmXTHb0HeCXaoAdGzLUc+a0zzxNHv/tllPaPtNthLhGFOtp6xlRIn/Xd2qLZDcaC7seqVpWy1iQ9WyE13nP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187059; c=relaxed/simple;
	bh=1XGrRsFQ9ERXYKm/QZ2gwur79EgKAKAfp4/4DQCCJf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbL1UQ7IiZ8j2/0+4TELD+7qClcq9vnKc31qOpWHjKQrc2vuUtxA32IcUtsUecWaE5oqBpf88Os5PjunYdzDEU0raykccn4/fB54wMPwnLmjETvm3B7wGtvbVYkxuZ4uwsHWobMwfysIYFmAGbAPnHDM3eMXG2ScxdzmfDzjBL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfAuWKv5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfAuWKv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758187058; x=1789723058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1XGrRsFQ9ERXYKm/QZ2gwur79EgKAKAfp4/4DQCCJf0=;
  b=IfAuWKv54nSuBrQSPIQTQmi9lr8UTYvH82BxibzXPFUYJallzQm4a2nG
   LluESCcowJz7afzJ3rqgA+lMxF84BlH4cBvSwQ/pPsG59sEDnwyA5Zfki
   WuTNqQ0ajUbc1V6+00PN/UCc6VOY3EY+fPOOYxKbnKusLnaBZiM6WYfte
   2COIoiSTybMK42z8FQDCn2LyMw5EnDdIDsyitvd4xuMD9ZpDLTl6H4mcB
   h50BJVhyoYulQPS1x0dwrG/M6+0L5TpM8Ht44+3qYUHNHZn3EAldGc6YA
   bkd85tMF+GjwsMp9fQVb5UueZAKvpCH1RkLi6IMtckQS/Zy6TrWLKa7mL
   w==;
X-CSE-ConnectionGUID: tBUJOjLVSsG8dYjwhHDikg==
X-CSE-MsgGUID: UQIBleJxSy6Zqy/40q3Pzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60398981"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="60398981"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 02:17:37 -0700
X-CSE-ConnectionGUID: A/8wnMzIRDqnZhV+/ypsAA==
X-CSE-MsgGUID: /fcOSJDuSFycdIriVHGwKw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Sep 2025 02:17:36 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzAli-000319-0C;
	Thu, 18 Sep 2025 09:17:34 +0000
Date: Thu, 18 Sep 2025 17:17:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Miu <jasonmiu@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 3/4] memblock: Remove KHO notifier usage
Message-ID: <202509181745.plMVUiRz-lkp@intel.com>
References: <20250917025019.1585041-4-jasonmiu@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917025019.1585041-4-jasonmiu@google.com>

Hi Jason,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rppt-memblock/for-next]
[also build test WARNING on linus/master v6.17-rc6 next-20250917]
[cannot apply to rppt-memblock/fixes akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Miu/kho-Introduce-KHO-page-table-data-structures/20250917-105117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
patch link:    https://lore.kernel.org/r/20250917025019.1585041-4-jasonmiu%40google.com
patch subject: [RFC v1 3/4] memblock: Remove KHO notifier usage
config: riscv-randconfig-002-20250918 (https://download.01.org/0day-ci/archive/20250918/202509181745.plMVUiRz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181745.plMVUiRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181745.plMVUiRz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from mm/memblock.c:11:
>> arch/riscv/include/asm/page.h:99: warning: "ARCH_PFN_OFFSET" redefined
      99 | #define ARCH_PFN_OFFSET  (PFN_DOWN((unsigned long)phys_ram_base))
         | 
   In file included from mm/memblock.c:9:
   include/asm-generic/memory_model.h:15: note: this is the location of the previous definition
      15 | #define ARCH_PFN_OFFSET  (0UL)
         | 


vim +/ARCH_PFN_OFFSET +99 arch/riscv/include/asm/page.h

3335068f87217ea Alexandre Ghiti 2023-03-24   98  
a7407a1318a9d7b Alexandre Ghiti 2023-03-24  @99  #define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
07037db5d479f90 Palmer Dabbelt  2017-07-10  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
