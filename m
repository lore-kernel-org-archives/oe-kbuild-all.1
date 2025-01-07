Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDC1EE035
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 16:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266394; cv=none; b=D6vBbR9caPooLu9qABu2v9IcpVApZpunOm/QcUWBLjc6r+1n+nUC2VmkchdugOcC52u/vKbnMbKgCIlTfgBc8A899AfKMAo17iqAED9hZ+X0RiRHptIQhXbELgFP0UdLYONK3aHu3V/w27bKumtFCB1sL3nj9yj61QT+0kDxQRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266394; c=relaxed/simple;
	bh=bEuxSZTopQma0nQKxLJHmd0knKfubTX5QVctn5Jmtsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lL+9hyiMZunO4c3+qIlg8g7tnGTZKpW/SISM7SyPG3hUHuYn2gsmqYZ8gAh9AYARVMABuNM6mFTnn1UcLUir/xqweFys/CJhoi3g8kcu569tsk+W8nbqsVmTIF2oqQyAy9zqnKtL8Et5+i/d85kup1bwitM0RBSTZf0+mHZvuwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtS3nhMJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtS3nhMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736266392; x=1767802392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bEuxSZTopQma0nQKxLJHmd0knKfubTX5QVctn5Jmtsc=;
  b=MtS3nhMJ18LZYx0nDp+xPV82oIeLM5+7i5m/EWg+ThuqQVKLR09rzuUR
   /r8Mqja8+QEbpIVX3JSUMjFZHl480mwFHklFryohQNkanLamC1qgis8x8
   uFy6TsMggQ333FTA2eGJmQtx9ol/uGLfo2MG5dqTXgLWJDT1VK9lmxyc7
   kNUvOBzKoxhDTMUKObg1GYpaBkTW8dDqTceby/KIx3pD+72UrAZ4Ms595
   1ugOv6YWsZ1eeSlvnuN/D4lLjHTymtNcrLmNNW7pp+sGP8bOpa6gIvJXP
   7cxkKiF1Bqd2oD8Y4Zbeuhl9BEyhv5I94XsMCHCfzM360xbOq5VwAdTNA
   A==;
X-CSE-ConnectionGUID: xPAes5sBTDCkgU6ztQ1How==
X-CSE-MsgGUID: ofjR0VKUSsGk5NgIcvGfhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36338962"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36338962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 08:13:11 -0800
X-CSE-ConnectionGUID: huWYl6ROTSu++EUMcM8TBQ==
X-CSE-MsgGUID: m6iZ1Kv1T2unW+6POvCXog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="103005871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2025 08:13:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVCCZ-000Ex7-0P;
	Tue, 07 Jan 2025 16:13:07 +0000
Date: Wed, 8 Jan 2025 00:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Perches <joe@perches.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/clocksource/sh_mtu2.c:343:27: warning: '%u' directive
 writing between 1 and 10 bytes into a region of size 3
