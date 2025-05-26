Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75206382
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748270758; cv=none; b=Mf4R6YQOGu1LaOyt7JJVqPxvwgziAG1vePg6JTG9aEGckH8BJ6WCX2jZuWkcBhP5WUbS6bygHRpkUY3LYx/vgobUoJwt8oJtQjKulls/eyHlr1OkKSHlEJDl/MQApuIYhC3TRJfmnV4yBg6NYBUzlEYmrp2acZejEl9rKhm4DKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748270758; c=relaxed/simple;
	bh=3m32QyS2sSUYGKByHsK1Ib6QqfJOPa+PE+wKdmcqll0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUEKffp4RDV7vGUHJvO0HZxh6FU+nY7assoVtrpr0fGzEv2re4NhaB/FI/UT092L6A09WheKeN+aZraHdadNigNZMMl8inj48/wUSTWpnqzXUNt0/bL2KpsZbJzFmEN2ZuaEefcv9Vl8PsJGB5WO/swpvKAITAMWv4SzS9iKN2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1TqA2rq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1TqA2rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748270756; x=1779806756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3m32QyS2sSUYGKByHsK1Ib6QqfJOPa+PE+wKdmcqll0=;
  b=Y1TqA2rqiycRsMo5neFfQIcLLfhjc/yE/CIjZr6WVdLVWum61G/f7KHU
   v8zKUfH52ln2fapjyNuhV7zJD9FYn/1nJ5kN3l0epLZTrvpMRFjVzgjMc
   ym+dQiLqVVwtKLg/673U5K+Upfm30yFw4YRjo32S/xpB6Cr3ikoU5Nm3F
   XKBc8zgctHXq0lJRljMGvkeFTdDMeAfEinZKQOSDthEPBxIMpUS+1XoDK
   tgPtgTBAoxBSPeZXKOawSeiMEfibqXW+2+3mj+SLOUEeY0nfQQ+TnM8l4
   G7fTe1EyCphsmL4o8aLs4kITWaX+j2hTyQSBx+xY0GD+bZ60Dt5vHmFyA
   w==;
X-CSE-ConnectionGUID: FCKAdUexSuK+nwbL6nWOIQ==
X-CSE-MsgGUID: fvyNepNwTsaBR2VQihaQCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="50252304"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="50252304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 07:45:56 -0700
X-CSE-ConnectionGUID: astdOxIKRUOAm9DNRj1J7A==
X-CSE-MsgGUID: 02agZYlhQAKNWfsQATnj/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="165592513"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 May 2025 07:45:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJZ5N-000SUy-0I;
	Mon, 26 May 2025 14:45:53 +0000
Date: Mon, 26 May 2025 22:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 27/33] kernel/sched/smp.h:15:20: error:
 redefinition of 'flush_smp_call_function_queue'
Message-ID: <202505262213.QsOaQU24-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   2b91d36aa03a2762cec8e55d32b056b8af45b40f
commit: 46eabaafdbb12b6a81babc8be212f77860ab725c [27/33] sched: Make clangd usable
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250526/202505262213.QsOaQU24-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262213.QsOaQU24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505262213.QsOaQU24-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/idle.c:13,
                    from kernel/sched/build_policy.c:50:
>> kernel/sched/smp.h:15:20: error: redefinition of 'flush_smp_call_function_queue'
      15 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:42:
   kernel/sched/smp.h:15:20: note: previous definition of 'flush_smp_call_function_queue' with type 'void(void)'
      15 | static inline void flush_smp_call_function_queue(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_smp_call_function_queue +15 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  11  
d664e399128bd7 Thomas Gleixner 2022-04-13  12  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  13  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  14  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @15  static inline void flush_smp_call_function_queue(void) { }

:::::: The code at line 15 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
