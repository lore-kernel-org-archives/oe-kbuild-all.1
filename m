Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFCC30D1A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 22:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjUoHgkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697496475; x=1729032475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XtTY2tYuhb35QgkPTy4eg1qWPXBHCC8ZVZmw9ybVfeA=;
  b=PjUoHgkZzZZGpLqqGuvg7o7lpLSY3XmFiGn1PEvneun79g+Cjk89LGXo
   WZuHta6Y3MsLBNhog3I72lYtRLrn9mIgiRW00YQr9aEPzKij/iFlct5up
   Ma/FHIBJU/erxKxHdYGK+RqjtNw0ppD+sIHeJmvR1n7HqjLdqav8CJzgt
   Y7hcE8TdM21ohTGVvodvyAiNIkMTwvPbe2LqzONLoFs0erDduBA3er8or
   B0V9+OSi5KT+ANz6eJ7F4zzKyaD6NN31kUr8PAjv46agSbJV4EJ+UUcvD
   rUWa8BUKh1CcjuYUdolsM/S7eJCZVSXpiCMh/86mTLDMO1kWS0M+mE2qF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="388513836"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="388513836"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 15:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="785258040"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="785258040"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Oct 2023 15:47:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsWNL-0008jR-00;
	Mon, 16 Oct 2023 22:47:51 +0000
Date: Tue, 17 Oct 2023 06:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [mhiramat:topic/fgraph-multi 7/15] undefined reference to
 `set_graph_array'
Message-ID: <202310170619.ug3nIPmj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fgraph-multi
head:   f89a72328944cb3136c9c44850970a9c8cc7021a
commit: 609ee1ee2fbebb5bfce91d2a8157ae269f49b3f4 [7/15] ftrace: Allow function_graph tracer to be enabled in instances
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310170619.ug3nIPmj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170619.ug3nIPmj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170619.ug3nIPmj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `trace_selftest_startup_function_graph':
>> (.init.text+0x11d279): undefined reference to `set_graph_array'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
