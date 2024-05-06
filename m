Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1864F15666D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 16:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715013259; cv=none; b=dyjHYr8IiGV7m6f9FpWuhoZGp5IcViYTOrhZYLWJoiNhrfC8Yptkm87w96jqzOji7qszX/VeAn7wjoqp3Kb2/SVrU5UG72mfc/kymLxhK1nYpT5eNM7hWkAljiOP3KCN8ouEiR4R+wDqcrJ316pCJhP6E6h7S8cUOsVsU2Oz6W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715013259; c=relaxed/simple;
	bh=3YJG9sSQwDs1pNDbzUyMW1cQ7vHDglQHiFDcg5cidMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g4uwfUyEzO1HexNJ2vfXUGOxtBd6TKTX0Tb2ErKd/z1s5B4iaOclP2Ta2l/5lqjEY528RxY67WFRGri+EDrYH3T2mDnDlpbPlV+sRV+y8B3ZdkS3WcAp+LjT9b6vj7wFt9gHfUgOCrQpxMTdbeDuDF5CfOyR25KgWq7TpU1Xw/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgN+zENB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgN+zENB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715013257; x=1746549257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3YJG9sSQwDs1pNDbzUyMW1cQ7vHDglQHiFDcg5cidMM=;
  b=TgN+zENBkrmdtl2yRwN+zvMdt3ko1l7yYzO7j8OMfOJeoM1Z6UqzAAGP
   3o21mNs+c30rMfPh+rHEiIlD3GFATbi2Ph25E4uQZW4WQhbDBuTduJul0
   +sL+YYKBWerBmxR5Iqr3NKrf0BKoK5M8Cmsv/YlTc3d63v5Jfo0C6kvOJ
   assS4tr2U29B7+4ZdTLX0P5oWFqUHuuHVlE1ZNjZf+OieUHccMNUF005A
   CrGtcQmw/iVBIwo8QO4B05EwebFJPt2wS/gdhlebIFx5kSisAsH/97fWy
   pZTY7wYT95bVTNTfMHIp1kKemO6N+j55LjQC10sLjmKrqs64ynDOLDrQm
   w==;
X-CSE-ConnectionGUID: tIqW3bPMSEWfcZ4fB3HfCw==
X-CSE-MsgGUID: kD7lTXa5TkWyJjgpnlrszg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21444182"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="21444182"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 09:34:16 -0700
X-CSE-ConnectionGUID: U58L6fwfTq6Zi9NIMODJYw==
X-CSE-MsgGUID: 5QDMRwKAQTGeM+YaYBe6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="32708988"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 May 2024 09:34:14 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s41I4-0000nc-1a;
	Mon, 06 May 2024 16:34:12 +0000
Date: Tue, 7 May 2024 00:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:fns-removal 11/11] include/linux/cpumask.h:416:36: error:
 macro "for_each_cpu_andnot" requires 3 arguments, but only 2 given
Message-ID: <202405070023.PnTIOvo5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fns-removal
head:   2985d417a6ad2d864d53f69743b601ce51e36c6d
commit: 2985d417a6ad2d864d53f69743b601ce51e36c6d [11/11] x86/resctrl: simplify cpumask_any_housekeeping()
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240507/202405070023.PnTIOvo5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070023.PnTIOvo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070023.PnTIOvo5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/sched.h:16,
                    from arch/openrisc/kernel/asm-offsets.c:23:
   include/linux/cpumask.h: In function 'cpumask_andnot_any_but':
>> include/linux/cpumask.h:416:36: error: macro "for_each_cpu_andnot" requires 3 arguments, but only 2 given
     416 |         for_each_cpu_andnot(i, mask)
         |                                    ^
   include/linux/cpumask.h:351: note: macro "for_each_cpu_andnot" defined here
     351 | #define for_each_cpu_andnot(cpu, mask1, mask2)                          \
         | 
>> include/linux/cpumask.h:416:9: error: 'for_each_cpu_andnot' undeclared (first use in this function)
     416 |         for_each_cpu_andnot(i, mask)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:416:9: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/cpumask.h:416:28: error: expected ';' before 'if'
     416 |         for_each_cpu_andnot(i, mask)
         |                            ^
         |                            ;
     417 |                 if (i != cpu)
         |                 ~~          
   make[3]: *** [scripts/Makefile.build:117: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/for_each_cpu_andnot +416 include/linux/cpumask.h

   400	
   401	/**
   402	 * cpumask_andnot_any_but - return a "random" in an intersection of cpumasks, but not this one.
   403	 * @mask1: the cpumask to search
   404	 * @mask2: the cpumask to search
   405	 * @cpu: the cpu to ignore.
   406	 *
   407	 * Often used to find any cpu but smp_processor_id() in a mask.
   408	 * Return: >= nr_cpu_ids if no cpus set.
   409	 */
   410	static inline
   411	unsigned int cpumask_andnot_any_but(const struct cpumask *mask1, const struct cpumask *mask2,
   412					unsigned int cpu)
   413	{
   414		unsigned int i;
   415	
 > 416		for_each_cpu_andnot(i, mask)
   417			if (i != cpu)
   418				break;
   419		return i;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
