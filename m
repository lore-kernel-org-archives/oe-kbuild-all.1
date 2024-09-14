Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7DD372
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 00:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726273957; cv=none; b=cXON4BU3JJyf4Yp5yjy6SL4ROErtA+Zk9sA5w0kTpkRZQizr4dm8/Vs1S8cJ57ywep4GAl2S/lgEBTHl5SIliCsmb5JHU8TNOUGVoRShOton8PiIcjunoQEs7ehKyAoY9CGT6pYW0PbQmCQTuR5SZ4DpjNM6vczi2p+AdlpCedA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726273957; c=relaxed/simple;
	bh=y9oAR1zhMd0phbw31nDtpxdgJeE4g3AYzeT5piRYY0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kVlTJbdVu3bL2p4/6m0R7hnjelr0GcRrpvK5gGy7XEgt15MZBZ9frd/I2ExcqfImr3+ZLDzoFp0ljMfm5FczAK4rmkAtZXySZIA2k53X0+DotfIyDcL38qtkYrSTpK7REVI0IEHL7kNRfjTvquhBW0Bmzq9Hz+PJicTtiE6FuMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZObkjg4c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZObkjg4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726273955; x=1757809955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9oAR1zhMd0phbw31nDtpxdgJeE4g3AYzeT5piRYY0U=;
  b=ZObkjg4cUnBjsirdjPhpVPh4V23AjwjMKDMs+qf/cxNCiKQMqMqbw7kr
   jPCNUPkSkmNCcl1jxyKNE4UmrKbItMvi5iHt5EikZkcuhv/KkJrYOeN8x
   RFysxcSP626jxncxL+ILf+cCRfVY3ODiB95rF+XraA02Fkei1Caan4NuJ
   x/sm4KEoDKQyDq/eAKKdd1DWwWdf9cMngFjluSSb+w2otP1BG5vdgDVXf
   0fbCZFS+0AresUIIkfUzBuZ9KPhcmQXRUamdSxCWvydmmL31kMNIEh+5h
   8PPzgC4MxqUcGz4fSm4fduphYdOV7ramvWReT1Nqz6DmtPBET2nEpXBQp
   Q==;
X-CSE-ConnectionGUID: 8MiZM7LQT7utItKV3b9hOA==
X-CSE-MsgGUID: vJ/JMn/ITTiJwj4/lWyl6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36570015"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="36570015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 17:32:35 -0700
X-CSE-ConnectionGUID: kKJNQxuKQ1CqFSKleY8DlA==
X-CSE-MsgGUID: MhAKU4tdQs6Wb3cHeSUKUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="98918598"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Sep 2024 17:32:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spGiE-0007C6-2x;
	Sat, 14 Sep 2024 00:32:30 +0000
Date: Sat, 14 Sep 2024 08:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [linux-next:master 11040/11962] include/uapi/linux/const.h:20:25:
 error: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned
 int'} changes value from '34359738368' to '0'
Message-ID: <202409140802.RRGueyxp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5acd9952f95fb4b7da6d09a3be39195a80845eb6
commit: 5a90b60db5e6765367d9bb2c03f66b14d72946d2 [11040/11962] drm/xe: Add a xe_bo subtest for shrinking / swapping
config: csky-randconfig-002-20240914 (https://download.01.org/0day-ci/archive/20240914/202409140802.RRGueyxp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140802.RRGueyxp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140802.RRGueyxp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from arch/csky/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from include/drm/ttm/ttm_tt.h:30,
                    from drivers/gpu/drm/xe/xe_bo.h:9,
                    from drivers/gpu/drm/xe/xe_bo.c:6:
   drivers/gpu/drm/xe/tests/xe_bo.c: In function 'shrink_test_run_device':
>> include/uapi/linux/const.h:20:25: error: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '34359738368' to '0' [-Werror=overflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:49:41: note: in expansion of macro '_AC'
      49 | #define SZ_32G                          _AC(0x800000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/xe/tests/xe_bo.c:456:17: note: in expansion of macro 'SZ_32G'
     456 |         limit = SZ_32G;
         |                 ^~~~~~
   include/uapi/linux/const.h:20:25: error: conversion from 'long long unsigned int' to 'size_t' {aka 'unsigned int'} changes value from '17179869184' to '0' [-Werror=overflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:48:41: note: in expansion of macro '_AC'
      48 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/xe/tests/xe_bo.c:459:25: note: in expansion of macro 'SZ_16G'
     459 |                 limit = SZ_16G;
         |                         ^~~~~~
   cc1: all warnings being treated as errors


vim +20 include/uapi/linux/const.h

9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   6  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   7  /* Some constant macros are used in both assembler and
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02   8   * C code.  Therefore we cannot annotate them always with
6df95fd7ad9a84 include/linux/const.h      Randy Dunlap        2007-05-08   9   * 'UL' and other type specifiers unilaterally.  We
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  10   * use the following macros to deal with this.
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  11   *
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  12   * Similarly, _AT() will cast an expression with a type in C, but
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  13   * leave it unchanged in asm.
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  14   */
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  15  
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  16  #ifdef __ASSEMBLY__
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  17  #define _AC(X,Y)	X
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  18  #define _AT(T,X)	X
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  19  #else
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @20  #define __AC(X,Y)	(X##Y)
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  21  #define _AC(X,Y)	__AC(X,Y)
74ef649fe847fd include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  22  #define _AT(T,X)	((T)(X))
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  23  #endif
9d291e787b2b71 include/asm-x86_64/const.h Vivek Goyal         2007-05-02  24  

:::::: The code at line 20 was first introduced by commit
:::::: 9d291e787b2b71d1b57e5fbb24ba9c70e748ed84 [PATCH] x86-64: Assembly safe page.h and pgtable.h

:::::: TO: Vivek Goyal <vgoyal@in.ibm.com>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
