Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741BB107A4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1ZCAD1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697991361; x=1729527361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hBxIdq0OXJjzxIPXmxM5jMWLtzLGQiIgxB2dYrQz4Ag=;
  b=H1ZCAD1FrBLk9JZa8YQRfXcU8OwPYxgWi6+FUPBer96nHLMB8DSaEFeO
   0Bv+R+QH3EASo2vxK6k5MFbReyB3kbfptU2UKtTqPGmt12hfKwi3t1GEk
   VgaFGvsRHBfA0Qe4Lc7fX2PME6fmRXWGqC5ZkjCKNQ7yUHMUKgVrXgQjv
   oGW+pCYGWpMgZ5lrgb1W6XZtJtG589jpQckHPVue/KCYi8TY4X29HY6Ci
   FVbHlibE0mEc6KFCIKZJAiP5YezmU7idoPzX+Miawu6Jis5XwnPHUJIUS
   SR8PvBVxNBDGip7Gplu5RR/lW+o9/KanCV4Tf/jqkCNSQLvcf0ojDTL3H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="453186712"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="453186712"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 09:16:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="734432085"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="734432085"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Oct 2023 09:16:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qub7N-00065C-2f;
	Sun, 22 Oct 2023 16:15:57 +0000
Date: Mon, 23 Oct 2023 00:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fgraph-multi 5/15] checkpatch: WARNING: void
 function return statements are not generally useful
Message-ID: <202310230051.0jAAjvB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fgraph-multi
head:   7b4f1147ab12cc7de50a7a15d6a818b02a0e4fa2
commit: 9be6c839c22097d9d2d9a922f6d4e128d0e7bb9e [5/15] function_graph: Remove logic around ftrace_graph_entry and return
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230051.0jAAjvB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230051.0jAAjvB9-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:RETURN_VOID: void function return statements are not generally useful
#48: FILE: kernel/trace/fgraph.c:141:
+	return;
+}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
