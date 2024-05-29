Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4116316C440
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 08:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971392; cv=none; b=P9MYphS/yTYPuIdVxn08x3l3m+O4W43wGQfmQG/m/bESvCiF3UVROMZhlSYetNd5hHkAuQuDALx31IMXL96dCy4vth7odjGzsaYPPWWPZVBA605q1oUlMpWlCSYQ0SOyAaOX+DDIPVV+llCSZHdUWaIQeuOAPpozuiQijiERcRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971392; c=relaxed/simple;
	bh=1/N6yXRCPUIo5hq3zHiSDJp6c40qekc4UlJRviG95Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moVJh1jWcf3HYBj7Y+WyV48NUGosaJKVBbPGq0Cx0fTFlgYLFlnuSO/p6ATZ8IC7Oe1e+rPeAv6/OiHk16Mj6STVq3yuFYaUzceiKfgwbxzNLao7L7xtu8F8ysPz9W4o3mPD5LlBZEGYA75c4D6LlYnNYeAkPEKlMqI38/vTMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHIrYb6G; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHIrYb6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716971390; x=1748507390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/N6yXRCPUIo5hq3zHiSDJp6c40qekc4UlJRviG95Mo=;
  b=KHIrYb6GOBD01wzepMR6t326s1rOwEQnwgWn+HYXnObolCWmBCPkII2n
   xAS6saxLUPmwDfcqKvs98lN/BA/naYLpyob8Ant/Sc8QOfIg2fJaTUacI
   yg82gTw8k/KhNStnWWuRSXFeKXEnfTRLz06TX1R+RfUekYAXIwdPMP9Uu
   xrvTCqf1vALEa14mGi3IrcJaTpulgWhgF/6p6DqJr4+hzFt41jrlsg0oi
   wMfM9yWvcwNdaZvvNGtlBZ3ZjV20m0f3vYDLfcC7wcW8kLrUtOA/ZrrqE
   3ndDTflvesCMiq+xhMcUGQl3oEbFFUguB1QJsjCzcOPkn0qA7QZv9XFeC
   g==;
X-CSE-ConnectionGUID: vvFZo/SbRFqnKnQwvXH0eQ==
X-CSE-MsgGUID: p14z8uG+RcqDLsTqBjw5AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17197670"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="17197670"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 01:29:49 -0700
X-CSE-ConnectionGUID: s0ixnGOPQ9CAu83WGMCzpA==
X-CSE-MsgGUID: TugGYjwiRiGOmnJJYJBuQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="40198756"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2024 01:29:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCEgr-000DKl-28;
	Wed, 29 May 2024 08:29:45 +0000
Date: Wed, 29 May 2024 16:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v7 9/9] include/linux/kern_levels.h:5:25:
 warning: format '%u' expects argument of type 'unsigned int', but argument 2
 has type 'off_t' {aka 'long int'}
Message-ID: <202405291640.VwxqAhNG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v7
head:   892305fec7841bf841a9c19e01c999c5f4b4e831
commit: 892305fec7841bf841a9c19e01c999c5f4b4e831 [9/9] keys: asymmetric: Add tpm2_key_ecdsa
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240529/202405291640.VwxqAhNG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291640.VwxqAhNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291640.VwxqAhNG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/akcipher.h:12,
                    from crypto/asymmetric_keys/tpm2_key_ecdsa.c:9:
   crypto/asymmetric_keys/tpm2_key_ecdsa.c: In function 'tpm2_key_ecdsa_sign':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'off_t' {aka 'long int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:517:9: note: in expansion of macro 'printk'
     517 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:517:16: note: in expansion of macro 'KERN_WARNING'
     517 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:222:17: note: in expansion of macro 'pr_warn'
     222 |                 pr_warn("offset=%u\n", offset);
         |                 ^~~~~~~
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 2 has type 'off_t' {aka 'long int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:436:25: note: in definition of macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:517:9: note: in expansion of macro 'printk'
     517 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:517:16: note: in expansion of macro 'KERN_WARNING'
     517 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:232:17: note: in expansion of macro 'pr_warn'
     232 |                 pr_warn("offset=%u\n", offset);
         |                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
