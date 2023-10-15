Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0325079F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvZJKsgP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697386703; x=1728922703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1H9x1rtyJGq9i+8jKZWYydi1o3XreHaje5III2UfEUE=;
  b=VvZJKsgP8ZKLxaPSzTuy0J01aqZuqspJW+eB1NMKwbuPcJmok9FXWJhP
   1C7si5LT+Hn3fkcLO2N1d0mrrZT8YbCO0rb9Zy3mX50eRtJ2F8ffjKY6r
   NKLgk7xfCQYqs+0Edh7jtPsozskmUk2d9m55Hf30qTAbz9b4o1sqYq80D
   cd8DgFDWhGaAHyXWv9SR2gq5AcmiUv+oTuFAqbk/4Fby9E+n1ArYh0S4G
   ybntLBGBlcEJWoukceR4djwkwUD//tVWGPd/A3vGwKV9zTreh6ORPnnKw
   bvyFJWNnSrO9szrNHQ2cVxQILYl66eQm5YlrCuf1CIcvREn0fYG2kjYEC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389261368"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389261368"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 09:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825712710"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="825712710"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 09:18:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs3op-0007YZ-0f;
	Sun, 15 Oct 2023 16:18:19 +0000
Date: Mon, 16 Oct 2023 00:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fgraph-multi 6/15] checkpatch: WARNING: externs
 should be avoided in .c files
Message-ID: <202310160058.mY0zNer1-lkp@intel.com>
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
commit: 724d68496733c6dfd1e888d1af2e5c3a95e929c2 [6/15] ftrace/function_graph: Pass fgraph_ops to function graph callbacks
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160058.mY0zNer1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160058.mY0zNer1-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#107: FILE: kernel/trace/fgraph.c:680:
+extern void ftrace_stub_graph(struct ftrace_graph_ret *,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
