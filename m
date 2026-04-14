Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7738A3D902A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 15:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776181314; cv=none; b=cWzfnnGGIDXj+M/Wf3saoh+C9nsE2V6+hiP4EZ3XVnCE33T/+7U/i0RM9XB8A36e2WgKtWO+8hRZBEhK6nE7gAfqRucxrcrbEhNqOUXEXKfcZ6Shwcq5Yoo3ex2NRbnoLLNNcp21PiAWaU57dpc3HbwNQmURTn+uKI9CnLSRKVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776181314; c=relaxed/simple;
	bh=dYkXVJoykQrCBRHXfIDUbmC37B+K3+jlEV8wDhge3Ak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tWCyHhvhgtDGW860Dii+KSPRAX6i+HbgWYnvOi1tuUXx28Ix4RNf5+U/BNUQA9p3d/aJLUIbrifKOU/XvnEXWzLrJvdvN47j5jsqFe3VnKXMw2r9EQEN1ZAfFFTHDbbjp33DGI/9kMK+MdKaUYASqb9Cy4/pIidnls0bcTobBuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsSrONY0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsSrONY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776181313; x=1807717313;
  h=date:from:to:cc:subject:message-id;
  bh=dYkXVJoykQrCBRHXfIDUbmC37B+K3+jlEV8wDhge3Ak=;
  b=ZsSrONY0jDYqfkuOml5VSZSBF8Wi/o8f52Q05gxpjd2TsNPBcHjtbsVS
   +7FSCNDsh5tClhWSXD1W+nZoSf437D6bMGK4aXfSexNPjF+96nJJLNOCf
   tZzrrBuotPt3w8oBMIVMDR5niYD4GTAJ/aKMRSgmi4e13G0VPihL03T1A
   LBhbnq8EVnxLcK/tXI2ulpNuVKDYgPuwbguZLhzBI+7VdbB352203Va9x
   S00vtdB1buyuvSUHFXSnJMB1ZMZ3GuUf0FR9oulI2lwyQcrNpYXTDlduC
   MRtz2grPOZ4PL6osNlE9NHJ0Bwqxl/KmrhFTpSVWCVgPPWzv5csgo35bW
   w==;
X-CSE-ConnectionGUID: 1hmCMYAOSGi+atd1JK+KZw==
X-CSE-MsgGUID: 1QctOPQ1Q2OFKExaPjKZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88589629"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88589629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 08:41:53 -0700
X-CSE-ConnectionGUID: Sz8ePCPST+GwZU1yIybMog==
X-CSE-MsgGUID: w+mwRl/iRzWlNlwJSi/CZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225412720"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 08:41:51 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCftc-000000001b3-1PmJ;
	Tue, 14 Apr 2026 15:41:48 +0000
Date: Tue, 14 Apr 2026 23:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <threeway@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-7.0.y 188/192]
 include/linux/stddef.h:8:14: error: called object is not a function or
 function pointer
Message-ID: <202604142332.HlSbHtb3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/steev/linux lenovo-x13s-linux-7.0.y
head:   577f25eff3014cf94dcfb85d3230d31ca505d3a4
commit: 55b4264d0963dd4cb190b215153faeada3dc0520 [188/192] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260414/202604142332.HlSbHtb3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142332.HlSbHtb3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142332.HlSbHtb3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/m68k/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/cleanup.h:5,
                    from sound/soc/codecs/lpass-wsa-macro.c:4:
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_runtime_suspend':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   sound/soc/codecs/lpass-wsa-macro.c:2841:16: note: in expansion of macro 'pm_clk_suspend'
    2841 |         return pm_clk_suspend(dev);
         |                ^~~~~~~~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c: In function 'wsa_macro_runtime_resume':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:78:25: note: in expansion of macro 'NULL'
      78 | #define pm_clk_resume   NULL
         |                         ^~~~
   sound/soc/codecs/lpass-wsa-macro.c:2850:15: note: in expansion of macro 'pm_clk_resume'
    2850 |         ret = pm_clk_resume(dev);
         |               ^~~~~~~~~~~~~
--
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/m68k/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/cleanup.h:5,
                    from lpass-wsa-macro.c:4:
   lpass-wsa-macro.c: In function 'wsa_macro_runtime_suspend':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:77:25: note: in expansion of macro 'NULL'
      77 | #define pm_clk_suspend  NULL
         |                         ^~~~
   lpass-wsa-macro.c:2841:16: note: in expansion of macro 'pm_clk_suspend'
    2841 |         return pm_clk_suspend(dev);
         |                ^~~~~~~~~~~~~~
   lpass-wsa-macro.c: In function 'wsa_macro_runtime_resume':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/pm_clock.h:78:25: note: in expansion of macro 'NULL'
      78 | #define pm_clk_resume   NULL
         |                         ^~~~
   lpass-wsa-macro.c:2850:15: note: in expansion of macro 'pm_clk_resume'
    2850 |         ret = pm_clk_resume(dev);
         |               ^~~~~~~~~~~~~


vim +8 include/linux/stddef.h

^1da177e4c3f415 Linus Torvalds   2005-04-16  6  
^1da177e4c3f415 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f415 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e2182874324727 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
