Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCE222F764
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011836; cv=none; b=F8KLw0/YkX5+i5cJ8XTRQKmPJcmYw4uxJIV2X2P5q10Z4660xXKtaWfe31NG7AvEeXPStCcvZTu0GxLaMSHALdafHC/mWgw5jJ0ovo8/ZCOIlGuC7MnqwltpHbF+d8i6U2s/XPcV9Kea1lBdyDhBRQ+nIPkRlwDNn90qi7PUtjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011836; c=relaxed/simple;
	bh=w2EXOLArpNFPUj8ovtNnoegWnYpa78aDNYr6xn18IDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFLcbi/2YdtbBA1+ro2euoRrpGOzoL7PMe9wArciJfD9ryJZAtLJsI7d4GjEODax8GK7vaUrRGESW3UqvrY3RSVwgICnPecDbfiJrkx3xtHPGGr0Nn+0eHc4Gv95i4jx/CP7BrT7BF1YWBBR0Lnw0cvLkUTzVBFbG48s9TwzKjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJXAKlwN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJXAKlwN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751011835; x=1782547835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w2EXOLArpNFPUj8ovtNnoegWnYpa78aDNYr6xn18IDo=;
  b=oJXAKlwNANsiQ9aYK9OckTi3UH9Yjy/RkNejEHddmLgaOFmNANMlSska
   CBtCAo91rtoJQbm2mmNGPwkCFApUcVSNAyAtqQRSRryAa2jkMPysnXFUr
   n5uwAN0tFOa7P5IzlnLn+AUs4oSgWTg1zL3BLb4mF+n730WXccXHngWaq
   DICwISQ1Jk/yDw5J8Dt7Hw4fb+S1kpEqVFhwY+A9kSFI7rZzAmjSJ4Xgb
   /jEim607Ma+RJkyaYxQI+DZNRLn9lSPvc2iBfi5skF9c2jMJXn+qAZYf/
   WQC9IEGSG06K0agTgaEzcqLAHFZt+gpaSpN7BQntC86xgc+QEVOU+NhPa
   Q==;
X-CSE-ConnectionGUID: 6xvZ3N5kRu6IdqqayZXPWA==
X-CSE-MsgGUID: 9DACCVLOSCifJtVVr5RLiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57126919"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57126919"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 01:10:34 -0700
X-CSE-ConnectionGUID: 079kVueNR4KkAreeVHz1iw==
X-CSE-MsgGUID: oV/UVicHT6el6kXkqmhwGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157029087"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jun 2025 01:10:31 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV4AG-000VyE-2a;
	Fri, 27 Jun 2025 08:10:28 +0000
Date: Fri, 27 Jun 2025 16:09:59 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5/5] powerpc: Implement masked user access
Message-ID: <202506271642.Qq9oGRb8-lkp@intel.com>
References: <9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/fixes]
[also build test ERROR on akpm-mm/mm-nonmm-unstable brauner-vfs/vfs.all linus/master v6.16-rc3 next-20250626]
[cannot apply to powerpc/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/uaccess-Add-masked_user_-read-write-_access_begin/20250622-175354
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
patch link:    https://lore.kernel.org/r/9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 5/5] powerpc: Implement masked user access
config: powerpc-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271642.Qq9oGRb8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271642.Qq9oGRb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271642.Qq9oGRb8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'mask_user_address',
       inlined from 'masked_user_read_access_begin' at arch/powerpc/include/asm/uaccess.h:538:21,
       inlined from 'get_sigset_argpack' at fs/select.c:780:11,
       inlined from '__do_sys_pselect6' at fs/select.c:799:6,
       inlined from '__se_sys_pselect6' at fs/select.c:793:1,
       inlined from 'sys_pselect6' at fs/select.c:793:1:
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_414' declared with attribute error: BUILD_BUG_ON failed: TASK_SIZE_MAX + SZ_128K > border
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/uaccess.h:510:9: note: in expansion of macro 'BUILD_BUG_ON'
     510 |         BUILD_BUG_ON(TASK_SIZE_MAX + SZ_128K > border);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_414 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  569  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
