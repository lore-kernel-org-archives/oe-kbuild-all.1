Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F3B19C54E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 18:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865340; cv=none; b=MKQyehZZZNOAshbu5WRnu+UhPpsGoUaa3pTjrzO+rZ5/cGYpoMIVhbjN3LyjuCDRjzeSPpfscMB68P9FQfFFkXUWv77QLv9Jb9Hb+6NvVqbvXONK6GJgKITl/CLBkKGQRJMHjaoB+24DsIRNPn6NB2YuHj8QWav1+Rtg6AJmT1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865340; c=relaxed/simple;
	bh=6j0w1BMrWWTUFa9khUK2qGsKfis+GYREzOAa6CmJPZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAS/BeKnEfmmunQCwmP/liCm8wNCl5IQ2H7r7oV2k3HpJjBPCB6PnBiaYAT5yZvIx9XjHoaMBX68Zi6BBY4vt0uQYNuhZeXSxeG//F3W7soqNU++xalc40PhkmxYvdAbp1B7vggljSZ1wTzYUftMpesAa5vVoEUXklsyDrgPIxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfqsu/7w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfqsu/7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738865338; x=1770401338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6j0w1BMrWWTUFa9khUK2qGsKfis+GYREzOAa6CmJPZ8=;
  b=dfqsu/7wJXbh91yDduz9Fdv8tUwW078P/cUPaqmIbFEn3K+PDAkwjVVu
   q4j8MY3tbmO1hImNmV0k/6xaMZfhewxKM0CblPI9ei/9+2RgS8+C9fwE6
   7ZSmVV70wia58MwVBP3f9uadg+yXH4vtvcr1AT2gy6IodNmB2RPFiBmnC
   tmtI+oDKe6EAwu5cCq6b9+thueQNTJlUuAzmKDTkPnb0/ZTri3FcAYWBV
   L2qNHaN9Ec/H0wgTRXTVTi0djUsoeh6suhYY3a+aEz2USWcrA01qb+gDz
   u/uviY3bwCG/QgAYqK97ZOS4hZNXhjg3/L0myys3RbhIGNsL44DSgSTS0
   g==;
X-CSE-ConnectionGUID: LzDC2+1ZTye9c65bNwgrUA==
X-CSE-MsgGUID: bQKs0JNqSHa0T6hRwiYoAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39379679"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39379679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:08:57 -0800
X-CSE-ConnectionGUID: WonwUUsMTR+ntd6CnQgacQ==
X-CSE-MsgGUID: hBBzBT4CSpOLHl132p5BPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148501156"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2025 10:08:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg6J4-000xBE-0N;
	Thu, 06 Feb 2025 18:08:54 +0000
Date: Fri, 7 Feb 2025 02:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 4/9] include/linux/objtool.h:150:82: error:
 expected string literal before ')' token
Message-ID: <202502070103.TiolOJ8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   57750f0464beab3927ad570e0c1b5e78c91dd1b6
commit: 924aacc059c21eca82763d733be6cce475b5d14d [4/9] x86/boot: Mark start_secondary() with __noendbr
config: i386-buildonly-randconfig-003-20250207 (https://download.01.org/0day-ci/archive/20250207/202502070103.TiolOJ8S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070103.TiolOJ8S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070103.TiolOJ8S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/alternative.h:7,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/smp.h:12,
                    from arch/x86/kernel/smpboot.c:43:
>> include/linux/objtool.h:150:82: error: expected string literal before ')' token
     150 | #define ANNOTATE_NOENDBR_SYM(sym)       asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
         |                                                                                  ^
   arch/x86/kernel/smpboot.c:317:1: note: in expansion of macro 'ANNOTATE_NOENDBR_SYM'
     317 | ANNOTATE_NOENDBR_SYM(start_secondary);
         | ^~~~~~~~~~~~~~~~~~~~


vim +150 include/linux/objtool.h

   143	
   144	#ifndef __ASSEMBLY__
   145	/*
   146	 * Annotate away the various 'relocation to !ENDBR` complaints; knowing that
   147	 * these relocations will never be used for indirect calls.
   148	 */
   149	#define ANNOTATE_NOENDBR		ASM_ANNOTATE(ANNOTYPE_NOENDBR)
 > 150	#define ANNOTATE_NOENDBR_SYM(sym)	asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOENDBR))
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
