Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517063;
	b=uaAQghRnXYeBl9ON3g2nVHNjeHZkTVc9IZF1tEDv+TfWudyxmkkQaXNZl8g0CCw/sT+6
	 6s9nXSopifzGzUQbvLOHlPTRcVh4LiRmIDmmc1x/e2UOfKBukHK7KVZmxLbyUxqavXJKB
	 ygDQZUYBFENCiHWjXf1fhrEHa7DS/BauM9FE+QNrmjJpBHl+nrRylb+ENxcORht6CH4MR
	 mHR2tI3EhdrdvjOx2Q3decTRuKjCarreU5zkPaegcfkJhbWTn3MoD6unTgezgV+SOWcSS
	 UxLMpN03iWDDEcOGZSRlAljsOVV9GLRtzyQxl7B+aGEk+5/dt+cIHpgMSIaFvjCoHzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=OcyHIvMWLrUa4KK+VdNUHpsKMfih4qc5dSOv0YpThFg=;
	b=BSjL3TRlUp9+1ea5vBxioXH3HcYGaHsumCiSc6T4HIb+suTVbTW4l+risJMM8ALARz+8
	 Ih/hYzGOtZpYllPJtnwgb31w8y6X8PHHchayqNToNpZDl/PGKq3OoEDzssLCvp9tuoZhk
	 fNucJrKa4ymlM1yN7NkOYdGovsPCBa2mZZ2QuEiEn1BoXqvA5P1gXVtksbFdDRrJ0EBlb
	 JoFO2z9O3JKro0FDes8DtYQevk9FvnVA2CKNV+UPpdL/4CVKM+MC+oOhe9bLKLdO7YoDu
	 QfAGUSSVBVd1rFvrQIQTwGsGdhec4wIUSa57N4uaSDHyrkns8Ih5+Hu9axDq1+gU/bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFLtbaA9;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4E4606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 17:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kFLtbaA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792517063; x=1824053063;
  h=date:from:to:cc:subject:message-id;
  bh=1CksXo1bkTCkUPk7LUDbYlv/P1k9O+d3RUeBVDFo9Jw=;
  b=kFLtbaA9ZD3kYRhh5mclrvu9CBwQhTpW3x3yUR+4Ksk4oKRTUv63+H1W
   orBZ7HvRpICgb21+rnlMDR3C5k11WskDC+T9jMdz/GD/n6oTosnGF8uG0
   mhlNp3r56BBNITFmSnYgNn81qKjgQmnDU2/IGNyQQBImVvCpx+LooGzoH
   taIeDtkLcnh0EibfXcD8EcPr6c7lbISxG0BI7Q5wgXFe9ZvP4ziMFDFy8
   Iuw2mAEarlVbQ7/WNBarDDKSq1k4K+YhX/HabFSU7wztQVOJ6z1IKKMw1
   khkaXm9bDeYNZtQQwFs5xEPu1I8Om6fJVkzN7W88GTG4lUM8vdFXkKEbu
   Q==;
X-CSE-ConnectionGUID: 1bqWhTtGRVaeTwg/0IfEng==
X-CSE-MsgGUID: 9vBqrFmBT9O2peUkMORPSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1238119"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1238119"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 10:24:22 -0700
X-CSE-ConnectionGUID: hC4Qiuj+SheTEU9JnUY3lw==
X-CSE-MsgGUID: 55nnabaAQgGEHXBBSDCZHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2872111"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 20 Oct 2026 10:24:21 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJDZT-000000006Oj-0EhP;
	Tue, 20 Oct 2026 17:24:19 +0000
Date: Tue, 20 Oct 2026 19:23:25 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss-2026-10-19 16/24]
 arch/x86/include/asm/thread_info.h:237:6: warning: no previous prototype for
 'arch_kernel_shstk_enabled'
Message-ID: <202610201945.gXEriidq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss-2026-10-19
head:   b28e7d03a8472efab137c77cbb5dd666fa08e9a7
commit: 967449663fb3eb7dcca67c4652293712530809c8 [16/24] arch-shadow-stacks-enabled
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20261020/202610201945.gXEriidq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201945.gXEriidq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201945.gXEriidq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:62,
                    from include/linux/smp.h:118,
                    from include/linux/interrupt_rc.h:17,
                    from include/linux/spinlock.h:60,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> arch/x86/include/asm/thread_info.h:237:6: warning: no previous prototype for 'arch_kernel_shstk_enabled' [-Wmissing-prototypes]
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h:237:20: error: redefinition of 'arch_kernel_shstk_enabled'
     237 | static inline bool arch_kernel_shstk_enabled(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:237:6: note: previous definition of 'arch_kernel_shstk_enabled' with type 'bool(void)' {aka '_Bool(void)'}
     237 | bool arch_kernel_shstk_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/arch_kernel_shstk_enabled +237 arch/x86/include/asm/thread_info.h

   236	
 > 237	bool arch_kernel_shstk_enabled(void)
   238	{
   239		return cpu_feature_enabled(X86_FEATURE_KERN_SHSTK);
   240	}
   241	#define arch_init_thread_stacks arch_init_thread_stacks
   242	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
