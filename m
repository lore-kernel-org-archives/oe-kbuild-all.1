Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281421624C5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771801547; cv=none; b=Vap3I/yqKxw/sJELFX4u8Bs7eb2W66rTJW2W1JJraxEthb/luVY6neg7C/Yo7LNUpEFPAtFJH3nE60l7i82XAzNv0a8ynP/4tm1mS4O/SfRfPe6XWrA8tSXYDw5aaS0HKsYvm5UGoazevhIygzwq+DeFOebANrvk8OEa1l2k+2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771801547; c=relaxed/simple;
	bh=jg6aNzdR9HOYakPxWdm8b4tS/Om/wuTzgYXL45a5kuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aFoHjDkPagFAkD5fyBwe0IAFiGSs0fL9IUerRXwv2Vy6eghVvNTahL1YGh1Dhl0iLiahjtice1DDSdUcaN0X9euwPyx8Br0yhv4ooJEWaG/XzUFRWbD1BhuUwCNOYFyv81AkGYDNP0HofDl9P8bh6lUFax1Q+jgfn8AHOCiBvtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfIWfGY7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfIWfGY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771801545; x=1803337545;
  h=date:from:to:cc:subject:message-id;
  bh=jg6aNzdR9HOYakPxWdm8b4tS/Om/wuTzgYXL45a5kuA=;
  b=BfIWfGY711XZJzB/5m+TLfQtgKuPH/CcodhxnxgDOik+7puMt95+/Mjh
   4hJ3o6usLMKKykR7feYbI7rA401mDGOfNSIo2JISkOCtXpBPByR3g+j8T
   o+Mel205WVjPyFQcuFPukiqoPODYDtHHtrujoQOeUPzxzzE77mG6+vVq/
   aZq2Csx86UxGQWGP3rFIGHa2y+d4Vn+NzHILbrR/yHOeLcquoj3jJ0i+y
   iUdNGKRcIcSe9onkbmx+lGgYLa+VHNQ3lQLGHPIlKYKsv2TWe88TqQdNp
   YpX0Z510M+qGV0hptFGreJITxyhc8PbccLTCFgB9vGqxAi/FK7XMT/b4I
   w==;
X-CSE-ConnectionGUID: Lginu8qNQ0KY0TcEDH/hAA==
X-CSE-MsgGUID: 3vAq7qTSQKOWedATWSNmMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90384024"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="90384024"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 15:05:45 -0800
X-CSE-ConnectionGUID: /ul3ZZcpTNWhrdnZ4RbG1Q==
X-CSE-MsgGUID: zFqkNPk3Qv+yn5+SwxuQ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="214483608"
Received: from lkp-server01.sh.intel.com (HELO c63097897875) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2026 15:05:43 -0800
Received: from kbuild by c63097897875 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuIWD-0000000006H-04Rb;
	Sun, 22 Feb 2026 23:05:41 +0000
Date: Mon, 23 Feb 2026 07:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] mm/gup.c:479:6: warning:
 no previous prototype for function
 '_trace_android_vh_mm_customize_longterm_pinnable'
Message-ID: <202602230654.AjoHBZFD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Pengfei,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c190014704c7a433b2d1df9efbffca3f36b294c0
commit: 792718bb234ac19db3efdbc3215485e874c41584 [1/1] ANDROID: vendor_hook: Added hook to tune reclaimed huge page
config: i386-buildonly-randconfig-002-20260223 (https://download.01.org/0day-ci/archive/20260223/202602230654.AjoHBZFD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230654.AjoHBZFD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602230654.AjoHBZFD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.c:479:6: warning: no previous prototype for function '_trace_android_vh_mm_customize_longterm_pinnable' [-Wmissing-prototypes]
     479 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         |      ^
   mm/gup.c:479:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     479 | void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
         | ^
         | static 
   1 warning generated.


vim +/_trace_android_vh_mm_customize_longterm_pinnable +479 mm/gup.c

   473	
   474	/*
   475	 * trace_android_vh_mm_customize_longterm_pinnable is called in include/linux/mm.h
   476	 * by including include/trace/hooks/mm.h, which will result to build-err.
   477	 * So we create func: _trace_android_vh_mm_customize_longterm_pinnable.
   478	 */
 > 479	void _trace_android_vh_mm_customize_longterm_pinnable(struct folio *folio,
   480			bool *is_longterm_pinnable)
   481	{
   482		trace_android_vh_mm_customize_longterm_pinnable(folio, is_longterm_pinnable);
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
