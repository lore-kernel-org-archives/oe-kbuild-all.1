Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C990715B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 00:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719363564; cv=none; b=teMitVxHHTdQreKgRCt3k5S3JPG+wuKxsisjvSZGSCGSy+ayJD0qOquUmUJjsnxPWpcRZJ+siEa+4Z5YJvmWOfBwvm49oDxtkr2LlOS3+v01jMG25t16dgPRzHwpBndCujdlpYmWrEWjmG/K8zyTZRQRm5pqQhFfHRDwgRZ5hUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719363564; c=relaxed/simple;
	bh=s/ibK2QeJ7oTz48E59DL71I9DousxuEFFP4DyX5K61s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/yHcwLfvfyAz4z8TqFTq7PQvsfQE4jDBfHQKB0GUMpIjmMaOruRhQfs4S4Jw9Mj8DIFe7CxEa06aRoWa1QakYx2Ir+WMM6Q5zjwTJ1nHgpqK7wpGl/J6cZScD7i28ZAVgnLyvHE6PqRWquS4lN8O3wA+V3+gs7hQ6PRPPOWd5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C8PhWj8v; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C8PhWj8v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719363564; x=1750899564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s/ibK2QeJ7oTz48E59DL71I9DousxuEFFP4DyX5K61s=;
  b=C8PhWj8vdNwANxvtBempCZkdy8rORg6R2QUXpQHLmkmij4ElWfgge4OI
   EvTcbum5h8VJKDEJW08BUGjv/Y92j4cTQxLXDPacwUbTKlXuqt+hbZ1uh
   jvrV2Q1F1E+wWYahaDuDSnNx8yu5Va0FdawquKS6fp4JSoVh0Ihv1mCG2
   T6PPa/EMJjB7WS17e12v+qAPO6bW38AvpbGbdGlmmv1r/LDpS23l2niNP
   oChSTjJiWY8LqyQILuZgl+95of+BvhO3UEs4dknYGEv9q57JzTq5AMUlN
   u6S02VqltP6r6LkfGaq3KZdZP5t/TWRu34N8mUEJSpre+DNRSWi4rH9vm
   w==;
X-CSE-ConnectionGUID: JH9ZPv4zQNqVpjUpVNgTUg==
X-CSE-MsgGUID: 6wwBZS2HTQeYJxLILw5Row==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16240156"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="16240156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:59:09 -0700
X-CSE-ConnectionGUID: PwJXSTC/QWeIjaN3/nr85w==
X-CSE-MsgGUID: qwQ463bzQZuhnMHlZyujTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="81366230"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Jun 2024 17:59:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMH02-000ErM-38;
	Wed, 26 Jun 2024 00:59:02 +0000
Date: Wed, 26 Jun 2024 08:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
Cc: oe-kbuild-all@lists.linux.dev, atrajeev@linux.vnet.ibm.com,
	kjain@linux.ibm.com, christophe.leroy@csgroup.eu,
	Madhavan Srinivasan <maddy@linux.ibm.com>, npiggin@gmail.com,
	naveen.n.rao@linux.ibm.com, disgoel@linux.vnet.ibm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/3] powerpc/pseries: Export hardware trace macro dump
 via debugfs
Message-ID: <202406260849.z8VoytFS-lkp@intel.com>
References: <20240620174614.53751-2-maddy@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620174614.53751-2-maddy@linux.ibm.com>