Message-ID: <202501080036.LH3XAQK1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 79a4e91d1bb2a411a4ce2baa93680fa707567003 device.h: Add __cold to dev_<level> logging functions
date:   6 years ago
config: powerpc-buildonly-randconfig-r003-20220827 (https://download.01.org/0day-ci/archive/20250108/202501080036.LH3XAQK1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080036.LH3XAQK1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080036.LH3XAQK1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/slab.h:699:9: note: in expansion of macro 'if'
     699 |         if (unlikely(check_mul_overflow(n, size, &bytes)))
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/slab.h:699:13: note: in expansion of macro 'unlikely'
     699 |         if (unlikely(check_mul_overflow(n, size, &bytes)))
         |             ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/slab.h:699:9: note: in expansion of macro 'if'
     699 |         if (unlikely(check_mul_overflow(n, size, &bytes)))
         |         ^~
   arch/powerpc/include/asm/uaccess.h: In function 'clear_user':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   arch/powerpc/include/asm/uaccess.h:377:9: note: in expansion of macro 'if'
     377 |         if (likely(access_ok(addr, size)))
         |         ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/uaccess.h:377:13: note: in expansion of macro 'likely'
     377 |         if (likely(access_ok(addr, size)))
         |             ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   arch/powerpc/include/asm/uaccess.h:377:9: note: in expansion of macro 'if'
     377 |         if (likely(access_ok(addr, size)))
         |         ^~
   include/linux/uaccess.h: In function 'copy_from_user':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/uaccess.h:143:9: note: in expansion of macro 'if'
     143 |         if (likely(check_copy_size(to, n, false)))
         |         ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/uaccess.h:143:13: note: in expansion of macro 'likely'
     143 |         if (likely(check_copy_size(to, n, false)))
         |             ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/uaccess.h:143:9: note: in expansion of macro 'if'
     143 |         if (likely(check_copy_size(to, n, false)))
         |         ^~
   include/linux/uaccess.h: In function 'copy_to_user':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("\"_ftrace_annotated_branch\"")' because it conflicts with previous 'section ("\"_ftrace_branch\"")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/uaccess.h:151:9: note: in expansion of macro 'if'
     151 |         if (likely(check_copy_size(from, n, true)))
         |         ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/uaccess.h:151:13: note: in expansion of macro 'likely'
     151 |         if (likely(check_copy_size(from, n, true)))
         |             ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/uaccess.h:151:9: note: in expansion of macro 'if'
     151 |         if (likely(check_copy_size(from, n, true)))
         |         ^~
   drivers/clocksource/sh_mtu2.c: In function 'sh_mtu2_setup':
>> drivers/clocksource/sh_mtu2.c:343:27: warning: '%u' directive writing between 1 and 10 bytes into a region of size 3 [-Wformat-overflow=]
     343 |         sprintf(name, "tgi%ua", index);
         |                           ^~
   In function 'sh_mtu2_setup_channel',
       inlined from 'sh_mtu2_setup' at drivers/clocksource/sh_mtu2.c:421:9:
   drivers/clocksource/sh_mtu2.c:343:23: note: directive argument in the range [0, 4294967294]
     343 |         sprintf(name, "tgi%ua", index);
         |                       ^~~~~~~~
   drivers/clocksource/sh_mtu2.c:343:9: note: 'sprintf' output between 6 and 15 bytes into a destination of size 6
     343 |         sprintf(name, "tgi%ua", index);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +343 drivers/clocksource/sh_mtu2.c

d5ed4c2e5ce9f5 Magnus Damm      2009-04-30  330  
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  331  static int sh_mtu2_setup_channel(struct sh_mtu2_channel *ch, unsigned int index,
2e1a53265d5500 Laurent Pinchart 2014-03-04  332  				 struct sh_mtu2_device *mtu)
2e1a53265d5500 Laurent Pinchart 2014-03-04  333  {
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  334  	static const unsigned int channel_offsets[] = {
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  335  		0x300, 0x380, 0x000,
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  336  	};
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  337  	char name[6];
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  338  	int irq;
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  339  	int ret;
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  340  
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  341  	ch->mtu = mtu;
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  342  
faf3f4f8c805f5 Laurent Pinchart 2014-03-04 @343  	sprintf(name, "tgi%ua", index);
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  344  	irq = platform_get_irq_byname(mtu->pdev, name);
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  345  	if (irq < 0) {
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  346  		/* Skip channels with no declared interrupt. */
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  347  		return 0;
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  348  	}
faf3f4f8c805f5 Laurent Pinchart 2014-03-04  349  
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  350  	ret = request_irq(irq, sh_mtu2_interrupt,
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  351  			  IRQF_TIMER | IRQF_IRQPOLL | IRQF_NOBALANCING,
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  352  			  dev_name(&ch->mtu->pdev->dev), ch);
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  353  	if (ret) {
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  354  		dev_err(&ch->mtu->pdev->dev, "ch%u: failed to request irq %d\n",
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  355  			index, irq);
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  356  		return ret;
2e1a53265d5500 Laurent Pinchart 2014-03-04  357  	}
2e1a53265d5500 Laurent Pinchart 2014-03-04  358  
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  359  	ch->base = mtu->mapbase + channel_offsets[index];
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  360  	ch->index = index;
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  361  
1a5da0e43be0c0 Laurent Pinchart 2014-03-04  362  	return sh_mtu2_register(ch, dev_name(&mtu->pdev->dev));
2e1a53265d5500 Laurent Pinchart 2014-03-04  363  }
2e1a53265d5500 Laurent Pinchart 2014-03-04  364  

:::::: The code at line 343 was first introduced by commit
:::::: faf3f4f8c805f5f8a786ba544c94bf3e01838388 clocksource: sh_mtu2: Add support for multiple channels per device

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
