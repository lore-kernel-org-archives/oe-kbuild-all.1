Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769502;
	b=sB39dg2rlfgHj8aqUE6R/oBBha74jlWSJhNofuo+FlyEMPwdKQ8O/T9TAjvTry5WYxar
	 OXrJu2YPFc6h4poOjildW4U9tK6D40FikwmprmD9UeVgxGAh283X+k1G0oCHdPUBM/HAE
	 notagsGAieOpfMDkVAoDT0WLu1GmvpeDn7ndQv1XSrrXnu6+7FgGcD8PFK8lIlmL5dKQs
	 25fqbb3PoO0dZ4WlOU+RkKeni8JUJDx3Fx7dNEZJoVRElR2qTgw29tmuJ61P9RyAIxLIE
	 kGrqRrSize1bqwi76C6/eSYYKyZULLBSgOqdRm90LWxVv0CmP/n0cFURFe38M/yG2WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769502;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=d6EMbzlDjrYOX7hpusroZGf1jZdldJfUhf7Z+YNWHmE=;
	b=ID0dceWn70M+gKJsKBcqgCYTtmMvX+9TYH11hvr9sTUEuMmTDGfOauoMBC6MWjyui657
	 7/SU78V9XA6zmnp662kjV3aF7sEOh0rw7mDDl7t6cP0mqbTRDaS1OSDHJIN9PDwPhgVcW
	 EcttpSIJUOS28ooiHZKC6Ggvv+niS8MBifbcP4Cc/LGIWTRrT1eSWpWdFQH2oJFa1Psyc
	 gIJpY4pE7Rlie3YAlsV9hQEl1H9nYdB7BS7zFDswNPaVe/Qj5gY9DpqdfBpH+V6Dl7s5/
	 rSwXvJxxAdYBM+NVMigs3i9QDGwi/VQIFtRp/Wuw/rQuLtZJ7H8SB61mOpIVUtQv9jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=geB9LK0u;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD54B606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 05:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD54B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=geB9LK0u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793769500; x=1825305500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nXmFhBmKmCDTkueOPscH0+SUxrEdXGs8H2ZWAt9dqNg=;
  b=geB9LK0u+tiKliaSycmxCo+vwbkAi+m7IT3g4+xsgI3RSb4RQHHngP2d
   mtFqfFCCEn81WKn8WLqGXdJP/XZkwEoVTyFRimP6RGHXCEMiUOE7kA7f9
   S59jwp/wPwZFuupNA1VWc2AOTtoRW+wK6qHyVL5HVCYJw4t3F6xw1aRSf
   pkWvTj87MeBCRBaCniZINXd9ARkNAGBLDckG/0xdOGbuqz3/qwLFvsWUM
   QDr8OXunWFuuTN8ZsWozkoik18XwS8CtnrAwharb43mc6YvQmiSM4U6A3
   1AkJQrV5hu0k2N+Z33/WTP6LyEwUb2PkEWSQHo1P5DsnHZcK8fLbtrTvG
   g==;
X-CSE-ConnectionGUID: B269K1rGR2ih8YGM1zP2xQ==
X-CSE-MsgGUID: Z7qqI39HQQSq0DRlddD0Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2398572"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2398572"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 21:18:20 -0800
X-CSE-ConnectionGUID: zd6/4RREQguwCoD4N1Dw1Q==
X-CSE-MsgGUID: 1480JFUgRle8U1+P9vY25g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6945980"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Nov 2026 21:18:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOTO3-00000000joh-1WF1;
	Wed, 04 Nov 2026 05:18:15 +0000
Date: Wed, 4 Nov 2026 13:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: wen.yang@linux.dev
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 39/39] sysctl: remove the extra pointers and the
 compatibility bounds read
