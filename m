Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9361E323B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwFWnJJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699339474; x=1730875474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FdbIUQZFHI8xlm1Zomrx1DTQw5cc5Kn8bNCFtY+5Ry0=;
  b=JwFWnJJfGcYzk466lV1jlDovtpj7yEy0522Nrjmy7F07o1I/j2UgSPN8
   e62XW0/p+O6x1t9T+w2OWeooreccksUFUMpqD8R9P6aSZ381HLDW62oJl
   DnIhakyMu1uNyKbtuOwNr6IvD+WhqQSHVSMDcljCMhSidLU+Wh08Mi7Iz
   MRrSqVFrfrFsXPXaOVO7iQrposeJPdV3YEhPr8C6Vb65KJvm4Ru7g5XNq
   xIcKuoBrzWu2rpefHB/VdJ46L4w2pPm8QxFrcpY3+Ts90VZHEwHkpmT1z
   MS0bBCnXOdJXWteKT/cdfzNlTQUj5ubRBNNzyQWtMt6+AjFNofj7+EN14
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379833880"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="379833880"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 22:44:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="712465370"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="712465370"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2023 22:44:27 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Fp2-0006y8-08;
	Tue, 07 Nov 2023 06:44:24 +0000
Date: Tue, 7 Nov 2023 14:43:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [mhiramat:topic/fprobe-on-fgraph 11/35] trace.c:undefined reference
 to `set_graph_array'
Message-ID: <202311071409.dDQns61O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   7db6d2fcd150e3e6fca2c26833f7d09663cbf033
commit: 4fc23d473abefc46456cdfca39394d821acc74df [11/35] ftrace: Allow function_graph tracer to be enabled in instances
config: s390-randconfig-002-20231106 (https://download.01.org/0day-ci/archive/20231107/202311071409.dDQns61O-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311071409.dDQns61O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311071409.dDQns61O-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/trace/trace.o: in function `trace_selftest_startup_function_graph':
>> trace.c:(.init.text+0x249e): undefined reference to `set_graph_array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
