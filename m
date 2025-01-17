Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB0A25A626
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737091915; cv=none; b=SMxNmqMH7PIgc+PQe1TqB9qIlqmzQSA/Ggjkl60PpUnOQW6CHANHFcXPSDjLTBMydV6OI2spxhs27w6a7kEm7CdW/Zn8dnZuYLUVgEx4sQ4+lV6VuCPopfKyknrJxqWqBrUtoUS4KmmVpRUJKwbbb17GA+eOMYRTT9TFs9f/FO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737091915; c=relaxed/simple;
	bh=3aHuRSeAQMA/XCNKVnQmLjn5xWamNMKNkzKwZPhqwZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cb5gAyubU7YffuvH0GKQG0AO8iWZuPngwQzxzA2V+/lhTQYtZnhGPaafNyv4fhBhzPEQD8vgNkOzPOafaj7Xh7x1FOeeChomloJIz85ei1fNzi/DL6j2Pd5oYs8aZDfEOT/pdob5sTsE89/g6tiAw/F94eiYOYy12xJBUVJoxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6LtuElb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6LtuElb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737091913; x=1768627913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3aHuRSeAQMA/XCNKVnQmLjn5xWamNMKNkzKwZPhqwZQ=;
  b=f6LtuElb9MazZlXS6BbIC8rAbZwCp24G3v+hwy1P52r51Z4iNTC70OMP
   EiXVkOJlbgrEGTwLPIjcA/7D2UqPYqhns/t54tBg3zbkUAZkoJLOqZlM2
   X1N/zhXRe9g8MSrfFjHf0f34G/5xps5gJWBaQni1l0KsuGJHjkLzS9ltE
   10A2rgGZ3I17VJ+Q3x7o53u0clmKZlTYKJ7rT06E/0HuD4F5+UZ9dtGzd
   /PHyLTasEFdfZ7ydQdxxQKQOqDRdexov0zyqE8+nG9uvqFJilQfGsMe3V
   uUmmbyR8rSkl7y2+4e7mAx4ccd32hAcULMTho/rpc12irMhuDC/acfkSs
   g==;
X-CSE-ConnectionGUID: LYcX07UCQr+WDEKAHSbK9w==
X-CSE-MsgGUID: e9xhLtosRpq3WJrhAs6Mcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="40322983"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="40322983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 21:31:53 -0800
X-CSE-ConnectionGUID: AedmW9y5Qe6WKDgsuP/Iaw==
X-CSE-MsgGUID: lrhMVfsaR2KI2gn1TShkWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110818135"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2025 21:31:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYexR-000SoF-29;
	Fri, 17 Jan 2025 05:31:49 +0000
Date: Fri, 17 Jan 2025 13:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 27/36] include/linux/entry-common.h:366:9: error:
 implicit declaration of function 'unwind_exit_to_user_mode'; did you mean
 'arch_exit_to_user_mode'?
Message-ID: <202501171325.sGMekuaZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   dc92bc7c1009e5d80cd83d21ead7228bc6887c23
commit: 0b9c279e2f1ea50bbb9d78c3a3744e2d4df4a441 [27/36] unwind: Add deferred userspace unwinding API
config: i386-buildonly-randconfig-004-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171325.sGMekuaZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171325.sGMekuaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171325.sGMekuaZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/entry-common.h:15,
                    from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/include/asm/traps.h:9,
                    from arch/x86/kernel/traps.c:53:
>> include/linux/unwind_deferred.h:49:6: warning: no previous prototype for 'unwind_deferred_cancel' [-Wmissing-prototypes]
      49 | bool unwind_deferred_cancel(struct task_struct *task, struct unwind_work *work) { return false; }
         |      ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/entry-common.h: In function 'exit_to_user_mode':
>> include/linux/entry-common.h:366:9: error: implicit declaration of function 'unwind_exit_to_user_mode'; did you mean 'arch_exit_to_user_mode'? [-Werror=implicit-function-declaration]
     366 |         unwind_exit_to_user_mode();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         arch_exit_to_user_mode
   cc1: some warnings being treated as errors


vim +366 include/linux/entry-common.h

   340	
   341	/**
   342	 * exit_to_user_mode - Fixup state when exiting to user mode
   343	 *
   344	 * Syscall/interrupt exit enables interrupts, but the kernel state is
   345	 * interrupts disabled when this is invoked. Also tell RCU about it.
   346	 *
   347	 * 1) Trace interrupts on state
   348	 * 2) Invoke context tracking if enabled to adjust RCU state
   349	 * 3) Invoke architecture specific last minute exit code, e.g. speculation
   350	 *    mitigations, etc.: arch_exit_to_user_mode()
   351	 * 4) Tell lockdep that interrupts are enabled
   352	 *
   353	 * Invoked from architecture specific code when syscall_exit_to_user_mode()
   354	 * is not suitable as the last step before returning to userspace. Must be
   355	 * invoked with interrupts disabled and the caller must be
   356	 * non-instrumentable.
   357	 * The caller has to invoke syscall_exit_to_user_mode_work() before this.
   358	 */
   359	static __always_inline void exit_to_user_mode(void)
   360	{
   361		instrumentation_begin();
   362		trace_hardirqs_on_prepare();
   363		lockdep_hardirqs_on_prepare();
   364		instrumentation_end();
   365	
 > 366		unwind_exit_to_user_mode();
   367		user_enter_irqoff();
   368		arch_exit_to_user_mode();
   369		lockdep_hardirqs_on(CALLER_ADDR0);
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