Message-ID: <202611041241.bvJjCVUH-lkp@intel.com>
References: <b6e4cbd509687301a8ee2106f19a3ac01e7671a6.1793204511.git.wen.yang@linux.dev>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6e4cbd509687301a8ee2106f19a3ac01e7671a6.1793204511.git.wen.yang@linux.dev>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[cannot apply to sysctl/sysctl-next brauner-vfs/vfs.all linus/master mcgrof/sysctl-next v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wen-yang-linux-dev/sysctl-replace-overloaded-extra-pointers-with-typed-bounds-and-context/20261029-003440
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/b6e4cbd509687301a8ee2106f19a3ac01e7671a6.1793204511.git.wen.yang%40linux.dev
patch subject: [RFC PATCH 39/39] sysctl: remove the extra pointers and the compatibility bounds read
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20261104/202611041241.bvJjCVUH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041241.bvJjCVUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611041241.bvJjCVUH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/unix/sysctl_net_unix.c:23:18: error: 'const struct ctl_table' has no member named 'extra1'
      23 |                 .extra1         = SYSCTL_ZERO,
         |                  ^~~~~~
   In file included from net/unix/sysctl_net_unix.c:10:
>> include/linux/sysctl.h:41:41: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
      41 | #define SYSCTL_ZERO                     0
         |                                         ^
   net/unix/sysctl_net_unix.c:23:35: note: in expansion of macro 'SYSCTL_ZERO'
      23 |                 .extra1         = SYSCTL_ZERO,
         |                                   ^~~~~~~~~~~
   include/linux/sysctl.h:41:41: note: (near initialization for 'unix_table[0]')
      41 | #define SYSCTL_ZERO                     0
         |                                         ^
   net/unix/sysctl_net_unix.c:23:35: note: in expansion of macro 'SYSCTL_ZERO'
      23 |                 .extra1         = SYSCTL_ZERO,
         |                                   ^~~~~~~~~~~
>> net/unix/sysctl_net_unix.c:24:18: error: 'const struct ctl_table' has no member named 'extra2'
      24 |                 .extra2         = SYSCTL_INT_MAX,
         |                  ^~~~~~
   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/slab.h:15,
                    from net/unix/sysctl_net_unix.c:8:
>> include/vdso/limits.h:8:25: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
       8 | #define INT_MAX         ((int)(~0U >> 1))
         |                         ^
   include/linux/sysctl.h:50:41: note: in expansion of macro 'INT_MAX'
      50 | #define SYSCTL_INT_MAX                  INT_MAX
         |                                         ^~~~~~~
   net/unix/sysctl_net_unix.c:24:35: note: in expansion of macro 'SYSCTL_INT_MAX'
      24 |                 .extra2         = SYSCTL_INT_MAX,
         |                                   ^~~~~~~~~~~~~~
   include/vdso/limits.h:8:25: note: (near initialization for 'unix_table[0]')
       8 | #define INT_MAX         ((int)(~0U >> 1))
         |                         ^
   include/linux/sysctl.h:50:41: note: in expansion of macro 'INT_MAX'
      50 | #define SYSCTL_INT_MAX                  INT_MAX
         |                                         ^~~~~~~
   net/unix/sysctl_net_unix.c:24:35: note: in expansion of macro 'SYSCTL_INT_MAX'
      24 |                 .extra2         = SYSCTL_INT_MAX,
         |                                   ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +23 net/unix/sysctl_net_unix.c

84960bf2403123 Kuniyuki Iwashima 2025-03-17  15  
0abc76bc20826e Joel Granados     2026-08-10  16  static const struct ctl_table unix_table[] = {
^1da177e4c3f41 Linus Torvalds    2005-04-16  17  	{
^1da177e4c3f41 Linus Torvalds    2005-04-16  18  		.procname	= "max_dgram_qlen",
a0a53c8ba95451 Denis V. Lunev    2007-12-11  19  		.data		= &init_net.unx.sysctl_max_dgram_qlen,
^1da177e4c3f41 Linus Torvalds    2005-04-16  20  		.maxlen		= sizeof(int),
^1da177e4c3f41 Linus Torvalds    2005-04-16  21  		.mode		= 0644,
1a4e7bc6e3457a Yingjie Wang      2026-10-16  22  		.proc_handler	= proc_dointvec_minmax,
1a4e7bc6e3457a Yingjie Wang      2026-10-16 @23  		.extra1		= SYSCTL_ZERO,
1a4e7bc6e3457a Yingjie Wang      2026-10-16 @24  		.extra2		= SYSCTL_INT_MAX,
^1da177e4c3f41 Linus Torvalds    2005-04-16  25  	},
^1da177e4c3f41 Linus Torvalds    2005-04-16  26  };
^1da177e4c3f41 Linus Torvalds    2005-04-16  27  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
