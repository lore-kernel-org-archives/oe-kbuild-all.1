Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE693EBF3A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769238124; cv=none; b=dBT2Ttg9JoCf0BpQJWVGVp124j4QdQIIcMTgd2xd2DEPVscczRD50rneH7YiEFpk/3gCRTYYMWuc/BFbu7+Au1KKFubOqVgCu4dUpbpuBZ+TyZfKNnACsiR8G4Mnv5yPWt+551hobWK2zcmpIzwoRmCDBgHJZ43PwSaiF+DST1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769238124; c=relaxed/simple;
	bh=C3sxYEdCFnIA+L+SBKRLslddW+S6TF07cVoqAYZ1deo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tTk6Vio0aiJ4SMl94JK2bDG97690OkPrQHS2hS42IV2qORV6a8rQPmveFRS36LGI5ui42/QVGIPLxNRWerdWNSXbR8iOiY3MMVfptpMAqoeY/0iybINvq0dkt4QiTdC9FxHI+Z3FwpjlA9/5EIY0osbxvDdX7fMms6OAS3p+h0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJ1kfUYn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJ1kfUYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769238121; x=1800774121;
  h=date:from:to:cc:subject:message-id;
  bh=C3sxYEdCFnIA+L+SBKRLslddW+S6TF07cVoqAYZ1deo=;
  b=IJ1kfUYnolElyS6PvEIj2PPvVXak9pIc0x+YQQIwURXaZ2qqQMFFyewE
   /ClSYs5G9yRwhjabKTi8z+KFl3WzRJXHWMury/jR1xBrogBD/Njym40Nz
   2fzkeipjfHDx87TlISBtWhEOlZ4aaZKRQ6wf9QrUCE5+O5TOhp/1wNz6c
   6WegwnLVk2uIL1OyZqbzfqsJwsaQ6LP3joF9+s7H/zDEbcBq7HT9I1jtQ
   aEpr0eOZi9mWw+Zp4Pi/x4OuY53cUrw0qz83L+fSDo5ysejkMS8K7L8E0
   2gcZF9oFze/iBQpp8quPyEWcImUKeHVAywj3dQLvAfVX8dMmNcLfi7kO/
   Q==;
X-CSE-ConnectionGUID: pH8K1K/mRoKyT6cErDM9YA==
X-CSE-MsgGUID: HuxTwLfWRYqBJ26gsceqTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74113690"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="74113690"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 23:02:01 -0800
X-CSE-ConnectionGUID: cJzUD5BITZK4quHZnEZSow==
X-CSE-MsgGUID: UonIZ9g/R/aBoYIIpYNG7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="238468463"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jan 2026 23:01:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjXee-00000000Uyw-0Jqn;
	Sat, 24 Jan 2026 07:01:56 +0000
Date: Sat, 24 Jan 2026 15:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/finalize_cpu_caps 12/12]
 include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 2 has type 'unsigned int'
Message-ID: <202601241436.NLMYL1C4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/finalize_cpu_caps
head:   69c68b30b26eaa72b38bd9150f5cecf45fe2ab8b
commit: 69c68b30b26eaa72b38bd9150f5cecf45fe2ab8b [12/12] KVM: VMX: Print out "bad" offsets+value on VMCS config mismatch
config: i386-buildonly-randconfig-005-20260124 (https://download.01.org/0day-ci/archive/20260124/202601241436.NLMYL1C4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241436.NLMYL1C4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241436.NLMYL1C4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from arch/x86/kvm/vmx/vmx.c:17:
   arch/x86/kvm/vmx/vmx.c: In function 'vmx_check_processor_compat':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:597:9: note: in expansion of macro 'printk'
     597 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:24:25: note: in expansion of macro 'KERN_SOH'
      24 | #define KERN_CONT       KERN_SOH "c"
         |                         ^~~~~~~~
   include/linux/printk.h:597:16: note: in expansion of macro 'KERN_CONT'
     597 |         printk(KERN_CONT fmt, ##__VA_ARGS__)
         |                ^~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:2978:25: note: in expansion of macro 'pr_cont'
    2978 |                         pr_cont("  Offset %lu REF = 0x%08x, CPU%u = 0x%08x, mismatch = 0x%08x\n",
         |                         ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
