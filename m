Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC6D3254AA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 16:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769359215; cv=none; b=kX318h41tG5FSLE+/fvExzodbZqFkZiWFCHvsbqPIJTmNVEc56YoDLqyCE5nqI3GE+4AYRkg8yKa6dQAQITdUjcKlkz2D2KmGy2+pPQjLhGWnVNxHJ4pMpU0RgnkCMUY/WXcsSPqS+oCTC0AAMN0m7f/lQbF6wmx5YGBZIkwyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769359215; c=relaxed/simple;
	bh=VGxNC+RotGbRZLBulaHfdPTzAk7H7el8QcfkTrFSyVY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HlfQ4G88b+/UwnDGlrDeMOGJ2vk/5Pt26MiwSqhpeXkZHvOxRTLBH+YR2XfRue7MRWW5BAtVhwhwfePcFRe9YwlG8npppCEBEx8aDYELc00g+Q52IE0WJiXaHljiFa5lK2tsWqDieCI7kfvb2LUG0ZYRJyIQ2uye0Yd5EVPVtb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTDJ5N0q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTDJ5N0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769359213; x=1800895213;
  h=date:from:to:cc:subject:message-id;
  bh=VGxNC+RotGbRZLBulaHfdPTzAk7H7el8QcfkTrFSyVY=;
  b=RTDJ5N0qiDGgaRdre5LW3EhbIs1iVPYwuT2B6aak9+JrOgZtl8C0HIFu
   d2B9Uc/cPA0bDK/lSLiYncWojokFY/hxz9Q3RJOtwfN2SpmuvN6fxPD1W
   Tiwc3zFkQTPiEmedcterHYv38nHgo5Pm9LvN+yanMYfuep0av8+MwbdNF
   zfmx+Y7G0dDrLcggOOS50vIEx16It1CNwpAxp3getap7AUjHUUbbbaqa5
   qD3GaiOqpK01IiYXA/k3ah6cAfLHJHySXyX8CtP8aBmHkK802HmdLXzfB
   w+wXPlQ/DQqb97HuxQ4E2xCyALD+dvNezhgxqNOvznaRg15XU3ueeiG/l
   w==;
X-CSE-ConnectionGUID: JaAMJJ6tQcWl3nODNnkQpQ==
X-CSE-MsgGUID: 9HoUwC1ISUaYFmlvz0gubA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81919711"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="81919711"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 08:40:12 -0800
X-CSE-ConnectionGUID: EqlZc07uSv2bNnD+sgI1IA==
X-CSE-MsgGUID: tPTZxM16To69DANVfjOnlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207914965"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jan 2026 08:40:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk39k-000000001JF-3ssu;
	Sun, 25 Jan 2026 16:40:08 +0000
Date: Sun, 25 Jan 2026 17:39:44 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 pkey_sighandler_tests.c:119:9: warning: array subscript 0 is outside array
 bounds of 'int[0]'
Message-ID: <202601251717.OaRSWUry-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kevin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   9ca0fde2622c59c97612be0765d6d3c101122f69
commit: 54dba9d5ae94c7df8662b6b3a09471beb342aecc [2/2] selftests/mm: build with -O2
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260125/202601251717.OaRSWUry-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251717.OaRSWUry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251717.OaRSWUry-lkp@intel.com/

All warnings (new ones prefixed by >>):

   pkey_sighandler_tests.c: In function 'thread_segv_with_pkey0_disabled':
>> pkey_sighandler_tests.c:119:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
     119 |         *(int *) (0x1) = 1;
         |         ^~~~~~~~~~~~~~
   cc1: note: source object is likely at address zero
   In function 'thread_segv_maperr_ptr',
       inlined from 'test_sigsegv_handler_with_different_pkey_for_stack' at pkey_sighandler_tests.c:288:3:
   pkey_sighandler_tests.c:148:14: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
     148 |         *bad = 1;
         |         ~~~~~^~~
   In function 'test_sigsegv_handler_with_different_pkey_for_stack':
   cc1: note: source object is likely at address zero

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