Hi Madhavan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.10-rc5 next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-pseries-Export-hardware-trace-macro-dump-via-debugfs/20240625-144003
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240620174614.53751-2-maddy%40linux.ibm.com
patch subject: [PATCH 2/3] powerpc/pseries: Export hardware trace macro dump via debugfs
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240626/202406260849.z8VoytFS-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260849.z8VoytFS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260849.z8VoytFS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/pseries/htmdump.c:19:
>> arch/powerpc/include/asm/machdep.h:262:85: error: expected ')' before numeric constant
     262 | #define machine_device_initcall(mach, fn)       __define_machine_initcall(mach, fn, 6)
         |                                                                                     ^
   arch/powerpc/include/asm/machdep.h:248:61: note: in definition of macro '__define_machine_initcall'
     248 |         __define_initcall(__machine_initcall_##mach##_##fn, id);
         |                                                             ^~
   arch/powerpc/platforms/pseries/htmdump.c:130:1: note: in expansion of macro 'machine_device_initcall'
     130 | machine_device_initcall(pseries, htmdump_init);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/machdep.h:244:27: warning: '__machine_initcall_pseries_htmdump_init' defined but not used [-Wunused-function]
     244 |         static int __init __machine_initcall_##mach##_##fn(void) { \
         |                           ^~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/machdep.h:262:49: note: in expansion of macro '__define_machine_initcall'
     262 | #define machine_device_initcall(mach, fn)       __define_machine_initcall(mach, fn, 6)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/platforms/pseries/htmdump.c:130:1: note: in expansion of macro 'machine_device_initcall'
     130 | machine_device_initcall(pseries, htmdump_init);
         | ^~~~~~~~~~~~~~~~~~~~~~~


vim +262 arch/powerpc/include/asm/machdep.h

^1da177e4c3f41 include/asm-ppc64/machdep.h        Linus Torvalds   2005-04-16  242  
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  243  #define __define_machine_initcall(mach, fn, id) \
800d68c3aa0dc3 include/asm-powerpc/machdep.h      Grant Likely     2007-12-02 @244  	static int __init __machine_initcall_##mach##_##fn(void) { \
800d68c3aa0dc3 include/asm-powerpc/machdep.h      Grant Likely     2007-12-02  245  		if (machine_is(mach)) return fn(); \
800d68c3aa0dc3 include/asm-powerpc/machdep.h      Grant Likely     2007-12-02  246  		return 0; \
800d68c3aa0dc3 include/asm-powerpc/machdep.h      Grant Likely     2007-12-02  247  	} \
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  248  	__define_initcall(__machine_initcall_##mach##_##fn, id);
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  249  
8d3c941e240ba2 arch/powerpc/include/asm/machdep.h Michael Ellerman 2014-07-15  250  #define machine_early_initcall(mach, fn)	__define_machine_initcall(mach, fn, early)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  251  #define machine_core_initcall(mach, fn)		__define_machine_initcall(mach, fn, 1)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  252  #define machine_core_initcall_sync(mach, fn)	__define_machine_initcall(mach, fn, 1s)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  253  #define machine_postcore_initcall(mach, fn)	__define_machine_initcall(mach, fn, 2)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  254  #define machine_postcore_initcall_sync(mach, fn)	__define_machine_initcall(mach, fn, 2s)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  255  #define machine_arch_initcall(mach, fn)		__define_machine_initcall(mach, fn, 3)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  256  #define machine_arch_initcall_sync(mach, fn)	__define_machine_initcall(mach, fn, 3s)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  257  #define machine_subsys_initcall(mach, fn)	__define_machine_initcall(mach, fn, 4)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  258  #define machine_subsys_initcall_sync(mach, fn)	__define_machine_initcall(mach, fn, 4s)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  259  #define machine_fs_initcall(mach, fn)		__define_machine_initcall(mach, fn, 5)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  260  #define machine_fs_initcall_sync(mach, fn)	__define_machine_initcall(mach, fn, 5s)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  261  #define machine_rootfs_initcall(mach, fn)	__define_machine_initcall(mach, fn, rootfs)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17 @262  #define machine_device_initcall(mach, fn)	__define_machine_initcall(mach, fn, 6)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  263  #define machine_device_initcall_sync(mach, fn)	__define_machine_initcall(mach, fn, 6s)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  264  #define machine_late_initcall(mach, fn)		__define_machine_initcall(mach, fn, 7)
7929d407e47fbf arch/powerpc/include/asm/machdep.h Matthew Leach    2012-12-17  265  #define machine_late_initcall_sync(mach, fn)	__define_machine_initcall(mach, fn, 7s)
800d68c3aa0dc3 include/asm-powerpc/machdep.h      Grant Likely     2007-12-02  266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
