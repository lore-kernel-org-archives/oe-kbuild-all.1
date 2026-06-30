Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48933D6F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jun 2026 23:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782863261; cv=none; b=rMlm1gJqd7Z5cL3+LgSkmC0VAJN9F+uL+1iHgV5Yho21F6fcJErlsssKorXjSA6eTXlZDqr3LZHGcTPyXZmAQqZMCoGc5qZKLlCFRoDczZDgdALCpo/OvOXP1ZnUO8VC4o7jT4RsnSYstO0M3U1ACYv9+NnHMk/Hz3rOdekUbt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782863261; c=relaxed/simple;
	bh=kY5Su51yGOOCCwEd5+XMdALl4PrabsHEGv7xXEqHIC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DSMIeJlkYogpF7I99+eetq1q0y66AIAQAx7hK1uR91Ob43h2If62jML6Wj5r6KzQ+jR46rYW0A+aNxywsroZISUFvajs5SXo+K0qccy6XuC5zA4ssKVgWgxUaL35Wdbtc1YIeoPmUP1mDhLQhdoI2CHe6fHUHUjJYsafoTd/aHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6IyMVjh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6IyMVjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782863260; x=1814399260;
  h=date:from:to:cc:subject:message-id;
  bh=kY5Su51yGOOCCwEd5+XMdALl4PrabsHEGv7xXEqHIC8=;
  b=J6IyMVjhW/9s1vR4zvhFmv4FiAV0vYwRePhoWPpgeLGVekuplVMyqsDM
   EI30N7a1M6trdfwyle0yeXRai0yDY19A3ynOdyzOaCvJNb3ymNr8K4FMu
   7Ype+DI+tElIfkAAPKTGSkwD5/1lQgeuCEwbrEJHRvk7xtGmnh2liqgzZ
   7V7F9dM60lVLADNgRffWeiMeDGMJ6Dr1ytkooPEqwvhADGgkjWZ8h/NZE
   bgXf/0K9BVA5QPJfYKbsw+hvCGUp8rrB6eyR525mkEyJawS6DX2aNn1Cp
   AGU2dVigLgHBCvDgKFKhQLsUizZK0InbhT7git/dLtmvB1OzA9SOaH8W+
   w==;
X-CSE-ConnectionGUID: YBDNS2kvT1q+8iKs58Qwww==
X-CSE-MsgGUID: DQEMRuodTAG96qhFHe/vEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="95089439"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="95089439"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 16:47:39 -0700
X-CSE-ConnectionGUID: p+tyDLgQQ+68udnAbq0uqg==
X-CSE-MsgGUID: sYz95I3QSfy+KlNKvhM+QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="251348121"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2026 16:47:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weiAx-000000008lX-1Kig;
	Tue, 30 Jun 2026 23:47:35 +0000
Date: Wed, 01 Jul 2026 07:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:sdei-nmi/diag-complete-off 5/5]
 include/linux/arm_sdei.h:16:50: error: expected identifier or '(' before
 numeric constant
Message-ID: <202607010736.PcknyXds-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git sdei-nmi/diag-complete-off
head:   9c7998bb7f7765535361c4ac0087f1401b3eecd4
commit: 9c7998bb7f7765535361c4ac0087f1401b3eecd4 [5/5] arm64/sdei: DIAG complete-then-CPU_OFF for the SDEI stop (Grace re-online test)
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260701/202607010736.PcknyXds-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010736.PcknyXds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010736.PcknyXds-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:10:
>> include/linux/arm_sdei.h:16:50: error: expected identifier or '(' before numeric constant
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |                                                  ^
   arch/arm64/include/asm/sdei.h:56:15: note: in expansion of macro 'sdei_arch_get_entry_point'
      56 | unsigned long sdei_arch_get_entry_point(int conduit);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kernel/smp.c:11:
>> arch/arm64/include/asm/sdei.h:57:9: warning: 'sdei_arch_get_entry_point' redefined
      57 | #define sdei_arch_get_entry_point(x)    sdei_arch_get_entry_point(x)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/arm_sdei.h:16:9: note: this is the location of the previous definition
      16 | #define sdei_arch_get_entry_point(conduit)      (0)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +16 include/linux/arm_sdei.h

ad6eb31ef903559 James Morse 2018-01-08  13  
ad6eb31ef903559 James Morse 2018-01-08  14  /* Arch code should override this to set the entry point from firmware... */
ad6eb31ef903559 James Morse 2018-01-08  15  #ifndef sdei_arch_get_entry_point
ad6eb31ef903559 James Morse 2018-01-08 @16  #define sdei_arch_get_entry_point(conduit)	(0)
ad6eb31ef903559 James Morse 2018-01-08  17  #endif
ad6eb31ef903559 James Morse 2018-01-08  18  

:::::: The code at line 16 was first introduced by commit
:::::: ad6eb31ef90355993eb55ff77e0e855ae7d91e4c firmware: arm_sdei: Add driver for Software Delegated Exceptions

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
