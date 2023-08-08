Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADBB1FA6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Aug 2023 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691518627; x=1723054627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flMafUjTyU5yXKNmXWIGK7FrxTXz4Y6KtIbvu0/ouWE=;
  b=dJmENWvPqhhXJnlutEA5O24hSikfpcekxWXMDib6Og3RJzT5eC1OZziP
   fqeOTo03VnY19TU+ZdqdcnlWasAO3PXxD9ZWKwolLRGKQ3pXMVamp2qhi
   RfyyfTaKMk9t2ydUYTb8VEVT9H7JL7rC9IJtiRE8lSpi/NB5eOT0tDAyp
   ytgeIEUQxVZivzqUdRKiApGWyqCedYYy8dz/XLCxZy8wQW0S6xq7dwAAd
   amDniR5SOo/URCN+4A+5TLvzdzWiVYOaI+nE0WnROQSvrK14upUp5eiSA
   8aBzv+pLqpqy4N3lTlCenKUwtKFHY7CPTKKL4QbdHNLEwJzPFQQ+pjZPC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437268087"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="437268087"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 10:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681337069"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="681337069"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2023 10:42:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTQic-0005Vh-0C;
	Tue, 08 Aug 2023 17:42:06 +0000
Date: Wed, 9 Aug 2023 01:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 5/6]
 include/linux/ftrace.h:170:16: warning: return discards 'const' qualifier
 from pointer target type
Message-ID: <202308090117.NEtJ5g6O-lkp@intel.com>
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
config: csky-randconfig-r014-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090117.NEtJ5g6O-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090117.NEtJ5g6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090117.NEtJ5g6O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kprobes.h:28,
                    from kernel/rcu/update.c:42:
   include/linux/ftrace.h: In function 'ftrace_partial_regs':
>> include/linux/ftrace.h:170:16: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     170 |         return &(fregs)->regs;
         |                ^~~~~~~~~~~~~~


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
