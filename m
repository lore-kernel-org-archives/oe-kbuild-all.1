Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C2C433AE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712230313; cv=none; b=e5L8g0iPKRYvYjL2MM2xctLJ3Sie+xkoMUr8ovpJhf8NqvXtp8DiJUJYmHdLS8Z8Hgmty+CAubjcMgmDpzDvjhAhZXohxzZU6iMoWfM87xIiW16DYeBOyzIH6ycbnI5YTbCZjUHX+EnodC6AazZtin1VulaJzmPc6hzQAgyNRlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712230313; c=relaxed/simple;
	bh=/geTPgO3JVDCNgwqzTeB2Eb4euONSV8TSZbUizZblBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BiU7HGRyDFAJVTXQgSLWaYckzRGreV/doOb80Yj9ZgROtJPwncaF+KAEN7Jzug/F4hXRaovm50+RlMYNBScBBoMnj8iRJdTLi0W9L5X0XfYKGIF68dUN64q1hKDDD8c7+PZ5cQI/6tVBeSJYVqVt3AdsfpBmr2vQ1P5VN2kteXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYCpxbqc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYCpxbqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712230311; x=1743766311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/geTPgO3JVDCNgwqzTeB2Eb4euONSV8TSZbUizZblBg=;
  b=JYCpxbqcZE7jpHTfz2qPDFLaQiwsRrq91thuaH0GE/FHZMoPOXYDhRNK
   dR2Vd7y9sgA5dop1uejqonMD+5Qmiqd792yQ1Rp02uYXDU2q9VFgTRNiA
   DP3oaOJQRdx/ZhH/IU9PaTVgjmZM4x+wX1Co2oVhTlVEqkQO7RNGDrTNf
   +F0LZ2+n+clCpDSpgOAb4dsTxG0KkoBjp9utX15MwUUyn4rucnvLTQkt4
   qhzmP7qDJ2b0lgLcDvTQRTMoh2DiHJg1YzZKk57YEplyxr4OgTKWEx+Vt
   4m3uOvXMnLn2fr5LxJhDz+fOWDaPRdjW34NbAy0mPmThzxe4bHebGscy2
   g==;
X-CSE-ConnectionGUID: 3rO+tgHYRB+DknM9U1AGMw==
X-CSE-MsgGUID: mCCDWeEyRQKTurYkY5M6TQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7692713"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7692713"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 04:31:48 -0700
X-CSE-ConnectionGUID: G7Jv8Ic5TuCwNqTKzvz9/g==
X-CSE-MsgGUID: PgFyR56uQjOMRsPEvSjSJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23408532"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2024 04:31:47 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsLJo-0000zc-1d;
	Thu, 04 Apr 2024 11:31:44 +0000
Date: Thu, 4 Apr 2024 19:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dan Schatzberg <schatzberg.dan@gmail.com>
Subject: [akpm-mm:mm-unstable 300/300] include/linux/mmdebug.h:114:35: error:
 expected expression before 'do'
Message-ID: <202404041924.UiccBz3l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   e04f729678f630b7304f9a8d5d22819fe589681a
commit: e04f729678f630b7304f9a8d5d22819fe589681a [300/300] __mod_memcg_lruvec_state(): enhance diagnostics
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240404/202404041924.UiccBz3l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041924.UiccBz3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041924.UiccBz3l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/memory.h:213,
                    from arch/arm64/include/asm/page.h:46,
                    from include/linux/page_counter.h:8,
                    from mm/memcontrol.c:28:
   mm/memcontrol.c: In function '__mod_memcg_lruvec_state':
>> include/linux/mmdebug.h:114:35: error: expected expression before 'do'
     114 | #define VM_WARN_ON_IRQS_ENABLED() do { } while (0)
         |                                   ^~
   mm/memcontrol.c:867:29: note: in expansion of macro 'VM_WARN_ON_IRQS_ENABLED'
     867 |                         if (VM_WARN_ON_IRQS_ENABLED())
         |                             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/do +114 include/linux/mmdebug.h

59ea746337c69f Jiri Slaby      2008-06-12  110  
a738e9bad6030d Thomas Gleixner 2022-08-25  111  #ifdef CONFIG_DEBUG_VM_IRQSOFF
a738e9bad6030d Thomas Gleixner 2022-08-25  112  #define VM_WARN_ON_IRQS_ENABLED() WARN_ON_ONCE(!irqs_disabled())
a738e9bad6030d Thomas Gleixner 2022-08-25  113  #else
a738e9bad6030d Thomas Gleixner 2022-08-25 @114  #define VM_WARN_ON_IRQS_ENABLED() do { } while (0)
a738e9bad6030d Thomas Gleixner 2022-08-25  115  #endif
a738e9bad6030d Thomas Gleixner 2022-08-25  116  

:::::: The code at line 114 was first introduced by commit
:::::: a738e9bad6030d4fd33bfd7db3399a250b7e94d8 mm/debug: Provide VM_WARN_ON_IRQS_ENABLED()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
