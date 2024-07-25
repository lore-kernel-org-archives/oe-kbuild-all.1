Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F61019922A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 16:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721924597; cv=none; b=gQta7lKNIwQB9jlBQtRU30cQZDcHtIoA9tGn/+fHW5FdlVVSKLo9gUkDBThV5gKEXtRsQ0io/n2rdtt47aQHQqwt8CsTq5XvjB/CjSTbMZbQ83mWUkN7uv/IOD51GFozzFhkM36ZihI9Ov2xBWqpQ/njEgibyeSEOYqD1f+Q/aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721924597; c=relaxed/simple;
	bh=EBhwkki2vqFXb7WvFnv3fRXwgSxfwjtjeniGaGTIjv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OFpZKkbSn/tt6lJI/qfpDFHmakX1I5Cpe/c8ZYW5U76QDPlmsbQeoWFFdjvQHFTsIgJ5P+sPNlgNeF07jAtl/+PNvmrKAZXj2P+VALJ+6CS+xRmC3Kx/5ofXa5Hylfw1JPbm9KP5nYunuBCaVdyyQxPHRMStPBjeyhIDTVAH4ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIzQjQBE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIzQjQBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721924595; x=1753460595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBhwkki2vqFXb7WvFnv3fRXwgSxfwjtjeniGaGTIjv4=;
  b=KIzQjQBEgERO1bP4aHd86Zzofy0GCDIrrI8/PLswxDmzsjPGJgzrKEbs
   ORN7DjSSYyhy+4tUgk6DfrNHmEFtsySxOLYhpVh3wVKDHzwccOKng5oiu
   LRymvp2tshzAVYL1CwIt+LVEt4T3dE8dZRgY1lMmUaYQSwTe59OgmF6SB
   qNTd9SndrlS0cKPNagGecc4gRBFUkrieVNAsFpCdWlcXc7EKlmY9ThR+S
   AsUt0zFz2ei+PYguJMEqJW0GI6er+4P4KcwVo23cAMAToTYF7CT6TmqtG
   xs3m+kC7oXRv9IP6xqwR91f1TfySdilkCSmC5pvTFMhAHzHtuhA/Ye7ly
   w==;
X-CSE-ConnectionGUID: 9z/whu5TScmSZho7G6df+Q==
X-CSE-MsgGUID: JYuewrXIRa6Hp59c2HwTtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="12712469"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="12712469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 09:23:14 -0700
X-CSE-ConnectionGUID: fUMrMZ32RTe/lLZKH5QY4g==
X-CSE-MsgGUID: VlI+Ddk+QKCgm+6nMkXo8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; 
   d="scan'208";a="52992092"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Jul 2024 09:23:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX1FG-000oG4-1y;
	Thu, 25 Jul 2024 16:23:10 +0000
Date: Fri, 26 Jul 2024 00:22:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:for-linus/hardening 10/10] lib/tests/overflow_kunit.c:31:36:
 sparse: sparse: undefined preprocessor identifier '__clang_major__'
Message-ID: <202407260005.2Zr3b8yd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-linus/hardening
head:   31dd42261251178ca18358714294b1f2a05f9f54
commit: 31dd42261251178ca18358714294b1f2a05f9f54 [10/10] lib: Move KUnit tests into tests/ subdirectory
config: um-randconfig-r123-20240725 (https://download.01.org/0day-ci/archive/20240726/202407260005.2Zr3b8yd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407260005.2Zr3b8yd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407260005.2Zr3b8yd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/overflow_kunit.c:31:36: sparse: sparse: undefined preprocessor identifier '__clang_major__'
   lib/tests/overflow_kunit.c:41:36: sparse: sparse: undefined preprocessor identifier '__clang_major__'
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true

vim +/__clang_major__ +31 lib/tests/overflow_kunit.c

72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  26  
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  27  /*
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  28   * Clang 11 and earlier generate unwanted libcalls for signed output
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  29   * on unsigned input.
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  30   */
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06 @31  #if defined(CONFIG_CC_IS_CLANG) && __clang_major__ <= 11
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  32  # define SKIP_SIGN_MISMATCH(t)	SKIP(t, "Clang 11 unwanted libcalls")
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  33  #else
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  34  # define SKIP_SIGN_MISMATCH(t)	do { } while (0)
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  35  #endif
72c3ebea375c39 lib/overflow_kunit.c Kees Cook 2022-10-06  36  

:::::: The code at line 31 was first introduced by commit
:::::: 72c3ebea375c39413d02113758319b74ecd790bd overflow: Refactor test skips for Clang-specific issues

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
