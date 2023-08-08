Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972161FA6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691519060; x=1723055060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b5xSZehLcPdkp4w91JS4pWViYz36STy/UUtNyvEtdgI=;
  b=JodsKrUBUh/b8br//+3xcLozh1mQ+L+AcWxoyYaNTOVHhNaUq81gsYIW
   7+H2cfvqySJpslqQxMo1PVCPBUfg2y6hAouG5wSYJG10WEE9pdHU0h6nR
   WI3fx7lFqOemsx89PQohGrTUZMReSXWzAwrt8uoApgceOx/G1gDouB0YT
   GZpI4WQL8euzwlxpjRZEnAusOdFBAN2JlZ6eaW1pKgH5MZ19WJD+5Htst
   FaKhnvEZvC5sohCiLsp0ObyyJG4M4kvK03zpWqKm1VmhR/kGCHDIqRuCa
   VXb9N6zBxXdCYR1fks7CAftlbm9u0gAr5tiGoWdQiWVINn9BS6+XyJ8uT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368368354"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="368368354"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 11:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="761018582"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="761018582"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Aug 2023 11:24:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTRNG-0005Wm-2X;
	Tue, 08 Aug 2023 18:24:06 +0000
Date: Wed, 9 Aug 2023 02:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 5/6]
 include/linux/ftrace.h:170:16: error: return discards 'const' qualifier from
 pointer target type
Message-ID: <202308090201.qm8x5aLD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   ba5cbecb5fc57de2c5b0ef732958cdefbaf1a541
commit: e39d6ccc265879a318500a4332c9b7e6d4e0c14c [5/6] ftrace: Add ftrace_partial_regs() for converting ftrace_regs to pt_regs
config: alpha-randconfig-r024-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090201.qm8x5aLD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090201.qm8x5aLD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090201.qm8x5aLD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:52,
                    from arch/alpha/mm/fault.c:28:
   include/linux/ftrace.h: In function 'ftrace_partial_regs':
>> include/linux/ftrace.h:170:16: error: return discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
     170 |         return &(fregs)->regs;
         |                ^~~~~~~~~~~~~~
   arch/alpha/mm/fault.c: At top level:
   arch/alpha/mm/fault.c:85:1: error: no previous prototype for 'do_page_fault' [-Werror=missing-prototypes]
      85 | do_page_fault(unsigned long address, unsigned long mmcsr,
         | ^~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/const +170 include/linux/ftrace.h

   157	
   158	#if !defined(CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS) || \
   159		defined(CONFIG_HAVE_PT_REGS_COMPAT_FTRACE_REGS)
   160	
   161	static __always_inline struct pt_regs *
   162	ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
   163	{
   164		/*
   165		 * If CONFIG_HAVE_PT_REGS_COMPAT_FTRACE_REGS=y, ftrace_regs includes
   166		 * pt_regs as ftrace_regs::regs, so always returns that address.
   167		 * Since arch_ftrace_get_regs() will check some members and may return
   168		 * NULL, we can not use it.
   169		 */
 > 170		return &(fregs)->regs;
   171	}
   172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
