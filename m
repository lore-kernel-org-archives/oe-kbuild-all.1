Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC3023CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760076298; cv=none; b=A1LkLEaHzXVJrMYGEzZ/Blt5IZQ6QkranGyFJrdrQOxq3X15L5J8AnhCYPJvcOZ4yZZucR+tWSKEvA2QxEsqA09lDI0O8wcQDt07yw46dDUPH2zOCrF1T2wxUxbLFqHQoGZP8OtPCuv9MA5VlRHMZkjNhD4TooI30JgbH7SmoOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760076298; c=relaxed/simple;
	bh=q7XlA/YYtI/VbBdQcyXsx2+JwK1YcfTAlGidp1cFxOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyCMPT7VW8sg636qoLT6Y7peaji7x6Eol4dqoEjy1kG6ael7fp478iXIpa9HuatMGRLRBjm4Pjfax8L3UEM+yQgUdIh+sqceK48q/1esIQ6D1+qZKUJ37Z8peox2foCW5mBNQ0A5bn+gj8OgocJ8tSf4s6rJAOBCrE54RlFrbT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahfWC4pr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahfWC4pr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760076296; x=1791612296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q7XlA/YYtI/VbBdQcyXsx2+JwK1YcfTAlGidp1cFxOY=;
  b=ahfWC4prriS7Wh/OE1U31O8cCtXR0bK5lws9uF+x4Y3KDiKE2QaDsG9S
   XwGbbP2ET4B+Y3gbVM8f8iHOa0cJm7eBkt/fL106pQ+G35OSf4296XsvR
   8VOGIWmbVrXe9LNGfvupV3eMLK9vLww+3KVxKky4gZZ6S5iaOShZIMgfa
   TkXUjZK4DihY/FEIXlQbbWzKhHCDSWFMXFEbdW/4hOG8RVWZzKiUBvskv
   cCZ5SKHKudzKJKU7dK2YCF9wiZRWZ/Bn6YBeRTVHe/er3Hx24IphLOCOY
   9nk62KlxwlFmKUkSD6Wh47rqdJZbitNJRh8ZG/4kWJ8EqI3OkSC++08N8
   A==;
X-CSE-ConnectionGUID: cPXNNyHETCqh7WoxMOao/g==
X-CSE-MsgGUID: BrVQiRjMSbivheJldjXlgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66149898"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="66149898"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 23:04:55 -0700
X-CSE-ConnectionGUID: o2G1HpudQa+S6VzWy+EARA==
X-CSE-MsgGUID: fPy2LZReQDuQ8t6P2e9seA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="204604866"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2025 23:04:54 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v76FI-0002LD-0o;
	Fri, 10 Oct 2025 06:04:52 +0000
Date: Fri, 10 Oct 2025 14:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.18-rc1-separate-dabt-codepath-syncstack4all
 12/13] arch/arm64/kernel/entry.S:702: Error: undefined symbol
 S_STACK_DABT_SP used as an immediate value
Message-ID: <202510101336.6SKKKxS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.18-rc1-separate-dabt-codepath-syncstack4all
head:   b1b798131387a63cead97374f3a68db539aa6709
commit: 7312a87be3da31a57f1d289b1564c6760545db30 [12/13] arm64: Support dynamic kernel stacks
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251010/202510101336.6SKKKxS5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101336.6SKKKxS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101336.6SKKKxS5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry.S: Assembler messages:
>> arch/arm64/kernel/entry.S:702: Error: undefined symbol S_STACK_DABT_SP used as an immediate value
   arch/arm64/kernel/entry.S:707: Error: undefined symbol S_STACK_DABT_SP used as an immediate value


vim +702 arch/arm64/kernel/entry.S

   661	
   662	
   663		.macro entry_handler el:req, ht:req, regsize:req, el1_sync:req, label:req
   664	SYM_CODE_START_LOCAL(el\el\ht\()_\regsize\()_\label)
   665		kernel_entry \el, \regsize, \el1_sync
   666		mov	x0, sp
   667		bl	el\el\ht\()_\regsize\()_\label\()_handler
   668		.if \el == 0
   669		b	ret_to_user
   670		.endif
   671	#ifdef CONFIG_DYNAMIC_STACK
   672		/*
   673		 * This .ifeqs with .if inside it looks a bit insane and this
   674		 * is because .ifeqs doesn't support nesting whatsoever: you
   675		 * can put .if:s inside an .ifeqs but you simply can't put an
   676		 * .ifeqs inside an .if and expect it to work, the result will
   677		 * be that the assembler inside an .ifeqs nested inside an .if
   678		 * will be evaluated if the .ifeqs evaluates to true no matter
   679		 * what the outer .if evaluates to.
   680		 *
   681		 * This is probably a bug in the GNU Assembler that I work
   682		 * around like this.
   683		*/
   684		.if \el != 0 && \el1_sync == 1
   685		b	ret_to_kernel_el1_sync
   686		.else
   687		.if \el != 0
   688		b	ret_to_kernel
   689		.endif
   690		.endif
   691	#else
   692		.if \el != 0
   693		b	ret_to_kernel
   694		.endif
   695	#endif
   696	SYM_CODE_END(el\el\ht\()_\regsize\()_\label)
   697		.endm
   698	
   699	/*
   700	 * Early exception handlers
   701	 */
 > 702		entry_handler	1, t, 64, 1, sync
   703		entry_handler	1, t, 64, 0, irq
   704		entry_handler	1, t, 64, 0, fiq
   705		entry_handler	1, t, 64, 0, error
   706	
   707		entry_handler	1, h, 64, 1, sync
   708		entry_handler	1, h, 64, 0, irq
   709		entry_handler	1, h, 64, 0, fiq
   710		entry_handler	1, h, 64, 0, error
   711	
   712		entry_handler	0, t, 64, 0, sync
   713		entry_handler	0, t, 64, 0, irq
   714		entry_handler	0, t, 64, 0, fiq
   715		entry_handler	0, t, 64, 0, error
   716	
   717		entry_handler	0, t, 32, 0, sync
   718		entry_handler	0, t, 32, 0, irq
   719		entry_handler	0, t, 32, 0, fiq
   720		entry_handler	0, t, 32, 0, error
   721	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
