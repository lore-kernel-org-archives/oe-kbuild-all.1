Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E547710C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 06:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726035216; cv=none; b=mNieZqMc3vmxPEQs/J/zQV05Z/yEnl5A03O9qP/3lNkblAAb8a+t8qJq+DT8MDg8LdysQcZhig74GE4ygAEkgyN1PXT0n8L1L1nYwU85Od4YuyMbwKJJEGcbPIRurjT1QsQNHFKo5MzNafsTLmQuWPoQSxRIq92ZNWCygD8x1aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726035216; c=relaxed/simple;
	bh=MjOwZTadN6AEMjLqRCgqphlompsoPP+9TZHvLGxOpqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uwWkIlloSIh7fFM8YTviSwkbIhiIGQ9YsORAjsm+qGDjxOSgEHl27kWq2kDrLqB843odU0pzoc5kVit16Y3Jm81ztsV2W0hQXx8lJZ+qRYuXdpPeJzG/QtJYbKgID1d0Uv3Lwuh09doUEsVfcD7IlVCWBmemkoyTjroy4O3/l+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZAWBt11; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZAWBt11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726035215; x=1757571215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MjOwZTadN6AEMjLqRCgqphlompsoPP+9TZHvLGxOpqs=;
  b=EZAWBt11w27uv+3VM5wByg7iHDa/s6er+DypwiOJJHmwlJZmYBqIWYY4
   Mr57Bwu0Jx3FCiVFuyuJWzxmUAZJrLsVk6gXkCpRUtwwep4IoE1sKi1r6
   DRMOqFSyPvAF2sjTZCJszXcOEHQ5k0iZ7yVkEXLUW6Yuzmk68AzSHQp/L
   MUsTfMQWi4cmRdEOSoINWxMPk9wS3K0QU/POEsNGZ6Hy1hoJWp/1ljQde
   FrurLwIA6iRoVLu45aoHOQuIAL4wNDtS75wWR9jnMuNhNKrjCe026P02b
   WIV/VBL40E00yy+FEC/KKct0PayMjLJGKCqSWQ9egsUhOiaCKemhI/N8M
   w==;
X-CSE-ConnectionGUID: ccwR5cJ2R+COkFROSn079w==
X-CSE-MsgGUID: v13Uk/cPQBqPDcggZEDttQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35385172"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="35385172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 23:13:34 -0700
X-CSE-ConnectionGUID: tTtACrgkRpe+gIKr68ruSQ==
X-CSE-MsgGUID: TvcNHM+ORUaT+aQA3IMAVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="104732440"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Sep 2024 23:13:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soGba-00037C-1g;
	Wed, 11 Sep 2024 06:13:30 +0000
Date: Wed, 11 Sep 2024 14:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 11/11] include/linux/kern_levels.h:5:25:
 warning: format '%u' expects argument of type 'unsigned int', but argument 2
 has type 'off_t' {aka 'long int'}
Message-ID: <202409111439.h2PdYDP9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   79e909153c0a5ac21c2c5c0d4eac9229b3408178
commit: 79e909153c0a5ac21c2c5c0d4eac9229b3408178 [11/11] keys: asymmetric: Add tpm2_key_ecdsa
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240911/202409111439.h2PdYDP9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111439.h2PdYDP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111439.h2PdYDP9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/crypto/akcipher.h:11,
                    from crypto/asymmetric_keys/tpm2_key_ecdsa.c:9:
   crypto/asymmetric_keys/tpm2_key_ecdsa.c: In function 'tpm2_key_ecdsa_sign':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'off_t' {aka 'long int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:222:17: note: in expansion of macro 'pr_warn'
     222 |                 pr_warn("offset=%u\n", offset);
         |                 ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'off_t' {aka 'long int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:232:17: note: in expansion of macro 'pr_warn'
     232 |                 pr_warn("offset=%u\n", offset);
         |                 ^~~~~~~


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
