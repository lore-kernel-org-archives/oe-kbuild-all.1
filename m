Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA32FB0B3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 21:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764105560; cv=none; b=de5Qcs+eouv6rGwm7F7XjqBuK4IAs7YhLrQJoN9wx5u7B0GnrRdB8Q5A7N2Bjl9icxzOjNbPp3/rv5KbMAxhxe840+sWDfIr4UkFXD3aosC9CfwMMSqTnQNfFDc3wOsgV5S5TIWlL0puD37qPuUkHnByLgFeUPG0PzKAiS+mohg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764105560; c=relaxed/simple;
	bh=tHReAClY+18HFickbZdyBGjV0pf+yYtvp16HndzBVuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0u8URa7SjSuZLmTEYkvZENmZA6fduAAwkeow4VWe2kot48o5+eT9uC7khdohwv3isK1no8SW34URAdE4ZB1yQyK0xkxtcHPlEIV0CL8oIwKwBuljaxZOcyqtSijI0AfDmIv4StvbPet2kxd3ks3j+SYBQsfwT5vp2JekhNn318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q63a+mnA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q63a+mnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764105559; x=1795641559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHReAClY+18HFickbZdyBGjV0pf+yYtvp16HndzBVuk=;
  b=Q63a+mnA3mtZ8FHHTfQmitA3Mn7Zqm59+W0gY8XO2kbbtXFQ+rJNBmbD
   FT+dYjXIPrn4OZzsNyf6/uRu/N8sNettT2cld+3nGqCy+kiMW/yGX79Id
   +b836rbRjs4J5vuioJ8kg4MQ9HjSPhvolyE5tx4Ye4bkxln0ayV7R6uBM
   KizJ6xedJuup/xSqyGVLvs98WYwBHbByr+SlkqLKQRokblP9ji2QGJ6IE
   ZsXUZ/HNB9QkcGyLQsWmmjbVotz8aGiLNjNHK0IRlVBGkqKb4xn9H1WIa
   vIfKMV05xqlMZS8pJQXT+8M0PrN4UbN3KRN08iN55NK3Wjd9tWdciYTpz
   Q==;
X-CSE-ConnectionGUID: Qp9DLOptSuKIyfE9vwDu9w==
X-CSE-MsgGUID: TjFEqKcASaa1lyxVFcL1vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83525959"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="83525959"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:19:18 -0800
X-CSE-ConnectionGUID: G67XL42VQuqp8KxUC3FLAg==
X-CSE-MsgGUID: 0bQuqz7RS8KvuZSMS1H40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="216107957"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2025 13:19:16 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO0RO-000000002Gv-0ZTN;
	Tue, 25 Nov 2025 21:19:14 +0000
Date: Wed, 26 Nov 2025 05:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>
Subject: [linux-nvme:nvme-6.19 3/27] include/linux/kern_levels.h:5:25:
 warning: format '%ld' expects argument of type 'long int', but argument 2
 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202511260537.R9DHSTOl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.19
head:   db2792e1d7696594dcd09dcc97f262e69819a820
commit: 00eecf662c6e30736357ffd007ea2f3964f6eb04 [3/27] nvme-auth: modify nvme_auth_transform_key() to return status
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251126/202511260537.R9DHSTOl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260537.R9DHSTOl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511260537.R9DHSTOl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from drivers/nvme/common/auth.c:6:
   drivers/nvme/common/auth.c: In function 'nvme_auth_transform_key':
>> include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:567:9: note: in expansion of macro 'printk'
     567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:567:16: note: in expansion of macro 'KERN_WARNING'
     567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/nvme/common/auth.c:278:17: note: in expansion of macro 'pr_warn'
     278 |                 pr_warn("incompatible digest size %ld for key (hash %s, len %ld)\n",
         |                 ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:567:9: note: in expansion of macro 'printk'
     567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:567:16: note: in expansion of macro 'KERN_WARNING'
     567 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/nvme/common/auth.c:278:17: note: in expansion of macro 'pr_warn'
     278 |                 pr_warn("incompatible digest size %ld for key (hash %s, len %ld)\n",
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
