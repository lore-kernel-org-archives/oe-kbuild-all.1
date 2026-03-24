Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E60332EA0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 01:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314678; cv=none; b=hanRi21iBVZTSDf6sn54WdssZ1Hhgypzw8s0iLri2GWUbGUkGPdojWaEDFtCp0Pi3g4p8T2JWJul7/fc6b5JFkzImsiXVFg6nuE08C8qQJqgTN5sXUKrF9comqfg2/d/SWDoNcegqyAnDDQQ4razgSKhxfUswKq50Nho+N50JFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314678; c=relaxed/simple;
	bh=01y628O7aZ+FZFVsWW2qzhe01YfHWSnucaN3QhcC8rE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wh0gOJJds9mjvYLCAq8KEAh/IBSCz3uXceJ9DbZ0YhzPp3tpKrbPEjJPDBy93vWA4uo+ODJqNBVXm651c8iHKkhI5Qc1vGSvqk/BrpAOB7GE9WxEncSbcEz3n/WQuPtws5X/IfAOsElkmmUlgeDF7FYuZnBrOOXoBQjm+m5Q+bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e86y/VhD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e86y/VhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774314677; x=1805850677;
  h=date:from:to:cc:subject:message-id;
  bh=01y628O7aZ+FZFVsWW2qzhe01YfHWSnucaN3QhcC8rE=;
  b=e86y/VhDSYWbA4o78I6sYD0GkSkExxNWzamRnQP93cqfHbZLOq8eF/sU
   UfXwCRFOFZw9BLuRTf7Im7jbIAMql56fmNTqQZmXM7aoRXe584zY7NK/1
   6BTxSoEzWO2SSLPDmCIhQlPVBloiN7qCexM60qM7njxvxTlZPKuprGUi+
   SIIVacIry7XEg2zPnvJjmSaTo8s11J4GfijT86n/Kvs1ZXbsWqUVUHg0P
   jxeDi3vEiJOL5lt6o6+CHmZuwCZjDLdl2kSPOO6ItZwDKAGVW8kjlgghK
   gwfT63lUm3T32kaMRcIbnpK1pCGbE7QeyHXfzrPJZYk3DBUOHIRbTZmX4
   g==;
X-CSE-ConnectionGUID: j4WYa8m3Qwy61BGsX/sgaA==
X-CSE-MsgGUID: +6a6oTK9Sk+oaRtPZjOGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100778666"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100778666"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:11:15 -0700
X-CSE-ConnectionGUID: ByUsdnk5Q0OeFNJYvizJXA==
X-CSE-MsgGUID: xjf8tyt3SqetcJRC6OpGFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228265421"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2026 18:11:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qIY-000000006lN-30kW;
	Tue, 24 Mar 2026 01:11:10 +0000
Date: Tue, 24 Mar 2026 02:10:46 +0100
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/strncpy 11/11]
 drivers/misc/lkdtm/fortify.c:28:9: warning: incompatible implicit declaration
 of built-in function 'strncpy'
Message-ID: <202603240259.tUb5PplF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/strncpy
head:   da9b6bdc716b766da262998c114c86ebb1b96d43
commit: da9b6bdc716b766da262998c114c86ebb1b96d43 [11/11] string: Remove strncpy() from the kernel
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260324/202603240259.tUb5PplF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240259.tUb5PplF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240259.tUb5PplF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/lkdtm/fortify.c: In function 'lkdtm_FORTIFY_STR_OBJECT':
   drivers/misc/lkdtm/fortify.c:28:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
      28 |         strncpy(target[0].a, target[1].a, size);
         |         ^~~~~~~
   drivers/misc/lkdtm/fortify.c:10:1: note: include '<string.h>' or provide a declaration of 'strncpy'
       9 | #include <linux/slab.h>
     +++ |+#include <string.h>
      10 | 
>> drivers/misc/lkdtm/fortify.c:28:9: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
      28 |         strncpy(target[0].a, target[1].a, size);
         |         ^~~~~~~
   drivers/misc/lkdtm/fortify.c:28:9: note: include '<string.h>' or provide a declaration of 'strncpy'
   drivers/misc/lkdtm/fortify.c: In function 'lkdtm_FORTIFY_STR_MEMBER':
   drivers/misc/lkdtm/fortify.c:60:9: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
      60 |         strncpy(target.a, src, size);
         |         ^~~~~~~
   drivers/misc/lkdtm/fortify.c:60:9: note: include '<string.h>' or provide a declaration of 'strncpy'


vim +/strncpy +28 drivers/misc/lkdtm/fortify.c

fe8e353bfda6d6c Kees Cook 2021-08-18  12  
325bf6d84bad3fc Kees Cook 2022-08-31  13  static void lkdtm_FORTIFY_STR_OBJECT(void)
fe8e353bfda6d6c Kees Cook 2021-08-18  14  {
fe8e353bfda6d6c Kees Cook 2021-08-18  15  	struct target {
fe8e353bfda6d6c Kees Cook 2021-08-18  16  		char a[10];
325bf6d84bad3fc Kees Cook 2022-08-31  17  		int foo;
325bf6d84bad3fc Kees Cook 2022-08-31  18  	} target[3] = {};
fe8e353bfda6d6c Kees Cook 2021-08-18  19  	/*
fe8e353bfda6d6c Kees Cook 2021-08-18  20  	 * Using volatile prevents the compiler from determining the value of
fe8e353bfda6d6c Kees Cook 2021-08-18  21  	 * 'size' at compile time. Without that, we would get a compile error
fe8e353bfda6d6c Kees Cook 2021-08-18  22  	 * rather than a runtime error.
fe8e353bfda6d6c Kees Cook 2021-08-18  23  	 */
325bf6d84bad3fc Kees Cook 2022-08-31  24  	volatile int size = 20;
325bf6d84bad3fc Kees Cook 2022-08-31  25  
325bf6d84bad3fc Kees Cook 2022-08-31  26  	pr_info("trying to strcmp() past the end of a struct\n");
fe8e353bfda6d6c Kees Cook 2021-08-18  27  
325bf6d84bad3fc Kees Cook 2022-08-31 @28  	strncpy(target[0].a, target[1].a, size);
fe8e353bfda6d6c Kees Cook 2021-08-18  29  
fe8e353bfda6d6c Kees Cook 2021-08-18  30  	/* Store result to global to prevent the code from being eliminated */
325bf6d84bad3fc Kees Cook 2022-08-31  31  	fortify_scratch_space = target[0].a[3];
fe8e353bfda6d6c Kees Cook 2021-08-18  32  
325bf6d84bad3fc Kees Cook 2022-08-31  33  	pr_err("FAIL: fortify did not block a strncpy() object write overflow!\n");
fe8e353bfda6d6c Kees Cook 2021-08-18  34  	pr_expected_config(CONFIG_FORTIFY_SOURCE);
fe8e353bfda6d6c Kees Cook 2021-08-18  35  }
fe8e353bfda6d6c Kees Cook 2021-08-18  36  

:::::: The code at line 28 was first introduced by commit
:::::: 325bf6d84bad3fc641b94fad6e69c70e960fdf2e lkdtm: Update tests for memcpy() run-time warnings

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
